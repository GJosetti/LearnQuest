unit frm_menu_admin_controller;


interface
uses my_contracts, Data.DB, escola_service, user_DTO, escolas_DTO, App_Consts,System.SysUtils, user_service;




type

TMenuAdminController = class(TInterfacedObject, IMenuAdminController)

private
 Fview : IMenuAdminView;
 FServiceEscola : IEscolaService;
 FServiceUser: IUserService;

public
constructor Create(aView: IMenuAdminView);

function AtualizarTabelaEscolas: TDataSet;
procedure AdicionarEscola ();
function RetornarUsuarioAdmin (aID : Integer) : TUserDTO;
function RetornarEscola(aID : Integer) : TEscolaDTO;
procedure Update;
procedure Delete(aID: Integer);

end;

implementation

{ TMenuAdminController }

constructor TMenuAdminController.Create(aView: IMenuAdminView);
begin
  if not Assigned(FServiceEscola) then begin
    FServiceEscola := TEscola_Service.Create;
  end;
  if not Assigned(FServiceUser) then begin
    FServiceUser := TUserService.Create;
  end;
  if not Assigned(Fview) then begin
    Fview := aView ;
  end;
end;

procedure TMenuAdminController.Delete (aID : Integer);

begin
  FServiceEscola.Delete(aID);
  //FServiceUser.Delete(RetornarUsuarioAdmin(aID).ID);



end;

function TMenuAdminController.RetornarEscola(aID: Integer): TEscolaDTO;
begin

end;

function TMenuAdminController.RetornarUsuarioAdmin(aID: Integer): TUserDTO;
var FuserDTO : TUserDTO;
begin

  Result := FServiceUser.GetByEscolaID(aID);

end;

procedure TMenuAdminController.Update;

var EscolaDTO: TEscolaDTO;
var UsuarioDTO: TUserDTO;
begin
  EscolaDTO := TEscolaDTO.Create;
  EscolaDTO.ID := Fview.GetID;
  EscolaDTO.Name := Fview.GetNomeEscola;
  EscolaDTO.Endereco := Fview.GetCEP;

  UsuarioDTO := TUserDTO.Create;
  UsuarioDTO.ID := RetornarUsuarioAdmin(Fview.GetID).ID;
  UsuarioDTO.Name := Fview.GetNomeUsuario;
  UsuarioDTO.Password := Fview.GetPassword;
  UsuarioDTO.Email := Fview.GetEmail;

  FServiceUser.Update(UsuarioDTO);
  FServiceEscola.Update(EscolaDTO);
end;

procedure TMenuAdminController.AdicionarEscola();
var RequestDTOEscola : TEscolaDTO;
var RequestDTOUsuario: TUserDTO;
var tempID : Integer;
begin

//Criar DTO - chamar service para validar e então ele chama o repository
  RequestDTOEscola := TEscolaDTO.Create;
  RequestDTOEscola.Name := Fview.GetNomeEscola;
  RequestDTOEscola.Endereco := Fview.GetCEP;
  RequestDTOEscola.QtdMembros := 1;

  RequestDTOUsuario := TUserDTO.Create;
  RequestDTOUsuario.Name := Fview.GetNomeUsuario;
  RequestDTOUsuario.Role := ROLE_ESCOLA;
  RequestDTOUsuario.Password := Fview.GetPassword.GetHashCode.ToString;
  RequestDTOUsuario.Email := Fview.GetEmail;

  tempID := FServiceEscola.SalvarEscola(RequestDTOEscola);
  FServiceUser.Salvar(RequestDTOUsuario, tempID);


end;

function TMenuAdminController.AtualizarTabelaEscolas : TDataSet;
begin

   Result := FServiceEscola.AtualizarTabelaEscolas;

end;



end.
