unit frm_fazer_atividade_view;

interface

uses
  Winapi.Windows, Vcl.Controls, Vcl.ExtCtrls, System.Classes,
  Vcl.StdCtrls, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Graphics,
  Vcl.Forms, Vcl.Dialogs, my_contracts, atividade_entity, System.JSON, Math,
  Winapi.UxTheme, System.UITypes;

type
  Tfrm_fazer_atividade_view = class(TForm, ITelaFazerAtividadesView)
    lbl_title: TLabel;
    lbl_pergunta: TLabel;
    OpçãoA: TPanel;
    OpçãoB: TPanel;
    OpçãoC: TPanel;
    OpçãoD: TPanel;
    Timer: TTimer;
    lbl_optionA: TLabel;
    lbl_optionB: TLabel;
    lbl_optionC: TLabel;
    lbl_optionD: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OpçãoAMouseEnter(Sender: TObject);
    procedure OpçãoAMouseLeave(Sender: TObject);
  private
    var
      FAnimStep,
      FStartWidth,
      FEndWidth,
      FStartHeight,
      FEndHeight,
      FLabelAlpha: Double;
      FIsAnimatingRun : Boolean;

      FFormEstudante: ITelaEstudantesView;
      FAtividade: atividade_Model;

      // Centros originais dos painéis
      FOrigCenterXA, FOrigCenterYA: Integer;
      FOrigCenterXB, FOrigCenterYB: Integer;
      FOrigCenterXC, FOrigCenterYC: Integer;
      FOrigCenterXD, FOrigCenterYD: Integer;

      // Cor alvo do texto (visível)
      FLabelTargetColor: TColor;

    procedure ResetOpcoes;
    procedure SaveOriginalCenters;
    procedure RestoreOriginalPositions;

    // Fade compatível com VCL (interpolação RGB)
    procedure SetLabelFadeFrac(const AFrac: Double);

  public
    procedure RenderizarAtividade;
    procedure SetAtividade(aModel: atividade_Model);
    procedure PopUp;
  end;

var
  frm_fazer_atividade: Tfrm_fazer_atividade_view;

implementation

uses frm_menu_estudante_view;

{$R *.dfm}

{ ------------------------ Helpers de cor ------------------------ }

function LerpByte(a, b: Byte; t: Double): Byte;
begin
  if t <= 0 then
    Exit(a);
  if t >= 1 then
    Exit(b);
  Result := Round(a + (b - a) * t);
  if Result < 0 then Result := 0;
  if Result > 255 then Result := 255;
end;

function LerpColor(const AFrom, ATo: TColor; t: Double): TColor;
var
  R1, G1, B1: Byte;
  R2, G2, B2: Byte;
  CR1, CR2: LongInt;
begin
  if t <= 0 then
    Exit(AFrom);
  if t >= 1 then
    Exit(ATo);

  // ColorToRGB garante componentes corretos
  CR1 := ColorToRGB(AFrom);
  CR2 := ColorToRGB(ATo);

  R1 := GetRValue(CR1);
  G1 := GetGValue(CR1);
  B1 := GetBValue(CR1);

  R2 := GetRValue(CR2);
  G2 := GetGValue(CR2);
  B2 := GetBValue(CR2);

  Result := RGB(LerpByte(R1, R2, t), LerpByte(G1, G2, t), LerpByte(B1, B2, t));
end;

{ ------------------------ Inicialização ------------------------ }

procedure Tfrm_fazer_atividade_view.FormCreate(Sender: TObject);
begin
  Self.Position := poScreenCenter;

  // Configura animação
  FAnimStep := 0;
  FStartWidth := 0;
  FEndWidth := 400;
  FStartHeight := 0;
  FEndHeight := 200;
  FLabelAlpha := 0;
  FIsAnimatingRun := False;

  // Cor alvo para os labels (visível). Ajuste se necessário.
  FLabelTargetColor := clBlack;

  Timer.Interval := 6; // ~60 FPS
  Timer.Enabled := False;

  // Salva o centro original de cada painel (usando valores do design time)
  SaveOriginalCenters;

  // Começa com tudo zerado
  ResetOpcoes;
