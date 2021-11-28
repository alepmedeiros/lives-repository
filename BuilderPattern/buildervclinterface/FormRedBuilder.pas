unit FormRedBuilder;

interface

uses
  BuilderInterface,
  System.Classes,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Buttons,
  Vcl.StdCtrls;

type
  TRedFormBuilder = class(TInterfacedObject, iFormBuilder)
  private
    FParent: TForm;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iFormBuilder;
    function CreateForm(aOwner: TComponent): iFormBuilder;
    function CreateSpeedButton: iFormBuilder;
    function CreateEdit: iFormBuilder;
    function CreateLabel: iFormBuilder;
    function Form: TForm; overload;
  end;

implementation

constructor TRedFormBuilder.Create;
begin

end;

function TRedFormBuilder.CreateEdit: iFormBuilder;
var
  lEdit: TEdit;
begin
  Result := Self;
  lEdit := TEdit.Create(FParent);
  lEdit.Parent := FParent;
  lEdit.Left := 10;
  lEdit.Top := 30;
  lEdit.Width := FParent.ClientWidth - 20;
end;

function TRedFormBuilder.CreateForm(aOwner: TComponent): iFormBuilder;
begin
  Result := Self;
  FParent := TForm.Create(aOwner);
  FParent.BorderStyle := bsDialog;
  FParent.Caption := 'Atenção';
  FParent.Color := clRed;
  FParent.Position := poScreenCenter;
  FParent.Width := 200;
  FParent.Height := 150;
end;

function TRedFormBuilder.CreateLabel: iFormBuilder;
var
  lLabel: TLabel;
begin
  Result := SElf;
  lLabel := TLabel.Create(FParent);
  lLabel.Parent := FParent;
  lLabel.Left := 10;
  lLabel.Top := 10;
  lLabel.Caption := 'Digite seu nome';
end;

function TRedFormBuilder.CreateSpeedButton: iFormBuilder;
var
  lButton: TSpeedButton;
begin
  Result := Self;
  lButton := TSpeedButton.Create(FParent);
  lButton.Parent := FParent;
  lButton.Left := FParent.ClientWidth - (lButton.Width) - 70;
  lButton.Top := 80;
  lButton.Caption := 'Clique aqui';
  lButton.Height := 25;
  lButton.Width := 80;
end;

destructor TRedFormBuilder.Destroy;
begin
  if Assigned(FParent) then
    FParent.DisposeOf;
  inherited;
end;

function TRedFormBuilder.Form: TForm;
begin
  Result := FParent;
end;

class function TRedFormBuilder.New: iFormBuilder;
begin
  Result := Self.Create;
end;

end.
