unit Director;

interface

uses
  BuilderInterface;

type
  TDirector = class(TInterfacedObject, iDirector)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iDirector;
      function Construct(aBuilder : iBuilder) : iDirector;
  end;

implementation

function TDirector.Construct(aBuilder: iBuilder): iDirector;
begin
  aBuilder
    .BuilderHeader
    .BuilderBody
    .BuilderFooter;
end;

constructor TDirector.Create;
begin

end;

destructor TDirector.Destroy;
begin

  inherited;
end;

class function TDirector.New : iDirector;
begin
  Result := Self.Create;
end;

end.
