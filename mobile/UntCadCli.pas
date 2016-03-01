unit UntCadCli;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UntCadModelo, FMX.Controls.Presentation, FMX.TabControl, FMX.Layouts,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, System.Actions, FMX.ActnList, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,

  {Unit declarada durante o curso}
  Data.Db,
  MultiDetailAppearanceU, FMX.Edit, FMX.ListBox;

type
  TfrmCadCli = class(TfrmCadModelo)
    lsviewLista: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    tbctrlEdicao: TTabControl;
    tbitemStep1: TTabItem;
    tbitemStep2: TTabItem;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    edtApelido: TEdit;
    edtRazaoSocial: TEdit;
    ListBoxItem3: TListBoxItem;
    spbProx1: TSpeedButton;
    ListBox2: TListBox;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    spbGravar: TSpeedButton;
    spbPasso1: TSpeedButton;
    edtCNPJ: TEdit;
    edtTelefone: TEdit;
    toolSupEdicao: TToolBar;
    spbVoltarLista: TSpeedButton;
    spbEditar: TSpeedButton;
    Label1: TLabel;
    spbInserir: TSpeedButton;
    lsitemID: TListBoxItem;
    LinkPropertyToFieldItemDataText: TLinkPropertyToField;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lsviewListaItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure spbVoltarListaClick(Sender: TObject);
    procedure spbInserirClick(Sender: TObject);
    procedure spbProx1Click(Sender: TObject);
    procedure spbPasso1Click(Sender: TObject);
    procedure spbGravarClick(Sender: TObject);
  private
    procedure AtivarDesativarBotoes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCli: TfrmCadCli;

implementation

{$R *.fmx}

uses UntDM, UntPrincipal;

procedure TfrmCadCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DM.qryClientes.Active := False;
end;

procedure TfrmCadCli.FormCreate(Sender: TObject);
begin
  inherited;
  DM.qryClientes.Active       := True;
  tbctrlPrincipal.ActiveTab   := tbitemListagem;
  tbctrlEdicao.ActiveTab      := tbitemStep1;
  tbctrlPrincipal.TabPosition := TTabPosition.None;
  tbctrlEdicao.TabPosition    := TTabPosition.None;
end;

procedure TfrmCadCli.lsviewListaItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  inherited;
  MudarAba(tbitemStep1, Sender);
  MudarAba(tbitemEdicao, Sender);
end;

procedure TfrmCadCli.spbGravarClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmCadCli.spbInserirClick(Sender: TObject);
begin
  inherited;
  DM.qryClientes.Append;
  DM.qryClientesID.AsString := frmPrincipal.FLib.GetObjectID;
  MudarAba(tbitemEdicao, Sender);
  //AtivarDesativarBotoes;
end;

procedure TfrmCadCli.spbPasso1Click(Sender: TObject);
begin
  inherited;
  MudarAba(tbitemStep1, Sender);
end;

procedure TfrmCadCli.spbProx1Click(Sender: TObject);
begin
  inherited;
  MudarAba(tbitemStep2, Sender);
end;

procedure TfrmCadCli.spbVoltarListaClick(Sender: TObject);
begin
  inherited;
  //if DM.qryClientes.State in dsEditModes then
  //begin
    //Perguntar se quer cancelar
    //MessageDlg
    MudarAba(tbitemListagem, Sender);
  //end;
end;

procedure TfrmCadCli.AtivarDesativarBotoes;
begin
  spbGravar.Enabled      := (DM.qryClientes.State in dsEditModes);
  spbEditar.Visible      := not (DM.qryClientes.State in dsEditModes);
  edtApelido.Enabled     := (DM.qryClientes.State in dsEditModes);
  edtRazaoSocial.Enabled := (DM.qryClientes.State in dsEditModes);

  if (DM.qryClientes.State in dsEditModes) then
  begin
    edtApelido.StyleLookup     := '';
    edtRazaoSocial.StyleLookup := '';
  end
  else
  begin
    edtApelido.StyleLookup     := 'transparentedit';
    edtRazaoSocial.StyleLookup := 'transparentedit';
  end;
end;

end.
