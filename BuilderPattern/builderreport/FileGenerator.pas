unit FileGenerator;

interface

uses
  BuilderInterface, System.Classes, System.SysUtils;

type
  TFileGenerator = class(TInterfacedObject, iFileGenerator)
    private
      FGeneratorHTML : TStrings;
      FFilePath : String;
      FFileName : String;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iFileGenerator;
      function Add(aValue : String) : iFileGenerator;
      function FileName(aValue : String) : iFileGenerator;
      function SaveToFile : iFileGenerator;
      function FilePath(var aPath : String) : iFileGenerator;
  end;

implementation

function TFileGenerator.Add(aValue: String): iFileGenerator;
begin
  Result := Self;
  FGeneratorHTML.Add(aValue);
end;

constructor TFileGenerator.Create;
begin
  FGeneratorHTML := TStringList.Create;
end;

destructor TFileGenerator.Destroy;
begin
  FGeneratorHTML.DisposeOf;
  inherited;
end;

function TFileGenerator.FileName(aValue: String): iFileGenerator;
begin
  Result := Self;
  FFileName := aValue;
end;

function TFileGenerator.FilePath(var aPath: String): iFileGenerator;
begin
  Result := Self;
  FFilePath := EXtractFilePath(ParamStr(0)) + FFileName + '.html';
  aPath := FFilePath;
end;

class function TFileGenerator.New : iFileGenerator;
begin
  Result := Self.Create;
end;

function TFileGenerator.SaveToFile: iFileGenerator;
begin
  Result := Self;
  FGeneratorHTML.SaveToFile(FFilePath);
end;

end.
