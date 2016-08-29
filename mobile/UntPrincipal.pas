unit UntPrincipal;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.TabControl,
  FMX.Layouts,
  System.Actions,
  FMX.ActnList,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Effects,
  FMX.Objects,

  {Units Declaradas durante o curso}
  System.IOUtils,
  Lib,
  UntPedidos, UntSincronismo;

type
  TfrmPrincipal = class(TForm)
    lytBackground: TLayout;
    tbctrlPrincipal: TTabControl;
    tbitemMenu: TTabItem;
    tbitemApoio: TTabItem;
    lytPrincipal: TLayout;
    actAcoes: TActionList;
    actMudarAba: TChangeTabAction;
    lytMenu: TGridLayout;
    lytSuperior: TLayout;
    lytInferior: TLayout;
    lytClientes: TLayout;
    rndBtnCli: TRoundRect;
    imgBtnCli: TImage;
    lytRotulos1: TLayout;
    lblTituloBtnCli: TLabel;
    lblDescBtnCli: TLabel;
    ShadowEffect1: TShadowEffect;
    lytFornecedores: TLayout;
    rndBtnForn: TRoundRect;
    imgBtnForn: TImage;
    lytRotulos2: TLayout;
    lblTituloBtnForn: TLabel;
    ShadowEffect2: TShadowEffect;
    lblDesBtnForn: TLabel;
    lytProdutos: TLayout;
    rndBtnProd: TRoundRect;
    imgBtnProd: TImage;
    lytRotulos3: TLayout;
    lblTituloBtnProd: TLabel;
    ShadowEffect3: TShadowEffect;
    lblDescBtnProd: TLabel;
    lytPedidos: TLayout;
    rndBtnPed: TRoundRect;
    imgBtnPed: TImage;
    lytRotulos4: TLayout;
    lblTituloBtnPed: TLabel;
    ShadowEffect4: TShadowEffect;
    lytDesBtnPed: TLabel;
    lytSync: TLayout;
    rndBtnSync: TRoundRect;
    imgBtnSync: TImage;
    lytRotulos5: TLayout;
    lblTituloBtnSync: TLabel;
    ShadowEffect5: TShadowEffect;
    lblDesBtnSync: TLabel;
    lytConfig: TLayout;
    rndBtnConfig: TRoundRect;
    imgBtnConfig: TImage;
    lytRotulos6: TLayout;
    lblTituloBtnConfig: TLabel;
    ShadowEffect6: TShadowEffect;
    lblDesBtnConfig: TLabel;
    Image1: TImage;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure imgBtnCliClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgBtnPedClick(Sender: TObject);
    procedure imgBtnSyncClick(Sender: TObject);
    procedure imgBtnFornClick(Sender: TObject);
  private
    { Private declarations }
    FActiveForm : TForm;
  public
    { Public declarations }
    FLib : TLib;
    procedure MudarAba(ATabItem: TTabItem; Sender: TObject);
    procedure AbrirForm(AFormClass: TComponentClass);
    procedure AjustarLayout;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses
  UntCadCli, UntForn;

procedure TfrmPrincipal.AbrirForm(AFormClass: TComponentClass);
var
  LayoutBase, BotaoMenu: TComponent;
begin
  if Assigned(FActiveForm) then
  begin
    if FActiveForm.ClassType = AFormClass then
      exit
    else
    begin
      FActiveForm.DisposeOf; //Não usar FREE
      FActiveForm := nil;
    end;
  end;

  Application.CreateForm(AFormClass, FActiveForm);

  //encontra o Layoutbase no form a ser exibido para adicionar ao frmPrincipal
  LayoutBase := FActiveForm.FindComponent('lytBase');
  if Assigned(LayoutBase) then
    lytPrincipal.AddObject(TLayout(LayoutBase));

  //encontra o Botão de controle de Menu no form a ser exibido para
  //associá-lo ao MultiView do frmPrincipal
  //BotaoMenu := FActiveForm.FindComponent('btnMenu');
  //if Assigned(BotaoMenu) then
  //  mlvMenu.MasterButton := TControl(BotaoMenu);
end;

procedure TfrmPrincipal.AjustarLayout;
begin
  lytMenu.ItemWidth := (Self.ClientWidth - 20);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FLib.DisposeOf;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FLib := TLib.Create;
  tbctrlPrincipal.ActiveTab   := tbitemMenu;
  tbctrlPrincipal.TabPosition := TTabPosition.None;
  AjustarLayout;
end;

procedure TfrmPrincipal.imgBtnCliClick(Sender: TObject);
begin
  AbrirForm(TfrmCadCli);         //Carrego o próximo form
  MudarAba(tbitemApoio, Sender); //Mudar aba do menu para o apoio (novo form)
end;

procedure TfrmPrincipal.imgBtnFornClick(Sender: TObject);
begin
  AbrirForm(TfrmForn);         //Carrego o próximo form
  MudarAba(tbitemApoio, Sender); //Mudar aba do menu para o apoio (novo form)
end;

procedure TfrmPrincipal.imgBtnPedClick(Sender: TObject);
begin
  AbrirForm(TfrmPedidos);         //Carrego o próximo form
  MudarAba(tbitemApoio, Sender); //Mudar aba do menu para o apoio (novo form)
end;

procedure TfrmPrincipal.imgBtnSyncClick(Sender: TObject);
begin
  AbrirForm(TfrmSincronismo);         //Carrego o próximo form
  MudarAba(tbitemApoio, Sender); //Mudar aba do menu para o apoio (novo form)
end;

procedure TfrmPrincipal.MudarAba(ATabItem: TTabItem; Sender: TObject);
begin
  actMudarAba.Tab := ATabItem;
  actMudarAba.ExecuteTarget(Sender);
end;

end.
