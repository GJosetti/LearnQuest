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
    object btn_adicionar_EscolaMenu: TPanel
      Left = 112
      Top = 456
      Width = 105
      Height = 25
      Caption = 'Adicionar'
      Color = clBtnHighlight
      ParentBackground = False
      TabOrder = 1
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
    end
    object pnl_addNEdit_EscolaMenu: TPanel
      Left = 176
      Top = 93
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
