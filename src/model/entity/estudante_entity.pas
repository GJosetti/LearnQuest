unit estudante_entity;

interface

type

TEstudanteModel = class

private
  ID : Integer;
  UserID: Integer;

public
  procedure SetID(aID : Integer);
  function GetID: Integer;
  procedure SetUserID(aID : Integer);
  function GetUserID: Integer;

end;

implementation

{ TProfessorModel }

function TEstudanteModel.GetID: Integer;
begin
  Result := Self.ID;
end;

function TEstudanteModel.GetUserID: Integer;
begin
  Result := Self.UserID;
end;

procedure TEstudanteModel.SetID(aID: Integer);
begin
  Self.ID := aID;
end;

procedure TEstudanteModel.SetUserID(aID: Integer);
begin
  Self.UserID := aID;
end;

end.

