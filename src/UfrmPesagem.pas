unit UfrmPesagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfrmPesagem = class(TForm)
    dtpPesagem: TDateTimePicker;
    Label1: TLabel;
    edtPesoMedio: TEdit;
    Label2: TLabel;
    edtQtdPesada: TEdit;
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
  frmPesagem: TfrmPesagem;

implementation

uses
  UdmDados;

{$R *.dfm}

procedure TfrmPesagem.btnCancelarClick(Sender: TObject);
begin
        Self.Close; //Aqui vai fechar a janela
end;

procedure TfrmPesagem.btnGravarClick(Sender: TObject);
var
  vIdLote: Integer; //Variável para guardar o ID temporariamente
begin
  //Pegamos o ID do lote enquanto a query ainda está com os dados do Grid
  vIdLote := dmDados.qryLotes.FieldByName('ID_LOTE').AsInteger;

  //INSERT
  dmDados.qryLotes.Close;
  dmDados.qryLotes.SQL.Clear;
  dmDados.qryLotes.SQL.Add('INSERT INTO TAB_PESAGEM (ID_LOTE_FK, DATA_PESAGEM, PESO_MEDIO, QUANTIDADE_PESADA)');
  dmDados.qryLotes.SQL.Add('VALUES (:pLote, :pData, :pPeso, :pQtd)');

  //Passando nos parâmetros
  dmDados.qryLotes.ParamByName('pLote').AsInteger := vIdLote;
  dmDados.qryLotes.ParamByName('pData').AsDate    := dtpPesagem.Date;
  dmDados.qryLotes.ParamByName('pPeso').AsFloat   := StrToFloatDef(edtPesoMedio.Text, 0);
  dmDados.qryLotes.ParamByName('pQtd').AsInteger  := StrToIntDef(edtQtdPesada.Text, 0);

  try
    dmDados.qryLotes.ExecSQL;
    ShowMessage('Pesagem lançada com sucesso para o lote ' + IntToStr(vIdLote) + '!');
    Self.Close;
  except
    on E: Exception do
      ShowMessage('Erro ao gravar: ' + E.Message);
  end;
end;

end.
