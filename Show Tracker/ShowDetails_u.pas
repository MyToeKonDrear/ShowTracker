unit ShowDetails_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmShowDetails = class(TForm)
    lblShowName: TLabel;
    lblSeasons: TLabel;
    lblTimesWatched: TLabel;
    bvlDetailsBorder: TBevel;
    pnlEdit: TPanel;
    lblDateCompleted: TLabel;
    lblSeasons2: TLabel;
    lblDateCompleted2: TLabel;
    lblTimesWatched2: TLabel;
    pnlAddSeason: TPanel;
    redSeasons: TRichEdit;
    pnlTimesWatched: TPanel;
    imgLogo: TImage;
    imgHome: TImage;
    imgBryn: TImage;
    imgExit: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnlEditClick(Sender: TObject);
    procedure pnlAddSeasonClick(Sender: TObject);
    procedure pnlTimesWatchedClick(Sender: TObject);
    procedure imgHomeClick(Sender: TObject);
    procedure imgHomeMouseEnter(Sender: TObject);
    procedure imgHomeMouseLeave(Sender: TObject);
    procedure imgExitClick(Sender: TObject);
    procedure imgExitMouseEnter(Sender: TObject);
    procedure imgExitMouseLeave(Sender: TObject);
    procedure pnlEditMouseEnter(Sender: TObject);
    procedure pnlEditMouseLeave(Sender: TObject);
    procedure pnlAddSeasonMouseEnter(Sender: TObject);
    procedure pnlAddSeasonMouseLeave(Sender: TObject);
    procedure pnlTimesWatchedMouseEnter(Sender: TObject);
    procedure pnlTimesWatchedMouseLeave(Sender: TObject);
  private
    { Private declarations }
    shpHeader : TShape;
    procedure InitializeForm;
    procedure InitializeComponents;
    procedure LoadShowDetails;
    procedure InitializeImages;
  public
    { Public declarations }
  end;

var
  frmShowDetails: TfrmShowDetails;

implementation

uses Home_u, Watched_u, dmShowTracker_u, Edit_u, AddSeason_u, TimesWatched_u;

{$R *.dfm}

{ TfrmShowDetails }

procedure TfrmShowDetails.FormCreate(Sender: TObject);
begin
  InitializeForm;
  InitializeComponents;
  InitializeImages;
end;

procedure TfrmShowDetails.FormShow(Sender: TObject);
begin
  LoadShowDetails;
end;

procedure TfrmShowDetails.imgExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmShowDetails.imgExitMouseEnter(Sender: TObject);
begin
  imgExit.Picture.LoadFromFile('Images\ExitImage2.jpg');
end;

procedure TfrmShowDetails.imgExitMouseLeave(Sender: TObject);
begin
  imgExit.Picture.LoadFromFile('Images\ExitImage1.jpg');
end;

procedure TfrmShowDetails.imgHomeClick(Sender: TObject);
begin
  frmShowDetails.Hide;
  frmHome.Show;
end;

procedure TfrmShowDetails.imgHomeMouseEnter(Sender: TObject);
begin
  imgHome.Picture.LoadFromFile('Images\HomeImage2.jpg');
end;

procedure TfrmShowDetails.imgHomeMouseLeave(Sender: TObject);
begin
  imgHome.Picture.LoadFromFile('Images\HomeImage1.jpg');
end;

