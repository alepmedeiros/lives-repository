unit Pessoa;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Endereco,
  Telefone,
  TipoTelefone;

type
  TPessoa = class
  private
    FSobreNome: String;
    FTelefone: TObjectList<TTelefone>;
    FMes: Integer;
    FAno: Integer;
    FDia: INteger;
    FNome: String;
    FEndereco: TEndereco;
    procedure SetAno(const Value: Integer);
    procedure SetDia(const Value: INteger);
    procedure SetEndereco(const Value: TEndereco);
    procedure SetMes(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetSobreNome(const Value: String);
    procedure SetTelefone(const Value: TObjectList<TTelefone>);
  public
    property Nome : String read FNome write SetNome;
    property SobreNome : String read FSobreNome write SetSobreNome;
    Property Dia : INteger read FDia write SetDia;
    property Mes : Integer read FMes write SetMes;
    property Ano : Integer read FAno write SetAno;
    property Endereco : TEndereco read FEndereco write SetEndereco;
    property Telefone : TObjectList<TTelefone> read FTelefone write SetTelefone;
  end;

  TPessoaHelper = class helper for TPessoa
    function ToString : String; overload;
  end;

implementation

{ TPessoa }

procedure TPessoa.SetAno(const Value: Integer);
begin
  FAno := Value;
end;

procedure TPessoa.SetDia(const Value: INteger);
begin
  FDia := Value;
end;

procedure TPessoa.SetEndereco(const Value: TEndereco);
begin
  FEndereco := Value;
end;

procedure TPessoa.SetMes(const Value: Integer);
begin
  FMes := Value;
end;

procedure TPessoa.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TPessoa.SetSobreNome(const Value: String);
begin
  FSobreNome := Value;
end;

procedure TPessoa.SetTelefone(const Value: TObjectList<TTelefone>);
begin
  FTelefone := Value;
end;

{ TPessoaHelper }

function TPessoaHelper.ToString: String;
var
  I: Integer;
begin
  Result := 'Pessoa('+
            'Nome: '+Self.Nome+
            ',SobreNome: '+Self.SobreNome+
            ',Nascimento: '+Self.Dia.ToString+'/'+
                            Self.Mes.ToString+'/'+
                            Self.Ano.ToString+'/'+
            ',Endereco: '+Self.Endereco.Logradouro+
            ' '+self.Endereco.Numero+' '+
            self.Endereco.Complemento+', Bairro: '+
            self.Endereco.Bairro+', Cidade: '+
            self.Endereco.Cidade+', Pais: '+
            Self.Endereco.Pais;
  for I := 0 to Pred(Self.Telefone.Count) do
  begin
    Result := Result +
      ', Tipo: '+Self.Telefone.Items[I].Tipo.ToString+' Telefone: '+
      '('+Self.Telefone.Items[I].DDD.ToString+')'+
      ' '+Self.Telefone.Items[I].Numero.Tostring;
  end;
end;

end.
