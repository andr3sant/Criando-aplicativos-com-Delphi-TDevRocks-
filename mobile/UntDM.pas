unit UntDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  System.IOUtils;

type
  TDM = class(TDataModule)
    fdcConexao: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    qryClientes: TFDQuery;
    qryClientesID: TStringField;
    qryClientesAPELIDO: TStringField;
    qryClientesRAZAOSOCIAL: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

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
//
//
//
//  with fdcConexao do
//  begin
//    {$IF DEFINED (IOS) || (ANDROID)}
//      Params.Values['DriverID'] := 'SQLite';
//      try
//        Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'TDevRocks.s3db');
//        Connected := True;
//      except on E: Exception do
//      begin
//        raise Exception.Create('Erro de conexão com o banco de dados!');
//      end;
//    {$ENDIF}
//
//    {$IFDEF MSWINDOWS}
//      try
//        Params.Values['Database'] := 'C:\TDevRocks\Curso - Criando aplicativos moveis com Delphi\mobile\database\TDevRocks.s3db';
//        Connected := True;
//      except on E: Exception do
//        raise Exception.Create('Erro de conexão com o banco de dados!');
//      end;
//    {$ENDIF}
//  end;
end;

end.
