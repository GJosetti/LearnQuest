unit professor_entity;

interface

type

TProfessorModel = class

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

function TProfessorModel.GetID: Integer;
begin
  Result := Self.ID;
end;

function TProfessorModel.GetUserID: Integer;
begin
  Result := Self.UserID;
end;

procedure TProfessorModel.SetID(aID: Integer);
begin
  Self.ID := aID;
end;

procedure TProfessorModel.SetUserID(aID: Integer);
begin
  Self.UserID := aID;
end;

end.
