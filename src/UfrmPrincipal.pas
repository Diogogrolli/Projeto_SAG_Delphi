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
    procedure btnNovoLoteClick(Sender: TObject);
    procedure btnPesagemClick(Sender: TObject);
    procedure btnMortalidadeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgrd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
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

    //Atualiza o grid para voltar a exibir os lotes
    dmDados.qryLotes.Close;
    dmDados.qryLotes.SQL.Clear;
    dmDados.qryLotes.SQL.Add('SELECT * FROM TAB_LOTES_AVES');
    dmDados.qryLotes.Open;
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
    dmDados.qryLotes.SQL.Add('SELECT * FROM TAB_LOTES_AVES');
    dmDados.qryLotes.Open;
  finally
    FreeAndNil(frmCadLote);
  end;

end;

procedure TfrmPrincipal.btnPesagemClick(Sender: TObject);
begin
        // Verifica, não deixa abrir se não tiver lote selecionado
  if dmDados.qryLotes.IsEmpty then
  begin
    ShowMessage('Por favor, selecione um lote no grid antes de lançar a pesagem.');
    Exit;
  end;

  frmPesagem := TfrmPesagem.Create(Self);
  try
    frmPesagem.ShowModal;

                //Atualiza o grid, garantindo o funcionamento
    dmDados.qryLotes.Close;
    dmDados.qryLotes.SQL.Clear;
    dmDados.qryLotes.SQL.Add('SELECT * FROM TAB_LOTES_AVES');
    dmDados.qryLotes.Open;
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
    TDBGrid(Sender).Canvas.Brush.Color := $00C6C6FF; // Vermelho suave
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
  end;

  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
//Abre a query de lotes principal
  dmDados.qryLotes.Close;
  dmDados.qryLotes.Open;

//Abre uma nova query de resumo estatístico
  dmDados.qryTotais.Close;
  dmDados.qryTotais.Open;
end;

end.
