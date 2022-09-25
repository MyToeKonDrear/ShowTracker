unit Stats_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmStats = class(TForm)
    imgLogo: TImage;
    imgHome: TImage;
    imgExit: TImage;
    imgBryn: TImage;
    redStats: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure imgExitClick(Sender: TObject);
    procedure imgExitMouseEnter(Sender: TObject);
    procedure imgExitMouseLeave(Sender: TObject);
    procedure imgHomeClick(Sender: TObject);
    procedure imgHomeMouseEnter(Sender: TObject);
    procedure imgHomeMouseLeave(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    shpHeader : TShape;
    procedure InitializeForm;
    procedure InitializeImages;
    procedure InitializeComponents;
    procedure ShowStats;
  public
    { Public declarations }
  end;

var
  frmStats: TfrmStats;

implementation

uses Home_u, dmShowTracker_u;

{$R *.dfm}

{ TfrmStats }

procedure TfrmStats.FormCreate(Sender: TObject);
begin
  InitializeForm;
  InitializeImages;
  InitializeComponents;
end;

procedure TfrmStats.FormShow(Sender: TObject);
begin
  ShowStats;
end;

procedure TfrmStats.imgExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmStats.imgExitMouseEnter(Sender: TObject);
begin
  imgExit.Picture.LoadFromFile('Images\ExitImage2.jpg');
end;

procedure TfrmStats.imgExitMouseLeave(Sender: TObject);
begin
  imgExit.Picture.LoadFromFile('Images\ExitImage1.jpg');
end;

procedure TfrmStats.imgHomeClick(Sender: TObject);
begin
  frmStats.Hide;
  frmHome.Show;
end;

procedure TfrmStats.imgHomeMouseEnter(Sender: TObject);
begin
  imgHome.Picture.LoadFromFile('Images\HomeImage2.jpg');
end;

procedure TfrmStats.imgHomeMouseLeave(Sender: TObject);
begin
  imgHome.Picture.LoadFromFile('Images\HomeImage1.jpg');
end;

procedure TfrmStats.InitializeComponents;
begin
  //redStats
  redStats.Width := Screen.Width;
  redStats.Height := Screen.Height - shpHeader.Height;
  redStats.Top := shpHeader.Height;
  redStats.Left := 0;
  redStats.Color := rgb(frmHome.arrBackgroundColor[1],frmHome.arrBackgroundColor[2],frmHome.arrBackgroundColor[3]);
  redStats.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  redStats.Font.Size := 16;
  redStats.Clear;
  redStats.BorderStyle := bsNone;
  redStats.ScrollBars := ssVertical;
  redStats.ReadOnly := True;
  redStats.TabStop := false;
  redStats.Cursor := crDefault;
  redStats.Paragraph.TabCount := 1;
  redStats.Paragraph.Tab[0] := Trunc(0.355 * Screen.Width);
end;

procedure TfrmStats.InitializeForm;
begin
  //form dimensions
  frmStats.Left := 0;
  frmStats.Top := 0;
  frmStats.Width := Screen.Width;
  frmStats.Height := Screen.Height;
  frmStats.Position := poScreenCenter;
  frmStats.WindowState := wsMaximized;
  frmStats.Caption := 'Add Watched';
  frmStats.Color := rgb(frmHome.arrBackgroundColor[1],frmHome.arrBackgroundColor[2],frmHome.arrBackgroundColor[3]);

  //remove border (therefore user cant resize or move the form)
  frmStats.BorderStyle := bsNone;

  //dynamically create purple header
  shpHeader := TShape.Create(frmStats);
  shpHeader.Parent := frmStats;
  shpHeader.Left := 0;
  shpHeader.Top := 0;
  shpHeader.Width := Screen.Width;
  shpHeader.Height := Trunc(0.08 * screen.Height);
  shpHeader.Brush.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
  shpHeader.Pen.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
end;

procedure TfrmStats.InitializeImages;
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

procedure TfrmStats.ShowStats;
Var
  arrYears : array [1..100] of integer;
  iTemp, iCount, iShowsWatched, iSeasonsWatched, i, iRewatches, iLast : integer;
begin
  //get all the years into an array
  dmShowTracker.tblWatched.Open;
  dmShowTracker.tblWatched.First;
  iCount := 1;

  arrYears[iCount] := StrToInt(COPY(DateToStr(dmShowTracker.tblWatched['DateCompleted']),1,4));

  repeat
    iTemp := StrToInt(COPY(DateToStr(dmShowTracker.tblWatched['DateCompleted']),1,4));
    if arrYears[iCount] <> iTemp  then
    begin
      inc(iCount);
      arrYears[iCount] := iTemp;
    end;
    dmShowTracker.tblWatched.next;
  until (dmShowTracker.tblWatched.Eof);


  //Stats per year
  dmShowTracker.tblWatched.First;

  i := 1;
  iSeasonsWatched := 0;
  iShowsWatched := 0;
  ilast := dmShowTracker.tblWatched.RecordCount;
  redStats.Lines.Add(#13 + #9 + IntToStr(arrYears[i]) + #13#13);

  repeat
    iTemp := StrToInt(COPY(DateToStr(dmShowTracker.tblWatched['DateCompleted']),1,4));
    if arrYears[i] = itemp then
    begin
      iSeasonsWatched := iSeasonsWatched + dmShowTracker.tblWatched['Seasons'];
      inc(iShowsWatched);
    end;
    if (arrYears[i] <> iTemp) OR (dmShowTracker.tblWatched.RecNo = iLast) then
    begin
      redStats.Lines.Add('Number of Shows Watched in ' + IntToStr(arrYears[i]) + ': ' + IntToStr(iShowsWatched) + #13);
      redStats.Lines.Add('Number of Seasons Watched in ' + IntToStr(arrYears[i]) + ': ' + intToStr(iSeasonsWatched) + #13#13);
      inc(i);
      if i > 3 then break;
      redStats.Lines.Add(#13 + #9 + IntToStr(arrYears[i]) + #13#13);
      iSeasonsWatched := 0;
      iShowsWatched := 0;
      iSeasonsWatched := iSeasonsWatched + dmShowTracker.tblWatched['Seasons'];
      inc(iShowsWatched);
    end;
    dmShowTracker.tblWatched.Next;
  until i = (iCount+1);


  //total number of shows watched
  iShowsWatched := dmShowTracker.tblWatched.RecordCount;

  //total number of seasons watched
  dmShowTracker.tblWatched.First;
  iSeasonsWatched := 0;

  for i := 1 to dmShowTracker.tblWatched.RecordCount do
  begin
    iSeasonsWatched := iSeasonsWatched + dmShowTracker.tblWatched['Seasons'];
    dmShowTracker.tblWatched.Next;
  end;

  //total number of rewatches
  dmShowTracker.tblWatched.First;
  irewatches := 0;

  for i := 1 to dmShowTracker.tblWatched.RecordCount do
  begin
    if dmShowTracker.tblWatched['TimesWatched'] > 1 then
      irewatches := irewatches + (dmShowTracker.tblWatched['TimesWatched']-1);
    dmShowTracker.tblWatched.Next;
  end;



  redStats.Lines.Add(#13 + 'All Time Statistics:' + #13#13);

  redStats.lines.Add('Total Number of Shows Watched: ' + IntToStr(iShowsWatched) + #13);
  redStats.Lines.Add('Total Number of Seasons Watched: ' + IntToStr(iSeasonsWatched) + #13);
  redStats.Lines.Add('Total Number of Rewatches: ' + IntToStr(irewatches) + #13);



  dmShowTracker.tblWatched.Close;

end;

end.
