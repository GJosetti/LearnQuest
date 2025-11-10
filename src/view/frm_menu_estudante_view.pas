unit frm_menu_estudante_view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, my_contracts;

type
  Tfrm_estudante_view = class(TForm, ITelaEstudantesView)
    pnl_sideMenu: TPanel;
    btn_minhas_turmas: TButton;
    btn_home: TButton;
    pnl_back: TPanel;
    btn_minhas_atividades: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_estudante_view: TFrm_estudante_view;

implementation

{$R *.dfm}

end.
