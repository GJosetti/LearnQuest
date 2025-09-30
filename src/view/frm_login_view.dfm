object frm_login: Tfrm_login
  Left = 0
  Top = 0
  Caption = 'frm_login'
  ClientHeight = 718
  ClientWidth = 1148
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object pnl_login: TPanel
    Left = 0
    Top = 0
    Width = 1148
    Height = 718
    Align = alClient
    TabOrder = 0
    object lbl_title_login: TLabel
      Left = 1
      Top = 1
      Width = 1146
      Height = 86
      Align = alTop
      Alignment = taCenter
      Caption = 'Login'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -64
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 158
    end
    object edt_nome_login: TEdit
      Left = 480
      Top = 232
      Width = 193
      Height = 23
      TabOrder = 1
      TextHint = 'Insira seu usu'#225'rio'
    end
    object edt_senha_login: TEdit
      Left = 480
      Top = 320
      Width = 193
      Height = 23
      TabOrder = 2
      TextHint = 'Insira sua senha'
    end
    object btn_login: TButton
      Left = 536
      Top = 392
      Width = 75
      Height = 25
      Caption = 'btn_login'
      TabOrder = 0
      OnClick = btn_loginClick
    end
  end
end
