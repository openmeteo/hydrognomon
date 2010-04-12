program CreateBuildDateFile;

{$APPTYPE CONSOLE}

uses
  SysUtils, Classes;

const
  APasFileContents1 =
  'unit build_date;'#13#10#13#10+
  'interface'#13#10#13#10+
  'const'#13#10+
  '  BuildDate=''';



var
  AStringList: TStringList;


begin
  try
    AStringList := nil;
    try
      AStringList := TStringList.Create;
      AStringList.Add(APasFileContents1+
        FormatDateTime('yyyy/mm/dd hh:nn:ss',Date+Time)+''';'#13#10);
      AStringList.Add('implementation'#13#10#13#10'end.');
      AStringList.SaveToFile('build_date.pas');
    finally
      AStringList.Free;
    end;
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
