unit Unit1;

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
  Vcl.Buttons;

type
  TAbstractFormBuilder = class
  private
    FForm: TForm;
    procedure BuilderFormClose(Sender: TObject; var Action: TCloseAction);
  protected
    function GetForm: TForm;
  public
    procedure CreateForm(AOwner: TComponent); virtual;
    procedure CreateSpeedButton; virtual; abstract;
    procedure CreateEdit; virtual; abstract;
    procedure CreateLabel; virtual; abstract;
    property Form: TForm read GetForm;
  end;

  TRedFormBuilder = class(TAbstractFormBuilder)
  private
    FNextLeft: Integer;
    FNextTop: Integer;
  public
    procedure CreateForm(AOwner: TComponent); override;
    procedure CreateSpeedButton; override;
    procedure CreateEdit; override;
    procedure CreateLabel; override;
  end;

  TBlueFormBuilder = class(TAbstractFormBuilder)
  private
    FNextLeft: Integer;
    FNextTop: Integer;
  public
    procedure CreateForm(AOwner: TComponent); override;
    procedure CreateSpeedButton; override;
    procedure CreateEdit; override;
    procedure CreateLabel; override;
  end;

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Create3ComponentFormUsingBuilder(ABuilder: TAbstractFormBuilder);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
{ TAbstractFormBuilder }

procedure TAbstractFormBuilder.BuilderFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FForm.DisposeOf;
end;

procedure TAbstractFormBuilder.CreateForm(AOwner: TComponent);
begin
  FForm := TForm.Create(AOwner);
end;

function TAbstractFormBuilder.GetForm: TForm;
begin
  Result := FForm;
end;

{ TRedFormBuilder }

procedure TRedFormBuilder.CreateEdit;
var
  lEdit: TEdit;
begin
  lEdit := TEdit.Create(Form);
  lEdit.Parent := Form;
  lEdit.Left := FNextLeft - 198;
  lEdit.Top := FNextTop - 120;
  lEdit.Width := FNextLeft - 20;
end;

procedure TRedFormBuilder.CreateForm(AOwner: TComponent);
begin
  inherited;
  FNextLeft := 200;
  FNextTop := 150;

  Form.Caption := 'Cadastro da Tela vermelha';
  Form.Width := FNextLeft;
  Form.Height := FNextTop;
  Form.Color := clRed;
end;

procedure TRedFormBuilder.CreateLabel;
var
  lLabel: TLabel;
begin
  lLabel := TLabel.Create(Form);
  lLabel.Parent := Form;
  lLabel.Left := FNextLeft - 190;
  lLabel.Top := FNextTop - 140;
  lLabel.Caption := 'Digite seu nome';
end;

procedure TRedFormBuilder.CreateSpeedButton;
var
  lButton: TSpeedButton;
begin
  lButton:= TSpeedButton.Create(Form);
  lButton.Parent := Form;
  lButton.Left := FNextLeft - (lButton.Width) - 80;
  lButton.Top := FNextTop - 70;
  lButton.Caption := 'Clique aqui';
  lButton.Height := 25;
  lButton.Width := 80;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Create3ComponentFormUsingBuilder(TRedFormBuilder.Create);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Create3ComponentFormUsingBuilder(TBlueFormBuilder.Create);
end;

procedure TForm1.Create3ComponentFormUsingBuilder(
  ABuilder: TAbstractFormBuilder);
 var
  NewForm : TForm;
begin
  ABuilder.CreateForm(Application);
  ABuilder.CreateEdit;
  ABuilder.CreateSpeedButton;
  ABuilder.CreateLabel;
  NewForm := ABuilder.Form;
  if Assigned(NewForm) then
    NewForm.Show;
end;

{ TBlueFormBuilder }

procedure TBlueFormBuilder.CreateEdit;
var
  lEdit: TEdit;
begin
  lEdit := TEdit.Create(Form);
  lEdit.Parent := Form;
  lEdit.Left := FNextLeft - 198;
  lEdit.Top := FNextTop - 120;
  lEdit.Width := FNextLeft - 20;
end;

procedure TBlueFormBuilder.CreateForm(AOwner: TComponent);
begin
  inherited;
  FNextLeft := 300;
  FNextTop := 250;

  Form.Caption := 'Cadastro da Tela Azul';
  Form.Width := FNextLeft;
  Form.Height := FNextTop;
  Form.Color := clBlue;
end;

procedure TBlueFormBuilder.CreateLabel;
var
  lLabel: TLabel;
begin
  lLabel := TLabel.Create(Form);
  lLabel.Parent := Form;
  lLabel.Left := FNextLeft - 190;
  lLabel.Top := FNextTop - 140;
  lLabel.Caption := 'Digite seu nome';
end;

procedure TBlueFormBuilder.CreateSpeedButton;
var
  lButton: TSpeedButton;
begin
  lButton:= TSpeedButton.Create(Form);
  lButton.Parent := Form;
  lButton.Left := FNextLeft - (lButton.Width) - 80;
  lButton.Top := FNextTop - 70;
  lButton.Caption := 'Clique aqui';
  lButton.Height := 25;
  lButton.Width := 80;
end;

end.
