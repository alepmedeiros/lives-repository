program CreateFormBuilderInterface;

uses
  Vcl.Forms,
  Unit2 in 'Unit2.pas' {Form2},
  BuilderInterface in 'BuilderInterface.pas',
  FormRedBuilder in 'FormRedBuilder.pas',
  FormBlueBuilder in 'FormBlueBuilder.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
