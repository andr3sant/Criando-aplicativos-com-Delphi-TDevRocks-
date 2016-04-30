program ServidorTDevRocks;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  UntMain in 'UntMain.pas' {frmMain},
  UntSrvMetodosGerais in 'UntSrvMetodosGerais.pas' {SrvMetodosGerais: TDSServerModule},
  UntWM in 'UntWM.pas' {WM: TWebModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
