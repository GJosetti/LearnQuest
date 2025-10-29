unit atividades_service;

interface
uses my_contracts, Data.DB, atividade_repository;

type

TAtividadeService = class(TInterfacedObject, IAtividadesService)

private
FRepo : IAtividadeRepository;

public

function AtualizarTabelaAtividades : TDataSet ;
constructor Create;


end;

implementation

{ TAtividadeService }

constructor TAtividadeService.Create;
begin
  if not Assigned(FRepo) then begin

    FRepo :=  TAtividadeRepository.Create;

  end;
end;

function TAtividadeService.AtualizarTabelaAtividades: TDataSet;
begin
  Result := FRepo.GetAtividadeDataSet;
end;



end.
