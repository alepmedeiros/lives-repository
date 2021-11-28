unit PessoaBuilder;

interface

uses
  Pessoa,
  Endereco,
  System.Generics.Collections,
  telefone,
  tipotelefone,
  System.sysutils;

type
  TPessoaBuilder = class
  private
    FPessoa: TPessoa;
    FEndereco: TEndereco;
    FTelefone: TObjectList<TTelefone>;

    procedure addTel(vDDD, vNumero: Integer; vTipo: TTipoTelefone);
  public
    constructor Create;
    destructor Destroy; override;
    class function Builder: TPessoaBuilder;
    function Nome(Value: String): TPessoaBuilder;
    function SobreNome(Value: String): TPessoaBuilder;
    function DataNascimento(Value: String): TPessoaBuilder;
    function Logradouro(Value: String = ''): TPessoaBuilder;
    function Numero(Value: String = ''): TPessoaBuilder;
    function Complemento(Value: String = ''): TPessoaBuilder;
    function Bairro(Value: String = ''): TPessoaBuilder;
    function Cidade(Value: String = ''): TPessoaBuilder;
    function Pais(Value: String = ''): TPessoaBuilder;
    function telefone(vDDD, vTel: Integer; Tipo: TTipoTelefone): TPessoaBuilder;
    function getPessoa: TPessoa;
  end;

implementation

{ TPessoaBuilder }

procedure TPessoaBuilder.addTel(vDDD, vNumero: Integer; vTipo: TTipoTelefone);
var
  I : Integer;
begin
  FTelefone.Add(TTelefone.Create);
  I := FTelefone.Count -1;
  FTelefone.Items[I].DDD := vDDD;
  FTelefone.Items[I].Numero := vNumero;
  FTelefone.Items[I].Tipo := vTipo;
end;

function TPessoaBuilder.Bairro(Value: String): TPessoaBuilder;
begin
  FEndereco.Bairro := Value;
  Result := Self;
end;

class function TPessoaBuilder.Builder: TPessoaBuilder;
begin
  Result := Self.Create;
end;

function TPessoaBuilder.Cidade(Value: String): TPessoaBuilder;
begin
  FEndereco.Cidade := Value;
  Result := Self;
end;

function TPessoaBuilder.Complemento(Value: String): TPessoaBuilder;
begin
  FEndereco.Complemento := Value;
  Result := Self;
end;

constructor TPessoaBuilder.Create;
begin
  FPessoa := TPessoa.Create;
  FEndereco := TEndereco.Create;
  FTelefone := TObjectList<TTelefone>.Create;
end;

function TPessoaBuilder.DataNascimento(Value: String): TPessoaBuilder;
begin
  FPessoa.Dia := Copy(Value,1,2).ToInteger;
  FPessoa.Mes := Copy(Value,4,2).ToInteger;
  FPessoa.Ano := Copy(Value,7,4).ToInteger;
  Result := Self;
end;

destructor TPessoaBuilder.Destroy;
begin
  FPessoa.DisposeOf;
  FEndereco.DisposeOf;
  FTelefone.DisposeOf;
  inherited;
end;

function TPessoaBuilder.getPessoa: TPessoa;
begin
  FPessoa.Endereco := FEndereco;
  FPessoa.Telefone := FTelefone;
  Result := Self.FPessoa;
end;

function TPessoaBuilder.Logradouro(Value: String): TPessoaBuilder;
begin
  FEndereco.Logradouro := Value;
  Result := Self;
end;

function TPessoaBuilder.Nome(Value: String): TPessoaBuilder;
begin
  FPessoa.Nome := Value;
  Result := Self;
end;

function TPessoaBuilder.Numero(Value: String): TPessoaBuilder;
begin
  FEndereco.Numero := Value;
  Result := Self;
end;

function TPessoaBuilder.Pais(Value: String): TPessoaBuilder;
begin
  FEndereco.Pais := Value;
  Result := Self;
end;

function TPessoaBuilder.SobreNome(Value: String): TPessoaBuilder;
begin
  FPessoa.SobreNome := Value;
  Result := Self;
end;

function TPessoaBuilder.telefone(vDDD, vTel: Integer;
  Tipo: TTipoTelefone): TPessoaBuilder;
begin
  addTel(vDDD,vTel,Tipo);
  Result := Self;
end;

end.
