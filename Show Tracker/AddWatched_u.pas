unit AddWatched_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Samples.Spin, Vcl.WinXPickers;

type
  TfrmAddWatched = class(TForm)
    edtShowName: TEdit;
    spnSeasons: TSpinEdit;
    lblSeasons: TLabel;
    lblDateCompleted: TLabel;
    dpDateCompleted: TDatePicker;
    pnlEnter: TPanel;
    imgHome: TImage;
    imgExit: TImage;
    imgLogo: TImage;
    imgBryn: TImage;
    lblName: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure edtShowNameMouseEnter(Sender: TObject);
    procedure pnlEnterMouseEnter(Sender: TObject);
    procedure pnlEnterMouseLeave(Sender: TObject);
    procedure imgExitMouseEnter(Sender: TObject);
    procedure imgExitMouseLeave(Sender: TObject);
    procedure imgHomeMouseEnter(Sender: TObject);
    procedure imgHomeMouseLeave(Sender: TObject);
    procedure imgHomeClick(Sender: TObject);
    procedure imgExitClick(Sender: TObject);
    procedure pnlEnterClick(Sender: TObject);
  private
    { Private declarations }
    shpHeader : TShape;
    procedure InitializeForm;
    procedure InitializeComponents;
    procedure InitializeImages;
    procedure ResetComponents;
  public
    { Public declarations }
  end;

var
  frmAddWatched: TfrmAddWatched;

implementation

uses Home_u, dmShowTracker_u, Watched_u;

{$R *.dfm}

{ TfrmAddWatched }

procedure TfrmAddWatched.edtShowNameMouseEnter(Sender: TObject);
begin
  //change color and caption of edtShowName
  edtShowName.Text := '';
  edtShowName.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
end;

procedure TfrmAddWatched.FormCreate(Sender: TObject);
begin
  InitializeForm;
  InitializeComponents;
  InitializeImages;
end;

procedure TfrmAddWatched.imgExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmAddWatched.imgExitMouseEnter(Sender: TObject);
begin
  imgExit.Picture.LoadFromFile('Images\ExitImage2.jpg');
end;

procedure TfrmAddWatched.imgExitMouseLeave(Sender: TObject);
begin
  imgExit.Picture.LoadFromFile('Images\ExitImage1.jpg');
end;

procedure TfrmAddWatched.imgHomeClick(Sender: TObject);
begin
  frmHome.Show;
  frmAddWatched.Hide;
end;

procedure TfrmAddWatched.imgHomeMouseEnter(Sender: TObject);
begin
  imgHome.Picture.LoadFromFile('Images\HomeImage2.jpg');
end;

procedure TfrmAddWatched.imgHomeMouseLeave(Sender: TObject);
begin
  imgHome.Picture.LoadFromFile('Images\HomeImage1.jpg');
end;

procedure TfrmAddWatched.InitializeComponents;
begin
  //lblName
  lblName.Caption := 'Enter the name of the show:';
  lblName.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  lblName.Font.Size := 16;
  lblName.Left := Trunc(0.25 * Screen.width);
  lblName.Top := Trunc(0.15 * Screen.Height);

  //edtShowName
  edtShowName.Clear;
  edtShowName.Text := 'Show Name';
  edtShowName.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  edtShowName.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  edtShowName.BorderStyle := bsNone;
  edtShowName.Font.Size := 16;
  edtShowName.Width := Trunc(0.5 * Screen.Width);
  edtShowName.Height := Trunc(0.03 * Screen.Height);
  edtShowName.Left := Trunc(0.25 * Screen.Width);
  edtSHowName.Top := Trunc(0.2 * screen.Height);
  edtShowName.Alignment := taLeftJustify;
  edtShowName.Cursor := crIBeam;
  edtShowName.TabOrder := 0;

  //lblSeasons
  lblSeasons.Caption := 'How many seasons did you watch?';
  lblSeasons.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  lblSeasons.Font.Size := 16;
  lblSeasons.Left := Trunc(0.25 * Screen.width);
  lblSeasons.Top := Trunc(0.38 * Screen.Height);

  //spnSeasons
  spnSeasons.Value := 0;
  spnSeasons.MinValue := 0;
  spnSeasons.MaxValue := 100;
  spnSeasons.Font.Size := 16;
  spnSeasons.Font.color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  spnSeasons.Width := lblSeasons.Width;
  spnSeasons.Height := Trunc(0.03 * Screen.Height);
  spnSeasons.Top := Trunc(0.42 * Screen.Height);
  spnSeasons.Left := Trunc(0.25 * Screen.Width);
  spnSeasons.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);

  //lblDateCompleted
  lblDateCompleted.Caption := 'What date did you complete the show on?';
  lblDateCompleted.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  lblDateCompleted.Font.Size := 16;
  lblDateCompleted.Left := Trunc(0.25 * Screen.width);
  lblDateCompleted.Top := Trunc(0.6 * Screen.Height);

  //dpDateCompleted
  dpDateCompleted.Date := Date;
  dpDateCompleted.Left := Trunc(0.25 * Screen.Width);
  dpDateCompleted.Top := Trunc(0.64 * Screen.Height);
  dpDateCompleted.Width := lblSeasons.Width;
  dpDateCompleted.Height := Trunc(0.03 * Screen.Height);
  dpDateCompleted.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  dpDateCompleted.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  dpDateCompleted.Font.Size := 16;
  dpDateCompleted.SelectionColor := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  dpDateCompleted.SelectionFontColor := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
  dpDateCompleted.PopupColor := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  dpDateCompleted.HighlightColor := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
  dpDAteCompleted.HotColor :=  rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  dpDateCompleted.BorderStyle := bsNone;
  dpDateCompleted.DateFormat := 'dd/MMM/yyyy';
  dpDateCompleted.Cursor := crHandPoint;

  //pnlEnter
  pnlEnter.Caption := 'Enter Show';
  pnlEnter.ParentBackground := false;
  pnlEnter.ParentColor := false;
  pnlEnter.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  pnlEnter.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  pnlEnter.font.Size := 16;
  pnlEnter.Top := Trunc(0.8 * Screen.Height);
  pnlEnter.width := Trunc(0.25 * screen.Width);
  pnlEnter.Height := Trunc(0.03 * Screen.Height);
  pnlEnter.Left := Trunc(0.5 * screen.Width);
  pnlEnter.BorderStyle := bsNone;
  pnlEnter.BevelOuter := bvNone;
  pnlEnter.Cursor := crHandPoint;
