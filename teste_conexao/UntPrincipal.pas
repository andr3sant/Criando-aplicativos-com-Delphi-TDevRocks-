unit UntPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  Data.FireDACJSONReflect, MultiDetailAppearanceU, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    lblResultadoServidor: TLabel;
    RadioButton3: TRadioButton;
    Edit2: TEdit;
    memClientes: TFDMemTable;
    ListView1: TListView;
    Button2: TButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    Button3: TButton;
    edtIDCliente: TEdit;
    memClientesNOME: TStringField;
    memClientesSOBRENOME: TStringField;
    memClientesSEXO: TStringField;
    memClientesID: TFDAutoIncField;
    LinkListControlToField1: TLinkListControlToField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses UntCM;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if RadioButton1.IsChecked then //EchoString
    lblResultadoServidor.Text := CM.SrvMetodosGeraisClient.EchoString(Edit1.Text)
  else if RadioButton2.IsChecked then
    lblResultadoServidor.Text := CM.SrvMetodosGeraisClient.ReverseString(Edit1.Text)
  else
    lblResultadoServidor.Text := CM.SrvMetodosGeraisClient.Concatenar(Edit1.Text, Edit2.Text);

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Ds_Clientes : TFDJSONDataSets;
begin
  //Download dos dados do servidor DataSnap
  Ds_Clientes := CM.SrvMetodosGeraisClient.GetClientes();

  Assert(TFDJSONDataSetsReader.GetListCount(Ds_Clientes) = 1);

  memClientes.Active := False;
  memClientes.AppendData(TFDJSONDataSetsReader.GetListValue(DS_Clientes, 0));
  memClientes.Active := True;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  ClientePorID : TFDJSONDataSets;
begin
  //Download dos dados do servidor DataSnap
  ClientePorID := CM.SrvMetodosGeraisClient.GetClientePorID(edtIDCliente.Text.ToInteger());

  Assert(TFDJSONDataSetsReader.GetListCount(ClientePorID) = 1);

  memClientes.Active := False;
  memClientes.AppendData(TFDJSONDataSetsReader.GetListValue(ClientePorID, 0));
  memClientes.Active := True;
end;

end.
