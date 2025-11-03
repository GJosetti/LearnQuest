unit atividade_repository;

interface
uses my_contracts,Data.DB, DMConnection, Sessao, Vcl.Dialogs, atividade_entity;
type

TAtividadeRepository = class(TInterfacedObject, IAtividadeRepository)

private

public

function GetAtividadeDataSet(aID : Integer) : TDataSet;
procedure Save(aModel: atividade_Model);

end;

implementation

{ TAtividadeRepository }

function TAtividadeRepository.GetAtividadeDataSet(aID : Integer): TDataSet;
begin
  with DataModule1.FDQuery1 do
  begin
     DataModule1.FDQuery1.Close;
     DataModule1.FDQuery1.SQL.Text :=
      'SELECT ' +
      '  a.id, ' +
      '  a.title AS atividade_nome, ' +
      '  t.name AS template_nome, ' +
      '  a.created_at ' +
      'FROM atividades a ' +
      'LEFT JOIN public.activity_template t ON a.template_id = t.id ' +
      'WHERE a.professor_id = :PROF ' +
      'ORDER BY a.created_at DESC;';



    ParamByName('PROF').AsInteger := aID;
    DataModule1.FDQuery1.Open;

    Result := DataModule1.FDQuery1;
  end;
end;


procedure TAtividadeRepository.Save(aModel: atividade_Model);
begin
  with DataModule1.FDQueryAtividades do
  begin
    Close;
    SQL.Text :=
      'INSERT INTO atividades (template_id, professor_id,descricao, title, content_json) ' +
      'VALUES (:TEMPLATE_ID, :PROFESSOR_ID,:DESCRICAO, :TITLE, CAST(:CONTENT_JSON AS JSONB));';

    ParamByName('TEMPLATE_ID').AsInteger := aModel.GetTemplateID;
    ParamByName('PROFESSOR_ID').AsInteger := aModel.GetProfessorID;
    ParamByName('TITLE').AsString := aModel.GetTitle;
    ParamByName('DESCRICAO').AsString := aModel.GetDescricao;
    ParamByName('CONTENT_JSON').AsString := aModel.GetContent_JSON.ToJSON;

    ExecSQL;
  end;
end;


end.
