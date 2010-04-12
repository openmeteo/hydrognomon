{******************************************************************}
{                                                                  }
{  Itia Hydrognomon                                                }
{                                                                  }
{  Copyright (c) 2000-09 National Technical University of Athens   }
{                                                                  }
{******************************************************************}

unit frmlicen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TFrmLicenseDialog = class(TForm)
    btnOK: TButton;
    memoLicense: TMemo;
  private

  public

  end;

var
  FrmLicenseDialog: TFrmLicenseDialog;

implementation

{$R *.dfm}

end.
