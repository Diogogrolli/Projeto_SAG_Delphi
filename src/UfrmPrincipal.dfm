object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 635
  ClientWidth = 1108
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  WindowState = wsMaximized
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1108
    Height = 57
    Align = alTop
    TabOrder = 0
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
      OnClick = btnMortalidadeClick
    end
  end
  object pgc1: TPageControl
    Left = 0
    Top = 57
    Width = 1108
    Height = 578
    ActivePage = ts2
    Align = alClient
    TabOrder = 1
    object ts1: TTabSheet
      Caption = 'Gest'#227'o de Lotes'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 1100
        Height = 548
        Align = alClient
        DataSource = dmDados.dsLotes
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
    object ts2: TTabSheet
      Caption = 'Resumo do Plantel'
      ImageIndex = 1
      object dbgrd1: TDBGrid
        Left = 0
        Top = 0
        Width = 1100
        Height = 548
        Align = alClient
        DataSource = dmDados.dsTotais
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrd1DrawColumnCell
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Alignment = taCenter
            Title.Caption = 'Lote'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QUANTIDADE_INICIAL'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Inicial'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TOTAL_MORTOS'
            Title.Alignment = taCenter
            Title.Caption = 'Total de Mortes'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'SALDO_AVES'
            Title.Alignment = taCenter
            Title.Caption = 'Saldo Atual'
            Visible = True
          end>
      end
    end
  end
end
