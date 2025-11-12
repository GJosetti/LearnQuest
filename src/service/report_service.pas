unit report_service;

interface
uses my_contracts, report_repository;
type

TReportService = class (TInterfacedObject, IReportService)


private
FRepo : IReportRepository;

public
  constructor Create;
  procedure ShowReport();




end;


implementation

{ TReportService }

constructor TReportService.Create;
begin
  if not Assigned(FRepo) then begin
    FRepo := TReportRepository.Create;
  end;
end;

procedure TReportService.ShowReport;
begin
  FRepo.ShowReport;
end;

end.
