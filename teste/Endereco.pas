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
    FEstado: String;
  public
    property Logradouro: String read FLogradouro write FLogradouro;
    property Numero: String read FNumero write FNumero;
    property Complemento: String read FComplemento write FComplemento;
    property Bairro: String read FBairro write FBairro;
    property Cidade: String read FCidade write FCidade;
    property Estado: String read FEstado write FEstado;
  end;

  TEnderecoHelper = class helper for TEndereco
    function ToString : String; overload;
  end;

implementation

{ TEnderecoHelper }

function TEnderecoHelper.ToString: String;
begin
  Result := 'Endereco:{'+#13#10;
  Result := Result + 'logradouro='+Self.Logradouro+#13#10;
  Result := Result + 'numero='+Self.Numero+#13#10;
  Result := Result + 'complemento='+Self.Complemento+#13#10;
  Result := Result + 'bairro='+Self.Bairro+#13#10;
  Result := Result + 'cidade='+Self.Cidade+#13#10;
  Result := Result + 'estado='+Self.Estado+#13#10;
  Result := Result + '}';
end;

end.
