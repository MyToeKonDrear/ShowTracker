unit TimesWatched_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Samples.Spin, Vcl.WinXPickers;

type
  TfrmTimesWatched = class(TForm)
    lblName: TLabel;
    lblTimesWatched: TLabel;
    spnTimesWatched: TSpinEdit;
    pnlEnter: TPanel;
    lblDate: TLabel;
    dtpDateCompleted: TDatePicker;
    imgLogo: TImage;
    imgHome: TImage;
    imgExit: TImage;
    imgBryn: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnlEnterClick(Sender: TObject);
    procedure imgHomeClick(Sender: TObject);
    procedure imgHomeMouseEnter(Sender: TObject);
    procedure imgHomeMouseLeave(Sender: TObject);
    procedure imgExitClick(Sender: TObject);
    procedure imgExitMouseEnter(Sender: TObject);
    procedure imgExitMouseLeave(Sender: TObject);
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
  frmTimesWatched: TfrmTimesWatched;

implementation

uses Home_u, Watched_u, ShowDetails_u, dmShowTracker_u;

{$R *.dfm}

{ TfrmTimesWatched }

procedure TfrmTimesWatched.FormCreate(Sender: TObject);
begin
  InitializeForm;
  InitializeComponents;
  InitializeImages;
end;

procedure TfrmTimesWatched.FormShow(Sender: TObject);
begin
  //load show info into components
  dmShowTracker.tblWatched.Open;
  dmShowTracker.tblWatched.RecNo := frmWatched.iRecordNo;

  lblName.Caption := dmShowTracker.tblWatched['ShowName'];
  spnTimesWatched.Value := dmShowTracker.tblWatched['TimesWatched'];

  dmShowTracker.tblWatched.Close;
end;

procedure TfrmTimesWatched.imgExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmTimesWatched.imgExitMouseEnter(Sender: TObject);
begin
  imgexit.Picture.LoadFromFile('Images\ExitImage2.jpg');
end;

procedure TfrmTimesWatched.imgExitMouseLeave(Sender: TObject);
begin
  imgExit.Picture.LoadFromFile('Images\ExitImage1.jpg');
end;

procedure TfrmTimesWatched.imgHomeClick(Sender: TObject);
begin
  frmTimesWatched.Hide;
  frmHome.Show;
end;

procedure TfrmTimesWatched.imgHomeMouseEnter(Sender: TObject);
begin
  imgHome.Picture.LoadFromFile('Images\HomeImage2.jpg');
end;

procedure TfrmTimesWatched.imgHomeMouseLeave(Sender: TObject);
begin
  imgHome.Picture.LoadFromFile('Images\HomeImage1.jpg');
end;

procedure TfrmTimesWatched.InitializeComponents;
begin
  //lblName
  lblName.Left := Trunc(0.25 * Screen.Width);
  lblName.Top := Trunc(0.1 * Screen.Height);
  lblName.Font.Size := 24;
  lblName.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);

  //lblTimesWatched
  lblTimesWatched.Left := Trunc(0.25 * Screen.Width);
  lblTimesWatched.Top := Trunc(0.3 * Screen.Height);
  lblTimesWatched.Font.Size := 16;
  lblTimesWatched.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  lblTimesWatched.Caption := 'Enter the total number of times you have watched the show';

  //spnTimesWatched
  spnTimesWatched.Value := 0;
  spnTimesWatched.MinValue := 0;
  spnTimesWatched.MaxValue := 100;
  spnTimesWatched.Font.Size := 16;
  spnTimesWatched.Font.color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  spnTimesWatched.Width := Trunc(0.25 * Screen.Width);
  spnTimesWatched.Height := Trunc(0.03 * Screen.Height);
  spnTimesWatched.Top := Trunc(0.35 * Screen.Height);
  spnTimesWatched.Left := Trunc(0.25 * Screen.Width);
  spnTimesWatched.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);

  //lblDate
  lblDate.Left := Trunc(0.25 * Screen.Width);
  lblDate.Top := Trunc(0.5 * Screen.Height);
  lblDate.Font.Size := 16;
  lblDate.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  lblDate.Caption := 'Enter the date you rewatch the show on';

  //dtpDateCompleted
  dtpDateCompleted.Left := Trunc(0.25 * Screen.Width);
  dtpDateCompleted.Top := Trunc(0.55 * Screen.Height);
  dtpDateCompleted.Width := Trunc(0.25 * Screen.Width);
  dtpDateCompleted.Height := Trunc(0.03 * Screen.Height);
  dtpDateCompleted.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  dtpDateCompleted.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  dtpDateCompleted.Font.Size := 16;
  dtpDateCompleted.SelectionColor := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  dtpDateCompleted.SelectionFontColor := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
  dtpDateCompleted.PopupColor := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  dtpDateCompleted.HighlightColor := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
  dtpDateCompleted.HotColor :=  rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  dtpDateCompleted.BorderStyle := bsNone;
  dtpDateCompleted.DateFormat := 'dd/MMM/yyyy';
  dtpDateCompleted.Cursor := crHandPoint;
  dtpDateCompleted.Date := Date;

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
  pnlenter.Cursor := crHandPoint;
