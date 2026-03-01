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
      Left = 48
      Top = 8
      Width = 177
      Height = 43
      Caption = 'Novo Lote'
      TabOrder = 0
      OnClick = btnNovoLoteClick
    end
    object btnPesagem: TButton
      Left = 400
      Top = 8
      Width = 177
      Height = 43
      Caption = 'Lan'#231'ar Pesagem'
      TabOrder = 1
      OnClick = btnPesagemClick
    end
    object btnMortalidade: TButton
      Left = 816
      Top = 8
      Width = 177
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
    ActivePage = ts1
    Align = alClient
    TabOrder = 1
    object ts1: TTabSheet
      Caption = 'Gest'#227'o de Lotes'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 696
        Height = 548
        Align = alClient
        Anchors = [akLeft, akRight]
        DataSource = dmDados.dsLotes
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_LOTE'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_ENTRADA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QUANTIDADE_INICIAL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL_MORTES'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ULTIMO_PESO_MEDIO'
            Visible = True
          end>
      end
      object pnlSaude: TPanel
        Left = 696
        Top = 0
        Width = 404
        Height = 548
        Align = alRight
        Caption = 'Sa'#250'de do Lote: 0%'
        Color = clGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Bernard MT Condensed'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
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
      end
    end
  end
end
