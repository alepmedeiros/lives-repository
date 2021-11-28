object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 234
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Endereco'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 89
    Top = 8
    Width = 289
    Height = 218
    TabOrder = 1
  end
  object Button2: TButton
    Left = 8
    Top = 71
    Width = 75
    Height = 25
    Caption = 'Telefone'
    TabOrder = 2
  end
  object Button3: TButton
    Left = 8
    Top = 9
    Width = 75
    Height = 25
    Caption = 'Pessoa'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 201
    Width = 75
    Height = 25
    Caption = 'Builder'
    TabOrder = 4
    OnClick = Button4Click
  end
end
