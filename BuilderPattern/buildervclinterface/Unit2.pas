unit Unit2;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  BuilderInterface, FormRedBuilder;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Create3ComponentFormUsingBuilder(ABuilder: iFormBuilder);
  end;

var
  Form2: TForm2;

implementation

uses
  FormBlueBuilder;

{$R *.dfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
begin
  Create3ComponentFormUsingBuilder(TBlueFormBuilder.New);
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Create3ComponentFormUsingBuilder(TRedFormBuilder.New);
end;

procedure TForm2.Create3ComponentFormUsingBuilder(ABuilder: iFormBuilder);
begin
  ABuilder
    .CreateForm(Application)
    .CreateEdit
    .CreateLabel
    .CreateSpeedButton
    .Form.ShowModal;
end;

end.
