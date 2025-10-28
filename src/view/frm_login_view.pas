unit frm_login_view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, my_contracts, frm_login_controller, user_DTO,
  Vcl.ExtCtrls, frm_menu_admin_view,frm_menu_escola_view, App_Consts,System.Math,
  Vcl.Imaging.pngimage;

type
  Tfrm_login = class(TForm, ILoginView)
    edt_nome_login: TEdit;
    edt_senha_login: TEdit;
    pnl_login: TPanel;
    s: TImage;
    btn_login: TImage;
    Timer: TTimer;
    caption_btn_login: TLabel;
    Title: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btn_loginClick(Sender: TObject);
    procedure sClick(Sender: TObject);
    
    procedure btn_loginMouseEnter(Sender: TObject);
    procedure btn_loginMouseLeave(Sender: TObject);
  private
    { Private declarations }
    FController : ILoginController;
    isPasswordVisible : Boolean;



  public
    { Public declarations }
    function GetNome: String;
    function GetPassword: String;
    procedure Mensagem(aString: String);
    procedure TrocarTela(aDTO: TUserDTO);
  end;

var
  frm_login: Tfrm_login;


implementation

{$R *.dfm}

{ Tfrm_login }

procedure Tfrm_login.btn_loginMouseEnter(Sender: TObject);
var
FilePath : String;
begin
  FilePath := ExpandFileName(
    ExtractFilePath(ParamStr(0)) + '..\..\assets\Botão1Hover.png'
  );
  btn_login.Picture.LoadFromFile(FilePath);
end;

procedure Tfrm_login.btn_loginMouseLeave(Sender: TObject);
var
FilePath : String;
begin
  FilePath := ExpandFileName(
    ExtractFilePath(ParamStr(0)) + '..\..\assets\Botão1.png'
  );
  btn_login.Picture.LoadFromFile(FilePath);
end;


procedure Tfrm_login.FormCreate(Sender: TObject);
begin

  FController := TLoginController.Create(Self);
  Self.Position := poScreenCenter;
end;

procedure Tfrm_login.btn_loginClick(Sender: TObject);
begin
  if(edt_nome_login.Text = Trim('')) or (edt_senha_login.Text = Trim('')) then begin
    raise Exception.Create('Todos os campos precisam ser preenchidos');
  end else begin
    FController.ProcessarLogin;
  end;

end;



function Tfrm_login.GetNome: String;
begin
  Result := edt_nome_login.Text;
end;

function Tfrm_login.GetPassword: String;
begin
  Result := edt_senha_login.Text;
end;

procedure Tfrm_login.Mensagem(aString: String);
begin
  ShowMessage(aString);
end;



procedure Tfrm_login.sClick(Sender: TObject);
begin
  isPasswordVisible := not isPasswordVisible;

  if(isPasswordVisible) then begin
    edt_senha_login.PasswordChar := #0;
  end else begin
    edt_senha_login.PasswordChar := '*';
  end;


end;

procedure Tfrm_login.TrocarTela(aDTO: TUserDTO);

begin

  Self.Hide;
  if(aDTO.Role = ROLE_ADMIN) then begin
    frm_menuAdmin_view := Tfrm_menuAdmin_view.Create(nil);
    frm_menuAdmin_view.ShowModal;
  end else if (aDTO.Role = ROLE_ESCOLA) then begin
    frm_menuEscola := Tfrm_menuEscola.Create(nil);
    frm_menuEscola.ShowModal;
  end else if (aDTO.Role = ROLE_PROFESSOR) then begin
    //Criar Form
    //ShowModal
  end;


  Self.Close;





end;

end.
