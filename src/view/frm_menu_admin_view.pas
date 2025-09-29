unit frm_menu_admin_view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, my_contracts, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, frm_menu_admin_controller, user_DTO;

type
  TMode = (m_ADD,m_EDIT);
  Tfrm_menuAdmin_view = class(TForm, IMenuAdminView)
    pnl_sideMenu_adminMenu: TPanel;
    Escolas: TButton;
    pnl_home_adminMenu: TPanel;
    Home: TButton;
    pnl_escolas_adminMenu: TPanel;
    dbg_escolas: TDBGrid;
    d_Src_escolas: TDataSource;
    btn_adicionar_adminMenu: TPanel;
    btn_remover_adminMenu: TPanel;
    btn_editar_adminMenu: TPanel;
    pnl_addNEdit_adminMenu: TPanel;
    pnl_title_addNEdit_adminMenu: TLabel;
    edt_nome_addNEdit_adminMenu: TEdit;
    lbl_nome_edit_addNEdit_adminMenu: TLabel;
    lbl_CEP_addNEdit_adminMenu: TLabel;
    edt_CEP_addNEdit_adminMenu: TEdit;
    btn_concluir_addNEdit_adminMenu: TPanel;
    btn_cancelar_addNEdit_adminMenu: TPanel;
    lbl_nomeAdmin_addNEdit_adminMenu: TLabel;
    edt_nomeUsurario_addNEdit_adminMenu: TEdit;
    lbl_passwordAdmin_addNEdit_adminMenu: TLabel;
    edt_password_addNEdit__adminMenu: TEdit;
    Label1: TLabel;
    edt_email_addNEdit_adminMenu: TEdit;
    lbl_email_addNEdit_adminMenu: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure EscolasClick(Sender: TObject);
    procedure HomeClick(Sender: TObject);
    procedure btn_adicionar_adminMenuClick(Sender: TObject);
    procedure btn_concluir_addNEdit_adminMenuClick(Sender: TObject);
    procedure btn_cancelar_addNEdit_adminMenuClick(Sender: TObject);
    procedure btn_editar_adminMenuClick(Sender: TObject);
    procedure btn_remover_adminMenuClick(Sender: TObject);


  private
    { Private declarations }
    FController: IMenuAdminController;
    Fmode : TMode;
    FID : Integer;
    NomeEscola : String;
    CEP : String;
    NomeUsuario: String;
    Password : String;
    procedure ClearAllEdits;

  public
    { Public declarations }
    function GetNomeEscola: String;
    function GetNomeUsuario:String;
    function GetCEP : String;
    function GetPassword: String;
    function GetEmail: String;
    function CamposValidos: Boolean;
    function GetID : Integer;

  end;

var
  frm_menuAdmin_view: Tfrm_menuAdmin_view;

implementation

{$R *.dfm}

function Tfrm_menuAdmin_view.CamposValidos: Boolean;
begin

//Valida todos os campos
if(edt_nome_addNEdit_adminMenu.Text = Trim('')) or (edt_CEP_addNEdit_adminMenu.Text = Trim('')) or (edt_email_addNEdit_adminMenu.Text = Trim('')) or (edt_nomeUsurario_addNEdit_adminMenu.Text = Trim('')) or (edt_password_addNEdit__adminMenu.Text = Trim('')) then begin

  raise Exception.Create('Todos os campos precisam ser preenchidos');
end else begin
  Result := True;
end;



end;

procedure Tfrm_menuAdmin_view.ClearAllEdits;
begin
    edt_nome_addNEdit_adminMenu.Clear;
    edt_CEP_addNEdit_adminMenu.Clear;
    edt_nomeUsurario_addNEdit_adminMenu.Clear;
    edt_password_addNEdit__adminMenu.Clear;
    edt_email_addNEdit_adminMenu.Clear;
end;


procedure Tfrm_menuAdmin_view.btn_adicionar_adminMenuClick(Sender: TObject);
begin
// 1 - DEIXA O PANEL VISIVEL; 2- VERIFICA SE � UM ADD OU EDIT; 3- FAZ AS DEVIDAS ALTERA��ES;
  pnl_addNEdit_adminMenu.Visible := true;
  Fmode := m_ADD;
  ClearAllEdits;


end;

