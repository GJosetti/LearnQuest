unit atividade_repository;

interface
uses my_contracts,Data.DB, DMConnection, Sessao;
type

TAtividadeRepository = class(TInterfacedObject, IAtividadeRepository)

private

public

function GetAtividadeDataSet : TDataSet;

end;

implementation

{ TAtividadeRepository }

function TAtividadeRepository.GetAtividadeDataSet: TDataSet;
begin
  with DataModule1.FDQuery1 do
  begin
    Close;
    SQL.Text :=
      'SELECT ' +
      '  a.id, ' +
      '  a.title AS atividade_nome, ' +
      '  t.name AS template_nome, ' +
      '  a.created_at ' +
      'FROM atividades a ' +
      'LEFT JOIN public.activity_template t ON a.template_id = t.id ' +
      'WHERE a.professor_id = :PROF ' +
      'ORDER BY a.created_at DESC;';

    ParamByName('PROF').AsInteger := UsuarioLogado.ID;
    Open;

    Result := DataModule1.FDQuery1;
  end;
end;


end.
