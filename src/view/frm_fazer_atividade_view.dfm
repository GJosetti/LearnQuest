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
    Left = 320
    Top = 64
    Width = 341
    Height = 86
    Alignment = taCenter
    Caption = 'PERGUNTA?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -64
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object OpçãoA: TPanel
    Left = 364
    Top = 408
    Width = 353
    Height = 137
    Caption = 'A'
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
  end
  object OpçãoB: TPanel
    Left = 904
    Top = 408
    Width = 353
    Height = 137
    Caption = 'B'
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
  end
  object OpçãoC: TPanel
    Left = 364
    Top = 591
    Width = 353
    Height = 137
    Caption = 'C'
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
  end
  object OpçãoD: TPanel
    Left = 904
    Top = 591
    Width = 353
    Height = 137
    Caption = 'D'
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
  end
  object timer: TTimer
    Enabled = False
    Interval = 30
    OnTimer = timerTimer
    Left = 1136
    Top = 480
  end
end
