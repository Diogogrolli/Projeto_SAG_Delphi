object frmPesagem: TfrmPesagem
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = '='
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object TLabel
    Left = 88
    Top = 136
    Width = 94
    Height = 15
    Caption = 'Data da Pesagem:'
  end
  object Label1: TLabel
    Left = 288
    Top = 136
    Width = 65
    Height = 15
    Caption = 'Peso M'#233'dio:'
  end
  object Label2: TLabel
    Left = 464
    Top = 136
    Width = 66
    Height = 15
    Caption = 'Qtd. Pesada:'
  end
  object dtpPesagem: TDateTimePicker
    Left = 40
    Top = 157
    Width = 186
    Height = 23
    Date = 46079.000000000000000000
    Time = 0.697686226849327800
    TabOrder = 0
  end
  object edtPesoMedio: TEdit
    Left = 264
    Top = 157
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object edtQtdPesada: TEdit
    Left = 440
    Top = 157
    Width = 121
    Height = 23
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 65
    Align = alTop
    TabOrder = 3
    object btnGravar: TButton
      Left = 48
      Top = 16
      Width = 153
      Height = 41
      Caption = 'Gravar'
      TabOrder = 0
      OnClick = btnGravarClick
    end
    object btnCancelar: TButton
      Left = 368
      Top = 16
      Width = 179
      Height = 41
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
end
