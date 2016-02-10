unit UntPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Layouts, System.Actions, FMX.ActnList, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Effects, FMX.Objects;

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
    lytBotao1: TLayout;
    rndBotao1: TRoundRect;
    imgBotao1: TImage;
    lytRotulos1: TLayout;
    lblTituloBtn1: TLabel;
    lblDescBtn1: TLabel;
    ShadowEffect1: TShadowEffect;
    Layout1: TLayout;
    RoundRect1: TRoundRect;
    imgBotao2: TImage;
    Layout2: TLayout;
    lblTituloBtn2: TLabel;
    ShadowEffect2: TShadowEffect;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure imgBotao1Click(Sender: TObject);
  private
    { Private declarations }
    FActiveForm : TForm;
  public
    { Public declarations }
    procedure MudarAba(ATabItem: TTabItem; Sender: TObject);
    procedure AbrirForm(AFormClass: TComponentClass);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

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

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  tbctrlPrincipal.ActiveTab := tbitemMenu;
  tbctrlPrincipal.TabPosition := TTabPosition.None;
end;

procedure TfrmPrincipal.imgBotao1Click(Sender: TObject);
begin
  AbrirForm(TfrmClientes);       //Carrego o próximo form
  MudarAba(tbitemApoio, Sender); //Mudar aba do menu para o apoio (novo form)
end;

procedure TfrmPrincipal.MudarAba(ATabItem: TTabItem; Sender: TObject);
begin
  actMudarAba.Tab := ATabItem;
  actMudarAba.ExecuteTarget(Sender);
end;

end.
