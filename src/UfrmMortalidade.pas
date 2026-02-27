unit UfrmMortalidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmMortalidade = class(TForm)
    Label1: TLabel;
    dtpMortalidade: TDateTimePicker;
    Label2: TLabel;
    edtQtdMorta: TEdit;
    Panel1: TPanel;
    btnGravar: TButton;
    btnCancelar: TButton;
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMortalidade: TfrmMortalidade;

implementation

uses
  UdmDados;

{$R *.dfm}

procedure TfrmMortalidade.btnCancelarClick(Sender: TObject);
begin
         Self.Close; //Aqui vai fechar a janela
end;

procedure TfrmMortalidade.btnGravarClick(Sender: TObject);
var
  vIdLote: Integer;
begin
// Pegamos o ID do lote selecionado antes de limpar a query
  vIdLote := dmDados.qryLotes.FieldByName('ID_LOTE').AsInteger;

  dmDados.qryLotes.Close;
  dmDados.qryLotes.SQL.Clear;
  dmDados.qryLotes.SQL.Add('INSERT INTO TAB_MORTALIDADE (ID_LOTE_FK, DATA_MORTALIDADE, QUANTIDADE_MORTA)');
  dmDados.qryLotes.SQL.Add('VALUES (:pLote, :pData, :pQtd)');

  dmDados.qryLotes.ParamByName('pLote').AsInteger := vIdLote;
  dmDados.qryLotes.ParamByName('pData').AsDate    := dtpMortalidade.Date;
  dmDados.qryLotes.ParamByName('pQtd').AsInteger  := StrToIntDef(edtQtdMorta.Text, 0);

  try
    dmDados.qryLotes.ExecSQL;
    ShowMessage('Mortalidade lançada com sucesso!');
    Self.Close;
  except
    on E: Exception do
      ShowMessage('Erro ao gravar: ' + E.Message);

end;

end;

end.