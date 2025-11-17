unit materia_repository;

interface

uses
  my_contracts, materia_entity, FireDAC.Comp.Client, FireDAC.Stan.Param,
  Data.DB, DMConnection, System.SysUtils, System.Generics.Collections;

type
  TMateriaRepository = class(TInterfacedObject, IMateriaRepository)
  private
    FConnection: TFDConnection;
  public
    constructor Create;

    function FindByID(aID: Integer): TMateria;
    function FindByNome(aNome: String): TMateria;
    procedure Salvar(aModel: TMateria);
    procedure Update(aModel: TMateria);
    function GetMateriasDataSet: TDataSet;
    function GetAll : TObjectList<TMateria>;
    procedure Delete(aID : Integer);
  end;

implementation

constructor TMateriaRepository.Create;
begin
  FConnection := DataModule1.FDConnection1;
end;

procedure TMateriaRepository.Delete(aID: Integer);
var
Qry : TFDQuery;

begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := DataModule1.FDConnection1;
    Qry.SQL.Text := 'Delete from materias WHERE id = :ID';
    Qry.ParamByName('ID').AsInteger := aID;
    Qry.ExecSQL
  finally
    Qry.Free;
  end;

end;

function TMateriaRepository.FindByID(aID: Integer): TMateria;
var
  Q: TFDQuery;
  aModel : TMateria;
begin
  Result := nil;
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := FConnection;
    Q.SQL.Text := 'SELECT * FROM materias WHERE id = :id';
    Q.ParamByName('id').AsInteger := aID;
    Q.Open;

    if not Q.IsEmpty then
    begin
      aModel := TMateria.Create;
      aModel.SetID(Q.FieldByName('id').AsInteger);
      aModel.SetName(Q.FieldByName('name').AsString);
      aModel.SetDescricao(Q.FieldByName('descricao').AsString);
      Result := aModel;
    end;

  finally
    Q.Free;
  end;
end;

function TMateriaRepository.FindByNome(aNome: String): TMateria;
var
  Q: TFDQuery;
  aModel : TMateria;
begin
  Result := nil;
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := FConnection;
    Q.SQL.Text :=
      'SELECT * FROM materias WHERE name ILIKE :nome LIMIT 1';
    Q.ParamByName('nome').AsString := aNome;
    Q.Open;

    if not Q.IsEmpty then
    begin
      aModel := TMateria.Create;
      aModel.SetID(Q.FieldByName('id').AsInteger);
      aModel.SetName(Q.FieldByName('name').AsString);
      aModel.SetDescricao(Q.FieldByName('descricao').AsString);
      Result := aModel;
    end;

  finally
    Q.Free;
  end;
end;

procedure TMateriaRepository.Salvar(aModel: TMateria);
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := FConnection;
    Q.SQL.Text :=
      'INSERT INTO materias (name, descricao) ' +
      'VALUES (:name, :descricao)';
    Q.ParamByName('name').AsString := aModel.GetName;
    Q.ParamByName('descricao').AsString := aModel.GetDescricao;
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

procedure TMateriaRepository.Update(aModel: TMateria);
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := FConnection;
    Q.SQL.Text :=
      'UPDATE materias SET ' +
      'name = :name, descricao = :descricao ' +
      'WHERE id = :id';

    Q.ParamByName('name').AsString := aModel.GetName;
    Q.ParamByName('descricao').AsString := aModel.GetDescricao;
    Q.ParamByName('id').AsInteger := aModel.GetID;

    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

function TMateriaRepository.GetAll: TObjectList<TMateria>;
var
  lst: TObjectList<TMateria>;
  Qry: TFDQuery;
  FModel : TMateria;
begin
  lst := TObjectList<TMateria>.Create(True);
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;
    Qry.SQL.Text := 'SELECT * FROM materias';
    Qry.Open;

    while not Qry.Eof do
    begin
      FModel := TMateria.Create;
      FModel.SetID(Qry.FieldByName('id').AsInteger);
      FModel.SetName(Qry.FieldByName('name').AsString);
      FModel.SetDescricao(Qry.FieldByName('descricao').AsString);
      lst.Add(FModel);
      Qry.Next;
    end;

    Result := lst;
  finally
    Qry.Free;
  end;
end;

function TMateriaRepository.GetMateriasDataSet: TDataSet;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  Q.Connection := FConnection;
  Q.SQL.Text := 'SELECT * FROM materias ORDER BY name ASC';
  Q.Open;
  Result := Q; // quem chamar deve liberar depois
end;

end.

