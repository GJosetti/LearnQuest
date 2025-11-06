unit turma_repository;

interface

uses
  my_contracts, turma_DTO, turma_entity,
  DMConnection, FireDAC.Stan.Param, Data.DB, vcl.Dialogs,
  FireDAC.Stan.Def, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.DApt,
  FireDAC.Stan.Intf, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, System.SysUtils,
  FireDAC.Comp.Client, Sessao;

type
  TTurmaRepository = class(TInterfacedObject, ITurmaRepository)
  private
    FConnection: TFDConnection;
    function RowToTurma(aQuery: TFDQuery): TTurmaModel;
  public
    constructor Create;

    function GetByID(aID: Integer): TTurmaModel;
    function FindByName(aNome: String): TTurmaModel;
    function GetTurmaDataSet: TDataSet;
    function GetParticipantesDataSet(aID: Integer): TDataSet;
    function GetEstudantesPorTurma(aTurmaID: Integer): TDataSet;

    procedure Salvar(aModel: TTurmaModel);
    procedure Update(aModel: TTurmaModel);
    procedure Delete(aID: Integer);
    procedure LinkEstudante(aEstudanteID, aTurmaID: Integer);
    procedure RemoverEstudanteDaTurma(aEstudanteID, aTurmaID: Integer);
  end;

implementation

{ TTurmaRepository }

constructor TTurmaRepository.Create;
begin
  if not Assigned(DataModule1) then
    raise Exception.Create('DataModule1 não existe');

  FConnection := DataModule1.FDConnection1;

  if not FConnection.Connected then
    FConnection.Connected := True;


  
end;

procedure TTurmaRepository.Delete(aID: Integer);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text := 'DELETE FROM turmas WHERE id = :ID';
    Qry.ParamByName('ID').AsInteger := aID;
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

procedure TTurmaRepository.RemoverEstudanteDaTurma(aEstudanteID, aTurmaID: Integer);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text :=
      'DELETE FROM estudante_turma WHERE estudante_id = :EID AND turma_id = :TID';
    Qry.ParamByName('EID').AsInteger := aEstudanteID;
    Qry.ParamByName('TID').AsInteger := aTurmaID;
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

function TTurmaRepository.RowToTurma(aQuery: TFDQuery): TTurmaModel;
var
  FTurma: TTurmaModel;
begin
  FTurma := TTurmaModel.Create;
  FTurma.SetID(aQuery.FieldByName('id').AsInteger);
  FTurma.SetNome(aQuery.FieldByName('turma_name').AsString);
  FTurma.SetDescricao(aQuery.FieldByName('descricao').AsString);
  FTurma.SetProfessorID(aQuery.FieldByName('professor_id').AsInteger);
  Result := FTurma;
end;

function TTurmaRepository.FindByName(aNome: String): TTurmaModel;
var
  Qry: TFDQuery;
begin
  Result := nil;
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text := 'SELECT * FROM turmas WHERE turma_name = :NAME';
    Qry.ParamByName('NAME').AsString := aNome;
    Qry.Open;

    if not Qry.IsEmpty then
      Result := RowToTurma(Qry);
  finally
    Qry.Free;
  end;
end;

function TTurmaRepository.GetByID(aID: Integer): TTurmaModel;
var
  Qry: TFDQuery;
begin
  Result := nil;
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text := 'SELECT * FROM turmas WHERE id = :ID';
    Qry.ParamByName('ID').AsInteger := aID;
    Qry.Open;

    if not Qry.IsEmpty then
      Result := RowToTurma(Qry);
  finally
    Qry.Free;
  end;
end;

procedure TTurmaRepository.Salvar(aModel: TTurmaModel);
var
  Qry: TFDQuery;
begin
  Qry := DataModule1.FDQuery1;
  try
    Qry.Connection := FConnection; // mesma instância usada no SetPathSchema
    Qry.SQL.Text :=
      'INSERT INTO turmas (turma_name, descricao, professor_id) ' +
      'VALUES (:NAME, :DESCR, :PID)';
    Qry.ParamByName('NAME').AsString := aModel.GetNome;
    Qry.ParamByName('DESCR').AsString := aModel.GetDescricao;
    Qry.ParamByName('PID').AsInteger := aModel.GetProfessorID;
    Qry.ExecSQL;
  finally

  end;
end;

procedure TTurmaRepository.Update(aModel: TTurmaModel);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text :=
      'UPDATE turmas SET turma_name = :NAME, descricao = :DESCR, professor_id = :PID WHERE id = :ID';
    Qry.ParamByName('NAME').AsString := aModel.GetNome;
    Qry.ParamByName('DESCR').AsString := aModel.GetDescricao;
    Qry.ParamByName('PID').AsInteger := aModel.GetProfessorID;
    Qry.ParamByName('ID').AsInteger := aModel.GetID;
    Qry.ExecSQL;
  finally

  end;
end;

procedure TTurmaRepository.LinkEstudante(aEstudanteID, aTurmaID: Integer);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text :=
      'INSERT INTO estudante_turma (estudante_id, turma_id) VALUES (:EID, :TID)';
    Qry.ParamByName('EID').AsInteger := aEstudanteID;
    Qry.ParamByName('TID').AsInteger := aTurmaID;
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

function TTurmaRepository.GetTurmaDataSet: TDataSet;
var
  Qry: TFDQuery;
begin
  // ✅ CRIA query temporária que será liberada pelo chamador
  Qry := TFDQuery.Create(nil);
  Qry.Connection := FConnection;
  Qry.SQL.Text :=
    'SELECT t.turma_name, t.descricao, u.user_name ' +
    'FROM turmas t ' +
    'JOIN professores p ON t.professor_id = p.id ' +
    'JOIN users u ON p.user_id = u.id';
  Qry.Open;
  Result := Qry;
  // ⚠️ ATENÇÃO: O chamador DEVE liberar esta query!
end;

function TTurmaRepository.GetParticipantesDataSet(aID: Integer): TDataSet;
var
  Qry: TFDQuery;
begin
  // ✅ CRIA query temporária ao invés de usar a do DataModule
  Qry := TFDQuery.Create(nil);
  Qry.Connection := FConnection;
  Qry.SQL.Text :=
    'SELECT u.user_name, r.descricao ' +
    'FROM estudante_turma t ' +
    'JOIN estudante e ON e.id = t.estudante_id ' +
    'JOIN users u ON u.id = e.user_id ' +
    'JOIN roles r ON r.id = u.user_role_id ' +
    'WHERE t.turma_id = :ID';
  Qry.ParamByName('ID').AsInteger := aID;
  Qry.Open;
  Result := Qry;
  // ⚠️ ATENÇÃO: O chamador DEVE liberar esta query!
end;

function TTurmaRepository.GetEstudantesPorTurma(aTurmaID: Integer): TDataSet;
begin
  Result := GetParticipantesDataSet(aTurmaID);
end;

end.
