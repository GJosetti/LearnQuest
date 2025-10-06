unit turma_service;

interface
uses my_contracts, turma_DTO, turma_entity,turma_repository;


type


TTurmaService = class (TInterfacedObject, ITurmaService)



private

FTurmaRepo : ITurmaRepository;

public
      function GetByID (aID : Integer): TTurmaDTO;
      procedure Salvar(aDTO : TTurmaDTO);
      procedure Update(aDTO :TTurmaDTO);
      procedure Delete (aID: Integer);
      procedure LinkEstudante (aID: Integer);
      constructor Create;

end;

implementation

{ TTurmaService }

constructor TTurmaService.Create;
begin
  if not Assigned (FTurmaRepo) then begin
    FTurmaRepo := TTurmaRepository.Create;
  end;
end;

procedure TTurmaService.Delete(aID: Integer);
begin

end;

function TTurmaService.GetByID(aID: Integer): TTurmaDTO;
begin

end;

procedure TTurmaService.LinkEstudante(aID: Integer);
begin

end;

procedure TTurmaService.Salvar(aDTO: TTurmaDTO);
var
FTurma : TTurmaModel;
begin
  try
    FTurma := TTurmaModel.Create;
    FTurma.SetNome(aDTO.Nome);
    FTurma.SetDescricao(aDTO.Descricao);
    FTurma.SetProfessorID(aDTO.ProfessorID);

    FTurmaRepo.Salvar(FTurma);
  finally
    aDTO.Free;
  end;


end;

procedure TTurmaService.Update(aDTO: TTurmaDTO);
begin

end;

end.
