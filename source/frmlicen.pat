object FrmLicenseDialog: TFrmLicenseDialog
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'License'
  ClientHeight = 425
  ClientWidth = 449
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btnOK: TButton
    Left = 186
    Top = 391
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
  end
  object memoLicense: TMemo
    Left = 7
    Top = 8
    Width = 433
    Height = 377
    Lines.Strings = (
'licensesubstr'
    )
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
end
