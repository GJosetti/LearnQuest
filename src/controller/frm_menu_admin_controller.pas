unit frm_menu_admin_controller;


interface
uses my_contracts, Data.DB, frm_menuAdmin_service, user_DTO;




type

TMenuAdminController = class(TInterfacedObject, IMenuAdminController)

private
 Fview : IMenuAdminView;
 FService : IMenuAdminService;

public
constructor Create(aView: IMenuAdminView);

function AtualizarTabelaEscolas: TDataSet;
procedure AdicionarEscola (aDTO: TUserDTO);

end;

implementation

{ TMenuAdminController }

constructor TMenuAdminController.Create(aView: IMenuAdminView);
begin
  if not Assigned(FService) then begin
    FService := TFrm_menuAdmin_service.Create;
  end;
end;

procedure TMenuAdminController.AdicionarEscola(aDTO: TUserDTO);
begin

end;

function TMenuAdminController.AtualizarTabelaEscolas : TDataSet;
begin

   Result := FService.AtualizarTabelaEscolas;

end;



end.
