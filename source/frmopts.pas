{******************************************************************}
{                                                                  }
{  Itia Hydrognomon                                                }
{                                                                  }
{  Copyright (c) 2000-09 National Technical University of Athens   }
{                                                                  }
{******************************************************************}

unit frmopts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Buttons;

type
  TFrmOptions = class(TForm)
    BtnOK: TButton;
    BtnCancel: TButton;
    chkExitConfirmation: TCheckBox;
    lblRestart: TLabel;
    lboLocales: TListBox;
    lblSetHydrognomonLocale: TLabel;
    chkShowSplash: TCheckBox;
    btnRegisterFileType: TButton;
    lblRegisterFile: TLabel;
    Bevel1: TBevel;
    chkCheckForNewVersions: TCheckBox;
    cmbTimezones: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    cmbHydrologicalYear: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure SetControlStatus;
    procedure btnRegisterFileTypeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbTimezonesChange(Sender: TObject);
    procedure cmbHydrologicalYearChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses AppOpts, GenUtils, Math, ilocales, itzones, genopts;

{$R *.DFM}

procedure TFrmOptions.btnRegisterFileTypeClick(Sender: TObject);
begin
  RegisterFileType(HydrognomonExtension, TimeseriesContentType,
    HydrognomonFileType, ParamStr(0), rsFileDescription);
  ApplicationOptions.CheckExtension := True;
  ApplicationOptions.CheckFileOpener := True;
end;

procedure TFrmOptions.cmbHydrologicalYearChange(Sender: TObject);
begin
  ApplicationOptions.DefaultHydrologicalYearOrigin :=
    (Sender as TComboBox).ItemIndex+1;
end;

procedure TFrmOptions.cmbTimezonesChange(Sender: TObject);
var
  s: string;
begin
  s := RemoveTZDescr((Sender as TComboBox).Text);
  if s<>'' then
    ApplicationOptions.DefaultTimeZone := s else
    ApplicationOptions.DefaultTimeZone := (Sender as TComboBox).Text;
end;

function AddPlusSign(AValue: Real): string;
begin
  Result := Format('%.4d', [Round(AValue*100)]);
  if AValue>=0 then
    Result := '+'+Result;
end;

procedure TFrmOptions.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to Length(TimeZonesArray)-1 do
    with TimeZonesArray[i] do
      cmbTimeZones.Items.Add(Abbrev+' (UTC'+ AddPlusSign(Offset) +') '+ Descr);
  for i := 1 to 12 do
    cmbHydrologicalYear.Items.Add(SysUtils.LongMonthNames[i]);
end;

procedure TFrmOptions.FormShow(Sender: TObject);

  procedure SetTimeZoneCombo;
  var
    i,j: Integer;
  begin
    j := -1;
    for i := 0 to cmbTimeZones.Items.Count-1 do
    begin
      if StrPos(PChar(cmbTimeZones.Items[i]),
        PChar(ApplicationOptions.DefaultTimeZone))<>nil then
      begin
        j := i;
        Break;
      end;
    end;
    if j>-1 then cmbTimeZones.ItemIndex := j else
    cmbTimeZones.Text := ApplicationOptions.DefaultTimeZone;
  end;

begin
  ApplicationOptions.LoadFromRegistry;
  chkExitConfirmation.Checked := ApplicationOptions.ExitConfirmation;
  chkShowSplash.Checked := ApplicationOptions.ShowSplashOnStartup;
  chkCheckForNewVersions.Checked :=
    ApplicationOptions.CheckForNewVersionsOnStartup;
  if ApplicationOptions.LocaleSpec = '' then
    lboLocales.ItemIndex := 0
  else if ApplicationOptions.LocaleSpec = 'ENU' then
    lboLocales.ItemIndex := 1
  else if ApplicationOptions.LocaleSpec = 'ELL' then
    lboLocales.ItemIndex := 2;
  SetTimeZoneCombo;
  cmbHydrologicalYear.ItemIndex :=
    ApplicationOptions.DefaultHydrologicalYearOrigin - 1;
  SetControlStatus;
end;

procedure TFrmOptions.BtnOKClick(Sender: TObject);
begin
  case lboLocales.ItemIndex of
    0: ApplicationOptions.LocaleSpec := '';
    1: ApplicationOptions.LocaleSpec := 'ENU';
    2: ApplicationOptions.LocaleSpec := 'ELL';
  else
    Assert(False);
  end;
  with ApplicationOptions do
  begin
    ExitConfirmation := chkExitConfirmation.Checked;
    ShowSplashOnStartup := chkShowSplash.Checked;
    CheckForNewVersionsOnStartup := chkCheckForNewVersions.Checked;
  end;
  ApplicationOptions.WriteToRegistry;
  ModalResult := mrOk;
end;

procedure TFrmOptions.SetControlStatus;
begin
//Nothing...
end;

end.