end;

procedure TfrmAddWatched.InitializeForm;
begin
  //form dimensions
  frmAddWatched.Left := 0;
  frmAddWatched.Top := 0;
  frmAddWatched.Width := Screen.Width;
  frmAddWatched.Height := Screen.Height;
  frmAddWatched.Position := poScreenCenter;
  frmAddWatched.WindowState := wsMaximized;
  frmAddWatched.Caption := 'Add Watched';
  frmAddWatched.Color := rgb(frmHome.arrBackgroundColor[1],frmHome.arrBackgroundColor[2],frmHome.arrBackgroundColor[3]);

  //remove border (therefore user cant resize or move the form)
  frmAddWatched.BorderStyle := bsNone;

  //dynamically create purple header
  shpHeader := TShape.Create(frmAddWatched);
  shpHeader.Parent := frmAddWatched;
  shpHeader.Left := 0;
  shpHeader.Top := 0;
  shpHeader.Width := Screen.Width;
  shpHeader.Height := Trunc(0.08 * screen.Height);
  shpHeader.Brush.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
  shpHeader.Pen.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
end;

procedure TfrmAddWatched.InitializeImages;
begin
  //logo
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

procedure TfrmAddWatched.pnlEnterClick(Sender: TObject);
begin
  //Validation
  if edtShowName.Text = '' then
  begin
    MessageDLG('Please enter a name for the show',mtError,[mbOK],0);
    EXIT;
  end;

  if (spnSeasons.Value = 0) OR (spnSeasons.Value < 0) then
  begin
    MessageDLG('Please enter a value for the number of seasons watched',mtError,[mbOK],0);
    spnSeasons.SetFocus;
    EXIT;
  end;

  //confirm
  if MessageDLG('Are you sure you want to enter this show?',mtConfirmation,[mbYES,mbNO],0) = mrNo then
  begin
    MessageDLG(edtShowName.text + ' was not saved',mtInformation,[mbOK],0);
    ResetComponents;
    EXIT;
  end;

  //enter show into database

  with dmShowTracker do
  begin
    qryShowTracker.SQL.Clear;
    qryShowTracker.SQL.Add('INSERT INTO Watched (ShowName, TimesWatched, Seasons, DateCompleted) VALUES (' +
                           QuotedStr(edtShowName.Text) + ', ' + IntToStr(1) + ', ' + IntToStr(spnSeasons.Value) +
                           ', #' + DateToStr(dpDateCompleted.Date) + '#)');
    qryShowTracker.ExecSQL;
  end;

  //FeedBack
  MessageDLG(edtShowName.Text + ' has been successfully saved',mtInformation,[mbOK],0);
  ResetComponents;

  frmAddWatched.Hide;
  frmHome.Show;
end;

procedure TfrmAddWatched.pnlEnterMouseEnter(Sender: TObject);
begin
  pnlEnter.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
end;

procedure TfrmAddWatched.pnlEnterMouseLeave(Sender: TObject);
begin
  pnlEnter.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
end;

procedure TfrmAddWatched.ResetComponents;
begin
  edtShowName.Clear;
  edtShowName.Text := 'Enter the name of the show';
  spnSeasons.Value := 0;
  dpDateCompleted.Date := date;
  edtShowName.SetFocus;
end;

end.
