unit Pizza;

interface

uses
  System.SysUtils;

type
  TPizza = class
  type
    TBuilder = class
    private
      FBacon: Boolean;
      FQueijo: Boolean;
      FTomate: Boolean;
      FTamanho: Integer;
    public
      constructor Create(aTamanho: Integer);
      function Queijo : TBuilder;
      function Tomate : TBuilder;
      function Bacon : TBuilder;
      function Build : TPizza;
    end;
  private
    FBacon: Boolean;
    FQueijo: Boolean;
    FTomate: Boolean;
    FTamanho: Integer;
    constructor Create(aBuilder: TBuilder);
  public
    class function Builder(aTamanho: Integer) : TBuilder;
    property Tamanho: Integer read FTamanho write FTamanho;
    property Queijo: Boolean read FQueijo write FQueijo;
    property Tomate: Boolean read FTomate write FTomate;
    property Bacon: Boolean read FBacon write FBacon;
  end;

  TPizzaHelper = class helper for TPizza
    function ToString : String; overload;
  end;

implementation

{ TPizza.TBuilder }

function TPizza.TBuilder.Bacon: TBuilder;
begin
  FBacon := True;
  Result := Self;
end;

function TPizza.TBuilder.Build: TPizza;
begin
  Result := TPizza.Create(self);
end;

constructor TPizza.TBuilder.Create(aTamanho: Integer);
begin
  FTamanho := aTamanho;
end;

function TPizza.TBuilder.Queijo: TBuilder;
begin
  FQueijo := True;
  Result := Self;
end;

function TPizza.TBuilder.Tomate: TBuilder;
begin
  FTomate := True;
  Result := Self;
end;

{ TPizza }

class function TPizza.Builder(aTamanho: Integer) : TBuilder;
begin
  Result := TBuilder.Create(aTamanho);
end;

constructor TPizza.Create(aBuilder: TBuilder);
begin
  FTamanho := aBuilder.FTamanho;
  FQueijo := aBuilder.FQueijo;
  FTomate := aBuilder.FTomate;
  FBacon := aBuilder.FBacon;
end;

{ TPizzaHelper }

function TPizzaHelper.ToString: String;
begin
  Result := 'Pizza: ';
  Result := Result + 'Tamanho: '+Self.FTamanho.ToString;
  Result := Result + ',Queijo: '+BoolToStr(Self.FQueijo,True);
  Result := Result + ',Tomate: '+BoolToStr(FTomate,True);
  Result := Result + ',Bacon: '+BoolToStr(Self.FBacon,True);
end;

end.
