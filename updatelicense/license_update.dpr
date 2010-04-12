program license_update;

{$APPTYPE CONSOLE}

uses
  SysUtils, Classes, StrUtils;

const
  TemplateFile = '.\frmlicen.pat';
  OutputFile = '.\frmlicen.dfm';
  LicenseFile = '..\LICENSE.txt';
  LicenseSubStr = '''licensesubstr''';

var
  ALicenseText: TStringList;
  ATemplateText: TStringList;
  AOutputText: TStringList;
  s: string;
  i,j: Integer;

begin
  ALicenseText := nil;
  ATemplateText := nil;
  AOutputText := nil;
  try try
    ALicenseText := TStringList.Create;
    ALicenseText.LoadFromFile(LicenseFile);
    ATemplateText := TStringList.Create;
    ATemplateText.LoadFromFile(TemplateFile);
    AOutputText := TStringList.Create;
    j := 0;
    while True do
    begin
      s := ATemplateText[j];
      Inc(j);
      if (j >= ATemplateText.Count) or (s = LicenseSubStr) then Break;
      AOutputText.Add(s);
    end;
    for i := 0 to ALicenseText.Count-1 do
    begin
      s := ALicenseText[i];
      s := ReplaceStr(s, '''', '''''');
      AOutputText.Add(''''+s+'''');
    end;
    while True do
    begin
      s := ATemplateText[j];
      AOutputText.Add(s);
      Inc(j);
      if j >= ATemplateText.Count then Break;
    end;
    AOutputText.SaveToFile(OutputFile);
  finally
    ALicenseText.Free;
    ATemplateText.Free;
    AOutputText.Free;
  end;
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
