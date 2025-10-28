unit frm_menu_escola_view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, my_contracts, Sessao, frm_menu_escola_controller, user_DTO,turma_DTO,users_entity, System.Generics.Collections, App_Consts;

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
    pnl_back_EscolaMenu: TPanel;
    pnl_participantes_Turma: TPanel;
    dbg_participantes_turma: TDBGrid;
    btn_ListarMembros: TPanel;
    btn_Vincular_Aluno: TPanel;
    btn_remover_aluno: TPanel;
    btn_back_participantes_Escola_Menu: TPanel;
    cb_alunos_participantes_EscolaMenu: TComboBox;
    d_Src_participantes_turma: TDataSource;
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
    procedure pnl_back_EscolaMenuClick(Sender: TObject);
    procedure btn_Sair_addNEdit_Turma_EscolaMenuClick(Sender: TObject);
    procedure btn_concluir_addNEdit_Turma_EscolaMenuClick(Sender: TObject);
    procedure btn_RemoverTurmaMenuClick(Sender: TObject);
    procedure btn_editar_EscolaMenuClick(Sender: TObject);
    procedure btn_ListarMembrosClick(Sender: TObject);
    procedure btn_back_participantes_Escola_MenuClick(Sender: TObject);
    procedure btn_Vincular_AlunoClick(Sender: TObject);
    procedure btn_remover_alunoClick(Sender: TObject);

  private
    { Private declarations }
    FID : Integer;

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
    function GetNomeTurma : String;
    function GetDescTurma : String;
    function GetIDProfessorTurma: Integer;
    procedure PopularCBProfessores();
    procedure PopularCBParticipantes();
  end;

var
  frm_menuEscola: Tfrm_menuEscola;

implementation

uses frm_login_view;

{$R *.dfm}

{ Tfrm_menuEscola }


procedure Tfrm_menuEscola.btn_AdicionarTurmaMenuClick(Sender: TObject);
begin
  pnl_addNEdit_Turma_EscolaMenu.Visible := true;
  PopularCBProfessores;
end;

procedure Tfrm_menuEscola.btn_adicionar_EscolaMenuClick(Sender: TObject);
begin

  pnl_addNEdit_EscolaMenu.Visible := true;
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

  pnl_addNEdit_EscolaMenu.Visible := false;
  ClearAllEdits;

end;

procedure Tfrm_menuEscola.btn_concluir_addNEdit_EscolaMenuClick(
  Sender: TObject);
begin
  if(CamposValidosUsuario)then begin
    if Fmode = m_Add then begin
      FController.AdicionarUsuario;
    end else if Fmode = m_Edit then begin
      FController.Update(FID);

    end;
    pnl_addNEdit_EscolaMenu.Visible := false;
    FController.AtualizarTabelaMembros;
    ClearAllEdits;
  end;

end;

procedure Tfrm_menuEscola.btn_concluir_addNEdit_Turma_EscolaMenuClick(
  Sender: TObject);
begin
  if(CamposValidosTurma) then begin
    if  (Fmode = m_Add) then begin

      FController.AdicionarTurma;

    end else begin

      FController.UpdateTurma(FID);

    end;
  end;



  FController.AtualizarTabelaTurmas;

  pnl_addNEdit_Turma_EscolaMenu.Visible := false;
  ClearAllEdits;
end;

procedure Tfrm_menuEscola.btn_editarTurma_EscolaMenuClick(Sender: TObject);
var
FName : String;
FDTO : TTurmaDTO;

