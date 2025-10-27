unit AdminService;


interface
uses FireDAC.Comp.Client, escola_service,user_service, my_contracts, escolas_DTO,user_DTO, SysUtils;
type
  TAdminService = class(TInterfacedObject, IAdminService)
  private
    FConn: TFDConnection;
    FServiceEscola: IEscolaService;
    FServiceUsuario: IUserService;
  public
    constructor Create(AConn: TFDConnection; aEscolaService : IEscolaService; aUserService : IUserService);
    procedure SalvarEscolaEUsuario(aEscolaDTo : TEscolaDTO ; aUsuarioDTO: TUserDTO );
  end;


implementation

{ TAdminService }

constructor TAdminService.Create(AConn: TFDConnection; aEscolaService : IEscolaService; aUserService : IUserService);
begin
  FConn := aConn;
  FServiceEscola := aEscolaService;
  FServiceUsuario := aUserService;
end;

procedure TAdminService.SalvarEscolaEUsuario(aEscolaDTo : TEscolaDTO ; aUsuarioDTO: TUserDTO );
begin
   FConn.StartTransaction;
  try
    if not Assigned(FServiceEscola) then
  raise Exception.Create('FServiceEscola está NIL!');
    aUsuarioDTo.Escola := FServiceEscola.SalvarEscola(aEscolaDTO);
    FServiceUsuario.Salvar(aUsuarioDTO);
    FConn.Commit;
  except
    FConn.Rollback;
    raise;
  end;
end;

end.
