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
      Top = 310
      Width = 161
      Height = 49
      Caption = 'Minhas Turmas'
      TabOrder = 0
      OnClick = btn_minhas_turmasClick
    end
    object btn_home: TButton
      Left = 48
      Top = 144
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
      Top = 504
      Width = 161
      Height = 49
      Caption = 'Minhas Atividades'
      TabOrder = 3
      OnClick = btn_minhas_atividadesClick
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
      Left = 360
      Top = 113
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
    object btn_atribuir_atividade: TPanel
      Left = 464
      Top = 493
      Width = 105
      Height = 25
      Caption = 'Atribuir Atividade'
      Color = clBtnHighlight
      ParentBackground = False
      TabOrder = 1
      OnClick = btn_atribuir_atividadeClick
    end
    object pnl_link_atividade_turma: TPanel
      Left = 360
      Top = 53
      Width = 321
      Height = 480
      Color = clBrown
      ParentBackground = False
      TabOrder = 2
      Visible = False
      object lbl_nome_turma: TLabel
        Left = 80
        Top = 17
        Width = 169
        Height = 32
        Alignment = taCenter
        Caption = 'Nome da turma'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object dbg_atividadesToLink: TDBGrid
        Left = 40
        Top = 73
        Width = 241
        Height = 268
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
            Width = 220
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'id'
            Visible = True
          end>
      end
      object btn_link: TPanel
        Left = 64
        Top = 400
        Width = 185
        Height = 41
        Caption = 'Atribuir'
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        OnClick = btn_linkClick
      end
      object btn_cancel_link_atividade: TPanel
        Left = 288
        Top = 7
        Width = 25
        Height = 23
        BevelOuter = bvNone
        Caption = 'X'
        Color = clRed
        ParentBackground = False
        TabOrder = 2
        OnClick = btn_cancel_link_atividadeClick
      end
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
      Left = 216
      Top = 143
      Width = 545
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
          Alignment = taCenter
          Expanded = False
          FieldName = 'id'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'name'
          Title.Alignment = taCenter
          Title.Caption = 'Mat'#233'ria'
          Width = 120
          Visible = True
        end>
    end
    object pnl_adicionar_atividades: TPanel
      Left = 240
      Top = 504
      Width = 66
      Height = 29
      Caption = 'Criar'
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      OnClick = pnl_adicionar_atividadesClick
    end
    object pnL_edit_atividade: TPanel
      Left = 663
      Top = 504
      Width = 66
      Height = 29
      Caption = 'Edit'
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      OnClick = pnL_edit_atividadeClick
    end
    object pnl_desempenho_turmas: TPanel
      Left = 336
      Top = 555
      Width = 273
      Height = 29
      Caption = 'Desempenho das turmas'
      Color = clWhite
      ParentBackground = False
      TabOrder = 3
      OnClick = pnl_desempenho_turmasClick
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
