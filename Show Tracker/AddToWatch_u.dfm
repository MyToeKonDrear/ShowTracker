object frmAddToWatch: TfrmAddToWatch
  Left = 0
  Top = 0
  Caption = 'frmAddToWatch'
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
  PixelsPerInch = 96
  TextHeight = 13
  object imgLogo: TImage
    Left = 328
    Top = 32
    Width = 105
    Height = 105
  end
  object imgBryn: TImage
    Left = 336
    Top = 40
    Width = 105
    Height = 105
  end
  object imgExit: TImage
    Left = 344
    Top = 48
    Width = 105
    Height = 105
    OnClick = imgExitClick
    OnMouseEnter = imgExitMouseEnter
    OnMouseLeave = imgExitMouseLeave
  end
  object imgHome: TImage
    Left = 352
    Top = 72
    Width = 105
    Height = 105
    OnClick = imgHomeClick
    OnMouseEnter = imgHomeMouseEnter
    OnMouseLeave = imgHomeMouseLeave
  end
  object edtName: TEdit
    Left = 184
    Top = 132
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edtName'
  end
  object pnlEnter: TPanel
    Left = 216
    Top = 216
    Width = 185
    Height = 41
    Caption = 'pnlEnter'
    TabOrder = 1
    OnClick = pnlEnterClick
  end
end