begin
  pnl_addNEdit_EscolaMenu.Visible := true;
  Fmode := m_Edit;
  FName := dbg_turmasEscola.DataSource.DataSet.FieldByName('turma_name').AsString;
  FDTO := TTurmaDTO.Create;
   try
      pnl_addNEdit_Turma_EscolaMenu.Visible := true;
      FDTO := FController.FindByNameTurmas(FName);
      edt_Nome_Turma_EscolaMenu.Text := FDTO.Nome;
      edt_Descricao_addNEdit_Turma_EscolaMenu.Text := FDTO.Descricao;
      PopularCBProfessores;
      cb_ProfessorResponsavel_AddNEdit_Turma_EscolaMenu.ItemIndex := FDTO.ProfessorID -1 ;
      FID := FDTO.ID;


   finally

   end;





end;

procedure Tfrm_menuEscola.btn_editar_EscolaMenuClick(Sender: TObject);
var
FName : String;
FDTO : TUserDTO;

begin
  FName := dbg_turmasEscola.DataSource.DataSet.FieldByName('user_name').AsString;
  FDTO := TUserDTO.Create;
  FDTO := FController.FindByName(FName);
      if(FDTO.Role = ROLE_ESCOLA) then begin
        raise Exception.Create('O usuário Administraor não pode ser alterado manualmente, entre em contato com o suporte para fazer a alteração.');
      end;

  pnl_addNEdit_EscolaMenu.Visible := true;
  Fmode := m_Edit;



  dbg_turmasEscola.DataSource := d_Src_membros_escola;


   try




      pnl_addNEdit_Turma_EscolaMenu.Visible := true;
      edt_nome_addNEdit_EscolaMenu.Text := FDTO.Name;
      edt_password_addNEdit__EscolaMenu.Text := FDTO.Password;
      cb_role_addNEdit_EscolaMenu.ItemIndex := FDTO.Role - 3;
      edt_email_addNEdit_EscolaMenu.Text := FDTO.Email;
      FID := FDTO.ID;


   finally

   end;





end;

procedure Tfrm_menuEscola.btn_ListarMembrosClick(Sender: TObject);
var
FName : String;
FTurmaDTO : TTurmaDTO;

lst : TObjectList<TUserModel>;
I : Integer;

begin
///////Popular Tabela
  FName := dbg_turmasEscola.DataSource.DataSet.FieldByName('turma_name').AsString;
  FTurmaDTO := FController.FindByNameTurmas(Fname);
  FIDTurmaSelected := FTurmaDTO.ID;
  FController.GetEstudantesPorTurma(FIDTurmaSelected);

  pnl_participantes_Turma.Visible := true;

  if Assigned(d_Src_participantes_turma.DataSet) then begin
   d_Src_participantes_turma.DataSet := nil; // limpa antes
 end;
  d_Src_participantes_turma.DataSet := FController.AtualizarTabelaParticipantes(FIDTurmaSelected);
  dbg_participantes_turma.DataSource := d_Src_participantes_turma;


  PopularCBParticipantes;




 end;

procedure Tfrm_menuEscola.btn_RemoverTurmaMenuClick(Sender: TObject);
var
FName : String;
begin

FName := dbg_turmasEscola.DataSource.DataSet.FieldByName('turma_name').AsString;
//Confirmação de exclusão
if MessageDlg('Deseja realmente excluir o registro?', mtConfirmation,
              [mbYes, mbNo], 0) = mrYes then
begin
  FController.DeleteTurma(FName);
  FController.AtualizarTabelaTurmas;
  ShowMessage('Registro excluído!');
end;


end;

procedure Tfrm_menuEscola.btn_remover_alunoClick(Sender: TObject);
var
user : TUserDTO;
IDEstudante : Integer;

begin

  user := FController.FindByName(dbg_participantes_turma.DataSource.DataSet.FieldByName('user_name').AsString);


  if MessageDlg('Deseja realmente excluir o registro?', mtConfirmation,
              [mbYes, mbNo], 0) = mrYes then
  begin

    IDEstudante := FController.GetEstudanteIDByUser(user.ID);




    FController.RemoverEstudanteDaTurma(IDEstudante,FIDTurmaSelected);

    FController.AtualizarTabelaParticipantes(FIDTurmaSelected);
    ClearAllEdits;

    PopularCBParticipantes;
    ShowMessage('Registro Excluído!')
  end;

