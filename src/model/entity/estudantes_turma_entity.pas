unit estudantes_turma_entity;

interface
type
TEstudanteTurma = class

private
ID: Integer;
EstudanteID : Integer;
TurmaID : Integer;


function GetID : Integer;
procedure SetID(aID : Integer);
function GetEstudanteID : Integer;
procedure SetEstudanteID(aID : Integer);
function GetTurmaID : Integer;
procedure SetTurmaID(aID : Integer);

end;

implementation

{ TEstudanteTurma }

function TEstudanteTurma.GetEstudanteID: Integer;
begin
  Result := Self.EstudanteID;
end;

function TEstudanteTurma.GetID: Integer;
begin
  Result := Self.ID;
end;

function TEstudanteTurma.GetTurmaID: Integer;
begin
  Result := Self.TurmaID;
end;

procedure TEstudanteTurma.SetEstudanteID(aID: Integer);
begin
  Self.EstudanteID := aID;
end;

procedure TEstudanteTurma.SetID(aID: Integer);
begin
  Self.ID := aID;
end;

procedure TEstudanteTurma.SetTurmaID(aID: Integer);
begin
  Self.TurmaID := aID;
end;

end.