end;

procedure Tfrm_fazer_atividade_view.FormShow(Sender: TObject);
begin
  RestoreOriginalPositions;
  ResetOpcoes;
  FAnimStep := 0;
  FLabelAlpha := 0;
  lbl_title.Alignment := TAlignment.taCenter;
  FIsAnimatingRun := True;
  SetLabelFadeFrac(0.0); // labels invisíveis no início

  RenderizarAtividade;
  lbl_title.Alignment := TAlignment.taCenter;

  Timer.Enabled := True;
end;

procedure Tfrm_fazer_atividade_view.OpçãoAMouseEnter(Sender: TObject);
begin
  if not (FIsAnimatingRun) then begin
    OpçãoA.Color := clBlue;
  end;
end;

procedure Tfrm_fazer_atividade_view.OpçãoAMouseLeave(Sender: TObject);
begin
  if not (FIsAnimatingRun) then begin
    OpçãoA.Color := clWhite;
  end;
end;

procedure Tfrm_fazer_atividade_view.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer.Enabled := False;
  ResetOpcoes;
  RestoreOriginalPositions;
  SetLabelFadeFrac(0.0);
  FAnimStep := 0;
end;

{ ------------------------ Métodos auxiliares ------------------------ }

procedure Tfrm_fazer_atividade_view.SaveOriginalCenters;
begin
  // captura centro com base no design-time Width/Height
  FOrigCenterXA := OpçãoA.Left + OpçãoA.Width div 2;
  FOrigCenterYA := OpçãoA.Top  + OpçãoA.Height div 2;

  FOrigCenterXB := OpçãoB.Left + OpçãoB.Width div 2;
  FOrigCenterYB := OpçãoB.Top  + OpçãoB.Height div 2;

  FOrigCenterXC := OpçãoC.Left + OpçãoC.Width div 2;
  FOrigCenterYC := OpçãoC.Top  + OpçãoC.Height div 2;

  FOrigCenterXD := OpçãoD.Left + OpçãoD.Width div 2;
  FOrigCenterYD := OpçãoD.Top  + OpçãoD.Height div 2;
end;

procedure Tfrm_fazer_atividade_view.RestoreOriginalPositions;
begin
  // Reposiciona com base no centro salvo
  OpçãoA.Left := FOrigCenterXA - OpçãoA.Width div 2;
  OpçãoA.Top  := FOrigCenterYA - OpçãoA.Height div 2;

  OpçãoB.Left := FOrigCenterXB - OpçãoB.Width div 2;
  OpçãoB.Top  := FOrigCenterYB - OpçãoB.Height div 2;

  OpçãoC.Left := FOrigCenterXC - OpçãoC.Width div 2;
  OpçãoC.Top  := FOrigCenterYC - OpçãoC.Height div 2;

  OpçãoD.Left := FOrigCenterXD - OpçãoD.Width div 2;
  OpçãoD.Top  := FOrigCenterYD - OpçãoD.Height div 2;
end;

procedure Tfrm_fazer_atividade_view.ResetOpcoes;
begin
  for var P in [OpçãoA, OpçãoB, OpçãoC, OpçãoD] do
  begin
    P.Width := 0;
    P.Height := 0;
  end;
end;

procedure Tfrm_fazer_atividade_view.SetLabelFadeFrac(const AFrac: Double);
var
  frac: Double;
  cTitle,cAFrom, cBFrom, cCFrom, cDFrom: TColor;

begin
  // clamp
  frac := AFrac;
  if frac < 0 then frac := 0;

  if frac > 1 then begin
    frac := 1;
  end;



  cAFrom := OpçãoA.Color;
  cBFrom := OpçãoB.Color;
  cCFrom := OpçãoC.Color;
  cDFrom := OpçãoD.Color;

  lbl_title.Font.Color := LerpColor(cTitle, FLabelTargetColor, frac);
  lbl_optionA.Font.Color := LerpColor(cAFrom, FLabelTargetColor, frac);
  lbl_optionB.Font.Color := LerpColor(cBFrom, FLabelTargetColor, frac);
  lbl_optionC.Font.Color := LerpColor(cCFrom, FLabelTargetColor, frac);
  lbl_optionD.Font.Color := LerpColor(cDFrom, FLabelTargetColor, frac);
