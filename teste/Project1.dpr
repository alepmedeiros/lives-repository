program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Pizza in 'Pizza.pas',
  Telefone in 'Telefone.pas',
  TipoFone in 'TipoFone.pas',
  Pessoa in 'Pessoa.pas',
  Endereco in 'Endereco.pas',
  PessoaBuilder in 'PessoaBuilder.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
