unit frm_menu_estudantes_controller;

interface
uses my_contracts, Data.DB, turma_service, atividades_service,user_service,Sessao,atividade_entity;
type
  Tfrm_estudante_controler = class(TInterfacedObject,ITelaEstudantesController)

  private
  FAtividadeService : IAtividadesService;

  public
   function AtualizarTabelaAtividades : TDataSet;
   constructor Create();
   function GetAtividade(aID : Integer):atividade_Model;


end;

implementation



{ Tfrm_estudante_controler }

constructor Tfrm_estudante_controler.Create;
begin
  if not Assigned(FAtividadeService) then begin
    FAtividadeService := TAtividadeService.Create;
  end;
end;

function Tfrm_estudante_controler.GetAtividade(aID: Integer): atividade_Model;
begin
  Result := FAtividadeService.FindByID(aID);

end;

function Tfrm_estudante_controler.AtualizarTabelaAtividades: TDataSet;
begin
  Result := FAtividadeService.GetAtividadesByUserID(UsuarioLogado.ID);
end;



end.
