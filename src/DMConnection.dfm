object DataModule1: TDataModule1
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 585
  Width = 640
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=postgres'
      'User_Name=postgres'
      'Password=senha'
      'Port=5433'
      'DriverID=PG'
      'Server=localhost')
    Left = 56
    Top = 64
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 288
    Top = 224
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    DriverID = 'PG'
    VendorLib = 
      'C:\Users\guilherme.8623\Desktop\LearnQuest\LearnQuest\src\infra\' +
      'lib\libpq.dll'
    Left = 168
    Top = 88
  end
  object FDQueryEscolas: TFDQuery
    Connection = FDConnection1
    Left = 376
    Top = 368
  end
  object FDQueryTurmas: TFDQuery
    Connection = FDConnection1
    Left = 464
    Top = 320
  end
  object FDQueryParticipantes: TFDQuery
    Connection = FDConnection1
    Left = 568
    Top = 360
  end
  object FDQueryAtividades: TFDQuery
    Connection = FDConnection1
    Left = 256
    Top = 368
  end
  object QRTurmas: TFDQuery
    Connection = FDConnection1
    Left = 152
    Top = 408
  end
  object FDQueryProfessores: TFDQuery
    Connection = FDConnection1
    Left = 216
    Top = 432
  end
  object FDQueryAtividadesParaEstudante: TFDQuery
    Connection = FDConnection1
    Left = 456
    Top = 472
  end
end
