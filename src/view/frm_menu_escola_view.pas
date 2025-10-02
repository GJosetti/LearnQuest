unit frm_menu_escola_view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, my_contracts, Sessao, frm_menu_escola_controller;

type
  TMode = (m_Add,m_Edit);
  Tfrm_menuEscola = class(TForm, IEscolaAdminView)
    d_Src_membros_escola: TDataSource;
    pnl_membros_EscolaMenu: TPanel;
    dbg_membrosEscola: TDBGrid;
    btn_adicionar_EscolaMenu: TPanel;
    btn_remover_EscolaMenu: TPanel;
    btn_editar_EscolaMenu: TPanel;
    pnl_addNEdit_EscolaMenu: TPanel;
    pnl_title_addNEdit_EscolaMenu: TLabel;
    lbl_nome_edit_addNEdit_EscolaMenu: TLabel;
    lbl_passwordAdmin_addNEdit_EscolaMenu: TLabel;
    lbl_email_addNEdit_EscolaMenu: TLabel;
    edt_nome_addNEdit_EscolaMenu: TEdit;
    btn_concluir_addNEdit_EscolaMenu: TPanel;
    btn_cancelar_addNEdit_EscolaMenu: TPanel;
    edt_password_addNEdit__EscolaMenu: TEdit;
    edt_email_addNEdit_EscolaMenu: TEdit;
    pnl_home_EscolaMenu: TPanel;
    pnl_sideMenu_EscolaMenu: TPanel;
    Membros: TButton;
    Home: TButton;
    cb_role_addNEdit_EscolaMenu: TComboBox;
    lbl_role_addNEdit_EscolaAdmin: TLabel;
    procedure MembrosClick(Sender: TObject);
    procedure HomeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_adicionar_EscolaMenuClick(Sender: TObject);
    procedure btn_cancelar_addNEdit_EscolaMenuClick(Sender: TObject);
    procedure btn_editar_EscolaMenuClick(Sender: TObject);
    procedure btn_concluir_addNEdit_EscolaMenuClick(Sender: TObject);
  private
    { Private declarations }
    FID : Integer;
    FController : IMenuEscolaController;
    Fmode : TMode;
    procedure ClearAllEdits;
  public
   function GetNome:String;
    function GetPassword: String;
    function GetEmail: String;
    function GetID : Integer;
    function GetRole: Integer;
    function CamposValidos: Boolean;
  end;

var
  frm_menuEscola: Tfrm_menuEscola;

implementation

{$R *.dfm}

{ Tfrm_menuEscola }


procedure Tfrm_menuEscola.btn_adicionar_EscolaMenuClick(Sender: TObject);
begin

  pnl_addNEdit_EscolaMenu.Visible := true;
  Fmode := m_Add;
end;

procedure Tfrm_menuEscola.btn_cancelar_addNEdit_EscolaMenuClick(
  Sender: TObject);
begin
  pnl_addNEdit_EscolaMenu.Visible := false;
  ClearAllEdits;

end;

procedure Tfrm_menuEscola.btn_concluir_addNEdit_EscolaMenuClick(
  Sender: TObject);
begin

  if Fmode = m_Add then begin
    FController.AdicionarUsuario;
  end;
  pnl_addNEdit_EscolaMenu.Visible := false;
  FController.AtualizarTabelaMembros;
  ClearAllEdits;
end;

procedure Tfrm_menuEscola.btn_editar_EscolaMenuClick(Sender: TObject);
begin
  pnl_addNEdit_EscolaMenu.Visible := true;
  Fmode := m_Edit;
end;

function Tfrm_menuEscola.CamposValidos: Boolean;
begin

end;



procedure Tfrm_menuEscola.ClearAllEdits;
begin
  edt_nome_addNEdit_EscolaMenu.Clear;
  edt_password_addNEdit__EscolaMenu.Clear;
  edt_email_addNEdit_EscolaMenu.Clear;
  cb_role_addNEdit_EscolaMenu.ItemIndex := -1;
  cb_role_addNEdit_EscolaMenu.TextHint := 'Selecione um tipo:'
end;

procedure Tfrm_menuEscola.FormCreate(Sender: TObject);
begin
  if not Assigned(FController) then begin
    FController := TMenuAdminController.Create(Self);
  end;
  cb_role_addNEdit_EscolaMenu.Items.Add('Professor');
  cb_role_addNEdit_EscolaMenu.Items.Add('Estudante');
end;

function Tfrm_menuEscola.GetEmail: String;
begin
  Result := edt_email_addNEdit_EscolaMenu.Text;
end;

function Tfrm_menuEscola.GetID: Integer;
begin
  Result := FID;
end;

function Tfrm_menuEscola.GetNome: String;
begin
  Result := edt_nome_addNEdit_EscolaMenu.Text;
end;

function Tfrm_menuEscola.GetPassword: String;
begin
  Result := edt_password_addNEdit__EscolaMenu.Text;
end;

function Tfrm_menuEscola.GetRole: Integer;
begin
  //Começa em 0

  Result := (cb_role_addNEdit_EscolaMenu.ItemIndex + 3); //Começa em 0 e 1 é administrador e 2 é escola
end;

procedure Tfrm_menuEscola.HomeClick(Sender: TObject);
begin

  pnl_home_EscolaMenu.Visible := true;
  pnl_membros_EscolaMenu.Visible := false;
  //Limpar Lista na memória

end;

procedure Tfrm_menuEscola.MembrosClick(Sender: TObject);
begin
 //MUDAR DE TELA: 1- Deixar home invisivel 2- deixar escola visivel 3 - atualizar tabela de escolas :)
 pnl_home_EscolaMenu.Visible := false;
 pnl_membros_EscolaMenu.Visible := true;
 if Assigned(d_Src_membros_escola) then begin
   d_Src_membros_escola.DataSet := nil; // limpa antes
 end;
  d_Src_membros_escola.DataSet := FController.AtualizarTabelaMembros;
  dbg_membrosEscola.DataSource := d_Src_membros_escola;



end;

end.
