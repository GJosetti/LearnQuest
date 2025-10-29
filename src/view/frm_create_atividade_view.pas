unit frm_create_atividade_view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  frm_create_atividade_controller, my_contracts;

type
  TMode = (mCreate, mEdit);

  Tfrm_criar_atividades = class(TForm, ITelaCreateAtividadesView)
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
    rg_alternativas_quiz: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure cb_typesSelect(Sender: TObject);
  private
    FMode: TMode;
    FController: ITelaCreateAtividadesController;

    // Getters
    function GetTitulo: string;
    function GetDescricao: string;
    function GetTipo: string;
    function GetPergunta: string;
    function GetAlternativaA: string;
    function GetAlternativaB: string;
    function GetAlternativaC: string;
    function GetAlternativaD: string;
    function GetAlternativaCorreta: string;

    // Setters
    procedure SetTitulo(const Value: string);
    procedure SetDescricao(const Value: string);
    procedure SetTipo(const Value: string);
    procedure SetPergunta(const Value: string);
    procedure SetAlternativaA(const Value: string);
    procedure SetAlternativaB(const Value: string);
    procedure SetAlternativaC(const Value: string);
    procedure SetAlternativaD(const Value: string);
    procedure SetAlternativaCorreta(const Value: string);
  public
    constructor Create(aMode: TMode);
  end;

var
  frm_criar_atividades: Tfrm_criar_atividades;

implementation

{$R *.dfm}

{ ------------------------- FORM -------------------------------- }

procedure Tfrm_criar_atividades.cb_typesSelect(Sender: TObject);
begin
  //////////////////////////////////////////////////////////
  if cb_types.SelText = 'Quiz' then begin
    pnl_atividade_quiz.Visible := true;
  end;

  end;

constructor Tfrm_criar_atividades.Create(aMode: TMode);
begin
  inherited Create(nil);
  FMode := aMode;
end;

procedure Tfrm_criar_atividades.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;


  rg_alternativas_quiz.Items.Clear;
  rg_alternativas_quiz.Items.Add('Alternativa A');
  rg_alternativas_quiz.Items.Add('Alternativa B');
  rg_alternativas_quiz.Items.Add('Alternativa C');
  rg_alternativas_quiz.Items.Add('Alternativa D');
  rg_alternativas_quiz.ItemIndex := -1;

  if not Assigned(FController) then begin
    FController := TCriarAtividadeController.Create;
  end;

end;

{ ----------------------- GETTERS ------------------------------- }

function Tfrm_criar_atividades.GetTitulo: string;
begin
  Result := edt_title.Text;
end;

function Tfrm_criar_atividades.GetDescricao: string;
begin
  Result := edt_descricao.Text;
end;

function Tfrm_criar_atividades.GetTipo: string;
begin
  Result := cb_types.Text;
end;

function Tfrm_criar_atividades.GetPergunta: string;
begin
  Result := edt_pergunta_quiz.Text;
end;

function Tfrm_criar_atividades.GetAlternativaA: string;
begin
  Result := edt_alternativa_a_quiz.Text;
end;

function Tfrm_criar_atividades.GetAlternativaB: string;
begin
  Result := edt_alternativa_b_quiz.Text;
end;

function Tfrm_criar_atividades.GetAlternativaC: string;
begin
  Result := edt_alternativa_c_quiz.Text;
end;

function Tfrm_criar_atividades.GetAlternativaD: string;
begin
  Result := edt_alternativa_d_quiz.Text;
end;

function Tfrm_criar_atividades.GetAlternativaCorreta: string;
begin
  case rg_alternativas_quiz.ItemIndex of
    0: Result := 'A';
    1: Result := 'B';
    2: Result := 'C';
    3: Result := 'D';
  else
    Result := '';
  end;
end;

{ ----------------------- SETTERS ------------------------------- }

procedure Tfrm_criar_atividades.SetTitulo(const Value: string);
begin
  edt_title.Text := Value;
end;

procedure Tfrm_criar_atividades.SetDescricao(const Value: string);
begin
  edt_descricao.Text := Value;
end;

procedure Tfrm_criar_atividades.SetTipo(const Value: string);
begin
  cb_types.Text := Value;
end;

procedure Tfrm_criar_atividades.SetPergunta(const Value: string);
begin
  edt_pergunta_quiz.Text := Value;
end;

procedure Tfrm_criar_atividades.SetAlternativaA(const Value: string);
begin
  edt_alternativa_a_quiz.Text := Value;
end;

procedure Tfrm_criar_atividades.SetAlternativaB(const Value: string);
begin
  edt_alternativa_b_quiz.Text := Value;
end;

procedure Tfrm_criar_atividades.SetAlternativaC(const Value: string);
begin
  edt_alternativa_c_quiz.Text := Value;
end;

procedure Tfrm_criar_atividades.SetAlternativaD(const Value: string);
begin
  edt_alternativa_d_quiz.Text := Value;
end;

procedure Tfrm_criar_atividades.SetAlternativaCorreta(const Value: string);
begin
  if Value = 'A' then rg_alternativas_quiz.ItemIndex := 0
  else if Value = 'B' then rg_alternativas_quiz.ItemIndex := 1
  else if Value = 'C' then rg_alternativas_quiz.ItemIndex := 2
  else if Value = 'D' then rg_alternativas_quiz.ItemIndex := 3
  else rg_alternativas_quiz.ItemIndex := -1;
end;

end.

