program LearnQuest;

uses
  Vcl.Forms,
  tform_view_login in 'tform_view_login\tform_view_login.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
