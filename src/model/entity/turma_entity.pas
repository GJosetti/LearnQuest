unit turma_entity;

interface

type

TTurmaModel = class

private
  ID : Integer;
  Nome: String;
  Descricao: String;
  ProfessorID : Integer;


public
  procedure SetID (aID : Integer);

  function GetID : Integer;

  procedure SetNome (aNome : String);

  function GetNome : String;

  procedure SetDescricao (aDesc : String);

  function GetDescricao : String;

  procedure SetProfessorID (aID : Integer);

  function GetProfessorID : Integer;

end;

implementation

{ TTurma }

function TTurmaModel.GetDescricao: String;
begin
  Result := Descricao;
end;

function TTurmaModel.GetID: Integer;
begin
  Result := ID;
end;

function TTurmaModel.GetNome: String;
begin
  Result := Nome;
end;

function TTurmaModel.GetProfessorID: Integer;
begin
  Result := ProfessorID;
end;

procedure TTurmaModel.SetDescricao(aDesc: String);
begin
  Descricao := aDesc;
end;

procedure TTurmaModel.SetID(aID: Integer);
begin
  ID := aID;
end;

procedure TTurmaModel.SetNome(aNome: String);
begin
  Nome := aNome;
end;

procedure TTurmaModel.SetProfessorID(aID: Integer);
begin
  ProfessorID := aID;
end;

end.