end;

procedure TfrmTimesWatched.InitializeForm;
begin
  //form dimensions
  frmTimesWatched.Left := 0;
  frmTimesWatched.Top := 0;
  frmTimesWatched.Width := Screen.Width;
  frmTimesWatched.Height := Screen.Height;
  frmTimesWatched.Position := poScreenCenter;
  frmTimesWatched.WindowState := wsMaximized;
  frmTimesWatched.Caption := 'TimesWatched';
  frmTimesWatched.Color := rgb(frmHome.arrBackgroundcolor[1],frmHome.arrBackgroundcolor[2],frmHome.arrBackgroundcolor[3]);

  //remove border (therefore user cant resize or move the form)
  frmTimesWatched.BorderStyle := bsNone;

  //dynamically create purple header
  shpHeader := TShape.Create(frmTimesWatched);
  shpHeader.Parent := frmTimesWatched;
  shpHeader.Left := 0;
  shpHeader.Top := 0;
  shpHeader.Width := Screen.Width;
  shpHeader.Height := Trunc(0.08 * screen.Height);
  shpHeader.Brush.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
  shpHeader.Pen.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
end;

procedure TfrmTimesWatched.InitializeImages;
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

procedure TfrmTimesWatched.pnlEnterClick(Sender: TObject);
Var
  iTimesWatched, iPrimaryKey, iOldTimesWatched, iNoNewTimesWatched : integer;
  DateCompleted : TDate;
begin
  iTimesWatched := spnTimesWatched.Value;
  DateCompleted := dtpDateCompleted.Date;

  //validation
  if (iTimesWatched <= 0) OR (iTimesWatched = 1) then
  begin
    MessageDLG('Invalid number of times watched entered',mtError,[mbOK],0);
    spnTimesWatched.SetFocus;
    EXIT;
  end;

  dmShowTracker.tblWatched.Open;
  dmShowTracker.tblWatched.RecNo := frmWatched.iRecordNo;

  if iTimesWatched <= dmShowTracker.tblWatched['TimesWatched'] then
  begin
    MessageDLG('Times watched cannot be the same as the previous number of times watched',mtError,[mbOK],0);
    EXIT;
  end;

  if DateCompleted < dmShowTracker.tblWatched['DateCompleted'] then
  begin
    MessageDLG('Rewatch cannot be before first time watched date',mtError,[mbOK],0);
    EXIT;
  end;

  //calculate amount of seasons watched
  iNoNewTimesWatched := iTimesWatched - dmShowTracker.tblWatched['TimesWatched'];
  iPrimaryKey := dmShowTracker.tblWatched['ID'];
  iOldTimesWatched := dmShowTracker.tblWatched['TimesWatched'];

  dmShowTracker.tblWatched.Close;

  //confirm
  if MessageDLG('Are you sure you want to add new number of times watched?' ,mtConfirmation,[mbYES,mbNO],0) = mrNO then
  begin
    MessageDLG('Rewatch has not been added',mtInformation,[mbOK],0);
    EXIT;
  end;

  //write into database
  with dmShowTracker do
  begin
    qryShowTracker.SQL.Clear;
    qryShowTracker.SQL.Add('INSERT INTO NewSeasons (ID, DateCompleted, TimesWatched, OldTimesWatched) VALUES (' +
                             IntToStr(iPrimaryKey) + ', ' +
                           '#' + DateToStr(DateCompleted) + '#, '
                           + IntToStr(iNoNewTimesWatched) +
                           ', ' + IntToStr(iOldTimesWatched) + ')');
    qryShowTracker.ExecSQL;
  end;

  //update watched database
  with dmShowTracker do
  begin
    qryShowTracker.SQL.Clear;
    qryShowTracker.SQL.Add('UPDATE Watched SET TimesWatched = ' + IntToStr(iTimesWatched) +
                           ' WHERE ID = ' + IntToStr(iPrimaryKey));
    qryShowTracker.ExecSQL;
  end;

  //feedback
  MessageDLG('Rewatch have been successfully saved',mtInformation,[mbOK],0);

  frmTimesWatched.Hide;
  frmHome.Show;
end;

procedure TfrmTimesWatched.pnlEnterMouseEnter(Sender: TObject);
begin
  pnlEnter.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
end;

procedure TfrmTimesWatched.pnlEnterMouseLeave(Sender: TObject);
begin
  pnlEnter.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
end;

end.
