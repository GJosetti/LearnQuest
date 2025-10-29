unit frm_create_atividade_view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  Tfrm_criar_atividades = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_criar_atividades: Tfrm_criar_atividades;

implementation

{$R *.dfm}

procedure Tfrm_criar_atividades.FormCreate(Sender: TObject);
begin
  Self.Position :=poScreenCenter;
end;

end.
