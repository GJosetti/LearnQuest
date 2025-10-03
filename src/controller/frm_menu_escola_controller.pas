unit frm_menu_escola_controller;

interface
uses my_contracts, Data.DB, user_DTO, user_service, escola_service, professor_service, professores_DTO, Sessao, estudante_service, estudantes_DTO, App_Consts, System.SysUtils;

type

TMenuAdminController = class(TInterfacedObject, IMenuEscolaController)

private
 Fview : IEscolaAdminView;
 FServiceEscola : IEscolaService;
 FServiceUser: IUserService;
 FServiceProfessor : IProfessorService;
 FServiceEstudante : IEstudanteService;

public
   function AtualizarTabelaMembros : TDataSet ;
   procedure AdicionarUsuario();
   function RetornarMembro(aID : Integer) : TUserDTO;
   procedure Update;
   procedure Delete(aID : Integer);
   constructor Create(aView : IEscolaAdminView);


end;


implementation

{ TMenuAdminController }

constructor TMenuAdminController.Create;
begin
if not Assigned(FServiceEscola) then begin
    FServiceEscola := TEscola_Service.Create;
  end;
  if not Assigned(FServiceUser) then begin
    FServiceUser := TUserService.Create;
  end;
  if not Assigned(FServiceProfessor) then begin
    FServiceProfessor := TProfessorService.Create;
  end;
  if not Assigned(FServiceEstudante) then begin
    FServiceEstudante := TEstudanteService.Create;
  end;
  if not Assigned(Fview) then begin
    Fview := aView ;
  end;
end;

procedure TMenuAdminController.AdicionarUsuario;
var UserDTO : TUserDTO;
var ProfessorDTO : TProfessorDTO;
var EstudanteDTO : TEstudanteDTO;
begin
  UserDTO := TUserDTO.Create;


  UserDTO.Name := Fview.GetNome;
  UserDTO.Password := Fview.GetPassword.GetHashCode.ToString;
  UserDTO.Role := Fview.GetRole;
  UserDTO.Email := Fview.GetEmail;
  UserDTO.Escola := UsuarioLogado.Escola;

  if(UserDTO.Role = ROLE_PROFESSOR) then begin
     ProfessorDTO := TProfessorDTO.Create;
     ProfessorDTO.UserId := FServiceUser.Salvar(UserDTO);
     FServiceProfessor.Salvar(ProfessorDTO);
  end else if UserDTO.Role = ROLE_ALUNO then begin
    EstudanteDTO := TEstudanteDTO.Create;
    EstudanteDTO.UserId := FServiceUser.Salvar(UserDTO);
    FServiceEstudante.Salvar(EstudanteDTO);
  end;






end;

function TMenuAdminController.AtualizarTabelaMembros: TDataSet;
begin
  Result := FServiceUser.AtualizarTabelaUsuarios;
end;


procedure TMenuAdminController.Delete(aID: Integer);
begin

end;

function TMenuAdminController.RetornarMembro(aID: Integer): TUserDTO;
begin

end;

procedure TMenuAdminController.Update;
begin

end;

end.
