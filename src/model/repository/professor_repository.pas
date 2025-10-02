unit professor_repository;

interface
uses my_contracts, professor_entity,DMConnection,FireDAC.Comp.Client;

type

TProfessorRepository = class(TInterfacedObject, IProfessorRepository)

private
    FConnection: TFDConnection;
public
    function GetByID (aID : Integer): TProfessorModel;
    procedure Salvar(aModel: TProfessorModel);
    function GetUserByID (aID: Integer): TProfessorModel;
    procedure Update(aDto : TProfessorModel);
    procedure Delete (aID: Integer);
    constructor Create();
end;


implementation

{ TProfessorRepository }

constructor TProfessorRepository.Create;
begin
   FConnection := DataModule1.FDConnection1;
end;

procedure TProfessorRepository.Delete(aID: Integer);
begin

end;

function TProfessorRepository.GetByID(aID: Integer): TProfessorModel;
begin

end;

function TProfessorRepository.GetUserByID(aID: Integer): TProfessorModel;
begin

end;

procedure TProfessorRepository.Salvar(aModel: TProfessorModel);
var Qry : TFDQuery;
SchemaName : String;
SQL : String;
begin
  Qry:= TFDQuery.Create(nil);
 try
  Qry.Connection := FConnection;
  Qry.SQL.Text := 'insert into professores(user_id)' + 'values (:ID)';
  Qry.ParamByName('ID').AsInteger := aModel.GetUserID;
  Qry.ExecSQL;

  Qry.SQL.Clear;

 finally
  Qry.Free;
 end;


end;
procedure TProfessorRepository.Update(aDto: TProfessorModel);
begin

end;

end.
