object DM: TDM
  OldCreateOrder = False
  Height = 460
  Width = 636
  object fdConexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\TDevRocks\Curso - Criando aplicativos moveis com Del' +
        'phi\mobile\database\TDevRocks.s3db'
      'OpenMode=ReadWrite'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 24
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 528
    Top = 24
  end
  object qryClientes: TFDQuery
    Connection = fdConexao
    SQL.Strings = (
      'SELECT * FROM CLIENTES WHERE 1 = 2')
    Left = 64
    Top = 96
    object qryClientesID: TStringField
      FieldName = 'ID'
      Origin = 'ID'
      Size = 50
    end
    object qryClientesAPELIDO: TStringField
      FieldName = 'APELIDO'
      Origin = 'APELIDO'
    end
    object qryClientesRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'RAZAOSOCIAL'
      Size = 200
    end
  end
end
