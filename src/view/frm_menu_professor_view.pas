unit frm_menu_professor_view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, my_contracts, frm_menu_professor_controller, frm_create_atividade_view, atividade_entity,
  Vcl.Imaging.pngimage;

type
  Tfrm_menu_professor = class(TForm, ITelaProfessorView)
    d_src_turmas: TDataSource;
    pnl_minhas_turmas: TPanel;
    dbg_turmas: TDBGrid;
    pnl_home_adminMenu: TPanel;
    pnl_sideMenu: TPanel;
    pnl_minhas_atividades: TPanel;
    dbg_atividades: TDBGrid;
    d_src_atividades: TDataSource;
    dbg_atividadesToLink: TDBGrid;
    pnl_link_atividade_turma: TPanel;
    lbl_nome_turma: TLabel;
    btn_link: TPanel;
    btn_cancel_link_atividade: TPanel;
    bg_atividades: TImage;
    bg_turmas: TImage;
    SideMenu: TImage;
    pnl_back: TImage;
    Image1: TImage;
    pnl_adicionar_atividades: TImage;
    pnL_edit_atividade: TImage;
    pbl_remover_atividades: TImage;
    btn_minhas_atividades: TImage;
    btn_home: TImage;
    btn_minhas_turmas: TImage;
    pnl_desempenho_turmas: TImage;
    btn_atribuir_atividade: TImage;
    procedure pnl_backClick(Sender: TObject);
    procedure btn_minhas_atividadesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pnl_adicionar_atividadesClick(Sender: TObject);
    procedure pnL_edit_atividadeClick(Sender: TObject);
    procedure btn_minhas_turmasClick(Sender: TObject);
    procedure btn_homeClick(Sender: TObject);
    procedure btn_atribuir_atividadeClick(Sender: TObject);
    procedure btn_linkClick(Sender: TObject);
    procedure btn_cancel_link_atividadeClick(Sender: TObject);
    procedure pnl_desempenho_turmasClick(Sender: TObject);
    procedure pbl_remover_atividadesClick(Sender: TObject);
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

procedure Tfrm_menu_professor.btn_atribuir_atividadeClick(Sender: TObject);
var
Fnome : String;
begin
  FNome := dbg_turmas.DataSource.DataSet.FieldByName('turma_name').AsString;
  pnl_link_atividade_turma.Visible := true;
  d_src_atividades.DataSet := FController.AtualizarTabelaAtividades;
  dbg_atividadesToLink.DataSource := d_src_atividades;
  lbl_nome_turma.Caption := Fnome;

end;

procedure Tfrm_menu_professor.btn_cancel_link_atividadeClick(Sender: TObject);
begin
  pnl_link_atividade_turma.Visible := false;
end;

procedure Tfrm_menu_professor.btn_homeClick(Sender: TObject);
begin
  pnl_minhas_turmas.Visible := false;
  pnl_minhas_atividades.Visible := false;
  pnl_home_adminMenu.Visible := true;
end;

procedure Tfrm_menu_professor.btn_linkClick(Sender: TObject);
var
FIDAtividade : Integer;
FIDTurma : Integer;
begin
  FIDTurma := dbg_turmas.DataSource.DataSet.FieldByName('id').AsInteger;
  FIDAtividade := dbg_atividadesToLink.DataSource.DataSet.FieldByName('id').AsInteger;
  FController.LinkAtividades(FIDAtividade,FIDTurma);
  ShowMessage('Atividade atribuída com sucesso');
  pnl_link_atividade_turma.Visible := false;
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
    pnl_link_atividade_turma.Visible := false;

    if(Assigned(d_src_turmas)) then begin
     // d_src_turmas := nil;
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

procedure Tfrm_menu_professor.pnL_edit_atividadeClick(Sender: TObject);
var
FID : Integer;
FAtividade : atividade_Model;

begin
  FID := dbg_atividades.DataSource.DataSet.FieldByName('id').AsInteger;

  frm_criar_atividades := Tfrm_criar_atividades.Create(mEdit, FID, Self);
  frm_criar_atividades.FMateriaName := dbg_atividades.DataSource.DataSet.FieldByName('name').AsString;
  frm_criar_atividades.ShowModal;
end;

procedure Tfrm_menu_professor.pbl_remover_atividadesClick(Sender: TObject);
var
  FID : Integer;
  FAtividade : atividade_Model;
begin
  if (dbg_atividades.DataSource = nil) or
     (dbg_atividades.DataSource.DataSet = nil) or
     (not dbg_atividades.DataSource.DataSet.Active) or
     (dbg_atividades.DataSource.DataSet.IsEmpty) then
  begin
    ShowMessage('Nenhum usuário selecionado.');
    Exit;
  end;

  FID := dbg_atividades.DataSource.DataSet.FieldByName('id').AsInteger;
  FAtividade := FController.FindByID(FID);

  //Confirmação de exclusão
  if MessageDlg('Deseja realmente excluir o registro?', mtConfirmation,
                [mbYes, mbNo], 0) = mrYes then
  begin
    FController.DeleteAtividade(FID);

    // Atualiza grid de membros

    d_src_atividades.DataSet := FController.AtualizarTabelaAtividades;
    dbg_atividades.DataSource := d_src_atividades;

    ShowMessage('Registro excluído!');
  end;
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

procedure Tfrm_menu_professor.pnl_desempenho_turmasClick(Sender: TObject);
begin
  FController.ShowReportAtividades;
end;

end.
