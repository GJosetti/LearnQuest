unit frm_create_atividade_view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type

  TMode = (mCreate,mEdit);

  Tfrm_criar_atividades = class(TForm)
    btn_cancel: TPanel;
    edt_title: TEdit;
    edt_descricao: TEdit;
    cb_types: TComboBox;
    pnl_atividade_quiz: TPanel;
    lbl_title: TLabel;
    lbl_descricao_quiz: TLabel;
    lbl_pergunta_quiz: TLabel;
    edt_pergunta_quiz: TEdit;
    lbl_alternativas_quiz: TLabel;
    edt_alternativa_a_quiz: TEdit;
    lbl_alternativa_a_quiz: TLabel;
    edt_alternativa_b_quiz: TEdit;
    lbl_alternativa_b_quiz: TLabel;
    edt_alternativa_c_quiz: TEdit;
    lbl_alternativa_c_quiz: TLabel;
    edt_alternativa_d_quiz: TEdit;
    lbl_alternativa_d_quiz: TLabel;
    pnl_Concluido: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FMode : TMode;
  public
    { Public declarations }
    constructor Create(aMode: TMode);
  end;

var
  frm_criar_atividades: Tfrm_criar_atividades;

implementation

{$R *.dfm}

constructor Tfrm_criar_atividades.Create(aMode: TMode);
begin
  FMode := aMode;
end;

procedure Tfrm_criar_atividades.FormCreate(Sender: TObject);
begin
  Self.Position :=poScreenCenter;
end;

end.
