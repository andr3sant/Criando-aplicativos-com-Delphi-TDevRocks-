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
  object qryPedidos: TFDQuery
    Connection = fdcConexao
    SQL.Strings = (
      'SELECT'
      '  PED.ID,'
      '  PED.ID_CLIENTE,'
      '  PED.VALOR_TOTAL,'
      '  PED.NUM_PEDIDO,'
      '  CLI.APELIDO,'
      '  CLI.RAZAOSOCIAL,'
      '  CLI.CNPJCPF'
      'FROM'
      '  PEDIDOS PED'
      '  INNER JOIN CLIENTES CLI'
      '  ON (CLI.ID = PED.ID_CLIENTE)')
    Left = 160
    Top = 96
    object qryPedidosID: TStringField
      FieldName = 'ID'
      Origin = 'ID'
      Size = 50
    end
    object qryPedidosID_CLIENTE: TStringField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      Size = 50
    end
    object qryPedidosVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
    end
    object qryPedidosAPELIDO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'APELIDO'
      Origin = 'APELIDO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPedidosRAZAOSOCIAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RAZAOSOCIAL'
      Origin = 'RAZAOSOCIAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
    object qryPedidosCNPJCPF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CNPJCPF'
      Origin = 'CNPJCPF'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryPedidosNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
      Origin = 'NUM_PEDIDO'
      Required = True
    end
  end
  object qryAuxiliar: TFDQuery
    Connection = fdcConexao
    Left = 528
    Top = 96
  end
  object memAuxiliar: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 528
    Top = 160
  end
  object qryAuxiliar2: TFDQuery
    Connection = fdcConexao
    Left = 456
    Top = 96
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 528
    Top = 248
  end
  object memClientes: TFDMemTable
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 64
    Top = 176
    object memClientesNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 30
    end
    object memClientesSOBRENOME: TStringField
      FieldName = 'SOBRENOME'
      Origin = 'SOBRENOME'
      Size = 100
    end
  end
  object qryFornecedores: TFDQuery
    Connection = fdcConexao
    SQL.Strings = (
      'SELECT * FROM FORNECEDOR')
    Left = 64
    Top = 304
    object qryFornecedoresAPELIDO: TStringField
      FieldName = 'APELIDO'
      Origin = 'APELIDO'
      Size = 30
    end
    object qryFornecedoresRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'RAZAOSOCIAL'
      Size = 100
    end
    object qryFornecedoresENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 100
    end
    object qryFornecedoresNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object qryFornecedoresESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Size = 2
    end
    object qryFornecedoresCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 30
    end
  end
end
