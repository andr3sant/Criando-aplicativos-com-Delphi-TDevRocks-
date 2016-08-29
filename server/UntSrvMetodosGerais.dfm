object SrvMetodosGerais: TSrvMetodosGerais
  OldCreateOrder = False
  Height = 351
  Width = 510
  object fdConexao: TFDConnection
    Params.Strings = (
      'Database=ExtremeDelphi'
      'User_Name=sa'
      'Password=s32]4]381a'
      'Server=192.168.1.50'
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
  object qryPedidos: TFDQuery
    Connection = fdConexao
    SQL.Strings = (
      'SELECT * FROM PEDIDOS')
    Left = 72
    Top = 200
    object qryPedidosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object qryPedidosID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
    end
    object qryPedidosID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
    end
  end
  object qryItens_Pedido: TFDQuery
    Connection = fdConexao
    SQL.Strings = (
      'SELECT * FROM ITEM_PEDIDO')
    Left = 176
    Top = 200
    object qryItens_PedidoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object qryItens_PedidoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
    end
    object qryItens_PedidoID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      Origin = 'ID_PEDIDO'
    end
    object qryItens_PedidoQTD: TIntegerField
      FieldName = 'QTD'
      Origin = 'QTD'
    end
  end
  object qryAuxiliar: TFDQuery
    Connection = fdConexao
    Left = 384
    Top = 200
  end
  object memAuxiliar: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 384
    Top = 256
  end
  object qryAuxiliar2: TFDQuery
    Connection = fdConexao
    Left = 248
    Top = 272
  end
end
