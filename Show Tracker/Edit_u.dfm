object frmEdit: TfrmEdit
  Left = 0
  Top = 0
  Caption = 'frmEdit'
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
  object lblTimesWatched: TLabel
    Left = 8
    Top = 88
    Width = 80
    Height = 13
    Caption = 'lblTimesWatched'
  end
  object lblSeasons: TLabel
    Left = 8
    Top = 181
    Width = 50
    Height = 13
    Caption = 'lblSeasons'
  end
  object lblChoice: TLabel
    Left = 312
    Top = 160
    Width = 42
    Height = 13
    Caption = 'lblChoice'
  end
  object edtShowName: TEdit
    Left = 8
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edtShowName'
  end
  object spnTimesWatched: TSpinEdit
    Left = 8
    Top = 117
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 1
    Value = 0
  end
  object spnSeasons: TSpinEdit
    Left = 8
    Top = 200
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 2
    Value = 0
  end
  object pnlEnter: TPanel
    Left = 152
    Top = 200
    Width = 185
    Height = 41
    Caption = 'pnlEnter'
    TabOrder = 3
  end
  object pnlSeasons: TPanel
    Left = 232
    Top = 153
    Width = 185
    Height = 41
    Caption = 'pnlSeasons'
    TabOrder = 4
    OnClick = pnlSeasonsClick
  end
  object pnlTimesWatched: TPanel
    Left = 312
    Top = 74
    Width = 185
    Height = 41
    Caption = 'pnlTimesWatched'
    TabOrder = 5
    OnClick = pnlTimesWatchedClick
  end
end
