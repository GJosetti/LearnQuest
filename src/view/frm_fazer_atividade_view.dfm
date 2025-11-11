object frm_fazer_atividade_view: Tfrm_fazer_atividade_view
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 720
  ClientWidth = 1280
  Color = clGoldenrod
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object lbl_title: TLabel
    Left = 8
    Top = 8
    Width = 72
    Height = 40
    Caption = 'T'#237'tulo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lbl_pergunta: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 1274
    Height = 86
    Margins.Top = 50
    Align = alTop
    Alignment = taCenter
    Caption = 'PERGUNTA?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -64
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ExplicitLeft = 480
    ExplicitTop = 56
    ExplicitWidth = 341
  end
  object OpçãoA: TPanel
    Left = 156
    Top = 288
    Width = 353
    Height = 137
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    OnMouseEnter = OpçãoAMouseEnter
    OnMouseLeave = OpçãoAMouseLeave
    object lbl_optionA: TLabel
      AlignWithMargins = True
      Left = 31
      Top = 81
      Width = 291
      Height = 52
      Margins.Left = 30
      Margins.Top = 80
      Margins.Right = 30
      Align = alClient
      Alignment = taCenter
      Caption = 'lbl_optionA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 61
      ExplicitHeight = 15
    end
  end
  object OpçãoB: TPanel
    Left = 758
    Top = 288
    Width = 353
    Height = 137
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object lbl_optionB: TLabel
      AlignWithMargins = True
      Left = 31
      Top = 81
      Width = 291
      Height = 52
      Margins.Left = 30
      Margins.Top = 80
      Margins.Right = 30
      Align = alClient
      Alignment = taCenter
      Caption = 'lbl_optionA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 61
      ExplicitHeight = 15
    end
  end
  object OpçãoC: TPanel
    Left = 156
    Top = 534
    Width = 353
    Height = 137
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object lbl_optionC: TLabel
      AlignWithMargins = True
      Left = 31
      Top = 81
      Width = 291
      Height = 52
      Margins.Left = 30
      Margins.Top = 80
      Margins.Right = 30
      Align = alClient
      Alignment = taCenter
      Caption = 'lbl_optionA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 61
      ExplicitHeight = 15
    end
  end
  object OpçãoD: TPanel
    Left = 758
    Top = 534
    Width = 353
    Height = 137
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    object lbl_optionD: TLabel
      AlignWithMargins = True
      Left = 31
      Top = 81
      Width = 291
      Height = 52
      Margins.Left = 30
      Margins.Top = 80
      Margins.Right = 30
      Align = alClient
      Alignment = taCenter
      Caption = 'lbl_optionA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 61
      ExplicitHeight = 15
    end
  end
  object timer: TTimer
    Enabled = False
    Interval = 30
    OnTimer = timerTimer
    Left = 1136
    Top = 480
  end
end
