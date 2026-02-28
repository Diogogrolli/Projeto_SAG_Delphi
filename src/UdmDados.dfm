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
    AfterScroll = qryLotesAfterScroll
    Connection = Conexao
    SQL.Strings = (
      'SELECT '
      '    L.ID_LOTE, '
      '    L.DESCRICAO, '
      '    L.DATA_ENTRADA, '
      '    L.QUANTIDADE_INICIAL,'
      '    (SELECT COALESCE(SUM(M.QUANTIDADE_MORTA), 0) '
      '     FROM TAB_MORTALIDADE M '
      '     WHERE M.ID_LOTE_FK = L.ID_LOTE) AS TOTAL_MORTES'
      'FROM TAB_LOTES_AVES L')
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
  object spInserirMortalidade: TFDStoredProc
    Connection = Conexao
    StoredProcName = 'ST_INSERIR_MORTALIDADE'
    Left = 184
    Top = 168
    ParamData = <
      item
        Position = 1
        Name = 'P_OBSERVACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 255
      end
      item
        Position = 2
        Name = 'P_QTD_MORTA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'P_DATA_MORTALIDADE'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'P_ID_LOTE_FK'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'OUT_PERCENTUAL_ACUMULADO'
        DataType = ftFMTBcd
        Precision = 15
        NumericScale = 2
        ParamType = ptOutput
      end>
  end
end
