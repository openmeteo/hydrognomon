{******************************************************************}
{                                                                  }
{  Itia Hydrognomon                                                }
{                                                                  }
{  Copyright (c) 2000-10 National Technical University of Athens   }
{                                                                  }
{******************************************************************}

unit frmtsgrid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ImgList, ComCtrls, ToolWin, ExtCtrls, tsgrid, TsDialogs,
  Grids, Ts, Matrix, Dates, icomponent, genutils,
  StdCtrls, RpDefine, RpCon, OdAboutInfo, dmdravcomponents, XPMan, ActnMan,
  ActnCtrls, ActnMenus, ActnList, PlatformDefaultStyleActnCtrls,
  XPStyleActnCtrls, ActnPopup, CustomizeDlg,
  build_date, ShellAPI, UStartup, AppEvnts;

type
  TFrmTimeseriesGrid = class(TForm)
    PnlGridHolder: TPanel;
    StatusBar: TStatusBar;
    ImglsMain: TImageList;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    FilterDialog: TFilterDialog;
    TimeseriesGrid: TTimeseriesGrid;
    RegularizeStepDialog: TRegularizeStepDialog;
    PopupMenu: TPopupActionBar;
    MnuPCopy: TMenuItem;
    MnuPCopyWithDates: TMenuItem;
    MnuPPaste: TMenuItem;
    N10: TMenuItem;
    MnuPInsertRecord: TMenuItem;
    MnuPDeleteSelectedRecords: TMenuItem;
    N11: TMenuItem;
    ControlBar1: TControlBar;
    MainToolBar: TActionToolBar;
    MnuPSelectTimeseries: TMenuItem;
    N12: TMenuItem;
    MnuPSetValue: TMenuItem;
    MnuPSetFlags: TMenuItem;
    N13: TMenuItem;
    MnuPTimeseriesProperties: TMenuItem;
    FlagsDialog: TFlagsDialog;
    RangeCheckDialog: TRangeCheckDialog;
    RegressionDialog: TRegressionDialog;
    RegrResultsDialog: TRegrResultsDialog;
    PenmanDialog: TPenmanDialog;
    LinearCombinationDialog: TLinearCombinationDialog;
    TimeSeriesGraphForm: TTimeSeriesGraphForm;
    StatisticsForm: TStatisticsForm;
    DoubleMassDialog: TDoubleMassDialog;
    mnuPQuickSum: TMenuItem;
    mnuPSetNull: TMenuItem;
    IDFEvaluationDialog: TIDFEvaluationDialog;
    SetIDFTSDialog: TSetIDFTSDialog;
    SimpleHydroModel: TSimpleHydroModel;
    StageDischargeDialog: TStageDischargeDialog;
    TsprocessSelectionsDialog: TTsprocessSelectionsDialog;
    memoSelections: TMemo;
    RvTimeseriesGrid: TRvCustomConnection;
    RvTimeseriesTableMonthly: TRvCustomConnection;
    RvTimeseriesTableDaily: TRvCustomConnection;
    RvTimeseriesMonthlyTitles: TRvCustomConnection;
    RvTimeseriesDailyTitles: TRvCustomConnection;
    ComplexCalculationsDialog: TComplexCalculationsDialog;
    DisaggregationDialog: TDisaggregationDialog;
    HydrometryDialog: THydrometryDialog;
    AboutDialog: TOdAboutInfo;
    XPManifest: TXPManifest;
    ActionManager: TActionManager;
    actionNewTimeseries: TAction;
    actionLoadFromFile: TAction;
    actionSaveAs: TAction;
    actionTimeseriesProperties: TAction;
    actionPrint: TAction;
    actionCloseTimeseries: TAction;
    actionClose: TAction;
    actionUndo: TAction;
    actionRedo: TAction;
    actionCopy: TAction;
    actionCopyWithDates: TAction;
    actionPaste: TAction;
    actionPasteMonthlyTable: TAction;
    actionPasteDailyTable: TAction;
    actionInsertRecord: TAction;
    actionInsertMultiRecords: TAction;
    actionDeleteSelectedRecords: TAction;
    actionSelectTimeseries: TAction;
    actionSetValue: TAction;
    actionSetFlags: TAction;
    actionSetNull: TAction;
    actionViewAsTable: TAction;
    actionHydrologicalYear: TAction;
    actionShowStatistics: TAction;
    actionShowFlags: TAction;
    actionQuickSum: TAction;
    actionSetFilter: TAction;
    actionFilter: TAction;
    actionHighlightNone: TAction;
    actionHighlightNull: TAction;
    actionHighlightFlag: TAction;
    actionHighlightMax: TAction;
    actionHighlightMin: TAction;
    actionHighlightMaxAndMin: TAction;
    actionHighlightLarge: TAction;
    actionHighlightSmall: TAction;
    actionHighlightLargeAndSmall: TAction;
    actionDrawGraph: TAction;
    actionGraphRemoveTimeSeries: TAction;
    actionClearGraph: TAction;
    actionAllowDifferentUnits: TAction;
    actionRangeCheck: TAction;
    actionTimeConsistencyCheck: TAction;
    actionRegularizeStep: TAction;
    actionDisaggregation: TAction;
    actionLinComb: TAction;
    actionExtremesEvaluation: TAction;
    actionComplexCalculations: TAction;
    actionDoubleMassCurve: TAction;
    actionEvaporation: TAction;
    actionHydrometry: TAction;
    actionInterpolations: TAction;
    actionRegression: TAction;
    actionSimpleHydroModel: TAction;
    actionStats: TAction;
    actionIDFCurves: TAction;
    ActionMainMenuBar: TActionMainMenuBar;
    actionMnuEditSetPaste: TAction;
    actionPrevious: TAction;
    actionNext: TAction;
    actionHelpHelp: TAction;
    actionAbout: TAction;
    ImglsDisabled: TImageList;
    actionShowMainToolbar: TAction;
    actionMnuToolbarsUpdate: TAction;
    EditToolBar: TActionToolBar;
    ViewToolBar: TActionToolBar;
    actionEditToolbar: TAction;
    actionViewToolbar: TAction;
    actionPreferences: TAction;
    PrinterSetupDialog: TPrinterSetupDialog;
    mnuPrinterSetup: TAction;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    ReopenActionList1: TActionList;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    Action7: TAction;
    Action8: TAction;
    Action9: TAction;
    actionSave: TAction;
    actionLicense: TAction;
    TimeseriesIntegrationDialog: TTimeseriesIntegrationDialog;
    actionArealIntegration: TAction;
    actionImportData: TAction;
    TimeseriesImportDataDialog: TTimeseriesImportDataDialog;
    ImportFileDialog: TOpenDialog;
    actionCheckForNewVersion: TAction;
    TimeseriesWizard: TTimeseriesWizard;
    actionSaveAsTemplate: TAction;
    SaveTemplateDialog: TSaveDialog;
    actionGoToRecord: TAction;
    actionGoToHydrognomonOrg: TAction;
    actionSubscribeToHydrognomonMailingList: TAction;
    actionYoutube: TAction;
    actionOnFacebook: TAction;
    actionHelpPages: TAction;
    actionInfoDownloadPage: TAction;
    actionTestAggregation: TAction;
    AggregateSeriesDialog: TAggregateSeriesDialog;
    actionSeriesAggregation: TAction;
    ApplicationEvents: TApplicationEvents;
    procedure FormCreate(Sender: TObject);
    procedure MnuLoadFromFileClick(Sender: TObject);
    procedure MnuWriteToFileClick(Sender: TObject);
    procedure MnuCloseTimeseriesClick(Sender: TObject);
    procedure MnuShowFlagsClick(Sender: TObject);
    procedure MnuRangeCheckClick(Sender: TObject);
    procedure MnuSetFilterClick(Sender: TObject);
    procedure MnuCopyClick(Sender: TObject);
    procedure MnuCopyWithDatesClick(Sender: TObject);
    procedure MnuPasteClick(Sender: TObject);
    procedure MnuRegularizeStepClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MnuRegressionClick(Sender: TObject);
    procedure MnuViewAsTableClick(Sender: TObject);
    procedure MnuViewAsListClick(Sender: TObject);
    procedure MnuShowStatisticsClick(Sender: TObject);
    procedure MnuTimeseriesPropertiesClick(Sender: TObject);
    procedure MnuHydrologicalYearClick(Sender: TObject);
    procedure MnuHighlightClick(Sender: TObject);
    procedure TlbtnPreviousClick(Sender: TObject);
    procedure MnuDeleteSelectedRecordsClick(Sender: TObject);
    procedure MnuSetValueClick(Sender: TObject);
    procedure MnuSetFlagsClick(Sender: TObject);
    procedure MnuInsertRecordClick(Sender: TObject);
    procedure TlbtnViewAsTableClick(Sender: TObject);
    procedure MnuSelectTimeseriesClick(Sender: TObject);
    procedure TimeseriesGridContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure MnuFilterClick(Sender: TObject);
    procedure MnuEvaporationClick(Sender: TObject);
    procedure MnuNewTimeseriesClick(Sender: TObject);
    procedure MnuLinCombClick(Sender: TObject);
    procedure MnuGraphsClick(Sender: TObject);
    procedure MnuClearGraphClick(Sender: TObject);
    procedure MnuInterpolationsClick(Sender: TObject);
    procedure MnuAllowDifferentUnitsClick(Sender: TObject);
    procedure mnuInsertMultiRecordsClick(Sender: TObject);
    procedure mnuPasteMonthlyTableClick(Sender: TObject);
    procedure MnuGraphRemoveTimeSeriesClick(Sender: TObject);
    procedure MnuEditClick(Sender: TObject);
    procedure MnuTimeConsistencyCheckClick(Sender: TObject);
    procedure TimeseriesGridClick(Sender: TObject);
    procedure TimeseriesGridColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure mnuStatsClick(Sender: TObject);
    procedure MnuPasteDailyTableClick(Sender: TObject);
    procedure MnuDoubleMassCurveClick(Sender: TObject);
    procedure mnuQuickSumClick(Sender: TObject);
    procedure mnuSetNullClick(Sender: TObject);
    procedure mnuPrintClick(Sender: TObject);
    procedure mnuExtremesEvaluationClick(Sender: TObject);
    procedure MnuIDFCurvesClick(Sender: TObject);
    procedure MnuCloseClick(Sender: TObject);
    procedure mnuSimpleHydroModelClick(Sender: TObject);
    procedure RvTimeseriesGridGetCols(Connection: TRvCustomConnection);
    procedure RvTimeseriesGridGetRow(Connection: TRvCustomConnection);
    procedure RvTimeseriesGridOpen(Connection: TRvCustomConnection);
    procedure RvTimeseriesTableMonthlyGetCols(
      Connection: TRvCustomConnection);
    procedure RvTimeseriesTableMonthlyGetRow(
      Connection: TRvCustomConnection);
    procedure RvTimeseriesTableMonthlyOpen(
      Connection: TRvCustomConnection);
    procedure RvTimeseriesMonthlyTitlesOpen(
      Connection: TRvCustomConnection);
    procedure mnuUndoClick(Sender: TObject);
    procedure mnuRedoClick(Sender: TObject);
    procedure mnuComplexCalculationsClick(Sender: TObject);
    procedure mnuDisaggregationClick(Sender: TObject);
    procedure mnuHydrometryClick(Sender: TObject);
    procedure mnuAboutClick(Sender: TObject);
    procedure actionShowMainToolbarExecute(Sender: TObject);
    procedure actionMnuToolbarsUpdateExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actionPreferencesExecute(Sender: TObject);
    procedure mnuPrinterSetupExecute(Sender: TObject);
    procedure ReopenActionExecute(Sender: TObject);
    procedure actionSaveExecute(Sender: TObject);
    procedure actionLicenseExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actionArealIntegrationExecute(Sender: TObject);
    procedure actionHelpHelpExecute(Sender: TObject);
    procedure actionImportDataExecute(Sender: TObject);
    procedure actionCheckForNewVersionExecute(Sender: TObject);
    procedure actionSaveAsTemplateExecute(Sender: TObject);
    procedure actionGoToRecordExecute(Sender: TObject);
    procedure actionGoToHydrognomonOrgExecute(Sender: TObject);
    procedure actionSubscribeToHydrognomonMailingListExecute(Sender: TObject);
    procedure actionYoutubeExecute(Sender: TObject);
    procedure actionSeriesAggregationExecute(Sender: TObject);
    procedure TimeseriesGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ApplicationEventsModalEnd(Sender: TObject);
  private
    FLincomb: Integer;
    FTSSelectionArray: TTsSelectionsArray;
    FSavedFlag: Boolean;
    FQueuedParam: TStringList;
    ReopenMenuItem: TActionClientItem;
    OpenToolItem: TActionClientItem;
    procedure ShowHint(Sender: TObject);
    procedure DisposeTsSelectionArray;
    procedure SetSelectionValue(AIndex: Integer; AKey: string);
    procedure ProgressIndicator(Completed, Total: Integer);
    procedure ShowSplash;
    procedure FindReopenMenuItem(AClient: TActionClient);
    procedure FindOpenToolItem(AClient: TActionClient);
    procedure UpdateReopenItem(ReopenItem1, ReopenItem2: TActionClientItem;
      AFileName: string);
    procedure UpdateMRUList(AFileName: string);
    procedure SaveCommonCommonPart(Sender: TObject);
    procedure WMDROPFILES(var AMessage: TWMDROPFILES);
    message WM_DROPFILES;
    procedure ProcessParam(const Param: string);
    procedure UMEnsureRestored(var Msg: TMessage);
      message UM_ENSURERESTORED;
    procedure WMCopyData(var Msg: TWMCopyData);
    	message WM_COPYDATA;
  public
    procedure SetControlStatus;
    function IsModified: Boolean;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  end;

var
  FrmTimeseriesGrid: TFrmTimeseriesGrid;
  MyMsg: Cardinal;

const
  HelpFileFilename = 'Hydrognomon4.chm';
  RegressionOptimizationHelpContext = 1325;

implementation

{$R *.DFM}
{$R windowsxp.RES}

uses TsProcess, Contnrs, Math, TsEvap, lincombdlg, clipbrd,
  registry, iStrUtils, tsdblmass, DateUtils, frmopts, frmsplash,
  frmrgopt, frmlicen, chknewver, AppOpts, genopts;

procedure TFrmTimeseriesGrid.actionHelpHelpExecute(Sender: TObject);
begin
  Application.HelpContext(1010);
end;

resourcestring
  rsImportData = 'Import data';

procedure TFrmTimeseriesGrid.actionImportDataExecute(Sender: TObject);
var
  AFileStream: TFileStream;
  AMemoryStream: TMemoryStream;
  Options: TImportDataToTimeseriesOptions;
  SavedCursor: TCursor;
  ATimeseries: TTimeseries;
begin
  if not ImportFileDialog.Execute then Exit;
  TimeseriesImportDataDialog.FileName := ImportFileDialog.FileName;
  if not TimeseriesImportDataDialog.Execute then Exit;
  Options  := TimeseriesImportDataDialog.Options;
  AMemoryStream := nil;
  AFileStream := nil;
  ATimeseries := nil;
  SavedCursor := Screen.Cursor;
  try try
    Screen.Cursor := crHourGlass;
    ATimeseries := TTimeseries.Create;
    ATimeseries.AssignMeta(TimeseriesGrid.ActiveTimeseries);
    AMemoryStream := TMemoryStream.Create;
    AFileStream := TFileStream.Create(ImportFileDialog.FileName,
      fmOpenRead or fmShareDenyWrite);
    ImportDataToTimeseries(AFileStream, AMemoryStream, Options);
    AMemoryStream.Seek(0,0);
    with ATimeseries do
      ImportData(AMemoryStream, Options.Encoding, False);
    if ATimeseries.Count<1 then Exit;
  try
    TimeseriesGrid.IncUndoIDPointer;
    with TimeseriesGrid do
      PrepareBuffer(ActiveIndex, ATimeseries.First.Date, ATimeseries.Last.Date,
        rsImportData, UndoIDPointer);
    with TimeseriesGrid.ActiveTimeseries do
      MergeData(ATimeseries, Options.Overwrite);
    with TimeseriesGrid do FinalizeBuffer(ActiveIndex);
    SetControlStatus;
  finally
    AFileStream.Free;
    AMemoryStream.Free;
    ATimeseries.Free;
  end;
  except
    with TimeseriesGrid do RevertBuffer(ActiveIndex);
    raise;
  end;
  finally
    Screen.Cursor := SavedCursor;
  end;
end;

procedure TFrmTimeseriesGrid.actionLicenseExecute(Sender: TObject);
begin
  FrmLicenseDialog.ShowModal;
