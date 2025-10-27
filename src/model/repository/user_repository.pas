  unit user_repository;

interface
uses my_contracts, users_entity, FireDAC.Comp.Client, DMConnection,Sessao, VCL.Dialogs, Data.DB, System.Generics.Collections;

type
TUserRepository = class(TInterfacedObject,IUserRepository)

  private

  FConnection : TFDConnection;
  function RowToUser(aQuery: TFDQuery): TUserModel;

  public
    function FindByID(aID: Integer) : TUserModel;
    function FindByIDEscola(aID: Integer) : TUserModel;
    function FindByNome(aNome: String) : TUserModel;
    function Save (aModel : TUserModel) : Integer;
    constructor Create();
    procedure Update(aModel: TUserModel);
    procedure Delete (aID: Integer);
    procedure SetPathSchema (aID : Integer);
    function GetUsersDataSet: TDataSet;
    function GetAll : TObjectList<TUserModel>;
    function GetAllAvailableForTurma(aIDTurma: Integer): TObjectList<TUserModel>;
end;


implementation


constructor TUserRepository.Create();
begin
    FConnection := DataModule1.FDConnection1;
end;

function TUserRepository.RowToUser(aQuery: TFDQuery): TUserModel;
var FUserRepo : TUserModel;
begin
  FUserRepo := TUserModel.Create;
  FUserRepo.SetID(aQuery.FieldByName('id').AsInteger);
  FUserRepo.SetNome(aQuery.FieldByName('user_name').AsString);
  FUserRepo.SetPassword(aQuery.FieldByName('password').AsString);
  FUserRepo.SetEmail(aQuery.FieldByName('email').AsString);
  FUserRepo.SetRole(aQuery.FieldByName('user_role_id').AsInteger);
  FUserRepo.SetEscola(aQuery.FieldByName('user_escola_id').AsInteger);
  Result := FUserRepo;


end;

function TUserRepository.GetAll: TObjectList<TUserModel>;
var
lst : TObjectList<TUserModel>;
Qry : TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  lst := TObjectList<TUserModel>.Create;
try
  Qry.Connection := FConnection;
  Qry.SQL.Text := 'SELECT * FROM users u JOIN estudante e ON u.id = e.user_id';
  Qry.Open();
  while not Qry.Eof do begin
    lst.Add(RowToUser(Qry));
    Qry.Next;
  end;

  Result := lst;

finally
  Qry.Free;
  end;
end;



function TUserRepository.GetAllAvailableForTurma(aIDTurma: Integer): TObjectList<TUserModel>;
var
  lst: TObjectList<TUserModel>;
  Qry: TFDQuery;
begin
  lst := TObjectList<TUserModel>.Create(True);
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text :=
      'SELECT u.*, e.id AS estudante_id ' +
      'FROM users u ' +
      'JOIN estudante e ON u.id = e.user_id ' +
      'WHERE NOT EXISTS ( ' +
      '  SELECT 1 FROM estudante_turma te ' +
      '  WHERE te.estudante_id = e.id ' +
      '  AND te.turma_id = :IDTurma ' +
      ')';

    Qry.ParamByName('IDTurma').AsInteger := aIDTurma;
    Qry.Open;

    while not Qry.Eof do
    begin
      lst.Add(RowToUser(Qry));
      Qry.Next;
    end;

    Result := lst;
  finally
    Qry.Free;
  end;
end;


function TUserRepository.Save(aModel: TUserModel) : Integer;
var Qry : TFDQuery;
FID : Integer;
SchemaName : String;
SQL : String;
begin
  Qry:= TFDQuery.Create(nil);
 try
  Qry.Connection := FConnection;
  Qry.SQL.Text := 'insert into users (user_name,user_role_id, password, email, user_escola_id)' + 'values (:NAME ,:ROLE,:SENHA ,:EMAIL ,:ESCOLA ) RETURNING id';
  Qry.ParamByName('NAME').AsString := aModel.GetNome;
  Qry.ParamByName('ROLE').AsInteger := aModel.GetRole;
  Qry.ParamByName('SENHA').AsString := aModel.GetPassword;
  Qry.ParamByName('EMAIL').AsString := aModel.GetEmail;
  Qry.ParamByName('ESCOLA').AsInteger := aModel.GetEscola;
  Qry.Open;
  FID := Qry.FieldByName('id').AsInteger;
  Qry.SQL.Clear;
  Qry.Close;

  Result := FID;
 finally
  Qry.Free;
 end;


