unit frm_menu_escola_view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, my_contracts, Sessao, frm_menu_escola_controller, user_DTO,turma_DTO,users_entity, System.Generics.Collections, App_Consts, materia_entity,
  Vcl.Imaging.pngimage;

type
  TMode = (m_Add,m_Edit);
  Tfrm_menuEscola = class(TForm, IEscolaAdminView)
    d_Src_membros_escola: TDataSource;
    d_Src_turmasEscola: TDataSource; // ADICIONADO: DataSource separado para turmas
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
    Turmas: TButton;
    pnl_turmas_EscolaMenu: TPanel;
    dbg_turmasEscola: TDBGrid;
    btn_AdicionarTurmaMenu: TPanel;
    btn_RemoverTurmaMenu: TPanel;
    btn_EditarTurmaMenu: TPanel;
    pnl_addNEdit_Turma_EscolaMenu: TPanel;
    lbl_title_addNEdit_Turma_EscolaMenu: TLabel;
    lbl_Nome_Turma_addNEdit_Escola_Menu: TLabel;
    lbl_Descricao_addNEdit_Turma_EscolaMenu: TLabel;
    lbl_professorResponsavel_addNEdit_Turma_EscolaMenu: TLabel;
    edt_Nome_Turma_EscolaMenu: TEdit;
    btn_concluir_addNEdit_Turma_EscolaMenu: TPanel;
    btn_Sair_addNEdit_Turma_EscolaMenu: TPanel;
    edt_Descricao_addNEdit_Turma_EscolaMenu: TEdit;
    cb_ProfessorResponsavel_AddNEdit_Turma_EscolaMenu: TComboBox;
    pnl_participantes_Turma: TPanel;
    dbg_participantes_turma: TDBGrid;
    btn_ListarMembros: TPanel;
    btn_Vincular_Aluno: TPanel;
    btn_remover_aluno: TPanel;
    btn_back_participantes_Escola_Menu: TPanel;
    cb_alunos_participantes_EscolaMenu: TComboBox;
    d_Src_participantes_turma: TDataSource;
    btn_relatorio_desempenho_escola: TButton;
    pnl_desempenho: TPanel;
    pnl_desempenho_escola: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel1: TPanel;
    Matérias: TButton;
    pnl_materias: TPanel;
    dbg_materias: TDBGrid;
    btn_adicionar_materias: TPanel;
    btn_remover_materias: TPanel;
    btn_editar_materias: TPanel;
    pnl_addNEdit_materias: TPanel;
    lbl_title_pnl_addNEdit_Materias: TLabel;
    lbl_nome_pnl_addNEdit_materias: TLabel;
    lbl_descricao_pnl_addNEdit_materias: TLabel;
    edt_nome_pnl_addNEdit_materias: TEdit;
    btn_concluir_pnl_addNEdit_materias: TPanel;
    btn_sair_pnl_addNEdit_materias: TPanel;
    edt_descricao_pnl_addNEdit_materias: TEdit;
    d_Src_materias: TDataSource;
    SideMenu: TImage;
    pnl_back_adminMenu: TImage;
    img_panel_back: TImage;
    bg_enabled: TImage;
    bg_home: TImage;
    bg_materias: TImage;
    bg_turmas: TImage;
    procedure MembrosClick(Sender: TObject);
    procedure HomeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_adicionar_EscolaMenuClick(Sender: TObject);
    procedure btn_cancelar_addNEdit_EscolaMenuClick(Sender: TObject);
    procedure btn_editarTurma_EscolaMenuClick(Sender: TObject);
    procedure btn_concluir_addNEdit_EscolaMenuClick(Sender: TObject);
    procedure TurmasClick(Sender: TObject);
    procedure btn_AdicionarTurmaMenuClick(Sender: TObject);
    procedure dbg_membrosEscolaColumnMoved(Sender: TObject; FromIndex,
      ToIndex: LongInt);
    procedure FormDestroy(Sender: TObject);
    procedure btn_remover_EscolaMenuClick(Sender: TObject);
    procedure btn_Sair_addNEdit_Turma_EscolaMenuClick(Sender: TObject);
    procedure btn_concluir_addNEdit_Turma_EscolaMenuClick(Sender: TObject);
    procedure btn_RemoverTurmaMenuClick(Sender: TObject);
    procedure btn_editar_EscolaMenuClick(Sender: TObject);
    procedure btn_ListarMembrosClick(Sender: TObject);
    procedure btn_back_participantes_Escola_MenuClick(Sender: TObject);
    procedure btn_Vincular_AlunoClick(Sender: TObject);
    procedure btn_remover_alunoClick(Sender: TObject);

    procedure btn_relatorio_desempenho_escolaClick(Sender: TObject);
    procedure pnl_desempenho_escolaClick(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure MatériasClick(Sender: TObject);
    procedure btn_adicionar_materiasClick(Sender: TObject);
    procedure btn_concluir_pnl_addNEdit_materiasClick(Sender: TObject);
    procedure btn_editar_materiasClick(Sender: TObject);
    procedure pnl_back_adminMenuClick(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
  private
    { Private declarations }
    FID : Integer;
    FIDMateria : Integer;
    FController : IMenuEscolaController;
    Fmode : TMode;
    FPreventColumnMove : Boolean;
    FIDTurmaSelected : Integer;
    procedure ClearAllEdits;
  public
   function GetIDTurmaSelecionada : Integer;
   function GetNome:String;
    function GetPassword: String;
    function GetEmail: String;
    function GetID : Integer;
    function GetRole: Integer;
    function CamposValidosUsuario: Boolean;
    function CamposValidosTurma: Boolean;
    function CamposValidosMaterias: Boolean;
    function GetNomeTurma : String;
    function GetDescTurma : String;
    function GetIDProfessorTurma: Integer;
    procedure PopularCBProfessores();
    procedure PopularCBParticipantes();

    function GetNomeMateria() : String ;
    function GetDescricaoMateria() : String;
  end;

var
  frm_menuEscola: Tfrm_menuEscola;

implementation

uses frm_login_view;

{$R *.dfm}

{ Tfrm_menuEscola }

procedure Tfrm_menuEscola.btn_AdicionarTurmaMenuClick(Sender: TObject);
begin
  Fmode := m_Add;
  pnl_addNEdit_Turma_EscolaMenu.Visible := true;
  PopularCBProfessores;
end;

procedure Tfrm_menuEscola.btn_adicionar_EscolaMenuClick(Sender: TObject);
begin
  pnl_addNEdit_EscolaMenu.Visible := true;
  lbl_role_addNEdit_EscolaAdmin.Visible := true;
  cb_role_addNEdit_EscolaMenu.Visible := true;
  Fmode := m_Add;
end;

procedure Tfrm_menuEscola.btn_adicionar_materiasClick(Sender: TObject);
begin
  lbl_title_pnl_addNEdit_Materias.Caption := 'Adicionar Matéria';
  pnl_addNEdit_materias.Visible := true;
  Fmode := m_Add;
end;

procedure Tfrm_menuEscola.btn_back_participantes_Escola_MenuClick(
  Sender: TObject);
begin
  pnl_participantes_Turma.Visible := False;
end;

procedure Tfrm_menuEscola.btn_cancelar_addNEdit_EscolaMenuClick(
  Sender: TObject);
begin
  pnl_addNEdit_materias.Visible := false;
  ClearAllEdits;
end;

procedure Tfrm_menuEscola.btn_concluir_addNEdit_EscolaMenuClick(
  Sender: TObject);
begin
  if CamposValidosUsuario then
  begin
    if Fmode = m_Add then begin
      FController.AdicionarUsuario;
     end else if Fmode = m_Edit then begin
      FController.Update(FID);
    end;


    pnl_addNEdit_EscolaMenu.Visible := false;


    d_Src_membros_escola.DataSet := FController.AtualizarTabelaMembros;
    dbg_membrosEscola.DataSource := d_Src_membros_escola;

    ClearAllEdits;
  end;
end;

procedure Tfrm_menuEscola.btn_concluir_addNEdit_Turma_EscolaMenuClick(Sender: TObject);
begin
  if CamposValidosTurma then
  begin
    // Agora sim, salva
    if (Fmode = m_Add) then
      FController.AdicionarTurma
    else begin
      FController.UpdateTurma(FID);
    end;


    // Atualiza a tabela de turmas
    d_Src_turmasEscola.DataSet := FController.AtualizarTabelaTurmas;
    dbg_turmasEscola.DataSource := d_Src_turmasEscola;


    pnl_addNEdit_Turma_EscolaMenu.Visible := false;
    ClearAllEdits;
  end;
end;


procedure Tfrm_menuEscola.btn_concluir_pnl_addNEdit_materiasClick(
  Sender: TObject);
begin
   if CamposValidosMaterias then
  begin
    if Fmode = m_Add then begin
      FController.AdicionarMateria;
     end else if Fmode = m_Edit then begin
      FController.UpdateMateria(FIDMateria);
    end;


    pnl_addNEdit_materias.Visible := false;


    d_Src_materias.DataSet := FController.AtualizarTabelaMaterias;
    dbg_materias.DataSource := d_Src_materias;

    ClearAllEdits;
  end;
end;

procedure Tfrm_menuEscola.btn_editarTurma_EscolaMenuClick(Sender: TObject);
var
  FName: String;
  FDTO : TTurmaDTO;
begin
  FMode := m_Edit;
  // validação: há turma selecionada?
  if (dbg_turmasEscola.DataSource = nil) or
     (dbg_turmasEscola.DataSource.DataSet = nil) or
     (not dbg_turmasEscola.DataSource.DataSet.Active) or
     (dbg_turmasEscola.DataSource.DataSet.IsEmpty) then
  begin
    ShowMessage('Nenhuma turma selecionada.');
    Exit;
  end;

  pnl_addNEdit_EscolaMenu.Visible := true;
  Fmode := m_Edit;

  FName := dbg_turmasEscola.DataSource.DataSet.FieldByName('turma_name').AsString;
  FDTO := FController.FindByNameTurmas(FName);

  if FDTO = nil then
  begin
    ShowMessage('Turma não encontrada.');
    Exit;
  end;

  pnl_addNEdit_Turma_EscolaMenu.Visible := true;
  edt_Nome_Turma_EscolaMenu.Text := FDTO.Nome;
  edt_Descricao_addNEdit_Turma_EscolaMenu.Text := FDTO.Descricao;
  PopularCBProfessores;



  cb_ProfessorResponsavel_AddNEdit_Turma_EscolaMenu.ItemIndex := cb_ProfessorResponsavel_AddNEdit_Turma_EscolaMenu.Items.IndexOf(dbg_turmasEscola.DataSource.DataSet.FieldByName('user_name').AsString);
  FID := FDTO.ID;
end;

procedure Tfrm_menuEscola.btn_editar_EscolaMenuClick(Sender: TObject);
var
  FName: String;
  FDTO: TUserDTO;
begin
  // garante que há algo selecionado no grid de membros
  if (dbg_membrosEscola.DataSource = nil) or
     (dbg_membrosEscola.DataSource.DataSet = nil) or
     (not dbg_membrosEscola.DataSource.DataSet.Active) or
     (dbg_membrosEscola.DataSource.DataSet.IsEmpty) then
  begin
    ShowMessage('Nenhum usuário selecionado.');
    Exit;
  end;

  // obtém o nome do usuário selecionado
  FName := dbg_membrosEscola.DataSource.DataSet.FieldByName('user_name').AsString;

  // busca DTO correspondente
  FDTO := FController.FindByName(FName);

  if FDTO = nil then
  begin
    ShowMessage('Usuário não encontrado.');
    Exit;
  end;

  // bloqueia caso seja o admin
  if (FDTO.Role = ROLE_ESCOLA) then
  begin
    raise Exception.Create('O usuário Administrador não pode ser alterado manualmente. Entre em contato com o suporte.');
  end;

  // muda visibilidade dos painéis
  pnl_addNEdit_EscolaMenu.Visible := True;
  pnl_addNEdit_Turma_EscolaMenu.Visible := False;
  pnl_participantes_Turma.Visible := False;
  cb_role_addNEdit_EscolaMenu.Visible := false;
  lbl_role_addNEdit_EscolaAdmin.Visible := false;
  // define modo
  FMode := m_Edit;

  // preenche campos
  edt_nome_addNEdit_EscolaMenu.Text := FDTO.Name;
  edt_password_addNEdit__EscolaMenu.Text := FDTO.Password;
  cb_role_addNEdit_EscolaMenu.ItemIndex := FDTO.Role - 3;
  edt_email_addNEdit_EscolaMenu.Text := FDTO.Email;
  FID := FDTO.ID;
end;

procedure Tfrm_menuEscola.btn_editar_materiasClick(Sender: TObject);
var
FName: String;
FModel: TMateria;
begin

Fmode := m_Edit;

FName := dbg_materias.DataSource.DataSet.FieldByName('name').AsString;
FModel := FController.FindByNameMateria(FName);

FIDMateria := FmODEL.GetID;
lbl_title_pnl_addNEdit_Materias.Caption := 'Editar Matéria';
pnl_addNEdit_materias.Visible := true;

edt_nome_pnl_addNEdit_materias.Text := FModel.GetName;
edt_descricao_pnl_addNEdit_materias.Text := FModel.GetDescricao;

end;

procedure Tfrm_menuEscola.btn_ListarMembrosClick(Sender: TObject);
var
  FName: String;
  FTurmaDTO: TTurmaDTO;
begin
  // valida turma selecionada
  if (dbg_turmasEscola.DataSource = nil) or
     (dbg_turmasEscola.DataSource.DataSet = nil) or
     (not dbg_turmasEscola.DataSource.DataSet.Active) or
     (dbg_turmasEscola.DataSource.DataSet.IsEmpty) then
  begin
    ShowMessage('Nenhuma turma selecionada.');
    Exit;
  end;

  // --- Obtém o nome da turma selecionada no grid
  FName := dbg_turmasEscola.DataSource.DataSet.FieldByName('turma_name').AsString;
  FTurmaDTO := FController.FindByNameTurmas(FName);

  if FTurmaDTO = nil then
  begin
    ShowMessage('Turma não encontrada.');
    Exit;
  end;

  FIDTurmaSelected := FTurmaDTO.ID;

  // --- Atualiza a lista de estudantes associados (controller pode preparar dados)
  FController.GetEstudantesPorTurma(FIDTurmaSelected);

  pnl_participantes_Turma.Visible := True;

  // --- Atualiza o dataset de participantes
  d_Src_participantes_turma.DataSet := FController.AtualizarTabelaParticipantes(FIDTurmaSelected);

  // --- Liga o DataSource ao grid
  dbg_participantes_turma.DataSource := d_Src_participantes_turma;

  // --- Atualiza o combo com participantes disponíveis
  PopularCBParticipantes;
end;

procedure Tfrm_menuEscola.btn_relatorio_desempenho_escolaClick(Sender: TObject);
begin
  pnl_materias.Visible := false;
  pnl_membros_EscolaMenu.Visible := false;
  pnl_home_EscolaMenu.Visible := false;
  pnl_turmas_EscolaMenu.Visible := false;
  pnl_desempenho.Visible := true;


  pnl_addNEdit_EscolaMenu.Visible := false;
  pnl_addNEdit_Turma_EscolaMenu.Visible := false;
   pnl_addNEdit_materias.Visible := false;

end;

procedure Tfrm_menuEscola.btn_RemoverTurmaMenuClick(Sender: TObject);
var
  FName : String;
begin
  if (dbg_turmasEscola.DataSource = nil) or
     (dbg_turmasEscola.DataSource.DataSet = nil) or
     (not dbg_turmasEscola.DataSource.DataSet.Active) or
     (dbg_turmasEscola.DataSource.DataSet.IsEmpty) then
  begin
    ShowMessage('Nenhuma turma selecionada.');
    Exit;
  end;

  FName := dbg_turmasEscola.DataSource.DataSet.FieldByName('turma_name').AsString;
  //Confirmação de exclusão
  if MessageDlg('Deseja realmente excluir o registro?', mtConfirmation,
                [mbYes, mbNo], 0) = mrYes then
  begin
    FController.DeleteTurma(FName);

    d_Src_turmasEscola.DataSet := FController.AtualizarTabelaTurmas;
    dbg_turmasEscola.DataSource := d_Src_turmasEscola;

    ShowMessage('Registro excluído!');
  end;
end;

procedure Tfrm_menuEscola.btn_remover_alunoClick(Sender: TObject);
var
  user : TUserDTO;
  IDEstudante : Integer;
begin
  if (dbg_participantes_turma.DataSource = nil) or
     (dbg_participantes_turma.DataSource.DataSet = nil) or
     (not dbg_participantes_turma.DataSource.DataSet.Active) or
     (dbg_participantes_turma.DataSource.DataSet.IsEmpty) then
  begin
    ShowMessage('Nenhum participante selecionado.');
    Exit;
  end;

  user := FController.FindByName(dbg_participantes_turma.DataSource.DataSet.FieldByName('user_name').AsString);

  if MessageDlg('Deseja realmente excluir o registro?', mtConfirmation,
                [mbYes, mbNo], 0) = mrYes then
  begin
    IDEstudante := FController.GetEstudanteIDByUser(user.ID);
    FController.RemoverEstudanteDaTurma(IDEstudante,FIDTurmaSelected);

    d_Src_participantes_turma.DataSet := FController.AtualizarTabelaParticipantes(FIDTurmaSelected);

    ClearAllEdits;
    PopularCBParticipantes;
    ShowMessage('Registro Excluído!');
  end;
end;

procedure Tfrm_menuEscola.btn_remover_EscolaMenuClick(Sender: TObject);
var
  FDTO : TUserDTO;
  FName : String;
begin
  if (dbg_membrosEscola.DataSource = nil) or
     (dbg_membrosEscola.DataSource.DataSet = nil) or
     (not dbg_membrosEscola.DataSource.DataSet.Active) or
     (dbg_membrosEscola.DataSource.DataSet.IsEmpty) then
  begin
    ShowMessage('Nenhum usuário selecionado.');
    Exit;
  end;

  FName := dbg_membrosEscola.DataSource.DataSet.FieldByName('user_name').AsString;
  FDTO := FController.FindByName(FName);

  if FDTO = nil then
  begin
    ShowMessage('Usuário não encontrado.');
    Exit;
  end;

  if (FDTO.Role = ROLE_ESCOLA) then
  begin
    raise Exception.Create('Não é possível excluir o usuário administrador da escola!');
  end;

  //Confirmação de exclusão
  if MessageDlg('Deseja realmente excluir o registro?', mtConfirmation,
                [mbYes, mbNo], 0) = mrYes then
  begin
    FController.Delete(FDTO.ID);

    // Atualiza grid de membros

    d_Src_membros_escola.DataSet := FController.AtualizarTabelaMembros;
    dbg_membrosEscola.DataSource := d_Src_membros_escola;

    ShowMessage('Registro excluído!');
  end;
end;

procedure Tfrm_menuEscola.btn_Sair_addNEdit_Turma_EscolaMenuClick(
  Sender: TObject);
begin
  pnl_addNEdit_Turma_EscolaMenu.Visible := false;
  ClearAllEdits;
end;

procedure Tfrm_menuEscola.btn_Vincular_AlunoClick(Sender: TObject);
var
  user : TUserModel;
  IDEstudante : Integer;
begin
  if (cb_alunos_participantes_EscolaMenu.ItemIndex <> -1) then
  begin
    user := TUserModel(cb_alunos_participantes_EscolaMenu.Items.Objects[
      cb_alunos_participantes_EscolaMenu.ItemIndex
    ]);
    IDEstudante := FController.GetEstudanteIDByUser(user.GetID);
    FController.LinkEstudante(IDEstudante, FIDTurmaSelected);


    d_Src_participantes_turma.DataSet := FController.AtualizarTabelaParticipantes(FIDTurmaSelected);

    ClearAllEdits;
    PopularCBParticipantes;
  end
  else
    raise Exception.Create('Um Aluno deve ser selecionado!');
end;

function Tfrm_menuEscola.CamposValidosMaterias: Boolean;
begin
  if (Trim(edt_nome_pnl_addNEdit_materias.Text) = '') or
     (Trim(edt_descricao_pnl_addNEdit_materias.Text) = '') then
    raise Exception.Create('Todos os campos precisam ser preenchidos')
  else
    Result := True;
end;


function Tfrm_menuEscola.CamposValidosTurma: Boolean;
begin
  //Valida todos os campos
  if (Trim(edt_Nome_Turma_EscolaMenu.Text) = '') or
     (Trim(edt_Descricao_addNEdit_Turma_EscolaMenu.Text) = '') or
     (cb_ProfessorResponsavel_AddNEdit_Turma_EscolaMenu.ItemIndex = -1) then
    raise Exception.Create('Todos os campos precisam ser preenchidos')
  else
    Result := True;
end;

function Tfrm_menuEscola.CamposValidosUsuario: Boolean;
begin
  //Valida todos os campos
  if (Trim(edt_nome_addNEdit_EscolaMenu.Text) = '') or
     (Trim(edt_password_addNEdit__EscolaMenu.Text) = '') or
     (Trim(edt_email_addNEdit_EscolaMenu.Text) = '') or
     (cb_role_addNEdit_EscolaMenu.ItemIndex = -1) then
    raise Exception.Create('Todos os campos precisam ser preenchidos')
  else
    Result := True;
end;

procedure Tfrm_menuEscola.ClearAllEdits;
begin
  edt_nome_addNEdit_EscolaMenu.Clear;
  edt_password_addNEdit__EscolaMenu.Clear;
  edt_email_addNEdit_EscolaMenu.Clear;
  edt_nome_pnl_addNEdit_materias.Clear;
  edt_descricao_pnl_addNEdit_materias.Clear;
  cb_role_addNEdit_EscolaMenu.ItemIndex := -1;
  cb_role_addNEdit_EscolaMenu.TextHint := 'Selecione um tipo:';

  edt_Nome_Turma_EscolaMenu.Clear;
  edt_Descricao_addNEdit_Turma_EscolaMenu.Clear;
  cb_ProfessorResponsavel_AddNEdit_Turma_EscolaMenu.ItemIndex := -1;
  cb_ProfessorResponsavel_AddNEdit_Turma_EscolaMenu.TextHint := 'Selecione um Professor';
  cb_alunos_participantes_EscolaMenu.ItemIndex := -1;
  cb_alunos_participantes_EscolaMenu.TextHint := 'Selecione um Aluno';
end;

procedure Tfrm_menuEscola.dbg_membrosEscolaColumnMoved(Sender: TObject;
  FromIndex, ToIndex: LongInt);
var
  col: TColumn;
begin
  if FPreventColumnMove then Exit;

  col := dbg_membrosEscola.Columns[ToIndex];

  FPreventColumnMove := True;
  try
    // recoloca a coluna de volta à posição original (FromIndex)
    col.Index := FromIndex;
  finally
    FPreventColumnMove := False;
  end;
end;

procedure Tfrm_menuEscola.FormCreate(Sender: TObject);
begin
  if not Assigned(FController) then
  begin
    FController := TMenuAdminController.Create(Self);
  end;


  Self.Position := poScreenCenter;

  cb_role_addNEdit_EscolaMenu.Items.Add('Professor');
  cb_role_addNEdit_EscolaMenu.Items.Add('Estudante');
end;

procedure Tfrm_menuEscola.FormDestroy(Sender: TObject);
begin
  // desvincula grids
  dbg_membrosEscola.DataSource := nil;
  dbg_turmasEscola.DataSource := nil;
  dbg_participantes_turma.DataSource := nil;

end;

function Tfrm_menuEscola.GetDescricaoMateria: String;
begin
  Result := edt_descricao_pnl_addNEdit_materias.Text;
end;

function Tfrm_menuEscola.GetDescTurma: String;
begin
  Result := edt_Descricao_addNEdit_Turma_EscolaMenu.Text;
end;

function Tfrm_menuEscola.GetEmail: String;
begin
  Result := edt_email_addNEdit_EscolaMenu.Text;
end;

function Tfrm_menuEscola.GetID: Integer;
begin
  Result := FID;
end;

function Tfrm_menuEscola.GetIDProfessorTurma: Integer;
begin
  Result := FController.FindByNameProfessores(cb_ProfessorResponsavel_AddNEdit_Turma_EscolaMenu.Text).ID;
end;

function Tfrm_menuEscola.GetIDTurmaSelecionada: Integer;
begin
  Result := FIDTurmaSelected;
end;

function Tfrm_menuEscola.GetNome: String;
begin
  Result := edt_nome_addNEdit_EscolaMenu.Text;
end;

function Tfrm_menuEscola.GetNomeMateria: String;
begin
  Result := edt_nome_pnl_addNEdit_materias.Text;
end;

function Tfrm_menuEscola.GetNomeTurma: String;
begin
  Result := edt_Nome_Turma_EscolaMenu.Text;
end;

function Tfrm_menuEscola.GetPassword: String;
begin
  Result := edt_password_addNEdit__EscolaMenu.Text;
end;

function Tfrm_menuEscola.GetRole: Integer;
begin
  //Começa em 0
  Result := (cb_role_addNEdit_EscolaMenu.ItemIndex + 3); //Começa em 0 e 1 é administrador
end;

procedure Tfrm_menuEscola.HomeClick(Sender: TObject);
begin
  pnl_materias.Visible := false;
  pnl_turmas_EscolaMenu.Visible := false;
  pnl_home_EscolaMenu.Visible := true;
  pnl_membros_EscolaMenu.Visible := false;
  pnl_desempenho.Visible := false;

  pnl_addNEdit_EscolaMenu.Visible := false;
  pnl_addNEdit_Turma_EscolaMenu.Visible := false;
  pnl_addNEdit_materias.Visible := false;

end;

procedure Tfrm_menuEscola.MatériasClick(Sender: TObject);
begin
    // Muda de tela para membros
  pnl_materias.Visible := true;
  pnl_turmas_EscolaMenu.Visible := false;
  pnl_home_EscolaMenu.Visible := false;
  pnl_desempenho.Visible := false;
  pnl_membros_EscolaMenu.Visible := false;

  pnl_addNEdit_EscolaMenu.Visible := false;
  pnl_addNEdit_Turma_EscolaMenu.Visible := false;




  d_Src_materias.DataSet := FController.AtualizarTabelaMaterias;
  dbg_materias.DataSource := d_Src_materias;

end;

procedure Tfrm_menuEscola.MembrosClick(Sender: TObject);
begin
  // Muda de tela para membros
  pnl_materias.Visible := false;
  pnl_turmas_EscolaMenu.Visible := false;
  pnl_home_EscolaMenu.Visible := false;
  pnl_desempenho.Visible := false;
  pnl_membros_EscolaMenu.Visible := true;

  pnl_addNEdit_EscolaMenu.Visible := false;
  pnl_addNEdit_Turma_EscolaMenu.Visible := false;
   pnl_addNEdit_materias.Visible := false;



  d_Src_membros_escola.DataSet := FController.AtualizarTabelaMembros;
  dbg_membrosEscola.DataSource := d_Src_membros_escola;
end;

procedure Tfrm_menuEscola.Panel1Click(Sender: TObject);
begin
  //FController.ShowLastAccess
end;

procedure Tfrm_menuEscola.Panel2Click(Sender: TObject);
begin
  FController.ShowReporFrequencia;
end;

procedure Tfrm_menuEscola.pnl_back_adminMenuClick(Sender: TObject);
begin
   Self.Hide;
  frm_login := Tfrm_login.Create(nil);
  frm_login.ShowModal;
  Self.Close;
end;



procedure Tfrm_menuEscola.pnl_desempenho_escolaClick(Sender: TObject);
begin
  FController.ShowReportDesempenho;
end;

procedure Tfrm_menuEscola.PopularCBParticipantes;
var
  lst : TObjectList<TUserModel>;
  I : Integer;
begin
  lst := FController.PopularCBParticipantes;
  // OBS: não damos Free em lst aqui pois os objetos são colocados como Items.Objects[].
  // Se quiseres outro ownership model, eu ajusto.
  cb_alunos_participantes_EscolaMenu.Clear;
  cb_alunos_participantes_EscolaMenu.TextHint := 'Selecione um Aluno Para Adicionar';
  for I := 0 to (lst.Count -1) do
    cb_alunos_participantes_EscolaMenu.Items.AddObject(lst[i].GetNome, lst[i]);
end;

procedure Tfrm_menuEscola.PopularCBProfessores();
var
  I : Integer;
  sL : TStringList;
begin
  sL := FController.PopularCBProfessores;
  try
    cb_ProfessorResponsavel_AddNEdit_Turma_EscolaMenu.Clear;
    cb_ProfessorResponsavel_AddNEdit_Turma_EscolaMenu.TextHint := 'Selecione um Professor';
    for I := 0 to (sL.Count -1) do
      cb_ProfessorResponsavel_AddNEdit_Turma_EscolaMenu.Items.Add(sL[I]);
  finally

  end;
end;

procedure Tfrm_menuEscola.TurmasClick(Sender: TObject);
begin
  pnl_materias.Visible := false;
  pnl_membros_EscolaMenu.Visible := false;
  pnl_home_EscolaMenu.Visible := false;
  pnl_desempenho.Visible := false;
  pnl_turmas_EscolaMenu.Visible := true;

  pnl_addNEdit_EscolaMenu.Visible := false;
  pnl_addNEdit_Turma_EscolaMenu.Visible := false;
   pnl_addNEdit_materias.Visible := false;

  // libera dataset antigo (se criado dinamicamente)
 
  d_Src_turmasEscola.DataSet := FController.AtualizarTabelaTurmas;
  dbg_turmasEscola.DataSource := d_Src_turmasEscola;
end;

end.

