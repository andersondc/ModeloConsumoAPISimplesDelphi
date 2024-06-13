//
//  Exemplo de Consumo de API Simples com Delphi
//

unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  System.JSON, REST.JSON, System.Net.URLClient, System.Net.HttpClient,
  System.Net.HttpClientComponent, Vcl.OleCtrls, SHDocVw;

type
  TfrmPrincipal = class(TForm)
    pnlTopo: TPanel;
    pnlRodaPe: TPanel;
    pnlPrincipal: TPanel;
    Grid: TStringGrid;
    Button1: TButton;
    Browser: TWebBrowser;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure GridClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ConsumoAPI;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  // Ajusta o String Grid para inserir os Dados da API
  Grid.ColCount := 5;
  Grid.RowCount := 1;

  Grid.Cells[0,0] := 'ID';
  Grid.Cells[1,0] := 'E-mail';
  Grid.Cells[2,0] := 'First Name';
  Grid.Cells[3,0] := 'Last Name';
  Grid.Cells[4,0] := 'Avatar';

  Grid.ColWidths[0] := 50;
  Grid.ColWidths[1] := 200;
  Grid.ColWidths[2] := 150;
  Grid.ColWidths[3] := 150;
  Grid.ColWidths[4] := 450;
end;

procedure TfrmPrincipal.GridClick(Sender: TObject);
begin
  // Abre avatar com Browser Simples
  Browser.Navigate(Grid.Cells[4,Grid.Row]);
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  ConsumoAPI;
end;

// Consumo API
procedure TfrmPrincipal.ConsumoAPI;
var
  HTTPClient: TNetHTTPClient;
  Response: IHTTPResponse;
  JSONValue: TJSONValue;
  JSONArray: TJSONArray;
  JSONObject: TJSONObject;
  i: Integer;
begin
  // Cria o Client
  HTTPClient := TNetHTTPClient.Create(nil);
  try
    // Realizar a requisição HTTP GET da URL da API
    Response := HTTPClient.Get('https://reqres.in/api/users');

    // Verificar se a resposta é válida
    if Response.StatusCode = 200 then
    begin
      // Parse do JSON
      JSONValue := TJSONObject.ParseJSONValue(Response.ContentAsString);
      try
        if JSONValue is TJSONObject then
        begin
          // Atribui o resulta do campo "data" para um JSON Array
          JSONArray := TJSONObject(JSONValue).GetValue('data') as TJSONArray;

          // Preencher o StringGrid com os dados
          Grid.RowCount := JSONArray.Count + 1;

          for i := 0 to JSONArray.Count - 1 do
          begin
            // Atribui o JSON Object o registro do ponteiro no JSON Array
            JSONObject := JSONArray.Items[i] as TJSONObject;

            // Atribui ao Grid os Valores do JSON Object em cada coluna
            Grid.Cells[0, i + 1] := JSONObject.GetValue('id').Value;
            Grid.Cells[1, i + 1] := JSONObject.GetValue('email').Value;
            Grid.Cells[2, i + 1] := JSONObject.GetValue('first_name').Value;
            Grid.Cells[3, i + 1] := JSONObject.GetValue('last_name').Value;
            Grid.Cells[4, i + 1] := JSONObject.GetValue('avatar').Value;
          end;
        end;
      finally
        JSONValue.Free;
      end;
    end
    else
    begin
      ShowMessage('Erro ao obter dados: ' + Response.StatusCode.ToString);
    end;
  finally
    HTTPClient.Free;
  end;
end;

end.
