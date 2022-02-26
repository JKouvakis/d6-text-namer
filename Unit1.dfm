object Form1: TForm1
  Left = 104
  Top = 194
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button2: TButton
    Left = 448
    Top = 344
    Width = 201
    Height = 49
    Caption = 'Name!!'
    TabOrder = 0
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 32
    Top = 352
    Width = 185
    Height = 57
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object ListBox1: TListBox
    Left = 24
    Top = 16
    Width = 225
    Height = 297
    ItemHeight = 13
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 280
    Top = 16
    Width = 377
    Height = 297
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object OpenDialog1: TOpenDialog
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 280
    Top = 328
  end
  object SaveDialog1: TSaveDialog
    Left = 312
    Top = 368
  end
end
