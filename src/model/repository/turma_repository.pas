unit turma_repository;

interface
uses my_contracts, turma_DTO,turma_entity, DMConnection, FireDAC.Comp.Client;
type

TTurmaRepository = class(TInterfacedObject, ITurmaRepository)

private
    FConnection: TFDConnection;
public


function GetByID (aID : Integer): TTurmaModel;
    procedure Salvar(aModel: TTurmaModel);
    procedure Update(aModel : TTurmaModel);
    procedure Delete (aID: Integer);
    procedure LinkEstudante (aID: Integer);
end;


implementation

end.