end;

{ ------------------------ Renderização ------------------------ }

procedure Tfrm_fazer_atividade_view.RenderizarAtividade;
var
  JSON, LJSON: TJSONObject;
  LOptions: TJSONArray;
begin
  JSON := FAtividade.GetContent_JSON;
  if not Assigned(JSON) then
  begin
    ShowMessage('Erro: JSON da atividade está vazio.');
    Exit;
  end;

  LJSON := FAtividade.GetContent_JSON;

  lbl_title.Caption := LJSON.GetValue<string>('title', '');
  lbl_pergunta.Caption := LJSON.GetValue<string>('question', '');

  LOptions := LJSON.GetValue<TJSONArray>('options');
  if Assigned(LOptions) then
  begin
    if LOptions.Count > 0 then lbl_optionA.Caption := LOptions.Items[0].Value;
    if LOptions.Count > 1 then lbl_optionB.Caption := LOptions.Items[1].Value;
    if LOptions.Count > 2 then lbl_optionC.Caption := LOptions.Items[2].Value;
    if LOptions.Count > 3 then lbl_optionD.Caption := LOptions.Items[3].Value;
  end
  else
  begin
    lbl_optionA.Caption := '';
    lbl_optionB.Caption := '';
    lbl_optionC.Caption := '';
    lbl_optionD.Caption := '';
  end;
end;

procedure Tfrm_fazer_atividade_view.SetAtividade(aModel: atividade_Model);
begin
  FAtividade := aModel;
end;

procedure Tfrm_fazer_atividade_view.PopUp;
begin
  // Implementar se quiser exibir algo
end;

{ ------------------------ Animação ------------------------ }

procedure Tfrm_fazer_atividade_view.TimerTimer(Sender: TObject);
var
  t, te: Double;
  NewW, NewH: Integer;
  frac: Double;
begin
  // velocidade da animação - ajuste conforme preferir
  FAnimStep := FAnimStep + 0.03;

  if FAnimStep > 2 then
  begin
    FAnimStep := 2;
    FIsAnimatingRun := False;
    Timer.Enabled := False;
  end;

  // Fase 1: animação dos painéis (0 → 1)
  if FAnimStep <= 1 then
  begin
    t := FAnimStep;
    te := t * t * (3 - 2 * t);


    NewW := Round(FStartWidth + (FEndWidth - FStartWidth) * te);
    NewH := Round(FStartHeight + (FEndHeight - FStartHeight) * te);

    // clamp para segurança (evita negativos ou valores absurdos)
    if NewW < 0 then NewW := 0;
    if NewH < 0 then NewH := 0;

    OpçãoA.Width := NewW;
    OpçãoA.Height := NewH;
    OpçãoA.Left := FOrigCenterXA - NewW div 2;
    OpçãoA.Top  := FOrigCenterYA - NewH div 2;

    OpçãoB.Width := NewW;
    OpçãoB.Height := NewH;
    OpçãoB.Left := FOrigCenterXB - NewW div 2;
    OpçãoB.Top  := FOrigCenterYB - NewH div 2;

    OpçãoC.Width := NewW;
    OpçãoC.Height := NewH;
    OpçãoC.Left := FOrigCenterXC - NewW div 2;
    OpçãoC.Top  := FOrigCenterYC - NewH div 2;

    OpçãoD.Width := NewW;
    OpçãoD.Height := NewH;
    OpçãoD.Left := FOrigCenterXD - NewW div 2;
    OpçãoD.Top  := FOrigCenterYD - NewH div 2;

    // labels permanecem invisíveis
    SetLabelFadeFrac(0.0);
  end
  else
  begin
    // Fase 2: fade-in dos labels (1 → 2)
    frac := FAnimStep - 1; // varia 0..1
    if frac < 0 then frac := 0;
    if frac > 1 then frac := 1;

    // usar ease-in para o fade
    te := frac * frac;
    SetLabelFadeFrac(te);
  end;
end;

end.

