unit UfrmCadLote;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmCadLote = class(TForm)
    Label1: TLabel;
    edtDescricao: TEdit;
    Label2: TLabel;
    dtpEntrada: TDateTimePicker;
    Label3: TLabel;
    edtQtdInicial: TEdit;
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
  frmCadLote: TfrmCadLote;

implementation

uses
  UdmDados;

{$R *.dfm}

procedure TfrmCadLote.btnCancelarClick(Sender: TObject);
begin
         Self.Close; // Aqui vai fechar a janela
end;

procedure TfrmCadLote.btnGravarClick(Sender: TObject);
begin
  dmDados.qryLotes.Close;
  dmDados.qryLotes.SQL.Clear;
  dmDados.qryLotes.SQL.Add('INSERT INTO TAB_LOTES_AVES (DESCRICAO, DATA_ENTRADA, QUANTIDADE_INICIAL)');
  dmDados.qryLotes.SQL.Add('VALUES (:pDesc, :pData, :pQtd)');

  dmDados.qryLotes.ParamByName('pDesc').AsString := edtDescricao.Text;
  dmDados.qryLotes.ParamByName('pData').AsDate   := dtpEntrada.Date;
  dmDados.qryLotes.ParamByName('pQtd').AsInteger := StrToIntDef(edtQtdInicial.Text, 0);

  try
    // O SEGREDO ESTÁ AQUI: Use ExecSQL para INSERT
    dmDados.qryLotes.ExecSQL;

    ShowMessage('Lote gravado com sucesso!');
    Self.Close;
  except
    on E: Exception do
      ShowMessage('Erro ao gravar: ' + E.Message);


      end;
end;

end.
