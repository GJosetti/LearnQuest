unit atividade_repository;

interface
uses my_contracts,Data.DB, DMConnection, Sessao, Vcl.Dialogs, atividade_entity, System.JSON, System.SysUtils;
type

TAtividadeRepository = class(TInterfacedObject, IAtividadeRepository)

private

public

function GetAtividadeDataSet(aID : Integer) : TDataSet;
procedure Save(aModel: atividade_Model);
procedure Update (aModel : atividade_Model);
function FindByID(aID : Integer): atividade_Model;

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


procedure TAtividadeRepository.Update(aModel: atividade_Model);
begin
  with DataModule1.FDQueryAtividades do
  begin
    Close;
    SQL.Text :=
      'UPDATE atividades ' +
      'SET template_id = :TEMPLATE_ID, ' +
      '    professor_id = :PROFESSOR_ID, ' +
      '    descricao = :DESCRICAO, ' +
      '    title = :TITLE, ' +
      '    content_json = CAST(:CONTENT_JSON AS JSONB) ' +
      'WHERE id = :ID;';

    ParamByName('ID').AsInteger := aModel.GetID;
    ParamByName('TEMPLATE_ID').AsInteger := aModel.GetTemplateID;
    ParamByName('PROFESSOR_ID').AsInteger := aModel.GetProfessorID;
    ParamByName('TITLE').AsString := aModel.GetTitle;
    ParamByName('DESCRICAO').AsString := aModel.GetDescricao;
    ParamByName('CONTENT_JSON').AsString := aModel.GetContent_JSON.ToJSON;

    ExecSQL;
  end;
end;

function TAtividadeRepository.FindByID(aID: Integer): atividade_Model;
var
  LModel: atividade_Model;
begin
  LModel := atividade_Model.Create;
  with DataModule1.FDQueryAtividades do
  begin
    Close;
    SQL.Text :=
      'SELECT id, template_id, professor_id, title, descricao, content_json ' +
      'FROM atividades ' +
      'WHERE id = :id';
    ParamByName('id').AsInteger := aID;
    Open;

    if not IsEmpty then
    begin
      LModel.SetID(FieldByName('id').AsInteger);
      LModel.SetTemplateID(FieldByName('template_id').AsInteger);
      LModel.SetProfessorID(FieldByName('professor_id').AsInteger);
      LModel.SetTitle(FieldByName('title').AsString);
      LModel.SetDescricao(FieldByName('descricao').AsString);
      LModel.SetContent_JSON(
        TJSONObject.ParseJSONValue(FieldByName('content_json').AsString) as TJSONObject
      );
    end
    else
      FreeAndNil(LModel); // não encontrou, retorna nil
  end;

  Result := LModel;
end;


end.
