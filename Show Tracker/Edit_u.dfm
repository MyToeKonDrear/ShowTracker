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
  object lblDate: TLabel
    Left = 320
    Top = 168
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
  object imgHome: TImage
    Left = 280
    Top = 128
    Width = 105
    Height = 105
    OnClick = imgHomeClick
    OnMouseEnter = imgHomeMouseEnter
    OnMouseLeave = imgHomeMouseLeave
  end
  object imgExit: TImage
    Left = 288
    Top = 136
    Width = 105
    Height = 105
    OnClick = imgExitClick
    OnMouseEnter = imgExitMouseEnter
    OnMouseLeave = imgExitMouseLeave
  end
  object imgBryn: TImage
    Left = 296
    Top = 144
    Width = 105
    Height = 105
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
    OnClick = pnlEnterClick
    OnMouseEnter = pnlEnterMouseEnter
    OnMouseLeave = pnlEnterMouseLeave
  end
  object dtpDate: TDatePicker
    Left = 464
    Top = 180
    Date = 44817.000000000000000000
    DateFormat = 'yyyy/MM/dd'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 4
  end
end
