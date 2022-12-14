object formPedidos: TformPedidos
  Left = 214
  Top = 140
  Width = 575
  Height = 558
  Caption = 'Pedidos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblNomeCliente: TLabel
    Left = 0
    Top = 0
    Width = 78
    Height = 13
    Caption = 'Nome do Cliente'
  end
  object lblTelefoneCliente: TLabel
    Left = 0
    Top = 40
    Width = 91
    Height = 13
    Caption = 'Telefone do cliente'
  end
  object lblObservacoes: TLabel
    Left = 368
    Top = 0
    Width = 63
    Height = 13
    Caption = 'Observa'#231#245'es'
  end
  object lblItens: TLabel
    Left = 8
    Top = 256
    Width = 26
    Height = 13
    Caption = 'Itens:'
  end
  object pnlOpcoes: TPanel
    Left = 368
    Top = 160
    Width = 169
    Height = 41
    TabOrder = 0
  end
  object btnGravar: TButton
    Left = 368
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 1
    OnClick = btnGravarClick
  end
  object btnCancelar: TButton
    Left = 456
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = btnCancelarClick
  end
  object lstPedidos: TListBox
    Left = 8
    Top = 272
    Width = 545
    Height = 241
    ItemHeight = 13
    TabOrder = 3
  end
  object grpDataEmissao: TGroupBox
    Left = 0
    Top = 88
    Width = 97
    Height = 153
    Caption = 'Data de emiss'#227'o'
    TabOrder = 4
    object lblDia: TLabel
      Left = 8
      Top = 16
      Width = 16
      Height = 13
      Caption = 'Dia'
    end
    object lblMes: TLabel
      Left = 8
      Top = 56
      Width = 20
      Height = 13
      Caption = 'M'#234's'
    end
    object lblAno: TLabel
      Left = 8
      Top = 96
      Width = 19
      Height = 13
      Caption = 'Ano'
    end
    object edtDia: TEdit
      Left = 8
      Top = 32
      Width = 73
      Height = 21
      TabOrder = 0
    end
    object edtMes: TEdit
      Left = 8
      Top = 72
      Width = 73
      Height = 21
      TabOrder = 1
    end
    object edtAno: TEdit
      Left = 8
      Top = 120
      Width = 73
      Height = 21
      TabOrder = 2
    end
  end
  object edtNomeCliente: TEdit
    Left = 0
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object edtTelefoneCliente: TEdit
    Left = 0
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object edtObservacoes: TEdit
    Left = 368
    Top = 16
    Width = 185
    Height = 21
    TabOrder = 7
  end
  object pnlOpcoesItens: TPanel
    Left = 264
    Top = 216
    Width = 281
    Height = 33
    TabOrder = 8
  end
  object btnIncluir: TButton
    Left = 272
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Incluir'
    TabOrder = 9
    OnClick = btnIncluirClick
  end
  object btnAlterar: TButton
    Left = 360
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 10
    OnClick = btnAlterarClick
  end
  object btnExcluir: TButton
    Left = 448
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 11
    OnClick = btnExcluirClick
  end
  object rgSituacao: TRadioGroup
    Left = 128
    Top = 24
    Width = 121
    Height = 73
    Caption = 'Situa'#231#227'o'
    Items.Strings = (
      'Em aberto'
      'Entregue'
      'Cancelado')
    TabOrder = 12
    OnClick = rgSituacaoClick
  end
  object grpStatusPagamento: TGroupBox
    Left = 128
    Top = 104
    Width = 121
    Height = 73
    Caption = ' Pago '
    TabOrder = 13
    object chkSim: TCheckBox
      Left = 8
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Sim'
      TabOrder = 0
    end
    object chkNao: TCheckBox
      Left = 8
      Top = 48
      Width = 97
      Height = 17
      Caption = 'N'#227'o'
      TabOrder = 1
    end
  end
end
