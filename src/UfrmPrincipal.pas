unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmPrincipal = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnNovoLote: TButton;
    btnPesagem: TButton;
    btnMortalidade: TButton;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    dbgrd1: TDBGrid;
    pnlSaude: TPanel;
    procedure btnNovoLoteClick(Sender: TObject);
    procedure btnPesagemClick(Sender: TObject);
    procedure btnMortalidadeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgrd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private

  public
    procedure AtualizarIndicadorSaude(Percentual: Double);

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  UdmDados, UfrmCadLote, UfrmPesagem, UfrmMortalidade;

{$R *.dfm}

procedure TfrmPrincipal.btnMortalidadeClick(Sender: TObject);
begin
  //Verificação de segurança
  if dmDados.qryLotes.IsEmpty then
  begin
    ShowMessage('Selecione um lote no grid antes de lançar a mortalidade.');
    Exit;
  end;

  frmMortalidade := TfrmMortalidade.Create(Self);
  try
    frmMortalidade.ShowModal;

dmDados.qryLotes.Close;
  dmDados.qryLotes.SQL.Clear;
  dmDados.qryLotes.SQL.Add('SELECT L.ID_LOTE, L.DESCRICAO, L.DATA_ENTRADA, L.QUANTIDADE_INICIAL,');
  dmDados.qryLotes.SQL.Add('(SELECT COALESCE(SUM(M.QUANTIDADE_MORTA), 0) FROM TAB_MORTALIDADE M');
  dmDados.qryLotes.SQL.Add(' WHERE M.ID_LOTE_FK = L.ID_LOTE) AS TOTAL_MORTES,');
  dmDados.qryLotes.SQL.Add('(SELECT FIRST 1 P.PESO_MEDIO FROM TAB_PESAGEM P');
  dmDados.qryLotes.SQL.Add(' WHERE P.ID_LOTE_FK = L.ID_LOTE ORDER BY P.DATA_PESAGEM DESC) AS ULTIMO_PESO_MEDIO');
  dmDados.qryLotes.SQL.Add('FROM TAB_LOTES_AVES L');
  dmDados.qryLotes.Open;

  DBGrid1.DataSource := nil;
  DBGrid1.DataSource := dmDados.dsLotes;

  DBGrid1.Columns.RestoreDefaults;
  finally
    FreeAndNil(frmMortalidade);
  end;
end;

procedure TfrmPrincipal.btnNovoLoteClick(Sender: TObject);
begin
  frmCadLote := TfrmCadLote.Create(Self);
  try
    frmCadLote.ShowModal;


   dmDados.qryLotes.Close;
  dmDados.qryLotes.SQL.Clear;
  dmDados.qryLotes.SQL.Add('SELECT L.ID_LOTE, L.DESCRICAO, L.DATA_ENTRADA, L.QUANTIDADE_INICIAL,');
  //Subquery da Mortalidade
  dmDados.qryLotes.SQL.Add('(SELECT COALESCE(SUM(M.QUANTIDADE_MORTA), 0) FROM TAB_MORTALIDADE M');
  dmDados.qryLotes.SQL.Add(' WHERE M.ID_LOTE_FK = L.ID_LOTE) AS TOTAL_MORTES,');
  dmDados.qryLotes.SQL.Add('(SELECT FIRST 1 P.PESO_MEDIO FROM TAB_PESAGEM P');
  dmDados.qryLotes.SQL.Add(' WHERE P.ID_LOTE_FK = L.ID_LOTE ORDER BY P.DATA_PESAGEM DESC) AS ULTIMO_PESO_MEDIO');
  dmDados.qryLotes.SQL.Add('FROM TAB_LOTES_AVES L');
  dmDados.qryLotes.Open;


    DBGrid1.Columns.RestoreDefaults;
    DBGrid1.DataSource := nil;
    DBGrid1.DataSource := dmDados.dsLotes;
  finally
    FreeAndNil(frmCadLote);
  end;

end;

