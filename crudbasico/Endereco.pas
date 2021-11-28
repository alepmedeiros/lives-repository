unit Endereco;

interface

type
  TEndereco = class
  private
    FLogradouro: String;
    FId: Integer;
    FIdPessoa: Integer;
  public
    property Id : Integer read FId write FId;
    property IdPessoa : Integer read FIdPessoa write FIdPessoa;
    property Logradouro : String read FLogradouro write FLogradouro;
  end;

implementation

end.
