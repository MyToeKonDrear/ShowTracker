object frmWatched: TfrmWatched
  Left = 0
  Top = 0
  Caption = 'frmWatched'
  ClientHeight = 470
  ClientWidth = 782
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
  object redWatched: TRichEdit
    Left = -11
    Top = -11
    Width = 785
    Height = 473
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HideScrollBars = False
    Lines.Strings = (
      'redWatched')
    ParentFont = False
    TabOrder = 0
    Zoom = 100
  end
  object Button1: TButton
    Left = 296
    Top = 248
    Width = 113
    Height = 33
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
end
