program ProjectSAG;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UdmDados in 'UdmDados.pas' {dmDados: TDataModule},
  UfrmCadLote in 'UfrmCadLote.pas' {frmCadLote},
  UfrmPesagem in 'UfrmPesagem.pas' {frmPesagem};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TfrmCadLote, frmCadLote);
  Application.CreateForm(TfrmPesagem, frmPesagem);
  Application.Run;
end.
