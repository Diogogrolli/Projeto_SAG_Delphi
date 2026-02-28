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

  end;

var
  frmMortalidade: TfrmMortalidade;

implementation

uses
   UfrmPrincipal, UdmDados;

{$R *.dfm}

procedure TfrmMortalidade.btnCancelarClick(Sender: TObject);
begin
         Self.Close; //Aqui vai fechar a janela
end;

procedure TfrmMortalidade.btnGravarClick(Sender: TObject);
var
  vPercentual: Double;
begin
  //Limpa qualquer execução anterior
  dmDados.spInserirMortalidade.UnPrepare;
  dmDados.spInserirMortalidade.Prepare;

  //Passa os valores dos campos para os parâmetros da Procedure
  //Pegamos o ID do lote que está selecionado na tela principal
  dmDados.spInserirMortalidade.ParamByName('P_ID_LOTE_FK').AsInteger   := dmDados.qryLotes.FieldByName('ID_LOTE').AsInteger;
  dmDados.spInserirMortalidade.ParamByName('P_DATA_MORTALIDADE').AsDate := dtpMortalidade.Date;
  dmDados.spInserirMortalidade.ParamByName('P_QTD_MORTA').AsInteger     := StrToIntDef(edtQtdMorta.Text, 0);
  dmDados.spInserirMortalidade.ParamByName('P_OBSERVACAO').AsString := 'Lançamento via Sistema';

  try

    dmDados.spInserirMortalidade.ExecProc;

    //Captura o percentual que o banco devolveu
    vPercentual := dmDados.spInserirMortalidade.ParamByName('OUT_PERCENTUAL_ACUMULADO').AsFloat;

    //Atualiza o painel colorido na tela principal
    frmPrincipal.AtualizarIndicadorSaude(vPercentual);

    ShowMessage('Mortalidade gravada! Saúde do lote atualizada.');
    Self.Close; //Fecha a janela
  except
   on E: Exception do
    begin
      // Se for o erro do banco, mostra só a frase importante
      if Pos('ERR_VALIDACAO', E.Message) > 0 then
        ShowMessage('Atenção: O total de mortes não pode ultrapassar a quantidade inicial do lote!')
      else
        ShowMessage('Erro: ' + E.Message);
  end;
end;
end;
end.

