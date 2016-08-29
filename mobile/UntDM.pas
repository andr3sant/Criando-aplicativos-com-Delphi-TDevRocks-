unit UntDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  Data.FireDACJSONReflect,
  System.IOUtils, UntCM, FireDAC.Stan.StorageBin, Lib;

type
  TDM = class(TDataModule)
    fdcConexao: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    qryClientes: TFDQuery;
    qryClientesID: TStringField;
    qryClientesAPELIDO: TStringField;
    qryClientesRAZAOSOCIAL: TStringField;
    qryClientesCNPJCPF: TStringField;
    qryClientesCELULAR: TStringField;
    qryClientesFIXO: TStringField;
    qryClientesFOTO: TBlobField;
    qryPedidos: TFDQuery;
    qryPedidosID: TStringField;
    qryPedidosID_CLIENTE: TStringField;
    qryPedidosVALOR_TOTAL: TFloatField;
    qryPedidosAPELIDO: TStringField;
    qryPedidosRAZAOSOCIAL: TStringField;
    qryPedidosCNPJCPF: TStringField;
    qryAuxiliar: TFDQuery;
    qryPedidosNUM_PEDIDO: TIntegerField;
    memAuxiliar: TFDMemTable;
    qryAuxiliar2: TFDQuery;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    memClientes: TFDMemTable;
    memClientesNOME: TStringField;
    memClientesSOBRENOME: TStringField;
    qryFornecedores: TFDQuery;
    qryFornecedoresAPELIDO: TStringField;
    qryFornecedoresRAZAOSOCIAL: TStringField;
    qryFornecedoresENDERECO: TStringField;
    qryFornecedoresNUMERO: TIntegerField;
    qryFornecedoresESTADO: TStringField;
    qryFornecedoresCIDADE: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetNewID(ATabela, ACampo: String): Integer;
    procedure AtualizarClientes;
    procedure CarregarClientes;
    procedure AppyUpdatesRemoto;
    procedure SalvarFornecedor;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses UntPrincipal;

{$R *.dfm}


procedure TDM.AppyUpdatesRemoto;
var
  LDeltaList: TFDJSONDeltas;
begin
  try
    if memClientes.State in dsEditModes then
      memClientes.Post;

    LDeltaList := TFDJSONDeltas.Create;

    TFDJSONDeltasWriter.ListAdd(LDeltaList, 'CLIENTES', memCLientes);

    CM.SrvMetodosGeraisClient.ApplyUpdatesCliente(LDeltaList);
  except
    //
  end;

end;

procedure TDM.AtualizarClientes;
const
  _INSERT =
    'INSERT INTO CLIENTES       ' +
    '(                          ' +
    '  ID            ,          ' +
    '  APELIDO       ,          ' +
    '  RAZAOSOCIAL              ' +
    ')                          ' +
    'VALUES                     ' +
    '(                          ' +
    '  :ID           ,          ' +
    '  :APELIDO      ,          ' +
    '  :RAZAOSOCIAL             ' +
    ');                         ';
var
  dsClientes : TFDJsonDataSets;
  iInserts   : Integer;
begin
  //Download dos dados
  dsClientes := CM.SrvMetodosGeraisClient.GetClientes();
  Assert(TFDJSONDataSetsReader.GetListCount(dsClientes) = 1);
  memAuxiliar.AppendData(TFDJSONDataSetsReader.GetListValue(dsClientes, 0));

  iInserts := memAuxiliar.RecordCount;
  qryAuxiliar2.Active := False;
  qryAuxiliar2.SQL.Clear;
  qryAuxiliar2.SQL.Text := _INSERT;

  qryAuxiliar2.Params.ArraySize := iInserts;
  while not memAuxiliar.EOF do
  begin
    qryAuxiliar2.ParamByName('ID').AsStrings[memAuxiliar.RecNo-1]          := frmPrincipal.FLib.GetObjectID;
    qryAuxiliar2.ParamByName('APELIDO').AsStrings[memAuxiliar.RecNo-1]     := memAuxiliar.FieldByName('NOME').AsString;
    qryAuxiliar2.ParamByName('RAZAOSOCIAL').AsStrings[memAuxiliar.RecNo-1] := memAuxiliar.FieldByName('NOME').AsString + ' ' +
      memAuxiliar.FieldByName('SOBRENOME').AsString;;
    memAuxiliar.Next;
  end;
  qryAuxiliar2.Execute(iInserts, 0);
end;



procedure TDM.CarregarClientes;
var
  dsClientes : TFDJsonDataSets;
begin
  //Download dos dados
  dsClientes := CM.SrvMetodosGeraisClient.GetClientes();
  Assert(TFDJSONDataSetsReader.GetListCount(dsClientes) = 1);
  memClientes.AppendData(TFDJSONDataSetsReader.GetListValue(dsClientes, 0));
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  with fdcConexao do
  begin
    {$IFNDEF MSWINDOWS}
      Params.Values['DriverID'] := 'SQLite';
      try
        Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'TDevRocks.s3db');
        Connected := True;
      except on E: Exception do
        begin
          raise Exception.Create('Erro de conexão com o banco de dados!');
        end;
      end;
    {$ELSE}
      try
        Params.Values['Database'] := 'C:\TDevRocks\Curso - Criando aplicativos moveis com Delphi\mobile\database\TDevRocks.s3db';
        Connected := True;
      except on E: Exception do
        raise Exception.Create('Erro de conexão com o banco de dados!');
      end;
    {$ENDIF}
  end;
end;

function TDM.GetNewID(ATabela, ACampo: String): Integer;
const
  _SQL = 'SELECT MAX(%s) AS NEW_ID FROM %s';

begin
  qryAuxiliar.Active := False;
  qryAuxiliar.SQL.Text := Format(_SQL, [ACampo, ATabela]);
  qryAuxiliar.Active := True;

  Result := qryAuxiliar.FieldByName('NEW_ID').AsInteger + 1;
end;

procedure TDM.SalvarFornecedor;
var
  DSForn : TFDJsonDataSets;
begin
  DSForn := TFDJsonDataSets.Create;
  qryAuxiliar.Active := False;
  qryAuxiliar.SQL.Clear;
  qryAuxiliar.SQL.Text := 'SELECT * FROM FORNECEDOR';
  TFDJSONDataSetsWriter.ListAdd(DSForn, qryAuxiliar);
  //Upload dos dados de fornecedor para o DataSnap
  CM.SrvMetodosGeraisClient.SincronizarNoServidor(DSForn);
end;

end.
