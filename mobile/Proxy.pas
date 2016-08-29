//
// Created by the DataSnap proxy generator.
// 28/08/2016 21:55:27
//

unit Proxy;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TSrvMetodosGeraisClient = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FConcatenarCommand: TDSRestCommand;
    FGetClientesCommand: TDSRestCommand;
    FGetClientesCommand_Cache: TDSRestCommand;
    FGetClientePorIDCommand: TDSRestCommand;
    FGetClientePorIDCommand_Cache: TDSRestCommand;
    FGetPedidosEItensCommand: TDSRestCommand;
    FGetPedidosEItensCommand_Cache: TDSRestCommand;
    FApplyUpdatesClienteCommand: TDSRestCommand;
    FSincronizarNoServidorCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function Concatenar(AValor1: string; AValor2: string; const ARequestFilter: string = ''): string;
    function GetClientes(const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetClientes_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function GetClientePorID(AID: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetClientePorID_Cache(AID: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function GetPedidosEItens(const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetPedidosEItens_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function ApplyUpdatesCliente(ADeltaList: TFDJSONDeltas; const ARequestFilter: string = ''): Boolean;
    function SincronizarNoServidor(AForn: TFDJSONDataSets; const ARequestFilter: string = ''): Boolean;
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
  TSrvMetodosGerais_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSrvMetodosGerais_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSrvMetodosGerais_Concatenar: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'AValor1'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'AValor2'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSrvMetodosGerais_GetClientes: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TSrvMetodosGerais_GetClientes_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSrvMetodosGerais_GetClientePorID: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TSrvMetodosGerais_GetClientePorID_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AID'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSrvMetodosGerais_GetPedidosEItens: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TSrvMetodosGerais_GetPedidosEItens_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSrvMetodosGerais_ApplyUpdatesCliente: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'ADeltaList'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDeltas'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TSrvMetodosGerais_SincronizarNoServidor: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'AForn'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDataSets'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

implementation

function TSrvMetodosGeraisClient.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TSrvMetodosGerais.EchoString';
    FEchoStringCommand.Prepare(TSrvMetodosGerais_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TSrvMetodosGeraisClient.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TSrvMetodosGerais.ReverseString';
    FReverseStringCommand.Prepare(TSrvMetodosGerais_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TSrvMetodosGeraisClient.Concatenar(AValor1: string; AValor2: string; const ARequestFilter: string): string;
begin
  if FConcatenarCommand = nil then
  begin
    FConcatenarCommand := FConnection.CreateCommand;
    FConcatenarCommand.RequestType := 'GET';
    FConcatenarCommand.Text := 'TSrvMetodosGerais.Concatenar';
    FConcatenarCommand.Prepare(TSrvMetodosGerais_Concatenar);
  end;
  FConcatenarCommand.Parameters[0].Value.SetWideString(AValor1);
  FConcatenarCommand.Parameters[1].Value.SetWideString(AValor2);
  FConcatenarCommand.Execute(ARequestFilter);
  Result := FConcatenarCommand.Parameters[2].Value.GetWideString;
end;

function TSrvMetodosGeraisClient.GetClientes(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetClientesCommand = nil then
  begin
    FGetClientesCommand := FConnection.CreateCommand;
    FGetClientesCommand.RequestType := 'GET';
    FGetClientesCommand.Text := 'TSrvMetodosGerais.GetClientes';
    FGetClientesCommand.Prepare(TSrvMetodosGerais_GetClientes);
  end;
  FGetClientesCommand.Execute(ARequestFilter);
  if not FGetClientesCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetClientesCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetClientesCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetClientesCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSrvMetodosGeraisClient.GetClientes_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetClientesCommand_Cache = nil then
  begin
    FGetClientesCommand_Cache := FConnection.CreateCommand;
    FGetClientesCommand_Cache.RequestType := 'GET';
    FGetClientesCommand_Cache.Text := 'TSrvMetodosGerais.GetClientes';
    FGetClientesCommand_Cache.Prepare(TSrvMetodosGerais_GetClientes_Cache);
  end;
  FGetClientesCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetClientesCommand_Cache.Parameters[0].Value.GetString);
end;

function TSrvMetodosGeraisClient.GetClientePorID(AID: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetClientePorIDCommand = nil then
  begin
    FGetClientePorIDCommand := FConnection.CreateCommand;
    FGetClientePorIDCommand.RequestType := 'GET';
    FGetClientePorIDCommand.Text := 'TSrvMetodosGerais.GetClientePorID';
    FGetClientePorIDCommand.Prepare(TSrvMetodosGerais_GetClientePorID);
  end;
  FGetClientePorIDCommand.Parameters[0].Value.SetInt32(AID);
  FGetClientePorIDCommand.Execute(ARequestFilter);
  if not FGetClientePorIDCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetClientePorIDCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetClientePorIDCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetClientePorIDCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSrvMetodosGeraisClient.GetClientePorID_Cache(AID: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetClientePorIDCommand_Cache = nil then
  begin
    FGetClientePorIDCommand_Cache := FConnection.CreateCommand;
    FGetClientePorIDCommand_Cache.RequestType := 'GET';
    FGetClientePorIDCommand_Cache.Text := 'TSrvMetodosGerais.GetClientePorID';
    FGetClientePorIDCommand_Cache.Prepare(TSrvMetodosGerais_GetClientePorID_Cache);
  end;
  FGetClientePorIDCommand_Cache.Parameters[0].Value.SetInt32(AID);
  FGetClientePorIDCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetClientePorIDCommand_Cache.Parameters[1].Value.GetString);
end;

function TSrvMetodosGeraisClient.GetPedidosEItens(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetPedidosEItensCommand = nil then
  begin
    FGetPedidosEItensCommand := FConnection.CreateCommand;
    FGetPedidosEItensCommand.RequestType := 'GET';
    FGetPedidosEItensCommand.Text := 'TSrvMetodosGerais.GetPedidosEItens';
    FGetPedidosEItensCommand.Prepare(TSrvMetodosGerais_GetPedidosEItens);
  end;
  FGetPedidosEItensCommand.Execute(ARequestFilter);
  if not FGetPedidosEItensCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetPedidosEItensCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetPedidosEItensCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetPedidosEItensCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSrvMetodosGeraisClient.GetPedidosEItens_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetPedidosEItensCommand_Cache = nil then
  begin
    FGetPedidosEItensCommand_Cache := FConnection.CreateCommand;
    FGetPedidosEItensCommand_Cache.RequestType := 'GET';
    FGetPedidosEItensCommand_Cache.Text := 'TSrvMetodosGerais.GetPedidosEItens';
    FGetPedidosEItensCommand_Cache.Prepare(TSrvMetodosGerais_GetPedidosEItens_Cache);
  end;
  FGetPedidosEItensCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetPedidosEItensCommand_Cache.Parameters[0].Value.GetString);
end;

function TSrvMetodosGeraisClient.ApplyUpdatesCliente(ADeltaList: TFDJSONDeltas; const ARequestFilter: string): Boolean;
begin
  if FApplyUpdatesClienteCommand = nil then
  begin
    FApplyUpdatesClienteCommand := FConnection.CreateCommand;
    FApplyUpdatesClienteCommand.RequestType := 'POST';
    FApplyUpdatesClienteCommand.Text := 'TSrvMetodosGerais."ApplyUpdatesCliente"';
    FApplyUpdatesClienteCommand.Prepare(TSrvMetodosGerais_ApplyUpdatesCliente);
  end;
  if not Assigned(ADeltaList) then
    FApplyUpdatesClienteCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FApplyUpdatesClienteCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FApplyUpdatesClienteCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ADeltaList), True);
      if FInstanceOwner then
        ADeltaList.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FApplyUpdatesClienteCommand.Execute(ARequestFilter);
  Result := FApplyUpdatesClienteCommand.Parameters[1].Value.GetBoolean;
end;

function TSrvMetodosGeraisClient.SincronizarNoServidor(AForn: TFDJSONDataSets; const ARequestFilter: string): Boolean;
begin
  if FSincronizarNoServidorCommand = nil then
  begin
    FSincronizarNoServidorCommand := FConnection.CreateCommand;
    FSincronizarNoServidorCommand.RequestType := 'POST';
    FSincronizarNoServidorCommand.Text := 'TSrvMetodosGerais."SincronizarNoServidor"';
    FSincronizarNoServidorCommand.Prepare(TSrvMetodosGerais_SincronizarNoServidor);
  end;
  if not Assigned(AForn) then
    FSincronizarNoServidorCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSincronizarNoServidorCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSincronizarNoServidorCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(AForn), True);
      if FInstanceOwner then
        AForn.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSincronizarNoServidorCommand.Execute(ARequestFilter);
  Result := FSincronizarNoServidorCommand.Parameters[1].Value.GetBoolean;
end;

constructor TSrvMetodosGeraisClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TSrvMetodosGeraisClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TSrvMetodosGeraisClient.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FConcatenarCommand.DisposeOf;
  FGetClientesCommand.DisposeOf;
  FGetClientesCommand_Cache.DisposeOf;
  FGetClientePorIDCommand.DisposeOf;
  FGetClientePorIDCommand_Cache.DisposeOf;
  FGetPedidosEItensCommand.DisposeOf;
  FGetPedidosEItensCommand_Cache.DisposeOf;
  FApplyUpdatesClienteCommand.DisposeOf;
  FSincronizarNoServidorCommand.DisposeOf;
  inherited;
end;

end.

