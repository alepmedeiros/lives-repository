unit Telefone;

interface

uses
  TipoTelefone;

type
  TTelefone = class
  private
    FDDD: Integer;
    FNumero: Integer;
    FTipo: TTipoTelefone;
    procedure SetDDD(const Value: Integer);
    procedure SetNumero(const Value: Integer);
    procedure SetTipo(const Value: TTipoTelefone);
  public
    property DDD: Integer read FDDD write SetDDD;
    property Numero: Integer read FNumero write SetNumero;
    property Tipo: TTipoTelefone read FTipo write SetTipo;
  end;

implementation

{ TTelefone }

procedure TTelefone.SetDDD(const Value: Integer);
begin
  FDDD := Value;
end;

procedure TTelefone.SetNumero(const Value: Integer);
begin
  FNumero := Value;
end;

procedure TTelefone.SetTipo(const Value: TTipoTelefone);
begin
  FTipo := Value;
end;

end.
