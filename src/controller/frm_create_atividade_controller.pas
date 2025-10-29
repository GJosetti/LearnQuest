unit frm_create_atividade_controller;

interface
uses my_contracts, atividades_service, atividade_entity, professor_service;

type

TCriarAtividadeController = class(TInterfacedObject, ITelaCreateAtividadesController)

private
  FAtividadeService: IAtividadesService;
  FProfessorService: IProfessorService;

public
  constructor Create;


end;

implementation

{ TCriarAtividadeController }

constructor TCriarAtividadeController.Create;
begin
  if not Assigned(FAtividadeService) then begin
    FAtividadeService := TAtividadeService.Create;
  end;

  if not Assigned(FProfessorService) then begin
    FProfessorService := TProfessorService.Create;
  end;
end;

end.
