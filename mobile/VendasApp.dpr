program VendasApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  UntPrincipal in 'UntPrincipal.pas' {frmPrincipal},
  UntCadModelo in 'UntCadModelo.pas' {frmCadModelo},
  UntCadCli in 'UntCadCli.pas' {frmCadCli},
  UntDM in 'UntDM.pas' {DM: TDataModule},
  Lib in 'Lib\Lib.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
