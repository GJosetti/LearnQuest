unit frm_menu_escola_controller;

interface
uses my_contracts, Data.DB,Vcl.Dialogs, user_DTO, user_service,System.Classes,users_entity,System.Generics.Collections, escola_service, professor_service,turma_service, professores_DTO,turma_DTO, Sessao, estudante_service, estudantes_DTO, App_Consts, System.SysUtils;

type

TMenuAdminController = class(TInterfacedObject, IMenuEscolaController)

private
 Fview : IEscolaAdminView;
 FServiceEscola : IEscolaService;
 FServiceUser: IUserService;
 FServiceProfessor : IProfessorService;
 FServiceEstudante : IEstudanteService;
 FServiceTurma : ITurmaService;

public
   function AtualizarTabelaMembros : TDataSet ;
   procedure AdicionarUsuario();
   function RetornarMembro(aID : Integer) : TUserDTO;
   procedure Update(aID : Integer);
   procedure Delete(aID : Integer);
   procedure AdicionarTurma();
   constructor Create(aView : IEscolaAdminView);
   function PopularCBProfessores : TStringList;
   function PopularCBParticipantes : TObjectList<TUserModel>;
   function FindByName (aString : String) : TUserDTO;
   function FindByNameProfessores (aString : String): TProfessorDTO;
   function FindByNameTurmas (aString : String): TTurmaDTO;
   function AtualizarTabelaTurmas : TDataSet;
   procedure DeleteTurma(aNome: String);
   procedure UpdateTurma (aID : Integer);
   function GetEstudanteIDByUser(aID : Integer) : Integer;

    procedure LinkEstudante(aEstudanteID, aTurmaID: Integer);
    function GetEstudantesPorTurma(aTurmaID: Integer): TDataSet;
    procedure RemoverEstudanteDaTurma(aEstudanteID, aTurmaID: Integer);
    function AtualizarTabelaParticipantes(aID : Integer) : TDataSet;


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
  if not Assigned(FServiceTurma) then begin
    FServiceTurma :=  TTurmaService.Create;
  end;
  if not Assigned(Fview) then begin
    Fview := aView ;
  end;
end;

procedure TMenuAdminController.AdicionarTurma;
var
TurmaDTO : TTurmaDTO;
begin
  TurmaDTO := TTurmaDTO.Create;
  TurmaDTO.Nome := Fview.GetNomeTurma;
  TurmaDTO.Descricao := Fview.GetDescTurma;
  TurmaDTO.ProfessorID := Fview.GetIDProfessorTurma;
  //ShowMessage(UsuarioLogado.Escola.ToString);
  //FServiceUser.SetPathByEscola(UsuarioLogado.Escola);
  ShowMessage(UsuarioLogado.Escola.ToString);
  FServiceTurma.Salvar(TurmaDTO);


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


function TMenuAdminController.AtualizarTabelaParticipantes(aID: Integer): TDataSet;
begin
  Result := FServiceTurma.AtualizarTabelaParticipantes(aID);
end;

function TMenuAdminController.AtualizarTabelaTurmas: TDataSet;
begin
  Result := FServiceTurma.AtualizarTabelaTurmas;
end;

procedure TMenuAdminController.Delete(aID: Integer);
begin
  FServiceUser.Delete(aID);
end;

procedure TMenuAdminController.DeleteTurma(aNome: String);
var
  FDTO : TTurmaDTO;
begin
  FDTO := FServiceTurma.FindByName(aNome);
  FServiceTurma.Delete(FDTO.ID);
end;

function TMenuAdminController.FindByName(aString: String): TUserDTO;
begin
  Result := FServiceUser.GetByNome(aString);
end;

function TMenuAdminController.FindByNameProfessores(aString: String): TProfessorDTO;
begin
  Result := FServiceProfessor.FindByName(aString);
end;

function TMenuAdminController.FindByNameTurmas(aString: String): TTurmaDTO;
begin
  Result := FServiceTurma.FindByName(aString);
end;

function TMenuAdminController.GetEstudanteIDByUser(aId: Integer): Integer;
begin
  Result := FServiceEstudante.GetIdByUserId(aID);
end;

function TMenuAdminController.GetEstudantesPorTurma(
  aTurmaID: Integer): TDataSet;
begin

end;

procedure TMenuAdminController.LinkEstudante(aEstudanteID, aTurmaID: Integer);
begin
  FServiceTurma.LinkEstudante(aEstudanteID,aTurmaID);
end;

function TMenuAdminController.PopularCBParticipantes: TObjectList<TUserModel>;
begin
  Result := FServiceUser.GetAllForTurmas(Fview.GetIDTurmaSelecionada);
end;

function TMenuAdminController.PopularCBProfessores: TStringList;
begin
  Result := FServiceProfessor.GetAllNames;
end;

procedure TMenuAdminController.RemoverEstudanteDaTurma(aEstudanteID,
  aTurmaID: Integer);
begin
  FServiceTurma.RemoverEstudanteDaTurma(aEstudanteID,aTurmaID);
end;

function TMenuAdminController.RetornarMembro(aID: Integer): TUserDTO;
begin

end;

procedure TMenuAdminController.Update(aID : Integer);
var UsuarioDTO: TUserDTO;
begin


  UsuarioDTO := TUserDTO.Create;
  UsuarioDTO.Name := Fview.GetNome;
  UsuarioDTO.ID := aID;
  UsuarioDTO.Password := Fview.GetPassword;
  UsuarioDTO.Email := Fview.GetEmail;



  FServiceUser.Update(UsuarioDTO);

end;

procedure TMenuAdminController.UpdateTurma(aID: Integer);
var TurmaDTO: TTurmaDTO;
begin


  TurmaDTO := TTurmaDTO.Create;
  TurmaDTO.Nome := Fview.GetNomeTurma;
  TurmaDTO.ID := aID;
  TurmaDTO.Descricao := Fview.GetDescTurma;
  TurmaDTO.ProfessorID := Fview.GetIDProfessorTurma;

  FServiceTurma.Update(TurmaDTO);

end;

end.