end;

procedure TFrmTimeseriesGrid.actionMnuToolbarsUpdateExecute(Sender: TObject);
begin
  actionShowMainToolbar.Checked := MainToolBar.Visible;
  actionViewToolbar.Checked := ViewToolBar.Visible;
  actionEditToolbar.Checked := EditToolBar.Visible;
end;

procedure TFrmTimeseriesGrid.actionPreferencesExecute(Sender: TObject);
var
  FrmOptions: TFrmOptions;
begin
  FrmOptions := nil;
  try
    FrmOptions := TFrmOptions.create(Self);
    FrmOptions.ShowModal;
  finally
    if FrmOptions<>nil then FrmOptions.Release;
  end;
end;

procedure TFrmTimeseriesGrid.actionShowMainToolbarExecute(Sender: TObject);
begin
  with (Sender as TAction) do
    Checked := not Checked;
  MainToolBar.Visible := actionShowMainToolbar.Checked;
  ViewToolBar.Visible := actionViewToolbar.Checked;
  EditToolBar.Visible := actionEditToolbar.Checked;
end;

procedure TFrmTimeseriesGrid.actionSubscribeToHydrognomonMailingListExecute(
  Sender: TObject);
begin
  ShellExecute(0, 'open', PChar(
    'http://www.itia.ntua.gr/cgi-bin/mailman/listinfo/hydrognomon-announce'),
    nil, nil, SW_SHOWNORMAL);
end;

procedure TFrmTimeseriesGrid.actionYoutubeExecute(Sender: TObject);
var
  s: string;
begin
  case TAction(Sender).Tag of
    0: s := 'http://www.youtube.com/hydrognomon';
    1: s := 'http://www.facebook.com/pages/Hydrognomon/326779340275';
    2: s := 'http://www.itia.ntua.gr/help/misc/hydrognomon';
    3: s := 'http://hydrognomon.org/download.html';
    else Assert(False);
  end;
  ShellExecute(0, 'open', PChar(s), nil, nil, SW_SHOWNORMAL)
end;

procedure TFrmTimeseriesGrid.ApplicationEventsModalEnd(Sender: TObject);
var
  i: Integer;
begin
  if Application.ModalLevel>0 then Exit;
  for i := 0 to FQueuedParam.Count-1 do
    ProcessParam(FQueuedParam[i]);
  FQueuedParam.Clear;
end;

procedure TFrmTimeseriesGrid.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle := WS_EX_APPWINDOW;
  StrCopy(Params.WinClassName, cWindowClassName);
end;

procedure TFrmTimeseriesGrid.ShowSplash;
var
  ASplashScreen: TFrmSplashScreen;
  i: Integer;
begin
  ASplashScreen := nil;
  try
    ASplashScreen := TFrmSplashScreen.Create(nil);
    ASplashScreen.Top := (Screen.DesktopHeight-ASplashScreen.Height) div 2;
    ASplashScreen.Left := (Screen.DesktopWidth-ASplashScreen.Width) div 2;
    AnimateWindow(ASplashScreen.Handle, 1000, AW_BLEND);
    Sleep(10);
    ASplashScreen.Show;
    for i := 0 to 200 do
    begin
      Sleep(10);
      Application.ProcessMessages;
    end;
    AnimateWindow(ASplashScreen.Handle, 250, AW_HIDE or AW_BLEND);
    ASplashScreen.Close;
  finally
    ASplashScreen.Release;
  end;
end;

procedure TFrmTimeseriesGrid.ShowHint(Sender: TObject);
begin
  StatusBar.SimpleText := Application.Hint;
end;

resourcestring
  rsCheckEveryTime = 'Check this every time hydrognomon starts';

function CheckDialog(AMessage: string; var CheckEverytime: Boolean): TModalResult;
var
  ADialog: TForm;
  ACheckBox: TCheckBox;
begin
  ADialog := nil;
  ACheckBox := nil;
  try
    ADialog := CreateMessageDialog(AMessage, mtConfirmation, mbYesNo, mbYes);
    ACheckBox := TCheckBox.Create(ADialog);
    ACheckBox.Width := ADialog.ClientWidth - 10;
    ACheckBox.Parent := ADialog;
    ACheckBox.Caption := rsCheckEveryTime;
    ACheckBox.Checked := CheckEverytime;
    ADialog.Height := ADialog.Height + ACheckBox.Height + 5;
    ACheckBox.Top := ADialog.ClientHeight - ACheckBox.Height - 5;
    ACheckBox.Left := 5;
    Result := ADialog.ShowModal;
    CheckEverytime := ACheckBox.Checked;
  finally
    ACheckBox.Free;
    ADialog.Free;
  end;
end;

resourcestring
  rsReopenMenuCaption = '&Reopen...';
  rsOpenToolCaption = '&Open...';
  rsHdrRegistered = '*.'+HydrognomonExtension+
    ' file type (time series files) has been associated with Hydrognomon.'+
    ' Next time you open (e.g. by double clicking) a *.'+HydrognomonExtension+
    ' file, it will load within Hydrognomon interface.';
  rsFileTypeRegisteredToOther =
    'Hydrognomon time series files with extension *.'+HydrognomonExtension+
    ' are associated with '+
      'another software. Do you want to override this and associate *.'+
      HydrognomonExtension+' files with Hydrognomon?';
  rsFileOpenerChanged =
    'Hydrognomon time series files with extension *.'+HydrognomonExtension+
      ' are associated with '+
      'a different version of Hydrognomon, maybe installed in another folder. '+
      'Do you want to fix this issue so *.'+HydrognomonExtension+
      ' files will open with the current running version of Hydrognomon?';
  rsErrorWhileReadingRegistry =
    'Error while reading initialization values from Windows Registry. '+
      'Using default values';

procedure TFrmTimeseriesGrid.FormCreate(Sender: TObject);

  procedure FileTypesRegistration;
  var
    ABool: Boolean;
  begin
    if not IsFileTypeRegistered(HydrognomonExtension) then
    begin
      RegisterFileType(HydrognomonExtension, TimeseriesContentType,
        HydrognomonFileType, ParamStr(0), rsFileDescription);
      MessageDlg(rsHdrRegistered, mtInformation, [mbOK], 0);
      ApplicationOptions.CheckExtension := True;
      ApplicationOptions.CheckFileOpener := True;
    end;
    if ApplicationOptions.CheckExtension then
      if FileTypeRegisteredTo(HydrognomonExtension) <> HydrognomonFileType then
      begin
        ABool := ApplicationOptions.CheckExtension;
        if CheckDialog(rsFileTypeRegisteredToOther, ABool)=mrYes then
          RegisterFileType(HydrognomonExtension, TimeseriesContentType,
            HydrognomonFileType, ParamStr(0), rsFileDescription);
        ApplicationOptions.CheckExtension := ABool;
      end;
    if ApplicationOptions.CheckFileOpener then
      if FileOpenRegisteredTo(HydrognomonFileType) <> ParamStr(0)+ ' "%1"' then
      begin
        ABool := ApplicationOptions.CheckFileOpener;
        if CheckDialog(rsFileOpenerChanged, ABool)=mrYes then
          RegisterFileType(HydrognomonExtension, TimeseriesContentType,
            HydrognomonFileType, ParamStr(0), rsFileDescription);
        ApplicationOptions.CheckFileOpener := ABool;
      end;
  end;

  procedure SetupItemCaptions(AItem: TActionClientItem);
  var
    i: Integer;
  begin
    if Assigned(AItem) then
      for i := 0 to AItem.Items.Count - 1 do
        TCustomAction(ReopenActionList1.Actions[i]).Caption :=
          Copy(AItem.Items[i].Caption, 5, MaxInt);
  end;

  procedure LoadMRUFromRegistry(AItem: TActionClientItem);
  var
    i: Integer;
  begin
    AItem.Items.Clear;
    with ApplicationOptions do
      for i := 0 to Length(MRUList)-1 do
        if MRUList[i]<>'' then
        begin
          with AItem.Items.Add do
          begin
            Action :=  ReopenActionList1.Actions[i];
            Caption := Format('&%d: %s', [i+1, MRUList[i]]);
          end;
        end;
  end;

begin
  DragAcceptFiles( FrmTimeseriesGrid.Handle, True );
  FLincomb := 0;
  FQueuedParam := TStringList.Create;
  FTSSelectionArray := nil;
  TsprocessSelectionsDialog.SetSelectionArray(FTSSelectionArray);
  try
    ApplicationOptions.LoadFromRegistry;
  except
    ShowMessage(rsErrorWhileReadingRegistry);
  end;
  FileTypesRegistration;
  if ApplicationOptions.UpdatedVersion = '' then
    ApplicationOptions.UpdatedVersion :=
      genutils.GetFileVersionStr(ParamStr(0), ver4Items);
{If the actual version is newer than the registered version the use the
 actual version to not warn user for an updated, already downloaded before
 get the update warning message.}
  if VersionComp(genutils.GetFileVersionStr(ParamStr(0), ver4Items),
    ApplicationOptions.UpdatedVersion)>0 then
    ApplicationOptions.UpdatedVersion :=
      genutils.GetFileVersionStr(ParamStr(0), ver4Items);
  if ApplicationOptions.CheckForNewVersionsOnStartup then
    TCheckThread.Create(ApplicationOptions, ApplicationOptions.UpdatedVersion,
      False);
  if ApplicationOptions.ShowSplashOnStartup then
    if ParamCount<1 then ShowSplash;
  with ApplicationOptions do
    if FormHeight>0 then
    begin
      Left := FormLeft;
      Top := FormTop;
      Width := FormWidth;
      Height := FormHeight;
    end;
  if ApplicationOptions.IsMaximized then WindowState := wsMaximized else
    WindowState := wsNormal;
  ActionManager.ActionBars.IterateClients(ActionManager.ActionBars[0].Items,
    FindReopenMenuItem);
  ActionManager.ActionBars.IterateClients(ActionManager.ActionBars[1].Items,
    FindOpenToolItem);
  LoadMRUFromRegistry(ReopenMenuItem);
  LoadMRUFromRegistry(OpenToolItem);
  SetupItemCaptions(ReopenMenuItem);
  ReopenMenuItem.Caption := rsReopenMenuCaption;
  OpenToolItem.Caption := rsOpenToolCaption;
  AboutDialog.BuildDate := build_date.BuildDate;
  Application.OnHint := ShowHint;
  Application.HelpFile := ExtractFileDir(ParamStr(0))+'\'+HelpFileFilename;
  with ApplicationOptions do
    if not DirectoryExists(AppDataSeriesTemplatesFolder) then
      ForceDirectories(AppDataSeriesTemplatesFolder);
  SetControlStatus;
end;

procedure TFrmTimeseriesGrid.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i: Integer;
begin
  Action := caFree;
  with ApplicationOptions do
  begin
    IsMaximized := (WindowState = wsMaximized);
    if not IsMaximized then
    begin
      FormLeft := Left;
      FormTop := Top;
      FormWidth := Width;
      FormHeight := Height;
    end;
    for i := 0 to Length(MRUList)-1 do  MRUList[i] := '';
    for i := 0 to ReopenMenuItem.Items.Count-1 do
    begin
      if i >= Length(MRUList) then Break;
      MRUList[i] := Copy(ReopenMenuItem.Items[i].Caption, 5, MaxInt);
    end;
    WriteToRegistry;
  end;
end;

resourcestring
  rsExitHydrognomon = 'Exit Hydrognomon ?';

procedure TFrmTimeseriesGrid.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  ARange: TGridRect;
begin
  CanClose := True;
  if ApplicationOptions.ExitConfirmation then
    if MessageDlg(rsExitHydrognomon, mtWarning, [mbOk, mbCancel], 0) =
      mrCancel then
    begin
      CanClose := False;
      Exit;
    end;
  if (TimeseriesGrid.Count>0) and (IsModified) then
  begin
    if WindowState = wsMinimized then
      ShowWindow(Self.Handle, SW_RESTORE);
    actionShowFlags.Checked := False;
    TimeseriesGrid.FlagsVisible := False;
    actionViewAsTable.Checked := False;
    TimeseriesGrid.DisplayFormat := dfSimple;
    TimeseriesGrid.Refresh;
    TimeseriesGrid.Update;
    SetFocusedControl(TimeseriesGrid);
    SetFocus;
    SetControlStatus;
    with ARange do
    begin
      Left := 1;
      Right := TimeseriesGrid.Count;
      if TimeseriesGrid.RowCount<2 then
        Top := 0 else Top :=1;
      Bottom := Top;
    end;
    TimeseriesGrid.Selection := ARange;
    MnuCloseTimeseriesClick(Sender);
    if TimeseriesGrid.Count>0 then CanClose := False;
  end;
end;

procedure TFrmTimeseriesGrid.DisposeTsSelectionArray;
var
  i: Integer;
begin
  for i := 0 to Length(FTSSelectionArray)-1 do
    FTSSelectionArray[i].Timeseries := nil;
  FTSSelectionArray := nil;
end;

procedure TFrmTimeseriesGrid.SetSelectionValue(AIndex: Integer; AKey: string);
var
  i: Integer;
begin
  for i := 0 to memoSelections.Lines.Count-1 do
    with memoSelections.Lines do
      if DelimitedStringItem(Strings[i],1,'$')=AKey then
      begin
        if DelimitedStringCount(Strings[i],'$')<>5 then Assert(False);
        with FTSSelectionArray[AIndex] do
        begin
          Name := TrimAllSpaces(DelimitedStringItem(Strings[i],2,'$'));
          Description := TrimAllSpaces(DelimitedStringItem(Strings[i],3,'$'));
          MinNum := StrToInt(TrimAllSpaces(
            DelimitedStringItem(Strings[i],4,'$')));
          MaxNum := StrToInt(TrimAllSpaces(
            DelimitedStringItem(Strings[i],5,'$')));
        end;
        Exit;
      end;
  Assert(False);
end;

procedure TFrmTimeseriesGrid.FormDestroy(Sender: TObject);
begin
  DisposeTsSelectionArray;
  FQueuedParam.Free;
end;

resourcestring
  rsFunctionNotSupported = 'This function is not supported yet';
  rsRecordsCompleted = '%d of %d records completed (%d%%)';
  rsUndo = 'Undo ';
  rsRedo = 'Redo ';

procedure TFrmTimeseriesGrid.SetControlStatus;
var
  ABoolean: Boolean;
  AInteger: Integer;
  AActiveTimeseries: TTimeseries;
