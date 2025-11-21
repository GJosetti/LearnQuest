unit report_service;

interface
uses my_contracts, report_repository;
type

TReportService = class (TInterfacedObject, IReportService)


private
FRepo : IReportRepository;

public
  constructor Create;
  procedure ShowReportDesempenho();
  procedure ShowRelatorioUltimosAcessos(const AEscolaID: Integer);
  procedure ShowReportAtividades(const AEscolaID: Integer; const AProfessorID: Integer);



end;


implementation

{ TReportService }

constructor TReportService.Create;
begin
  if not Assigned(FRepo) then begin
    FRepo := TReportRepository.Create;
  end;
end;

procedure TReportService.ShowRelatorioUltimosAcessos(const AEscolaID: Integer);
begin
  FRepo.ShowRelatorioUltimosAcessos(AEscolaID);
end;

procedure TReportService.ShowReportAtividades(const AEscolaID: Integer; const AProfessorID: Integer);
begin
  FRepo.ShowReportAtividades(AEscolaID , AProfessorID);
end;

procedure TReportService.ShowReportDesempenho;
begin
  FRepo.ShowReportDesempenho;
end;

end.
