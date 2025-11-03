unit atividades_service;

interface
uses my_contracts, Data.DB, atividade_repository, atividade_entity;

type

TAtividadeService = class(TInterfacedObject, IAtividadesService)

private
FRepo : IAtividadeRepository;

public

function AtualizarTabelaAtividades(aID : Integer) : TDataSet ;
constructor Create;
procedure Save(aModel: atividade_Model);
function FindByID(aID : Integer): atividade_Model;
procedure Update (aModel : atividade_Model);


end;

implementation

{ TAtividadeService }

constructor TAtividadeService.Create;
begin
  if not Assigned(FRepo) then begin

    FRepo :=  TAtividadeRepository.Create;

  end;
end;

function TAtividadeService.FindByID(aID: Integer): atividade_Model;
begin
 Result := FRepo.FindByID(aID);
end;

procedure TAtividadeService.Save(aModel : atividade_model);
begin
  FRepo.Save(aModel);
end;

procedure TAtividadeService.Update (aModel : atividade_Model);
begin
  FRepo.Update(aModel);
end;

function TAtividadeService.AtualizarTabelaAtividades(aID : Integer): TDataSet;
begin

  Result := FRepo.GetAtividadeDataSet(aID);
end;



end.
