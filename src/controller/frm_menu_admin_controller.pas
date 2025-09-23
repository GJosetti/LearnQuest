unit frm_menu_admin_controller;


interface
uses my_contracts, Data.DB, escola_service, user_DTO, escolas_DTO;




type

TMenuAdminController = class(TInterfacedObject, IMenuAdminController)

private
 Fview : IMenuAdminView;
 FService : IMenuAdminService;

public
constructor Create(aView: IMenuAdminView);

function AtualizarTabelaEscolas: TDataSet;
procedure AdicionarEscola ();

end;

implementation

{ TMenuAdminController }

constructor TMenuAdminController.Create(aView: IMenuAdminView);
begin
  if not Assigned(FService) then begin
    FService := TEscola_Service.Create;
  end;
  if not Assigned(Fview) then begin
    Fview := aView ;
  end;
end;

procedure TMenuAdminController.AdicionarEscola();
var RequestDTOEscola : TEscolaDTO;
begin

//Criar DTO - chamar service para validar e então ele chama o repository
  RequestDTOEscola := TEscolaDTO.Create;
  RequestDTOEscola.Name := Fview.GetNomeEscola;
  RequestDTOEscola.Endereco := Fview.GetCEP;
  RequestDTOEscola.QtdMembros := 1;

  FService.SalvarEscola(RequestDTOEscola);


end;

function TMenuAdminController.AtualizarTabelaEscolas : TDataSet;
begin

   Result := FService.AtualizarTabelaEscolas;

end;



end.
