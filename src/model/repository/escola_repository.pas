

unit escola_repository;

interface
uses my_contracts, Data.DB, DMConnection, FireDAC.Comp.Client, escola_entity, System.SysUtils,System.Classes, Vcl.Dialogs;

type
TEscolaRepository = class (TInterfacedObject, IEscolaRepository)


private
FConnection : TFDConnection;

CriarTabelas : TStringList;

public

function FindByID(aID: Integer) : TEscolaModel;
function GetEscolaDataSet : TDataSet;
function Save (aModel: TEscolaModel) : Integer;
procedure Update(aModel : TEscolaModel);
procedure Delete (aID: Integer);
procedure AtualizarQtd();
constructor Create(aConnection: TFDConnection);

end;

implementation

{ TEscolaRepository }

procedure TEscolaRepository.AtualizarQtd;
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := FConnection;

    // Atualiza tenants com usuários
    Qry.SQL.Text :=
      'UPDATE tenants t ' +
      'SET membros_qtd = sub.qtd ' +
      'FROM ( ' +
      '   SELECT user_escola_id AS escola_id, COUNT(*) AS qtd ' +
      '   FROM users ' +
      '   GROUP BY user_escola_id ' +
      ') sub ' +
      'WHERE t.id = sub.escola_id';
    Qry.ExecSQL;

    // Atualiza tenants sem usuários para 0
    Qry.SQL.Text :=
      'UPDATE tenants ' +
      'SET membros_qtd = 0 ' +
      'WHERE id NOT IN (SELECT DISTINCT user_escola_id FROM users)';
    Qry.ExecSQL;

  finally
    Qry.Free;
  end;
end;



constructor TEscolaRepository.Create(aConnection : TFDConnection);
begin



  FConnection := aConnection;
end;

procedure TEscolaRepository.Delete(aID: Integer);
var
  Qry: TFDQuery;
  FSchemaName : String;
begin
  Qry := TFDQuery.Create(nil);
  try
     Qry.Connection := FConnection;

    Qry.SQL.Text := 'SELECT schema_name from tenants where id = :ID';
    Qry.ParamByName('ID').AsInteger := aID;
    Qry.Open;
    FSchemaName := Qry.FieldByName('schema_name').AsString;


    Qry.sql.Text := 'DROP SCHEMA ' + FSchemaName +' CASCADE';

    Qry.ExecSQL;


    Qry.SQL.Text := 'DELETE from tenants where id = :ID';
    Qry.ParamByName('ID').AsInteger := aID;
    Qry.ExecSQL;

    AtualizarQtd;

  finally
    Qry.Free;
  end;
end;

function TEscolaRepository.FindByID(aID: Integer): TEscolaModel;
begin

end;

function TEscolaRepository.GetEscolaDataSet: TDataSet;
begin
  AtualizarQtd;
  DataModule1.FDQueryEscolas.Close;
  DataModule1.FDQueryEscolas.SQL.Text := 'SELECT id, nome, endereco, membros_qtd FROM tenants';
  DataModule1.FDQueryEscolas.Open;
  Result := DataModule1.FDQueryEscolas;

end;



function TEscolaRepository.Save(aModel: TEscolaModel): Integer;

var
  FID: Integer;
  Qry: TFDQuery;
  SchemaName : String;
  FS : string;
  FilePath: string;

begin

  FilePath := ExpandFileName(
    ExtractFilePath(ParamStr(0)) + '..\..\db\migrations\Criar_Tabelas.sql'
  );

  if not Assigned (CriarTabelas) then begin
    CriarTabelas := TStringList.Create;
    CriarTabelas.LoadFromFile(FilePath);
  end;

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

    FID := Qry.FieldByName('id').AsInteger;
    Qry.Close;

  Qry.SQL.Text :=
  'UPDATE tenants ' +
  'SET schema_name = ''escola_'' || :FID ' +
  'WHERE id = :FID ' +
  'RETURNING schema_name';
  Qry.ParamByName('FID').AsInteger := FID;
  Qry.Open;


  SchemaName := Qry.FieldByName('schema_name').AsString;
  Qry.Close;

  // 3. Cria o schema no banco
  FConnection.ExecSQL('CREATE SCHEMA IF NOT EXISTS ' + SchemaName);

  FConnection.ExecSQL('SET search_path TO ' + SchemaName + ', public');

  Qry.SQL.Text := CriarTabelas.Text;
  Qry.ExecSQL();


  Result := FID;
  AtualizarQtd;
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

