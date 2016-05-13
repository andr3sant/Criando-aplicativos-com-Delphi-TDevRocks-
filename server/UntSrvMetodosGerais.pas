unit UntSrvMetodosGerais;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin,
  FireDAC.Phys.ODBCBase,

  Data.FireDACJSONReflect, FireDAC.Phys.IB, FireDAC.Phys.IBDef;

type
  TSrvMetodosGerais = class(TDSServerModule)
    fdConexao: TFDConnection;
    qryClientes: TFDQuery;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    fdConexaoLinux: TFDConnection;
    qryClientesNOME: TStringField;
    qryClientesSOBRENOME: TStringField;
    qryClientesSEXO: TStringField;
    qryClientesID: TFDAutoIncField;
  private

    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function Concatenar(AValor1, AValor2: String): String;
    function GetClientes: TFDJSONDataSets;
    function GetClientePorID(const AID: Integer): TFDJSONDataSets;
  end;

implementation


{$R *.dfm}


uses System.StrUtils;

function TSrvMetodosGerais.Concatenar(AValor1, AValor2: String): String;
begin
  Result := AValor1 + ' & ' + AValor2;
end;

function TSrvMetodosGerais.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TSrvMetodosGerais.GetClientes: TFDJSONDataSets;
const
  _CONSULTA = 'SELECT TOP 10 * FROM CLIENTES';
begin
  qryClientes.Active := False;
  qryClientes.SQL.Clear;
  qryClientes.SQL.Text := _CONSULTA;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, qryClientes);
end;

function TSrvMetodosGerais.GetClientePorID(const AID: Integer): TFDJSONDataSets;
const
  _CONSULTA = 'SELECT * FROM CLIENTES WHERE ID = %s';
begin
  qryClientes.Active := False;
  qryClientes.SQL.Clear;
  qryClientes.SQL.Text := Format(_CONSULTA, [AID.ToString()]);
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, qryClientes);
end;

function TSrvMetodosGerais.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

