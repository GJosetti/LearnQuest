unit turma_service;

interface
uses my_contracts, turma_DTO, turma_entity,turma_repository,Data.DB,DMConnection, Vcl.Dialogs, FireDAC.Comp.Client;


type


TTurmaService = class (TInterfacedObject, ITurmaService)



private

FTurmaRepo : ITurmaRepository;
public
      function GetByID (aID : Integer): TTurmaDTO;
      procedure Salvar(aDTO : TTurmaDTO);
      procedure Update(aDTO :TTurmaDTO);
      procedure Delete (aID: Integer);

      function AtualizarTabelaTurmas : TDataSet;
      function FindByName (aNome : String) : TTUrmaDTO;
      constructor Create;

      procedure LinkEstudante(aEstudanteID, aTurmaID: Integer);
      procedure LinkAtividade(aAtividadeID: Integer; aTurmaID: Integer);
      function GetEstudantesPorTurma(aTurmaID: Integer): TDataSet;
      procedure RemoverEstudanteDaTurma(aEstudanteID, aTurmaID: Integer);
      function AtualizarTabelaParticipantes(aID : Integer) : TDataSet;

      function GetTurmaByProfessor : TDataSet;

end;

implementation

{ TTurmaService }

function TTurmaService.AtualizarTabelaParticipantes(aID: Integer): TDataSet;
begin
  Result := FTurmaRepo.GetParticipantesDataSet(aID);
end;

function TTurmaService.AtualizarTabelaTurmas: TDataSet;
begin
  Result := FTurmaRepo.GetTurmaDataSet;
end;

constructor TTurmaService.Create;
begin

  if not Assigned (FTurmaRepo) then begin
    FTurmaRepo := TTurmaRepository.Create();
  end;
end;

procedure TTurmaService.Delete(aID: Integer);
begin
  FTurmaRepo.Delete(aID);
end;

function TTurmaService.FindByName(aNome: String): TTUrmaDTO;
var
FTurma : TTurmaModel;
FDTO : TTurmaDTO;
begin
  FDTO := TTurmaDTO.Create;

 FTurma :=  FTurmaRepo.FindByName(aNome);
 FDTO.ID := FTurma.GetID;
 FDTO.Nome := FTurma.GetNome;
 FDTO.Descricao := FTurma.GetDescricao;
 FDTO.ProfessorID := FTurma.GetProfessorID;

 Result := FDTO;
end;

function TTurmaService.GetByID(aID: Integer): TTurmaDTO;
begin

end;

function TTurmaService.GetEstudantesPorTurma(aTurmaID: Integer): TDataSet;
begin

end;

function TTurmaService.GetTurmaByProfessor: TDataSet;
begin
  Result := FTurmaRepo.GetTurmaByProfessor();
end;

procedure TTurmaService.LinkAtividade(aAtividadeID, aTurmaID: Integer);
begin
  FTurmaRepo.LinkAtividade(aAtividadeID,aTurmaID);
end;

procedure TTurmaService.LinkEstudante(aEstudanteID, aTurmaID: Integer);
begin
  FTurmaRepo.LinkEstudante(aEstudanteID,aTurmaID);
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
var
FTurma : TTurmaModel;
begin

FTurma := TTurmaModel.Create;

FTurma.SetID(aDTO.ID);
FTurma.SetNome(aDto.Nome);
FTurma.SetDescricao(aDto.Descricao);
FTurma.SetProfessorID(aDto.ProfessorID);

FTurmaRepo.Update(FTurma);

end;

procedure TTurmaService.RemoverEstudanteDaTurma(aEstudanteID,
  aTurmaID: Integer);
begin
  FTurmaRepo.RemoverEstudanteDaTurma(aEstudanteID, aTurmaID);
end;

end.
