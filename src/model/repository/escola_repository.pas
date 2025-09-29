unit escola_repository;

interface
uses my_contracts, Data.DB, DMConnection, FireDAC.Comp.Client, escola_entity, System.SysUtils;

type
TEscolaRepository = class (TInterfacedObject, IEscolaRepository)


private
FConnection : TFDConnection;
FQuery : TFDQuery;

public

function FindByID(aID: Integer) : TEscolaModel;
function GetEscolaDataSet : TDataSet;
function Save (aModel: TEscolaModel) : Integer;
procedure Update(aModel : TEscolaModel);
procedure Delete (aID: Integer);
constructor Create();

end;

implementation

{ TEscolaRepository }

constructor TEscolaRepository.Create;
begin
  FQuery := DataModule1.FDQueryEscolas;
  FConnection := DataModule1.FDConnection1;
end;

procedure TEscolaRepository.Delete(aID: Integer);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text := 'DELETE from tenants where id = :ID';
    Qry.ParamByName('ID').AsInteger := aID;
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

function TEscolaRepository.FindByID(aID: Integer): TEscolaModel;
begin

end;

function TEscolaRepository.GetEscolaDataSet: TDataSet;
begin
  DataModule1.FDQueryEscolas.Close;
  DataModule1.FDQueryEscolas.SQL.Text := 'SELECT id, nome, endereco, membros_qtd FROM tenants';
  DataModule1.FDQueryEscolas.Open;
  Result := DataModule1.FDQueryEscolas;
end;



function TEscolaRepository.Save(aModel: TEscolaModel): Integer;
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text :=
      'INSERT INTO tenants (nome, endereco, membros_qtd) ' +
      'VALUES (:NAME, :CEP, :QTD) RETURNING id';

    Qry.ParamByName('NAME').AsString := aModel.GetNome;
    Qry.ParamByName('CEP').AsString := aModel.GetEndereco;
    Qry.ParamByName('QTD').AsInteger := aModel.GetQtdMembros;

    Qry.Open;

    Result := Qry.FieldByName('id').AsInteger;
  finally
    Qry.Free;
  end;
end;

procedure TEscolaRepository.Update(aModel: TEscolaModel);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text :=
      'UPDATE tenants SET nome = :NAME, endereco = :CEP where id = :ID';

    Qry.ParamByName('NAME').AsString := aModel.GetNome;
    Qry.ParamByName('CEP').AsString := aModel.GetEndereco;
    Qry.ParamByName('ID').AsInteger := aModel.GetID;
    Qry.ExecSQL;
  finally
    Qry.Free;
    aModel.Free;
  end;
end;
end.

