object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Modelo Consumo API'
  ClientHeight = 527
  ClientWidth = 854
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 854
    Height = 73
    Align = alTop
    Color = clGray
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 1057
    object Button1: TButton
      Left = 16
      Top = 16
      Width = 201
      Height = 41
      Caption = 'Consumir API - Teste'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      WordWrap = True
      OnClick = Button1Click
    end
  end
  object pnlRodaPe: TPanel
    Left = 0
    Top = 503
    Width = 854
    Height = 24
    Align = alBottom
    Color = clBlack
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = 1
    ExplicitTop = 508
  end
  object pnlPrincipal: TPanel
    Left = 0
    Top = 73
    Width = 854
    Height = 430
    Align = alClient
    TabOrder = 2
    ExplicitTop = 113
    ExplicitWidth = 1051
    ExplicitHeight = 510
    object Grid: TStringGrid
      Left = 1
      Top = 1
      Width = 668
      Height = 428
      Align = alClient
      TabOrder = 0
      OnClick = GridClick
      ExplicitLeft = -5
      ExplicitTop = -4
      ExplicitWidth = 808
      ExplicitHeight = 523
    end
    object Browser: TWebBrowser
      Left = 669
      Top = 1
      Width = 184
      Height = 428
      Align = alRight
      TabOrder = 1
      ExplicitLeft = 872
      ExplicitHeight = 523
      ControlData = {
        4C000000370F0000632300000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
end
