object frmHome: TfrmHome
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'frmHome'
  ClientHeight = 572
  ClientWidth = 968
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
  object imgExit: TImage
    Left = 280
    Top = 368
    Width = 105
    Height = 105
    OnClick = imgExitClick
    OnMouseEnter = imgExitMouseEnter
    OnMouseLeave = imgExitMouseLeave
  end
  object imgHome: TImage
    Left = 640
    Top = 400
    Width = 105
    Height = 105
    OnMouseEnter = imgHomeMouseEnter
    OnMouseLeave = imgHomeMouseLeave
  end
  object imgLogo: TImage
    Left = 456
    Top = 384
    Width = 105
    Height = 105
  end
  object imgBryn: TImage
    Left = 408
    Top = 168
    Width = 105
    Height = 105
  end
  object pnlAddWatched: TPanel
    Left = 512
    Top = 176
    Width = 185
    Height = 41
    Caption = 'pnlAddWatched'
    TabOrder = 0
    OnClick = pnlAddWatchedClick
    OnMouseEnter = pnlAddWatchedMouseEnter
    OnMouseLeave = pnlAddWatchedMouseLeave
  end
  object pnlWatched: TPanel
    Left = 432
    Top = 280
    Width = 185
    Height = 41
    Caption = 'pnlWatched'
    TabOrder = 1
    OnClick = pnlWatchedClick
    OnMouseEnter = pnlWatchedMouseEnter
    OnMouseLeave = pnlWatchedMouseLeave
  end
  object pnlDelete: TPanel
    Left = 488
    Top = 319
    Width = 185
    Height = 41
    Caption = 'pnlDelete'
    TabOrder = 2
    OnClick = pnlDeleteClick
    OnMouseEnter = pnlDeleteMouseEnter
    OnMouseLeave = pnlDeleteMouseLeave
  end
  object pnlTracker: TPanel
    Left = 176
    Top = 280
    Width = 185
    Height = 41
    Caption = 'pnlTracker'
    TabOrder = 3
    OnClick = pnlTrackerClick
    OnMouseEnter = pnlTrackerMouseEnter
    OnMouseLeave = pnlTrackerMouseLeave
  end
  object pnlToWatch: TPanel
    Left = 200
    Top = 120
    Width = 185
    Height = 41
    Caption = 'pnlToWatch'
    TabOrder = 4
    OnClick = pnlToWatchClick
    OnMouseEnter = pnlToWatchMouseEnter
    OnMouseLeave = pnlToWatchMouseLeave
  end
  object pnlStats: TPanel
    Left = 112
    Top = 400
    Width = 185
    Height = 41
    Caption = 'pnlStats'
    TabOrder = 5
    OnClick = pnlStatsClick
    OnMouseEnter = pnlStatsMouseEnter
    OnMouseLeave = pnlStatsMouseLeave
  end
end
