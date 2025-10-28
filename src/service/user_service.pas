unit user_service;

interface
uses my_contracts, Vcl.Dialogs,user_DTO, users_entity, SysUtils, user_repository, Data.DB, System.Generics.Collections,System.Classes, uLogger,Sessao;

type
TUserService = class(TInterfacedObject,IUserService)

private
  var FUserRepository : IUserRepository;
  var Logger : TLogger;

public
  function GetByID(aID: Integer): TUserDTO;
  function GetByEscolaID (aID: Integer): TuserDTO;
  function ValidarLogin(aDTO: TUserDTO):TUserDTO;
  function Salvar(aDTO: TUserDTO) : Integer;
  constructor Create();
  procedure Update(aDto : TUserDTO);
  procedure Delete (aID: Integer);
  procedure SetPathByEscola (aID: Integer);
  function AtualizarTabelaUsuarios : TDataSet;
  function GetByNome (aString : String) : TUserDTO;
  function GetAll : TObjectList<TUserModel>;
  function GetAllForTurmas(aID : Integer) : TObjectList<TUserModel>;
end;




implementation
uses DMConnection;


{ TUserService }



function TUserService.AtualizarTabelaUsuarios: TDataSet;
begin
  Result := FUserRepository.GetUsersDataSet;
end;

constructor TUserService.Create();
begin

  Logger := TLogger.Create;
  if not Assigned(FUserRepository) then begin
    FUserRepository := TUserRepository.Create();
  end;


end;

procedure TUserService.Delete(aID: Integer);
var
FName : String;
begin
  //Validações
  FName := FUserRepository.FindByID(aID).GetNome;
  FUserRepository.Delete(aID);

  Logger.Log(FPathSchema,'Deletou o usuário ' + FName + ' do sistema',UsuarioLogado);
end;

function TUserService.GetAll : TObjectList<TUserModel>;
var
lst :TObjectList<TUserModel>;
begin


  lst :=  FUserRepository.GetAll;
  Result := lst;

end;

function TUserService.GetAllForTurmas(aID : Integer): TObjectList<TUserModel>;
begin
  Result := FUserRepository.GetAllAvailableForTurma(aID);
end;

function TUserService.GetByEscolaID(aID: Integer): TuserDTO;
var FResultDTO : TUserDTO;
var FUserModel : TUserModel;
begin
  try
    FUserModel := FUserRepository.FindByIDEscola(aID);
    if FuserModel <> nil then begin
      FResultDTO := TUserDTO.Create;
      FResultDTO.ID := FUserModel.GetID;
      FResultDTO.Name := FUserModel.GetNome;
      FResultDTO.Role := FUserModel.GetRole;
      FResultDTO.Password := FUserModel.GetPassword;
      FResultDTO.Email := FUserModel.GetEmail;
    Result := FResultDTO;

    end else begin
      Result := nil;
    end;


  finally
    FUserModel.Free;
  end;
end;


function TUserService.GetByID (aID : Integer): TUserDTO;
var FResultDTO : TUserDTO;
var FUserModel : TUserModel;
begin
  try
    FUserModel := FUserRepository.FindByID(aID);
    FResultDTO := TUserDTO.Create;
    FResultDTO.Name := FUserModel.GetNome;
    FResultDTO.Role := FUserModel.GetRole;
    FResultDTO.Password := FUserModel.GetPassword;
    FResultDTO.Escola := FUserModel.GetEscola;
    FResultDTO.Email := FUserModel.GetEmail;

    Result := FResultDTO;

  finally
    FUserModel.Free;
  end;
end;


function TUserService.GetByNome(aString: String): TUserDTO;
var
FUser : TUserModel;
FUserDto : TUserDTO;
begin

  FUser := FUserRepository.FindByNome(aString);
  FUserDTO := TUserDTO.Create;

  FuserDTO.Name := FUser.GetNome;
  FUserDTO.ID := FUser.GetID;
  FUserDTO.Role := Fuser.GetRole;
  FUserDTO.Escola := FUser.GetEscola;
  FUserDTO.Email := FUser.GetEmail;
  Result := FUserDTO;

end;

function TUserService.Salvar(aDTO: TUserDTO) : Integer;

var FUsuario : TUserModel;
begin

  if (FUserRepository.FindByNome(aDTO.Name) <> nil) then begin
    raise Exception.Create('Já existe um usuário com esse Nome');
  end;


  FUsuario := TUserModel.Create;
  FUsuario.SetNome(aDTO.Name);
  FUsuario.SetPassword(aDTO.Password);
  FUsuario.SetRole(aDTO.Role);
  FUsuario.SetEmail(aDTO.Email);
  FUsuario.SetEscola(aDTO.Escola);


  Logger.Log(FPathSchema,'Adicionou o usuario ' + FUsuario.GetNome + ' no sistema',UsuarioLogado);

  Result := FUserRepository.Save(FUsuario);

end;

procedure TUserService.SetPathByEscola(aID: Integer);
begin
  FUserRepository.SetPathSchema(aID);
end;

procedure TUserService.Update(aDto: TUserDTO);
var
FUsuario : TUserModel;
begin
  FUsuario := TUserModel.Create;
  FUsuario.SetID(aDto.ID);
  FUsuario.SetNome(aDTO.Name);
  FUsuario.SetPassword(aDTO.Password.GetHashCode.ToString);
  FUsuario.SetEmail(aDTO.Email);

  FUserRepository.Update(FUsuario);

  Logger.Log(FPathSchema,'Atualizou as informações do usuário '+aDTO.Name+'(de ID '+ aDto.ID.ToString+') no sistema',UsuarioLogado);
end;

function TUserService.ValidarLogin(aDTO: TUserDTO): TUserDTO;

var hash: String;

var FUser: TUserModel;
var FUserDTO: TUserDTO;

begin

try
  //Verificações de preenchimento --------
  if Trim(aDto.Name) = '' then begin

  end;
  if Trim(aDTO.Password) = '' then begin

  end;
  //----------


  hash := aDto.Password.GetHashCode.ToString;

  FUser := FUserRepository.FindByNome(aDTO.Name);


  if (FUser = nil) or (FUser.GetPassword <> hash)  then begin
    Result := nil;
  end else begin
    FUserDTO := TUserDTO.Create;

    FuserDTO.Name := FUser.GetNome;
    FUserDTO.ID := FUser.GetID;
    FUserDTO.Role := Fuser.GetRole;
    FUserDTO.Escola := FUser.GetEscola;
    FUserDTO.Email := FUser.GetEmail;

    SetPathByEscola(FUserDTO.ID);

    Logger.Log(FPathSchema,'Logou no sistema', FUserDTO);

    Result := FUserDTO;
  end;
finally

end;






end;

end.
