object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 460
  Width = 636
  object fdcConexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\TDevRocks\Curso - Criando aplicativos moveis com Del' +
        'phi\mobile\database\TDevRocks.s3db'
      'OpenMode=ReadWrite'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 64
    Top = 24
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 528
    Top = 24
  end
  object qryClientes: TFDQuery
    Connection = fdcConexao
    SQL.Strings = (
      'SELECT * FROM CLIENTES')
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
    object qryClientesCNPJCPF: TStringField
      FieldName = 'CNPJCPF'
      Origin = 'CNPJCPF'
      Size = 50
    end
    object qryClientesCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      Size = 30
    end
    object qryClientesFIXO: TStringField
      FieldName = 'FIXO'
      Origin = 'FIXO'
      Size = 30
    end
    object qryClientesFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'FOTO'
    end
  end
end
