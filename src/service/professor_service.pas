unit professor_service;

interface
uses my_contracts, professores_DTO,professor_entity, professor_repository;

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

function TProfessorService.GetByID(aID: Integer): TProfessorDTO;
begin

end;

function TProfessorService.GetUserByID(aID: Integer): TProfessorDTO;
begin

end;

procedure TProfessorService.Salvar(aDTO: TProfessorDTO);
begin

end;

procedure TProfessorService.Update(aDto: TProfessorDTO);
begin

end;

end.
