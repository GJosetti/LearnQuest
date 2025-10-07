unit user_service;

interface
uses my_contracts, Vcl.Dialogs,user_DTO, users_entity, SysUtils, user_repository, Data.DB;

type
TUserService = class(TInterfacedObject,IUserService)

private
  var FUserRepository : IUserRepository;

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


  if not Assigned(FUserRepository) then begin
    FUserRepository := TUserRepository.Create();
  end;


end;

procedure TUserService.Delete(aID: Integer);
begin
  //Validações
  FUserRepository.Delete(aID);
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

  FUsuario := TUserModel.Create;
  FUsuario.SetNome(aDTO.Name);
  FUsuario.SetPassword(aDTO.Password);
  FUsuario.SetRole(aDTO.Role);
  FUsuario.SetEmail(aDTO.Email);
  FUsuario.SetEscola(aDTO.Escola);

  Result := FUserRepository.Save(FUsuario);

end;

procedure TUserService.SetPathByEscola(aID: Integer);
begin
  FUserRepository.SetPathSchema(aID);
end;

procedure TUserService.Update(aDto: TUserDTO);
var FUsuario : TUserModel;
begin
  FUsuario := TUserModel.Create;
  FUsuario.SetID(aDto.ID);
  FUsuario.SetNome(aDTO.Name);
  FUsuario.SetPassword(aDTO.Password.GetHashCode.ToString);
  FUsuario.SetEmail(aDTO.Email);


  FUserRepository.Update(FUsuario);
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


    Result := FUserDTO;
  end;
finally

end;






end;

end.
