object frmAddWatched: TfrmAddWatched
  Left = 0
  Top = 0
  Caption = 'frmAddWatched'
  ClientHeight = 792
  ClientWidth = 1102
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
  object lblSeasons: TLabel
    Left = 128
    Top = 160
    Width = 50
    Height = 13
    Caption = 'lblSeasons'
  end
  object lblEpisodes: TLabel
    Left = 85
    Top = 304
    Width = 52
    Height = 13
    Caption = 'lblEpisodes'
  end
  object lblDateCompleted: TLabel
    Left = 96
    Top = 424
    Width = 84
    Height = 13
    Caption = 'lblDateCompleted'
  end
  object edtShowName: TEdit
    Left = 16
    Top = 12
    Width = 121
    Height = 21
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    TabOrder = 0
    Text = 'edtShowName'
    OnMouseEnter = edtShowNameMouseEnter
  end
  object spnSeasons: TSpinEdit
    Left = 16
    Top = 56
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 1
    Value = 0
  end
  object spnEpisodes: TSpinEdit
    Left = 16
    Top = 264
    Width = 121
    Height = 22
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    MaxValue = 0
    MinValue = 0
    TabOrder = 2
    Value = 0
  end
  object dpDateCompleted: TDatePicker
    Left = 8
    Top = 376
    Date = 44808.000000000000000000
    DateFormat = 'yyyy/MM/dd'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    StyleElements = []
    TabOrder = 3
  end
  object pnlEnter: TPanel
    Left = 16
    Top = 504
    Width = 185
    Height = 41
    Caption = 'pnlEnter'
    TabOrder = 4
    OnMouseEnter = pnlEnterMouseEnter
    OnMouseLeave = pnlEnterMouseLeave
  end
end
