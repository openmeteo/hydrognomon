{******************************************************************}
{                                                                  }
{  Itia Hydrognomon                                                }
{                                                                  }
{  Copyright (c) 2000-09 National Technical University of Athens   }
{                                                                  }
{******************************************************************}

program hydrognomon;

uses
  Forms,
  Windows,
  Dialogs,
  htmlhelpviewer,
  frmtsgrid in 'frmtsgrid.pas' {FrmTimeseriesGrid},
  AppOpts in 'AppOpts.pas',
  frmsplash in 'frmsplash.pas' {FrmSplashScreen},
  frmopts in 'frmopts.pas' {FrmOptions},
  frmlicen in 'frmlicen.pas' {FrmLicenseDialog},
  UStartup in 'UStartup.pas',
  chknewver in 'chknewver.pas';

{$R *.res}

function CanStart: Boolean;
var
  Wdw: HWND;
begin
  Wdw := FindDuplicateMainWdw;
  if Wdw = 0 then
    Result := True
  else
    Result := not SwitchToPrevInst(Wdw);
end;

begin
  if CanStart then
  begin
    Application.Initialize;
    Application.Title := 'Hydrognomon';
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TFrmTimeseriesGrid, FrmTimeseriesGrid);
  Application.CreateForm(TFrmLicenseDialog, FrmLicenseDialog);
  Application.HintHidePause := 60000;
    Application.Run;
  end;
end.
