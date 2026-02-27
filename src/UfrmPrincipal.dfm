object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 0
    Top = 57
    Width = 624
    Height = 384
    Align = alClient
    DataSource = dmDados.dsLotes
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 57
    Align = alTop
    TabOrder = 1
    object btnNovoLote: TButton
      Left = 32
      Top = 8
      Width = 97
      Height = 43
      Caption = 'Novo Lote'
      TabOrder = 0
      OnClick = btnNovoLoteClick
    end
    object btnPesagem: TButton
      Left = 232
      Top = 10
      Width = 113
      Height = 41
      Caption = 'Lan'#231'ar Pesagem'
      TabOrder = 1
      OnClick = btnPesagemClick
    end
    object btnMortalidade: TButton
      Left = 456
      Top = 8
      Width = 137
      Height = 43
      Caption = 'Lan'#231'ar Mortalidade'
      TabOrder = 2
    end
  end
end
