//
// Created by the DataSnap proxy generator.
// 28/04/2016 21:59:56
//

unit Proxy;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TSrvMetodosGeraisClient = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FConcatenarCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function Concatenar(AValor1: string; AValor2: string; const ARequestFilter: string = ''): string;
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
  inherited;
end;

end.

