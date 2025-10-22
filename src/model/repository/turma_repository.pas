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


begin
  try
     DataModule1.FDQueryTurmas.Connection := FConnection;
     DataModule1.FDQueryTurmas.SQL.Text := 'delete from turmas where id = :ID';
     DataModule1.FDQueryTurmas.ParamByName('ID').AsInteger := aID;
     DataModule1.FDQueryTurmas.ExecSQL;
  finally

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

begin

 try
   DataModule1.FDQueryTurmas.Connection := FConnection;
   DataModule1.FDQueryTurmas.SQL.Text := 'Select * From turmas WHERE turma_name = :NAME';
   DataModule1.FDQueryTurmas.ParamByName('NAME').AsString := aNome;
   DataModule1.FDQueryTurmas.Open();

  if not  DataModule1.FDQueryTurmas.IsEmpty then begin
    Result := RowToTurma( DataModule1.FDQueryTurmas);
  end;

 finally
   DataModule1.FDQueryTurmas.Close;

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

begin

  try
    if not Assigned(FConnection) then
  raise Exception.Create('Conexão FConnection está nula!');
if not FConnection.Connected then
  raise Exception.Create('Conexão FConnection não está ativa!');

    if not Assigned(DataModule1) then
  raise Exception.Create('DataModule1 não foi criado!');

if not Assigned(DataModule1.FDQueryTurmas) then
  raise Exception.Create('FDQueryTurmas não foi criado!');



    DataModule1.FDQueryTurmas.Connection := FConnection;
     DataModule1.FDQueryTurmas.SQL.Text := 'INSERT INTO turmas (turma_name, descricao, professor_id) ' +
                    'VALUES (:NAME, :DESCR, :PID)';
     DataModule1.FDQueryTurmas.ParamByName('NAME').AsString := aModel.GetNome;
     DataModule1.FDQueryTurmas.ParamByName('DESCR').AsString := aModel.GetDescricao;
     DataModule1.FDQueryTurmas.ParamByName('PID').AsInteger := aModel.GetProfessorID;
     DataModule1.FDQueryTurmas.ExecSQL;
  finally



  end;
end;


procedure TTurmaRepository.Update(aModel: TTurmaModel);

begin

  try
     DataModule1.FDQueryTurmas.Connection := FConnection;
     DataModule1.FDQueryTurmas.SQL.Text := 'UPDATE turmas SET turma_name = :NAME, descricao = :DESCRIC, professor_ID = :PID where id = :ID';

     DataModule1.FDQueryTurmas.ParamByName('NAME').AsString := aModel.GetNome;
     DataModule1.FDQueryTurmas.ParamByName('DESCRIC').AsString := aModel.GetDescricao;
     DataModule1.FDQueryTurmas.ParamByName('PID').AsInteger := aModel.GetProfessorID;
     DataModule1.FDQueryTurmas.ParamByName('ID').AsInteger := aModel.GetID;
     DataModule1.FDQueryTurmas.ExecSQL;
  finally


  end;
end;


end.
