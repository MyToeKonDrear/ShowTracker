object frmDelete: TfrmDelete
  Left = 0
  Top = 0
  Caption = 'frmDelete'
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
  object lblSelect: TLabel
    Left = 56
    Top = 24
    Width = 39
    Height = 13
    Caption = 'lblSelect'
  end
  object lblSearch: TLabel
    Left = 56
    Top = 128
    Width = 43
    Height = 13
    Caption = 'lblSearch'
  end
  object lblDelete: TLabel
    Left = 312
    Top = 160
    Width = 41
    Height = 13
    Caption = 'lblDelete'
  end
  object lblTimesWatched: TLabel
    Left = 320
    Top = 168
    Width = 80
    Height = 13
    Caption = 'lblTimesWatched'
  end
  object lblSeasons: TLabel
    Left = 328
    Top = 176
    Width = 50
    Height = 13
    Caption = 'lblSeasons'
  end
  object lblName: TLabel
    Left = 336
    Top = 184
    Width = 37
    Height = 13
    Caption = 'lblName'
  end
  object cmbShowNames: TComboBox
    Left = 56
    Top = 56
    Width = 145
    Height = 21
    TabOrder = 0
    Text = 'cmbShowNames'
    OnClick = cmbShowNamesClick
  end
  object edtSearch: TEdit
    Left = 56
    Top = 160
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'edtSearch'
    OnClick = edtSearchClick
  end
  object pnlDelete: TPanel
    Left = 256
    Top = 224
    Width = 185
    Height = 41
    Caption = 'pnlDelete'
    TabOrder = 2
    OnClick = pnlDeleteClick
  end
  object pnlSearch: TPanel
    Left = 256
    Top = 88
    Width = 185
    Height = 41
    Caption = 'pnlSearch'
    TabOrder = 3
    OnClick = pnlSearchClick
  end
  object cmbTimesWatched: TComboBox
    Left = 296
    Top = 157
    Width = 145
    Height = 21
    TabOrder = 4
    Text = 'cmbTimesWatched'
    OnClick = cmbTimesWatchedClick
  end
  object cmbSeasons: TComboBox
    Left = 177
    Top = 184
    Width = 145
    Height = 21
    TabOrder = 5
    Text = 'cmbSeasons'
    OnClick = cmbSeasonsClick
  end
end
