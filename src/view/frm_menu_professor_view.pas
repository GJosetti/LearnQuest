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
    dbg_turmas: TDBGrid;
    btn_adicionar_adminMenu: TPanel;
    btn_editar_adminMenu: TPanel;
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
    procedure btn_minhas_turmasClick(Sender: TObject);
    procedure btn_homeClick(Sender: TObject);
  private
    { Private declarations }
    FController : ITelaProfessorController;
  public
   procedure AtualizarTabelaAtividades;
  end;

var
  frm_professor: Tfrm_menu_professor;



implementation
uses frm_login_view;

{$R *.dfm}

procedure Tfrm_menu_professor.AtualizarTabelaAtividades;
begin
  if Assigned(d_src_atividades) then
    d_src_atividades.DataSet := nil;

  d_src_atividades.DataSet := FController.AtualizarTabelaAtividades;
  dbg_atividades.DataSource := d_src_atividades;
end;

procedure Tfrm_menu_professor.btn_homeClick(Sender: TObject);
begin
  pnl_minhas_turmas.Visible := false;
  pnl_minhas_atividades.Visible := false;
  pnl_home_adminMenu.Visible := true;
end;

procedure Tfrm_menu_professor.btn_minhas_atividadesClick(Sender: TObject);
begin
  pnl_minhas_turmas.Visible := false;
  pnl_home_adminMenu.Visible := false;



  d_src_atividades.DataSet := FController.AtualizarTabelaAtividades;
  dbg_atividades.DataSource := d_src_atividades;


  pnl_minhas_atividades.Visible := true;

end;

procedure Tfrm_menu_professor.btn_minhas_turmasClick(Sender: TObject);
begin
    pnl_minhas_atividades.Visible := false;
    pnl_minhas_turmas.Visible := true;
    pnl_home_adminMenu.Visible := false;

    if(Assigned(d_src_turmas)) then begin
      d_src_turmas := nil;
    end;
    d_src_turmas.DataSet := FController.AtualizarTabelaTurmas;
    dbg_turmas.DataSource := d_src_turmas;

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
  frm_criar_atividades := Tfrm_criar_atividades.Create(mEdit, FID, Self);
  frm_criar_atividades.ShowModal;
end;

procedure Tfrm_menu_professor.pnl_adicionar_atividadesClick(Sender: TObject);
begin
    frm_criar_atividades := Tfrm_criar_atividades.Create(mCreate, 0,Self);
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
