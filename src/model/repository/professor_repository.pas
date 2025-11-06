unit professor_repository;

interface
uses my_contracts,System.Classes, professor_entity,DMConnection,FireDAC.Comp.Client;

type

TProfessorRepository = class(TInterfacedObject, IProfessorRepository)

private
    FConnection: TFDConnection;
public
    function GetByID (aID : Integer): TProfessorModel;
    procedure Salvar(aModel: TProfessorModel);
    function GetUserByID (aID: Integer): TProfessorModel;
    function FindByName(aString : String): TProfessorModel;
    procedure Update(aDto : TProfessorModel);
    procedure Delete (aID: Integer);
    function GetAllNames : TStringList;
    constructor Create();
    function GetIdByUserId(AUserId: Integer): Integer;
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

function TProfessorRepository.FindByName(aString: String): TProfessorModel;
var
Qry : TFDQuery;
FModel : TProfessorModel;
begin
  Result := nil;
  Qry:= TFDQuery.Create(nil);
 try
  Qry.Connection := FConnection;
  Qry.SQL.Text := 'Select p.id, p.user_id From professores p join users u ON u.id = p.user_id WHERE user_name = :NAME';
  Qry.ParamByName('NAME').AsString := aString;

  Qry.Open();


  if not Qry.IsEmpty then begin
    FModel := TProfessorModel.Create;
    Fmodel.SetID(Qry.FieldByName('id').AsInteger);
    FModel.SetUserID(Qry.FieldByName('user_id').AsInteger);
    Result := FModel;
  end;

 finally

 end;

end;
function TProfessorRepository.GetAllNames: TStringList;
var
Qry : TFDQuery;
SQL : String;
sL : TStringList;
begin
  Qry := DataModule1.FDQueryProfessores;
  sL := TStringList.Create;
try
  Qry.Connection := FConnection;
  Qry.SQL.Text := 'SELECT u.user_name FROM professores p JOIN users u ON u.id = p.user_id';
  Qry.Open();
  while not Qry.Eof do begin
    sL.Add(Qry.FieldByName('user_name').AsString);
    Qry.Next;
  end;

  Result := sL;

finally

end;



end;


function TProfessorRepository.GetByID(aID: Integer): TProfessorModel;
begin

end;

function TProfessorRepository.GetIdByUserId(AUserId: Integer): Integer;
var
Qry : TFDQuery;
ID : Integer;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text := 'SELECT id FROM professores WHERE user_id = :ID';
    Qry.ParamByName('ID').AsInteger := AUserId;
    Qry.Open();
    ID := Qry.FieldByName('id').AsInteger;
    Result := ID;
  finally
    Qry.Close;
  end;

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
  aModel.Free;
 end;


end;
procedure TProfessorRepository.Update(aDto: TProfessorModel);
begin

end;

end.
