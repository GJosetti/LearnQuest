unit professor_service;

interface
uses my_contracts, professores_DTO,professor_entity, professor_repository, System.Classes;

type
TProfessorService = class(TInterfacedObject,IProfessorService)

private
FProfessorRepo : IProfessorRepository;

public
 function GetByID (aID : Integer): TProfessorDTO;
 procedure Salvar(aDTO: TProfessorDTO);
 function GetUserByID (aID: Integer): TProfessorDTO;
 procedure Update(aDto : TProfessorDTO);
 procedure Delete (aID: Integer);
 constructor Create;
 function GetAllNames : TStringList;
 function FindByName(aString : String): TProfessorDTO;




end;

implementation

{ TProfessorService }

constructor TProfessorService.Create;
begin
  if not Assigned (FProfessorRepo) then begin
    FProfessorRepo := TProfessorRepository.Create;
  end;
end;

procedure TProfessorService.Delete(aID: Integer);
begin

end;

function TProfessorService.FindByName(aString: String): TProfessorDTO;
var
FDTO : TProfessorDTO;
FProfessor : TProfessorModel;
begin
  FProfessor := FProfessorRepo.FindByName(aString);
  FDTO.ID := FProfessor.GetID;
  FDTO.UserId := FProfessor.GetUserID;
  Result := FDTO;
end;

function TProfessorService.GetAllNames: TStringList;
begin
  Result := FProfessorRepo.GetAllNames;
end;

function TProfessorService.GetByID(aID: Integer): TProfessorDTO;
begin

end;

function TProfessorService.GetUserByID(aID: Integer): TProfessorDTO;
begin

end;

procedure TProfessorService.Salvar(aDTO: TProfessorDTO);
var FProfessor : TProfessorModel;
begin
  try
    FProfessor := TProfessorModel.Create;
    FProfessor.SetUserID(aDTO.UserId);


    FProfessorRepo.Salvar(FProfessor);
  finally
    aDTO.Free;
  end;


end;
procedure TProfessorService.Update(aDto: TProfessorDTO);
begin

end;

end.
