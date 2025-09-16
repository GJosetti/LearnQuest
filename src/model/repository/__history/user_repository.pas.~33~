unit user_repository;

interface
uses my_contracts, users_entity, FireDAC.Comp.Client;

type
TUserRepository = class(TInterfacedObject,ILoginRepository)

  private

  FConnection : TFDConnection;
  function RowToUser(aQuery: TFDQuery): TUserModel;

  public
    function FindByID(aID: Integer) : TUserModel;
    function FindByNome(aNome: String) : TUserModel;
    constructor Create(aConnection : TFDConnection);
end;


implementation


constructor TUserRepository.Create(aConnection: TFDConnection);
begin
    FConnection := aConnection;
end;

function TUserRepository.RowToUser(aQuery: TFDQuery): TUserModel;
var FUserRepo : TUserModel;
begin
  FUserRepo := TUserModel.Create;
  FUserRepo.SetID(aQuery.FieldByName('id').AsInteger);
  FUserRepo.SetNome(aQuery.FieldByName('user_name').AsString);
  Result := FUserRepo;


end;

{ TLoginRepository }

function TUserRepository.FindByID(aID: Integer): TUserModel;

begin


end;


function TUserRepository.FindByNome(aNome: String): TUserModel;
var Qry : TFDQuery;
begin
  Result := nil;
  Qry:= TFDQuery.Create(nil);
 try
  Qry.Connection := FConnection;
  Qry.SQL.Text := 'Select * From users WHERE user_name = :NAME';
  Qry.ParamByName('NAME').AsString := aNome;
  Qry.Open();

  Result := RowToUser(Qry);

 finally
  Qry.Free;
 end;

end;



end.
