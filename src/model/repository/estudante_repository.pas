unit estudante_repository;

interface
uses my_contracts, estudante_entity,DMConnection,FireDAC.Comp.Client;

type

TEstudanteRepository = class(TInterfacedObject, IEstudanteRepository)

private
    FConnection: TFDConnection;
public
    function GetByID (aID : Integer): TEstudanteModel;
    procedure Salvar(aModel: TEstudanteModel);
    function GetUserByID (aID: Integer): TEstudanteModel;
    procedure Update(aDto : TEstudanteModel);
    procedure Delete (aID: Integer);
    constructor Create();
end;

implementation

{ TEstudanteRepository }

constructor TEstudanteRepository.Create;
begin
  FConnection := DataModule1.FDConnection1;
end;

procedure TEstudanteRepository.Delete(aID: Integer);
begin

end;

function TEstudanteRepository.GetByID(aID: Integer): TEstudanteModel;
begin

end;

function TEstudanteRepository.GetUserByID(aID: Integer): TEstudanteModel;
begin

end;

procedure TEstudanteRepository.Salvar(aModel: TEstudanteModel);
var Qry : TFDQuery;
SchemaName : String;
SQL : String;
begin
  Qry:= TFDQuery.Create(nil);
 try
  Qry.Connection := FConnection;
  Qry.SQL.Text := 'insert into estudante(user_id)' + 'values (:ID)';
  Qry.ParamByName('ID').AsInteger := aModel.GetUserID;
  Qry.ExecSQL;

  Qry.SQL.Clear;

 finally
  Qry.Free;
  aModel.Free;
 end;
end;

procedure TEstudanteRepository.Update(aDto: TEstudanteModel);
begin

end;

end.
