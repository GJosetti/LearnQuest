unit turma_repository;

interface
uses my_contracts, turma_DTO,turma_entity, DMConnection, FireDAC.Comp.Client,FireDAC.Stan.Param, FireDAC.DApt,Data.DB, vcl.Dialogs, System.SysUtils;
type

TTurmaRepository = class(TInterfacedObject, ITurmaRepository)

private
    FConnection: TFDConnection;
    function RowToTurma(aQuery : TFDQuery) : TTurmaModel;
public


function GetByID (aID : Integer): TTurmaModel;
    procedure Salvar(aModel: TTurmaModel);
    procedure Update(aModel : TTurmaModel);
    procedure Delete (aID: Integer);
    procedure LinkEstudante (aID: Integer);
    function GetTurmaDataSet: TDataSet;
    function FindByName (aNome : String): TTurmaModel;
    constructor Create();
end;


implementation

{ TTurmaRepository }

constructor TTurmaRepository.Create();
begin
  
  FConnection := DataModule1.FDConnection1;
end;

procedure TTurmaRepository.Delete(aID: Integer);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text := 'delete from turmas where id = :ID';
    Qry.ParamByName('ID').AsInteger := aID;
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

function TTurmaRepository.RowToTurma(aQuery: TFDQuery): TTurmaModel;
var FTurma : TTurmaModel;
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
Qry : TFDQuery;
begin
Qry := TFDQuery.Create(nil);
 try
  Qry.Connection := FConnection;
  Qry.SQL.Text := 'Select * From turmas WHERE turma_name = :NAME';
  Qry.ParamByName('NAME').AsString := aNome;
  Qry.Open();

  if not Qry.IsEmpty then begin
    Result := RowToTurma(Qry);
  end;

 finally
  Qry.Free;
 end;

end;

function TTurmaRepository.GetByID(aID: Integer): TTurmaModel;
begin

end;

function TTurmaRepository.GetTurmaDataSet: TDataSet;
begin
  DataModule1.FDQuery1.Close;

  DataModule1.FDQuery1.SQL.Text:= 'SELECT t.turma_name , t.descricao, u.user_name FROM turmas t JOIN professores p ON t.professor_id = p.id JOIN users u ON p.user_id = u.id';
  DataModule1.FDQuery1.Open;
  Result := DataModule1.FDQuery1;
end;

procedure TTurmaRepository.LinkEstudante(aID: Integer);
begin

end;



procedure TTurmaRepository.Salvar(aModel: TTurmaModel);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try

    Qry.Connection := FConnection;
    Qry.SQL.Text := 'INSERT INTO turmas (turma_name, descricao, professor_id) ' +
                    'VALUES (:NAME, :DESCR, :PID)';
    Qry.ParamByName('NAME').AsString := aModel.GetNome;
    Qry.ParamByName('DESCR').AsString := aModel.GetDescricao;
    Qry.ParamByName('PID').AsInteger := aModel.GetProfessorID;
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;


procedure TTurmaRepository.Update(aModel: TTurmaModel);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text := 'UPDATE turmas SET turma_name = :NAME, descricao = :DESCRIC, professor_ID = :PID where id = :ID';

    Qry.ParamByName('NAME').AsString := aModel.GetNome;
    Qry.ParamByName('DESCRIC').AsString := aModel.GetDescricao;
    Qry.ParamByName('PID').AsInteger := aModel.GetProfessorID;
    Qry.ParamByName('ID').AsInteger := aModel.GetID;
    Qry.ExecSQL;
  finally
    Qry.Free;
    aModel.Free;
  end;
end;


end.
