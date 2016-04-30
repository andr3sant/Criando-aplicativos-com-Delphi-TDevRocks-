program TesteConexao;

uses
  System.StartUpCopy,
  FMX.Forms,
  UntPrincipal in 'UntPrincipal.pas' {Form1},
  Proxy in 'Proxy.pas',
  UntCM in 'UntCM.pas' {CM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TCM, CM);
  Application.Run;
end.
