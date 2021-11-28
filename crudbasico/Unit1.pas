unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Pessoa, Endereco, DAOPEssoa;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  lPessoa : TPessoa;
  lEndereco : TEndereco;
  I: Integer;
begin
  lPessoa := TPessoa.Create;
  try
    lPessoa.Id := 1;
    lPessoa.Nome := 'Sylas';

    lEndereco := TEndereco.Create;
    lEndereco.Id := 1;
    lEndereco.IdPessoa := lPessoa.Id;
    lEndereco.Logradouro := 'Rua Teste1';
    lPessoa.Endereco.add(lEndereco);

    lEndereco := TEndereco.Create;
    lEndereco.Id := 2;
    lEndereco.IdPessoa := lPessoa.Id;
    lEndereco.Logradouro := 'Rua Teste2';
    lPessoa.Endereco.add(lEndereco);

    Memo1.Lines.Add('id: '+lPessoa.Id.ToString);
    Memo1.Lines.Add('Nome: '+lPessoa.Nome);

    Memo1.Lines.Add('-----Endenreco---------');
    for I := 0 to Pred(lPessoa.Endereco.Count) do
    begin
      Memo1.Lines.Add('id: '+lPessoa.Endereco[I].Id.ToString);
      Memo1.Lines.Add('idPessoa: '+lPessoa.Endereco[I].IdPessoa.ToString);
      Memo1.Lines.Add('Logradouro: '+lPessoa.Endereco[I].Logradouro);
      Memo1.Lines.Add('-----------');
    end;
  finally
    lPessoa.DisposeOf;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  lPessoa : TPessoa;
  lEndereco : TEndereco;
  lDAOPessoa : TDAOPessoa;
  I: Integer;
begin
  lPessoa := TPessoa.Create;
  lDAOPessoa := TDAOPessoa.Create;
  try
    lPessoa.Id := 1;
    lPessoa.Nome := 'Alessandro';

    lEndereco := TEndereco.Create;
    lEndereco.Id := 1;
    lEndereco.IdPessoa := lPessoa.Id;
    lEndereco.Logradouro := 'Rua Teste1';
    lPessoa.Endereco.add(lEndereco);

    lEndereco := TEndereco.Create;
    lEndereco.Id := 2;
    lEndereco.IdPessoa := lPessoa.Id;
    lEndereco.Logradouro := 'Rua Teste2';
    lPessoa.Endereco.add(lEndereco);

    lDAOPessoa.CreatePessao(lPessoa);
  finally
    lPessoa.DisposeOf;
    lDAOPessoa.DisposeOf;
  end;
end;

end.
