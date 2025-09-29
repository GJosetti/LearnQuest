unit escola_service;

interface
uses my_contracts, Data.DB, escola_repository,escolas_DTO, escola_entity;

type

TEscola_Service = class(TInterfacedObject, IMenuAdminService)

private
FEscolaRepo : IEscolaRepository;

public
function AtualizarTabelaEscolas : TDataSet;
function SalvarEscola(aDTO: TEscolaDTO): Integer;
procedure Update(aDto : TEscolaDTO);
procedure Delete (aID: Integer);
constructor Create();

end;

implementation

{ TFrm_menuAdmin_service }

constructor TEscola_Service.Create;
begin
  if not Assigned(FEscolaRepo) then begin
    FEscolaRepo := TEscolaRepository.Create;
end;
end;


procedure TEscola_Service.Delete(aID: Integer);
begin
  FEscolaRepo.Delete(aID);
end;

function TEscola_Service.SalvarEscola(aDTO : TEscolaDTO): Integer;
var FEscola : TEscolaModel;
begin
  FEscola := TEscolaModel.Create;
  FEscola.SetID(aDTO.ID);
  FEscola.SetNome(aDTO.Name);
  FEscola.SetEndereco(aDTO.Endereco);
  FEscola.SetQtdMembros(aDTO.QtdMembros);

  Result := FEscolaRepo.Save(FEscola);



end;

procedure TEscola_Service.Update(aDto: TEscolaDTO);
var FEscola : TEscolaModel;
begin
  try

    FEscola := TEscolaModel.Create;
    FEscola.SetID(aDto.ID);
    FEscola.SetNome(aDTO.Name);
    FEscola.SetEndereco(aDTO.Endereco);
    FEscola.SetQtdMembros(aDTO.QtdMembros);

    FEscolaRepo.Update(FEscola);

  finally

    aDto.Free;

  end;


end;

function TEscola_Service.AtualizarTabelaEscolas: TDataSet;
begin
  Result := FEscolaRepo.GetEscolaDataSet;
end;


end.
