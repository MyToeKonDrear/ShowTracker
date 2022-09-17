unit Edit_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Samples.Spin, Vcl.ComCtrls, Vcl.WinXPickers;

type
  TfrmEdit = class(TForm)
    edtShowName: TEdit;
    lblTimesWatched: TLabel;
    spnTimesWatched: TSpinEdit;
    lblSeasons: TLabel;
    spnSeasons: TSpinEdit;
    pnlEnter: TPanel;
    lblDate: TLabel;
    dtpDate: TDatePicker;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnlEnterClick(Sender: TObject);
  private
    { Private declarations }
    shpHeader : TShape;
    procedure InitializeForm;
    procedure InitializeComponents;
    procedure ResetComponents;
  public
    { Public declarations }
  end;

var
  frmEdit: TfrmEdit;

implementation

uses Home_u, ShowDetails_u, dmShowTracker_u, Watched_u;

{$R *.dfm}

{ TfrmEdit }

procedure TfrmEdit.FormCreate(Sender: TObject);
begin
  InitializeForm;
  InitializeComponents;
end;

procedure TfrmEdit.FormShow(Sender: TObject);
begin
  //display existing info from Database
  dmShowTracker.tblWatched.Open;
  dmShowTracker.tblWatched.RecNo := frmWatched.iRecordNo;

  edtShowName.Text := dmShowTracker.tblWatched['ShowName'];
  spnSeasons.Value := dmShowTracker.tblWatched['Seasons'];
  spnTimesWatched.Value := dmShowTracker.tblWatched['TimesWatched'];
  dtpDate.Date := dmShowTracker.tblWatched['DateCompleted'];

  dmShowTracker.tblWatched.Close;
end;

procedure TfrmEdit.InitializeComponents;
begin
  //edtShowName
  edtShowName.Clear;
  edtShowName.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  edtShowName.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  edtShowName.BorderStyle := bsNone;
  edtShowName.Font.Size := 16;
  edtShowName.Width := Trunc(0.5 * Screen.Width);
  edtShowName.Height := Trunc(0.03 * Screen.Height);
  edtShowName.Left := Trunc(0.25 * Screen.Width);
  edtSHowName.Top := Trunc(0.15 * screen.Height);
  edtShowName.Alignment := taLeftJustify;
  edtShowName.Cursor := crIBeam;
  edtShowName.TabOrder := 0;

  //lblSeasons
  lblSeasons.Left := Trunc(0.25 * Screen.Width);
  lblSeasons.top := Trunc(0.3 * Screen.Height);
  lblSeasons.Caption := 'Seasons Completed';
  lblSeasons.Font.Size := 16;
  lblSeasons.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  //lblSeasons.Hide;

  //spnSeasons
  spnSeasons.Value := 0;
  spnSeasons.MinValue := 0;
  spnSeasons.MaxValue := 100;
  spnSeasons.Font.Size := 16;
  spnSeasons.Font.color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  spnSeasons.Width := Trunc(0.25 * Screen.Width);
  spnSeasons.Height := Trunc(0.03 * Screen.Height);
  spnSeasons.Top := Trunc(0.35 * Screen.Height);
  spnSeasons.Left := Trunc(0.25 * Screen.Width);
  spnSeasons.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  //spnSeasons.hide;

  //lblTimesWatched
  lblTimesWatched.Left := Trunc(0.25 * Screen.Width);
  lblTimesWatched.top := Trunc(0.5 * Screen.Height);
  lblTimesWatched.Caption := 'Number of Times Watched';
  lblTimesWatched.Font.Size := 16;
  lblTimesWatched.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  //lblTimesWAtched.Hide;

  //spnTimesWatched
  spnTimesWatched.Value := 0;
  spnTimesWatched.MinValue := 0;
  spnTimesWatched.MaxValue := 100;
  spnTimesWatched.Font.Size := 16;
  spnTimesWatched.Font.color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  spnTimesWatched.Width := Trunc(0.25 * SCreen.Width);
  spnTimesWatched.Height := Trunc(0.03 * Screen.Height);
  spnTimesWatched.Top := Trunc(0.55 * Screen.Height);
  spnTimesWatched.Left := Trunc(0.25 * Screen.Width);
  spnTimesWatched.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  //spnTimesWatched.Hide;

  //lblDate
  lblDate.Left := Trunc(0.25 * Screen.Width);
  lblDate.top := Trunc(0.7 * Screen.Height);
  lblDate.Caption := 'Date Completed';
  lblDate.Font.Size := 16;
  lblDate.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  //lblDate.Hide;

  //dtpDate
  dtpDate.Left := Trunc(0.25 * Screen.Width);
  dtpDate.Top := Trunc(0.75 * Screen.Height);
  dtpDate.Width := Trunc(0.25 * Screen.Width);
  dtpDate.Height := Trunc(0.03 * Screen.Height);
  dtpDate.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  dtpDate.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  dtpDate.Font.Size := 16;
  dtpDate.SelectionColor := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  dtpDate.SelectionFontColor := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
  dtpDate.PopupColor := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  dtpDate.HighlightColor := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
  dtpDate.HotColor :=  rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  dtpDate.BorderStyle := bsNone;
  dtpDate.DateFormat := 'dd/MMM/yyyy';
  //dtpDate.Hide;

  //pnlEnter
  pnlEnter.Caption := 'Enter';
  pnlEnter.ParentBackground := false;
  pnlEnter.ParentColor := false;
  pnlEnter.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  pnlEnter.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  pnlEnter.font.Size := 16;
  pnlEnter.Top := Trunc(0.9 * Screen.Height);
  pnlEnter.Width := Trunc(0.25 * Screen.Width);
  pnlEnter.Height := Trunc(0.03 * Screen.Height);
  pnlEnter.Left := Trunc(0.5 * Screen.Width);
  pnlEnter.BorderStyle := bsNone;
  pnlEnter.BevelOuter := bvNone;
