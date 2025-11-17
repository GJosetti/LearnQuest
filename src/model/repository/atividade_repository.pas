unit atividade_repository;

interface
uses my_contracts,Data.DB, DMConnection, Sessao, Vcl.Dialogs, atividade_entity, System.JSON, System.SysUtils, FireDAC.Comp.Client;
type

TAtividadeRepository = class(TInterfacedObject, IAtividadeRepository)

private

public

function GetAtividadeDataSet(aID : Integer) : TDataSet;
procedure Save(aModel: atividade_Model);
procedure Update (aModel : atividade_Model);
function FindByID(aID : Integer): atividade_Model;
function GetAtividadesByUserID(AUserID: Integer): TDataSet;
procedure SalvarRegistro(AEstudanteID, AAtividadeTurmaID: Integer; AResult: Boolean);
procedure Delete(aID : Integer);

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
      '  m.name, ' +
      '  a.title AS atividade_nome, ' +
      '  t.name AS template_nome, ' +
      '  a.created_at ' +
      'FROM atividades a ' +
      'LEFT JOIN public.activity_template t ON a.template_id = t.id ' +
      'INNER JOIN materias m ON a.materia_id = m.id ' +
      'WHERE a.professor_id = :PROF ' +
      'ORDER BY a.created_at DESC;';



    ParamByName('PROF').AsInteger := aID;
    DataModule1.FDQuery1.Open;

    Result := DataModule1.FDQuery1;
  end;
end;


procedure TAtividadeRepository.SalvarRegistro(
  AEstudanteID, AAtividadeTurmaID: Integer; AResult: Boolean);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := DataModule1.FDConnection1;

    Qry.SQL.Text :=
      'INSERT INTO atividade_estudante ' +
      '  (estudante_id, atividade_turma_id, sucess, completed_at) ' +
      'VALUES (:ESTUDANTE_ID, :ATIVIDADE_TURMA_ID, :SUCESS, NOW())';

    Qry.ParamByName('ESTUDANTE_ID').AsInteger := AEstudanteID;
    Qry.ParamByName('ATIVIDADE_TURMA_ID').AsInteger := AAtividadeTurmaID;
    Qry.ParamByName('SUCESS').AsBoolean := AResult;

    Qry.ExecSQL;

  except
    on E: Exception do
      ShowMessage('Erro ao salvar registro da atividade: ' + E.Message);
  end;

  FreeAndNil(Qry);
end;

procedure TAtividadeRepository.Save(aModel: atividade_Model);
begin
  with DataModule1.FDQueryAtividades do
  begin
    Close;
    SQL.Text :=
      'INSERT INTO atividades (template_id, professor_id,descricao, title, content_json, materia_id) ' +
      'VALUES (:TEMPLATE_ID, :PROFESSOR_ID,:DESCRICAO, :TITLE, CAST(:CONTENT_JSON AS JSONB), :MATERIA_ID);';

    ParamByName('TEMPLATE_ID').AsInteger := aModel.GetTemplateID;
    ParamByName('PROFESSOR_ID').AsInteger := aModel.GetProfessorID;
    ParamByName('TITLE').AsString := aModel.GetTitle;
    ParamByName('DESCRICAO').AsString := aModel.GetDescricao;
    ParamByName('CONTENT_JSON').AsString := aModel.GetContent_JSON.ToJSON;
    ParamByName('MATERIA_ID').AsInteger := aModel.GetMateriaID;

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
      '    content_json = CAST(:CONTENT_JSON AS JSONB), materia_id = :MATERIA_ID ' +
      'WHERE id = :ID;';

    ParamByName('ID').AsInteger := aModel.GetID;
    ParamByName('TEMPLATE_ID').AsInteger := aModel.GetTemplateID;
    ParamByName('PROFESSOR_ID').AsInteger := aModel.GetProfessorID;
    ParamByName('TITLE').AsString := aModel.GetTitle;
    ParamByName('DESCRICAO').AsString := aModel.GetDescricao;
    ParamByName('CONTENT_JSON').AsString := aModel.GetContent_JSON.ToJSON;
    ParamByName('MATERIA_ID').AsInteger := aModel.GetMateriaID;

    ExecSQL;
  end;
end;

procedure TAtividadeRepository.Delete(aID: Integer);
var
Qry : TFDQuery;

begin
  Qry := DataModule1.FDQueryAtividades;
  try
    Qry.SQL.Text := 'Delete from atividades WHERE id = :ID';
    Qry.ParamByName('ID').AsInteger := aID;
    Qry.ExecSQL
  finally
    Qry.Free;
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

function TAtividadeRepository.GetAtividadesByUserID(AUserID: Integer): TDataSet;
var
  Qry: TFDQuery;
begin
  Qry := DataModule1.FDQueryAtividadesParaEstudante;
  Qry.Close;
  Qry.SQL.Clear;
  Qry.Connection := DataModule1.FDConnection1;

  Qry.SQL.Text :=
    'SELECT a.id AS atividade_id, ' +
    '       at.id AS atividade_turma_id, ' +  // ✅ ADICIONA ESSA LINHA
    '       a.title, ' +
    '       a.descricao, ' +
    '       a.created_at, ' +
    '       t.turma_name, ' +
    '       p.id AS professor_id ' +
    'FROM atividades a ' +
    'JOIN atividade_turma at ON at.atividade_id = a.id ' +
    'JOIN turmas t ON t.id = at.turma_id ' +
    'JOIN professores p ON p.id = t.professor_id ' +
    'JOIN estudante_turma et ON et.turma_id = t.id ' +
    'JOIN estudante e ON e.id = et.estudante_id ' +
    'JOIN public.users u ON u.id = e.user_id ' +
    'WHERE u.id = :USER_ID ' +
    '  AND NOT EXISTS ( ' +
    '      SELECT 1 FROM atividade_estudante ae ' +
    '      WHERE ae.estudante_id = e.id ' +
    '        AND ae.atividade_turma_id = at.id ' +
    '  ) ' +
    'ORDER BY a.created_at DESC;';

  Qry.ParamByName('USER_ID').AsInteger := AUserID;
  Qry.Open;

  Result := Qry;
end;


end.
