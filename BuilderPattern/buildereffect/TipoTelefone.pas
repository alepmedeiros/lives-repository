unit TipoTelefone;

interface

uses
  System.TypInfo;

type
  TTipoTelefone = (COMERCIAL, CELULAR, RESIDENCIAL);

  TTipoTelefoneHelper = record helper for TTipoTelefone
    function ToString : String;
  end;

implementation

{ TTipoTelefoneHelper }

function TTipoTelefoneHelper.ToString: String;
begin
  Result := GetEnumName(TypeInfo(TTipoTelefone), Integer(Self));
end;

end.
