unit frm_menu_professor_controller;

interface
uses my_contracts, Data.DB, atividades_service, professor_service,turma_service,report_service, Sessao,atividade_entity;

type

TMenuProfessorController = class(TInterfacedObject, ITelaProfessorController)

private

FAtividadeService : IAtividadesService;
FProfessorService : IProfessorService;
FTurmaService : TTurmaService;
FRelatorioService : IReportService;

public
  function AtualizarTabelaTurmas : TDataSet ;
  function AtualizarTabelaAtividades : TDataSet ;
  constructor Create;
  procedure LinkAtividades(aAtividadeID, aTurmaID: Integer);
  procedure ShowReportAtividades;
  function FindByID (aID : Integer) : atividade_Model;
  procedure DeleteAtividade (aID: Integer);

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
  if not Assigned(FRelatorioService) then begin
    FRelatorioService := TReportService.Create;
  end;
end;



procedure TMenuProfessorController.DeleteAtividade(aID: Integer);
begin
  FAtividadeService.Delete(aID);
end;

function TMenuProfessorController.FindByID(aID: Integer): atividade_Model;
begin
  Result := FAtividadeService.FindByID(aID);
end;

procedure TMenuProfessorController.LinkAtividades(aAtividadeID, aTurmaID: Integer);
begin
  FTurmaService.LinkAtividade(aAtividadeID,aTurmaID);
end;

procedure TMenuProfessorController.ShowReportAtividades;
begin
  FRelatorioService.ShowReportAtividades(UsuarioLogado.Escola, FProfessorService.GetIdByUserId(UsuarioLogado.ID));
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
