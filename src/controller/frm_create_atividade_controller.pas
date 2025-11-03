unit frm_create_atividade_controller;

interface
uses my_contracts, atividades_service, atividade_entity, professor_service, Sessao,System.JSON;

type

TCriarAtividadeController = class(TInterfacedObject, ITelaCreateAtividadesController)

private
  Fview : ITelaCreateAtividadesView;
  FAtividadeService: IAtividadesService;
  FProfessorService: IProfessorService;

public
  constructor Create(aView : ITelaCreateAtividadesView);
  procedure Save();
  function FindByID(aID : Integer): atividade_Model;
   procedure Update(aID : Integer);


end;

implementation

{ TCriarAtividadeController }

constructor TCriarAtividadeController.Create(aView : ITelaCreateAtividadesView);
begin
  if not Assigned(FAtividadeService) then begin
    FAtividadeService := TAtividadeService.Create;
  end;

  if not Assigned(FProfessorService) then begin
    FProfessorService := TProfessorService.Create;
  end;
  if not Assigned(Fview) then begin
    Fview := aView;

  end;
end;




function TCriarAtividadeController.FindByID(aID: Integer): atividade_Model;
begin
  Result := FAtividadeService.FindByID(aID);
end;

procedure TCriarAtividadeController.Save;
var
  FAtividade : atividade_Model;
  LContent, LOptions : TJSONObject;
  LOptionsArray : TJSONArray;
begin
  FAtividade := atividade_Model.Create;
  try
    FAtividade.SetTemplateID(Fview.GetTipo);
    FAtividade.SetProfessorID(FProfessorService.GetIdByUserId(UsuarioLogado.ID));
    FAtividade.SetTitle(Fview.GetTitulo);
    FAtividade.SetDescricao(Fview.GetDescricao);

    // --- Monta o JSON content_json (sem array de perguntas) ---
    LContent := TJSONObject.Create;
    LContent.AddPair('title', Fview.GetTitulo);
    LContent.AddPair('description', Fview.GetDescricao);
    LContent.AddPair('question', Fview.GetPergunta);

    // Opções da pergunta
    LOptionsArray := TJSONArray.Create;
    LOptionsArray.Add(Fview.GetAlternativaA);
    LOptionsArray.Add(Fview.GetAlternativaB);
    LOptionsArray.Add(Fview.GetAlternativac);
    LOptionsArray.Add(Fview.GetAlternativaD);

    LContent.AddPair('options', LOptionsArray);
    LContent.AddPair('correct_index', Fview.GetAlternativaCorreta);

    // Define o JSON no model
    FAtividade.SetContent_JSON(LContent);

    // --- Salva no banco via serviço ---
    FAtividadeService.Save(FAtividade);

  finally
    FAtividade.Free;
  end;
end;



procedure TCriarAtividadeController.Update(aID : Integer);
var
  FAtividade : atividade_Model;
  LContent, LOptions : TJSONObject;
  LOptionsArray : TJSONArray;
begin
  FAtividade := atividade_Model.Create;
  try
    FAtividade.SetID(aID);
    FAtividade.SetTemplateID(Fview.GetTipo);
    FAtividade.SetProfessorID(FProfessorService.GetIdByUserId(UsuarioLogado.ID));
    FAtividade.SetTitle(Fview.GetTitulo);
    FAtividade.SetDescricao(Fview.GetDescricao);

    // --- Monta o JSON content_json (sem array de perguntas) ---
    LContent := TJSONObject.Create;
    LContent.AddPair('title', Fview.GetTitulo);
    LContent.AddPair('description', Fview.GetDescricao);
    LContent.AddPair('question', Fview.GetPergunta);

    // Opções da pergunta
    LOptionsArray := TJSONArray.Create;
    LOptionsArray.Add(Fview.GetAlternativaA);
    LOptionsArray.Add(Fview.GetAlternativaB);
    LOptionsArray.Add(Fview.GetAlternativac);
    LOptionsArray.Add(Fview.GetAlternativaD);

    LContent.AddPair('options', LOptionsArray);
    LContent.AddPair('correct_index', Fview.GetAlternativaCorreta);

    // Define o JSON no model
    FAtividade.SetContent_JSON(LContent);



    // --- Salva no banco via serviço ---
    FAtividadeService.Update(FAtividade);

  finally
    FAtividade.Free;
  end;
end;

end.
