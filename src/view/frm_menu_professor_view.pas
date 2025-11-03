unit frm_menu_professor_view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, my_contracts, frm_menu_professor_controller, frm_create_atividade_view, atividade_entity;

type
  Tfrm_menu_professor = class(TForm, ITelaProfessorView)
    d_src_turmas: TDataSource;
    pnl_minhas_turmas: TPanel;
    dbg_escolas: TDBGrid;
    btn_adicionar_adminMenu: TPanel;
    btn_remover_adminMenu: TPanel;
    btn_editar_adminMenu: TPanel;
    pnl_addNEdit_adminMenu: TPanel;
    pnl_title_addNEdit_adminMenu: TLabel;
    lbl_nome_edit_addNEdit_adminMenu: TLabel;
    lbl_CEP_addNEdit_adminMenu: TLabel;
    lbl_nomeAdmin_addNEdit_adminMenu: TLabel;
    lbl_passwordAdmin_addNEdit_adminMenu: TLabel;
    lbl_title_UserAdmin_pnl_AddNEdit_adminMenu: TLabel;
    lbl_email_addNEdit_adminMenu: TLabel;
    edt_nome_addNEdit_adminMenu: TEdit;
    btn_concluir_addNEdit_adminMenu: TPanel;
    btn_cancelar_addNEdit_adminMenu: TPanel;
    edt_nomeUsurario_addNEdit_adminMenu: TEdit;
    edt_password_addNEdit__adminMenu: TEdit;
    edt_email_addNEdit_adminMenu: TEdit;
    edt_CEP_addNEdit_adminMenu: TMaskEdit;
    pnl_home_adminMenu: TPanel;
    pnl_sideMenu: TPanel;
    btn_minhas_turmas: TButton;
    btn_home: TButton;
    pnl_back: TPanel;
    btn_minhas_atividades: TButton;
    btn_minhas_fases: TButton;
    btn_minhas_trilhas: TButton;
    pnl_minhas_atividades: TPanel;
    dbg_atividades: TDBGrid;
    d_src_atividades: TDataSource;
    pnl_adicionar_atividades: TPanel;
    Panel1: TPanel;
    procedure pnl_backClick(Sender: TObject);
    procedure btn_minhas_atividadesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pnl_adicionar_atividadesClick(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private
    { Private declarations }
    FController : ITelaProfessorController;
  public
    { Public declarations }
  end;

var
  frm_professor: Tfrm_menu_professor;



implementation
uses frm_login_view;

{$R *.dfm}

procedure Tfrm_menu_professor.btn_minhas_atividadesClick(Sender: TObject);
begin
  pnl_minhas_turmas.Visible := false;
  pnl_home_adminMenu.Visible := false;


 if Assigned(d_src_atividades) then begin
   d_src_atividades.DataSet := nil;
 end;
  d_src_atividades.DataSet := FController.AtualizarTabelaAtividades;
  dbg_atividades.DataSource := d_src_atividades;


  pnl_minhas_atividades.Visible := true;

end;

procedure Tfrm_menu_professor.FormCreate(Sender: TObject);
begin
  dbg_atividades.Columns[2].Visible := False;
 if not Assigned(FController) then begin

   FController := TMenuProfessorController.Create;
 end;
 Self.Position := poScreenCenter;
end;

procedure Tfrm_menu_professor.Panel1Click(Sender: TObject);
var
FID : Integer;
FAtividade : atividade_Model;

begin
  FID := dbg_atividades.DataSource.DataSet.FieldByName('id').AsInteger;
  ShowMessage(FID.ToString);
  frm_criar_atividades := Tfrm_criar_atividades.Create(mEdit, FID);
  frm_criar_atividades.ShowModal;
end;

procedure Tfrm_menu_professor.pnl_adicionar_atividadesClick(Sender: TObject);
begin
    frm_criar_atividades := Tfrm_criar_atividades.Create(mCreate, 0);
    frm_criar_atividades.ShowModal;


end;

procedure Tfrm_menu_professor.pnl_backClick(Sender: TObject);
begin
  Self.Hide;
  frm_login := Tfrm_login.Create(nil);
  frm_login.ShowModal;
  Self.Close;
end;

end.
