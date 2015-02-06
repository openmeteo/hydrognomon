{******************************************************************}
{                                                                  }
{  Itia Hydrognomon                                                }
{                                                                  }
{  Copyright (c) 2000-09 National Technical University of Athens   }
{                                                                  }
{******************************************************************}

unit chknewver;

interface

uses Classes, SysUtils, AppOpts, IdHTTP;

type
  TCheckThread = class(TTHread)
    private
      FHTTPClient: TIdHTTP;
      FApplicationOptions: TApplicationOptions;
      FVersion: string;
      FHTTPGet: string;
      FRaiseOnFail, FHasRaised: Boolean;
      FException: Exception;
      function ConnectToUpdateSite(AVersion: string; RaiseOnFail: Boolean):
        Boolean;
      procedure PromptToDownloadNewVersion;
      procedure ShowIsUpToDate;
      procedure DoHandleException;
      procedure HTTPGet;
    protected
      procedure Execute; override;
      procedure HandleException; virtual;
    public
      constructor Create(AApplicationOptions: TApplicationOptions;
        AVersion: string; RaiseOnFail: Boolean);
      destructor Destroy; override;
  end;

implementation

uses Dialogs, ShellApi, Windows, Controls, istrUtils, Messages, Forms, Genutils;

constructor TCheckThread.Create(AApplicationOptions: TApplicationOptions;
        AVersion: string; RaiseOnFail: Boolean);
begin
  inherited Create(True);
  FRaiseOnFail := RaiseOnFail;
  FVersion := AVersion;
  FApplicationOptions := AApplicationOptions;
  FHTTPClient := TIdHTTP.Create(nil);
  FHTTPClient.Request.UserAgent := 'Hydrognomon/4.0 (windows; N; en-US; rv:'+
    genutils.GetFileVersionStr(ParamStr(0), ver4Items)+')';
  FHTTPClient.Request.Pragma := 'no-cache';
  FreeOnTerminate := True;
end;

destructor TCheckThread.Destroy;
begin
  if Assigned(FHTTPClient) then FHTTPClient.Free;
  inherited Destroy;
end;

resourcestring
  rsUpdateProblem = 'An error occured during checking for new versions. '+
    'If the problem perists please contact with itia. Error message: ';
  rsNewVersionFound =
    'New updated version (%s) is available for download.'+#13#10+
    'Go to download site to obtain new version?' ;
  rsUpToDate = 'Hydrognomon is Up to Date (no new versions found)';

procedure TCheckThread.PromptToDownloadNewVersion;
var
  s: string;
begin
  s := Format(rsNewVersionFound, [ApplicationOptions.UpdatedVersion]);
  if MessageDlg(s, mtInformation, mbYesNo, 0, mbYes) = mrYes then
    ShellExecute(0, 'open', PChar(ApplicationOptions.DownloadSite), nil, nil,
      SW_SHOWNORMAL)
end;

procedure TCheckThread.ShowIsUpToDate;
begin
  ShowMessage(rsUpToDate);
end;

procedure TCheckThread.Execute;
begin
  if ConnectToUpdateSite(FVersion, FRaiseOnFail) then
    Synchronize(PromptToDownloadNewVersion)
  else
    if (FRaiseOnFail) and (not FHasRaised) then
      Synchronize(ShowIsUpToDate);
end;

function TCheckThread.ConnectToUpdateSite(AVersion: string;
  RaiseOnFail: Boolean): Boolean;
var
  s: string;
  ANewUpdateSite, ANewDownloadSite, ANewVersion: string;
begin
  Result := False;
  FHasRaised := False;
  try
    with ApplicationOptions do
    begin
      HTTPGet;
      s := FHTTPGet;
      ANewVersion := DelimitedStringItem(s, 1, ',');
      ANewUpdateSite := DelimitedStringItem(s, 2, ',');
      ANewDownloadSite := DelimitedStringItem(s, 3, ',');
      Result := VersionComp(ANewVersion, AVersion)>0;
      UpdatedVersion := ANewVersion;
      UpdateSite := ANewUpdateSite;
      DownloadSite := ANewDownloadSite;
    end;
  except
    on E:Exception do
    begin
      FHasRaised := True;
      E.Message := rsUpdateProblem + E.Message;
      if RaiseOnFail then HandleException;
    end;
  end;
end;

procedure TCheckThread.HTTPGet;
begin
  with ApplicationOptions do
    FHTTPGet := FHTTPClient.Get(UpdateSite);
end;

procedure TCheckThread.DoHandleException;
begin
  // Cancel the mouse capture
  if GetCapture <> 0 then SendMessage(GetCapture, WM_CANCELMODE, 0, 0);
  // Now actually show the exception
  if FException is Exception then
    Application.ShowException(FException)
  else
    SysUtils.ShowException(FException, nil);
end;

procedure TCheckThread.HandleException;
begin
  // This function is virtual so you can override it
  // and add your own functionality.
  FException := Exception(ExceptObject);
  try
    // Don't show EAbort messages
    if not (FException is EAbort) then
      Synchronize(DoHandleException);
  finally
    FException := nil;
  end;
end;

end.
