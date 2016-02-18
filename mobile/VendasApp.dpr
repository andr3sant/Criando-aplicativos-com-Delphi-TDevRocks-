program VendasApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  UntPrincipal in 'UntPrincipal.pas' {frmPrincipal},
  UntCadModelo in 'UntCadModelo.pas' {frmCadModelo},
  UntCadCli in 'UntCadCli.pas' {frmCadCli},
  UntDM in 'UntDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  AApplication.CreateForm(TfrmPrincipal, frmPrincipal);
  AApplication.CreateForm(TfrmCadModelo, frmCadModelo);
  plication.Run;
end.
