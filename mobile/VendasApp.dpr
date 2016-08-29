program VendasApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  UntPrincipal in 'UntPrincipal.pas' {frmPrincipal},
  UntCadModelo in 'UntCadModelo.pas' {frmCadModelo},
  UntCadCli in 'UntCadCli.pas' {frmCadCli},
  UntDM in 'UntDM.pas' {DM: TDataModule},
  Lib in 'Lib\Lib.pas',
  UntPedidos in 'UntPedidos.pas' {frmPedidos},
  UntSincronismo in 'UntSincronismo.pas' {frmSincronismo},
  Proxy in 'Proxy.pas',
  UntCM in 'UntCM.pas' {CM: TDataModule},
  UntForn in 'UntForn.pas' {frmForn};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TCM, CM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
