unit frm_fazer_atividade_controller;

interface
uses my_contracts,atividades_service, estudante_service ;
type

TFazerAtividadeController = class(TInterfacedObject, ITelaFazerAtividadesController)


private
FService: IAtividadesService;
FEstudanteService : IEstudanteService;

public

constructor Create;
procedure SalvarRegistro(AEstudanteID, AAtividadeTurmaID: Integer; AResult: Boolean);
 function GetEstudanteIDByUserUD(aID : Integer) : Integer;


end;

implementation

{ TFazerAtividadeController }

constructor TFazerAtividadeController.Create;
begin
  if not Assigned(FService) then begin
    FService := TAtividadeService.Create();
  end;
  if not Assigned(FEstudanteService) then begin
    FEstudanteService := TEstudanteService.Create();
  end;
end;

function TFazerAtividadeController.GetEstudanteIDByUserUD(aID: Integer): Integer;
begin
  Result := FEstudanteService.GetIdByUserId(aID);
end;

procedure TFazerAtividadeController.SalvarRegistro(AEstudanteID, AAtividadeTurmaID: Integer; AResult: Boolean);

begin
  FService.SalvarRegistro(AEstudanteID,AAtividadeTurmaID,AResult);
end;

end.
