unit UntSincronismo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.ListBox, UntDM, ksTypes,
  ksLoadingIndicator;

type
  TfrmSincronismo = class(TForm)
    lytBase: TLayout;
    ToolBar1: TToolBar;
    spbMenu: TSpeedButton;
    Label1: TLabel;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    btnClientes: TButton;
    ksLoadingIndicator1: TksLoadingIndicator;
    procedure btnClientesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSincronismo: TfrmSincronismo;

implementation

{$R *.fmx}

procedure TfrmSincronismo.btnClientesClick(Sender: TObject);
begin
  ksLoadingIndicator1.LoadingText.Text := 'Aguarde';
  ksLoadingIndicator1.ShowLoading;
  DM.AtualizarClientes;
  ksLoadingIndicator1.HideLoading;
end;

end.
