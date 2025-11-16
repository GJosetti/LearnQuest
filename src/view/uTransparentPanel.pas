unit uTransparentPanel;

interface

uses
  System.Classes, Vcl.ExtCtrls, Winapi.Messages, Vcl.Controls, Vcl.Graphics;

type
  TTransparentPanel = class(TPanel)
  protected
    procedure WMEraseBkgnd(var Msg: TMessage); message WM_ERASEBKGND;
    procedure Paint; override;
  end;

implementation

procedure TTransparentPanel.WMEraseBkgnd(var Msg: TMessage);
begin
  // Impede pintar fundo branco
  Msg.Result := 1;
end;

procedure TTransparentPanel.Paint;
begin
  // Copia o fundo do parent (simula transparência real)
  if Assigned(Parent) then
    Parent.Perform(WM_ERASEBKGND, Canvas.Handle, Canvas.Handle);

  inherited;
end;

end.
