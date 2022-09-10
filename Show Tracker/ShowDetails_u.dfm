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
  object pnlEdit: TPanel
    Left = 128
    Top = 97
    Width = 185
    Height = 41
    Caption = 'pnlEdit'
    TabOrder = 0
  end
end
