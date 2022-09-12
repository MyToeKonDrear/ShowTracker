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
  object btnAddWatched: TButton
    Left = 280
    Top = 152
    Width = 75
    Height = 25
    Caption = 'btnAddWatched'
    TabOrder = 0
    OnClick = btnAddWatchedClick
  end
  object btnWatched: TButton
    Left = 280
    Top = 232
    Width = 75
    Height = 25
    Caption = 'btnWatched'
    TabOrder = 1
    OnClick = btnWatchedClick
  end
  object btnDelete: TButton
    Left = 280
    Top = 280
    Width = 75
    Height = 25
    Caption = 'btnDelete'
    TabOrder = 2
    OnClick = btnDeleteClick
  end
end
