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
    Left = 264
    Top = 192
    Width = 185
    Height = 41
    Caption = 'pnlDelete'
    TabOrder = 2
    OnClick = pnlDeleteClick
  end
end
