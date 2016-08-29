program TesteConexao;

uses
  System.StartUpCopy,
  FMX.Forms,
  UntPrincipal in 'UntPrincipal.pas' {Form1},
  Proxy in 'Proxy.pas',
  UntCM in 'UntCM.pas' {CM: TDataModule},
  UntSincronismo in 'UntSincronismo.pas' {frmSincronismo};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TCM, CM);
  Application.CreateForm(TfrmSincronismo, frmSincronismo);
  Application.Run;
end.
