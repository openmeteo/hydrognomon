object FrmOptions: TFrmOptions
  Left = 0
  Top = 0
  HelpContext = 1030
  BorderStyle = bsDialog
  Caption = 'Preferences'
  ClientHeight = 281
  ClientWidth = 361
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblRestart: TLabel
    Left = 8
    Top = 229
    Width = 313
    Height = 13
    Caption = '(A restart of hydrognomon ensures that changes will take effect)'
  end
  object lblSetHydrognomonLocale: TLabel
    Left = 8
    Top = 77
    Width = 189
    Height = 13
    Caption = 'Set Hydrognomon language (obsolete):'
  end
  object lblRegisterFile: TLabel
    Left = 225
    Top = 9
    Width = 109
    Height = 26
    Caption = 'Associate '#39'*.hts'#39' file type to Hydrognomon:'
    WordWrap = True
  end
  object Bevel1: TBevel
    Left = 215
    Top = 8
    Width = 3
    Height = 142
  end
  object Label1: TLabel
    Left = 8
    Top = 183
    Width = 88
    Height = 13
    Caption = 'Default time zone:'
  end
  object Label2: TLabel
    Left = 8
    Top = 164
    Width = 133
    Height = 13
    Caption = 'Hydrological year starts on:'
  end
  object BtnOK: TButton
    Left = 8
    Top = 248
    Width = 89
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 0
    OnClick = BtnOKClick
  end
  object BtnCancel: TButton
    Left = 225
    Top = 248
    Width = 81
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object chkExitConfirmation: TCheckBox
    Left = 8
    Top = 9
    Width = 223
    Height = 17
    Caption = 'Confirmation for exiting Hydrognomon'
    TabOrder = 2
  end
  object lboLocales: TListBox
    Left = 8
    Top = 96
    Width = 201
    Height = 54
    ItemHeight = 13
    Items.Strings = (
      'Default (System locale)'
      'US English (ENU)'
      'Greek (ELL)')
    TabOrder = 3
  end
  object chkShowSplash: TCheckBox
    Left = 8
    Top = 31
    Width = 185
    Height = 17
    Caption = 'Show splash screen on startup'
    TabOrder = 4
  end
  object btnRegisterFileType: TButton
    Left = 225
    Top = 42
    Width = 75
    Height = 25
    Caption = 'Register'
    TabOrder = 5
    OnClick = btnRegisterFileTypeClick
  end
  object chkCheckForNewVersions: TCheckBox
    Left = 8
    Top = 54
    Width = 185
    Height = 17
    Caption = 'Check for new versions on startup'
    TabOrder = 6
  end
  object cmbTimezones: TComboBox
    Left = 8
    Top = 202
    Width = 298
    Height = 21
    ItemHeight = 0
    TabOrder = 7
    OnChange = cmbTimezonesChange
  end
  object cmbHydrologicalYear: TComboBox
    Left = 161
    Top = 164
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 0
    TabOrder = 8
    OnChange = cmbHydrologicalYearChange
  end
end
