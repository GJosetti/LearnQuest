object frm_menu_professor: Tfrm_menu_professor
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 720
  ClientWidth = 1280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object pnl_home_adminMenu: TPanel
    Left = 263
    Top = -1
    Width = 1017
    Height = 721
    Color = 16512
    ParentBackground = False
    TabOrder = 1
  end
  object pnl_sideMenu: TPanel
    Left = -8
    Top = -1
    Width = 273
    Height = 721
    Color = clBtnHighlight
    ParentBackground = False
    TabOrder = 2
    object btn_minhas_turmas: TButton
      Left = 48
      Top = 190
      Width = 161
      Height = 49
      Caption = 'Minhas Turmas'
      TabOrder = 0
      OnClick = btn_minhas_turmasClick
    end
    object btn_home: TButton
      Left = 48
      Top = 104
      Width = 161
      Height = 49
      Caption = 'Home'
      TabOrder = 1
      OnClick = btn_homeClick
    end
    object pnl_back: TPanel
      Left = 0
      Top = 0
      Width = 185
      Height = 41
      Caption = 'Voltar'
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      OnClick = pnl_backClick
    end
    object btn_minhas_atividades: TButton
      Left = 48
      Top = 280
      Width = 161
      Height = 49
      Caption = 'Minhas Atividades'
      TabOrder = 3
      OnClick = btn_minhas_atividadesClick
    end
    object btn_minhas_fases: TButton
      Left = 48
      Top = 368
      Width = 161
      Height = 49
      Caption = 'Minhas Fases'
      TabOrder = 4
    end
    object btn_minhas_trilhas: TButton
      Left = 48
      Top = 445
      Width = 161
      Height = 49
      Caption = 'Minhas Trilhas'
      TabOrder = 5
    end
  end
  object pnl_minhas_atividades: TPanel
    Left = 263
    Top = -1
    Width = 1017
    Height = 721
    Color = 16744576
    ParentBackground = False
    TabOrder = 3
    Visible = False
    object dbg_atividades: TDBGrid
      Left = 256
      Top = 116
      Width = 449
      Height = 344
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'atividade_nome'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Nome'
          Width = 200
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'template_nome'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Tipo'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'id'
          Visible = True
        end>
    end
    object pnl_adicionar_atividades: TPanel
      Left = 343
      Top = 484
      Width = 29
      Height = 29
      Caption = '+'
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      OnClick = pnl_adicionar_atividadesClick
    end
    object Panel1: TPanel
      Left = 520
      Top = 487
      Width = 41
      Height = 29
      Caption = 'Edit'
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      OnClick = Panel1Click
    end
  end
  object pnl_minhas_turmas: TPanel
    Left = 263
    Top = -1
    Width = 1017
    Height = 721
    Color = clTeal
    ParentBackground = False
    TabOrder = 0
    Visible = False
    object dbg_turmas: TDBGrid
      Left = 288
      Top = 73
      Width = 321
      Height = 344
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'turma_name'
          ReadOnly = True
          Title.Caption = 'Nome Da Turma'
          Width = 300
          Visible = True
        end>
    end
    object btn_adicionar_adminMenu: TPanel
      Left = 304
      Top = 453
      Width = 105
      Height = 25
      Caption = 'Adicionar'
      Color = clBtnHighlight
      ParentBackground = False
      TabOrder = 1
    end
    object btn_editar_adminMenu: TPanel
      Left = 472
      Top = 456
      Width = 105
      Height = 25
      Caption = 'Editar'
      Color = clBtnHighlight
      ParentBackground = False
      TabOrder = 2
    end
  end
  object d_src_turmas: TDataSource
    Left = 759
    Top = 599
  end
  object d_src_atividades: TDataSource
    Left = 663
    Top = 599
  end
end
