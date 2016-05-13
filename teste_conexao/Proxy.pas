//
// Created by the DataSnap proxy generator.
// 12/05/2016 21:29:30
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
  inherited;
end;

end.

