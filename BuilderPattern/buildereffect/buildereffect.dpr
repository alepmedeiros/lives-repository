program buildereffect;

uses
  Vcl.Forms,
  Unit5 in 'Unit5.pas' {Form5},
  Pessoa in 'Pessoa.pas',
  Endereco in 'Endereco.pas',
  Telefone in 'Telefone.pas',
  TipoTelefone in 'TipoTelefone.pas',
  PessoaBuilder in 'PessoaBuilder.pas',
  BuilderPessoa in 'BuilderPessoa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
