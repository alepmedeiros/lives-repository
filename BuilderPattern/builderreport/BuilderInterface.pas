unit BuilderInterface;

interface

type
  iFileGenerator = interface;

  iBuilder = interface
    function BuilderHeader : iBuilder;
    function BuilderBody : iBuilder;
    function BuilderFooter : iBuilder;
    function GetReport : iFileGenerator;
  end;

  iFileGenerator = interface
    function Add(aValue : String) : iFileGenerator;
    function FileName(aValue : String) : iFileGenerator;
    function SaveToFile : iFileGenerator;
    function FilePath(var aPath : String) : iFileGenerator;
  end;

  iDirector = interface
    function Construct(aBuilder : iBuilder) : iDirector;
  end;

implementation

end.
