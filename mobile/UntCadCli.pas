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
  MultiDetailAppearanceU,
  System.IOUtils,
  FMX.Edit,
  FMX.ListBox,
  FMX.MediaLibrary.Actions,
  FMX.StdActns,
  FGX.ActionSheet,
  FMX.Objects;

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
    spbPasso2: TSpeedButton;
    ListBox2: TListBox;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    spbGravar: TSpeedButton;
    spbPasso1: TSpeedButton;
    edtCNPJ: TEdit;
    edtCelular: TEdit;
    toolSupEdicao: TToolBar;
    spbVoltarLista: TSpeedButton;
    spbEditar: TSpeedButton;
    lblTituloEdicao: TLabel;
    spbInserir: TSpeedButton;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    imgFotoCli: TImage;
    ListBoxItem7: TListBoxItem;
    edtTelefone: TEdit;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    actFotoBiblioteca: TTakePhotoFromLibraryAction;
    actFotoCamera: TTakePhotoFromCameraAction;
    fgActionSheet1: TfgActionSheet;
    toolStep1: TToolBar;
    toolStep2: TToolBar;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lsviewListaItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure spbVoltarListaClick(Sender: TObject);
    procedure spbInserirClick(Sender: TObject);
    procedure spbPasso2Click(Sender: TObject);
    procedure spbPasso1Click(Sender: TObject);
    procedure spbGravarClick(Sender: TObject);
    procedure spbEditarClick(Sender: TObject);
    procedure actFotoBibliotecaDidFinishTaking(Image: TBitmap);
    procedure actFotoCameraDidFinishTaking(Image: TBitmap);
    procedure imgFotoCliClick(Sender: TObject);
  private
    procedure AtivarDesativarBotoes(Sender: TObject);
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
  AtivarDesativarBotoes(Sender);
end;

procedure TfrmCadCli.imgFotoCliClick(Sender: TObject);
begin
  inherited;
  if not (DM.qryClientes.State in dsEditModes)  then
    DM.qryClientes.Edit;

  AtivarDesativarBotoes(Sender);

  {$IFDEF MSWINDOWS}
    with TOpenDialog.Create(Self) do
    begin
      InitialDir := 'C:\TDevRocks\Curso - Criando aplicativos moveis com Delphi\img';
      DefaultExt := '.png';
      if Execute then
      begin
        imgFotoCli.Bitmap.LoadFromFile(FileName);
        DM.qryClientesFOTO.Assign(imgFotoCli.Bitmap);
      end;
    end;
  {$ELSE}
    actFotoBiblioteca.Text            := 'Biblioteca';
    actFotoCamera.Text                := 'Câmera';
    fgActionSheet1.Actions[0].Caption := 'Biblioteca';
    fgActionSheet1.Actions[1].Caption := 'Câmera';
    fgActionSheet1.Actions[2].Caption := 'Cancelar';

    fgActionSheet1.Show;
  {$ENDIF}
end;

procedure TfrmCadCli.lsviewListaItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  inherited;
  //Força a mudança de aba da tab de edição para o Step1
  MudarAba(tbitemStep1, Sender);
  //Muda para a abra de edicao/visualização
  MudarAba(tbitemEdicao, Sender);
end;

procedure TfrmCadCli.spbEditarClick(Sender: TObject);
begin
  inherited;
  DM.qryClientes.Edit;
  MudarAba(tbitemStep1, Sender);
  edtApelido.SetFocus;
  AtivarDesativarBotoes(Sender);
end;

procedure TfrmCadCli.spbGravarClick(Sender: TObject);
begin
  inherited;
  DM.qryClientes.Post;
  MudarAba(tbitemListagem, Sender);
  AtivarDesativarBotoes(Sender);
end;

procedure TfrmCadCli.spbInserirClick(Sender: TObject);
begin
  inherited;
  DM.qryClientes.Append;
  DM.qryClientesID.AsString := frmPrincipal.FLib.GetObjectID;
  MudarAba(tbitemStep1, Sender);
  MudarAba(tbitemEdicao, Sender);
  edtApelido.SetFocus;
  AtivarDesativarBotoes(Sender);
end;

procedure TfrmCadCli.spbPasso1Click(Sender: TObject);
begin
  inherited;
  MudarAba(tbitemStep1, Sender);
end;

procedure TfrmCadCli.spbPasso2Click(Sender: TObject);
begin
  inherited;
  MudarAba(tbitemStep2, Sender);
end;

procedure TfrmCadCli.spbVoltarListaClick(Sender: TObject);
begin
  inherited;
  if DM.qryClientes.State in dsEditModes then
    DM.qryClientes.Cancel;

  MudarAba(tbitemListagem, Sender);
  AtivarDesativarBotoes(Sender);
end;

procedure TfrmCadCli.actFotoBibliotecaDidFinishTaking(Image: TBitmap);
begin
  inherited;
  imgFotoCli.Bitmap.Assign(Image);
  DM.qryClientesFOTO.Assign(Image);
end;

procedure TfrmCadCli.actFotoCameraDidFinishTaking(Image: TBitmap);
begin
  inherited;
  imgFotoCli.Bitmap.Assign(Image);
  DM.qryClientesFOTO.Assign(Image);
end;

procedure TfrmCadCli.AtivarDesativarBotoes(Sender: TObject);
begin
  //Força a mudança de aba de edição para a aba Step1
  MudarAba(tbitemStep1, Sender);
  //Ajusta tamanhos de botões para iOS
  spbGravar.Width        := 70;
  spbVoltarLista.Width   := 70;
  //Botões
  spbGravar.Enabled      :=     (DM.qryClientes.State in dsEditModes);
  spbEditar.Visible      := not (DM.qryClientes.State in dsEditModes);
  //Caixas de Texto
  edtApelido.Enabled     :=     (DM.qryClientes.State in dsEditModes);
  edtRazaoSocial.Enabled :=     (DM.qryClientes.State in dsEditModes);
  edtCNPJ.Enabled        :=     (DM.qryClientes.State in dsEditModes);
  edtCelular.Enabled     :=     (DM.qryClientes.State in dsEditModes);
  edtTelefone.Enabled    :=     (DM.qryClientes.State in dsEditModes);

  if (DM.qryClientes.State in dsEditModes) then
  begin
    edtApelido.StyleLookup     := EmptyStr;
    edtRazaoSocial.StyleLookup := EmptyStr;
    edtCNPJ.StyleLookup        := EmptyStr;
    edtCelular.StyleLookup     := EmptyStr;
    edtTelefone.StyleLookup    := EmptyStr;
    //Modifica o Caption do título
    case DM.qryClientes.State of
      dsInsert : lblTituloEdicao.Text := 'Incluindo';
      dsEdit   : lblTituloEdicao.Text := 'Editando';
    end;
  end
  else
  begin
    edtApelido.StyleLookup     := 'transparentedit';
    edtRazaoSocial.StyleLookup := 'transparentedit';
    edtCNPJ.StyleLookup        := 'transparentedit';
    edtCelular.StyleLookup     := 'transparentedit';
    edtTelefone.StyleLookup    := 'transparentedit';
    lblTituloEdicao.Text       := 'Visualizando';
  end;

  //Retira os "Captions" dos botões caso Android
  {$IFDEF ANDROID}
    spbPasso1.Text       := EmptyStr;
    spbPasso2.Text       := EmptyStr;
    spbGravar.Text       := EmptyStr;
    spbVoltarLista.Text  := EmptyStr;
    spbMenu.Text         := EmptyStr;
    spbEditar.Text       := EmptyStr;
    spbInserir.Text      := EmptyStr;
  {$ENDIF}
end;

end.