begin
  { Reset some time series grid properties when Count = 0}
  if TimeseriesGrid.Count = 0 then
  begin
    TimeseriesGrid.Filtered := False;
  end;

  TimeseriesGrid.HYearOrigin :=
    ApplicationOptions.DefaultHydrologicalYearOrigin;

  AInteger := Timeseriesgrid.ActiveIndex;
  if (AInteger >= Timeseriesgrid.Count) then
    AInteger := Timeseriesgrid.Count-1;
  if (AInteger <0) then
    AInteger := 0;
  if TimeseriesGrid.Count=0 then AActiveTimeseries := nil else
    AActiveTimeseries := TimeseriesGrid.Data[AInteger];

  { Series menu and associated toolbuttons }
  actionPrint.Enabled := TimeseriesGrid.Count>0;
  actionCloseTimeseries.Enabled := TimeseriesGrid.Count>0;
  actionSaveAs.Enabled := (TimeseriesGrid.Count>0) and
    (AActiveTimeseries.FileName<>'');
  actionSave.Enabled := (TimeseriesGrid.Count>0) and
    (AActiveTimeseries.Modified);
  actionImportData.Enabled := TimeseriesGrid.Count>0;
  actionSaveAsTemplate.Enabled := TimeseriesGrid.Count>0;

  { Edit menu }
  actionCopy.Enabled := (TimeseriesGrid.Count>0) and
    (AActiveTimeseries.Count>0);
  actionCopyWithDates.Enabled :=
    (TimeseriesGrid.Count>0)  and (AActiveTimeseries.Count>0);
  ABoolean:=(TimeseriesGrid.Count>0) and
    (TimeseriesGrid.DisplayFormat=dfSimple);
  actionPaste.Enabled := ABoolean;
  actionPasteMonthlyTable.Enabled := ABoolean;
  actionPasteDailyTable.Enabled := ABoolean;
  actionPasteMonthlyTable.Enabled := ABoolean;
  actionPasteDailyTable.Enabled := ABoolean;
  actionInsertRecord.Enabled := ABoolean;
  actionInsertMultiRecords.Enabled := ABoolean and (AActiveTimeseries.Count>0);
  actionDeleteSelectedRecords.Enabled := ABoolean and
    (AActiveTimeseries.Count>0);
  actionSetValue.Enabled := ABoolean and (AActiveTimeseries.Count>0);
  actionSetFlags.Enabled := ABoolean and (AActiveTimeseries.Count>0);
  actionSetNull.Enabled := ABoolean and (AActiveTimeseries.Count>0);
  actionSelectTimeseries.Enabled := ABoolean and (AActiveTimeseries.Count>0);

  { View menu and associated toolbuttons }
  actionSetFilter.Enabled := TimeseriesGrid.Count>0;
  actionFilter.Enabled := (TimeseriesGrid.Count>0) {and
    (TimeseriesGrid.FilterCondition<>fcNone)};
  actionFilter.Checked := TimeseriesGrid.Filtered;
  actionShowStatistics.Enabled := (TimeseriesGrid.DisplayFormat = dfTable);
  actionTimeseriesProperties.Enabled := TimeseriesGrid.Count>0;
  actionHydrologicalYear.Enabled := (TimeseriesGrid.DisplayFormat=dfTable) and
    (TimeseriesGrid.ActiveIndex<>-1) and
    (TimeseriesGrid.ActiveTimeseries.TimeStep.TimeStepIn([tstDaily, tstMonthly]));
  actionHighlightMax.Enabled := (TimeseriesGrid.DisplayFormat=dfTable);
  actionHighlightMin.Enabled := (TimeseriesGrid.DisplayFormat=dfTable);
  actionHighlightMaxAndMin.Enabled := (TimeseriesGrid.DisplayFormat=dfTable);
  actionHighlightLarge.Enabled := (TimeseriesGrid.DisplayFormat=dfTable) and
    TimeseriesGrid.StatisticsVisible;
  actionHighlightSmall.Enabled := (TimeseriesGrid.DisplayFormat=dfTable) and
    TimeseriesGrid.StatisticsVisible;
  actionHighlightLargeAndSmall.Enabled := (TimeseriesGrid.DisplayFormat=dfTable)
    and TimeseriesGrid.StatisticsVisible;
  actionPrevious.Enabled := (TimeseriesGrid.DisplayFormat=dfTable) and
    (TimeseriesGrid.Count>0) and
    (TimeseriesGrid.ActiveTimeseries.TimeStep.TimeStepIn([tstHourly, tstDaily]));
  actionNext.Enabled := actionPrevious.Enabled;
{}
  actionViewAsTable.Enabled := (TimeseriesGrid.Count>0) and
    (Timeseriesgrid.Data[AInteger].Count>0) and
    Timeseriesgrid.Data[AInteger].TimeStepStrict and
    (Timeseriesgrid.Data[AInteger].TimeStep.TimeStepIn([tstHourly, tstDaily, tstMonthly]));
  actionViewAsTable.Checked := (TimeseriesGrid.DisplayFormat=dfTable);
  actionQuickSum.Enabled := (TimeseriesGrid.Count>0) and (
    AActiveTimeseries.Count>0);
  actionGoToRecord.Enabled := (TimeseriesGrid.DisplayFormat=dfSimple) and
    (TimeseriesGrid.Count>0) and (TimeseriesGrid.Data[AInteger].Count>0);
  { Tools menu }
  actionRangeCheck.Enabled := (TimeseriesGrid.Count>0) and
    (AActiveTimeseries.Count>0);
  actionRegularizeStep.Enabled := (TimeseriesGrid.Count>0) and
    (AActiveTimeseries.Count>0);
  actionSeriesAggregation.Enabled := (TimeseriesGrid.Count>0) and
    (AActiveTimeseries.Count>0) and (not AActiveTimeseries.TimeStep.IsVariable);
  actionDisaggregation.Enabled := (TimeseriesGrid.Count>0) and
    (AActiveTimeseries.Count>0);
  actionRegression.Enabled := TimeseriesGrid.Count>0;
  actionTimeConsistencyCheck.Enabled := (TimeseriesGrid.Count>0) and
    (AActiveTimeseries.Count>0);
  actionLinComb.Enabled := TimeseriesGrid.Count>0;
  actionComplexCalculations.Enabled := TimeseriesGrid.Count>0;
  actionDoubleMassCurve.Enabled := TimeseriesGrid.Count>0;
  actionExtremesEvaluation.Enabled := (TimeseriesGrid.Count>0) and
    (AActiveTimeseries.Count>0);
  actionSimpleHydroModel.Enabled := TimeseriesGrid.Count>0;
  actionArealIntegration.Enabled := TimeseriesGrid.Count>0;
  actionIDFCurves.Enabled := TimeseriesGrid.Count>0;
  actionEvaporation.Enabled := TimeseriesGrid.Count>0;

  { Graph menu }
  actionDrawGraph.Enabled := TimeseriesGrid.Count>0;
  actionGraphRemoveTimeSeries.Enabled := TimeseriesGrid.Count>0;
  actionClearGraph.Enabled := TimeseriesGrid.Count>0;

  { Statistics menu }
  actionStats.Enabled := (TimeseriesGrid.Count>0) and
    (AActiveTimeseries.Count>0);

  { Undo - redo controls }
  actionUndo.Enabled := (TimeseriesGrid.Count>0) and
    (TimeseriesGrid.DisplayFormat = dfSimple) and
      (TimeseriesGrid.CanUndo(TimeseriesGrid.ActiveIndex));
  if actionUndo.Enabled then
    actionUndo.Hint := rsUndo +
      TimeseriesGrid.UndoCaption(TimeseriesGrid.ActiveIndex)+'...'
  else
    actionUndo.Hint := rsUndo;
  actionRedo.Enabled := (TimeseriesGrid.Count>0) and
    (TimeseriesGrid.DisplayFormat = dfSimple) and
      (TimeseriesGrid.CanRedo(TimeseriesGrid.ActiveIndex));
  if actionRedo.Enabled then
    actionRedo.Hint := rsRedo +
      TimeseriesGrid.RedoCaption(TimeseriesGrid.ActiveIndex)+'...'
  else
    actionRedo.Hint := rsRedo;
end;

procedure TFrmTimeseriesGrid.ProgressIndicator(Completed, Total: Integer);
var Percentage: Integer;
begin
  if Total = 0 then Percentage := 100
  else Percentage := (Completed * 100) div Total;
  StatusBar.SimpleText := Format(rsRecordsCompleted,
    [Completed, Total, Percentage]);
end;

procedure TFrmTimeseriesGrid.UpdateMRUList(AFileName: string);
var
  i: Integer;
  Found: Boolean;
begin
  Found := False;
  for i := 0 to ReopenActionList1.ActionCount - 1 do
    if CompareText(TCustomAction(ReopenActionList1.Actions[i]).Caption,
       AFileName) = 0 then
    begin
      Found := True;
      TCustomAction(ReopenActionList1.Actions[i]).Index := 0;
      UpdateReopenItem(ReopenMenuItem, OpenToolItem, '');
      break;
    end;
  if not Found then
  begin
    UpdateReopenItem(ReopenMenuItem, OpenToolItem, AFileName);
  end;
end;

resourcestring
  rsSelectTimeseries = 'Select time series';
  rsErrorWhenTrying =
    'Error opening file: "';
  rsMaybeMissofrmed =
    '".'#13#10'Maybe a missformed or invalid time series file.'#13#10+
    'Error Message: "';

procedure TFrmTimeseriesGrid.MnuLoadFromFileClick(Sender: TObject);
var
  SavedCursor: TCursor;
  Timeseries:TTimeseries;
  AFileName: string;
  i: Integer;
begin
  if Sender<> nil then
    if not OpenDialog.Execute then Exit;
  try
    for i := 0 to OpenDialog.Files.Count-1 do
    begin
      SavedCursor := Screen.Cursor;
      Timeseries := nil;
      AFileName := '';
      try try
        Screen.Cursor := crHourGlass;
        Timeseries := TTimeseries.Create;
        Timeseries.TimeZone := ApplicationOptions.DefaultTimeZone;
        UpdateMRUList(OpenDialog.Files[i]);
        AFileName := OpenDialog.Files[i];
        Timeseries.LoadFromFile(AFileName, ProgressIndicator);
        TimeseriesGrid.Add(Timeseries);
        Timeseries := nil;
      finally
        Screen.Cursor := SavedCursor;
        Timeseries.Free;
      end;
      except
        on EFOpenError do
         raise;
        on E: Exception do
        begin
          E.Message :=  rsErrorWhenTrying + AFileName + rsMaybeMissofrmed +
            E.Message+'"';
          raise;
        end;
      end;
    end;
    Update;
    TimeseriesGrid.Update; // Needs to redisplay itself to register the change
                           // of number of columns before changing ActiveIndex;
                           // possibly a tsgrid bug.
    TimeseriesGrid.ActiveIndex := TimeseriesGrid.Count-1;
    SetFocusedControl(TimeseriesGrid);
    SetFocus;
  finally
    StatusBar.SimpleText := '';
    SetControlStatus;
  end;
end;

procedure TFrmTimeseriesGrid.SaveCommonCommonPart(Sender: TObject);
var
  SavedCursor: TCursor;
  VersionIndex: Integer;
begin
  if TimeseriesGrid.EditorMode = True then
    TimeseriesGrid.Perform(WM_KEYDOWN, VK_ESCAPE, 0);
  Update;
  SavedCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    if SaveDialog.FilterIndex = 2 then VersionIndex := 1 else
      VersionIndex := 2;
    TimeseriesGrid.ActiveTimeseries.WriteToFile(SaveDialog.FileName,
      ProgressIndicator, VersionIndex);
    UpdateMRUList(SaveDialog.FileName);
    TimeseriesGrid.ActiveTimeseries.Modified := False;
    TimeseriesGrid.ResetBuffer(TimeseriesGrid.ActiveIndex);
    SetControlStatus;
  finally
    StatusBar.SimpleText := '';
    Screen.Cursor := SavedCursor;
  end;
end;

procedure TFrmTimeseriesGrid.MnuWriteToFileClick(Sender: TObject);
begin
  SaveDialog.FilterIndex := 1;
  if TimeseriesGrid.ActiveTimeseries.FileName<>'' then
    SaveDialog.FileName := TimeseriesGrid.ActiveTimeseries.FileName;
  if not SaveDialog.Execute then Exit;
  SaveCommonCommonPart(Sender);
  FSavedFlag := True;
end;

resourcestring
  rsSaveToOldVersion =
    '%s is a time series file of older version of hydrognomon. Do you want '+
    'to save with the most recent version of Hydrognomon? '+#13#10+#13#10+
    'Press "yes" to replace, "no" to keep older format, or cancel';

procedure TFrmTimeseriesGrid.actionSaveAsTemplateExecute(Sender: TObject);
var
  ATimeseries: TTimeseries;
begin
  SaveTemplateDialog.InitialDir :=
    ApplicationOptions.AppDataSeriesTemplatesFolder;
  if not SaveTemplateDialog.Execute then
    Exit;
  ATimeseries := nil;
  try
    ATimeseries := TTimeseries.Create;
    ATimeseries.AssignMeta(TimeseriesGrid.ActiveTimeseries);
    ATimeseries.WriteToFile(ApplicationOptions.AppDataSeriesTemplatesFolder+
      ExtractFileName(SaveTemplateDialog.FileName), nil);
  finally
    ATimeseries.Free;
  end;
end;

procedure TFrmTimeseriesGrid.actionSaveExecute(Sender: TObject);
begin
  if TimeseriesGrid.ActiveTimeseries.FileName<>'' then
  begin
    if TimeseriesGrid.ActiveTimeseries.FileVersion<2 then
      case MessageDlg(Format(rsSaveToOldVersion,
        [TimeseriesGrid.ActiveTimeseries.FileName]),
        mtInformation, mbYesNoCancel, 0,
        mbYes) of
        mrYes: SaveDialog.FilterIndex := 1;
        mrNo: SaveDialog.FilterIndex := 2;
        mrCancel: Exit;
      end;
    SaveDialog.FileName := TimeseriesGrid.ActiveTimeseries.FileName;
    SaveCommonCommonPart(Sender);
    FSavedFlag := True;
  end else
    MnuWriteToFileClick(Sender);
end;

resourcestring
  rsConfirmClosing = 'The time series has been modified. Save changes?';

procedure TFrmTimeseriesGrid.MnuCloseTimeseriesClick(Sender: TObject);

  procedure CloseSingleTimeseries(AIndex: Integer);
  begin
    FSavedFlag := False;
    if TimeseriesGrid.Data[AIndex].Modified then
      case MessageDlg(rsConfirmClosing, mtConfirmation, mbYesNoCancel, 0,
        mbYes) of
        mrYes:
        begin
          actionSaveExecute(Sender);
          if not FSavedFlag then Exit;
        end;
        mrCancel: Exit;
      end;
{Remove from TSGraph}
    if TimeSeriesGraphForm.Visible then
      TimeSeriesGraphForm.Remove(TimeseriesGrid.Data[AIndex]);
    TimeseriesGrid.Delete(AIndex);
  end;

var
  ARange: TGridRect;
  i, SavedActiveIndex, SavedCount: Integer;
begin
  if TimeseriesGrid.EditorMode = True then
    TimeseriesGrid.Perform(WM_KEYDOWN, VK_ESCAPE, 0);;
  with TimeseriesGrid do
    if DisplayFormat = dfTable then
    begin
      SavedActiveIndex := ActiveIndex;
      DisplayFormat := dfSimple;
      Update; // Needs to redisplay itself to register the change
              // of number of columns before changing ActiveIndex;
              // possibly a tsgrid bug.
      ActiveIndex := SavedActiveIndex;
      SetFocusedControl(TimeseriesGrid);
      SetFocus;
      SetControlStatus;
  end;
  if (TimeSeriesGrid.DisplayFormat = dfSimple) and
    (not Timeseriesgrid.FlagsVisible) then
  begin
    ARange := TimeSeriesGrid.Selection;
    for i := ARange.Right downto ARange.Left do
    begin
      SavedCount := TimeseriesGrid.Count;
      TimeseriesGrid.ActiveIndex := i-1;
      CloseSingleTimeseries(i-1);
      if TimeseriesGrid.Count=SavedCount then Break;
    end;
  end else
    CloseSingleTimeseries(TimeseriesGrid.ActiveIndex);
  SetControlStatus;
end;

procedure TFrmTimeseriesGrid.MnuShowFlagsClick(Sender: TObject);
begin
  actionShowFlags.Checked := not actionShowFlags.Checked;
  TimeseriesGrid.FlagsVisible := actionShowFlags.Checked;
  SetControlStatus;
end;

resourcestring
  rsRangeCheckDialogBoxName = 'Range check';
  rsMarkOutOfRange = 'Mark out of range values with flag:';
  rsRangeCheckHighLimit = 'High limit:';

procedure TFrmTimeseriesGrid.MnuRangeCheckClick(Sender: TObject);
var
  SavedCursor: TCursor;
  AHigh, ALow: Real;
begin
  with RangeCheckDialog do
  begin
    DialogBoxName := rsRangeCheckDialogBoxName;
    LowLimitVisible := True;
    AutoLowHighVisible := True;
    ProbabilityLevelVisible := True;
    MarkLabel := rsMarkOutOfRange;
    HighLimitLabel := rsRangeCheckHighLimit;
    FlagsUsed := TimeseriesGrid.ActiveTimeseries.SelectionFlags;
    RangeFlag := 'SUSPECT';
    if not Execute then Exit;
    AHigh := HighLimit;
    ALow := LowLimit;
    Update;
    SavedCursor := Screen.Cursor;
    try try
      Screen.Cursor := crHourGlass;
      TimeseriesGrid.IncUndoIDPointer;
      with TimeseriesGrid do
        PrepareBuffer(ActiveIndex, ActiveTimeseries.First.Date,
          ActiveTimeseries.Last.Date, rsRangeCheckDialogBoxName,
            UndoIDPointer);
      RangeCheck(TimeseriesGrid.ActiveTimeseries, ALow, AHigh, RangeFlag,
        AutoLow,AutoHigh,ProbabilityLevel);
      if AutoLow then
        ShowMessage('Low limit set to:'+FloatToStr(ALow));
      if AutoHigh then
        ShowMessage('High limit set to:'+FloatToStr(AHigh));
      with TimeseriesGrid do FinalizeBuffer(ActiveIndex);
      SetControlStatus;
    finally
      Screen.Cursor := SavedCursor;
    end;
    except
      with TimeseriesGrid do RevertBuffer(ActiveIndex);
      raise;
    end;
  end;
end;

resourcestring
  rsTimeConsistensyDialogName = 'Time consistency check';
  rsTimeConsistencyMark = 'Mark time inconsistent values with flag:';
  rsTimeConsistencyHighLimit = 'Triger value:';

