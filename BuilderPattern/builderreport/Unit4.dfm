object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 623
  ClientWidth = 911
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 623
    Align = alLeft
    BevelOuter = bvNone
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 0
    object Button1: TButton
      Left = 5
      Top = 560
      Width = 175
      Height = 58
      Align = alBottom
      Caption = 'Gerar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 5
      Top = 5
      Width = 175
      Height = 21
      Align = alTop
      TabOrder = 1
      Text = 'Edit1'
    end
  end
  object Panel2: TPanel
    Left = 185
    Top = 0
    Width = 726
    Height = 623
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 1
    object WebBrowser1: TWebBrowser
      Left = 5
      Top = 5
      Width = 716
      Height = 613
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 440
      ExplicitTop = 152
      ExplicitWidth = 300
      ExplicitHeight = 150
      ControlData = {
        4C000000004A00005B3F00000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
end
