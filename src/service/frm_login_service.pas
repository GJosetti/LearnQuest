unit frm_login_service;

interface
uses my_contracts, Vcl.Dialogs,user_DTO, users_entity, SysUtils, user_repository;

type
TLoginService = class(TInterfacedObject,ILoginService)

private
  var FUserRepository : IUserRepository;

public
  function GetByID: TUserDTO;
  function ValidarLogin(aDTO: TUserDTO):TUserDTO;
  constructor Create();
end;




implementation
uses DMConnection;


{ TLoginService }



constructor TLoginService.Create();
begin
  FUserRepository := TUserRepository.Create(DataModule1.FDConnection1);
  ;
end;

function TLoginService.GetByID: TUserDTO;
begin

end;


function TLoginService.ValidarLogin(aDTO: TUserDTO): TUserDTO;

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
