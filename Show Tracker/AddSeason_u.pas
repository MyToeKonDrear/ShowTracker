unit AddSeason_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Samples.Spin, Vcl.WinXPickers;

type
  TfrmAddSeason = class(TForm)
    lblName: TLabel;
    lblSeasons: TLabel;
    spnSeasons: TSpinEdit;
    pnlEnter: TPanel;
    dtpDate: TDatePicker;
    lblDate: TLabel;
    imgLogo: TImage;
    imgExit: TImage;
    imgHome: TImage;
    imgBryn: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnlEnterClick(Sender: TObject);
    procedure imgExitClick(Sender: TObject);
    procedure imgExitMouseEnter(Sender: TObject);
    procedure imgExitMouseLeave(Sender: TObject);
    procedure imgHomeClick(Sender: TObject);
    procedure imgHomeMouseEnter(Sender: TObject);
    procedure imgHomeMouseLeave(Sender: TObject);
    procedure pnlEnterMouseEnter(Sender: TObject);
    procedure pnlEnterMouseLeave(Sender: TObject);
  private
    { Private declarations }
    shpHeader : TShape;
    procedure InitializeForm;
    procedure InitializeComponents;
    procedure InitializeImages;
  public
    { Public declarations }
  end;

var
  frmAddSeason: TfrmAddSeason;

implementation

uses Home_u, dmShowTracker_u, Watched_u, Edit_u;

{$R *.dfm}

{ TfrmAddSeason }

procedure TfrmAddSeason.FormCreate(Sender: TObject);
begin
  InitializeForm;
  InitializeComponents;
  InitializeImages;
end;

procedure TfrmAddSeason.FormShow(Sender: TObject);
begin
  //load show info into components
  dmShowTracker.tblWatched.Open;
  dmShowTracker.tblWatched.RecNo := frmWatched.iRecordNo;

  lblName.Caption := dmShowTracker.tblWatched['ShowName'];
  spnSeasons.Value := dmShowTracker.tblWatched['Seasons'];
  dtpDate.Date := dmShowTracker.tblWatched['DateCompleted'];

  dmShowTracker.tblWatched.Close;
end;

procedure TfrmAddSeason.imgExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmAddSeason.imgExitMouseEnter(Sender: TObject);
begin
  imgExit.Picture.LoadFromFile('Images\ExitImage2.jpg');
end;

procedure TfrmAddSeason.imgExitMouseLeave(Sender: TObject);
begin
  imgExit.Picture.LoadFromFile('Images\ExitImage1.jpg');
end;

procedure TfrmAddSeason.imgHomeClick(Sender: TObject);
begin
  frmAddSeason.Hide;
  frmHome.Show;
end;

procedure TfrmAddSeason.imgHomeMouseEnter(Sender: TObject);
begin
  imgHome.Picture.LoadFromFile('Images\HomeImage2.jpg');
end;

procedure TfrmAddSeason.imgHomeMouseLeave(Sender: TObject);
begin
  imgHome.Picture.LoadFromFile('Images\HomeImage1.jpg');
end;

procedure TfrmAddSeason.InitializeComponents;
begin
  //lblName
  lblName.Left := Trunc(0.25 * Screen.Width);
  lblName.Top := Trunc(0.1 * Screen.Height);
  lblName.Font.Size := 24;
  lblName.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);

  //lblSeasons
  lblSeasons.Left := Trunc(0.25 * Screen.Width);
  lblSeasons.Top := Trunc(0.3 * Screen.Height);
  lblSeasons.Font.Size := 16;
  lblSeasons.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  lblSeasons.Caption := 'Enter up until the number of seasons you have completed in total';

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

  //lblDate
  lblDate.Left := Trunc(0.25 * Screen.Width);
  lblDate.Top := Trunc(0.5 * Screen.Height);
  lblDate.Font.Size := 16;
  lblDate.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  lblDate.Caption := 'Enter the date you completed the new seasons on';

  //dtpDate
  dtpDate.Left := Trunc(0.25 * Screen.Width);
  dtpDate.Top := Trunc(0.55 * Screen.Height);
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
  dtpDate.Cursor := crHandPoint;

  //pnlEnter
  pnlEnter.Caption := 'Enter';
  pnlEnter.ParentBackground := false;
  pnlEnter.ParentColor := false;
  pnlEnter.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  pnlEnter.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  pnlEnter.font.Size := 16;
  pnlEnter.Top := Trunc(0.7 * Screen.Height);
  pnlEnter.Width := Trunc(0.25 * Screen.Width);
  pnlEnter.Height := Trunc(0.03 * Screen.Height);
  pnlEnter.Left := Trunc(0.5 * Screen.Width);
  pnlEnter.BorderStyle := bsNone;
  pnlEnter.BevelOuter := bvNone;
  pnlEnter.Cursor := crHandPoint;

end;

