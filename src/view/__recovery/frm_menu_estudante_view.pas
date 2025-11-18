unit frm_menu_estudante_view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, my_contracts,
  Data.DB, Vcl.Grids, Vcl.DBGrids, frm_menu_estudantes_controller, atividade_entity, frm_fazer_atividade_view,
  Vcl.Imaging.pngimage;

type
  Tfrm_estudante_view = class(TForm, ITelaEstudantesView)
    pnl_sideMenu: TPanel;
    pnl_home: TPanel;
    pnl_atividades: TPanel;
    dbg_atividades: TDBGrid;
    d_src_atividades: TDataSource;
    bg_atividades: TImage;
    bg_Home: TImage;
    SideMenu: TImage;
    pnl_back: TImage;
    btn_home: TImage;
    btn_atividades: TImage;
    btn_fazer: TImage;
    procedure btn_homeClick(Sender: TObject);
    procedure btn_atividadesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pnl_backClick(Sender: TObject);
    procedure btn_fazerClick(Sender: TObject);
  private
    { Private declarations }
    FController : ITelaEstudantesController;
  public
    { Public declarations }
    procedure AtualizarTabelaAtividades;
  end;

var
  frm_estudante_view: TFrm_estudante_view;

implementation
uses frm_login_view;

{$R *.dfm}

procedure Tfrm_estudante_view.AtualizarTabelaAtividades;
begin
  d_src_atividades.DataSet := FController.AtualizarTabelaAtividades();
  dbg_atividades.DataSource := d_src_atividades;
end;

procedure Tfrm_estudante_view.btn_atividadesClick(Sender: TObject);
begin
  pnl_home.Visible := false;
  pnl_atividades.Visible := true;

  AtualizarTabelaAtividades;
end;

procedure Tfrm_estudante_view.btn_fazerClick(Sender: TObject);
var
FID : Integer;
FAtividade : atividade_Model;
FAtividadeTurmaID : Integer;
begin

  FID := dbg_atividades.DataSource.DataSet.FieldByName('atividade_id').AsInteger;
  FAtividade := FController.GetAtividade(FID);
  FAtividadeTurmaID := dbg_atividades.DataSource.DataSet.FieldByName('atividade_turma_id').AsInteger;

  frm_fazer_atividade.SetAtividade(FAtividade);
  frm_fazer_atividade.FFormEstudante := Self;
  frm_fazer_atividade.FAtividadeTurmaID := FAtividadeTurmaID;
  frm_fazer_atividade.ShowModal;

end;

procedure Tfrm_estudante_view.btn_homeClick(Sender: TObject);
begin
  pnl_home.Visible := true;
  pnl_atividades.Visible := false;
end;

procedure Tfrm_estudante_view.FormCreate(Sender: TObject);
begin
    FController := Tfrm_estudante_controler.Create;
    Self.Position := poScreenCenter;

end;

procedure Tfrm_estudante_view.pnl_backClick(Sender: TObject);
begin
  Self.Hide;
  frm_login := Tfrm_login.Create(nil);
  frm_login.ShowModal;
  Self.Close;
end;

end.
