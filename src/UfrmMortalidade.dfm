object frmMortalidade: TfrmMortalidade
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'frmMortalidade'
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
    Left = 120
    Top = 99
    Width = 27
    Height = 15
    Caption = 'Data:'
  end
  object Label2: TLabel
    Left = 368
    Top = 99
    Width = 149
    Height = 30
    Caption = 'Quantidade de Aves Mortas:'#13#10
  end
  object dtpMortalidade: TDateTimePicker
    Left = 56
    Top = 120
    Width = 186
    Height = 23
    Date = 46080.000000000000000000
    Time = 0.626893715278129100
    TabOrder = 0
  end
  object edtQtdMorta: TEdit
    Left = 352
    Top = 120
    Width = 177
    Height = 23
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 57
    Align = alTop
    TabOrder = 2
    object btnGravar: TButton
      Left = 88
      Top = 8
      Width = 75
      Height = 41
      Caption = 'Gravar'
      TabOrder = 0
      OnClick = btnGravarClick
    end
    object btnCancelar: TButton
      Left = 422
      Top = 8
      Width = 75
      Height = 41
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
end
