object SrvMetodosGerais: TSrvMetodosGerais
  OldCreateOrder = False
  Height = 351
  Width = 510
  object fdConexao: TFDConnection
    Params.Strings = (
      'Database=ExtremeDelphi'
      'User_Name=sa'
      'Password=s32]4]381a'
      'Server=192.168.1.40'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 72
    Top = 32
  end
  object qryClientes: TFDQuery
    Connection = fdConexao
    SQL.Strings = (
      'SELECT TOP 10 * FROM CLIENTES')
    Left = 72
    Top = 112
    object qryClientesNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 30
    end
    object qryClientesSOBRENOME: TStringField
      FieldName = 'SOBRENOME'
      Origin = 'SOBRENOME'
      Size = 100
    end
    object qryClientesSEXO: TStringField
      FieldName = 'SEXO'
      Origin = 'SEXO'
      Size = 30
    end
    object qryClientesID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ReadOnly = True
    end
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 384
    Top = 24
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 384
    Top = 88
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 384
    Top = 144
  end
  object fdConexaoLinux: TFDConnection
    Params.Strings = (
      'Database=/home/dskubuntu/Documents/databases/Treinamento.gdb'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=192.168.1.41'
      'Port=3050'
      'DriverID=IB')
    Left = 208
    Top = 32
  end
end
