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
    end
    object btn_home: TButton
      Left = 48
      Top = 104
      Width = 161
      Height = 49
      Caption = 'Home'
      TabOrder = 1
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
  object pnl_minhas_turmas: TPanel
    Left = 263
    Top = -1
    Width = 1017
    Height = 721
    Color = clTeal
    ParentBackground = False
    TabOrder = 0
    Visible = False
    object dbg_escolas: TDBGrid
      Left = 112
      Top = 93
      Width = 513
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
          FieldName = 'ID'
          ReadOnly = True
          Title.Caption = '-ID-'
          Width = 50
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Nome'
          ReadOnly = True
          Title.Caption = 'Nome Institui'#231#227'o'
          Width = 150
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Endereco'
          ReadOnly = True
          Title.Caption = 'Endere'#231'o'
          Width = 125
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'membros_qtd'
          ReadOnly = True
          Title.Caption = 'Quantidade'
          Width = 75
          Visible = True
        end>
    end
    object btn_adicionar_adminMenu: TPanel
      Left = 112
      Top = 456
      Width = 105
      Height = 25
      Caption = 'Adicionar'
      Color = clBtnHighlight
      ParentBackground = False
      TabOrder = 1
    end
    object btn_remover_adminMenu: TPanel
      Left = 320
      Top = 456
      Width = 105
      Height = 25
      Caption = 'Remover'
      Color = clBtnHighlight
      ParentBackground = False
      TabOrder = 2
    end
    object btn_editar_adminMenu: TPanel
      Left = 520
      Top = 456
      Width = 105
      Height = 25
      Caption = 'Editar'
      Color = clBtnHighlight
      ParentBackground = False
      TabOrder = 3
    end
    object pnl_addNEdit_adminMenu: TPanel
      Left = 176
      Top = 84
      Width = 449
      Height = 456
      Color = clBtnHighlight
      ParentBackground = False
      TabOrder = 4
      Visible = False
      object pnl_title_addNEdit_adminMenu: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 13
        Width = 441
        Height = 21
        Margins.Top = 12
        Align = alTop
        Alignment = taCenter
        Caption = 'Adicionar Escola'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 126
      end
      object lbl_nome_edit_addNEdit_adminMenu: TLabel
        Left = 160
        Top = 122
        Width = 88
        Height = 15
        Caption = 'Nome da Escola:'
      end
      object lbl_CEP_addNEdit_adminMenu: TLabel
        Left = 32
        Top = 212
        Width = 24
        Height = 15
        Caption = 'CEP:'
      end
      object lbl_nomeAdmin_addNEdit_adminMenu: TLabel
        Left = 32
        Top = 300
        Width = 92
        Height = 15
        Caption = 'Nome do usu'#225'rio'
      end
      object lbl_passwordAdmin_addNEdit_adminMenu: TLabel
        Left = 32
        Top = 350
        Width = 91
        Height = 15
        Caption = 'Senha do usu'#225'rio'
      end
      object lbl_title_UserAdmin_pnl_AddNEdit_adminMenu: TLabel
        AlignWithMargins = True
        Left = 142
        Top = 268
        Width = 175
        Height = 21
        Margins.Top = 12
        Alignment = taCenter
        Caption = 'Usu'#225'rio administrador '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_email_addNEdit_adminMenu: TLabel
        Left = 240
        Top = 212
        Width = 32
        Height = 15
        Caption = 'Email:'
      end
      object edt_nome_addNEdit_adminMenu: TEdit
        Left = 32
        Top = 143
        Width = 353
        Height = 23
        TabOrder = 0
        TextHint = 'Insira um nome'
      end
      object btn_concluir_addNEdit_adminMenu: TPanel
        Left = 167
        Top = 414
        Width = 126
        Height = 26
        Caption = 'Concluir'
        Color = clBtnHighlight
        ParentBackground = False
        TabOrder = 1
      end
      object btn_cancelar_addNEdit_adminMenu: TPanel
        Left = 383
        Top = 13
        Width = 58
        Height = 26
        Caption = 'Sair'
        Color = clBtnHighlight
        ParentBackground = False
        TabOrder = 2
      end
      object edt_nomeUsurario_addNEdit_adminMenu: TEdit
        Left = 32
        Top = 321
        Width = 145
        Height = 23
        TabOrder = 3
      end
      object edt_password_addNEdit__adminMenu: TEdit
        Left = 32
        Top = 371
        Width = 145
        Height = 23
        PasswordChar = '*'
        TabOrder = 4
      end
      object edt_email_addNEdit_adminMenu: TEdit
        Left = 241
        Top = 233
        Width = 112
        Height = 23
        TabOrder = 5
        TextHint = 'Insira um email'
      end
      object edt_CEP_addNEdit_adminMenu: TMaskEdit
        Left = 32
        Top = 233
        Width = 104
        Height = 23
        EditMask = '00000-000;1;_'
        MaxLength = 9
        TabOrder = 6
        Text = '     -   '
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
      Left = 336
      Top = 116
      Width = 217
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
          FieldName = 'title'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Nome'
          Width = 100
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'name'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Tipo'
          Width = 100
          Visible = True
        end>
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
