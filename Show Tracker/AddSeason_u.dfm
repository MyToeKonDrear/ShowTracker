object frmAddSeason: TfrmAddSeason
  Left = 0
  Top = 0
  Caption = 'frmAddSeason'
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
  object lblName: TLabel
    Left = 264
    Top = 32
    Width = 37
    Height = 13
    Caption = 'lblName'
  end
  object lblSeasons: TLabel
    Left = 274
    Top = 136
    Width = 50
    Height = 13
    Caption = 'lblSeasons'
  end
  object lblDate: TLabel
    Left = 312
    Top = 160
    Width = 33
    Height = 13
    Caption = 'lblDate'
  end
  object imgLogo: TImage
    Left = 272
    Top = 120
    Width = 105
    Height = 105
  end
  object imgExit: TImage
    Left = 280
    Top = 128
    Width = 105
    Height = 105
    OnClick = imgExitClick
    OnMouseEnter = imgExitMouseEnter
    OnMouseLeave = imgExitMouseLeave
  end
  object imgHome: TImage
    Left = 288
    Top = 136
    Width = 105
    Height = 105
    OnClick = imgHomeClick
    OnMouseEnter = imgHomeMouseEnter
    OnMouseLeave = imgHomeMouseLeave
  end
  object imgBryn: TImage
    Left = 296
    Top = 144
    Width = 105
    Height = 105
  end
  object spnSeasons: TSpinEdit
    Left = 184
    Top = 192
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 0
    Value = 0
  end
  object pnlEnter: TPanel
    Left = 264
    Top = 240
    Width = 185
    Height = 41
    Caption = 'pnlEnter'
    TabOrder = 1
    OnClick = pnlEnterClick
    OnMouseEnter = pnlEnterMouseEnter
    OnMouseLeave = pnlEnterMouseLeave
  end
  object dtpDate: TDatePicker
    Left = 400
    Top = 117
    Date = 44818.000000000000000000
    DateFormat = 'yyyy/MM/dd'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 2
  end
end
