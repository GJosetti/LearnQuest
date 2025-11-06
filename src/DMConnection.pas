
unit DMConnection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Dialogs;

type
  TDataModule1 = class(TDataModule)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDQueryEscolas: TFDQuery;
    FDQueryTurmas: TFDQuery;
    FDQueryParticipantes: TFDQuery;
    FDQueryAtividades: TFDQuery;
    QRTurmas: TFDQuery;
    FDQueryProfessores: TFDQuery;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  // ✅ Configura o caminho da DLL
  FDPhysPgDriverLink1.VendorLib :=
    ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\infra\lib\libpq.dll');

  // ✅ CONECTA o banco de dados
  try
    if not FDConnection1.Connected then
    begin
      FDConnection1.Connected := True;
    end;
    FDConnection1.ExecSQL('SET search_path TO public');
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao conectar no banco de dados: ' + E.Message);
    end;
  end;
end;

procedure TDataModule1.DataModuleDestroy(Sender: TObject);
begin
  if FDConnection1.Connected then
  begin
    FDConnection1.Connected := false;
  end;
  ShowMessage('DataModule destruído');
end;

end.
