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
    Left = 232
    Top = 232
  end
  object FBLink: TFDPhysFBDriverLink
    Left = 392
    Top = 168
  end
  object fdgxwtcrsr1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 376
    Top = 304
  end
  object qryLotes: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM TAB_LOTES_AVES')
    Left = 104
    Top = 88
  end
  object dsLotes: TDataSource
    DataSet = qryLotes
    Left = 304
    Top = 80
  end
end
