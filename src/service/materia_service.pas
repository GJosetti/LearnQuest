unit materia_service;

interface
uses my_contracts, materia_repository, materia_entity, Data.DB;
type
TMateriaService = class(TInterfacedObject, IMateriaService)

private
FRepo : IMateriaRepository;


public
constructor Create;

function FindByID(aID: Integer): TMateria;
function FindByNome(aNome: String): TMateria;
procedure Salvar(aModel: TMateria);
procedure Update(aModel: TMateria);
function GetMateriasDataSet: TDataSet;

end;

implementation

{ TMateriaService }

constructor TMateriaService.Create;
begin
  if not Assigned(FRepo) then begin
    FRepo := TMateriaRepository.Create;
  end;
end;

function TMateriaService.FindByID(aID: Integer): TMateria;
begin
  Result := FRepo.FindByID(aID);
end;

function TMateriaService.FindByNome(aNome: String): TMateria;
begin
  Result := FRepo.FindByNome(aNome);
end;

function TMateriaService.GetMateriasDataSet: TDataSet;
begin
  Result := FRepo.GetMateriasDataSet;
end;

procedure TMateriaService.Salvar(aModel: TMateria);
begin
  FRepo.Salvar(aModel);
end;

procedure TMateriaService.Update(aModel: TMateria);
begin
  FRepo.Update(aModel);
end;

end.
