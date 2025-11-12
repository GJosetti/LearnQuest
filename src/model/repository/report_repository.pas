unit report_repository;
interface
uses my_contracts, Data.DB, FireDAC.Comp.Client, DMConnection, System.SysUtils, Vcl.Dialogs;
type

TReportRepository = class(TInterfacedObject, IReportRepository)

private


public
  procedure ShowReport();



end;

implementation

{ TReportRepository }

procedure TReportRepository.ShowReport;
var
  Qry: TFDQuery;
begin
  Qry := DataModule1.FDQueryRelatorio1;
  try
    Qry.Close;
    Qry.Connection := DataModule1.FDConnection1;
    Qry.SQL.Clear;
    Qry.SQL.Text :=
      'SELECT ' +
      '  u.user_name, ' +
      '  ROUND(100.0 * SUM(CASE WHEN ae.sucess = TRUE THEN 1 ELSE 0 END) / COUNT(*), 2) AS porcentagem_acertos ' +
      'FROM ' +
      '  public.users u ' +
      '  INNER JOIN estudante e ON e.user_id = u.id ' +
      '  INNER JOIN atividade_estudante ae ON ae.estudante_id = e.id ' +
      'GROUP BY ' +
      '  u.user_name ' +
      'ORDER BY ' +
      '  porcentagem_acertos DESC;';

    Qry.Open;
    DataModule1.frxDBDataset1.DataSet := Qry;
    DataModule1.frxReport1.DataSets.Clear; // limpa datasets antigos (opcional)
    DataModule1.frxReport1.DataSets.Add(DataModule1.frxDBDataset1);
    DataModule1.frxReport1.ShowReport();
  except
    on E: Exception do
      ShowMessage('Erro ao gerar relatório: ' + E.Message);
  end;
end;

end.