end;

procedure Tfrm_menuEscola.btn_remover_EscolaMenuClick(Sender: TObject);
var
FDTO : TUserDTO;
FName : String;
begin

FName := dbg_membrosEscola.DataSource.DataSet.FieldByName('user_name').AsString;
FDTO := FController.FindByName(FName);

if(FDTO.Role = ROLE_ESCOLA) then begin
  raise Exception.Create('Não é possível excluir o usuário administrador da escola!');
end;

//Confirmação de exclusão
if MessageDlg('Deseja realmente excluir o registro?', mtConfirmation,
              [mbYes, mbNo], 0) = mrYes then
begin
  FController.Delete(FDTO.ID);
  FController.AtualizarTabelaMembros;
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


  if(cb_alunos_participantes_EscolaMenu.ItemIndex <> -1) then begin
     user := TUserModel(cb_alunos_participantes_EscolaMenu.Items.Objects[
      cb_alunos_participantes_EscolaMenu.ItemIndex
    ]);
    IDEstudante := FController.GetEstudanteIDByUser(user.GetID);
    FController.LinkEstudante(IDEstudante, FIDTurmaSelected);


    FController.AtualizarTabelaParticipantes(FIDTurmaSelected);
    ClearAllEdits;

    PopularCBParticipantes;
  end else begin
    raise Exception.Create('Um Aluno deve ser selecionado!');
  end;


end;

function Tfrm_menuEscola.CamposValidosTurma: Boolean;
begin
     //Valida todos os campos
  if(edt_Nome_Turma_EscolaMenu.Text = Trim('')) or (edt_Descricao_addNEdit_Turma_EscolaMenu.Text = Trim('')) or (cb_ProfessorResponsavel_AddNEdit_Turma_EscolaMenu.ItemIndex = - 1) then begin
    raise Exception.Create('Todos os campos precisam ser preenchidos');
  end else begin
    Result := True;
  end;
end;

function Tfrm_menuEscola.CamposValidosUsuario: Boolean;
begin
     //Valida todos os campos
  if(edt_nome_addNEdit_EscolaMenu.Text = Trim('')) or (edt_password_addNEdit__EscolaMenu.Text = Trim('')) or (edt_email_addNEdit_EscolaMenu.Text = Trim('')) or (cb_role_addNEdit_EscolaMenu.ItemIndex = -1) then begin

    raise Exception.Create('Todos os campos precisam ser preenchidos');
  end else begin
    Result := True;
  end;
end;

procedure Tfrm_menuEscola.ClearAllEdits;
begin
  edt_nome_addNEdit_EscolaMenu.Clear;
  edt_password_addNEdit__EscolaMenu.Clear;
  edt_email_addNEdit_EscolaMenu.Clear;
  cb_role_addNEdit_EscolaMenu.ItemIndex := -1;
  cb_role_addNEdit_EscolaMenu.TextHint := 'Selecione um tipo:';


  edt_Nome_Turma_EscolaMenu.Clear;
  edt_Descricao_addNEdit_Turma_EscolaMenu.Clear;
  cb_ProfessorResponsavel_AddNEdit_Turma_EscolaMenu.ItemIndex := -1;
  cb_ProfessorResponsavel_AddNEdit_Turma_EscolaMenu.TextHint := 'Selecione um Professor';
  cb_alunos_participantes_EscolaMenu.ItemIndex := -1;
  cb_alunos_participantes_EscolaMenu.TextHint := 'Selecione um Aluno'

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
  if not Assigned(FController) then begin
    FController := TMenuAdminController.Create(Self);
  end;

  cb_role_addNEdit_EscolaMenu.Items.Add('Professor');
  cb_role_addNEdit_EscolaMenu.Items.Add('Estudante');
end;

