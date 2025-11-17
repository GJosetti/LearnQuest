unit materia_service;

interface
uses my_contracts, materia_repository, materia_entity, Data.DB, System.Generics.Collections;
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
function GetAll : TObjectList<TMateria>;
procedure DeleteMateria(aID : Integer);

end;

implementation

{ TMateriaService }

constructor TMateriaService.Create;
begin
  if not Assigned(FRepo) then begin
    FRepo := TMateriaRepository.Create;
  end;
end;

procedure TMateriaService.DeleteMateria(aID: Integer);
begin
  FRepo.Delete(aID);
end;

function TMateriaService.FindByID(aID: Integer): TMateria;
begin
  Result := FRepo.FindByID(aID);
end;

function TMateriaService.FindByNome(aNome: String): TMateria;
begin
  Result := FRepo.FindByNome(aNome);
end;

function TMateriaService.GetAll: TObjectList<TMateria>;
begin
  Result := FRepo.GetAll;
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
