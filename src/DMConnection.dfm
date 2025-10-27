object DataModule1: TDataModule1
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 640
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=postgres'
      'User_Name=postgres'
      'Password=senha'
      'Port=5433'
      'DriverID=PG'
      'Server=localhost')
    Left = 176
    Top = 184
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 352
    Top = 256
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    DriverID = 'PG'
    VendorLib = 
      'C:\Users\Guilherme Josetti\Desktop\LearnQuest\LearnQuest\src\inf' +
      'ra\lib\libpq.dll'
    Left = 464
    Top = 192
  end
  object FDQueryEscolas: TFDQuery
    Connection = FDConnection1
    Left = 376
    Top = 368
  end
  object FDQueryTurmas: TFDQuery
    Connection = FDConnection1
    Left = 472
    Top = 384
  end
  object FDQueryParticipantes: TFDQuery
    Connection = FDConnection1
    Left = 528
    Top = 288
  end
end
