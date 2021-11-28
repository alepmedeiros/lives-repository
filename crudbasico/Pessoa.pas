unit Pessoa;

interface

uses
  System.Generics.Collections,
  Endereco;

type
  TPessoa = class
  private
    FId: Integer;
    FNome: String;
    FEndereco: TList<TEndereco>;
  public
    constructor Create;
    destructor Destroy; override;
    property Id : Integer read FId write FId;
    property Nome : String read FNome write FNome;
    property Endereco : TList<TEndereco> read FEndereco write FEndereco;
  end;

implementation

{ TPessoa }

constructor TPessoa.Create;
begin
  FEndereco:= TList<TEndereco>.Create;
end;

destructor TPessoa.Destroy;
begin
  FEndereco.DisposeOf;
  inherited;
end;

end.
