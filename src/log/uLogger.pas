unit uLogger;

interface

uses
  System.SysUtils, System.Classes, System.IOUtils, System.SyncObjs, user_dto;

type
  TLogLevel = (llInfo, llWarning, llError, llDebug);

  TLogger = class
  private
    class var FCriticalSection: TCriticalSection;
    class procedure WriteLine(const AFileName, AText: string);
    class function GetLogFileName(const ASchema: string): string;
  public
    class procedure Log(const ASchema, AMessage: string;aUser : TUserDTO; ALevel: TLogLevel = llInfo);
    class constructor Create;
    class destructor Destroy;
  end;

implementation

{ TLogger }

class constructor TLogger.Create;
begin
  FCriticalSection := TCriticalSection.Create;
end;

class destructor TLogger.Destroy;
begin
  FCriticalSection.Free;
end;

class function TLogger.GetLogFileName(const ASchema: string): string;
var
  LogDir, FileName, DateStr: string;
begin
  // Diretório base dos logs
  LogDir := TPath.Combine(ExtractFilePath(ParamStr(0)), 'Logs\' + ASchema);

  // Garante que a pasta existe
  if not TDirectory.Exists(LogDir) then
    TDirectory.CreateDirectory(LogDir);

  // Nome do arquivo = nomeSchema_YYYYMMDD.log
  DateStr := FormatDateTime('yyyymmdd', Now);
  FileName := Format('%s_%s.log', [ASchema, DateStr]);

  Result := TPath.Combine(LogDir, FileName);
end;

class procedure TLogger.WriteLine(const AFileName, AText: string);
var
  LogFile: TextFile;
begin
  FCriticalSection.Enter;
  try
    AssignFile(LogFile, AFileName);
    if FileExists(AFileName) then
      Append(LogFile)
    else
      Rewrite(LogFile);
    try
      Writeln(LogFile, AText);
    finally
      CloseFile(LogFile);
    end;
  finally
    FCriticalSection.Leave;
  end;
end;

class procedure TLogger.Log(const ASchema, AMessage: string; aUser: TUserDTO; ALevel: TLogLevel);
var
  LogFileName, LogText, LevelText, UserName: string;
begin
  case ALevel of
    llInfo: LevelText := 'INFO';
    llWarning: LevelText := 'WARN';
    llError: LevelText := 'ERROR';
    llDebug: LevelText := 'DEBUG';
  end;

  // Pega o nome do usuário, se existir
  if Assigned(aUser) then
    UserName := aUser.Name  // <-- ajuste aqui conforme sua DTO (Name, Login, UserName, etc)
  else
    UserName := 'System';

  LogFileName := GetLogFileName(ASchema);

  LogText := Format('%s [%s] [%s] %s',
    [FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', Now), LevelText, UserName, AMessage]);

  WriteLine(LogFileName, LogText);
  end;
end.




