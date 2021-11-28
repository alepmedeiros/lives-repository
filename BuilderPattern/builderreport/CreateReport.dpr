program CreateReport;

uses
  Vcl.Forms,
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas' {Form4},
  BuilderInterface in 'BuilderInterface.pas',
  ConcretBuilder in 'ConcretBuilder.pas',
  FileGenerator in 'FileGenerator.pas',
  Director in 'Director.pas',
  GeneratorReport in 'GeneratorReport.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
