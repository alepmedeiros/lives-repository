unit Connection;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TConexao = class(TDataModule)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure PrepareStatement(aSql: String);
    procedure SetValue(aIndex: Integer; aValue: Variant);
    procedure ExecSQL;
    procedure StartTransation;
    procedure Commit;
    procedure Rollback;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TConexao }

procedure TConexao.Commit;
begin
  FDConnection1.Commit;
end;

procedure TConexao.DataModuleCreate(Sender: TObject);
begin
  FDConnection1.Connected := true;
end;

procedure TConexao.ExecSQL;
begin
  FDQuery1.ExecSQL;
end;

procedure TConexao.PrepareStatement(aSql: String);
begin
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add(aSql);
end;

procedure TConexao.Rollback;
begin
  FDConnection1.Rollback;
end;

procedure TConexao.SetValue(aIndex: Integer; aValue: Variant);
begin
  FDQuery1.Params.Add;
  FDQuery1.Params[aIndex].Value := aValue;
end;

procedure TConexao.StartTransation;
begin
  FDConnection1.StartTransaction;
end;

end.
