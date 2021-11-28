unit Endereco;

interface

type
  TEndereco = class
  private
    FLogradouro: String;
    FBairro: String;
    FNumero: String;
    FComplemento: String;
    FCidade: String;
    FPais: String;
    procedure SetBairro(const Value: String);
    procedure SetCidade(const Value: String);
    procedure SetComplemento(const Value: String);
    procedure SetLogradouro(const Value: String);
    procedure SetNumero(const Value: String);
    procedure SetPais(const Value: String);
  public
    property Logradouro: String read FLogradouro write SetLogradouro;
    property Numero : String read FNumero write SetNumero;
    property Complemento : String read FComplemento write SetComplemento;
    property Bairro: String read FBairro write SetBairro;
    property Cidade: String read FCidade write SetCidade;
    property Pais: String read FPais write SetPais;
  end;

implementation

{ TEndereco }

procedure TEndereco.SetBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TEndereco.SetCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure TEndereco.SetComplemento(const Value: String);
begin
  FComplemento := Value;
end;

procedure TEndereco.SetLogradouro(const Value: String);
begin
  FLogradouro := Value;
end;

procedure TEndereco.SetNumero(const Value: String);
begin
  FNumero := Value;
end;

procedure TEndereco.SetPais(const Value: String);
begin
  FPais := Value;
end;

end.
