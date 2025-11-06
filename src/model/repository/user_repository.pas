unit user_repository;

interface

uses
  my_contracts, users_entity,
  FireDAC.Comp.Client, FireDAC.Stan.Param, DMConnection, Sessao,
  System.Generics.Collections, Data.DB, System.SysUtils;

type
  TUserRepository = class(TInterfacedObject, IUserRepository)
  private
    FConnection: TFDConnection;
    function RowToUser(aQuery: TFDQuery): TUserModel;
  public
    constructor Create;

    function FindByID(aID: Integer): TUserModel;
    function FindByIDEscola(aID: Integer): TUserModel;
    function FindByNome(aNome: String): TUserModel;

    function Save(aModel: TUserModel): Integer;
    procedure Update(aModel: TUserModel);
    procedure Delete(aID: Integer);

    procedure SetPathSchema(aID: Integer);

    function GetUsersDataSet: TDataSet;
    function GetAll: TObjectList<TUserModel>;
    function GetAllAvailableForTurma(aIDTurma: Integer): TObjectList<TUserModel>;
  end;

implementation

{ TUserRepository }

constructor TUserRepository.Create;
begin
  FConnection := DataModule1.FDConnection1;
end;

function TUserRepository.RowToUser(aQuery: TFDQuery): TUserModel;
var
  FUserRepo: TUserModel;
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
  lst: TObjectList<TUserModel>;
  Qry: TFDQuery;
begin
  lst := TObjectList<TUserModel>.Create(True);
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text := 'SELECT * FROM users u JOIN estudante e ON u.id = e.user_id';
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

function TUserRepository.Save(aModel: TUserModel): Integer;
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text :=
      'INSERT INTO users (user_name, user_role_id, password, email, user_escola_id) ' +
      'VALUES (:NAME, :ROLE, :SENHA, :EMAIL, :ESCOLA) RETURNING id';
    Qry.ParamByName('NAME').AsString := aModel.GetNome;
    Qry.ParamByName('ROLE').AsInteger := aModel.GetRole;
    Qry.ParamByName('SENHA').AsString := aModel.GetPassword;
    Qry.ParamByName('EMAIL').AsString := aModel.GetEmail;
    Qry.ParamByName('ESCOLA').AsInteger := aModel.GetEscola;
    Qry.Open;

    Result := Qry.FieldByName('id').AsInteger;
  finally
    Qry.Free;
  end;
end;

procedure TUserRepository.SetPathSchema(aID: Integer);
var
  Qry: TFDQuery;
  SchemaName: string;
begin

  Qry := DataModule1.FDQuery1;
  try
     if not Assigned(FConnection) then
  raise Exception.Create('FConnection não está atribuído.');

if not FConnection.Connected then
  raise Exception.Create('FConnection não está conectado.');
    Qry.Connection := FConnection;
    Qry.SQL.Text :=
      'SELECT t.schema_name ' +
      'FROM users u ' +
      'JOIN tenants t ON t.id = u.user_escola_id ' +
      'WHERE u.id = :users_id';
    Qry.ParamByName('users_id').AsInteger := aID;
    Qry.Open;

    if not Qry.IsEmpty then
    begin
      SchemaName := Qry.FieldByName('schema_name').AsString;
      FConnection.ExecSQL('SET search_path TO ' + SchemaName + ', public');
      FPathSchema := SchemaName;
    end;
  finally
 //   Qry.Free;
  end;
end;

procedure TUserRepository.Update(aModel: TUserModel);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text :=
      'UPDATE users SET user_name = :NAME, password = :SENHA, email = :EMAIL WHERE id = :ID';
    Qry.ParamByName('NAME').AsString := aModel.GetNome;
    Qry.ParamByName('SENHA').AsString := aModel.GetPassword;
    Qry.ParamByName('EMAIL').AsString := aModel.GetEmail;
    Qry.ParamByName('ID').AsInteger := aModel.GetID;
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

procedure TUserRepository.Delete(aID: Integer);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text := 'DELETE FROM users WHERE id = :ID';
    Qry.ParamByName('ID').AsInteger := aID;
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

function TUserRepository.FindByID(aID: Integer): TUserModel;
var
  Qry: TFDQuery;
begin
  Result := nil;
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text := 'SELECT * FROM users WHERE id = :ID';
    Qry.ParamByName('ID').AsInteger := aID;
    Qry.Open;

    if not Qry.IsEmpty then
      Result := RowToUser(Qry);
  finally
    Qry.Free;
  end;
end;

function TUserRepository.FindByIDEscola(aID: Integer): TUserModel;
var
  Qry: TFDQuery;
begin
  Result := nil;
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text := 'SELECT * FROM users WHERE user_escola_id = :ID';
    Qry.ParamByName('ID').AsInteger := aID;
    Qry.Open;

    if not Qry.IsEmpty then
      Result := RowToUser(Qry);
  finally
    Qry.Free;
  end;
end;

function TUserRepository.FindByNome(aNome: String): TUserModel;
var
  Qry: TFDQuery;
begin
  Result := nil;
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text := 'SELECT * FROM users WHERE user_name = :NAME';
    Qry.ParamByName('NAME').AsString := aNome;
    Qry.Open;

    if not Qry.IsEmpty then
      Result := RowToUser(Qry);
  finally
    Qry.Free;
  end;
end;

function TUserRepository.GetUsersDataSet: TDataSet;
var
  Qry: TFDQuery;
begin
  Qry := DataModule1.FDQuery1;
  Qry.Connection := FConnection;
  Qry.SQL.Text :=
    'SELECT u.user_name, u.email, r.descricao ' +
    'FROM users u ' +
    'JOIN roles r ON u.user_role_id = r.id ' +
    'WHERE user_escola_id = :ESCOLA';
  Qry.ParamByName('ESCOLA').AsInteger := UsuarioLogado.Escola;
  Qry.Open;
  Result := Qry; // ⚠️ Chamador deve liberar este dataset após o uso
end;

end.

