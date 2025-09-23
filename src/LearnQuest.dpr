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
  frm_menuAdmin_service in 'service\frm_menuAdmin_service.pas',
  escolas_DTO in 'model\DTO\escolas_DTO.pas',
  escola_repository in 'model\repository\escola_repository.pas',
  escola_entity in 'model\entity\escola_entity.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(Tfrm_login, frm_login);
  Application.CreateForm(Tfrm_menuAdmin_view, frm_menuAdmin_view);
  Application.Run;
end.
