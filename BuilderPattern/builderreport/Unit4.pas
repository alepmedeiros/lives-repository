unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.OleCtrls, SHDocVw,
  Vcl.ExtCtrls, Datasnap.DBClient, GeneratorReport;

type
  TForm4 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    WebBrowser1: TWebBrowser;
    Button1: TButton;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FGenerator : iGeneretedReport;
  public
    ClientDataSet : TClientDataSet;
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
  FGenerator
    .ClientDataSet(ClientDataSet)
    .Genereted(WebBrowser1);
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  FGenerator := TGeneretedReport.New;
end;

end.
