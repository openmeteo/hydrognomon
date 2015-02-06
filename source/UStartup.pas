{******************************************************************}
{                                                                  }
{  Itia Hydrognomon                                                }
{                                                                  }
{  Copyright (c) 2000-09 National Technical University of Athens   }
{                                                                  }
{******************************************************************}

unit UStartup;

interface

uses
  Windows, Messages;

const
  // Name of main window class
  cWindowClassName = 'HydrognomonV4_0_2_23';
  // Any 32 bit number here to perform check on copied data
  cCopyDataWaterMark = $C73C14B1;
  // User window message handled by main form ensures that
  // app not minimized or hidden and is in foreground
  UM_ENSURERESTORED = WM_USER + 1;

function FindDuplicateMainWdw: HWND;

function SwitchToPrevInst(Wdw: HWND): Boolean;

implementation

uses
  AnsiStrings, SysUtils;

function SendParamsToPrevInst(Wdw: HWND): Boolean;
var
  CopyData: TCopyDataStruct;
  I: Integer;
  DataSize: Integer;
  Data: PAnsiChar;
  PData: PAnsiChar;
begin
  DataSize := 0;
  for i := 1 to ParamCount do
    Inc(DataSize, Length(ParamStr(i)) + 1);
  Inc(DataSize);
  Data := PAnsiChar(StrAlloc(DataSize));
  try
    PData := Data;
    for i := 1 to ParamCount do
    begin
      AnsiStrings.StrPCopy(PData, AnsiString(ParamStr(i)));
      Inc(PData, Length(ParamStr(i)) + 1);
    end;
    PData^ := #0;
    CopyData.lpData := Data;
    CopyData.cbData := DataSize;
    CopyData.dwData := cCopyDataWaterMark;
    Result := SendMessage(
      Wdw, WM_COPYDATA, 0, LPARAM(@CopyData)
    ) = 1;
  finally
    AnsiStrings.StrDispose(Data);
  end;
end;

function FindDuplicateMainWdw: HWND;
begin
  Result := FindWindow(cWindowClassName, nil);
end;

function SwitchToPrevInst(Wdw: HWND): Boolean;
begin
  Assert(Wdw <> 0);
  if ParamCount > 0 then
    Result := SendParamsToPrevInst(Wdw)
  else
    Result := True;
  if Result then
    SendMessage(Wdw, UM_ENSURERESTORED, 0, 0);
end;

end.
