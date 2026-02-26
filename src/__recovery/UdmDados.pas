unit UdmDados;

interface

uses
  System.SysUtils, System.Classes;

type
  TdmDados = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDados: TdmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmDados.DataModuleCreate(Sender: TObject);
begin

end;

end.
