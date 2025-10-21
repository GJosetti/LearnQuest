object frm_menuEscola: Tfrm_menuEscola
  Left = 0
  Top = 0
  Caption = 'frm_menuEscola'
  ClientHeight = 720
  ClientWidth = 1280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object pnl_home_EscolaMenu: TPanel
    Left = 263
    Top = -1
    Width = 1017
    Height = 721
    Color = 16512
    ParentBackground = False
    TabOrder = 1
  end
  object pnl_sideMenu_EscolaMenu: TPanel
    Left = -8
    Top = -1
    Width = 273
    Height = 721
    Color = clBtnHighlight
    ParentBackground = False
    TabOrder = 2
    object Membros: TButton
      Left = 48
      Top = 216
      Width = 161
      Height = 49
      Caption = 'Membros'
      TabOrder = 0
      OnClick = MembrosClick
    end
    object Home: TButton
      Left = 48
      Top = 104
      Width = 161
      Height = 49
      Caption = 'Home'
      TabOrder = 1
      OnClick = HomeClick
    end
    object Turmas: TButton
      Left = 48
      Top = 325
      Width = 161
      Height = 49
      Caption = 'Turmas'
      TabOrder = 2
      OnClick = TurmasClick
    end
    object pnl_back_EscolaMenu: TPanel
      Left = 8
      Top = 5
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
      TabOrder = 3
      OnClick = pnl_back_EscolaMenuClick
    end
  end
  object pnl_turmas_EscolaMenu: TPanel
    Left = 263
    Top = -1
    Width = 1017
    Height = 721
    Color = clPurple
    ParentBackground = False
    TabOrder = 3
    Visible = False
    object dbg_turmasEscola: TDBGrid
      Left = 112
      Top = 93
      Width = 513
      Height = 344
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
          Title.Alignment = taCenter
          Title.Caption = 'Nome'
          Width = 150
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'descricao'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 150
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'user_name'
          Title.Alignment = taCenter
          Title.Caption = 'Professor'
          Width = 170
          Visible = True
        end>
    end
    object btn_AdicionarTurmaMenu: TPanel
      Left = 112
      Top = 456
      Width = 105
      Height = 25
      Caption = 'Adicionar'
      Color = clBtnHighlight
      ParentBackground = False
      TabOrder = 1
      OnClick = btn_AdicionarTurmaMenuClick
    end
    object btn_RemoverTurmaMenu: TPanel
      Left = 320
      Top = 456
      Width = 105
      Height = 25
      Caption = 'Remover'
      Color = clBtnHighlight
      ParentBackground = False
      TabOrder = 2
      OnClick = btn_RemoverTurmaMenuClick
    end
    object btn_EditarTurmaMenu: TPanel
      Left = 520
      Top = 456
      Width = 105
      Height = 25
      Caption = 'Editar'
      Color = clBtnHighlight
      ParentBackground = False
      TabOrder = 3
      OnClick = btn_editar_EscolaMenuClick
    end
    object pnl_addNEdit_Turma_EscolaMenu: TPanel
      Left = 164
      Top = 4
      Width = 449
      Height = 456
      Color = clBtnHighlight
      ParentBackground = False
      TabOrder = 4
      Visible = False
      object lbl_title_addNEdit_Turma_EscolaMenu: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 13
        Width = 441
        Height = 21
        Margins.Top = 12
        Align = alTop
        Alignment = taCenter
        Caption = 'Adicionar Turma'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 126
      end
      object lbl_Nome_Turma_addNEdit_Escola_Menu: TLabel
        Left = 160
        Top = 122
        Width = 87
        Height = 15
        Caption = 'Nome da Turma'
      end
      object lbl_Descricao_addNEdit_Turma_EscolaMenu: TLabel
        Left = 176
        Top = 188
        Width = 51
        Height = 15
        Caption = 'Descri'#231#227'o'
      end
      object lbl_professorResponsavel_addNEdit_Turma_EscolaMenu: TLabel
        Left = 144
        Top = 271
        Width = 120
        Height = 15
        Caption = 'Professor Respons'#225'vel:'
      end
      object edt_Nome_Turma_EscolaMenu: TEdit
        Left = 32
        Top = 143
        Width = 353
        Height = 23
        TabOrder = 0
        TextHint = 'Insira um nome'
      end
      object btn_concluir_addNEdit_Turma_EscolaMenu: TPanel
        Left = 151
        Top = 414
        Width = 126
        Height = 26
        Caption = 'Concluir'
        Color = clBtnHighlight
        ParentBackground = False
        TabOrder = 1
        OnClick = btn_concluir_addNEdit_Turma_EscolaMenuClick
      end
      object btn_Sair_addNEdit_Turma_EscolaMenu: TPanel
        Left = 383
        Top = 13
        Width = 58
        Height = 26
        Caption = 'Sair'
        Color = clBtnHighlight
        ParentBackground = False
        TabOrder = 2
        OnClick = btn_Sair_addNEdit_Turma_EscolaMenuClick
      end
      object edt_Descricao_addNEdit_Turma_EscolaMenu: TEdit
        Left = 32
        Top = 209
        Width = 353
        Height = 23
        TabOrder = 3
        TextHint = 'XXXXX-XXX'
      end
      object cb_ProfessorResponsavel_AddNEdit_Turma_EscolaMenu: TComboBox
        Left = 136
        Top = 292
        Width = 153
        Height = 23
        TabOrder = 4
        Text = 'Selecione um Professor:'
      end
    end
  end
  object pnl_membros_EscolaMenu: TPanel
    Left = 263
    Top = -1
    Width = 1017
    Height = 721
    Color = clTeal
    ParentBackground = False
    TabOrder = 0
    Visible = False
    object dbg_membrosEscola: TDBGrid
      Left = 112
      Top = 93
      Width = 513
      Height = 344
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnColumnMoved = dbg_membrosEscolaColumnMoved
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'user_name'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Nome'
          Width = 150
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'email'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Email'
          Width = 150
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'descricao'
          Title.Alignment = taCenter
          Title.Caption = 'Cargo'
          Width = 100
          Visible = True
        end>
    end
    object btn_adicionar_EscolaMenu: TPanel
      Left = 112
      Top = 456
      Width = 105
      Height = 25
      Caption = 'Adicionar'
      Color = clBtnHighlight
      ParentBackground = False
      TabOrder = 1
      OnClick = btn_adicionar_EscolaMenuClick
    end
    object btn_remover_EscolaMenu: TPanel
      Left = 320
      Top = 456
      Width = 105
      Height = 25
      Caption = 'Remover'
      Color = clBtnHighlight
      ParentBackground = False
      TabOrder = 2
      OnClick = btn_remover_EscolaMenuClick
    end
    object btn_editar_EscolaMenu: TPanel
      Left = 520
      Top = 456
      Width = 105
      Height = 25
      Caption = 'Editar'
      Color = clBtnHighlight
      ParentBackground = False
      TabOrder = 3
      OnClick = btn_editar_EscolaMenuClick
    end
    object pnl_addNEdit_EscolaMenu: TPanel
      Left = 160
      Top = 12
      Width = 449
      Height = 456
      Color = clBtnHighlight
      ParentBackground = False
      TabOrder = 4
      Visible = False
      object pnl_title_addNEdit_EscolaMenu: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 13
        Width = 441
        Height = 21
        Margins.Top = 12
        Align = alTop
        Alignment = taCenter
        Caption = 'Adicionar Usu'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 137
      end
      object lbl_nome_edit_addNEdit_EscolaMenu: TLabel
        Left = 160
        Top = 122
        Width = 95
        Height = 15
        Caption = 'Nome do usu'#225'rio:'
      end
      object lbl_passwordAdmin_addNEdit_EscolaMenu: TLabel
        Left = 184
        Top = 188
        Width = 35
        Height = 15
        Caption = 'Senha:'
      end
      object lbl_email_addNEdit_EscolaMenu: TLabel
        Left = 184
        Top = 250
        Width = 32
        Height = 15
        Caption = 'Email:'
      end
      object lbl_role_addNEdit_EscolaAdmin: TLabel
        Left = 168
        Top = 313
        Width = 82
        Height = 15
        Caption = 'Tipo de usu'#225'rio'
      end
      object edt_nome_addNEdit_EscolaMenu: TEdit
        Left = 32
        Top = 143
        Width = 353
        Height = 23
        TabOrder = 0
        TextHint = 'Insira um nome'
      end
      object btn_concluir_addNEdit_EscolaMenu: TPanel
        Left = 151
        Top = 414
        Width = 126
        Height = 26
        Caption = 'Concluir'
        Color = clBtnHighlight
        ParentBackground = False
        TabOrder = 1
        OnClick = btn_concluir_addNEdit_EscolaMenuClick
      end
      object btn_cancelar_addNEdit_EscolaMenu: TPanel
        Left = 383
        Top = 13
        Width = 58
        Height = 26
        Caption = 'Sair'
        Color = clBtnHighlight
        ParentBackground = False
        TabOrder = 2
        OnClick = btn_cancelar_addNEdit_EscolaMenuClick
      end
      object edt_password_addNEdit__EscolaMenu: TEdit
        Left = 32
        Top = 209
        Width = 353
        Height = 23
        TabOrder = 3
        TextHint = 'XXXXX-XXX'
      end
      object edt_email_addNEdit_EscolaMenu: TEdit
        Left = 32
        Top = 271
        Width = 353
        Height = 23
        TabOrder = 4
        TextHint = 'XXXXX-XXX'
      end
      object cb_role_addNEdit_EscolaMenu: TComboBox
        Left = 136
        Top = 350
        Width = 145
        Height = 23
        TabOrder = 5
        Text = 'Selecione um tipo:'
      end
    end
  end
  object d_Src_membros_escola: TDataSource
    Left = 735
    Top = 655
  end
end
