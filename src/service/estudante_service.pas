unit estudante_service;

interface
uses my_contracts, estudantes_DTO,Estudante_entity, Estudante_repository,System.Generics.Collections;

type
TEstudanteService = class(TInterfacedObject,IEstudanteService)

private
FEstudanteRepo : IEstudanteRepository;

public
 function GetByID (aID : Integer): TEstudanteDTO;
 procedure Salvar(aDTO: TEstudanteDTO);
 function GetUserByID (aID: Integer): TEstudanteDTO;
 procedure Update(aDto : TEstudanteDTO);
 function GetIdByUserId(AUserId: Integer): Integer;
 procedure Delete (aID: Integer);
 constructor Create;




end;
implementation

{ TEstudanteService }

constructor TEstudanteService.Create;
begin
  if not Assigned (FEstudanteRepo) then begin
    FEstudanteRepo := TEstudanteRepository.Create;
  end;
end;

procedure TEstudanteService.Delete(aID: Integer);
begin

end;



function TEstudanteService.GetByID(aID: Integer): TEstudanteDTO;
begin

end;

function TEstudanteService.GetIdByUserId(AUserId: Integer): Integer;
begin
  Result := FEstudanteRepo.GetIdByUserId(AUserId);
end;

function TEstudanteService.GetUserByID(aID: Integer): TEstudanteDTO;
begin

end;

procedure TEstudanteService.Salvar(aDTO: TEstudanteDTO);
var FEstudante : TEstudanteModel;
begin
  try
    FEstudante := TEstudanteModel.Create;
    FEstudante.SetUserID(aDTO.UserId);


    FEstudanteRepo.Salvar(FEstudante);
  finally
    aDTO.Free;
  end;


end;
procedure TEstudanteService.Update(aDto: TEstudanteDTO);
begin

end;

end.
