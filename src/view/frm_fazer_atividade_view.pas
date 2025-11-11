unit frm_fazer_atividade_view;

interface

uses
  Winapi.Windows, Vcl.Controls, Vcl.ExtCtrls, System.Classes,
  Vcl.StdCtrls, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Graphics,
  Vcl.Forms, Vcl.Dialogs, my_contracts,atividade_entity, System.JSON, Math;

type
  Tfrm_fazer_atividade_view = class(TForm, ITelaFazerAtividadesView)
    lbl_title: TLabel;
    lbl_pergunta: TLabel;
    OpçãoA: TPanel;
    OpçãoB: TPanel;
    OpçãoC: TPanel;
    OpçãoD: TPanel;
    timer: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure timerTimer(Sender: TObject);
  private
    var
    FAnimStep,
    FStartWidth,
    FEndWidth,
    FStartHeight,
    FEndHeight: Double;

    FFormEstudante : ITelaEstudantesView;
    FAtividade : atividade_Model;
  public

     procedure RenderizarAtividade();
     procedure SetAtividade (aModel : atividade_Model);
     procedure PopUp;



  end;

var
  frm_fazer_atividade: Tfrm_fazer_atividade_view;

implementation
uses frm_menu_estudante_view;

{$R *.dfm}

{ frm_fazer_atividade_view }



procedure Tfrm_fazer_atividade_view.FormCreate(Sender: TObject);
begin
   Self.Position := poScreenCenter;

   // Valores iniciais e finais
  FAnimStep := 0;
  FStartWidth := 0;
  FEndWidth := 300;
  FStartHeight := 0;
  FEndHeight := 150;

  // Define o intervalo do timer (ms)
  Timer.Interval := 6; // ~60 FPS
  Timer.Enabled := false;












   OpçãoA.Width := 0  ;
   OpçãoB.Width := 0  ;
   OpçãoC.Width := 0  ;
   OpçãoD.Width := 0  ;

   OpçãoA.Height := 0  ;
   OpçãoB.Height := 0  ;
   OpçãoC.Height := 0  ;
   OpçãoD.Height := 0  ;
end;

procedure Tfrm_fazer_atividade_view.FormShow(Sender: TObject);
begin
 RenderizarAtividade;
 lbl_title.Alignment := TAlignment.taCenter;
 timer.Enabled := true;
end;

procedure Tfrm_fazer_atividade_view.PopUp;
begin

end;

procedure Tfrm_fazer_atividade_view.RenderizarAtividade();
var
  JSON : TJSONObject;
  LJSON: TJSONObject;
  LOptions: TJSONArray;
begin
  // Garante que o JSON não é nulo
  JSON := FAtividade.GetContent_JSON;
  if not Assigned(JSON) then begin
    ShowMessage('Erro: JSON da atividade está vazio.');
    Exit;
  end;

  LJSON := FAtividade.GetContent_JSON;

  // --- Preenche os textos principais ---
  lbl_title.Caption := LJSON.GetValue<string>('title', '');
  lbl_pergunta.Caption := LJSON.GetValue<string>('question', '');

  // --- Pega as opções (array) ---
  LOptions := LJSON.GetValue<TJSONArray>('options');
  if Assigned(LOptions) then
  begin
    if LOptions.Count > 0 then
      OpçãoA.Caption := LOptions.Items[0].Value;
    if LOptions.Count > 1 then
      OpçãoB.Caption := LOptions.Items[1].Value;
    if LOptions.Count > 2 then
      OpçãoC.Caption := LOptions.Items[2].Value;
    if LOptions.Count > 3 then
      OpçãoD.Caption := LOptions.Items[3].Value;
  end
  else
  begin
    OpçãoA.Caption := '';
    OpçãoB.Caption := '';
    OpçãoC.Caption := '';
    OpçãoD.Caption := '';
  end;
end;


procedure Tfrm_fazer_atividade_view.SetAtividade(aModel: atividade_Model);
begin
  FAtividade := aModel;
end;

procedure Tfrm_fazer_atividade_view.timerTimer(Sender: TObject);
var
  t, te: Double;
  CenterX, CenterY: Integer;
begin
  // Normaliza tempo
  FAnimStep := FAnimStep + 0.02;
  if FAnimStep > 1 then
  begin
    FAnimStep := 1;
    Timer.Enabled := False;
  end;

  t := FAnimStep;
  te := 1 - Power(1 - t, 2); // ease-out (rápido e suaviza no fim)

  // calcula nova largura/altura
  var NewW := Round(FStartWidth  + (FEndWidth  - FStartWidth)  * te);
  var NewH := Round(FStartHeight + (FEndHeight - FStartHeight) * te);

  // atualiza cada painel crescendo a partir do centro
  for var P in [OpçãoA, OpçãoB, OpçãoC, OpçãoD] do
  begin
    // Calcula o centro atual
    CenterX := P.Left + P.Width div 2;
    CenterY := P.Top  + P.Height div 2;

    // Atualiza tamanho
    P.Width  := NewW;
    P.Height := NewH;

    // Reposiciona para manter o centro fixo
    P.Left := CenterX - P.Width div 2;
    P.Top  := CenterY - P.Height div 2;
  end;
end;



end.
