unit materia_entity;

interface
type

TMateria = class

private
  FID : Integer;
  FName: String;
  FDescricao : String;
public
  procedure SetID (aID : Integer);
  procedure SetName (aString : String);
  procedure SetDescricao (aString : String);

  function GetID : Integer;
  function GetName : String;
  function GetDescricao : String;

end;

implementation

{ TMateria }

function TMateria.GetDescricao: String;
begin
  Result := Self.FDescricao;
end;

function TMateria.GetID: Integer;
begin
  Result := Self.FID;
end;

function TMateria.GetName: String;
begin
  Result := Self.FName;
end;

procedure TMateria.SetDescricao(aString: String);
begin
  Self.FDescricao := aString;
end;

procedure TMateria.SetID(aID: Integer);
begin
  Self.FID := aID;
end;

procedure TMateria.SetName(aString: String);
begin
  Self.FName := aString;
end;

end.
