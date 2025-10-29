unit atividade_entity;

interface

uses
  System.JSON;

type
  atividade_Model = class
  private
    FID: Integer;
    FTemplateID: Integer;
    FProfessorID: Integer;
    FTitle: String;
    FContent_JSON: TJSONObject;

  public
    // --- Getters (Funções para obter o valor) ---
    function GetID: Integer;
    function GetTemplateID: Integer;
    function GetProfessorID: Integer;
    function GetTitle: String;
    function GetContent_JSON: TJSONObject;

    // --- Setters (Procedimentos para definir o valor) ---
    procedure SetID(const Value: Integer);
    procedure SetTemplateID(const Value: Integer);
    procedure SetProfessorID(const Value: Integer);
    procedure SetTitle(const Value: String);
    procedure SetContent_JSON(const Value: TJSONObject);
  end;

implementation

// --- Implementação dos Getters ---

function atividade_Model.GetID: Integer;
begin
  Result := FID;
end;

function atividade_Model.GetTemplateID: Integer;
begin
  Result := FTemplateID;
end;

function atividade_Model.GetProfessorID: Integer;
begin
  Result := FProfessorID;
end;

function atividade_Model.GetTitle: String;
begin
  Result := FTitle;
end;

function atividade_Model.GetContent_JSON: TJSONObject;
begin
  Result := FContent_JSON;
end;

// --- Implementação dos Setters ---

procedure atividade_Model.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure atividade_Model.SetTemplateID(const Value: Integer);
begin
  FTemplateID := Value;
end;

procedure atividade_Model.SetProfessorID(const Value: Integer);
begin
  FProfessorID := Value;
end;

procedure atividade_Model.SetTitle(const Value: String);
begin
  FTitle := Value;
end;

procedure atividade_Model.SetContent_JSON(const Value: TJSONObject);
begin
  FContent_JSON := Value;
end;

end.
