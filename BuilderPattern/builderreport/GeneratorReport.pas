unit GeneratorReport;

interface

uses
  Datasnap.DBClient,
  SHDocVw,
  Activex,
  System.Win.Registry,
  BuilderInterface,
  System.Classes, System.SysUtils, Winapi.Windows;

type
  iGeneretedReport = interface
    function ClientDataSet(aClientDataSet: TClientDataSet): iGeneretedReport;
    procedure Genereted(aWebBrowser: TWebBrowser);
  end;

  TGeneretedReport = class(TInterfacedObject, iGeneretedReport)
  private
    FDataSet: TClientDataSet;
    FNameReport: String;
    FPathResport: String;

    procedure GeneretedReport;
    procedure ChargeHtml(aWebBrowser: TWebBrowser; htmlCode: String);
    procedure DefineIEVersion;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iGeneretedReport;
    function ClientDataSet(aClientDataSet: TClientDataSet): iGeneretedReport;
    procedure Genereted(aWebBrowser: TWebBrowser);
  end;

implementation

uses
  Director,
  ConcretBuilder;

procedure TGeneretedReport.ChargeHtml(aWebBrowser: TWebBrowser;
  htmlCode: String);
var
  lList: TStringList;
  lMemoryStream: TMemoryStream;
begin
  aWebBrowser.Navigate('about:blanck');
  if Assigned(aWebBrowser.Document) then
  begin
    lList := TStringList.Create;
    lMemoryStream := TMemoryStream.Create;
    try
      lList.LoadFromFile(htmlCode);
      lList.SaveToStream(lMemoryStream);
      lMemoryStream.Seek(0, 0);
      (aWebBrowser.Document as IPersistStreamInit)
        .Load(TStreamAdapter.Create(lMemoryStream));
    finally
      lMemoryStream.DisposeOf;
      lList.DisposeOf;
    end;
  end;
end;

function TGeneretedReport.ClientDataSet(aClientDataSet: TClientDataSet)
  : iGeneretedReport;
begin
  result := self;
  FDataSet := aClientDataSet;

  GeneretedReport;
end;

constructor TGeneretedReport.Create;
begin

end;

procedure TGeneretedReport.DefineIEVersion;
const
  REG_KEY = 'Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION';

var
  Reg: TRegistry;
  AppName: String;
begin
  AppName := ExtractFileName(ExtractFileName(ParamStr(0)));
  Reg := nil;
  try
    Reg := TRegistry.Create();
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(REG_KEY, True) then
    begin
      Reg.WriteInteger(AppName, 11000);
      Reg.CloseKey;
    end;
  except

  end;

  if (Assigned(Reg)) then
    FreeAndNil(Reg);
end;

destructor TGeneretedReport.Destroy;
begin

  inherited;
end;

procedure TGeneretedReport.Genereted(aWebBrowser: TWebBrowser);
begin
  ChargeHtml(aWebBrowser, FPathResport);
end;

procedure TGeneretedReport.GeneretedReport;
var
  lDirector: iDirector;
  lConcretBuilder: iBuilder;
  lFile: iFileGenerator;
begin
  lDirector := TDirector.New;
  lConcretBuilder := TConcretBuilder.New(FDataSet.Data);

  lDirector.Construct(lConcretBuilder);
  lFile := lConcretBuilder.GetReport;

  lFile.FileName('fornecedor').FilePath(FPathResport).SaveToFile;
end;

class function TGeneretedReport.New: iGeneretedReport;
begin
  result := self.Create;
end;

end.
