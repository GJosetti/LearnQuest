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
  TextHeight = 15
  object pnl_sideMenu: TPanel
    Left = -16
    Top = -1
    Width = 273
    Height = 721
    Color = clBtnHighlight
    ParentBackground = False
    TabOrder = 0
    object btn_minhas_turmas: TButton
      Left = 48
      Top = 310
      Width = 161
      Height = 49
      Caption = 'Minhas Turmas'
      TabOrder = 0
    end
    object btn_home: TButton
      Left = 48
      Top = 144
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
    end
    object btn_minhas_atividades: TButton
      Left = 48
      Top = 504
      Width = 161
      Height = 49
      Caption = 'Minhas Atividades'
      TabOrder = 3
    end
  end
end
