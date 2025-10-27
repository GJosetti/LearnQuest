unit AdminService;


interface
uses FireDAC.Comp.Client, escola_service,user_service, my_contracts, escolas_DTO,user_DTO;
type
  TAdminService = class(TInterfacedObject, IAdminService)
  private
    FConn: TFDConnection;
    FServiceEscola: TEscola_Service;
    FServiceUsuario: TUserService;
  public
    constructor Create(AConn: TFDConnection);
    procedure SalvarEscolaEUsuario(aEscolaDTo : TEscolaDTO ; aUsuarioDTO: TUserDTO );
  end;


implementation

{ TAdminService }

constructor TAdminService.Create(AConn: TFDConnection);
begin
  FConn := aConn;
end;

procedure TAdminService.SalvarEscolaEUsuario(aEscolaDTo : TEscolaDTO ; aUsuarioDTO: TUserDTO );
begin
   FConn.StartTransaction;
  try
    aUsuarioDTo.Escola := FServiceEscola.SalvarEscola(aEscolaDTO);
    FServiceUsuario.Salvar(aUsuarioDTO);
    FConn.Commit;
  except
    FConn.Rollback;
    raise;
  end;
end;

end.
