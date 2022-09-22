object frmToWatch: TfrmToWatch
  Left = 0
  Top = 0
  Caption = 'frmToWatch'
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
    Left = 263
    Top = 72
    Width = 105
    Height = 105
    OnClick = imgHomeClick
    OnMouseEnter = imgHomeMouseEnter
    OnMouseLeave = imgHomeMouseLeave
  end
  object imgExit: TImage
    Left = 200
    Top = 32
    Width = 105
    Height = 105
    OnClick = imgExitClick
    OnMouseEnter = imgExitMouseEnter
    OnMouseLeave = imgExitMouseLeave
  end
  object imgBryn: TImage
    Left = 336
    Top = 48
    Width = 105
    Height = 105
  end
  object imgLogo: TImage
    Left = 447
    Top = 48
    Width = 105
    Height = 105
  end
  object redToWatch: TRichEdit
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
      'redToWatch')
    ParentFont = False
    TabOrder = 0
    Zoom = 100
  end
  object pnlAdd: TPanel
    Left = 64
    Top = 192
    Width = 185
    Height = 41
    Caption = 'pnlAdd'
    TabOrder = 1
    OnClick = pnlAddClick
  end
  object pnlDelete: TPanel
    Left = 8
    Top = 8
    Width = 185
    Height = 41
    Caption = 'pnlDelete'
    TabOrder = 2
    OnClick = pnlDeleteClick
  end
  object pnlRandom: TPanel
    Left = 16
    Top = 72
    Width = 185
    Height = 33
    Caption = 'pnlRandom'
    TabOrder = 3
    OnClick = pnlRandomClick
  end
  object cmbDelete: TComboBox
    Left = 336
    Top = 235
    Width = 145
    Height = 21
    TabOrder = 4
    Text = 'cmbDelete'
    OnClick = cmbDeleteClick
  end
end
