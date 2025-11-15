object DataModule1: TDataModule1
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 563
  Width = 799
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=postgres'
      'User_Name=postgres'
      'Password=senha'
      'Port=5433'
      'DriverID=PG'
      'Server=localhost')
    Connected = True
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
      'C:\Users\User\Desktop\LearnQuest\LearnQuest\src\infra\lib\libpq.' +
      'dll'
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
  object FDQueryRelatorioDesempenho: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      '    u.user_name,'
      ''
      '    ROUND('
      
        '        100.0 * SUM(CASE WHEN ae.sucess = TRUE THEN 1 ELSE 0 END' +
        ') '
      '        / NULLIF(COUNT(ae.id), 0),'
      '        2'
      '    ) AS porcentagem_acertos,'
      ''
      '    CAST('
      '        CAST(COUNT(ae.id) AS VARCHAR(10)) '
      '        || '#39'/'#39' || '
      '        CAST(('
      '            SELECT COUNT(DISTINCT at2.id)'
      '            FROM escola_33.atividade_turma at2'
      '            INNER JOIN escola_33.estudante_turma et2 '
      '                ON et2.turma_id = at2.turma_id'
      '            WHERE et2.estudante_id = e.id'
      '        ) AS VARCHAR(10))'
      '    AS VARCHAR(20)) AS progresso'
      ''
      'FROM '
      '    public.users u'
      'INNER JOIN escola_33.estudante e ON e.user_id = u.id'
      
        'LEFT JOIN escola_33.atividade_estudante ae ON ae.estudante_id = ' +
        'e.id'
      ''
      'GROUP BY '
      '    u.user_name, e.id'
      ''
      'ORDER BY porcentagem_acertos DESC;'
      '')
    Left = 456
    Top = 192
  end
  object frxDBDatasetDesempenho: TfrxDBDataset
    UserName = 'frxDBDatasetDesempenho'
    CloseDataSource = False
    DataSet = FDQueryRelatorioDesempenho
    BCDToCurrency = False
    DataSetOptions = []
    Left = 551
    Top = 184
    FieldDefs = <
      item
        FieldName = 'user_name'
        FieldType = fftString
        Size = 255
      end
      item
        FieldName = 'porcentagem_acertos'
        Size = 64
      end
      item
        FieldName = 'progresso'
        FieldType = fftString
        Size = 20
      end>
  end
  object frxReportDesempenho: TfrxReport
    Version = '2026.1.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45976.744986504600000000
    ReportOptions.LastChange = 45976.744986504600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 656
    Top = 152
    Datasets = <
      item
        DataSet = frxDBDatasetDesempenho
        DataSetName = 'frxDBDatasetDesempenho'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 14211288
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 15790320
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 15790320
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftTop]
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
        Frame.Width = 2.000000000000000000
      end>
    Watermarks = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 14211288
          HAlign = haCenter
          Memo.UTF8W = (
            'Report')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110236220472000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Width = 426.218810463724000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'user_name')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 426.218810463724000000
          Width = 206.908059703608000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'porcentagem_acertos')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 633.126870167332000000
          Width = 84.983366053140700000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'progresso')
          ParentFont = False
          Style = 'Header'
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 151.181200000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDatasetDesempenho
        DataSetName = 'frxDBDatasetDesempenho'
        RowCount = 0
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Width = 426.218810463724000000
          Height = 18.897650000000000000
          DataField = 'user_name'
          DataSet = frxDBDatasetDesempenho
          DataSetName = 'frxDBDatasetDesempenho'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetDesempenho."user_name"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 426.218810460000000000
          Width = 206.908059700000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDatasetDesempenho
          DataSetName = 'frxDBDatasetDesempenho'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetDesempenho."porcentagem_acertos"]%')
          ParentFont = False
          Style = 'Data'
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 633.126870167332000000
          Width = 84.983366053140700000
          Height = 18.897650000000000000
          DataField = 'progresso'
          DataSet = frxDBDatasetDesempenho
          DataSetName = 'frxDBDatasetDesempenho'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDatasetDesempenho."progresso"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 230.551330000000000000
        Width = 718.110700000000000000
        object Memo9: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo11: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 642.520117773437500000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
    end
  end
  object frxDBDatasetLastAccess: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = FDQueryRelatorioLastAccess
    BCDToCurrency = False
    DataSetOptions = []
    Left = 599
    Top = 8
    FieldDefs = <
      item
        FieldName = 'user_name'
        FieldType = fftString
        Size = 255
      end
      item
        FieldName = 'dias_acessados'
      end
      item
        FieldName = 'mes_do_registro'
      end>
  end
  object FDQueryRelatorioLastAccess: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT'
      '    u.user_name,'
      '    COUNT(DISTINCT DATE(ll.data_login)) AS dias_acessados,'
      ''
      
        '    TO_CHAR(ll.data_login, '#39'MM/YYYY'#39')::VARCHAR AS mes_do_registr' +
        'o'
      ''
      'FROM login_logs ll'
      'INNER JOIN users u ON u.id = ll.user_id'
      ''
      'WHERE u.user_escola_id = 33'
      ''
      'GROUP BY'
      '    u.user_name,'
      '    TO_CHAR(ll.data_login, '#39'MM/YYYY'#39')'
      ''
      'ORDER BY'
      '    mes_do_registro,'
      '    u.user_name;'
      '')
    Left = 560
    Top = 8
    object FDQueryRelatorioLastAccessuser_name: TWideStringField
      FieldName = 'user_name'
      Origin = 'user_name'
      Size = 255
    end
    object FDQueryRelatorioLastAccessdias_acessados: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'dias_acessados'
      Origin = 'dias_acessados'
      ReadOnly = True
    end
    object FDQueryRelatorioLastAccessmes_do_registro: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'mes_do_registro'
      Origin = 'mes_do_registro'
      ReadOnly = True
      Size = 8190
    end
  end
  object frxReportLastAccess: TfrxReport
    Version = '2026.1.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45976.778352592600000000
    ReportOptions.LastChange = 45976.778995474540000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 632
    Top = 8
    Datasets = <
      item
        DataSet = frxDBDatasetLastAccess
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 14211288
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 15790320
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 15790320
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftTop]
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
        Frame.Width = 2.000000000000000000
      end>
    Watermarks = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 14211288
          HAlign = haCenter
          Memo.UTF8W = (
            'Report')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110236220472000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Width = 612.110236220472000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'user_name')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 612.110236220472000000
          Width = 106.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'dias_acessados')
          ParentFont = False
          Style = 'Header'
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 151.181200000000000000
        Width = 718.110700000000000000
        KeepWithData = False
        Condition = 'frxDBDataset1."mes_do_registro"'
        object Memo5: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'mes_do_registro'
          DataSet = frxDBDatasetLastAccess
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            '[frxDBDataset1."mes_do_registro"]')
          ParentFont = False
          Style = 'Group header'
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 200.315090000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDatasetLastAccess
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Width = 612.110236220472000000
          Height = 18.897650000000000000
          DataField = 'user_name'
          DataSet = frxDBDatasetLastAccess
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."user_name"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 612.110236220472000000
          Width = 106.000000000000000000
          Height = 18.897650000000000000
          DataField = 'dias_acessados'
          DataSet = frxDBDatasetLastAccess
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."dias_acessados"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Top = 241.889920000000000000
        Width = 718.110700000000000000
        KeepWithData = False
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 302.362400000000000000
        Width = 718.110700000000000000
        object Memo8: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo10: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 642.520117773437500000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
    end
  end
end
