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
    qryClientesNOME: TStringField;
    qryClientesSOBRENOME: TStringField;
    qryPedidos: TFDQuery;
    qryItens_Pedido: TFDQuery;
    qryPedidosID: TIntegerField;
    qryPedidosID_CLIENTE: TIntegerField;
    qryPedidosID_PRODUTO: TIntegerField;
    qryItens_PedidoID: TIntegerField;
    qryItens_PedidoID_PRODUTO: TIntegerField;
    qryItens_PedidoID_PEDIDO: TIntegerField;
    qryItens_PedidoQTD: TIntegerField;
    qryAuxiliar: TFDQuery;
    memAuxiliar: TFDMemTable;
    qryAuxiliar2: TFDQuery;
  private
    { Private declarations }
    function FornecedorExiste(AForn: String): Boolean;
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function Concatenar(AValor1, AValor2: String): String;
    function GetClientes: TFDJSONDataSets;
    function GetClientePorID(const AID: Integer): TFDJSONDataSets;
    function GetPedidosEItens: TFDJSONDataSets;

    function ApplyUpdatesCliente(const ADeltaList: TFDJSONDeltas): Boolean;
    function SincronizarNoServidor(AForn: TFDJSONDataSets) : Boolean;
  end;

implementation


{$R *.dfm}


uses System.StrUtils;


function TSrvMetodosGerais.ApplyUpdatesCliente(
  const ADeltaList: TFDJSONDeltas): Boolean;
var
  LApply: IFDJSONDeltasApplyUpdates;
begin
  LApply := TFDJSONDeltasApplyUpdates.Create(ADeltaList);
  LApply.ApplyUpdates('CLIENTES', qryClientes.Command);


  Result := LApply.Errors.Count = 0;
end;

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
  _CONSULTA = 'SELECT * FROM CLIENTES';
begin
  qryClientes.Active := False;
  qryClientes.SQL.Clear;
  qryClientes.SQL.Text := _CONSULTA;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, qryClientes);
end;

function TSrvMetodosGerais.GetPedidosEItens: TFDJSONDataSets;
begin
  qryPedidos.Active := False;
  qryItens_Pedido.Active := False;

  Result := TFDJSONDataSets.Create;

  TFDJSONDataSetsWriter.ListAdd(Result, 'PEDIDOS', qryPedidos);
  TFDJSONDataSetsWriter.ListAdd(Result, 'ITEM_PEDIDO', qryItens_Pedido);
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

function TSrvMetodosGerais.SincronizarNoServidor(
  AForn: TFDJSONDataSets): Boolean;
{$Region 'Script de Insert'}
const
  _INSERT =
    'INSERT INTO FORNECEDOR   ' +
    '(                        ' +
    '  APELIDO            ,   ' +
    '  RAZAOSOCIAL        ,   ' +
    '  ENDERECO           ,   ' +
    '  NUMERO             ,   ' +
    '  ESTADO             ,   ' +
    '  CIDADE                 ' +
    ')                        ' +
    'VALUES                   ' +
    '(                        ' +
    '  :APELIDO           ,   ' +
    '  :RAZAOSOCIAL       ,   ' +
    '  :ENDERECO          ,   ' +
    '  :NUMERO            ,   ' +
    '  :ESTADO            ,   ' +
    '  :CIDADE                ' +
    ');                       ';
{$EndRegion}
var
  iInserts : Integer;
begin
  Assert(TFDJSONDataSetsReader.GetListCount(AForn) = 1);
  memAuxiliar.Active := False;
  memAuxiliar.AppendData(TFDJSONDataSetsReader.GetListValue(AForn, 0));

  iInserts := memAuxiliar.RecordCount;
  qryAuxiliar.Active := False;
  qryAuxiliar.SQL.Clear;
  qryAuxiliar.SQL.Text := _INSERT;

  qryAuxiliar.Params.ArraySize := iInserts;
  while not memAuxiliar.Eof do
  begin
    if not FornecedorExiste(memAuxiliar.FieldByName('APELIDO').AsString) then
    begin
      qryAuxiliar.ParamByName('APELIDO').AsStrings[memAuxiliar.RecNo-1]     := memAuxiliar.FieldByName('APELIDO').AsString;
      qryAuxiliar.ParamByName('RAZAOSOCIAL').AsStrings[memAuxiliar.RecNo-1] := memAuxiliar.FieldByName('RAZAOSOCIAL').AsString;
      qryAuxiliar.ParamByName('ENDERECO').AsStrings[memAuxiliar.RecNo-1]    := memAuxiliar.FieldByName('ENDERECO').AsString;
      qryAuxiliar.ParamByName('NUMERO').AsIntegers[memAuxiliar.RecNo-1]     := memAuxiliar.FieldByName('NUMERO').AsInteger;
      qryAuxiliar.ParamByName('ESTADO').AsStrings[memAuxiliar.RecNo-1]      := memAuxiliar.FieldByName('ESTADO').AsString;
      qryAuxiliar.ParamByName('CIDADE').AsStrings[memAuxiliar.RecNo-1]      := memAuxiliar.FieldByName('CIDADE').AsString;
    end
    else
      Dec(iInserts);

    memAuxiliar.Next;
  end;

  qryAuxiliar.Execute(iInserts, 0);
end;

function TSrvMetodosGerais.FornecedorExiste(AForn: String): Boolean;
const
  _SELECT = 'SELECT APELIDO FROM FORNECEDOR WHERE APELIDO = %s';
begin
  qryAuxiliar2.Active  := False;
  qryAuxiliar2.SQL.Text := Format(_SELECT, [QuotedStr(AForn)]);
  qryAuxiliar2.Active := True;

  Result := not qryAuxiliar2.IsEmpty;
end;

end.

