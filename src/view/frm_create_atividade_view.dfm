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
  OnShow = FormShow
  TextHeight = 15
  object btn_cancel: TPanel
    Left = 0
    Top = 0
    Width = 161
    Height = 41
    BevelOuter = bvNone
    Caption = 'Cancelar'
    Color = clRed
    ParentBackground = False
    TabOrder = 0
    OnClick = btn_cancelClick
  end
  object cb_types: TComboBox
    Left = 544
    Top = 67
    Width = 169
    Height = 23
    TabOrder = 1
    TextHint = 'Selecione um tipo: '
    OnSelect = cb_typesSelect
    Items.Strings = (
      'Quiz'
      'Verdadeiro ou Falso')
  end
  object pnl_atividade_quiz: TPanel
    Left = 176
    Top = 105
    Width = 937
    Height = 457
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object lbl_title: TLabel
      Left = 296
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
    object lbl_materia: TLabel
      Left = 136
      Top = 308
      Width = 76
      Height = 30
      Caption = 'Materia:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
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
      Width = 265
      Height = 23
      Alignment = taCenter
      TabOrder = 1
    end
    object edt_pergunta_quiz: TEdit
      Left = 464
      Top = 183
      Width = 361
      Height = 23
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
    object cb_materias: TComboBox
      Left = 88
      Top = 344
      Width = 169
      Height = 23
      TabOrder = 8
      TextHint = 'Selecione um tipo: '
      Items.Strings = (
        'Quiz'#11
        'Verdadeiro ou Falso')
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
    OnClick = pnl_ConcluidoClick
  end
end
