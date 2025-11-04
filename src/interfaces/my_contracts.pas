unit my_contracts;

interface
uses user_DTO, users_entity, Vcl.Forms,Datasnap.DBClient,Data.DB, escolas_DTO, escola_entity,professor_entity,professores_DTO, estudante_entity, estudantes_DTO,
turma_DTO,turma_entity, System.Classes,System.Generics.Collections,atividade_entity;

type



//User Repo
 IUserRepository = interface
    ['{F59799D9-0A28-49CB-9D35-1E3AB3056DAE}']
    function FindByID(aID: Integer) : TUserModel;
    function FindByNome(aNome: String) : TUserModel;
    function Save (aModel : TUserModel) : Integer;
    function FindByIDEscola(aID: Integer) : TUserModel;
    procedure Update(aModel : TUserModel);
    procedure Delete (aID : Integer);
    procedure SetPathSchema (aID : Integer);
    function GetUsersDataSet: TDataSet;
    function GetAll : TObjectList<TUserModel>;
    function GetAllAvailableForTurma(aIDTurma: Integer): TObjectList<TUserModel>;
  end;


  IEscolaRepository = interface
    ['{1D9016AA-15DA-4253-926A-EEF2ABF7AF12}']
      function FindByID(aID: Integer) : TEscolaModel;
      function GetEscolaDataSet: TDataSet;
      function Save (aModel : TEscolaModel): Integer;
      procedure Update(aModel : TEscolaModel);
      procedure Delete (aID: Integer);
      procedure AtualizarQtd();

  end;

  IProfessorRepository = interface
    ['{4EDAED98-B9E2-4C4A-9450-73412A4B3FE4}']
      function GetByID (aID : Integer): TProfessorModel;
      procedure Salvar(aModel: TProfessorModel);
      function GetUserByID (aID: Integer): TProfessorModel;
      procedure Update(aDto : TProfessorModel);
      procedure Delete (aID: Integer);
      function GetAllNames : TStringList;
      function FindByName (aString : String): TProfessorModel;
      function GetIdByUserId(AUserId: Integer): Integer;


  end;

  IEstudanteRepository = interface
    ['{4EDAED98-B9E2-4C4A-9450-73412A4B3FE4}']
      function GetByID (aID : Integer): TEstudanteModel;
      procedure Salvar(aModel: TEstudanteModel);
      function GetUserByID (aID: Integer): TEstudanteModel;
      procedure Update(aDto : TEstudanteModel);
      function GetIdByUserId(AUserId: Integer): Integer;
      procedure Delete (aID: Integer);


  end;

  ITurmaRepository = interface
    ['{4EDAED98-B9E2-4C4A-9450-73412A4B3FE4}']
      function GetByID (aID : Integer): TTurmaModel;
      procedure Salvar(aModel: TTurmaModel);
      procedure Update(aModel : TTurmaModel);
      procedure Delete (aID: Integer);

      function GetTurmaDataSet: TDataSet;
      function FindByName (aNome : String): TTurmaModel;

      procedure LinkEstudante(aEstudanteID: Integer; aTurmaID: Integer);
      function GetEstudantesPorTurma(aTurmaID: Integer): TDataSet;
      procedure RemoverEstudanteDaTurma(aEstudanteID, aTurmaID: Integer);
      function GetParticipantesDataSet(aID : Integer): TDataSet;


  end;

  IAtividadeRepository = interface
    function GetAtividadeDataSet(aID : Integer) : TDataSet;
    procedure Save(aModel : atividade_Model);
    procedure Update (aModel : atividade_Model);
    function FindByID(aID : Integer): atividade_Model;
  end;


  //Services

  IAdminService = interface
    ['{693916A9-5FCB-47CB-B53F-337A1DD8C2FD}']

    procedure SalvarEscolaEUsuario(aEscolaDTo : TEscolaDTO ; aUsuarioDTO: TUserDTO );
  end;



  IUserService = interface
    ['{F33A6AD7-3ED7-415E-91FF-A75BA5004DD8}']
      function GetByID (aID : Integer): TUserDTO;
      function ValidarLogin(aDTO: TUserDTO) : TUserDTO;
      function Salvar(aDTO: TUserDTO) : Integer;
      function GetByEscolaID (aID : Integer): TUserDTO;
      procedure Update(aDto : TUserDTO);
      procedure Delete (aID: Integer);
      procedure SetPathByEscola (aID: Integer);
      function AtualizarTabelaUsuarios : TDataSet;
      function GetByNome (aString : String) : TUserDTO;
      function GetAll : TObjectList<TUserModel>;
      function GetAllForTurmas(aID :Integer) : TObjectList<TUserModel>;
  end;

  IEscolaService = interface
    ['{8569A16D-14A9-44D7-8422-C669431E4C11}']
      function SalvarEscola (aDTO: TEscolaDTO): Integer;
      function AtualizarTabelaEscolas : TDataSet;
      procedure Update(aDto : TEscolaDTO);
      procedure Delete (aID : Integer);
  end;

  IProfessorService = interface
    ['{F2F1842F-6E80-442E-9640-40B27CEA182D}']
      function GetByID (aID : Integer): TProfessorDTO;
      procedure Salvar(aDTO: TProfessorDTO);
      function GetUserByID (aID: Integer): TProfessorDTO;
      procedure Update(aDto : TProfessorDTO);
      procedure Delete (aID: Integer);
      function GetAllNames : TStringList;
      function FindByName(aString : String): TProfessorDTO;
      function GetIdByUserId(AUserId: Integer): Integer;

  end;

    IEstudanteService = interface
    ['{F2F1842F-6E80-442E-9640-40B27CEA182D}']
      function GetByID (aID : Integer): TEstudanteDTO;
      procedure Salvar(aDTO: TEstudanteDTO);

      function GetUserByID (aID: Integer): TEstudanteDTO;
      function GetIdByUserId(AUserId: Integer): Integer;
      procedure Update(aDto : TEstudanteDTO);
      procedure Delete (aID: Integer);
    end;

    ITurmaService = interface
    ['{264FF2B7-E8D5-45F4-A038-06879A17B0B0}']
      function GetByID (aID : Integer): TTurmaDTO;
      procedure Salvar(aDTO : TTurmaDTO);
      procedure Update(aDTO :TTurmaDTO);
      procedure Delete (aID: Integer);

      function FindByName (aNome : String) : TTUrmaDTO;
      function AtualizarTabelaTurmas : TDataSet;

      procedure LinkEstudante(aEstudanteID: Integer; aTurmaID: Integer);
      function GetEstudantesPorTurma(aTurmaID: Integer): TDataSet;
      procedure RemoverEstudanteDaTurma(aEstudanteID, aTurmaID: Integer);
      function AtualizarTabelaParticipantes(aID : Integer) : TDataSet;
    end;

      IAtividadesService = interface
        ['{1277E089-5357-4464-8C7D-0C5323A806C5}']

        function AtualizarTabelaAtividades(aID : Integer) : TDataSet ;
        procedure Save(aModel: atividade_Model);
        function FindByID(aID : Integer): atividade_Model;
        procedure Update (aModel : atividade_Model);

      end;


  //-------------------------------------------//

  //--------------Login-----------------------//

  ILoginView = interface
    ['{40EB0EA9-09A3-4243-9EA7-DADD756A4B45}']

    function GetNome: String;
    function GetPassword: String;
    procedure Mensagem(aString: String);
    procedure TrocarTela(aDTO: TUserDTO);
  end;

  ILoginController = interface
    ['{BE824FC4-BE45-42AD-A6A2-C15D6A105824}']
    procedure ProcessarLogin;
  end;





  //---------------Tela Admin-----------------//

  IMenuAdminView = interface
    ['{1AE3AEEE-506A-4889-A0F8-8E44BEAC9A1C}']
    function GetNomeEscola: String;
    function GetNomeUsuario:String;
    function GetCEP : String;
    function GetPassword: String;
    function GetEmail: String;
    function GetID : Integer;
    function CamposValidos: Boolean;
  end;
  IMenuAdminController = interface
    ['{5ED2F029-DA31-4020-8B22-5BCDE38D4849}']

    function AtualizarTabelaEscolas : TDataSet ;
    procedure AdicionarEscola();
    function RetornarEscola(aID : Integer) : TEscolaDTO;
    function RetornarUsuarioAdmin (aID : Integer) : TUserDTO;
    procedure Update;
    procedure Delete(aID : Integer);
  end;


  //-----------------Tela Escolas---------------------//
  IEscolaAdminView = interface
    ['{1AE3AEEE-506A-4889-A0F8-8E44BEAC9A1C}']
    function GetNome:String;
    function GetPassword: String;
    function GetEmail: String;
    function GetID : Integer;
    function GetRole: Integer;
    function CamposValidosUsuario: Boolean;
    function CamposValidosTurma: Boolean;
    function GetNomeTurma : String;
    function GetIDTurmaSelecionada : Integer;
    function GetDescTurma : String;
    function GetIDProfessorTurma: Integer;
    procedure PopularCBProfessores();

  end;

   IMenuEscolaController = interface
    ['{5ED2F029-DA31-4020-8B22-5BCDE38D4849}']
    function AtualizarTabelaMembros : TDataSet ;
    procedure AdicionarUsuario();
    function RetornarMembro(aID : Integer) : TUserDTO;
    procedure DeleteTurma(aNome : String);
    procedure Update(aID : Integer);
    procedure Delete(aID : Integer);
    procedure AdicionarTurma();
    function PopularCBProfessores : TStringList;
    function PopularCBParticipantes : TObjectList<TUserModel>;
    function FindByName (aString : String) : TUserDTO;
    function AtualizarTabelaTurmas : TDataSet;
    function FindByNameProfessores (aString : String): TProfessorDTO;
    function FindByNameTurmas (aString : String): TTurmaDTO;
    procedure UpdateTurma (aID : Integer);
    function GetEstudanteIDByUser(aID : Integer) : Integer;

    procedure LinkEstudante(aEstudanteID: Integer; aTurmaID: Integer);
    function GetEstudantesPorTurma(aTurmaID: Integer): TDataSet;
    procedure RemoverEstudanteDaTurma(aEstudanteID, aTurmaID: Integer);
    function AtualizarTabelaParticipantes(aID : Integer) : TDataSet;
   end;

  //-----------------Tela Professores---------------------//
  ITelaProfessorView = interface
       procedure AtualizarTabelaAtividades;
  end;

  ITelaProfessorController = interface
    function AtualizarTabelaTurmas : TDataSet ;
    function AtualizarTabelaAtividades : TDataSet ;
  end;

  //-----------------Tela Professores---------------------//
  ITelaCreateAtividadesView = interface


          // Getters
    function GetTitulo: string;
    function GetDescricao: string;
    function GetTipo: Integer;
    function GetPergunta: string;
    function GetAlternativaA: string;
    function GetAlternativaB: string;
    function GetAlternativaC: string;
    function GetAlternativaD: string;
    function GetAlternativaCorreta: Integer;

    // Setters
    procedure SetTitulo(const Value: string);
    procedure SetDescricao(const Value: string);
    procedure SetTipo(const Value: Integer);
    procedure SetPergunta(const Value: string);
    procedure SetAlternativaA(const Value: string);
    procedure SetAlternativaB(const Value: string);
    procedure SetAlternativaC(const Value: string);
    procedure SetAlternativaD(const Value: string);
    procedure SetAlternativaCorreta(const Value: Integer);

    procedure CarregarAtividade(FAtividade: atividade_Model);


  end;

  ITelaCreateAtividadesController = interface
    procedure Save();
    function FindByID(aID : Integer): atividade_Model;
    procedure Update(aID : Integer);

  end;

implementation

end.
