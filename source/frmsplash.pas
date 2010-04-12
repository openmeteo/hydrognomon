{******************************************************************}
{                                                                  }
{  Itia Hydrognomon                                                }
{                                                                  }
{  Copyright (c) 2000-09 National Technical University of Athens   }
{                                                                  }
{******************************************************************}

unit frmsplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TFrmSplashScreen = class(TForm)
    Image1: TImage;
    lblApplicationTitle: TLabel;
    lblVersion: TLabel;
    chkShowSplash: TCheckBox;
    Shape1: TShape;
    Shape2: TShape;
    procedure FormCreate(Sender: TObject);
    procedure chkShowSplashClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses AppOpts, GenUtils;

procedure TFrmSplashScreen.chkShowSplashClick(Sender: TObject);
begin
  ApplicationOptions.ShowSplashOnStartup := chkShowSplash.Checked;
end;

resourcestring
  rsVersion = 'Version: ';

procedure TFrmSplashScreen.FormCreate(Sender: TObject);
begin
  chkShowSplash.Checked := ApplicationOptions.ShowSplashOnStartup;
  lblApplicationTitle.Caption := Application.Title;
  lblVersion.Caption :=  rsVersion + GetFileVersionStr(ParamStr(0),
    ver3ItemsPlusParentheses);
end;

end.
