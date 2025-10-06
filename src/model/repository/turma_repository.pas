unit turma_repository;

interface
uses my_contracts, turma_DTO,turma_entity, DMConnection, FireDAC.Comp.Client;
type

TTurmaRepository = class(TInterfacedObject, ITurmaRepository)

private
    FConnection: TFDConnection;
public


function GetByID (aID : Integer): TTurmaModel;
    procedure Salvar(aModel: TTurmaModel);
    procedure Update(aModel : TTurmaModel);
    procedure Delete (aID: Integer);
    procedure LinkEstudante (aID: Integer);
    constructor Create;
end;


implementation

{ TTurmaRepository }

constructor TTurmaRepository.Create;
begin
  FConnection := DataModule1.FDConnection1;
end;

procedure TTurmaRepository.Delete(aID: Integer);
begin

end;

function TTurmaRepository.GetByID(aID: Integer): TTurmaModel;
begin

end;

procedure TTurmaRepository.LinkEstudante(aID: Integer);
begin

end;

procedure TTurmaRepository.Salvar(aModel: TTurmaModel);
var
Qry : TFDQuery;
SQL : String;
begin
  Qry:= TFDQuery.Create(nil);
 try
  Qry.Connection := FConnection;
  Qry.SQL.Text := 'insert into turmas (turma_name,descricao,professor_id)' + 'values (:NAME ,:DESC,:PID)';
  Qry.ParamByName('NAME').AsString := aModel.GetNome;
  Qry.ParamByName('DESC').AsString := aModel.GetDescricao;
  Qry.ParamByName('PID').AsInteger := aModel.GetProfessorID;
  Qry.ExecSQL;
 finally
  Qry.Free;
 end;


end;

procedure TTurmaRepository.Update(aModel: TTurmaModel);
begin

end;

end.
