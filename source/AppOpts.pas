{******************************************************************}
{                                                                  }
{  Itia Hydrognomon                                                }
{                                                                  }
{  Copyright (c) 2000-09 National Technical University of Athens   }
{                                                                  }
{******************************************************************}

unit AppOpts;

interface

uses GenUtils, genopts;

const
  HydrognomonExtension = 'hts';
  HydrognomonFileType = 'Hydrognomon.hts';
  TimeseriesContentType = 'text/vnd.openmeteo.timeseries';

resourcestring
  rsFileDescription = 'Hydrognomon time series file';

type
  TApplicationOptions = class(TGenApplicationOptions)
  private
    FIsMaximized: Boolean;
    FExitConfirmation: Boolean;
    FShowSplashOnStartup: Boolean;
    FFormLeft, FFormTop, FFormHeight, FFormWidth: Integer;
    FLocaleSpec: string;
    FCheckExtension: Boolean;
    FCheckFileOpener: Boolean;
    FCheckForNewVersionsOnStartup: Boolean;
    FDefaultHydrologicalYearOrigin: Integer;
    FUpdatedVersion: string;
    FUpdateSite: string;
    FDownloadSite: string;
    FDefaultTimeZone: string;
    FAppDataFolder: string;
    FAppDataSeriesTemplatesFolder: string;
  public
    MRUList: array[0..5] of string;
    property ExitConfirmation: Boolean read FExitConfirmation
      write FExitConfirmation;
    property LocaleSpec: string read FLocaleSpec write FLocaleSpec;
    property FormLeft: Integer read FFormLeft write FFormLeft;
    property FormTop: Integer read FFormTop write FFormTop;
    property FormWidth: Integer read FFormWidth write FFormWidth;
    property FormHeight: Integer read FFormHeight write FFormHeight;
    property IsMaximized: Boolean read FIsMaximized write FIsMaximized;
    property ShowSplashOnStartup: Boolean read FShowSplashOnStartup
      write FShowSplashOnStartup;
    property CheckExtension: Boolean read FCheckExtension write
      FCheckExtension;
    property CheckFileOpener: Boolean read FCheckFileOpener write
      FCheckFileOpener;
    property CheckForNewVersionsOnStartup: Boolean read
      FCheckForNewVersionsOnStartup write FCheckForNewVersionsOnStartup;
    property UpdatedVersion: string read FUpdatedVersion write
      FUpdatedVersion;
    property UpdateSite: string read FUpdateSite write FUpdateSite;
    property DownloadSite: string read FDownloadSite write FDownloadSite;
    property DefaultTimeZone: string read FDefaultTimeZone
      write FDefaultTimeZone;
    property DefaultHydrologicalYearOrigin: Integer read
      FDefaultHydrologicalYearOrigin write FDefaultHydrologicalYearOrigin;
    property AppDataFolder: string read FAppDataFolder write
      FAppDataFolder;
    property AppDataSeriesTemplatesFolder: string
      read FAppDataSeriesTemplatesFolder write FAppDataSeriesTemplatesFolder;
    constructor Create; override;
    destructor Destroy; override;
    procedure LoadFromRegistry; override;
    procedure WriteToRegistry; override;
  end;

var
  ApplicationOptions: TApplicationOptions;

implementation

{$ASSERTIONS ON}

uses Registry, iStrUtils, SysUtils, Windows, Math, shlobj, itzones;

constructor TApplicationOptions.Create;
var
  i: Integer;
  TimeZone: TTimeZoneInformation;
begin
  inherited Create;
  GetTimeZoneInformation(TimeZone);
  FExitConfirmation := True;
  FLocaleSpec := '';
  FFormLeft := -1;
  FFormTop := -1;
  FFormWidth := -1;
  FFormHeight := -1;
  FShowSplashOnStartup := True;
  FIsMaximized := False;
  FCheckExtension := True;
  FCheckFileOpener := True;
  FCheckForNewVersionsOnStartup := True;
  FDefaultHydrologicalYearOrigin := 10;
  FUpdatedVersion := '';
  FUpdateSite := 'http://update.hydrognomon.org/updated_version';
  FDownloadSite := '';
  FDefaultTimeZone := PickATZ(-TimeZone.Bias-TimeZone.StandardBias);
  FAppDataFolder := GetSpecialFolderPath(CSIDL_APPDATA)+
    '\Itia\Hydrognomon4\';
  FAppDataSeriesTemplatesFolder := FAppDataFolder + 'SeriesTemplates\';
  for i := 0 to Length(MRUList)-1 do MRUList[i] := '';
end;

destructor TApplicationOptions.Destroy;
begin
  inherited Destroy;
end;

procedure TApplicationOptions.LoadFromRegistry;
var
  Registry: TRegistry;
  RootKeys: array[1..2] of HKEY;
  i, j: Integer;
  SavedDecimalSeparator: Char;

  function UnquoteText(s: string): string;
  begin
    if Length(s)<2 then
      Result := s else
      Result := Copy(s, 2, Length(s)-2);
  end;