procedure Tfrm_menuAdmin_view.btn_cancelar_addNEdit_adminMenuClick(
  Sender: TObject);
begin
  pnl_addNEdit_adminMenu.Visible := false;
  ClearAllEdits;
end;

procedure Tfrm_menuAdmin_view.btn_concluir_addNEdit_adminMenuClick(
  Sender: TObject);
begin


  if CamposValidos then begin
    if Fmode = m_ADD then begin
      FController.AdicionarEscola();
    end else begin
      FController.Update();
    end;


    FController.AtualizarTabelaEscolas;
    pnl_addNEdit_adminMenu.Visible := false;
    ClearAllEdits;

  end;


end;





procedure Tfrm_menuAdmin_view.btn_editar_adminMenuClick(Sender: TObject);

var Nome : String;
var CEP : String;
var Email : String;
var UserName: String;
var Password: String;
var FuserDTO: TUserDTO;
begin
 try
  FID := dbg_escolas.DataSource.DataSet.FieldByName('ID').AsInteger;

  FuserDTO := FController.RetornarUsuarioAdmin(FID);

  if(FuserDTO <> nil) then begin

    Nome := dbg_escolas.DataSource.DataSet.FieldByName('nome').AsString;
    CEP := dbg_escolas.DataSource.DataSet.FieldByName('endereco').AsString;


    pnl_addNEdit_adminMenu.Visible := true;
    Fmode := m_EDIT;

    edt_nome_addNEdit_adminMenu.Text := Nome;
    edt_CEP_addNEdit_adminMenu.Text := CEP;
    edt_email_addNEdit_adminMenu.Text := FuserDTO.Email;
    edt_nomeUsurario_addNEdit_adminMenu.Text := FuserDTO.Name;

  end;


 finally
   FuserDTO.Free;
 end;

end;

procedure Tfrm_menuAdmin_view.btn_remover_adminMenuClick(Sender: TObject);

begin

FID := dbg_escolas.DataSource.DataSet.FieldByName('ID').AsInteger;
//Confirma��o de exclus�o
if MessageDlg('Deseja realmente excluir o registro?', mtConfirmation,
              [mbYes, mbNo], 0) = mrYes then
begin
  FController.Delete(FID);
  FController.AtualizarTabelaEscolas;
  ShowMessage('Registro exclu�do!');
end;




end;

procedure Tfrm_menuAdmin_view.EscolasClick(Sender: TObject);
begin
 //MUDAR DE TELA: 1- Deixar home invisivel 2- deixar escola visivel 3 - atualizar tabela de escolas :)
 pnl_home_adminMenu.Visible := false;
 pnl_escolas_adminMenu.Visible := true;
 if Assigned(d_Src_escolas.DataSet) then begin
   d_Src_escolas.DataSet := nil; // limpa antes
 end;
  d_Src_escolas.DataSet := FController.AtualizarTabelaEscolas;
  dbg_escolas.DataSource := d_Src_escolas;



end;

procedure Tfrm_menuAdmin_view.FormCreate(Sender: TObject);
begin
  FController := TMenuAdminController.Create(Self);
  Self.Position := poScreenCenter;


end;



function Tfrm_menuAdmin_view.GetCEP: String;
begin
  Result := edt_CEP_addNEdit_adminMenu.Text;
end;

function Tfrm_menuAdmin_view.GetEmail: String;
begin
  Result := edt_email_addNEdit_adminMenu.Text;
end;

function Tfrm_menuAdmin_view.GetID: Integer;
begin
  Result := FID;
end;

function Tfrm_menuAdmin_view.GetNomeEscola: String;
begin
  Result := edt_nome_addNEdit_adminMenu.Text;
end;

function Tfrm_menuAdmin_view.GetNomeUsuario: String;
begin
  Result := edt_nomeUsurario_addNEdit_adminMenu.Text;
end;

function Tfrm_menuAdmin_view.GetPassword: String;
begin
  Result := edt_password_addNEdit__adminMenu.Text;
end;

procedure Tfrm_menuAdmin_view.HomeClick(Sender: TObject);
begin
  pnl_home_adminMenu.Visible := true;
  pnl_escolas_adminMenu.Visible := false;
  //Limpar Lista na mem�ria
end;

end.