end;

procedure TfrmEdit.InitializeForm;
begin
  //form dimensions
  frmEdit.Left := 0;
  frmEdit.Top := 0;
  frmEdit.Width := Screen.Width;
  frmEdit.Height := Screen.Height;
  frmEdit.Position := poScreenCenter;
  frmEdit.WindowState := wsMaximized;
  frmEdit.Color := rgb(frmHome.arrBackgroundcolor[1],frmHome.arrBackgroundcolor[2],frmHome.arrBackgroundcolor[3]);

  //remove border (therefore user cant resize or move the form)
  frmEdit.BorderStyle := bsNone;

  //dynamically create purple header
  shpHeader := TShape.Create(frmEdit);
  shpHeader.Parent := frmEdit;
  shpHeader.Left := 0;
  shpHeader.Top := 0;
  shpHeader.Width := Screen.Width;
  shpHeader.Height := Trunc(0.08 * screen.Height);
  shpHeader.Brush.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
  shpHeader.Pen.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
end;

procedure TfrmEdit.pnlEnterClick(Sender: TObject);
Var
  sName : string;
  iSeasons, iTimesWatched : integer;
  NewDate : TDate;
  bTimesWatchedChanged, bSeasonsChanged, bNameChanged, bDateChanged : boolean;
begin
  //capture info
  sName := edtShowName.Text;
  iSeasons := spnSeasons.Value;
  iTimesWatched := spnTimesWatched.Value;
  NewDate := dtpDate.Date;


  bTimesWatchedChanged := false;
  bSeasonsChanged := false;
  bNameChanged := false;
  bDateChanged := false;

  //validation
  if sName = '' then
  begin
    MessageDLG('No name has been entered',mtError,[mbOK],0);
    ResetComponents;
    EXIT;
  end;

  if (iSeasons = 0) OR (iSeasons < 0) then
  begin
    MessageDLG('Invalid number of seasons entered',mtError,[mbOK],0);
    ResetComponents;
    EXIT;
  end;

  if (iTimesWatched <= 0) then
  begin
    MessageDLG('Invalid number of times watched entered',mtError,[mbOK],0);
    ResetComponents;
    EXIT;
  end;

  dmShowTracker.tblWatched.Open; //open the table for validation
  dmShowTracker.tblWatched.RecNo := frmWatched.iRecordNo;

  

  if (sName = dmShowTracker.tblWatched['ShowName'])
  AND (iSeasons = dmShowTracker.tblWatched['Seasons'])
  AND (iTimesWatched = dmShowTracker.tblWatched['TimesWatched'])
  AND (NewDate = dmShowTracker.tblWatched['DateCompleted']) then
  begin
    MessageDLG('No changes were entered',mtError,[mbOK],0);
    ResetComponents;
    EXIT;
  end;

  //check what has been changed
  if sName <> dmShowTracker.tblWatched['ShowName'] then
    bNameChanged := true;
  if iSeasons <> dmShowTracker.tblWatched['Seasons'] then
    bSeasonsChanged := true;
  if iTimeswatched <> dmShowTracker.tblWatched['TimesWatched'] then
    bTimesWatchedChanged := true;
  if NewDate <> dmShowTracker.tblWatched['DateCompleted'] then
    bDateChanged := true;

  //confirm
  var sMessage : string;
  sMessage := 'Changes: ' + #13 + #13;
  if bNameChanged then
    sMessage := sMessage + 'Name Changed: ' + dmShowtracker.tblWatched['ShowName'] + '  --->  ' + sName + #13;
  if bSeasonsChanged then
    sMessage := sMessage + 'Seasons: ' + IntToStr(dmShowtracker.tblWatched['Seasons'])
    + '  --->  ' + IntToStr(iSeasons) + #13;
  if bTimesWatchedChanged then
    sMessage := sMessage + 'Times Watched: ' + intToStr(dmShowtracker.tblWatched['TimesWatched'])
    + '  --->  ' + IntToStr(iTimesWatched) + #13;
  if bDateChanged then
    sMessage := sMessage + 'Date Completed: ' + DateToStr(dmShowtracker.tblWatched['DateCompleted'])
    + '  --->  ' + DateToStr(NewDate);


  if MessageDLG('Please confirm edit' + #13 + #13 + sMessage,mtConfirmation,[mbYES,mbNO],0) = mrNO then
  begin
    MessageDLG('Edit has been cancelled',mtInformation,[mbOK],0);
    ResetComponents;
    EXIT;
  end;

  dmShowTracker.tblWatched.Close;     //close the table after validation

  //make changes in database
  dmShowTracker.tblWatched.Open;
  dmShowTracker.tblWatched.RecNo := frmWatched.iRecordNo;
  var iPrimaryKey : integer;
  iPrimaryKey := dmShowTracker.tblWatched['ID'];

  with dmShowTracker do
  begin
    qryShowTracker.SQL.Clear;
    qryShowTracker.SQL.Add('UPDATE Watched SET ShowName = ' + QuotedStr(sName) +
                           ', TimesWatched = ' + IntToStr(iTimesWatched) +
                           ', Seasons = ' + IntToStr(iSeasons) +
                           ', DateCompleted = #' + DateToStr(NewDate) + '# ' +
                           'WHERE ID = ' + IntToStr(iPrimaryKey));
    qryShowTracker.ExecSQL;
  end;

  dmShowTracker.tblWatched.Close;

  //feedback
  MessageDLG('Changes have been successfully completed',mtinformation,[mbOK],0);

  frmEdit.Hide;
  frmHome.Show;

end;

procedure TfrmEdit.ResetComponents;
begin
  //display existing info from Database
  dmShowTracker.tblWatched.Open;
  dmShowTracker.tblWatched.RecNo := frmWatched.iRecordNo;

  edtShowName.Text := dmShowTracker.tblWatched['ShowName'];
  spnSeasons.Value := dmShowTracker.tblWatched['Seasons'];
  spnTimesWatched.Value := dmShowTracker.tblWatched['TimesWatched'];
  dtpDate.Date := dmShowTracker.tblWatched['DateCompleted'];

  dmShowTracker.tblWatched.Close;

  edtShowName.SetFocus;
end;

end.
