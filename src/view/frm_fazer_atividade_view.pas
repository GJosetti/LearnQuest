unit frm_fazer_atividade_view;

interface

uses
  Winapi.Windows, Vcl.Controls, Vcl.ExtCtrls, System.Classes,
  Vcl.StdCtrls, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Graphics,
  Vcl.Forms, Vcl.Dialogs, my_contracts,atividade_entity, System.JSON;

type
  Tfrm_fazer_atividade_view = class(TForm, ITelaFazerAtividadesView)
    lbl_title: TLabel;
    lbl_pergunta: TLabel;
    OpçãoA: TPanel;
    OpçãoB: TPanel;
    OpçãoC: TPanel;
    OpçãoD: TPanel;
    procedure FormShow(Sender: TObject);
  private

    FFormEstudante : ITelaEstudantesView;
    FAtividade : atividade_Model;
  public

     procedure RenderizarAtividade();
     procedure SetAtividade (aModel : atividade_Model);



  end;

var
  frm_fazer_atividade: Tfrm_fazer_atividade_view;

implementation
uses frm_menu_estudante_view;

{$R *.dfm}

{ frm_fazer_atividade_view }



procedure Tfrm_fazer_atividade_view.FormShow(Sender: TObject);
begin
 RenderizarAtividade;
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

end.
