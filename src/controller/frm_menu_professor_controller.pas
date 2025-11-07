unit frm_menu_professor_controller;

interface
uses my_contracts, Data.DB, atividades_service, professor_service,turma_service, Sessao;

type

TMenuProfessorController = class(TInterfacedObject, ITelaProfessorController)

private

FAtividadeService : IAtividadesService;
FProfessorService : IProfessorService;
FTurmaService : TTurmaService;

public
  function AtualizarTabelaTurmas : TDataSet ;
  function AtualizarTabelaAtividades : TDataSet ;
  constructor Create;


end;


implementation

{ TMenuProfessorController }

constructor TMenuProfessorController.Create;
begin
  if not Assigned(FAtividadeService) then begin
    FAtividadeService := TAtividadeService.Create;
  end;
  if not Assigned(FProfessorService) then begin
    FProfessorService := TProfessorService.Create;
  end;
  if not Assigned(FTurmaService) then begin
    FTurmaService := TTurmaService.Create;
  end;
end;

function TMenuProfessorController.AtualizarTabelaAtividades: TDataSet;
begin
  Result := FAtividadeService.AtualizarTabelaAtividades(FProfessorService.GetIdByUserId(UsuarioLogado.ID));
end;

function TMenuProfessorController.AtualizarTabelaTurmas: TDataSet;
begin
  Result := FTurmaService.GetTurmaByProfessor() ;
end;



end.
