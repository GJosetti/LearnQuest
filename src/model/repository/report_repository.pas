unit report_repository;
interface
uses my_contracts, Data.DB, FireDAC.Comp.Client, DMConnection, System.SysUtils, Vcl.Dialogs;
type

TReportRepository = class(TInterfacedObject, IReportRepository)

private


public
  procedure ShowReportDesempenho();
  procedure ShowRelatorioUltimosAcessos(const AEscolaID: Integer);



end;

implementation

{ TReportRepository }

procedure TReportRepository.ShowReportDesempenho;
var
  Qry: TFDQuery;
begin
  Qry := DataModule1.FDQueryRelatorioDesempenho;
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
    DataModule1.frxDBDatasetDesempenho.DataSet := Qry;
    DataModule1.frxReportDesempenho.DataSets.Clear; // limpa datasets antigos (opcional)
    DataModule1.frxReportDesempenho.DataSets.Add(DataModule1.frxDBDatasetDesempenho);
    DataModule1.frxReportDesempenho.ShowReport();
  except
    on E: Exception do
      ShowMessage('Erro ao gerar relatório: ' + E.Message);
  end;
end;


procedure TReportRepository.ShowRelatorioUltimosAcessos(const AEscolaID: Integer);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := DataModule1.FDConnection1;

    Qry.SQL.Text :=
      'SELECT ' +
      '  u.user_name, ' +
      '  t.nome AS escola, ' +
      '  CAST( ' +
      '    CASE ' +
      '      WHEN u.last_access IS NULL THEN ''Nunca acessou'' ' +
      '      WHEN u.last_access > NOW() - INTERVAL ''1 minute'' THEN ''Há alguns segundos'' ' +
      '      WHEN u.last_access > NOW() - INTERVAL ''1 hour'' THEN CONCAT(EXTRACT(MINUTE FROM AGE(NOW(), u.last_access))::INT, '' minutos atrás'') ' +
      '      WHEN u.last_access > NOW() - INTERVAL ''1 day'' THEN CONCAT(EXTRACT(HOUR FROM AGE(NOW(), u.last_access))::INT, '' horas atrás'') ' +
      '      WHEN u.last_access > NOW() - INTERVAL ''30 day'' THEN CONCAT(EXTRACT(DAY FROM AGE(NOW(), u.last_access))::INT, '' dias atrás'') ' +
      '      WHEN u.last_access > NOW() - INTERVAL ''365 day'' THEN CONCAT(EXTRACT(MONTH FROM AGE(NOW(), u.last_access))::INT, '' meses atrás'') ' +
      '      ELSE CONCAT(EXTRACT(YEAR FROM AGE(NOW(), u.last_access))::INT, '' anos atrás'') ' +
      '    END AS VARCHAR(50) ' +
      '  ) AS ultimo_acesso, ' +
      '  u.last_access ' +
      'FROM users u ' +
      'INNER JOIN tenants t ON t.id = u.user_escola_id ' +
      'WHERE t.id = :EscolaID ' +
      'ORDER BY u.last_access DESC NULLS LAST;';

    Qry.ParamByName('EscolaID').AsInteger := AEscolaID;
    Qry.Open;

    // Vincula ao FastReport
    DataModule1.frxDBDatasetLastAccess.DataSet := Qry;
    DataModule1.frxReportLastAccess.DataSets.Clear;
    DataModule1.frxReportLastAccess.DataSets.Add(DataModule1.frxDBDatasetLastAccess);

    // Mostra o relatório
    DataModule1.frxReportDesempenho.ShowReport();

  except
    on E: Exception do
      raise Exception.CreateFmt('Erro ao gerar relatório de últimos acessos: %s', [E.Message]);
  end;
end;

end.
