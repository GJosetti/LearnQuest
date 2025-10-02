unit frm_menu_escola_controller;

interface
uses my_contracts, Data.DB, user_DTO, user_service, escola_service, professor_service, professores_DTO, Sessao;

type

TMenuAdminController = class(TInterfacedObject, IMenuEscolaController)

private
 Fview : IEscolaAdminView;
 FServiceEscola : IEscolaService;
 FServiceUser: IUserService;
 FServiceProfessor : IProfessorService;
 //FServiceEstudante : IEstudanteService;
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
  if not Assigned(Fview) then begin
    Fview := aView ;
  end;
end;

procedure TMenuAdminController.AdicionarUsuario;
var UserDTO : TUserDTO;
var ProfessorDTO : TProfessorDTO;
begin
  UserDTO := TUserDTO.Create;
  ProfessorDTO := TProfessorDTO.Create;

  UserDTO.Name := Fview.GetNome;
  UserDTO.Password := Fview.GetPassword;
  UserDTO.Role := Fview.GetRole;
  UserDTO.Email := Fview.GetEmail;
  UserDTO.Escola := UsuarioLogado.Escola;


  ProfessorDTO.UserId := FServiceUser.Salvar(UserDTO);

  FServiceProfessor.Salvar(ProfessorDTO);
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