procedure TFrmTimeseriesGrid.MnuTimeConsistencyCheckClick(Sender: TObject);
var
  SavedCursor: TCursor;
begin
  with RangeCheckDialog do
  begin
    DialogBoxName := rsTimeConsistensyDialogName;
    LowLimitVisible := False;
    AutoLow := False;
    AutoHigh := False;
    AutoLowHighVisible := False;
    ProbabilityLevelVisible := False;
    MarkLabel := rsTimeConsistencyMark;
    HighLimitLabel := rsTimeConsistencyHighLimit;
    RangeFlag := 'TEMPORAL';
    if not Execute then Exit;
    Update;
    SavedCursor := Screen.Cursor;
    try try
      Screen.Cursor := crHourGlass;
      TimeseriesGrid.IncUndoIDPointer;
      with TimeseriesGrid do
        PrepareBuffer(ActiveIndex, ActiveTimeseries.First.Date,
          ActiveTimeseries.Last.Date, rsTimeConsistensyDialogName,
            UndoIDPointer);
      TimeConsistencyCheck(TimeseriesGrid.ActiveTimeseries, HighLimit,
        RangeFlag);
      with TimeseriesGrid do FinalizeBuffer(ActiveIndex);
      SetControlStatus;
    finally
      Screen.Cursor := SavedCursor;
    end;
    except
      with TimeseriesGrid do RevertBuffer(ActiveIndex);
      raise;
    end;
  end;
end;

resourcestring
  rsRegStepNotForMonthly = 'Step regularization may only be done for '+
    'time steps less than monthly';
  rsRegStepOnOriginal = 'Created by regularizing step of original time series:';
  rsWarningsProduced = 'The operation produced the following warnings:';
  rsWarnings = 'Warnings';

procedure TFrmTimeseriesGrid.MnuRegularizeStepClick(Sender: TObject);
var
  SavedCursor: TCursor;
  SourceTimeseries: TTimeseries;
  DestTimeseries: TTimeseries;
  Warnings: string;