procedure TfrmShowDetails.InitializeComponents;
begin
  //bvlBorder
  bvlDetailsBorder.Left := Trunc(0.2 * Screen.Width);
  bvlDetailsBorder.Top := shpHeader.Height;
  bvlDetailsBorder.Width := Trunc(0.6 * Screen.Width);
  bvlDetailsBorder.Height := Trunc(0.7 * Screen.Height);

  //lblShowName
  lblShowName.Left := Trunc(0.25 * Screen.Width);
  lblShowName.Top := Trunc(0.1 * Screen.Height);
  lblShowName.Font.Size := 24;
  lblShowName.Font.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);

  //lblSeasons
  lblSeasons.Left := Trunc(0.25 * Screen.Width);
  lblSeasons.top := Trunc(0.2 * Screen.Height);
  lblSeasons.Font.Size := 16;
  lblSeasons.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);

  //lblSeasons2
  lblSeasons2.Left := Trunc(0.55 * Screen.Width);
  lblSeasons2.top := Trunc(0.2 * Screen.Height);
  lblSeasons2.Font.Size := 16;
  lblSeasons2.Font.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);

  //lblTimesWatched
  lblTimesWatched.Left := Trunc(0.25 * Screen.Width);
  lblTimesWatched.top := Trunc(0.3 * Screen.Height);
  lblTimesWatched.Font.Size := 16;
  lblTimesWatched.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);

  //lblTimesWatched2
  lblTimesWatched2.Left := Trunc(0.55 * Screen.Width);
  lblTimesWatched2.top := Trunc(0.3 * Screen.Height);
  lblTimesWatched2.Font.Size := 16;
  lblTimesWatched2.Font.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);

  //lblDateCompleted
  lblDateCompleted.Left := Trunc(0.25 * Screen.Width);
  lblDateCompleted.top := Trunc(0.4 * Screen.Height);
  lblDateCompleted.Font.Size := 16;
  lblDateCompleted.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);

  //lblDateCompleted2
  lblDateCompleted2.Left := Trunc(0.55 * Screen.Width);
  lblDateCompleted2.top := Trunc(0.4 * Screen.Height);
  lblDateCompleted2.Font.Size := 16;
  lblDateCompleted2.Font.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);

  //pnlEdit
  pnlEdit.Caption := 'Edit Show';
  pnlEdit.ParentBackground := false;
  pnlEdit.ParentColor := false;
  pnlEdit.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  pnlEdit.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  pnlEdit.font.Size := 16;
  pnlEdit.Top := Trunc(0.85 * Screen.Height);
  pnlEdit.Width := Trunc(0.6 * Screen.Width);
  pnlEdit.Height := Trunc(0.03 * Screen.Height);
  pnlEdit.Left := Trunc(0.2 * Screen.Width);
  pnlEdit.BorderStyle := bsNone;
  pnlEdit.BevelOuter := bvNone;
  pnlEdit.Cursor := crHandPoint;

  //pnlAddSeason
  pnlAddSeason.Caption := 'Add New Seasons Watched';
  pnlAddSeason.ParentBackground := false;
  pnlAddSeason.ParentColor := false;
  pnlAddSeason.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  pnlAddSeason.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  pnlAddSeason.font.Size := 16;
  pnlAddSeason.Top := Trunc(0.9 * Screen.Height);
  pnlAddSeason.Width := Trunc(0.29 * Screen.Width);
  pnlAddSeason.Height := Trunc(0.03 * Screen.Height);
  pnlAddSeason.Left := Trunc(0.20 * Screen.Width);
  pnlAddSeason.BorderStyle := bsNone;
  pnlAddSeason.BevelOuter := bvNone;
  pnlAddSeason.Cursor := crHandPoint;

  //pnlTimesWatched
  pnlTimesWatched.Caption := 'Increase Number of Times Watched';
  pnlTimesWatched.ParentBackground := false;
  pnlTimesWatched.ParentColor := false;
  pnlTimesWatched.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  pnlTimesWatched.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  pnlTimesWatched.font.Size := 16;
  pnlTimesWatched.Top := Trunc(0.9 * Screen.Height);
  pnlTimesWatched.Width := Trunc(0.29 * Screen.Width);
  pnlTimesWatched.Height := Trunc(0.03 * Screen.Height);
  pnlTimesWatched.Left := Trunc(0.51 * Screen.Width);
  pnlTimesWatched.BorderStyle := bsNone;
  pnlTimesWatched.BevelOuter := bvNone;
  pnlTimesWatched.Cursor := crHandPoint;

  //redSeasons
  redSeasons.Clear;
  redSeasons.Left := Trunc(0.25 * Screen.Width);
  redSeasons.Top := Trunc(0.5 * Screen.Height);
  redSeasons.Height := Trunc(0.25 * Screen.Height);
  redSeasons.Width := Trunc(0.5 * Screen.Width);
  redSeasons.BorderStyle := bsNone;
  redSeasons.Color := rgb(frmHome.arrBackgroundcolor[1],frmHome.arrBackgroundcolor[2],frmHome.arrBackgroundcolor[3]);
  redSeasons.Font.Size := 16;
  redSeasons.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  redSeasons.ScrollBars := ssVertical;
  redSeasons.ReadOnly := true;
  redSeasons.TabStop := false;
end;

procedure TfrmShowDetails.InitializeForm;
begin
  //form dimensions
  frmShowDetails.Left := 0;
  frmShowDetails.Top := 0;
  frmShowDetails.Width := Screen.Width;
  frmShowDetails.Height := Screen.Height;
  frmShowDetails.Position := poScreenCenter;
  frmShowDetails.WindowState := wsMaximized;
  frmShowDetails.Caption := 'Detailed View of Shows';
  frmShowDetails.Color := rgb(frmHome.arrBackgroundcolor[1],frmHome.arrBackgroundcolor[2],frmHome.arrBackgroundcolor[3]);

  //remove border (therefore user cant resize or move the form)
  frmShowDetails.BorderStyle := bsNone;

  //dynamically create purple header
  shpHeader := TShape.Create(frmShowDetails);
  shpHeader.Parent := frmShowDetails;
  shpHeader.Left := 0;
  shpHeader.Top := 0;
  shpHeader.Width := Screen.Width;
  shpHeader.Height := Trunc(0.08 * screen.Height);
  shpHeader.Brush.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
  shpHeader.Pen.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
