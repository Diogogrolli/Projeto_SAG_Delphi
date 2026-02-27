object dmDados: TdmDados
  Height = 480
  Width = 640
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=C:\ProjetoSAG-Delphi-BD\database\BANCO_DADOS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 320
    Top = 48
  end
  object FBLink: TFDPhysFBDriverLink
    Left = 376
    Top = 48
  end
  object fdgxwtcrsr1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 424
    Top = 48
  end
  object qryLotes: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM TAB_LOTES_AVES')
    Left = 104
    Top = 48
  end
  object dsLotes: TDataSource
    DataSet = qryLotes
    Left = 184
    Top = 48
  end
  object qryTotais: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      'SELECT '
      '  L.DESCRICAO, '
      '  L.QUANTIDADE_INICIAL,'
      
        '  (SELECT SUM(M.QUANTIDADE_MORTA) FROM TAB_MORTALIDADE M WHERE M' +
        '.ID_LOTE_FK = L.ID_LOTE) AS TOTAL_MORTOS,'
      
        '  (L.QUANTIDADE_INICIAL - (SELECT COALESCE(SUM(M.QUANTIDADE_MORT' +
        'A), 0) FROM TAB_MORTALIDADE M WHERE M.ID_LOTE_FK = L.ID_LOTE)) A' +
        'S SALDO_AVES'
      'FROM TAB_LOTES_AVES L')
    Left = 256
    Top = 48
  end
  object dsTotais: TDataSource
    DataSet = qryTotais
    Left = 96
    Top = 168
  end
end