begin
  SourceTimeseries := TimeseriesGrid.ActiveTimeseries;
  if SourceTimeseries.TimeStep>=tstMonthly then
    raise Exception.Create(rsRegStepNotForMonthly);
  DestTimeseries := nil;
  RegularizeStepDialog.FlagsUsed :=
    TimeseriesGrid.ActiveTimeseries.SelectionFlags;
  case SourceTimeseries.VariableType of
    vtInstantaneous, vtMaximum, vtMinimum, vtStdev, vtUnknown, vtAverage:
      RegularizeStepDialog.Method := rsmInstantaneous;
    vtCumulative: RegularizeStepDialog.Method := rsmCumulativeCStep;
    vtVectorAverage: RegularizeStepDialog.Method := rsmVector;
  else
    Assert(False);
  end;
  RegularizeStepDialog.StepMinutes := SourceTimeseries.TimeStep.LengthMinutes;
  RegularizeStepDialog.TimeOffset := SourceTimeseries.GuessNominalOffset(
     SourceTimeseries.TimeStep.LengthMinutes);
  if not RegularizeStepDialog.Execute then Exit;
  Update;
  SavedCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    DestTimeseries := TTimeseries.Create;
    with RegularizeStepDialog do
      RegularizeStep(SourceTimeseries, DestTimeseries, TimeOffset, StepMinutes,
      NewDateFlag, Method, Warnings);
    DestTimeseries.Comment :=
      rsRegStepOnOriginal+#13#10#13#10+SourceTimeseries.Comment;
    DestTimeseries.Title := SourceTimeseries.Title+'=';
    TimeseriesGrid.Add(DestTimeseries);
    TimeseriesGrid.Repaint;
    TimeseriesGrid.ActiveIndex := TimeseriesGrid.Count-1;
    DestTimeseries := nil;
  finally
    Screen.Cursor := SavedCursor;
    DestTimeseries.Free;
  end;
  if Warnings<>'' then
    MessageBox(0, PChar(rsWarningsProduced + #13#10#13#10 + Warnings),
    PChar(rsWarnings), MB_ICONEXCLAMATION);
end;

resourcestring
  rsAggrOnOriginal = 'Created by aggregating original time series:';
  rsMissingValues = 'Contains number of missing values in original time series:';
  rsAggrShouldBeStrict = 'Aggregated time series should have a strict time step';
  rsSeasonFromTo = 'Seasonal aggregation between: ';

procedure TFrmTimeseriesGrid.actionSeriesAggregationExecute(Sender: TObject);
var
  SourceSeries, DestSeries, MissingSeries: TTimeseries;
  SavedCursor: TCursor;
  AggrOptions: TAggregationOptionsRec;
begin
  SourceSeries := TimeseriesGrid.ActiveTimeseries;
  if not SourceSeries.TimeStepStrict then
    raise Exception.Create(rsAggrShouldBeStrict);
  DestSeries := nil;
  MissingSeries := nil;
  SavedCursor := Screen.Cursor;
  try
    DestSeries := TTimeseries.Create;
    AggregateSeriesDialog.Source := SourceSeries;
    AggregateSeriesDialog.Dest := DestSeries;
    DestSeries.VariableType := SourceSeries.VariableType;
    if not (DestSeries.VariableType in [vtCumulative, vtAverage, vtMinimum,
      vtMaximum, vtVectorAverage]) then
      DestSeries.VariableType := vtCumulative;
    AggregateSeriesDialog.HYearOrigin :=
      ApplicationOptions.DefaultHydrologicalYearOrigin;
    if not AggregateSeriesDialog.Execute then Exit;
    AggrOptions := AggregateSeriesDialog.Options;
    if AggrOptions.CalcMissingSeries then
      MissingSeries := TTimeseries.Create;
    Screen.Cursor := crHourGlass;
    DestSeries.TimeZone := SourceSeries.TimeZone;
    if MissingSeries<>nil then
      with MissingSeries do
      begin
        TimeStep := DestSeries.TimeStep;
        NominalOffset := DestSeries.NominalOffset;
        ActualOffset := DestSeries.ActualOffset;
        Precision := 1;
        MUnit := '';
        TimeZone := DestSeries.TimeZone;
      end;
    SourceSeries.Aggregate(DestSeries, MissingSeries, AggrOptions,
      ProgressIndicator);
    DestSeries.VarName := SourceSeries.VarName;
    DestSeries.Comment := rsAggrOnOriginal+#13#10#13#10+SourceSeries.Comment;
    with AggrOptions do
      if (SeasonalAggregation) and (DestSeries.TimeStep = tstAnnual) then
        DestSeries.Comment := DestSeries.Comment +#13#10+
        rsSeasonFromTo+LongMonthNames[FromMonth]+ ' ('+
        IntToStr(Min(Max(FromDay,1),MonthDays[False][FromMonth]))+'B) - '+
        LongMonthNames[ToMonth]+ ' ('+
        IntToStr(Min(Max(ToDay,1),MonthDays[False][ToMonth]))+'E)';
    DestSeries.Title := SourceSeries.Title+'+';
    DestSeries.MUnit := SourceSeries.MUnit;
    TimeseriesGrid.Add(DestSeries);
    DestSeries := nil;
    if MissingSeries<>nil then
    begin
      MissingSeries.Comment :=
        rsMissingValues+#13#10#13#10+SourceSeries.Comment;
      MissingSeries.Title := SourceSeries.Title+'+m';
      TimeseriesGrid.Add(MissingSeries);
      MissingSeries := nil;
    end;
    TimeseriesGrid.Repaint;
    if AggrOptions.CalcMissingSeries then
      TimeseriesGrid.ActiveIndex := TimeseriesGrid.Count-2
    else
      TimeseriesGrid.ActiveIndex := TimeseriesGrid.Count-1;
  finally
    Screen.Cursor := SavedCursor;
    StatusBar.SimpleText := '';
    DestSeries.Free;
    MissingSeries.Free;
  end;
end;

resourcestring
  rsDefineFilter = 'Define Filter';
  rsFilterPrompt = 'Only display records such that:';

procedure TFrmTimeseriesGrid.MnuSetFilterClick(Sender: TObject);
begin
  FilterDialog.Title := rsDefineFilter;
  FilterDialog.Prompt := rsFilterPrompt;
  FilterDialog.FlagsUsed := TimeseriesGrid.ActiveTimeseries.FlagsUsed;
  if not FilterDialog.Execute then Exit;
  with FilterDialog do TimeseriesGrid.SetFilter(FilterCondition, FilterValue);
  TimeseriesGrid.Filtered := True;
  SetControlStatus;
end;

procedure TFrmTimeseriesGrid.MnuFilterClick(Sender: TObject);
begin
  if TimeseriesGrid.FilterCondition = fcNone then
  begin
    MnuSetFilterClick(Sender);
    Exit;
  end;
  TimeseriesGrid.Filtered := not TimeseriesGrid.Filtered;
  SetControlStatus;
end;

procedure TFrmTimeseriesGrid.MnuCopyClick(Sender: TObject);
var SavedCursor: TCursor;
begin
  SavedCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    with TimeseriesGrid do CopyToClipboard(Selection);
  finally
    Screen.Cursor := SavedCursor;
  end;
end;

procedure TFrmTimeseriesGrid.MnuCopyWithDatesClick(Sender: TObject);
var SavedCursor: TCursor;
begin
  SavedCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    with TimeseriesGrid do CopyToClipboardWithDates(Selection);
  finally
    Screen.Cursor := SavedCursor;
  end;
end;

procedure TFrmTimeseriesGrid.MnuPasteClick(Sender: TObject);
var SavedCursor: TCursor;
begin
  SavedCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    with TimeseriesGrid do Selection := PasteFromClipboard(Selection);
  finally
    Screen.Cursor := SavedCursor;
  end;
  SetControlStatus;
end;

procedure TFrmTimeseriesGrid.mnuPasteMonthlyTableClick(Sender: TObject);
begin
  TimeseriesGrid.PasteMonthlyTable;
  SetControlStatus;
end;

procedure TFrmTimeseriesGrid.MnuPasteDailyTableClick(Sender: TObject);
begin
  TimeseriesGrid.PasteDailyTable;
  SetControlStatus;
end;

procedure TFrmTimeseriesGrid.MnuRegressionClick(Sender: TObject);
var
  DependentTimeseries: TTimeseries;
  IndependentTimeseries: TObjectList;
  i: Integer;
  RegrOpts: TRegressTimeseriesOptions;
  SavedCursor: TCursor;
  ARegressionResults: TObject;
  ATimeseries: TTimeseries;
  AOptimizationArray: TSeasonalOptimizeRegressionOptions;
  AFrmRegressionOptimizationOptions: TFrmRegressionOptimizationOptions;

  procedure InitializeOptArray(ACount: Integer; IsSeasonal: Boolean);
  var i, j: Integer;
  begin
    if IsSeasonal then SetLength(AOptimizationArray, 12) else
    SetLength(AOptimizationArray, 1);
    for i := 0 to Length(AOptimizationArray)-1 do
      with AOptimizationArray[i] do
      begin
        MaxTimeseries := 1;
        OnlyPositiveCoefficients := False;
        SetLength(TimeseriesSettings, ACount);
        for j := 0 to Length(TimeseriesSettings)-1 do
          TimeseriesSettings[j] := oroAuto;
      end;
  end;

begin
  DisposeTsSelectionArray;
  SetLength(FTSSelectionArray, 2);
  SetSelectionValue(0, 'RegressDependent');
  SetSelectionValue(1, 'RegressIndependent');
  TsprocessSelectionsDialog.SetSelectionArray(FTSSelectionArray);
  if not TsprocessSelectionsDialog.Execute then Exit;
  DependentTimeseries :=
    TimeseriesGrid.Data[FTSSelectionArray[0].Timeseries[0]];
  IndependentTimeseries := nil;
  ATimeSeries := nil;  
  SavedCursor := Screen.Cursor;
  try
    IndependentTimeseries := TObjectList.Create(False);
    for i := 0 to Length(FTSSelectionArray[1].Timeseries)-1 do
      IndependentTimeseries.Add(
        TimeseriesGrid.Data[FTSSelectionArray[1].Timeseries[i]]);
    if not RegressionDialog.Execute then Exit;
    Update;
{Get Options}
    RegrOpts := [];
    if RegressionDialog.CrossesZero then RegrOpts := RegrOpts+[rtCrossesZero];
    if RegressionDialog.Organic then RegrOpts := RegrOpts+[rtOrganic];
    if RegressionDialog.Seasonal then RegrOpts := RegrOpts+[rtSeasonal];
    if RegressionDialog.DoFilling then RegrOpts := RegrOpts+[rtDoFilling];
    if RegressionDialog.RandomTerm then RegrOpts := RegrOpts+[rtRandomTerm];
    if RegressionDialog.TruncToZero then RegrOpts := RegrOpts+[rtTruncToZero];
    if RegressionDialog.RandomSeed then RegrOpts := RegrOpts+[rtRandomSeed];
    if RegressionDialog.MeanValue then RegrOpts := RegrOpts+[rtMeanValue];
    if RegressionDialog.Optimize then RegrOpts := RegrOpts+[rtOptimize];
    if RegressionDialog.DoExtendBefore then
      RegrOpts := RegrOpts+[rtDoExtendBefore];
    if RegressionDialog.DoExtendAfter then
      RegrOpts := RegrOpts+[rtDoExtendAfter];
    if RegressionDialog.DonotFillInnerValues then
      RegrOpts := RegrOpts+[rtDonotFillInnerValues];
{Add depend to independent array only for mean value}
    if rtMeanValue in RegrOpts then
    begin
      IndependentTimeseries.Clear;
      IndependentTimeseries.Add(DependentTimeseries);
    end;
{Bring optimization parameters dialog}
    InitializeOptArray(IndependentTimeseries.Count+Abs(RegressionDialog.Lag),
      rtSeasonal in RegrOpts);
    if rtOptimize in RegrOpts then
    begin
      AFrmRegressionOptimizationOptions := nil;
      try
        AFrmRegressionOptimizationOptions :=
          TFrmRegressionOptimizationOptions.Create(Self);
        AFrmRegressionOptimizationOptions.HelpContext :=
          RegressionOptimizationHelpContext;
        AFrmRegressionOptimizationOptions.OptimizationArray :=
          AOptimizationArray;
        if AFrmRegressionOptimizationOptions.ShowModal = mrCancel then Exit;
      finally
        AFrmRegressionOptimizationOptions.Free;
      end;
    end;
{Do Regression}
    Screen.Cursor := crHourGlass;
    ARegressionResults :=
      RegressTimeseries(DependentTimeseries, IndependentTimeseries,
        RegressionDialog.Lag, RegrOpts, AOptimizationArray);
    RegrResultsDialog.HYearOrigin :=
      ApplicationOptions.DefaultHydrologicalYearOrigin;
    RegrResultsDialog.RegressionResults := ARegressionResults;
    RegrResultsDialog.DependentTimeseries := DependentTimeseries;
    RegrResultsDialog.IndependentTimeseries := IndependentTimeseries;
{Fill missing values}
    if rtDoFilling in RegrOpts then
    begin
      ATimeseries := TTimeseries.Create;
      ATimeseries.Assign(DependentTimeseries);
      TimeseriesFillMissing(IndependentTimeseries, ATimeseries,
        ARegressionResults, RegrOpts);
      TimeseriesGrid.Add(ATimeseries);
      ATimeseries := nil;
    end;
    Screen.Cursor := SavedCursor;
    RegrResultsDialog.Execute;
  finally
    for i := IndependentTimeseries.Count-1 downto 0 do
      if TimeseriesGrid.IndexOf(TTimeseries(IndependentTimeseries[i]))<0 then
        TTimeseries(IndependentTimeseries[i]).Free;
    IndependentTimeseries.Free;
    ATimeseries.Free;
    ARegressionResults.Free;
    Screen.Cursor := SavedCursor;
  end;
end;

resourcestring
  rsCreatedBySurfaceIntegration = 'Created by spatial integration';

procedure TFrmTimeseriesGrid.actionArealIntegrationExecute(Sender: TObject);
var
  ADestSeries: TTimeseries;
  ATimeseriesList: TObjectList;
  i: Integer;
begin
  DisposeTsSelectionArray;
  SetLength(FTSSelectionArray, 1);
  SetSelectionValue(0, 'ArealIntegrationTimeseries');
  TsprocessSelectionsDialog.SetSelectionArray(FTSSelectionArray);

  if not TsprocessSelectionsDialog.Execute then Exit;
  ADestSeries := nil;
  ATimeseriesList := nil;
  try
    ATimeseriesList := TObjectList.Create(False);
    for i := 0 to Length(FTSSelectionArray[0].Timeseries)-1 do
      ATimeseriesList.Add(
        TimeseriesGrid.Data[FTSSelectionArray[0].Timeseries[i]]);
    ADestSeries := TTimeseries.Create;
    if Length(FTSSelectionArray[0].Timeseries)>0 then
      ADestSeries.AssignMeta(TTimeseries(ATimeseriesList[0]));
    ADestSeries.Title := rsCreatedBySurfaceIntegration;
    ADestSeries.Comment := '';
    TimeseriesIntegrationDialog.DestinationTimeseries := ADestSeries;
    TimeseriesIntegrationDialog.TimeseriesList := ATimeseriesList;
    if TimeseriesIntegrationDialog.Execute then
    begin
      TimeseriesGrid.Add(ADestSeries);
      ADestSeries := nil;
      TimeseriesGrid.Repaint;
      TimeseriesGrid.ActiveIndex := TimeseriesGrid.Count-1;
    end;
  finally
    ADestSeries.Free;
    ATimeseriesList.Free;
    TimeseriesIntegrationDialog.DestinationTimeseries := nil;
    TimeseriesIntegrationDialog.TimeseriesList := nil;
  end;
end;

procedure TFrmTimeseriesGrid.MnuViewAsTableClick(Sender: TObject);
begin
  try
    with TimeseriesGrid do
      if DisplayFormat = dfSimple then
        DisplayFormat := dfTable
      else
        DisplayFormat := dfSimple;
  finally
    SetControlStatus;
  end;
end;

procedure TFrmTimeseriesGrid.MnuViewAsListClick(Sender: TObject);
begin
  TimeseriesGrid.DisplayFormat := dfSimple;
  SetControlStatus;
end;

procedure TFrmTimeseriesGrid.TlbtnViewAsTableClick(Sender: TObject);
begin
  try
    case TimeseriesGrid.DisplayFormat of
      dfTable: TimeseriesGrid.DisplayFormat := dfSimple;
      dfSimple: TimeseriesGrid.DisplayFormat := dfTable;
    else
      Assert(False);
    end;
  finally
    SetControlStatus;
  end;
end;

procedure TFrmTimeseriesGrid.MnuShowStatisticsClick(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  TimeseriesGrid.StatisticsVisible := TAction(Sender).Checked;
  SetControlStatus;
end;

procedure TFrmTimeseriesGrid.MnuHydrologicalYearClick(Sender: TObject);
begin
  TAction(Sender).Checked := not TAction(Sender).Checked;
  TimeseriesGrid.HydrologicalYear := TAction(Sender).Checked;
end;

resourcestring
  rsChangeProperties = 'Change properties';
  rsTimeseriesPropertiesCaption = 'Time series properties';

procedure TFrmTimeseriesGrid.MnuTimeseriesPropertiesClick(Sender: TObject);
begin
  with TimeseriesWizard do
  begin
    Caption := rsTimeseriesPropertiesCaption;
    HYearOrigin := ApplicationOptions.DefaultHydrologicalYearOrigin;
    TimeseriesGrid.IncUndoIDPointer;
    TimeseriesGrid.PrepareBuffer(TimeseriesGrid.ActiveIndex, idaEmpty, idaEmpty,
      rsChangeProperties, TimeseriesGrid.UndoIDPointer);
    MainTimeseries := TimeseriesGrid.ActiveTimeseries;
    NewTimeseriesMode := False;
    if not Execute then begin
      TimeseriesGrid.RevertBuffer(TimeseriesGrid.ActiveIndex);
      Exit;
    end;
    TimeseriesGrid.FinalizeBuffer(TimeseriesGrid.ActiveIndex);
  end;
  TimeseriesGrid.Reformat;
  TimeseriesGrid.Refresh;
  SetControlStatus;
end;

procedure TFrmTimeseriesGrid.MnuHighlightClick(Sender: TObject);
begin
  TAction(Sender).Checked := True;
  case TAction(Sender).Tag of
    0: TimeseriesGrid.HighlightMode := hlNone;
    1: TimeseriesGrid.HighlightMode := hlNull;
    2: TimeseriesGrid.HighlightMode := hlFlag;
    3: TimeseriesGrid.HighlightMode := hlMax;
    4: TimeseriesGrid.HighlightMode := hlMin;
    5: TimeseriesGrid.HighlightMode := hlMaxAndMin;
    6: TimeseriesGrid.HighlightMode := hlLarge;
    7: TimeseriesGrid.HighlightMode := hlSmall;
    8: TimeseriesGrid.HighlightMode := hlLargeAndSmall;
  else
    Assert(False);
  end;
end;

procedure TFrmTimeseriesGrid.TlbtnPreviousClick(Sender: TObject);
var
  MonthDiff: Integer;
begin
  if TAction(Sender).Tag=1 then MonthDiff := 1 else MonthDiff := -1;
  if TimeseriesGrid.ActiveTimeseries.TimeStep = tstHourly then
    MonthDiff := MonthDiff
  else if TimeseriesGrid.ActiveTimeseries.TimeStep = tstDaily then
    MonthDiff := 12*MonthDiff
  else
    Assert(False);
  TimeseriesGrid.BaseDate := IncMonth(TimeseriesGrid.BaseDate, MonthDiff);
end;

resourcestring
  rsSetValue = 'Set value';
  rsValue = 'Value:';

var ValueToSet: string = '';

procedure TFrmTimeseriesGrid.MnuSetValueClick(Sender: TObject);
var
  ARange: TIndexRange;
  i: Integer;
  SavedCursor: TCursor;
begin
  SavedCursor := Screen.Cursor;
  try try
    Screen.Cursor := crHourGlass;
    ARange := TimeseriesGrid.SelectionRange;
    if not InputQuery(rsSetValue, rsValue, ValueToSet) then Exit;
    TimeseriesGrid.IncUndoIDPointer;
    with TimeseriesGrid do
      PrepareBuffer(ActiveIndex, ActiveTimeseries.Items[ARange.StartIndex].Date,
        ActiveTimeseries.Items[ARange.EndIndex].Date, rsSetValue,
          UndoIDPointer);
    for i := ARange.EndIndex downto ARange.StartIndex do
      with TimeseriesGrid do
        if IsDateDisplayed(ActiveTimeseries.Items[i].Date) then
          ActiveTimeseries[i].AsString := ValueToSet;
    TimeseriesGrid.FinalizeBuffer(TimeseriesGrid.ActiveIndex);
    SetControlStatus;
  finally
    Screen.Cursor := SavedCursor;
  end;
  except
    TimeseriesGrid.RevertBuffer(TimeseriesGrid.ActiveIndex);
    raise;
  end;
end;

resourcestring
  rsSetFlags = 'Set Flags';

procedure TFrmTimeseriesGrid.MnuSetFlagsClick(Sender: TObject);
var
  ARange: TIndexRange;
  s: string;
  SavedCursor: TCursor;
  TurnOnFlagsList, TurnOffFlagsList: TStringList;
  OnFlagsList, MixedFlagsList: TStringList;

  procedure CreateLists;
  begin
    TurnOnFlagsList := TStringList.Create;
    TurnOffFlagsList := TStringList.Create;
    OnFlagsList := TStringList.Create;
    MixedFlagsList := TStringList.Create;
    OnFlagsList.Sorted := True;
    MixedFlagsList.Sorted := True;
    OnFlagsList.Duplicates := dupIgnore;
    MixedFlagsList.Duplicates := dupIgnore;
  end;

  procedure AssessFlags;
  var
    i, j: Integer;
  begin
    ARange := TimeseriesGrid.SelectionRange;
    i := ARange.StartIndex;
    with TimeseriesGrid do
      if IsDateDisplayed(ActiveTimeseries[i].Date) then
        s := ActiveTimeseries[i].GetAllFlags;
    for j := 1 to DelimitedStringCount(s, ' ') do
      OnFlagsList.Add(DelimitedStringItem(s, j, ' '));
    while i<=ARange.EndIndex do
    begin
      with TimeseriesGrid do
        if IsDateDisplayed(ActiveTimeseries[i].Date) then
          s := ActiveTimeseries[i].GetAllFlags;
      for j := OnFlagsList.Count-1 downto 0 do
      begin
        if not DelimitedStringContains(s, OnFlagsList[j], ' ') then
        begin
          OnFlagsList.Delete(j);
        end;
      end;
      for j := 1 to DelimitedStringCount(s, ' ') do
        MixedFlagsList.Add(DelimitedStringItem(s, j, ' '));
      Inc(i);
    end;
    for i := OnFlagsList.Count-1 downto 0 do
    begin
      j := MixedFlagsList.IndexOf(OnFlagsList[i]);
      if j>-1 then MixedFlagsList.Delete(j)
    end;
    FlagsDialog.SelectionFlags :=
      TimeseriesGrid.ActiveTimeseries.SelectionFlags;
    FlagsDialog.OnFlags := OnFlagsList.Text;
    FlagsDialog.MixedFlags := MixedFlagsList.Text;
  end;

  procedure SetFlags;
  var
    i, j: Integer;
  begin
    TurnOnFlagsList.Text := FlagsDialog.TurnOnFlags;
    TurnOffFlagsList.Text := FlagsDialog.TurnOffFlags;
    try
      TimeseriesGrid.IncUndoIDPointer;
      with TimeseriesGrid do
        PrepareBuffer(ActiveIndex, ActiveTimeseries.Items[ARange.StartIndex].Date,
          ActiveTimeseries.Items[ARange.EndIndex].Date, rsSetFlags,
            UndoIDPointer);
      for i := ARange.EndIndex downto ARange.StartIndex do
        with TimeseriesGrid do
        begin
          if not IsDateDisplayed(ActiveTimeseries[i].Date) then Continue;
          for j := 0 to TurnOnFlagsList.Count-1 do
            ActiveTimeseries[i].SetFlag(TurnOnFlagsList[j], True);
          for j := 0 to TurnOffFlagsList.Count-1 do
            ActiveTimeseries[i].SetFlag(TurnOffFlagsList[j], False);
        end;
      TimeseriesGrid.FinalizeBuffer(TimeseriesGrid.ActiveIndex);
    except
      TimeseriesGrid.RevertBuffer(TimeseriesGrid.ActiveIndex);
      raise;
    end;
  end;

begin
  SavedCursor := Screen.Cursor;
  TurnOnFlagsList := nil;
  TurnOffFlagsList := nil;
  OnFlagsList := nil;
  MixedFlagsList := nil;
  try
    Screen.Cursor := crHourGlass;
    CreateLists;
    AssessFlags;
    if not FlagsDialog.Execute then Exit;
    SetFlags;
    SetControlStatus;
  finally
    Screen.Cursor := SavedCursor;
    TurnOnFlagsList.Free;
    TurnOffFlagsList.Free;
    OnFlagsList.Free;
    MixedFlagsList.Free;
  end;
end;

resourcestring
  rsSetNullConfirmation = 'Set time series records as null?'+#13#10+
   'Press OK to proceed or Cancel to abort';
  rsSetNull = 'Set null values';

procedure TFrmTimeseriesGrid.mnuSetNullClick(Sender: TObject);
var
  ARange: TIndexRange;
  i: Integer;
  SavedCursor: TCursor;
begin
  SavedCursor := Screen.Cursor;
  try try
    Screen.Cursor := crHourGlass;
    ARange := TimeseriesGrid.SelectionRange;
    if ARange.EndIndex - ARange.StartIndex > 0 then
      if MessageDlg(rsSetNullConfirmation, mtConfirmation,
        mbOKCancel, 0) = mrCancel then
        Exit;
    TimeseriesGrid.IncUndoIDPointer;
    with TimeseriesGrid do
      PrepareBuffer(ActiveIndex, ActiveTimeseries.Items[ARange.StartIndex].Date,
        ActiveTimeseries.Items[ARange.EndIndex].Date, rsSetNull,
          UndoIDPointer);
    for i := ARange.EndIndex downto ARange.StartIndex do
      with TimeseriesGrid do
        if IsDateDisplayed(ActiveTimeseries[i].Date) then
          ActiveTimeseries[i].SetNull;
    TimeseriesGrid.FinalizeBuffer(TimeseriesGrid.ActiveIndex);
    SetControlStatus;    
  finally
    Screen.Cursor := SavedCursor;
  end;
  except
    TimeseriesGrid.RevertBuffer(TimeseriesGrid.ActiveIndex);
    raise;
  end;  
end;

resourcestring
  rsDeleteRecords = 'Delete records';

procedure TFrmTimeseriesGrid.MnuDeleteSelectedRecordsClick(Sender: TObject);
var
  ARange: TIndexRange;
  i: Integer;
  SavedCursor: TCursor;
begin
  SavedCursor := Screen.Cursor;
  try try
    Screen.Cursor := crHourGlass;
    ARange := TimeseriesGrid.SelectionRange;
    TimeseriesGrid.IncUndoIDPointer;
    with TimeseriesGrid do
      PrepareBuffer(ActiveIndex, ActiveTimeseries.Items[ARange.StartIndex].Date,
        ActiveTimeseries.Items[ARange.EndIndex].Date, rsDeleteRecords,
          UndoIDPointer);
    for i := ARange.EndIndex downto ARange.StartIndex do
      with TimeseriesGrid do
        if IsDateDisplayed(ActiveTimeseries[i].Date) then
          ActiveTimeseries.Delete(i);
    TimeseriesGrid.FinalizeBuffer(TimeseriesGrid.ActiveIndex);
    SetControlStatus;
  finally
    Screen.Cursor := SavedCursor;
  end;
  except
    TimeseriesGrid.RevertBuffer(TimeseriesGrid.ActiveIndex);
    raise;
  end;
end;

resourcestring
  rsInsertRecord = 'Insert record';
  rsRecordDate = 'Record date and time:';

procedure TFrmTimeseriesGrid.MnuInsertRecordClick(Sender: TObject);
var
  ts: TTimeseries;
  ARange: TIndexRange;
  AIndex: Integer;
  AHYearOrigin: Integer;
  s: string;
  DateFormat: string;
  ADate: TDateTime;
  Options: TGetDateFormatOptions;
  Year, Month, Day: Word;
begin
  AHYearOrigin := ApplicationOptions.DefaultHydrologicalYearOrigin;
  if TimeseriesGrid.ActiveTimeseries.TimeStep = tstAnnual then
    AHYearOrigin := TimeseriesGrid.ActiveTimeseries.NominalOffset.Months+1;
  ts := TimeseriesGrid.ActiveTimeseries;
  s := '';
  with TimeseriesGrid.ActiveTimeseries do
    if Count<1 then
    begin
      if TimeStep<tstMonthly then s := '1995/01/01 00:00'
      else if (TimeStep=tstAnnual) and (HydrologicalYear) then s := '1995-96'
      else if (TimeStep=tstAnnual) and (not HydrologicalYear) then s := '1995'
      else s := '1995/1';
    end else
      if not TimeStep.IsVariable then
      begin
        ADate := TimeStep.IncStep(Last.Date);
        DecodeDate(ADate, Year, Month, Day);
        if TimeStep<tstMonthly then DateFormat := 'yyyy/mm/dd hh:nn'
        else if (TimeStep=tstAnnual) and (HydrologicalYear) then
          DateFormat := 'aaaa-bb'
        else if (TimeStep=tstAnnual) and (not HydrologicalYear) then
          DateFormat := 'yyyy'
        else
          DateFormat := 'yyyy/mm';
        if (TimeStep=tstAnnual) and (HydrologicalYear) then
          s := Format('%4.4d-%2.2d', [Year, (Year+1) mod 100])
        else
          s := FormatDateTime(DateFormat,ADate);
      end else begin
        s:= FormatDateTime('yyyy/mm/dd hh:nn',AddDateTime(Last.Date,1/144));
      end;
  if not InputQuery(rsInsertRecord, rsRecordDate, s) then Exit;
  Options := [gdfRaiseOnFail];
  if (ts.TimeStep = tstAnnual) and (ts.HydrologicalYear) then
    Options := Options + [gdfAllowHydrologicalYear];
  DateFormat := GetDateFormat(s, Options, AHYearOrigin);
  ADate := FormatStrToDateTime(DateFormat, s, AHYearOrigin);
  try
    AIndex := TimeseriesGrid.ActiveIndex;
    TimeseriesGrid.IncUndoIDPointer;
    with TimeseriesGrid do
      PrepareBuffer(AIndex, ADate, ADate, rsInsertRecord, UndoIDPointer);
    ARange.StartIndex := ts.Insert(ADate, True, 0, '', msNew);
    ARange.EndIndex := ARange.StartIndex;
    {Count>1, a workarround for newly created time series, missing
     rows, some times an exception occurs...
    }
    if TimeseriesGrid.ActiveTimeseries.Count>1 then
      TimeseriesGrid.SelectionRange := ARange;
    TimeseriesGrid.SetFocus;
    TimeseriesGrid.FinalizeBuffer(AIndex);
    SetControlStatus;
  except
    TimeseriesGrid.RevertBuffer(AIndex);
    raise;
  end;
end;

resourcestring
  rsInsertMultiRecords = 'Insert multiple records';
  rsHowManyToAdd =
    'Enter the number of records to add after the last record of'+
    ' the time series (to add records above the first record, enter a '+
    'negative number';
  rsTimeSeriesMustBeNotEmpty = 'To add multiple records, at least one record'+
    ' may exist, so new records are added after the last record';
  rsTimeSeriesMustBeofTimeStep =
    'To add multiple records, time series must be of'+
    ' ten minute, hourly, daily, monthly or annual time step';

procedure TFrmTimeseriesGrid.mnuInsertMultiRecordsClick(Sender: TObject);
var
  ATimeSeries: TTimeseries;
  ARange: TIndexRange;
  AString: string;
  ADate: TDateTime;
  ADateList: TDateTimeList;
  countRecordsToAdd: Integer;
  i: Integer;
  AIndex: Integer;
  ACursor: TCursor;
begin
  ATimeSeries := TimeseriesGrid.ActiveTimeseries;
  AString := '10';
  AIndex :=0; {Dummy initialization to avoid compiler warning messages}
  if ATimeSeries.TimeStep.IsVariable then raise
    Exception.Create(rsTimeSeriesMustBeofTimeStep);
  if not InputQuery(rsInsertMultiRecords, rsHowManyToAdd, AString) then Exit;
  countRecordsToAdd := StrToInt(AString);
  if countRecordsToAdd = 0 then Exit;
  if ATimeSeries.Count<1 then
    raise Exception.Create(rsTimeSeriesMustBeNotEmpty);
  ADateList := nil;
  ACursor := Screen.Cursor;
  try try
    Screen.Cursor := crHourGlass;
    ADateList := TDateTimeList.Create;
    if countRecordsToAdd>0 then
      ADate := ATimeSeries.Last.Date else
      ADate := ATimeseries.First.Date;
    for i := 0 to Abs(countRecordsToAdd)-1 do
    begin
      if countRecordsToAdd>0 then
        ADate := ATimeseries.TimeStep.IncStep(ADate) else
        ADate := ATimeseries.TimeStep.DecStep(ADate);
      ADateList.InsertSorted(ADate);
    end;
    TimeseriesGrid.IncUndoIDPointer;
    with TimeseriesGrid do
      PrepareBuffer(ActiveIndex, ADateList.First, ADateList.Last,
        rsInsertMultiRecords, UndoIDPointer);
    for i := 0 to ADateList.Count-1 do
    begin
      AIndex := ATimeSeries.Insert(ADateList[i], True, 0, '', msNew);
      if i = 0 then
        ARange.StartIndex := AIndex;
    end;
    ARange.EndIndex := AIndex;
    TimeseriesGrid.SelectionRange := ARange;
    TimeseriesGrid.SetFocus;
    TimeseriesGrid.FinalizeBuffer(TimeseriesGrid.ActiveIndex);
    SetControlStatus;
  finally
    Screen.Cursor := ACursor;
    ADateList.Free;
  end;
  except
    TimeseriesGrid.RevertBuffer(TimeseriesGrid.ActiveIndex);
    raise;
  end;
end;


procedure TFrmTimeseriesGrid.MnuSelectTimeseriesClick(Sender: TObject);
var AGridRect: TGridRect;
begin
  AGridRect.Top := Min(1, TimeseriesGrid.RowCount-1);
  AGridRect.Bottom := TimeseriesGrid.RowCount-1;
  if not TimeseriesGrid.FlagsVisible then
  begin
    AGridRect.Left := TimeseriesGrid.ActiveIndex+1;
    AGridRect.Right := AGridRect.Left;
  end else
  begin
    AGridRect.Left := TimeseriesGrid.ActiveIndex*2+1;
    AGridRect.Right := AGridRect.Left+1;
  end;
  TimeseriesGrid.Selection := AGridRect;
end;

procedure TFrmTimeseriesGrid.TimeseriesGridContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var ARect: TGridRect;
begin
  Handled := False;

  { If more than a cell selected, exit immediately. }
  with TimeseriesGrid.Selection do
    if (Right-Left>0) or (Bottom-Top>0) then Exit;

  { Otherwise, select cell at mouse coordinates. }
  ARect.TopLeft := TimeseriesGrid.MouseCoord(MousePos.X, MousePos.Y);
  ARect.BottomRight := ARect.TopLeft;
  if (ARect.Top>0) and (ARect.Left>0) then
    TimeseriesGrid.Selection := ARect;
end;

procedure TFrmTimeseriesGrid.TimeseriesGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
{ this is a work arround for the Bug 2896, when changing first
  or last record, in some cases, does not update the undo / redo
  controls as apropriate.
}
  with TimeseriesGrid do
    if DisplayFormat = dfSimple then
      SetControlStatus;
end;

function TFrmTimeseriesGrid.IsModified: Boolean;
var i: Integer;
begin
  i := TimeseriesGrid.Count-1;
  while i>=0 do
  begin
    if TimeseriesGrid.Data[i].Modified then Break;
    Dec(i);
  end;
  if i>=0 then
    Result := True else
    Result := False;
end;

resourcestring
  rsEvapMissingTimeseries = 'Missing time series for evapotranspiration '+
    'calculations. You have to include humidity, windspeed and '+
      'sunshine timeseries.';
  rsEvaporation = 'Evaporation';
  rsEvapotraspiration = 'Evapotranspiration';
  rsRequiredMonthlyTS = 'A monthly time step is required to calculate '+
    'evaporation';
  rsPenman = ' (Penman)';
  rsPenmanMonteith = ' (Penman-Monteith)';
  rsThornthwaite = ' (Thornthwaite)';
  rsBlaneyCriddle = ' (Blaney-Criddle)';
  rsHargreaves = ' (Hargreaves)';
  rsParametric = ' (Parametric)';

procedure TFrmTimeseriesGrid.MnuEvaporationClick(Sender: TObject);
var
  AirTempSeries, RelHumSeries, WindSpSeries, SunDurSeries, AirMaxSeries,
    AirMinSeries: TTimeseries;
  Dest: TTimeseries;
  PenmanOptions: TPenmanOptions;
begin
  DisposeTsSelectionArray;
  SetLength(FTSSelectionArray, 7);
  SetSelectionValue(0, 'EvapTemp');
  SetSelectionValue(1, 'EvapRH');
  SetSelectionValue(2, 'EvapWS');
  SetSelectionValue(3, 'EvapSS');
  SetSelectionValue(4, 'EvapCT');
  SetSelectionValue(5, 'EvapMaxT');
  SetSelectionValue(6, 'EvapMinT');
  TsprocessSelectionsDialog.SetSelectionArray(FTSSelectionArray);
  if not TsprocessSelectionsDialog.Execute then Exit;
  if Length (FTSSelectionArray[0].Timeseries)>0 then
    PenmanDialog.TemperatureIndex := FTSSelectionArray[0].Timeseries[0] else
      PenmanDialog.TemperatureIndex := -1;
  if Length (FTSSelectionArray[4].Timeseries)>0 then
    PenmanDialog.EvaporationIndex := FTSSelectionArray[4].Timeseries[0] else
      PenmanDialog.EvaporationIndex := -1;
  if not PenmanDialog.Execute then Exit;
  case PenmanDialog.MonthlyDay of
    0: PenmanOptions.MonthlyDay := pmodRepresentative;
    1: PenmanOptions.MonthlyDay := pmodMiddle;
  else
    Assert(False);
  end;
  case PenmanDialog.CalculationType of
  0,1:
  begin
    case PenmanDialog.CalculationType of
      0: PenmanOptions.EvapMode := pevmPenman;
      1: PenmanOptions.EvapMode := pevmPenmanMonteith;
    else
      Assert(False);
    end;
    case Penmandialog.SunshineType of
      0: PenmanOptions.SunDurMode := psdmDuration;
      1: PenmanOptions.SunDurMode := psdmPercentage;
      2: PenmanOptions.SunDurMode := psdmRadiation;
    else
      Assert(False);
    end;
    RelHumSeries := nil;
    WindSpSeries := nil;
    SunDurSeries := nil;
    AirTempSeries := TimeseriesGrid.Data[FTsSelectionArray[0].Timeseries[0]];
    if Length(FTsSelectionArray[1].Timeseries)>0 then
      RelHumSeries := TimeseriesGrid.Data[FTsSelectionArray[1].Timeseries[0]];
    if Length(FTsSelectionArray[2].Timeseries)>0 then
      WindSpSeries := TimeseriesGrid.Data[FTsSelectionArray[2].Timeseries[0]];
    if Length(FTsSelectionArray[3].Timeseries)>0 then
      SunDurSeries := TimeseriesGrid.Data[FTsSelectionArray[3].Timeseries[0]];
    if (RelHumSeries=nil) or (WindSpSeries=nil) or (SunDurSeries=nil) then
      raise Exception.Create(rsEvapMissingTimeseries);
    Update;
    Dest := nil;
    try
      Dest := TTimeseries.Create;
      with PenmanDialog do
        CalcPenmanEvap(Dest, AirTempSeries, RelHumSeries,
          WindSpSeries, SunDurSeries, Latitude, Altitude, Albedo, a_e, b_e, a_L,
            b_L, a_s, b_s, PenmanOptions);
      case PenmanOptions.EvapMode of
        pevmPenman: Dest.Title := rsEvaporation+rsPenman;
        pevmPenmanMonteith: Dest.Title := rsEvapotraspiration+rsPenmanMonteith;
      else
        Assert(False);
      end;
      TimeseriesGrid.Add(Dest);
      Dest := nil;
    finally
      Dest.Free;
    end;
  end;
  2:
  begin
    if TimeseriesGrid.Count<1 then Exit;
    if TimeseriesGrid.Data[FTsSelectionArray[0].Timeseries[0]].Count<1 then
      Exit;
    if TimeseriesGrid.Data[FTsSelectionArray[0].Timeseries[0]].TimeStep <>
      tstMonthly then raise Exception.Create(rsRequiredMonthlyTS);
    AirTempSeries := TimeseriesGrid.Data[FTsSelectionArray[0].Timeseries[0]];
    Update;
    Dest := nil;
    try
      Dest := TTimeseries.Create;
      with PenmanDialog do
        CalcThornthwaiteEvap(Dest, AirTempSeries, Latitude,
          CalcThornthwaiteIota(AirTempSeries));
      Dest.Title := rsEvapotraspiration+rsThornthwaite;
      TimeseriesGrid.Add(Dest);
      Dest := nil;
    finally
      Dest.Free;
    end;
  end;
  3:
  begin
    if TimeseriesGrid.Count<1 then Exit;
    if TimeseriesGrid.Data[FTsSelectionArray[0].Timeseries[0]].Count<1 then
      Exit;
    if TimeseriesGrid.Data[FTsSelectionArray[0].Timeseries[0]].TimeStep <>
      tstMonthly then raise Exception.Create(rsRequiredMonthlyTS);
    AirTempSeries := TimeseriesGrid.Data[FTsSelectionArray[0].Timeseries[0]];
    Update;
    Dest := nil;
    try
      Dest := TTimeseries.Create;
      with PenmanDialog do
        CalcBlaneyCriddleEvap(Dest, AirTempSeries, Latitude,
          CropCoefficient);
      Dest.Title := rsEvapotraspiration+rsBlaneyCriddle;
      TimeseriesGrid.Add(Dest);
      Dest := nil;
    finally
      Dest.Free;
    end;
  end;
  4:
  begin
    if TimeseriesGrid.Count<1 then Exit;
    if TimeseriesGrid.Data[FTsSelectionArray[0].Timeseries[0]].Count<1 then
      Exit;
    AirMaxSeries := nil;
    AirMinSeries := nil;
    AirTempSeries := TimeseriesGrid.Data[FTsSelectionArray[0].Timeseries[0]];
    if Length(FTsSelectionArray[5].Timeseries)>0 then
      AirMaxSeries := TimeseriesGrid.Data[FTsSelectionArray[5].Timeseries[0]];
    if Length(FTsSelectionArray[6].Timeseries)>0 then
      AirMinSeries := TimeseriesGrid.Data[FTsSelectionArray[6].Timeseries[0]];
    Update;
    Dest := nil;
    try
      Dest := TTimeseries.Create;
      with PenmanDialog do
        CalcHargreavesEvap(Dest, AirTempSeries, AirMaxSeries, AirMinSeries,
          Latitude, PenmanOptions.MonthlyDay);
      Dest.Title := rsEvapotraspiration+rsHargreaves;
      TimeseriesGrid.Add(Dest);
      Dest := nil;
    finally
      Dest.Free;
    end;
  end;
  5:
  begin
    if TimeseriesGrid.Count<1 then Exit;
    if TimeseriesGrid.Data[FTsSelectionArray[0].Timeseries[0]].Count<1 then
      Exit;
    AirTempSeries := TimeseriesGrid.Data[FTsSelectionArray[0].Timeseries[0]];
    Update;
    Dest := nil;
    try
      Dest := TTimeseries.Create;
      with PenmanDialog do
        CalcParametricEvap(Dest, AirTempSeries, Latitude,
          Alpha, Beta, Ce, PenmanOptions.MonthlyDay);
      Dest.Title := rsEvaporation+rsParametric;
      TimeseriesGrid.Add(Dest);
      Dest := nil;
    finally
      Dest.Free;
    end;
  end;
  else
    Assert(False);
  end;
end;

resourcestring
  rsNewTimeseriesCaption = 'New time series';

procedure TFrmTimeseriesGrid.MnuNewTimeseriesClick(Sender: TObject);
var
  ATimeseries: TTimeseries;
begin
  ATimeseries := nil;
  try
    ATimeseries := TTimeseries.Create;
    ATimeseries.TimeZone := ApplicationOptions.DefaultTimeZone;
    with TimeseriesWizard do begin
      NewTimeseriesMode := True;
      TemplatesDir := ApplicationOptions.AppDataSeriesTemplatesFolder;
      MainTimeseries := ATimeseries;
      Caption := rsNewTimeseriesCaption;
      HYearOrigin := ApplicationOptions.DefaultHydrologicalYearOrigin;
    end;
    if TimeseriesWizard.Execute then
    begin
      TimeseriesGrid.Add(ATimeseries);
      ATimeseries := nil;
      TimeseriesGrid.Update; // Needs to redisplay itself to register the change
                             // of number of columns before changing ActiveIndex;
                             // possibly a tsgrid bug.
      TimeseriesGrid.ActiveIndex := TimeseriesGrid.Count-1;
      SetFocusedControl(TimeseriesGrid);
      SetFocus;
    end;
  finally
    ATimeseries.Free;
    SetControlStatus;
  end;
end;

resourcestring
  rsConstantCoefficients = 'Constant Coefficient';
  rsCreatedByLinComb = 'Created by Linear Comb';

procedure TFrmTimeseriesGrid.MnuLinCombClick(Sender: TObject);

var
    TimeSeriesList: TObjectlist;
    TimeseriesBuffer, ATimeseries: TTimeseries;
    AllRecords: TDateTimeList;
    VectCoef: TVector;
    i: Integer;
    ACursor: TCursor;

begin

  // Constant conefficient and coefficients for series in TimeseriesGrid
  LinearCombinationDialog.CoefficientCount:=TimeseriesGrid.Count+1;

  // Give titles of time series to LinearCombinationDialog
  LinearCombinationDialog.CoefficientTitles[0] := rsConstantCoefficients;
  for i:=1 to TimeseriesGrid.Count do
    LinearCombinationDialog.CoefficientTitles[i] :=
      TimeseriesGrid.Data[i-1].Title;

  // Show the linear combinations form
  if not LinearCombinationDialog.Execute then Exit;
  Update;

  // Catch exeptions
  TimeseriesBuffer := nil;
  ATimeseries := nil;
  TimeseriesList := nil;
  AllRecords := nil;
  VectCoef := nil;
  ACursor := Screen.Cursor;
  try

    Screen.Cursor := crHourglass;
    // Allocate memory
    TimeseriesBuffer:=TTimeseries.Create;
    ATimeseries := TTimeseries.Create;
    TimeSeriesList:=TObjectlist.Create(False);
    VectCoef:=TVector.Create(TimeseriesGrid.Count+1);

    // Make arguments of TimseriesLinComb method
    for i:=0 to TimeseriesGrid.Count do
      VectCoef[i+1]:=LinearCombinationDialog.Coefficients[i];
    for i:= 0 to TimeseriesGrid.Count-1 do
      if VectCoef[i+2]<>0 then
        TimeSeriesList.Add(TimeseriesGrid.Data[i]);
    for i := VectCoef.Size-1 downto 2 do
      if VectCoef[i] = 0 then VectCoef.Shift(i+1, VectCoef.Size, -1);
    AllRecords := GetAllRecords(TimeSeriesList, 0);
     // Call TimeseriesLinComb
    TimeseriesLinComb(TimeseriesBuffer, TimeSeriesList, VectCoef);

     // Add the newly created time series to TimeseriesGrid
    FLincomb := FLincomb+1;
    TimeseriesBuffer.Title:='Lin comb ' + IntToStr(FLincomb);
    TimeseriesBuffer.Comment := rsCreatedByLinComb;
    ATimeseries.AssignMeta(TimeseriesBuffer);
    for i := 0 to AllRecords.Count-1 do
    begin
      ATimeseries.Add(AllRecords[i], True, 0, '', msNew);
      if TimeseriesBuffer.IndexOf(AllRecords[i])<0 then Continue;
      ATimeseries.Last.AsFloat :=
        TimeseriesBuffer[TimeseriesBuffer.IndexOf(AllRecords[i])].AsFloat;
    end;
    TimeseriesGrid.Add(ATimeseries);
    ATimeseries := nil;              // Do not destroy this object
    TimeseriesGrid.Repaint;
    TimeseriesGrid.ActiveIndex := TimeseriesGrid.Count-1;
  finally
    Screen.Cursor := ACursor;
    VectCoef.Free;
    TimeseriesList.Free;
    TimeseriesBuffer.Free;
    AllRecords.Free;
    ATimeseries.Free;
  end;
end;

procedure TFrmTimeseriesGrid.MnuGraphsClick(Sender: TObject);
var
  ARange: TGridRect;
  i: Integer;
begin
  TimeSeriesGraphForm.AllowDifferentUnits := actionAllowDifferentUnits.Checked;
  if not TimeSeriesGraphForm.Visible then
  begin
    TimeSeriesGraphForm.Show;
  end else
  begin
    if TimeSeriesGraphForm.WindowState = wsMinimized then
      TimeSeriesGraphForm.WindowState := wsNormal;
    TimeSeriesGraphForm.BringToFront;
  end;
  if (TimeSeriesGrid.DisplayFormat = dfSimple) and
    (not Timeseriesgrid.FlagsVisible) then
  begin
    ARange := TimeSeriesGrid.Selection;
    for i := ARange.Left to ARange.Right do
      TimeSeriesGraphForm.Add(TimeSeriesGrid.Data[i-1]);
  end else
    TimeSeriesGraphForm.Add(TimeSeriesGrid.ActiveTimeseries);
{ Run activate in order to avoid bug 2761... It works, I don't know why!
  Maybe it turns on the form and columns and rows from time series grid
  are read correctly}
  Activate;
end;

procedure TFrmTimeseriesGrid.MnuGraphRemoveTimeSeriesClick(
  Sender: TObject);
var
  ARange: TGridRect;
  i: Integer;
begin
  if (TimeSeriesGrid.DisplayFormat = dfSimple) and
    (not Timeseriesgrid.FlagsVisible) then
  begin
    ARange := TimeSeriesGrid.Selection;
    for i := ARange.Left to ARange.Right do
      TimeSeriesGraphForm.Remove(TimeSeriesGrid.Data[i-1]);
  end else
    TimeSeriesGraphForm.Remove(TimeSeriesGrid.ActiveTimeseries);
  TimeSeriesGraphForm.BringToFront;
end;

procedure TFrmTimeseriesGrid.MnuClearGraphClick(Sender: TObject);
begin
  if TimeSeriesGraphForm.Visible then
  begin
    TimeSeriesGraphForm.ClearArea;
    TimeSeriesGraphForm.BringToFront;
  end;
end;

procedure TFrmTimeseriesGrid.MnuAllowDifferentUnitsClick(Sender: TObject);
begin
  actionAllowDifferentUnits.Checked := not actionAllowDifferentUnits.Checked;
  TimeSeriesGraphForm.AllowDifferentUnits := actionAllowDifferentUnits.Checked;
end;

procedure TFrmTimeseriesGrid.MnuInterpolationsClick(Sender: TObject);
begin
  DisposeTsSelectionArray;
  SetLength(FTSSelectionArray, 4);
  SetSelectionValue(0, 'SDDense');
  SetSelectionValue(1, 'SDSparse');
  SetSelectionValue(2, 'SDHQStage');
  SetSelectionValue(3, 'SDHQDisch');
  TsprocessSelectionsDialog.SetSelectionArray(FTSSelectionArray);
  if not TsprocessSelectionsDialog.Execute then Exit;
  if Length(FTSSelectionArray[0].Timeseries)>0 then
    StageDischargeDialog.DenseTSIndex := FTSSelectionArray[0].Timeseries[0] else
    StageDischargeDialog.DenseTSIndex := -1;
  if Length(FTSSelectionArray[1].Timeseries)>0 then
    StageDischargeDialog.SparseTSIndex :=
      FTSSelectionArray[1].Timeseries[0] else
    StageDischargeDialog.SparseTSIndex := -1;
  if Length(FTSSelectionArray[2].Timeseries)>0 then
    StageDischargeDialog.HQStageTSIndex :=
      FTSSelectionArray[2].Timeseries[0] else
    StageDischargeDialog.HQStageTSIndex := -1;
  if Length(FTSSelectionArray[3].Timeseries)>0 then
    StageDischargeDialog.HQDischTSIndex :=
      FTSSelectionArray[3].Timeseries[0] else
    StageDischargeDialog.HQDischTSIndex := -1;
  StageDischargeDialog.Execute;
end;

procedure TFrmTimeseriesGrid.MnuEditClick(Sender: TObject);
var
  CanEnable: Boolean;
begin
  CanEnable := False;
  if TimeSeriesGrid.Count > 0 then
    try
      if (StrLen(PChar((Clipboard.AsText))))>0 then
        CanEnable := True;
    except
      on EClipboardException do
        CanEnable := False;
      else
        raise;
    end;
  actionPaste.Enabled := CanEnable;
  actionPasteMonthlyTable.Enabled := CanEnable;
  actionPasteDailyTable.Enabled := CanEnable;
end;

procedure TFrmTimeseriesGrid.TimeseriesGridClick(Sender: TObject);
begin
    SetControlStatus;
end;

procedure TFrmTimeseriesGrid.TimeseriesGridColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
  SetControlStatus;
end;

resourcestring
  rsOperationPermitedOnMonthlyYearly = 'Operation permited only in '+
    'time series with monthly or yearly time step.';

procedure TFrmTimeseriesGrid.mnuStatsClick(Sender: TObject);
begin
  StatisticsForm.HYearOrigin :=
    ApplicationOptions.DefaultHydrologicalYearOrigin;
  StatisticsForm.Timeseries := TimeseriesGrid.ActiveTimeseries;
  StatisticsForm.Execute;
end;

resourcestring
  rsTimeseriesMustBeOfTheSameTimeStep =
    'Time series must be of the same time step';
  rsTimeseriesMustBeOfAnnualOrMonthlyTimeStep =
    'Time series must be of annual or monthly time step';
  rsTimeseriesShouldBeStrict =
    'Time series to reduce %d (%s) has been discarded from calculations since '+
      'it should have smaller and strict time step';
  rsHomegen = ' - Homogen.';

procedure TFrmTimeseriesGrid.MnuDoubleMassCurveClick(Sender: TObject);
var
  ATimeseries, Destination: TTimeseries;
  AObjectList: TObjectList;
  SavedCursor: TCursor;
  i, j: Integer;
begin
  SavedCursor := Screen.Cursor;
  DisposeTsSelectionArray;
  SetLength(FTSSelectionArray, 3);
  SetSelectionValue(0, 'DblMassIndep');
  SetSelectionValue(1, 'DblMassDep');
  SetSelectionValue(2, 'DblMassReduce');
  TsprocessSelectionsDialog.SetSelectionArray(FTSSelectionArray);
  if not TsprocessSelectionsDialog.Execute then Exit;
  Destination := nil;
  AObjectList := nil;
  try
    AObjectList := TObjectList.Create(False);
    if TimeseriesGrid.Data[FTSSelectionArray[0].Timeseries[0]].TimeStep <>
      TimeseriesGrid.Data[FTSSelectionArray[1].Timeseries[0]].TimeStep then
      raise Exception.Create(rsTimeseriesMustBeOfTheSameTimeStep);
    if not (TimeseriesGrid.Data[FTSSelectionArray[0].Timeseries[0]].TimeStep>=
      tstMonthly) then
        raise Exception.Create(rsTimeseriesMustBeOfAnnualOrMonthlyTimeStep);
    DoubleMassDialog.DependentTimeseries :=
      TimeseriesGrid.Data[FTSSelectionArray[1].Timeseries[0]];
    DoubleMassDialog.IndependentTimeseries :=
      TimeseriesGrid.Data[FTSSelectionArray[0].Timeseries[0]];
    Destination := TTimeseries.Create;
    DoubleMassDialog.DestinationTimeseries := Destination;
    if DoubleMassDialog.Execute then
    begin
      Screen.Cursor := crHourGlass;
      Destination.Title := Destination.Title + rsHomegen;
      TimeseriesGrid.Add(Destination);
      ATimeseries := nil;
      for j := 0 to Length(FTSSelectionArray[2].Timeseries)-1 do
      begin
        try
          ATimeseries := TTimeseries.Create;
          ATimeseries.Assign(
            TimeseriesGrid.Data[FTSSelectionArray[2].Timeseries[j]]);
          ATimeseries.Title := ATimeseries.Title + rsHomegen;
          if (ATimeseries.TimeStep>=
            TimeseriesGrid.Data[FTSSelectionArray[0].Timeseries[0]].TimeStep)
            or (not ATimeseries.TimeStepStrict) then
            ShowMessage(Format(rsTimeseriesShouldBeStrict, [j+1,
              ATimeseries.Title]))
          else
          begin
            TimeseriesGrid.Add(ATimeseries);
            AObjectList.Add(ATimeseries);
            ATimeseries := nil;
          end;
        finally
          ATimeseries.Free;
        end;
      end;
      try
        ReduceDblMassSeveralTimeseries(
            TimeseriesGrid.Data[FTSSelectionArray[1].Timeseries[0]],
              Destination, AObjectList);
      finally
        Destination := nil;
        Update;
      end;
    end;
  finally
    Screen.Cursor := SavedCursor;
    Destination.Free;
    AObjectList.Free;
  end;
end;

resourcestring
  rsQuickCountIs = 'Count of not null cells = ';
  rsQuickSumIs = 'Sum = ';
  rsQuickMeanIs = 'Mean value = ';
  rsQuickMinIs = 'Min value = ';
  rsQuickMaxIs = 'Max value = ';

procedure TFrmTimeseriesGrid.mnuQuickSumClick(Sender: TObject);
var
  i, j, ACount: Integer;
  AValue, AMin, AMax, ASum: Real;
  ATsRecord: TTsRecord;
  AString, AMeanValueText: string;
  ACursor: TCursor;
begin
  ASum := 0;
  ACount := 0;
  AMin := 1e37;
  AMax := -1e37;
  ACursor := Screen.Cursor;
  try
    Screen.Cursor := crHourglass;
    for i:= TimeseriesGrid.Selection.Left to TimeseriesGrid.Selection.Right do
    begin
      for j:= TimeseriesGrid.Selection.Top to TimeseriesGrid.Selection.Bottom do
      begin
        try
          AValue :=  StrToFloat(TimeseriesGrid.GetCellText(i, j, ATsRecord));
          ASum := ASum + AValue;
          if AValue < AMin then AMin := AValue;
          if AValue > AMax then AMax := AValue;
          Inc(ACount);
        except
          On EConvertError do Continue else
            raise;
        end;
      end;
    end;
  finally
    Screen.Cursor := ACursor;
  end;
  AMeanValueText := '';
  if ACount>0 then
    AMeanValueText := FormatFloat('0.00', ASum/ACount);
  AString := rsQuickSumIs + FormatFloat('0.00',ASum)+ #13#10+
    rsQuickCountIs + IntToStr(ACount)+ #13#10+
    rsQuickMeanIs +  AMeanValueText+ #13#10+
    rsQuickMinIs + FormatFloat('0.00',AMin)+ #13#10+
    rsQuickMaxIs + FormatFloat('0.00',AMax);
  ShowMessage(AString);
end;

resourcestring
  rsPeriod = 'Period: ';

procedure TFrmTimeseriesGrid.mnuPrintClick(Sender: TObject);
var
  ATsRecord: TTsRecord;
begin
  if TimeseriesGrid.DisplayFormat = dfSimple then
  begin
    DmdRavreports.RvProject.SelectReport('rpTimeseriesGridSimple',False);
  end
  else
  begin
    TimeseriesGrid.StatisticsVisible := True;
    if TimeseriesGrid.ActiveTimeseries.TimeStep.TimeStepIn([tstMonthly,
      tstDaily]) then
      DmdRavreports.RvProject.SelectReport('rpTimeseriesTableMonthly',False)
    else if TimeseriesGrid.ActiveTimeseries.TimeStep = tstHourly then
      DmdRavreports.RvProject.SelectReport('rpTimeseriesTableDaily',False)
    else
      Assert(False);
  end;
  DmdRavreports.RvProject.SetParam('tsgridrepID',
    IntToStr(TimeseriesGrid.ActiveTimeseries.id));
  DmdRavreports.RvProject.SetParam('tsgridrepComments',
    TimeseriesGrid.ActiveTimeseries.Comment);
  if TimeseriesGrid.DisplayFormat = dfSimple then
    DmdRavreports.RvProject.SetParam('tsgridtableMonthly', '') else
    if TimeseriesGrid.ActiveTimeseries.TimeStep = tstMonthly then
      DmdRavreports.RvProject.SetParam('tsgridtableMonthly', '') else
        DmdRavreports.RvProject.SetParam('tsgridtableMonthly',
          rsPeriod+TimeseriesGrid.GetCellText(0, 0, ATsRecord));
  DmdRavreports.RvProject.Execute;
end;

resourcestring
  rsExtremeHeight =  'Extreme height';
  rsExtremeIntensity = 'Extreme intensity';
  rsExtremesAccumulatedFrom = 'Accumulated values from ';
  rsminIntervals = ' minutes Intervals';
  rsPercentMissing = 'Missing values (%)';
  rsDayNumber = 'Day number';

procedure TFrmTimeseriesGrid.mnuExtremesEvaluationClick(Sender: TObject);
var
  ATimeseries: TTimeseries;
  AMissingTimeseries: TTimeseries;
  ADayNumberTimeseries: TTimeseries;
  Options: TIDFOptions;
  ACursor: TCursor;
  BaseTimeStep: Integer;
begin
  ACursor := Screen.Cursor;
  ATimeseries := nil;
  AMissingTimeseries := nil;
  ADayNumberTimeseries := nil;
  try
    if not IDFEvaluationDialog.Execute then
      Exit;
    Screen.Cursor := crHourglass;
    ATimeseries := TTimeseries.Create;
    Options := [];
    with IDFEValuationDialog do
    begin
      ATimeseries.TimeStep := IDFEValuationDialog.AnalysisTimestep;
      ATimeseries.VariableType := vtMaximum;      
      if not CalculateIntensity then
      begin
        ATimeseries.Title := rsExtremeHeight;
        ATimeseries.MUnit := 'mm';
      end else begin
        ATimeseries.Title := rsExtremeIntensity;
        ATimeseries.MUnit := 'mm/h';
      end;
      FlagsUsed := TimeseriesGrid.ActiveTimeseries.SelectionFlags;
      BaseTimeStep := TimeseriesGrid.ActiveTimeseries.TimeStep.LengthMinutes;
      ATimeseries.Comment := rsExtremesAccumulatedFrom+
        IntToStr(BaseTimeStep*Multiplier)+rsminIntervals;
      ATimeseries.TimeZone := TimeseriesGrid.ActiveTimeseries.TimeZone;
      if IDFEvaluationDialog.CalculateIntensity then
        Options := Options + [idfoIntensity];
      if IDFEvaluationDialog.HydrologicalYear then
      begin
        Options := Options + [idfoHydrologicalYear];
        if ATimeseries.TimeStep = tstYearly then
          ATimeseries.SetHydrologicalYear(True);
      end;
      if IDFEvaluationDialog.AllowMissing then
        Options := Options + [idfoAllowMissing];
      if CalculateMissingTimeseries then
      begin
        AMissingTimeseries := TTimeseries.Create;
        AMissingTimeseries.Assign(ATimeseries);
        AMissingTimeseries.Title := rsPercentMissing;
        AMissingTimeseries.MUnit := '%';
      end;
      if CalculateDayNumberTimeseries then
      begin
        ADayNumberTimeseries := TTimeseries.Create;
        ADayNumberTimeseries.Assign(ATimeseries);
        ADayNumberTimeseries.Title := rsDayNumber;
        ADayNumberTimeseries.Precision := 0;
      end;
      TimeseriesToSingleIDF( TimeseriesGrid.ActiveTimeseries, ATimeseries,
        AMissingTimeseries, ADayNumberTimeseries, Multiplier, AnalysisTimeStep,
        Options, MissingFlag, MarginalFlag);
      TimeseriesGrid.Add(ATimeseries);
      if CalculateMissingTimeseries then
        TimeseriesGrid.Add(AMissingTimeseries);
      if CalculateDayNumberTimeseries then
        TimeseriesGrid.Add(ADayNumberTimeseries);
    end;
    ATimeseries := nil;
    AMissingTimeseries := nil;
    ADayNumberTimeseries := nil;
  finally
    ATimeseries.Free;
    AMissingTimeseries.Free;
    ADayNumberTimeseries.Free;
    Screen.Cursor := ACursor;
  end;
end;

procedure TFrmTimeseriesGrid.MnuIDFCurvesClick(Sender: TObject);
begin
  SetIDFTSDialog.Execute;
end;

procedure TFrmTimeseriesGrid.MnuCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTimeseriesGrid.mnuSimpleHydroModelClick(Sender: TObject);
begin
  DisposeTsSelectionArray;
  SetLength(FTSSelectionArray, 4);
  SetSelectionValue(0, 'ZygosRainfall');
  SetSelectionValue(1, 'ZygosEvaporation');
  SetSelectionValue(2, 'ZygosPumping');
  SetSelectionValue(3, 'ZygosRunoff');
  TsprocessSelectionsDialog.SetSelectionArray(FTSSelectionArray);
  if not TsprocessSelectionsDialog.Execute then Exit;
  if Length(FTSSelectionArray[0].Timeseries)>0 then
    SimpleHydroModel.RainfallIndex := FTSSelectionArray[0].Timeseries[0] else
      SimpleHydroModel.RainfallIndex := -1;
  if Length(FTSSelectionArray[1].Timeseries)>0 then
    SimpleHydroModel.EvaporationIndex := FTSSelectionArray[1].Timeseries[0] else
      SimpleHydroModel.EvaporationIndex := -1;
  if Length(FTSSelectionArray[2].Timeseries)>0 then
    SimpleHydroModel.PumpingIndex := FTSSelectionArray[2].Timeseries[0] else
      SimpleHydroModel.PumpingIndex := -1;
  if Length(FTSSelectionArray[3].Timeseries)>0 then
    SimpleHydroModel.RunoffIndex := FTSSelectionArray[3].Timeseries[0] else
      SimpleHydroModel.RunoffIndex := -1;
  SimpleHydroModel.Execute;
end;

procedure TFrmTimeseriesGrid.ReopenActionExecute(Sender: TObject);
begin
  OpenDialog.Files.Text := (Sender as TCustomAction).Caption;
  MnuLoadFromFileClick(nil);
end;

procedure TFrmTimeseriesGrid.RvTimeseriesGridGetCols(
  Connection: TRvCustomConnection);
begin
  with Connection do begin
    WriteField('DATE', dtString, 20, 'Date', 'Time series record date');
    WriteField('VALUE', dtString, 16, 'Value', 'Time series record value');
    WriteField('FLAGS', dtString, 20, 'Flags', 'Time series record flag');
  end;
end;

procedure TFrmTimeseriesGrid.RvTimeseriesGridGetRow(
  Connection: TRvCustomConnection);
begin
  with Connection do begin
    WriteStrData('',TimeseriesGrid.ActiveTimeseries[DataIndex].DateAsString);
    WriteStrData('',TimeseriesGrid.ActiveTimeseries[DataIndex].AsString);
    WriteStrData('',TimeseriesGrid.ActiveTimeseries[DataIndex].GetAllFlags);
  end;
end;

procedure TFrmTimeseriesGrid.RvTimeseriesGridOpen(
  Connection: TRvCustomConnection);
begin
  Connection.DataRows := TimeseriesGrid.ActiveTimeseries.Count
end;

procedure TFrmTimeseriesGrid.RvTimeseriesTableMonthlyGetCols(
  Connection: TRvCustomConnection);
var
  i: Integer;
  ATsRecord: TTsRecord;
begin
  with Connection do begin
    for i := 0 to TimeseriesGrid.ColCount-1 do
      WriteField('TSG'+IntToStr(i),
        dtString, 9, 'Tsg'+TimeseriesGrid.GetCellText(i,0,ATsRecord), '');
  end;
end;

procedure TFrmTimeseriesGrid.RvTimeseriesTableMonthlyGetRow(
  Connection: TRvCustomConnection);
var
  i: Integer;
  ATsRecord: TTsRecord;
  AOffset: Integer;
begin
  if (Connection = RvTimeseriesMonthlyTitles) or
    (Connection = RvTimeseriesDailyTitles) then
    AOffset := 0 else
    AOffset := 1;
  with Connection do begin
    for i := 0 to TimeseriesGrid.ColCount-1 do
      WriteStrData('', TimeseriesGrid.GetCellText(i, DataIndex+AOffset,
        ATsRecord));
  end;
end;

procedure TFrmTimeseriesGrid.RvTimeseriesTableMonthlyOpen(
  Connection: TRvCustomConnection);
begin
  Connection.DataRows := TimeseriesGrid.RowCount-1;
end;

procedure TFrmTimeseriesGrid.RvTimeseriesMonthlyTitlesOpen(
  Connection: TRvCustomConnection);
begin
  Connection.DataRows := 1;
end;

procedure TFrmTimeseriesGrid.mnuUndoClick(Sender: TObject);
var
  ACursor: TCursor;
  AID, i: Integer;
begin
  ACursor := Screen.Cursor;
  AID := TimeseriesGrid.UndoID(TimeseriesGrid.ActiveIndex);
  try
    Screen.Cursor := crAppStart;
    with TimeseriesGrid do
      for i := 0 to Count-1 do
        if UndoID(i) = AID then
          Undo(i);
  finally
    Screen.Cursor := ACursor;
  end;
  TimeseriesGrid.Reformat;
  TimeseriesGrid.Refresh;
  SetControlStatus;
end;

procedure TFrmTimeseriesGrid.mnuRedoClick(Sender: TObject);
var
  ACursor: TCursor;
  AID, i: Integer;
begin
  ACursor := Screen.Cursor;
  AID := TimeseriesGrid.RedoID(TimeseriesGrid.ActiveIndex);
  try
    Screen.Cursor := crAppStart;
    with TimeseriesGrid do
      for i := 0 to Count-1 do
        if RedoID(i) = AID then
          Redo(i);
  finally
    Screen.Cursor := ACursor;
  end;
  TimeseriesGrid.Reformat;
  TimeseriesGrid.Refresh;
  SetControlStatus;
end;

procedure TFrmTimeseriesGrid.mnuComplexCalculationsClick(Sender: TObject);
begin
  ComplexCalculationsDialog.Execute;
end;

resourcestring
  rsDisaggrOnOriginal = 'Created by disaggregating original time series:';

procedure TFrmTimeseriesGrid.mnuDisaggregationClick(Sender: TObject);
var
  SavedCursor: TCursor;
  SourceTimeseries, DestTimeseries: TTimeseries;
begin
  SourceTimeseries := TimeseriesGrid.ActiveTimeseries;
  DestTimeseries := nil;
  if not DisaggregationDialog.Execute then Exit;
  Update;
  SavedCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    DestTimeseries := TTimeseries.Create;
    with DisaggregationDialog do
      TimeseriesDisaggregate(SourceTimeseries, DestTimeseries, Method,
        RandomModel);
    DestTimeseries.Comment :=
      rsDisaggrOnOriginal+#13#10#13#10+SourceTimeseries.Comment;
    DestTimeseries.Title := SourceTimeseries.Title+'-';
    DestTimeseries.MUnit := SourceTimeseries.MUnit;
    DestTimeseries.TimeZone := SourceTimeseries.TimeZone;
    TimeseriesGrid.Add(DestTimeseries);
    DestTimeseries := nil;
    TimeseriesGrid.Repaint;
    TimeseriesGrid.ActiveIndex := TimeseriesGrid.Count-1;
  finally
    Screen.Cursor := SavedCursor;
    DestTimeseries.Free;
  end;
end;

procedure TFrmTimeseriesGrid.mnuHydrometryClick(Sender: TObject);
var
  AStageTimeseries, ADischargeTimeseries: TTimeseries;
begin
  AStageTimeseries := nil;
  ADischargeTimeseries := nil;
  try
    AStageTimeseries := TTimeseries.Create;
    ADischargeTimeseries := TTimeseries.Create;
    AStageTimeseries.TimeStep := tstVariable;
    ADischargeTimeseries.TimeStep := tstVariable;
    AStageTimeseries.TimeZone := ApplicationOptions.DefaultTimeZone;
    ADischargeTimeseries.TimeZone := ApplicationOptions.DefaultTimeZone;
    ADischargeTimeseries.Precision := 3;
    HydrometryDialog.StageTimeseries := AStageTimeseries;
    HydrometryDialog.DischargeTimeseries := ADischargeTimeseries;
    if HydrometryDialog.Execute then
    begin
      TimeseriesGrid.Add(AStageTimeseries);
      AStageTimeseries := nil;
      TimeseriesGrid.Add(ADischargeTimeseries);
      ADischargeTimeseries := nil;
      TimeseriesGrid.Repaint;
      TimeseriesGrid.ActiveIndex := TimeseriesGrid.Count-2;
      SetControlStatus;
    end;
  finally
    AStageTimeseries.Free;
    ADischargeTimeseries.Free;
    HydrometryDialog.StageTimeseries := nil;
    HydrometryDialog.DischargeTimeseries := nil;
  end;
end;

procedure TFrmTimeseriesGrid.mnuAboutClick(Sender: TObject);
begin
  AboutDialog.execute;
end;

procedure TFrmTimeseriesGrid.mnuPrinterSetupExecute(Sender: TObject);
begin
  PrinterSetupDialog.Execute;
end;

procedure TFrmTimeseriesGrid.FindReopenMenuItem(AClient: TActionClient);
begin
  if AClient is TActionClientItem then
    if Pos('Reopen...', TActionClientItem(AClient).Caption) <> 0 then
      ReopenMenuItem := AClient as TActionClientItem
end;

procedure TFrmTimeseriesGrid.FindOpenToolItem(AClient: TActionClient);
begin
  if AClient is TActionClientItem then
    if Pos('Open', TActionClientItem(AClient).Caption) <> 0 then
      OpenToolItem := AClient as TActionClientItem
end;

procedure TFrmTimeseriesGrid.UpdateReopenItem(ReopenItem1, ReopenItem2:
  TActionClientItem; AFileName: string);
var
  i: Integer;
begin
  if (ReopenItem1 = nil) and (ReopenItem2 = nil) then Exit;
  if AFileName<>'' then
    for i := ReopenActionList1.ActionCount - 1 downto 0 do
      if i = 0 then
        TCustomAction(ReopenActionList1.Actions[i]).Caption := AFileName
      else
        TCustomAction(ReopenActionList1.Actions[i]).Caption :=
          TCustomAction(ReopenActionList1.Actions[I - 1]).Caption;
  if ReopenItem1<>nil then
    if ReopenItem1.Items.Count < ReopenActionList1.ActionCount then
      ReopenItem1.Items.Add;
  if ReopenItem2<>nil then
    if ReopenItem2.Items.Count < ReopenItem1.Items.Count then
      ReopenItem2.Items.Add;
  if ReopenItem1<>nil then
    for i := 0 to ReopenItem1.Items.Count - 1 do
    begin
      ReopenItem1.Items[i].Action := ReopenActionList1.Actions[i];
      ReopenItem1.Items[i].Caption := Format('&%d: %s', [i+1,
        TCustomAction(ReopenActionList1.Actions[i]).Caption]);
    end;
  if ReopenItem2<>nil then
    for i := 0 to ReopenItem2.Items.Count - 1 do
    begin
      ReopenItem2.Items[i].Action := ReopenActionList1.Actions[i];
      ReopenItem2.Items[i].Caption := Format('&%d: %s', [i+1,
        TCustomAction(ReopenActionList1.Actions[i]).Caption]);
    end;
end;

procedure TFrmTimeseriesGrid.WMDROPFILES(var AMessage: TWMDROPFILES);
var
  i, uint, FileCount: Integer;
  buffer: array[0..255] of char;
begin
  uint := $FFFFFFFF;
  FileCount := DragQueryFile(AMessage.Drop, uint, nil, 0);
  OpenDialog.Files.Clear;
  for i := 0 to FileCount-1 do
  begin
    DragQueryFile(AMessage.Drop, i, @buffer, sizeof(buffer));
    OpenDialog.Files.Add(buffer);
  end;
  MnuLoadFromFileClick(nil);
end;

procedure TFrmTimeseriesGrid.FormShow(Sender: TObject);
var
  i: Integer;
begin
{These are workarrounds to cope with >96dpi resolutions}
  ControlBar1.Height := 35;
  MainToolBar.Width := 190;
  EditToolBar.Width := 235;
  ViewToolBar.Width := 211;
  EditToolBar.Left := 203-MainToolBar.Left;
  ViewToolBar.Left := 451-MainToolBar.Left;
  for i := 1 to ParamCount do
    ProcessParam(ParamStr(i));
end;

procedure TFrmTimeseriesGrid.ProcessParam(const Param: string);
begin
  OpenDialog.Files.Clear;
  OpenDialog.Files.Add(Param);
  MnuLoadFromFileClick(nil);
end;

procedure TFrmTimeseriesGrid.UMEnsureRestored(var Msg: TMessage);
begin
  if IsIconic(Application.Handle) then
    Application.Restore;
  if not Visible then
    Visible := True;
  Application.BringToFront;
  SetForegroundWindow(Self.Handle);
  SetFocus;
end;

procedure TFrmTimeseriesGrid.WMCopyData(var Msg: TWMCopyData);
var
  PData: PAnsiChar;
  Param: string;
begin
  try
    if Msg.CopyDataStruct.dwData <> cCopyDataWaterMark then
      raise Exception.Create(
        'Invalid data structure passed in WM_COPYDATA'
      );
    PData := Msg.CopyDataStruct.lpData;
    while PData^ <> #0 do
    begin
      Param := StrPas(PData);
      if Application.ModalLevel>0 then
        FQueuedParam.Add(Param)
      else
        ProcessParam(Param);
      Inc(PData, Length(Param) + 1);
    end;
  finally
    Msg.Result := 1;
  end;
end;

procedure TFrmTimeseriesGrid.actionCheckForNewVersionExecute(Sender: TObject);
begin
  TCheckThread.Create(ApplicationOptions,
    genutils.GetFileVersionStr(ParamStr(0), ver4Items), True);
end;

resourcestring
  rsGoToRecord = 'Go to the record nearest to the specified date';

procedure TFrmTimeseriesGrid.actionGoToHydrognomonOrgExecute(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar('http://www.hydrognomon.org/'), nil, nil,
    SW_SHOWNORMAL)
end;

procedure TFrmTimeseriesGrid.actionGoToRecordExecute(Sender: TObject);
var
  AIndex: Integer;
  DateFormat, s: string;
  ts: TTimeseries;
  ADate: TDateTime;
  AHYearOrigin: Integer;
  Options: TGetDateFormatOptions;
  ARange: TIndexRange;
begin
  ts := TimeseriesGrid.ActiveTimeseries;
  AHYearOrigin := ApplicationOptions.DefaultHydrologicalYearOrigin;
  if ts.TimeStep = tstAnnual then
    AHYearOrigin := ts.NominalOffset.Months+1;
  if not InputQuery(rsGoToRecord, rsRecordDate, s) then Exit;
  Options := [gdfRaiseOnFail];
  if (ts.TimeStep = tstAnnual) and (ts.HydrologicalYear) then
    Options := Options + [gdfAllowHydrologicalYear];
  DateFormat := GetDateFormat(s, Options, AHYearOrigin);
  ADate := FormatStrToDateTime(DateFormat, s, AHYearOrigin);
  AIndex := ts.NearestTo(ADate);
  if AIndex<0 then Exit;
  ARange.StartIndex := AIndex;
  ARange.EndIndex := AIndex;
  TimeseriesGrid.SelectionRange := ARange;
  TimeseriesGrid.SetFocus;
end;

end.