end;

procedure TfrmShowDetails.InitializeImages;
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

procedure TfrmShowDetails.LoadShowDetails;
Var
  iPrimaryKey : integer;
begin
  dmShowTracker.tblWatched.Open;
  dmShowTracker.tblWatched.RecNo := frmWatched.iRecordNo;

  lblShowName.Caption := dmShowTracker.tblWatched['ShowName'];

  lblTimesWatched.Caption := 'Number of times you have watched the show: ';
  lblTimesWatched2.Caption := IntToStr(dmShowTracker.tblWatched['TimesWatched']);

  lblSeasons.Caption := 'Seasons Watched: ';
  lblSeasons2.Caption := IntToStr(dmShowTracker.tblWatched['Seasons']);

  lblDateCompleted.Caption := 'You completed this show on: ';
  lblDateCompleted2.Caption := DateToStr(dmShowTracker.tblWatched['DateCompleted']);

  redSeasons.Clear;

  dmShowTracker.tblWatched.Close;

  //check database for new extra seasons
  dmShowTracker.tblWatched.Open;
  dmShowTracker.tblWatched.RecNo := frmWatched.iRecordNo;
  iPrimarykey := dmShowTracker.tblWatched['ID'];
  dmShowTracker.tblWatched.Close;

  dmShowTracker.tblNewSeasons.Open;
  dmShowTracker.tblNewSeasons.First;

  repeat
    if (dmShowTracker.tblNewSeasons['ID'] = iPrimaryKey)
    AND (dmShowTracker.tblNewSeasons['TimesWatched'] = 0) then
    begin
      if dmShowTracker.tblNewSeasons['Seasons'] > 1 then
        redSeasons.Lines.Add('You completed seasons ' +
        IntToStr((dmShowTracker.tblNewSeasons['OldSeasons'] + 1)) + ' - ' +
        intToStr((dmShowTracker.tblNewSeasons['Seasons'] + dmShowTracker.tblNewSeasons['OldSeasons'])) +
        ' on ' + DateToStr(dmShowTracker.tblNewSeasons['DateCompleted']) + #13)
      else
        redSeasons.Lines.Add('You completed season ' +
        IntToStr((dmShowTracker.tblNewSeasons['Seasons'] + dmShowTracker.tblNewSeasons['OldSeasons'])) +
        ' on ' + DateToStr(dmShowTracker.tblNewSeasons['DateCompleted']) + #13);
    end;
    dmShowTracker.tblNewSeasons.Next;
  until (dmShowTracker.tblNewSeasons.Eof);

  dmShowTracker.tblNewSeasons.First; //reset the pointer to the top fo the records
  repeat
    if (dmShowTracker.tblNewSeasons['ID'] = iPrimaryKey)
    AND (dmShowTracker.tblNewSeasons['TimesWatched'] > 0) then
    begin
    if (dmShowTracker.tblNewSeasons['TimesWatched']) > 1 then
      redSeasons.Lines.Add('You rewatched this show ' +
                           IntToStr(dmShowTracker.tblNewSeasons['TimesWatched']) +
                           ' times on ' + DateToStr(dmShowTracker.tblNewSeasons['DateCompleted']) + #13)
      else
      redSeasons.Lines.Add('You rewatched this show once on ' +
                           DateToStr(dmShowTracker.tblNewSeasons['DateCompleted']) + #13);

    end;
    dmShowTracker.tblNewSeasons.Next;
  until (dmShowTracker.tblNewSeasons.Eof) ;

  dmShowTracker.tblNewSeasons.Close;

end;

procedure TfrmShowDetails.pnlAddSeasonClick(Sender: TObject);
begin
  frmShowDetails.Hide;
  frmAddSeason.show;
end;

procedure TfrmShowDetails.pnlAddSeasonMouseEnter(Sender: TObject);
begin
  pnlAddSeason.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
end;

procedure TfrmShowDetails.pnlAddSeasonMouseLeave(Sender: TObject);
begin
  pnlAddSeason.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
end;

procedure TfrmShowDetails.pnlEditClick(Sender: TObject);
begin
  frmShowDetails.Hide;
  frmEdit.Show;
end;

procedure TfrmShowDetails.pnlEditMouseEnter(Sender: TObject);
begin
  pnlEdit.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
end;

procedure TfrmShowDetails.pnlEditMouseLeave(Sender: TObject);
begin
  pnlEdit.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
end;

procedure TfrmShowDetails.pnlTimesWatchedClick(Sender: TObject);
begin
  frmShowDetails.Hide;
  frmTimesWatched.Show;
end;

procedure TfrmShowDetails.pnlTimesWatchedMouseEnter(Sender: TObject);
begin
  pnlTimesWatched.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
end;

procedure TfrmShowDetails.pnlTimesWatchedMouseLeave(Sender: TObject);
begin
  pnlTimesWatched.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
end;

end.
