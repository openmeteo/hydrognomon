unit dmdravcomponents;

interface

uses
  SysUtils, Classes, tsgrid, RpBase, RpSystem, RpCon, RpDefine, RpRave,
  RpRenderText, RpRenderRTF, RpRenderHTML, RpRender, RpRenderPDF;

type
  TDmdRavreports = class(TDataModule)
    RvProject: TRvProject;
    RvSystem: TRvSystem;
    RvRenderPDF: TRvRenderPDF;
    RvRenderHTML: TRvRenderHTML;
    RvRenderRTF: TRvRenderRTF;
    RvRenderText: TRvRenderText;
    procedure DataModuleCreate(Sender: TObject);
  private

  public

  end;

var
  DmdRavreports: TDmdRavreports;

implementation

{$R *.dfm}

uses forms;

procedure TDmdRavreports.DataModuleCreate(Sender: TObject);
begin
  RvProject.ProjectFile := ExtractFilePath(Application.ExeName)+
    '\reprave.rav';
end;

end.
