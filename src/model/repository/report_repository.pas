unit report_repository;
interface
uses my_contracts, Data.DB, FireDAC.Comp.Client, DMConnection, System.SysUtils, Vcl.Dialogs;
type

TReportRepository = class(TInterfacedObject, IReportRepository)

private


public
  procedure ShowReportDesempenho();
  procedure ShowRelatorioUltimosAcessos(const AEscolaID: Integer);
 procedure ShowReportAtividades(const AEscolaID: Integer; const AProfessorID: Integer);


end;

implementation

{ TReportRepository }

procedure TReportRepository.ShowReportAtividades(
  const AEscolaID: Integer;
  const AProfessorID: Integer
);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := DataModule1.FDConnection1;

    Qry.SQL.Text :=
  'SELECT ' +
  '    a.id AS atividade_id, ' +
  '    a.title AS atividade_nome, ' +
  '    m.name AS materia_nome, ' +
  '    t.turma_name AS turma_nome, ' +
  '    p.id AS professor_id, ' +
  '    SUM(CASE WHEN ae.id IS NOT NULL THEN 1 ELSE 0 END) AS total_tentativas, ' +
  '    SUM(CASE WHEN ae.sucess = TRUE THEN 1 ELSE 0 END) AS total_acertos, ' +
  '    ROUND( (SUM(CASE WHEN ae.sucess = TRUE THEN 1 ELSE 0 END)::decimal / ' +
  '           NULLIF(SUM(CASE WHEN ae.id IS NOT NULL THEN 1 ELSE 0 END), 0)) * 100, 2 ) AS porcentagem_acerto ' +

  'FROM atividade_estudante ae ' +
  'JOIN atividade_turma at ON ae.atividade_turma_id = at.id ' +
  'JOIN atividades a ON at.atividade_id = a.id ' +
  'LEFT JOIN materias m ON a.materia_id = m.id ' +
  'LEFT JOIN turmas t ON at.turma_id = t.id ' +
  'LEFT JOIN professores p ON a.professor_id = p.id ' +
  'LEFT JOIN users u ON u.id = p.user_id ' +

  'WHERE u.user_escola_id = :ESCOLA ' +
  '  AND p.id = :PROFESSOR ' +

  'GROUP BY a.id, a.title, m.name, t.id, t.turma_name, p.id ' +  // 👈 AGRUPANDO POR ID DA TURMA
  'ORDER BY porcentagem_acerto ASC';

    Qry.ParamByName('ESCOLA').AsInteger := AEscolaID;
    Qry.ParamByName('PROFESSOR').AsInteger := AProfessorID;

    Qry.Open;

    DataModule1.frxDBDatasetAtividades.DataSet := Qry;

    DataModule1.frxReportAtividades.DataSets.Clear;
    DataModule1.frxReportAtividades.DataSets.Add(DataModule1.frxDBDatasetAtividades);

    DataModule1.frxReportAtividades.ShowReport();

  except
    on E: Exception do
      raise Exception.CreateFmt(
        'Erro ao gerar relatório de dificuldade das atividades: %s',
        [E.Message]
      );
  end;
end;


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
      '  COALESCE(COUNT(DISTINCT DATE(ll.data_login)), 0) AS dias_acessados, ' +
      '  COALESCE(TO_CHAR(ll.data_login, ''MM/YYYY'')::VARCHAR, ''Sem Acessos'') AS mes_do_registro ' +
      'FROM users u ' +
      'LEFT JOIN login_logs ll ON ll.user_id = u.id ' +
      'WHERE u.user_escola_id = :ESCOLA ' +
      'GROUP BY u.user_name, TO_CHAR(ll.data_login, ''MM/YYYY'') ' +
      'ORDER BY mes_do_registro, u.user_name';

    Qry.ParamByName('ESCOLA').AsInteger := AEscolaID;
    Qry.Open;

    // Vincula ao FastReport
    DataModule1.frxDBDatasetLastAccess.DataSet := Qry;
    DataModule1.frxReportLastAccess.DataSets.Clear;
    DataModule1.frxReportLastAccess.DataSets.Add(DataModule1.frxDBDatasetLastAccess);

    // Exibe o relatório
    DataModule1.frxReportLastAccess.ShowReport();

  except
    on E: Exception do
      raise Exception.CreateFmt(
        'Erro ao gerar relatório de últimos acessos: %s',
        [E.Message]
      );
  end;
end;


end.
