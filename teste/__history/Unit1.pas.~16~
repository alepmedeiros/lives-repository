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
  Pizza, Endereco, Pessoa, Telefone, PessoaBuilder;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  TipoFone;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  lEndereco : TEndereco;
begin
  lEndereco := TEndereco.Create;
  lEndereco.Logradouro := 'Rua: Teste';
  lEndereco.Numero := '12';
  lEndereco.Complemento := 'Teste dos testes';
  lEndereco.Bairro := 'Teste';
  lEndereco.Cidade := 'Os Testes';
  lEndereco.Estado := 'TE';

  Memo1.Lines.Add(lEndereco.ToString);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  lPessoa : TPessoa;
  lTelefone : TTelefone;
begin
//  lPessoa := TPessoa.Create;
  lPessoa.Nome := 'Alessandro';
  lPessoa.SobreNome := 'Medeiros';
  lPessoa.DataNascimento := StrToDate('12/12/2021');
  lPessoa.Endereco.Logradouro := 'Teste';
  lPessoa.Endereco.Numero := '123';
  lpessoa.Endereco.Complemento := 'testes';
  lPessoa.Endereco.Bairro := 'teste';
  lpessoa.Endereco.Cidade := 'testes';
  lPessoa.Endereco.Estado := 'er';

  lTelefone := TTelefone.Create(21,23232323,COMERCIAL);
  lPessoa.Telefone.Add(lTelefone);

  lTelefone := TTelefone.Create(21,32323232,RESIDENCIAL);
  lPessoa.Telefone.Add(lTelefone);

  lTelefone := TTelefone.Create(21,999999999,CELULAR);
  lPessoa.Telefone.Add(lTelefone);

  Memo1.Lines.Add(lPessoa.ToString);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Memo1.Lines.Add
  (TPessoa
    .Builder
    .Nome('Alessandro')
    .SobreNome('Medeiros')
    .Nascimento(StrToDatetime('17/12/1982'))
    .Logradouro('Rua do Teste')
    .Numero('123')
    .Complemento('Casa 01')
    .Bairro('Centro')
    .Cidade('Rio de Janeiro')
    .Estado('RJ')
    .Telefone(21,1234568,TTipoFone.RESIDENCIAL)
    .Telefone(21,99999999,TTipoFone.CELULAR)
    .Build.ToString);
end;

end.
