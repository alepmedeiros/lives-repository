unit Telefone;

interface

uses
  System.SysUtils,
  TipoFone;

type
  TTelefone = class
  private
    FDDD: Integer;
    FNumero: Integer;
    FTipo: TTipoFone;
  public
    constructor Create(aDDD, aNumero : Integer; aTipo: TTipoFone);
    property DDD: Integer read FDDD write FDDD;
    property Numero: Integer read FNumero write FNumero;
    property Tipo: TTipoFone read FTipo write FTipo;
  end;

  TTelefoneHelper = class helper for TTelefone
    function ToString : String; overload;
  end;

implementation

{ TTelefone }

constructor TTelefone.Create(aDDD, aNumero: Integer; aTipo: TTipoFone);
begin
  FDDD := aDDD;
  FNumero := aNumero;
  FTipo := aTipo;
end;

{ TTelefoneHelper }

function TTelefoneHelper.ToString: String;
begin
  Result := 'Telefone: ' + Self.DDD.ToString+FNumero.ToString +
      ' - ' + 'Tipo: '+FTipo.ToString+#13#10;
end;

end.
