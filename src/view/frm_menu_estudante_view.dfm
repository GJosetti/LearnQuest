object frm_estudante_view: Tfrm_estudante_view
  Left = 0
  Top = 0
  Caption = 'frm_estudante_view'
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
  object pnl_sideMenu: TPanel
    Left = -16
    Top = -1
    Width = 273
    Height = 721
    Color = clBtnHighlight
    ParentBackground = False
    TabOrder = 0
    object btn_atividades: TButton
      Left = 48
      Top = 310
      Width = 161
      Height = 49
      Caption = 'Atividades'
      TabOrder = 0
      OnClick = btn_atividadesClick
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
      Top = 488
      Width = 161
      Height = 49
      Caption = 'Minhas Atividades'
      TabOrder = 3
    end
  end
  object pnl_home: TPanel
    Left = 256
    Top = 0
    Width = 1025
    Height = 720
    Color = clCoral
    ParentBackground = False
    TabOrder = 1
  end
  object pnl_atividades: TPanel
    Left = 256
    Top = 0
    Width = 1025
    Height = 720
    Color = 12615935
    ParentBackground = False
    TabOrder = 2
    Visible = False
    object dbg_atividades: TDBGrid
      Left = 232
      Top = 159
      Width = 489
      Height = 377
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
          Title.Alignment = taCenter
          Title.Caption = 'Nome'
          Width = 300
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'turma_name'
          Title.Alignment = taCenter
          Title.Caption = 'Turma'
          Width = 150
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'atividade_id'
          Visible = False
        end>
    end
    object btn_fazer: TPanel
      Left = 376
      Top = 568
      Width = 185
      Height = 41
      Caption = 'Resolver Atividade!'
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      OnClick = btn_fazerClick
    end
  end
  object d_src_atividades: TDataSource
    Left = 552
    Top = 632
  end
end