procedure TfrmPrincipal.btnPesagemClick(Sender: TObject);
begin
  if dmDados.qryLotes.IsEmpty then
  begin
    ShowMessage('Por favor, selecione um lote no grid antes de lançar a pesagem.');
    Exit;
  end;

  frmPesagem := TfrmPesagem.Create(Self);
  try
    frmPesagem.ShowModal;

    //Recarrega os dados com o sql completo
    dmDados.qryLotes.Close;
    dmDados.qryLotes.SQL.Clear;
    dmDados.qryLotes.SQL.Add('SELECT L.ID_LOTE, L.DESCRICAO, L.DATA_ENTRADA, L.QUANTIDADE_INICIAL,');
    dmDados.qryLotes.SQL.Add('(SELECT COALESCE(SUM(M.QUANTIDADE_MORTA), 0) FROM TAB_MORTALIDADE M');
    dmDados.qryLotes.SQL.Add(' WHERE M.ID_LOTE_FK = L.ID_LOTE) AS TOTAL_MORTES,');
    dmDados.qryLotes.SQL.Add('(SELECT FIRST 1 P.PESO_MEDIO FROM TAB_PESAGEM P');
    dmDados.qryLotes.SQL.Add(' WHERE P.ID_LOTE_FK = L.ID_LOTE ORDER BY P.DATA_PESAGEM DESC) AS ULTIMO_PESO_MEDIO');
    dmDados.qryLotes.SQL.Add('FROM TAB_LOTES_AVES L');
    dmDados.qryLotes.Open;

    //Reconecta ao grid
    DBGrid1.DataSource := nil;
    DBGrid1.DataSource := dmDados.dsLotes;
    DBGrid1.Columns.RestoreDefaults;

  finally
    FreeAndNil(frmPesagem);
  end;
end;

procedure TfrmPrincipal.dbgrd1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   //Se o total de mortos for maior que 10,  vai pintar a linha de vermelho
  if dmDados.qryTotais.FieldByName('TOTAL_MORTOS').AsInteger > 10 then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := $00C6C6FF; //Vermelho
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
  end;

  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  //Fecha para garantir que vai carregar o novo sql
  dmDados.qryLotes.Close;
  dmDados.qryLotes.SQL.Clear;
  dmDados.qryLotes.SQL.Add('SELECT L.ID_LOTE, L.DESCRICAO, L.DATA_ENTRADA, L.QUANTIDADE_INICIAL,');
  //Subquery da Mortalidade
  dmDados.qryLotes.SQL.Add('(SELECT COALESCE(SUM(M.QUANTIDADE_MORTA), 0) FROM TAB_MORTALIDADE M');
  dmDados.qryLotes.SQL.Add(' WHERE M.ID_LOTE_FK = L.ID_LOTE) AS TOTAL_MORTES,');
  dmDados.qryLotes.SQL.Add('(SELECT FIRST 1 P.PESO_MEDIO FROM TAB_PESAGEM P');
  dmDados.qryLotes.SQL.Add(' WHERE P.ID_LOTE_FK = L.ID_LOTE ORDER BY P.DATA_PESAGEM DESC) AS ULTIMO_PESO_MEDIO');
  dmDados.qryLotes.SQL.Add('FROM TAB_LOTES_AVES L');
  dmDados.qryLotes.Open;

  //Esse vai garantir que as colunas não fiquem esmagadas, uma cobrindo a outra!
  DBGrid1.Columns.RestoreDefaults;
end;


procedure TfrmPrincipal.AtualizarIndicadorSaude(Percentual: Double);
begin
  // Atualiza o texto do painel
  pnlSaude.Caption := 'Saúde do Lote: ' + FormatFloat('0.00', Percentual) + '%';


  if Percentual < 5 then
    pnlSaude.Color := clGreen
  else if (Percentual >= 5) and (Percentual <= 10) then
    pnlSaude.Color := clYellow
  else
    pnlSaude.Color := clRed;


  if pnlSaude.Color = clYellow then
     pnlSaude.Font.Color := clBlack
  else
     pnlSaude.Font.Color := clWhite;
end;

end.
