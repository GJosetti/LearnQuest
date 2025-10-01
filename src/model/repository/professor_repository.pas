unit professor_repository;

interface
uses my_contracts, professor_entity;

type

TProfessorRepository = class(TInterfacedObject, IProfessorRepository)


public
    function GetByID (aID : Integer): TProfessorModel;
    procedure Salvar(aDTO: TProfessorModel);
    function GetUserByID (aID: Integer): TProfessorModel;
    procedure Update(aDto : TProfessorModel);
    procedure Delete (aID: Integer);
end;


implementation

{ TProfessorRepository }

procedure TProfessorRepository.Delete(aID: Integer);
begin

end;

function TProfessorRepository.GetByID(aID: Integer): TProfessorModel;
begin

end;

function TProfessorRepository.GetUserByID(aID: Integer): TProfessorModel;
begin

end;

procedure TProfessorRepository.Salvar(aDTO: TProfessorModel);
begin

end;

procedure TProfessorRepository.Update(aDto: TProfessorModel);
begin

end;

end.
