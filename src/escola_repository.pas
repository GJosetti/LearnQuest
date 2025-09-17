unit escola_repository;

interface
uses my_contracts, Data.DB, DMConnection, FireDAC.Comp.Client;

type
TEscolaRepository = class (TInterfacedObject, IEscolaRepository)


private
FConnection : TFDConnection;

public

function GetEscolaDataSet : TDataSet;
constructor Create();
end;

implementation

{ TEscolaRepository }

constructor TEscolaRepository.Create;
begin
  FConnection := DataModule1.FDConnection1;
end;

function TEscolaRepository.GetEscolaDataSet: TDataSet;
var  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := FConnection;
  Query.SQL.Text := 'SELECT ID, Nome, Cidade FROM Escolas';
  Query.Open;
  Result := Query;
end;

end.