begin
  inherited LoadFromRegistry;
  RootKeys[1] := HKEY_LOCAL_MACHINE;
  RootKeys[2] := HKEY_CURRENT_USER;
  FExitConfirmation := False;
  for j := 1 to 2 do
  begin
    Registry := nil;
    SavedDecimalSeparator := SysUtils.DecimalSeparator;
    try
      SysUtils.DecimalSeparator := '.';
      Registry := TRegistry.Create(KEY_READ);
      Registry.RootKey := RootKeys[j];
      if Registry.OpenKey('Software', False) then
        if Registry.OpenKey('Itia', False) then
          Registry.OpenKey('Hydrognomon4', False);
      if Registry.ValueExists('ExitConfirmation') then
        FExitConfirmation := Registry.ReadBool('ExitConfirmation');
      if Registry.ValueExists('FormLeft') then
        FFormLeft := Registry.ReadInteger('FormLeft');
      if Registry.ValueExists('FormTop') then
        FFormTop := Registry.ReadInteger('FormTop');
      if Registry.ValueExists('FormWidth') then
        FFormWidth := Registry.ReadInteger('FormWidth');
      if Registry.ValueExists('FormHeight') then
        FFormHeight := Registry.ReadInteger('FormHeight');
      if Registry.ValueExists('IsMaximized') then
        FIsMaximized := Registry.ReadBool('IsMaximized');
      if Registry.ValueExists('ShowSplashOnStartup') then
        FShowSplashOnStartup := Registry.ReadBool('ShowSplashOnStartup');
      if Registry.ValueExists('CheckExtension') then
        FCheckExtension := Registry.ReadBool('CheckExtension');
      if Registry.ValueExists('CheckFileOpener') then
        FCheckFileOpener := Registry.ReadBool('CheckFileOpener');
      if Registry.ValueExists('CheckForNewVersionsOnStartup') then
        FCheckForNewVersionsOnStartup :=
          Registry.ReadBool('CheckForNewVersionsOnStartup');
      if Registry.ValueExists('UpdatedVersion') then
        FUpdatedVersion := Registry.ReadString('UpdatedVersion');
      if Registry.ValueExists('UpdateSite') then
        FUpdateSite := Registry.ReadString('UpdateSite');
      if Registry.ValueExists('DefaultTimeZone') then
        FDefaultTimeZone := Registry.ReadString('DefaultTimeZone');
      if Registry.ValueExists('DefaultHydrologicalYearOrigin') then
        FDefaultHydrologicalYearOrigin :=
          Registry.ReadInteger('DefaultHydrologicalYearOrigin');
      for i := 0 to Length(MRUList)-1 do
        if Registry.ValueExists('MRUItem'+IntToStr(i)) then
          MRUList[i] := UnquoteText(Registry.ReadString('MRUItem'+IntToStr(i))) else
          MRUList[i] := '';
    finally
      Registry.Free;
      SysUtils.DecimalSeparator := SavedDecimalSeparator;
    end;
  end;
  Registry := nil;
  try
    Registry := TRegistry.Create(KEY_READ);
    if Registry.OpenKey('Software', False) then
      if Registry.OpenKey('Borland', False) then
        if Registry.OpenKey('Locales', False) then
          if Registry.ValueExists(ParamStr(0)) then
            FLocaleSpec := Registry.ReadString(ParamStr(0));
  finally
    Registry.Free;
  end;
end;

procedure TApplicationOptions.WriteToRegistry;
var
  Registry: TRegistry;
  SavedDecimalSeparator: Char;
  i: Integer;
begin
  inherited WriteToRegistry;
  SavedDecimalSeparator := Sysutils.DecimalSeparator;
  Registry := nil;
  try
    Sysutils.DecimalSeparator := '.';
    Registry := TRegistry.Create(KEY_ALL_ACCESS);
    Registry.RootKey := HKEY_CURRENT_USER;
    Assert(Registry.OpenKey('Software', True));
    Assert(Registry.OpenKey('Itia', True));
    Assert(Registry.OpenKey('Hydrognomon4', True));
    Registry.WriteBool('ExitConfirmation', ExitConfirmation);
    Registry.WriteInteger('FormLeft', FormLeft);
    Registry.WriteInteger('FormTop', FormTop);
    Registry.WriteInteger('FormWidth', FormWidth);
    Registry.WriteInteger('FormHeight', FormHeight);
    Registry.WriteBool('IsMaximized', IsMaximized);
    Registry.WriteBool('ShowSplashOnStartup', ShowSplashOnStartup);
    Registry.WriteBool('CheckExtension', CheckExtension);
    Registry.WriteBool('CheckFileOpener', CheckFileOpener);
    Registry.WriteBool('CheckForNewVersionsOnStartup',
      CheckForNewVersionsOnStartup);
    Registry.WriteString('UpdatedVersion', UpdatedVersion);
    Registry.WriteString('UpdateSite', UpdateSite);
    Registry.WriteString('DefaultTimeZone', FDefaultTimeZone);
    Registry.WriteInteger('DefaultHydrologicalYearOrigin',
      DefaultHydrologicalYearOrigin);
    for i := 0 to Length(MRUList)-1 do
      if MRUList[i]<>'' then
        Registry.WriteString('MRUItem'+IntToStr(i), '"'+MRUList[i]+'"')
      else
        Registry.WriteString('MRUItem'+IntToStr(i), '');
  finally
    Registry.Free;
    Sysutils.DecimalSeparator := SavedDecimalSeparator;
  end;
  Registry := nil;
  try
    Registry := TRegistry.Create(KEY_ALL_ACCESS);
    Assert(Registry.OpenKey('Software', True));
    Assert(Registry.OpenKey('Borland', True));
    Assert(Registry.OpenKey('Locales', True));
    Registry.WriteString(ParamStr(0), LocaleSpec);
  finally
    Registry.Free;
  end;
end;

initialization
  ApplicationOptions := TApplicationOptions.Create;

finalization
  ApplicationOptions.Free;

end.
