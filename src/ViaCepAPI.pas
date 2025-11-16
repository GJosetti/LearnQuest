unit ViaCepAPI;

interface
uses
  System.SysUtils, System.Net.HttpClient,my_contracts, System.JSON,  System.Net.HttpClientComponent;
type
  TCepAPI = class (TInterfacedObject, ICepApi)
  public
    function CEPValido(const ACEP: string): Boolean;
  end;

implementation

function TCepAPI.CEPValido(const ACEP: string): Boolean;
var
  CEP, URL, Str: string;
  Client: TNetHTTPClient;
  Response: IHTTPResponse;
  JSON: TJSONObject;
begin
  Result := False;

  CEP := ACEP.Trim.Replace('-', '');

  if Length(CEP) <> 8 then
    Exit(False);

  URL := 'https://viacep.com.br/ws/' + CEP + '/json/';

  Client := TNetHTTPClient.Create(nil);
  try
    Response := Client.Get(URL);
    Str := Response.ContentAsString();

    JSON := TJSONObject.ParseJSONValue(Str) as TJSONObject;

    // ViaCep retorna { "erro": true } quando não existe
    if (JSON <> nil) and (JSON.GetValue('erro') = nil) then
      Result := True;

  finally
    Client.Free;
  end;
end;
end.
