program LearnQuest;

uses
  Vcl.Forms,
  DMConnection in 'DMConnection.pas' {DataModule1: TDataModule},
  frm_login_view in 'view\frm_login_view.pas' {frm_login},
  frm_login_controller in 'controller\frm_login_controller.pas',
  users_entity in 'model\entity\users_entity.pas',
  my_contracts in 'interfaces\my_contracts.pas',
  user_DTO in 'model\DTO\user_DTO.pas',
  frm_login_service in 'service\frm_login_service.pas',
  user_repository in 'model\repository\user_repository.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(Tfrm_login, frm_login);
  Application.Run;
end.
