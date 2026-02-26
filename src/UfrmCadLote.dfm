object frmCadLote: TfrmCadLote
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'frmCadLote'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 40
    Top = 136
    Width = 54
    Height = 15
    Caption = 'Descri'#231#227'o:'
  end
  object Label2: TLabel
    Left = 240
    Top = 136
    Width = 86
    Height = 15
    Caption = 'Data de Entrada:'
  end
  object Label3: TLabel
    Left = 464
    Top = 136
    Width = 99
    Height = 15
    Caption = 'Quantidade Inicial:'
  end
  object edtDescricao: TEdit
    Left = 21
    Top = 157
    Width = 121
    Height = 23
    TabOrder = 0
    Text = 'edtDescricao'
  end
  object dtpEntrada: TDateTimePicker
    Left = 196
    Top = 157
    Width = 186
    Height = 23
    Date = 46079.000000000000000000
    Time = 0.660047384262725200
    TabOrder = 1
  end
  object edtQtdInicial: TEdit
    Left = 458
    Top = 157
    Width = 121
    Height = 23
    TabOrder = 2
    Text = 'edtQtdInicial'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 41
    Align = alTop
    TabOrder = 3
    ExplicitLeft = 232
    ExplicitTop = 16
    ExplicitWidth = 185
    object btnGravar: TButton
      Left = 72
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Gravar'
      TabOrder = 0
      OnClick = btnGravarClick
    end
    object btnCancelar: TButton
      Left = 416
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
end
