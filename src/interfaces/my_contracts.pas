unit my_contracts;

interface
uses user_DTO, users_entity, Vcl.Forms;

type



//User Repo
 IUserRepository = interface
    ['{F59799D9-0A28-49CB-9D35-1E3AB3056DAE}']
    function FindByID(aID: Integer) : TUserModel;
    function FindByNome(aNome: String) : TUserModel;
  end;




  //--------------Login-----------------------//

  ILoginView = interface
    ['{40EB0EA9-09A3-4243-9EA7-DADD756A4B45}']

    function GetNome: String;
    function GetPassword: String;
    procedure Mensagem(aString: String);
    procedure TrocarTelaAdmin();
  end;

  ILoginController = interface
    ['{BE824FC4-BE45-42AD-A6A2-C15D6A105824}']
    procedure ProcessarLogin;
  end;
  ILoginService = interface
    ['{F33A6AD7-3ED7-415E-91FF-A75BA5004DD8}']
    function GetByID: TUserDTO;
    function ValidarLogin(aDTO: TUserDTO) : TUserDTO;
  end;


  //------------------------------------------//

  //---------------Tela Admin-----------------//

  IMenuAdminView = interface
    ['{1AE3AEEE-506A-4889-A0F8-8E44BEAC9A1C}']


  end;


implementation

end.
