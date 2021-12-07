unit Telefone;

interface

uses
  System.SysUtils,
  TipoTelefone;

type
  TTelefone = class
  private
    FDDD: Integer;
    FNumero: Integer;
    FTipo: TTipoTelefone;
  public
    constructor Create(aDDD, aNumero : Integer; aTipo: TTipoTelefone);
    property DDD : Integer read FDDD write FDDD;
    property Numero : Integer read FNumero write FNumero;
    property Tipo: TTipoTelefone read FTipo write FTipo;
  end;

  TTelefoneHelper = class helper for TTelefone
    function ToString : String; overload;
  end;

implementation

{ TTelefone }

constructor TTelefone.Create(aDDD, aNumero: Integer; aTipo: TTipoTelefone);
begin
  FDDD := aDDD;
  FNumero := aNumero;
  FTipo := aTipo;
end;

{ TTelefoneHelper }

function TTelefoneHelper.ToString: String;
begin
  Result := 'telefone: (' + Self.DDD.ToString + ') ' + Self.Numero.ToString +
    ' - ' + Self.Tipo.ToString+#13#10;
end;

end.
