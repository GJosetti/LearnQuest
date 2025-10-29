object frm_criar_atividades: Tfrm_criar_atividades
  Left = 0
  Top = 0
  Caption = 'frm_criar_atividades'
  ClientHeight = 720
  ClientWidth = 1280
  Color = clDarkolivegreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object btn_cancel: TPanel
    Left = 8
    Top = 8
    Width = 153
    Height = 33
    Caption = 'btn_cancel'
    TabOrder = 0
  end
  object cb_types: TComboBox
    Left = 544
    Top = 67
    Width = 169
    Height = 23
    TabOrder = 1
    Text = 'cb_types'
    OnSelect = cb_typesSelect
  end
  object pnl_atividade_quiz: TPanel
    Left = 184
    Top = 112
    Width = 937
    Height = 457
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object lbl_title: TLabel
      Left = 280
      Top = 19
      Width = 319
      Height = 47
      Caption = 'T'#237'tulo da Atividade'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -35
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object lbl_descricao_quiz: TLabel
      Left = 144
      Top = 147
      Width = 95
      Height = 30
      Caption = 'Descri'#231#227'o:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lbl_pergunta_quiz: TLabel
      Left = 592
      Top = 147
      Width = 88
      Height = 30
      Caption = 'Pergunta:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lbl_alternativas_quiz: TLabel
      Left = 576
      Top = 259
      Width = 114
      Height = 30
      Caption = 'Alternativas:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lbl_alternativa_a_quiz: TLabel
      Left = 447
      Top = 303
      Width = 11
      Height = 20
      Caption = 'A'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_alternativa_b_quiz: TLabel
      Left = 447
      Top = 332
      Width = 10
      Height = 20
      Caption = 'B'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_alternativa_c_quiz: TLabel
      Left = 447
      Top = 361
      Width = 9
      Height = 20
      Caption = 'C'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_alternativa_d_quiz: TLabel
      Left = 447
      Top = 387
      Width = 11
      Height = 20
      Caption = 'D'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edt_title: TEdit
      Left = 280
      Top = 72
      Width = 319
      Height = 23
      Alignment = taCenter
      TabOrder = 0
    end
    object edt_descricao: TEdit
      Left = 64
      Top = 183
      Width = 257
      Height = 202
      Alignment = taCenter
      TabOrder = 1
    end
    object edt_pergunta_quiz: TEdit
      Left = 464
      Top = 183
      Width = 361
      Height = 58
      Alignment = taCenter
      TabOrder = 2
    end
    object edt_alternativa_a_quiz: TEdit
      Left = 472
      Top = 303
      Width = 345
      Height = 23
      Alignment = taCenter
      TabOrder = 3
    end
    object edt_alternativa_b_quiz: TEdit
      Left = 472
      Top = 332
      Width = 345
      Height = 23
      Alignment = taCenter
      TabOrder = 4
    end
    object edt_alternativa_c_quiz: TEdit
      Left = 472
      Top = 361
      Width = 345
      Height = 23
      Alignment = taCenter
      TabOrder = 5
    end
    object edt_alternativa_d_quiz: TEdit
      Left = 472
      Top = 390
      Width = 345
      Height = 23
      Alignment = taCenter
      TabOrder = 6
    end
    object rg_alternativas_quiz: TRadioGroup
      Left = 823
      Top = 287
      Width = 26
      Height = 130
      Items.Strings = (
        ''
        ''
        ''
        '')
      TabOrder = 7
    end
  end
  object pnl_Concluido: TPanel
    Left = 560
    Top = 592
    Width = 185
    Height = 41
    Caption = 'Criar'
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
  end
end
