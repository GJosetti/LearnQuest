unit frm_fazer_atividade_controller;

interface
uses my_contracts,atividades_service ;
type

TFazerAtividadeController = class(TInterfacedObject, ITelaFazerAtividadesController)


private
FService: IAtividadesService;
public

constructor Create;
procedure SalvarRegistro(AEstudanteID, AAtividadeTurmaID: Integer; AResult: Boolean);



end;

implementation

{ TFazerAtividadeController }

constructor TFazerAtividadeController.Create;
begin
  if not Assigned(FService) then begin
    FService := TAtividadeService.Create();
  end;
end;

procedure TFazerAtividadeController.SalvarRegistro(AEstudanteID, AAtividadeTurmaID: Integer; AResult: Boolean);

begin
  FService.SalvarRegistro(AEstudanteID,AAtividadeTurmaID,AResult);
end;

end.
