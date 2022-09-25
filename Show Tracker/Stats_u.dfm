object frmStats: TfrmStats
  Left = 0
  Top = 0
  Caption = 'frmStats'
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
    Left = 88
    Top = 104
    Width = 105
    Height = 105
    OnClick = imgExitClick
    OnMouseEnter = imgExitMouseEnter
    OnMouseLeave = imgExitMouseLeave
  end
  object imgBryn: TImage
    Left = 440
    Top = 128
    Width = 105
    Height = 105
  end
  object redStats: TRichEdit
    Left = 232
    Top = 128
    Width = 185
    Height = 89
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'redStats')
    ParentFont = False
    TabOrder = 0
    Zoom = 100
  end
end
