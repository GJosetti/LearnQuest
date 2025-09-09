unit users_model;

interface

type
  TUserModel = class
  private
    ID: Integer;
    Name : String;
    Role: Integer;
    Password: String;
    Email: String;
  public
    function GetID : Integer;
    procedure SetID(aID : Integer);
    function GetNome : String;
    procedure SetNome(aName : String);

  end;

implementation

{ TUserModel }

function TUserModel.GetID: Integer;
begin
  Result := Self.ID;
end;

function TUserModel.GetNome: String;
begin
  Result := Self.Name
end;

procedure TUserModel.SetID(aID: Integer);
begin
  Self.ID := aID;
end;

procedure TUserModel.SetNome(aName: String);
begin
  Name := aName
end;

end.
