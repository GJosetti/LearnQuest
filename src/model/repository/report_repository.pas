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
      '  ROUND(100.0 * SUM(CASE WHEN ae.sucess = TRUE THEN 1 ELSE 0 END) ' +
      '        / NULLIF(COUNT(ae.id), 0), 2) AS porcentagem_acertos, ' +
      '  COUNT(ae.id)::varchar || ''/'' || ' +
      '  ( ' +
      '      SELECT COUNT(DISTINCT at2.id)::varchar ' +
      '      FROM atividade_turma at2 ' +
      '      INNER JOIN estudante_turma et2 ON et2.turma_id = at2.turma_id ' +
      '      WHERE et2.estudante_id = e.id ' +
      '  ) AS progresso ' +
      'FROM users u ' +
      'INNER JOIN estudante e ON e.user_id = u.id ' +
      'LEFT JOIN atividade_estudante ae ON ae.estudante_id = e.id ' +
      'GROUP BY u.user_name, e.id ' +
      'ORDER BY porcentagem_acertos DESC';

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
      '  COUNT(DISTINCT DATE(ll.login_time)) AS dias_acessou_no_mes, ' +
      '  TO_CHAR(ll.login_time, ''MM'') AS mes_numero, ' +
      '  TO_CHAR(ll.login_time, ''TMMonth'') AS mes_nome ' +
      'FROM login_logs ll ' +
      'INNER JOIN users u ON u.id = ll.user_id ' +
      'WHERE u.user_escola_id = :ESCOLA ' +
      'GROUP BY u.user_name, mes_numero, mes_nome ' +
      'ORDER BY mes_numero DESC, u.user_name;';

    Qry.ParamByName('ESCOLA').AsInteger := AEscolaID;
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
