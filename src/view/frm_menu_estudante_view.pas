unit frm_menu_estudante_view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, my_contracts,
  Data.DB, Vcl.Grids, Vcl.DBGrids, frm_menu_estudantes_controller, atividade_entity;

type
  Tfrm_estudante_view = class(TForm, ITelaEstudantesView)
    pnl_sideMenu: TPanel;
    btn_atividades: TButton;
    btn_home: TButton;
    pnl_back: TPanel;
    btn_minhas_atividades: TButton;
    pnl_home: TPanel;
    pnl_atividades: TPanel;
    dbg_atividades: TDBGrid;
    d_src_atividades: TDataSource;
    btn_fazer: TPanel;
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
  end;

var
  frm_estudante_view: TFrm_estudante_view;

implementation
uses frm_login_view;

{$R *.dfm}

procedure Tfrm_estudante_view.btn_atividadesClick(Sender: TObject);
begin
  pnl_home.Visible := false;
  pnl_atividades.Visible := true;

  d_src_atividades.DataSet := FController.AtualizarTabelaAtividades();
  dbg_atividades.DataSource := d_src_atividades;
end;

procedure Tfrm_estudante_view.btn_fazerClick(Sender: TObject);
var
FID : Integer;
FAtividade : atividade_Model;

begin

FID := dbg_atividades.DataSource.DataSet.FieldByName('id').AsInteger;
FController.GetAtividade(FID);
//FAZER UM NOVO FORM E COLOCAR O SELF NO CONSTRUTOR
//frm_criar_atividades := Tfrm_criar_atividades.Create(mEdit, FID, Self);
  //frm_criar_atividades.ShowModal;

end;

procedure Tfrm_estudante_view.btn_homeClick(Sender: TObject);
begin
  pnl_home.Visible := true;
  pnl_atividades.Visible := false;
end;

procedure Tfrm_estudante_view.FormCreate(Sender: TObject);
begin
  if not Assigned(FController) then begin
    FController := Tfrm_estudante_controler.Create;
  end;
end;

procedure Tfrm_estudante_view.pnl_backClick(Sender: TObject);
begin
  Self.Hide;
  frm_login := Tfrm_login.Create(nil);
  frm_login.ShowModal;
  Self.Close;
end;

end.
