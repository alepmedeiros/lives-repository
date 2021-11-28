unit TipoFone;

interface

uses
  TypInfo;

type
  TTipoFone = (RESIDENCIAL, CELULAR, COMERCIAL);

  TipoFoneHelper = record helper for TTipoFone
    function ToString : String;
  end;

implementation

{ TipoFoneHelper }

function TipoFoneHelper.ToString: String;
begin
  Result := GetEnumName(TypeInfo(TTipoFone), Integer(Self));
end;

end.
