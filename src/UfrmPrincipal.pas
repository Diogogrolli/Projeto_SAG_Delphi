unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnNovoLote: TButton;
    btnPesagem: TButton;
    btnMortalidade: TButton;
    procedure btnNovoLoteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  UdmDados, UfrmCadLote;

{$R *.dfm}

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

end.
