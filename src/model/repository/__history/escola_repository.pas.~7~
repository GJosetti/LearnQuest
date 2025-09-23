unit escola_repository;

interface
uses my_contracts, Data.DB, DMConnection, FireDAC.Comp.Client;

type
TEscolaRepository = class (TInterfacedObject, IEscolaRepository)


private
FConnection : TFDConnection;
FQuery : TFDQuery;

public

function GetEscolaDataSet : TDataSet;
constructor Create();
end;

implementation

{ TEscolaRepository }

constructor TEscolaRepository.Create;
begin
  FQuery := DataModule1.FDQueryEscolas;
end;

function TEscolaRepository.GetEscolaDataSet: TDataSet;
begin
  DataModule1.FDQueryEscolas.Close;
  DataModule1.FDQueryEscolas.SQL.Text := 'SELECT id, nome, endereco, membros_qtd FROM tenants';
  DataModule1.FDQueryEscolas.Open;
  Result := DataModule1.FDQueryEscolas;
end;


end.

