object frmTracker: TfrmTracker
  Left = 0
  Top = 0
  Caption = 'frmTracker'
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
  object imgHome: TImage
    Left = 272
    Top = 120
    Width = 105
    Height = 105
    OnClick = imgHomeClick
    OnMouseEnter = imgHomeMouseEnter
    OnMouseLeave = imgHomeMouseLeave
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
  object imgBryn: TImage
    Left = 305
    Top = 136
    Width = 105
    Height = 105
  end
  object imgLogo: TImage
    Left = 416
    Top = 136
    Width = 105
    Height = 105
  end
  object imgLeft: TImage
    Left = 512
    Top = 200
    Width = 105
    Height = 105
  end
  object imgRight: TImage
    Left = 288
    Top = 136
    Width = 105
    Height = 105
  end
  object pnlInc: TPanel
    Left = 49
    Top = 64
    Width = 185
    Height = 41
    Caption = 'pnlInc'
    TabOrder = 0
    OnClick = pnlIncClick
  end
  object pnlDec: TPanel
    Left = 49
    Top = 200
    Width = 185
    Height = 41
    Caption = 'pnlDec'
    TabOrder = 1
    OnClick = pnlDecClick
  end
  object pnlReset: TPanel
    Left = 49
    Top = 136
    Width = 185
    Height = 41
    Caption = 'pnlReset'
    TabOrder = 2
    OnClick = pnlResetClick
  end
end
