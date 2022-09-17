object frmShowDetails: TfrmShowDetails
  Left = 0
  Top = 0
  Caption = 'frmShowDetails'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblShowName: TLabel
    Left = 312
    Top = 160
    Width = 63
    Height = 13
    Alignment = taCenter
    Caption = 'lblShowName'
  end
  object lblSeasons: TLabel
    Left = 320
    Top = 168
    Width = 50
    Height = 13
    Caption = 'lblSeasons'
  end
  object lblTimesWatched: TLabel
    Left = 328
    Top = 176
    Width = 80
    Height = 13
    Caption = 'lblTimesWatched'
  end
  object bvlDetailsBorder: TBevel
    Left = 408
    Top = 24
    Width = 50
    Height = 50
  end
  object lblDateCompleted: TLabel
    Left = 336
    Top = 184
    Width = 84
    Height = 13
    Caption = 'lblDateCompleted'
  end
  object lblSeasons2: TLabel
    Left = 344
    Top = 192
    Width = 56
    Height = 13
    Caption = 'lblSeasons2'
  end
  object lblDateCompleted2: TLabel
    Left = 352
    Top = 200
    Width = 90
    Height = 13
    Caption = 'lblDateCompleted2'
  end
  object lblTimesWatched2: TLabel
    Left = 360
    Top = 208
    Width = 86
    Height = 13
    Caption = 'lblTimesWatched2'
  end
  object pnlEdit: TPanel
    Left = 128
    Top = 97
    Width = 185
    Height = 41
    Caption = 'pnlEdit'
    TabOrder = 0
    OnClick = pnlEditClick
  end
  object pnlAddSeason: TPanel
    Left = 104
    Top = 186
    Width = 185
    Height = 41
    Caption = 'pnlAddSeason'
    TabOrder = 1
    OnClick = pnlAddSeasonClick
  end
  object redSeasons: TRichEdit
    Left = 257
    Top = 195
    Width = 185
    Height = 89
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'redSeasons')
    ParentFont = False
    TabOrder = 2
    Zoom = 100
  end
  object pnlTimesWatched: TPanel
    Left = 464
    Top = 243
    Width = 185
    Height = 41
    Caption = 'pnlTimesWatched'
    TabOrder = 3
    OnClick = pnlTimesWatchedClick
  end
end
