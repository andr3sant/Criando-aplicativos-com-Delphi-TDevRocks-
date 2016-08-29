unit UntForn;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.TabControl, FMX.Layouts, FMX.StdCtrls,
  FMX.Controls.Presentation, MultiDetailAppearanceU, FMX.ListBox, FMX.Edit,

  Data.DB, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  FMX.ComboEdit;

type
  TfrmForn = class(TForm)
    lytBase: TLayout;
    tbCtrlPrincipal: TTabControl;
    tbItemLista: TTabItem;
    tbitemEdicao: TTabItem;
    lsvPrincipal: TListView;
    ToolBar1: TToolBar;
    spbMenu: TSpeedButton;
    Label1: TLabel;
    spbAdd: TSpeedButton;
    ToolBar2: TToolBar;
    spbVoltar: TSpeedButton;
    spbGravar: TSpeedButton;
    Label2: TLabel;
    tbCtrlEdicao: TTabControl;
    tbStep1: TTabItem;
    tbStep2: TTabItem;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBox2: TListBox;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    edtApelido: TEdit;
    edtRazaoSocial: TEdit;
    ToolBar3: TToolBar;
    Layout1: TLayout;
    Layout2: TLayout;
    edtEndereco: TEdit;
    edtNumero: TEdit;
    SpeedButton1: TSpeedButton;
    ToolBar4: TToolBar;
    spbSpep1: TSpeedButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkFillControlToField1: TLinkFillControlToField;
    LinkFillControlToField2: TLinkFillControlToField;
    cbxCidade: TComboEdit;
    cbxEstado: TComboEdit;
    LinkFillControlToField3: TLinkFillControlToField;
    LinkFillControlToField4: TLinkFillControlToField;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure spbSpep1Click(Sender: TObject);
    procedure spbAddClick(Sender: TObject);
    procedure spbGravarClick(Sender: TObject);
    procedure spbVoltarClick(Sender: TObject);
    procedure lsvPrincipalItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure cbxEstadoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmForn: TfrmForn;

implementation

{$R *.fmx}
{$R *.Windows.fmx MSWINDOWS}

uses UntDM;

procedure TfrmForn.cbxEstadoChange(Sender: TObject);
begin
  case cbxEstado.ItemIndex of
    0: //São Paulo
      begin
        cbxCidade.Items.Clear;
        cbxCidade.Items.Add('São Paulo');
        cbxCidade.Items.Add('Santos');
        cbxCidade.Items.Add('Itú');
        cbxCidade.Items.Add('Santa Gertrudes');
        cbxCidade.Items.Add('Rio Claro');
      end;
    1: //Minas Gerais
      begin
        cbxCidade.Items.Clear;
        cbxCidade.Items.Add('Belo Horizonte');
        cbxCidade.Items.Add('Betim');
        cbxCidade.Items.Add('Uberaba');
      end;
    2: //Rio de Janeiro
      begin
        cbxCidade.Items.Clear;
        cbxCidade.Items.Add('Rio de Janeiro');
        cbxCidade.Items.Add('Araruana');
        cbxCidade.Items.Add('Cabo Frio');
      end;
  end;
  cbxCidade.ItemIndex := 0;
end;

procedure TfrmForn.FormCreate(Sender: TObject);
begin
  DM.qryFornecedores.Active := True;
  spbGravar.Width := 75;
  tbCtrlPrincipal.ActiveTab   := tbItemLista;
  tbCtrlPrincipal.TabPosition := TTabPosition.None;

  tbCtrlEdicao.ActiveTab      := tbStep1;
  tbCtrlEdicao.TabPosition    := TTabPosition.None;

  cbxCidade.Items.Clear;
  cbxCidade.Items.Add('São Paulo');
  cbxCidade.Items.Add('Santos');
  cbxCidade.Items.Add('Itú');
  cbxCidade.Items.Add('Santa Gertrudes');
  cbxCidade.Items.Add('Rio Claro');
  cbxCidade.ItemIndex := 0;
end;

procedure TfrmForn.lsvPrincipalItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  DM.qryFornecedores.Edit;
  tbCtrlPrincipal.Next();
  tbCtrlEdicao.ActiveTab := tbStep1;
end;

procedure TfrmForn.spbAddClick(Sender: TObject);
begin
  DM.qryFornecedores.Append;
  tbCtrlPrincipal.Next();
  tbCtrlEdicao.ActiveTab := tbStep1;
end;

procedure TfrmForn.spbGravarClick(Sender: TObject);
begin
  if DM.qryFornecedores.State in dsEditModes then
    DM.qryFornecedores.Post;

  //Envia os dados para o servidor DataSnap
  //Lembrando: Precisamos de internet no aparelho, iOS ou Android.
  DM.SalvarFornecedor;

  tbCtrlPrincipal.Previous();
  tbCtrlEdicao.Previous();
end;

procedure TfrmForn.spbSpep1Click(Sender: TObject);
begin
  tbCtrlEdicao.Previous();
end;

procedure TfrmForn.spbVoltarClick(Sender: TObject);
begin
  if DM.qryFornecedores.State in dsEditModes then
    DM.qryFornecedores.Cancel;
  tbCtrlPrincipal.Previous();
end;

procedure TfrmForn.SpeedButton1Click(Sender: TObject);
begin
  tbCtrlEdicao.Next();
end;

end.

(*
  case cbxEstado.ItemIndex of
    0: //São Paulo
      begin
        cbxCidade.Items.Clear;
        cbxCidade.Items.Add('São Paulo');
        cbxCidade.Items.Add('Santos');
        cbxCidade.Items.Add('Itú');
        cbxCidade.Items.Add('Santa Gertrudes');
        cbxCidade.Items.Add('Rio Claro');
      end;
    1: //Minas Gerais
      begin
        cbxCidade.Items.Clear;
        cbxCidade.Items.Add('Belo Horizonte');
        cbxCidade.Items.Add('Betim');
        cbxCidade.Items.Add('Uberaba');
      end;
    2: //Rio de Janeiro
      begin
        cbxCidade.Items.Clear;
        cbxCidade.Items.Add('Rio de Janeiro');
        cbxCidade.Items.Add('Araruana');
        cbxCidade.Items.Add('Cabo Frio');
      end;
  end;
  cbxCidade.ItemIndex := 0;
*)
