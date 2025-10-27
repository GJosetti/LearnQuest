program LearnQuest;

uses
  Vcl.Forms,
  DMConnection in 'DMConnection.pas' {DataModule1: TDataModule},
  frm_login_view in 'view\frm_login_view.pas' {frm_login},
  frm_login_controller in 'controller\frm_login_controller.pas',
  users_entity in 'model\entity\users_entity.pas',
  my_contracts in 'interfaces\my_contracts.pas',
  user_DTO in 'model\DTO\user_DTO.pas',
  user_service in 'service\user_service.pas',
  user_repository in 'model\repository\user_repository.pas',
  frm_menu_admin_view in 'view\frm_menu_admin_view.pas' {frm_menuAdmin_view},
  App_Consts in 'db\App_Consts.pas',
  frm_menu_admin_controller in 'controller\frm_menu_admin_controller.pas',
  escola_service in 'service\escola_service.pas',
  escolas_DTO in 'model\DTO\escolas_DTO.pas',
  escola_repository in 'model\repository\escola_repository.pas',
  escola_entity in 'model\entity\escola_entity.pas',
  frm_menu_escola_view in 'view\frm_menu_escola_view.pas' {frm_menuEscola},
  frm_menu_escola_controller in 'controller\frm_menu_escola_controller.pas',
  Sessao in 'db\Sessao.pas',
  professores_DTO in 'model\DTO\professores_DTO.pas',
  estudante_entity in 'model\entity\estudante_entity.pas',
  professor_entity in 'model\entity\professor_entity.pas',
  estudantes_DTO in 'model\DTO\estudantes_DTO.pas',
  professor_service in 'service\professor_service.pas',
  estudante_service in 'service\estudante_service.pas',
  professor_repository in 'model\repository\professor_repository.pas',
  estudante_repository in 'model\repository\estudante_repository.pas',
  turma_entity in 'model\entity\turma_entity.pas',
  turma_DTO in 'model\DTO\turma_DTO.pas',
  turma_repository in 'model\repository\turma_repository.pas',
  turma_service in 'service\turma_service.pas',
  estudantes_turma_entity in 'model\entity\estudantes_turma_entity.pas',
  AdminService in 'service\AdminService.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(Tfrm_login, frm_login);
  Application.CreateForm(Tfrm_menuAdmin_view, frm_menuAdmin_view);
  Application.CreateForm(Tfrm_menuEscola, frm_menuEscola);
  Application.Run;
end.
