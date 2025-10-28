unit frm_menu_professor_view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, my_contracts;

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
    procedure pnl_backClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_professor: Tfrm_menu_professor;

implementation
uses frm_login_view;

{$R *.dfm}

procedure Tfrm_menu_professor.pnl_backClick(Sender: TObject);
begin
  Self.Hide;
  frm_login := Tfrm_login.Create(nil);
  frm_login.ShowModal;
  Self.Close;
end;

end.
