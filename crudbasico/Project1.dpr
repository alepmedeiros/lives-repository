program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Pessoa in 'Pessoa.pas',
  Endereco in 'Endereco.pas',
  Connection in 'Connection.pas' {Conexao: TDataModule},
  DAOPEssoa in 'DAOPEssoa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
