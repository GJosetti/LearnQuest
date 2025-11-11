unit frm_fazer_atividade_view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, my_contracts,atividade_entity,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  Tfrm_fazer_atividade_view = class(TForm, ITelaFazerAtividadesView)
    lbl_title: TLabel;
    lbl_pergunta: TLabel;
    OpçãoA: TPanel;
    OpçãoB: TPanel;
    OpçãoC: TPanel;
    OpçãoD: TPanel;
  private

    FFormEstudante : ITelaEstudantesView;
    FAtividade : atividade_Model;
  public
    constructor Create(aModel: atividade_model; aForm : ITelaEstudantesView);
     procedure RenderizarAtividade();



  end;

var
  frm_fazer_atividade: Tfrm_fazer_atividade_view;

implementation
uses frm_menu_estudante_view;

{$R *.dfm}

{ frm_fazer_atividade_view }

constructor Tfrm_fazer_atividade_view.Create(aModel: atividade_model; aForm: ITelaEstudantesView);
begin
  FFormEstudante := aForm;
  FAtividade := aModel;
end;



procedure Tfrm_fazer_atividade_view.RenderizarAtividade();
begin


end;

end.