procedure TfrmAddSeason.InitializeForm;
begin
  //form dimensions
  frmAddSeason.Left := 0;
  frmAddSeason.Top := 0;
  frmAddSeason.Width := Screen.Width;
  frmAddSeason.Height := Screen.Height;
  frmAddSeason.Position := poScreenCenter;
  frmAddSeason.WindowState := wsMaximized;
  frmAddSeason.Color := rgb(frmHome.arrBackgroundcolor[1],frmHome.arrBackgroundcolor[2],frmHome.arrBackgroundcolor[3]);

  //remove border (therefore user cant resize or move the form)
  frmAddSeason.BorderStyle := bsNone;

  //dynamically create purple header
  shpHeader := TShape.Create(frmAddSeason);
  shpHeader.Parent := frmAddSeason;
  shpHeader.Left := 0;
  shpHeader.Top := 0;
  shpHeader.Width := Screen.Width;
  shpHeader.Height := Trunc(0.08 * screen.Height);
  shpHeader.Brush.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
  shpHeader.Pen.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3])
end;

procedure TfrmAddSeason.InitializeImages;
begin
  //imglogo
  imgLogo.Width := Trunc(0.1 * Screen.Width);
  imgLogo.Height := shpHeader.Height;
  imglogo.Left := Trunc(0.02 * Screen.Width);
  imgLogo.top := 0;
  imgLogo.Proportional := true;
  imgLogo.Picture.LoadFromFile('Images\LogoImage.jpg');
  //imgLogo.Cursor := crHandPoint;
  imgLogo.BringToFront;

  //exit image
  imgExit.Width := shpHeader.Height;
  imgExit.Height := Trunc(0.8 * shpHeader.Height);
  imgExit.Left := Screen.Width - imgExit.Width;
  imgExit.top := Trunc(0.1 * shpHeader.Height);
  imgExit.Proportional := true;
  imgExit.Picture.LoadFromFile('Images\ExitImage1.jpg');
  imgExit.Cursor := crHandPoint;
  imgExit.BringToFront;

  //Home image
  imgHome.Width := shpHeader.Height;
  imgHome.Height := Trunc(0.8 * shpHeader.Height);
  imgHome.Left := imgExit.Left - imgHome.Width;
  imgHome.top := Trunc(0.1 * shpHeader.Height);
  imgHome.Proportional := true;
  imgHome.Picture.LoadFromFile('Images\HomeImage1.jpg');
  imgHome.Cursor := crHandPoint;
  imgHome.BringToFront;

  //Bryn Image
  imgBryn.Width := Trunc(0.1 * Screen.Width);
  imgBryn.Height := Trunc(0.95 * shpHeader.Height);
  imgBryn.Left := Trunc(0.45 * Screen.Width);
  imgBryn.top := 0;
  imgBryn.Proportional := true;
  imgBryn.Picture.LoadFromFile('Images\BrynImage.jpg');
  imgBryn.BringToFront;
end;

procedure TfrmAddSeason.pnlEnterClick(Sender: TObject);
var
  iSeasons, iNoNewSeasons, iPrimaryKey, iOldSeasons : integer;
  DateCompleted : TDate;
begin
  iSeasons := spnSeasons.Value;
  DateCompleted := dtpDate.Date;

  //validation
  if (iSeasons <= 0) OR (iSeasons = 1) then
  begin
    MessageDLG('Invalid number of seasons entered',mtError,[mbOK],0);
    spnSeasons.SetFocus;
    EXIT;
  end;

  dmShowTracker.tblWatched.Open;
  dmShowTracker.tblWatched.RecNo := frmWatched.iRecordNo;

  if DateCompleted < dmShowTracker.tblWatched['DateCompleted'] then
  begin
    MessageDLG('New seasons date cannot be before earlier seasons date',mtError,[mbOK],0);
    EXIT;
  end;

  //calculate amount of seasons watched
  iNoNewSeasons := iSeasons - dmShowTracker.tblWatched['Seasons'];
  iPrimaryKey := dmShowTracker.tblWatched['ID'];
  iOldSeasons := dmShowTracker.tblWatched['Seasons'];

  dmShowTracker.tblWatched.Close;

  //confirm
  if MessageDLG('Are you sure you want to add new seasons?' ,mtConfirmation,[mbYES,mbNO],0) = mrNO then
  begin
    MessageDLG('New seasons have not been added',mtInformation,[mbOK],0);
    EXIT;
  end;

  //write into database
  with dmShowTracker do
  begin
    qryShowTracker.SQL.Clear;
    qryShowTracker.SQL.Add('INSERT INTO NewSeasons (ID, Seasons, DateCompleted, OldSeasons) ' +
                           'VALUES (' + IntToStr(iPrimaryKey) + ', ' +
                           intToStr(iNoNewSeasons) + ', #' +
                           DateToStr(DateCompleted) + '#, ' +
                           IntToStr(iOldSeasons) + ')');
    qryShowTracker.ExecSQL;
  end;

  //update watched database
  with dmShowTracker do
  begin
    qryShowTracker.SQL.Clear;
    qryShowTracker.SQL.Add('UPDATE Watched SET Seasons = ' + IntToStr(iSeasons) +
                           ' WHERE ID = ' + IntToStr(iPrimaryKey));
    qryShowTracker.ExecSQL;
  end;

  //feedback
  MessageDLG('New Seasons have been successfully saved',mtInformation,[mbOK],0);

  frmAddSeason.Hide;
  frmHome.Show;
end;

procedure TfrmAddSeason.pnlEnterMouseEnter(Sender: TObject);
begin
  pnlEnter.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
end;

procedure TfrmAddSeason.pnlEnterMouseLeave(Sender: TObject);
begin
  pnlEnter.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
end;

end.
