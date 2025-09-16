unit frm_login_controller;


interface
uses my_contracts, frm_login_service,user_DTO, SysUtils;

type
  TLoginController = class(TInterfacedObject,ILoginController)


  private
    FView : ILoginView;
    FService: ILoginService;
    procedure ProcessarLogin;

  public
    constructor Create(aView: ILoginView);

  end;

implementation



{ TLoginController }

constructor TLoginController.Create(aView: ILoginView);
begin
  Fview := aView;
  FService := TLoginService.Create;
end;



procedure TLoginController.ProcessarLogin();
var RequestDTO: TUserDTO;
var ResultadoDTO : TUserDTO;
begin
  RequestDTO := TUserDTO.Create;
  RequestDTO.Name := FView.GetNome;
  ResultadoDTO := FService.ValidarLogin(RequestDTO);

  if ResultadoDTO = nil then begin
    //COLOCAR NA VIEW
    FView.Mensagem('Usuário não encontrado!');
  end else begin
    //COLOCAR NA VIEW
   Fview.Mensagem('Login realizado com sucesso! ID: ' + ResultadoDTO.ID.ToString);
  end;

end;



end.