end;

procedure TUserRepository.SetPathSchema(aID: Integer);
var
  Qry: TFDQuery;
  SchemaName: string;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text :=
      'SELECT t.schema_name ' +
      '  FROM users u ' +
      '  JOIN tenants t ON t.id = u.user_escola_id ' +
      ' WHERE u.id = :users_id';
    Qry.ParamByName('users_id').AsInteger := aID;
    Qry.Open;

    if not Qry.IsEmpty then
    begin
      SchemaName := Qry.FieldByName('schema_name').AsString;


      FConnection.ExecSQL(
        'SET search_path TO ' + SchemaName + ', public'
      );

    //Teste de Schema
  //      Qry.Close;
  //      Qry.SQL.Text := 'SHOW search_path';
  //      Qry.Open;
  //      ShowMessage(Qry.Fields[0].AsString);

      //Guarda na sessão atual
      FPathSchema := SchemaName;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TUserRepository.Update(aModel: TUserModel);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text := 'UPDATE users SET user_name = :NAME, password = :SENHA, email = :EMAIL where id = :ID';

    Qry.ParamByName('NAME').AsString := aModel.GetNome;
    Qry.ParamByName('SENHA').AsString := aModel.GetPassword;
    Qry.ParamByName('ID').AsInteger := aModel.GetID;
    Qry.ParamByName('EMAIL').AsString := aModel.GetEmail;
    Qry.ExecSQL;
  finally
    Qry.Free;
    aModel.Free;
  end;
end;

procedure TUserRepository.Delete(aID: Integer);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text := 'delete from users where id = :ID';
    Qry.ParamByName('ID').AsInteger := aID;
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

{ TLoginRepository }

function TUserRepository.FindByID(aID: Integer): TUserModel;
var Qry : TFDQuery;
begin
  Result := nil;
  Qry:= TFDQuery.Create(nil);
 try
  Qry.Connection := FConnection;
  Qry.SQL.Text := 'Select * From users WHERE id = :ID';
  Qry.ParamByName('ID').AsInteger := aID;
  Qry.Open();

  if not Qry.IsEmpty then begin
    Result := RowToUser(Qry);
  end;

 finally
  Qry.Free;
 end;

end;


function TUserRepository.FindByIDEscola(aID: Integer): TUserModel;
var Qry : TFDQuery;
begin
  Result := nil;
  Qry:= TFDQuery.Create(nil);
 try
  Qry.Connection := FConnection;
  Qry.SQL.Text := 'Select * From users WHERE user_escola_id = :ID';
  Qry.ParamByName('ID').AsInteger := aID;
  Qry.Open();

  if not Qry.IsEmpty then begin
    Result := RowToUser(Qry);
  end;

 finally
  Qry.Free;
 end;

end;

function TUserRepository.FindByNome(aNome: String): TUserModel;
var Qry : TFDQuery;
begin
  Result := nil;
  Qry:= TFDQuery.Create(nil);
 try
  Qry.Connection := FConnection;
  Qry.SQL.Text := 'Select * From users WHERE user_name = :NAME';
  Qry.ParamByName('NAME').AsString := aNome;
  Qry.Open();

  if not Qry.IsEmpty then begin
    Result := RowToUser(Qry);
  end;

 finally
  Qry.Free;
 end;

end;



function TUserRepository.GetUsersDataSet: TDataSet;
begin
  DataModule1.FDQuery1.Close;
  DataModule1.FDQuery1.SQL.Text := 'SELECT u.user_name, u.email, r.descricao FROM users u join roles r ON u.user_role_id = r.id WHERE user_escola_id = :ESCOLA ';
  DataModule1.FDQuery1.ParamByName('ESCOLA').AsInteger := UsuarioLogado.Escola;
  DataModule1.FDQuery1.Open;
  Result := DataModule1.FDQuery1;
end;

end.
