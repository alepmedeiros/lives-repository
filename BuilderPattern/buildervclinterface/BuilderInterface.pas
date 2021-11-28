unit BuilderInterface;

interface

uses
  System.Classes,
  Vcl.Forms;

type
  iFormBuilder = interface
    function CreateForm(aOwner: TComponent): iFormBuilder;
    function CreateSpeedButton: iFormBuilder;
    function CreateEdit: iFormBuilder;
    function CreateLabel: iFormBuilder;
    function Form: TForm;
  end;

implementation

end.
