unit DAOPEssoa;

interface

uses
  Pessoa, Connection;

type
  TDAOPessoa = class
  private
    FConexao : TConexao;
  public
    constructor Create;
    destructor Destroy; override;
    procedure CreatePessao(aValue : TPEssoa);
  end;

implementation

{ TDAOPessoa }

constructor TDAOPessoa.Create;
begin
  FConexao := TConexao.Create(nil);
end;

procedure TDAOPessoa.CreatePessao(aValue: TPEssoa);
var
  lSQL : String;
  I : Integer;
begin
  FConexao.StartTransation;
  try
    lSQL := 'insert into pessoa values (?, ?)';
    FConexao.PrepareStatement(lSQL);
    FConexao.SetValue(0,aValue.Id);
    FConexao.SetValue(1,aValue.Nome);
    FConexao.ExecSQL;

    lSQL :='';
    for I := 0 to Pred(aValue.Endereco.Count) do
    begin
      lSQL := 'insert into endereco values (?, ?, ?)';
      FConexao.PrepareStatement(lSQL);
      FConexao.SetValue(0, aValue.Endereco[I].Id);
      FConexao.SetValue(1, aValue.Endereco[I].IdPessoa);
      FConexao.SetValue(2, aValue.Endereco[I].Logradouro);
      FConexao.ExecSQL;
    end;

    FConexao.Commit;
  except
    FConexao.Rollback;
  end;
end;

destructor TDAOPessoa.Destroy;
begin
  FConexao.DisposeOf;
  inherited;
end;

end.
