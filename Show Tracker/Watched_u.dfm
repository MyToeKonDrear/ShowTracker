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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object imgBryn: TImage
    Left = 344
    Top = 200
    Width = 105
    Height = 105
  end
  object imgHome: TImage
    Left = 352
    Top = 208
    Width = 105
    Height = 105
    OnClick = imgHomeClick
    OnMouseEnter = imgHomeMouseEnter
    OnMouseLeave = imgHomeMouseLeave
  end
  object imgExit: TImage
    Left = 360
    Top = 216
    Width = 105
    Height = 105
    OnClick = imgExitClick
    OnMouseEnter = imgExitMouseEnter
    OnMouseLeave = imgExitMouseLeave
  end
  object imgLogo: TImage
    Left = 368
    Top = 224
    Width = 105
    Height = 105
  end
  object stgWatched: TStringGrid
    Left = 240
    Top = 192
    Width = 320
    Height = 120
    Color = clBlack
    FixedColor = clBlack
    GradientEndColor = clBlack
    GradientStartColor = clBlack
    TabOrder = 0
    OnDblClick = stgWatchedDblClick
    OnDrawCell = stgWatchedDrawCell
  end
end
