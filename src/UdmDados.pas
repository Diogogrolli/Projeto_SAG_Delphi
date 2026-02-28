unit UdmDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.IBBase;

type
  TdmDados = class(TDataModule)
    Conexao: TFDConnection;
    FBLink: TFDPhysFBDriverLink;
    fdgxwtcrsr1: TFDGUIxWaitCursor;
    qryLotes: TFDQuery;
    dsLotes: TDataSource;
    qryTotais: TFDQuery;
    dsTotais: TDataSource;
    spInserirMortalidade: TFDStoredProc;
    procedure qryLotesAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDados: TdmDados;

implementation
uses UfrmPrincipal;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

 procedure TdmDados.qryLotesAfterScroll(DataSet: TDataSet);
var
  vQtdInicial, vTotalMortes: Integer;
  vPercentual: Double;
begin

  vQtdInicial  := DataSet.FieldByName('QUANTIDADE_INICIAL').AsInteger;
  vTotalMortes := DataSet.FieldByName('TOTAL_MORTES').AsInteger;


  if vQtdInicial > 0 then
    vPercentual := (vTotalMortes / vQtdInicial) * 100
  else
    vPercentual := 0;

  if Assigned(frmPrincipal) then
    frmPrincipal.AtualizarIndicadorSaude(vPercentual);
end;

end.
