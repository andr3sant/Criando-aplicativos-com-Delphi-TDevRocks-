unit UntCadModelo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.TabControl, FMX.Layouts, System.Actions,
  FMX.ActnList;

type
  TfrmCadModelo = class(TForm)
    lytBase: TLayout;
    tbctrlPrincipal: TTabControl;
    tbitemListagem: TTabItem;
    tbitemEdicao: TTabItem;
    toolSuperior: TToolBar;
    spbMenu: TSpeedButton;
    lblTitulo: TLabel;
    ActionList1: TActionList;
    actMudarAba: TChangeTabAction;
    procedure spbMenuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure MudarAba(ATabItem: TTabItem; Sender: TObject);
  end;

var
  frmCadModelo: TfrmCadModelo;

implementation

{$R *.fmx}

uses
  UntPrincipal;

procedure TfrmCadModelo.FormCreate(Sender: TObject);
begin
  spbMenu.Width := 70;
end;

procedure TfrmCadModelo.MudarAba(ATabItem: TTabItem; Sender: TObject);
begin
  actMudarAba.Tab := ATabItem;
  actMudarAba.ExecuteTarget(Sender);
end;

procedure TfrmCadModelo.spbMenuClick(Sender: TObject);
begin
  frmPrincipal.MudarAba(frmPrincipal.tbitemMenu, Sender);
end;

end.
