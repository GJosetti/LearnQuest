unit frm_login_controller;


interface
uses my_contracts, user_service,user_DTO, SysUtils, App_Consts, Sessao;

type
  TLoginController = class(TInterfacedObject,ILoginController)


  private
    FView : ILoginView;
    FService: IUserService;
    procedure ProcessarLogin;

  public
    constructor Create(aView: ILoginView);

  end;

implementation



{ TLoginController }

constructor TLoginController.Create(aView: ILoginView);
begin
  Fview := aView;
  FService := TUserService.Create;

end;



procedure TLoginController.ProcessarLogin();
var RequestDTO: TUserDTO;
var ResultadoDTO : TUserDTO;
begin

  RequestDTO := TUserDTO.Create;
  RequestDTO.Name := FView.GetNome;
  RequestDTO.Password := FView.GetPassword;
  ResultadoDTO := FService.ValidarLogin(RequestDTO);

  if ResultadoDTO = nil then begin
    //COLOCAR NA VIEW
    FView.Mensagem('Usuário ou senha incorretos!');
  end else begin
    //COLOCAR NA VIEW
   Fview.Mensagem('Login realizado com sucesso! Bem-vindo(a) ' + ResultadoDTO.Name);

   UsuarioLogado:= ResultadoDTO;
   FService.SetPathByEscola(ResultadoDTO.ID);
   Fview.TrocarTela(ResultadoDTO);





  end;

end;



end.