procedure Tfrm_menuEscola.FormDestroy(Sender: TObject);
begin
   dbg_membrosEscola.DataSource := nil;
    dbg_turmasEscola.DataSource := nil;
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
  Result := FController.FindByNameProfessores(cb_ProfessorResponsavel_AddNEdit_Turma_EscolaMenu.Text).ID;//FAZER UM FINDBYNAME PARA PROFESSORES
end;

function Tfrm_menuEscola.GetIDTurmaSelecionada: Integer;
begin
  Result := FIDTurmaSelected;
end;

function Tfrm_menuEscola.GetNome: String;
begin
  Result := edt_nome_addNEdit_EscolaMenu.Text;
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
  pnl_turmas_EscolaMenu.Visible := false;
  pnl_home_EscolaMenu.Visible := true;
  pnl_membros_EscolaMenu.Visible := false;
  //Limpar Lista na memória

end;

procedure Tfrm_menuEscola.MembrosClick(Sender: TObject);
begin
 //MUDAR DE TELA: 1- Deixar home invisivel 2- deixar escola visivel 3 - atualizar tabela de escolas :)
 pnl_turmas_EscolaMenu.Visible := false;
 pnl_home_EscolaMenu.Visible := false;
 pnl_membros_EscolaMenu.Visible := true;

 pnl_addNEdit_EscolaMenu.Visible := false;
 pnl_addNEdit_Turma_EscolaMenu.Visible := false;

 if Assigned(d_Src_membros_escola) then begin
   d_Src_membros_escola.DataSet := nil; // limpa antes
 end;
  d_Src_membros_escola.DataSet := FController.AtualizarTabelaMembros;
  dbg_membrosEscola.DataSource := d_Src_membros_escola;



end;

procedure Tfrm_menuEscola.pnl_back_EscolaMenuClick(Sender: TObject);
begin
  Self.Hide;
  frm_login := Tfrm_login.Create(nil);
  frm_login.ShowModal;
  Self.Close;
end;

procedure Tfrm_menuEscola.PopularCBParticipantes;
var
lst : TObjectList<TUserModel>;
var I : Integer;
begin

 lst := FController.PopularCBParticipantes;
try

    cb_alunos_participantes_EscolaMenu.Clear;
    cb_alunos_participantes_EscolaMenu.TextHint := 'Selecione um Aluno Para Adicionar';
    for I := 0 to (lst.Count -1) do begin

    cb_alunos_participantes_EscolaMenu.Items.AddObject(lst[i].GetNome, lst[i]);

    end;



finally


end;

end;

procedure Tfrm_menuEscola.PopularCBProfessores();
var I : Integer;
var sL : TStringList;
begin

sL := FController.PopularCBProfessores;
try

    cb_ProfessorResponsavel_AddNEdit_Turma_EscolaMenu.Clear;
    cb_ProfessorResponsavel_AddNEdit_Turma_EscolaMenu.TextHint := 'Selecione um Professor';
    for I := 0 to (sL.Count -1) do begin

    cb_ProfessorResponsavel_AddNEdit_Turma_EscolaMenu.Items.Add(sL[I]);

    end;


finally

  sL.Free;
end;






end;

procedure Tfrm_menuEscola.TurmasClick(Sender: TObject);
begin
  pnl_membros_EscolaMenu.Visible := false;
  pnl_home_EscolaMenu.Visible := false;
  pnl_turmas_EscolaMenu.Visible := true;

  pnl_addNEdit_EscolaMenu.Visible := false;
  pnl_addNEdit_Turma_EscolaMenu.Visible := false;

 if Assigned(d_Src_membros_escola.DataSet) then begin
   d_Src_membros_escola.DataSet := nil; // limpa antes
 end;
  d_Src_membros_escola.DataSet := FController.AtualizarTabelaTurmas;
  dbg_turmasEscola.DataSource := d_Src_membros_escola;

end;




end.


