object frm_menuAdmin_view: Tfrm_menuAdmin_view
  Left = 0
  Top = 0
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
  object pnl_sideMenu_adminMenu: TPanel
    Left = -8
    Top = 0
    Width = 273
    Height = 721
    Color = clBtnHighlight
    ParentBackground = False
    TabOrder = 0
    object Escolas: TButton
      Left = 48
      Top = 216
      Width = 161
      Height = 49
      Caption = 'Escolas'
      TabOrder = 0
      OnClick = EscolasClick
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
    object pnl_back_adminMenu: TPanel
      Left = 8
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
      OnClick = pnl_back_adminMenuClick
    end
  end
  object pnl_home_adminMenu: TPanel
    Left = 264
    Top = 0
    Width = 1017
    Height = 721
    Color = 16512
    ParentBackground = False
    TabOrder = 1
  end
  object pnl_escolas_adminMenu: TPanel
    Left = 264
    Top = 0
    Width = 1017
    Height = 721
    Color = clTeal
    ParentBackground = False
    TabOrder = 2
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
      OnColumnMoved = dbg_escolasColumnMoved
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
      OnClick = btn_adicionar_adminMenuClick
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
      OnClick = btn_remover_adminMenuClick
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
      OnClick = btn_editar_adminMenuClick
    end
    object pnl_addNEdit_adminMenu: TPanel
      Left = 128
      Top = 12
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
        OnClick = btn_concluir_addNEdit_adminMenuClick
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
        OnClick = btn_cancelar_addNEdit_adminMenuClick
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
  object d_Src_escolas: TDataSource
    Left = 735
    Top = 655
  end
end
