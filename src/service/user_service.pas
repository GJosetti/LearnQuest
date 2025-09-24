unit user_service;

interface
uses my_contracts, Vcl.Dialogs,user_DTO, users_entity, SysUtils, user_repository;

type
TUserService = class(TInterfacedObject,IUserService)

private
  var FUserRepository : IUserRepository;

public
  function GetByID: TUserDTO;
  function ValidarLogin(aDTO: TUserDTO):TUserDTO;
  procedure Salvar(aDTO: TUserDTO; aIDEscola : Integer);
  constructor Create();
end;




implementation
uses DMConnection;


{ TUserService }



constructor TUserService.Create();
begin


  if not Assigned(FUserRepository) then begin
    FUserRepository := TUserRepository.Create();
  end;


end;

function TUserService.GetByID: TUserDTO;
begin

end;


procedure TUserService.Salvar(aDTO: TUserDTO; aIDEscola : Integer);

var FUsuario : TUserModel;
begin

  FUsuario := TUserModel.Create;
  FUsuario.SetNome(aDTO.Name);
  FUsuario.SetPassword(aDTO.Password);
  FUsuario.SetRole(aDTO.Role);
  FUsuario.SetEmail(aDTO.Email);
  FUsuario.SetEscola(aIDEscola);

  FUserRepository.Save(FUsuario);

end;

function TUserService.ValidarLogin(aDTO: TUserDTO): TUserDTO;

var hash: String;

var FUser: TUserModel;
var FUserDTO: TUserDTO;

begin


//Verificações de preenchimento --------
if Trim(aDto.Name) = '' then begin
  ShowMessage('O nome precisa ser preenchido!');
  //fazer de uma maneira mais visual
end;
if Trim(aDTO.Password) = '' then begin
  ShowMessage('A senha precisa ser preenchida!');
  //fazer de uma maneira mais visual
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

  Result := FUserDTO;
end;






end;

end.
