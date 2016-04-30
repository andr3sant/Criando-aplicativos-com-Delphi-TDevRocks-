unit UntPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    lblResultadoServidor: TLabel;
    RadioButton3: TRadioButton;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses UntCM;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if RadioButton1.IsChecked then //EchoString
    lblResultadoServidor.Text := CM.SrvMetodosGeraisClient.EchoString(Edit1.Text)
  else if RadioButton2.IsChecked then
    lblResultadoServidor.Text := CM.SrvMetodosGeraisClient.ReverseString(Edit1.Text)
  else
    lblResultadoServidor.Text := CM.SrvMetodosGeraisClient.Concatenar(Edit1.Text, Edit2.Text);

end;

end.
