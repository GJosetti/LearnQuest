unit AdminService;

interface
uses FireDAC.Comp.Client, escola_service, user_service, my_contracts, escolas_DTO, user_DTO;

type
  TAdminService = class(TInterfacedObject, IAdminService)
  private
    FConn: TFDConnection;
    FServiceEscola: IEscolaService;
    FServiceUsuario: IUserService;
  public
    constructor Create(AConn: TFDConnection; AServiceEscola: IEscolaService; AServiceUsuario: IUserService);
    destructor Destroy; override;
    procedure SalvarEscolaEUsuario(aEscolaDTo : TEscolaDTO ; aUsuarioDTO: TUserDTO );
  end;

implementation

{ TAdminService }

constructor TAdminService.Create(AConn: TFDConnection; AServiceEscola: IEscolaService; AServiceUsuario: IUserService);
begin
  inherited Create;
  FConn := AConn;
  FServiceEscola := AServiceEscola;
  FServiceUsuario := AServiceUsuario;
end;

destructor TAdminService.Destroy;
begin
  // Libera as interfaces (se necessário, dependendo da implementação)
  FServiceEscola := nil;
  FServiceUsuario := nil;
  inherited;
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
