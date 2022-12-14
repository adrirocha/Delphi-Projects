object formConsulta: TformConsulta
  Left = 283
  Top = 388
  Width = 1008
  Height = 319
  Caption = 'Consulta de pedidos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lstPedidos: TListBox
    Left = 0
    Top = 56
    Width = 969
    Height = 225
    ItemHeight = 13
    TabOrder = 0
  end
  object pnlOpcoes: TPanel
    Left = 8
    Top = 8
    Width = 257
    Height = 41
    TabOrder = 1
    object btnAlterar: TButton
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 0
      OnClick = btnAlterarClick
    end
  end
  object btnIncluir: TButton
    Left = 16
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Incluir'
    TabOrder = 2
    OnClick = btnIncluirClick
  end
  object btnExcluir: TButton
    Left = 184
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 3
    OnClick = btnExcluirClick
  end
end
