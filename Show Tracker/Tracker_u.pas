unit Tracker_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmTracker = class(TForm)
    imgHome: TImage;
    imgExit: TImage;
    imgBryn: TImage;
    imgLogo: TImage;
    pnlInc: TPanel;
    pnlDec: TPanel;
    pnlReset: TPanel;
    imgLeft: TImage;
    imgRight: TImage;
    procedure FormCreate(Sender: TObject);
    procedure imgExitClick(Sender: TObject);
    procedure imgExitMouseEnter(Sender: TObject);
    procedure imgExitMouseLeave(Sender: TObject);
    procedure imgHomeClick(Sender: TObject);
    procedure imgHomeMouseEnter(Sender: TObject);
    procedure imgHomeMouseLeave(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnlIncClick(Sender: TObject);
    procedure pnlDecClick(Sender: TObject);
    procedure pnlResetClick(Sender: TObject);
  private
    { Private declarations }
    shpHeader : TShape;
    iLeftDigit, iRightDigit : integer;
    procedure InitializeForm;
    procedure InitializeImages;
    procedure InitializeComponents;
  public
    { Public declarations }
  end;

var
  frmTracker: TfrmTracker;

implementation

uses Home_u, dmShowTracker_u;

{$R *.dfm}

{ TfrmTracker }

procedure TfrmTracker.FormCreate(Sender: TObject);
begin
  InitializeForm;
  InitializeComponents;
  InitializeImages;
end;

procedure TfrmTracker.FormShow(Sender: TObject);
begin
  //load the episode count
  dmShowTracker.tblTracker.Open;
  dmShowTracker.tblTracker.First;

  iLeftDigit := dmShowTracker.tblTracker['LeftDigit'];
  irightDigit := dmShowTracker.tblTracker['RightDigit'];

  dmShowTracker.tblTracker.Close;

  case iLeftDigit of
    1 : imgLeft.Picture.LoadFromFile('Images\1.png');
    2 : imgLeft.Picture.LoadFromFile('Images\2.png');
    3 : imgLeft.Picture.LoadFromFile('Images\3.png');
    4 : imgLeft.Picture.LoadFromFile('Images\4.png');
    5 : imgLeft.Picture.LoadFromFile('Images\5.png');
    6 : imgLeft.Picture.LoadFromFile('Images\6.png');
    7 : imgLeft.Picture.LoadFromFile('Images\7.png');
    8 : imgLeft.Picture.LoadFromFile('Images\8.png');
    9 : imgLeft.Picture.LoadFromFile('Images\9.png');
    0 : imgLeft.Picture.LoadFromFile('Images\0.png');
  end;

  case iRightDigit of
    1 : imgRight.Picture.LoadFromFile('Images\1.png');
    2 : imgRight.Picture.LoadFromFile('Images\2.png');
    3 : imgRight.Picture.LoadFromFile('Images\3.png');
    4 : imgRight.Picture.LoadFromFile('Images\4.png');
    5 : imgRight.Picture.LoadFromFile('Images\5.png');
    6 : imgRight.Picture.LoadFromFile('Images\6.png');
    7 : imgRight.Picture.LoadFromFile('Images\7.png');
    8 : imgRight.Picture.LoadFromFile('Images\8.png');
    9 : imgRight.Picture.LoadFromFile('Images\9.png');
    0 : imgRight.Picture.LoadFromFile('Images\0.png');
  end;


end;

procedure TfrmTracker.imgExitClick(Sender: TObject);
begin
  Application.terminate;
end;

procedure TfrmTracker.imgExitMouseEnter(Sender: TObject);
begin
  imgExit.Picture.LoadFromFile('Images\ExitImage2.jpg');
end;

procedure TfrmTracker.imgExitMouseLeave(Sender: TObject);
begin
  imgExit.Picture.LoadFromFile('Images\ExitImage1.jpg');
end;

procedure TfrmTracker.imgHomeClick(Sender: TObject);
begin
  frmTracker.Hide;
  frmHome.Show;
end;

procedure TfrmTracker.imgHomeMouseEnter(Sender: TObject);
begin
  imgHome.Picture.LoadFromFile('Images\HomeImage2.jpg');
end;

procedure TfrmTracker.imgHomeMouseLeave(Sender: TObject);
begin
  imgHome.Picture.LoadFromFile('Images\HomeImage1.jpg');
end;

procedure TfrmTracker.InitializeComponents;
begin
  //imgLeft
  imgLeft.Width := Trunc(0.3 * Screen.Width);
  imgLeft.Height := Trunc(0.3 * Screen.Height);
  imgLeft.Left := Trunc(0.2 * Screen.Width);
  imgLeft.Top := Trunc(0.2 * Screen.Height);
  imgLeft.Proportional := true;

  //imgRight
  imgRight.Width := Trunc(0.3 * Screen.Width);
  imgRight.Height := Trunc(0.3 * Screen.Height);
  imgRight.Left := Trunc(0.5 * Screen.Width);
  imgRight.Top := Trunc(0.2 * Screen.Height);
  imgRight.Proportional := true;

  //pnlInc
  pnlInc.Caption := 'Increase';
  pnlInc.ParentBackground := false;
  pnlInc.ParentColor := false;
  pnlInc.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  pnlInc.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  pnlInc.font.Size := 16;
  pnlInc.Top := Trunc(0.75 * Screen.Height);
  pnlInc.Width := Trunc(0.29 * Screen.Width);
  pnlInc.Height := Trunc(0.05 * Screen.Height);
  pnlInc.Left := Trunc(0.20 * Screen.Width);
  pnlInc.BorderStyle := bsNone;
  pnlInc.BevelOuter := bvNone;
  pnlInc.Cursor := crHandPoint;

  //pnlDec
  pnlDec.Caption := 'Decrease';
  pnlDec.ParentBackground := false;
  pnlDec.ParentColor := false;
  pnlDec.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  pnlDec.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  pnlDec.font.Size := 16;
  pnlDec.Top := Trunc(0.75 * Screen.Height);
  pnlDec.Width := Trunc(0.29 * Screen.Width);
  pnlDec.Height := Trunc(0.05 * Screen.Height);
  pnlDec.Left := Trunc(0.51 * Screen.Width);
  pnlDec.BorderStyle := bsNone;
  pnlDec.BevelOuter := bvNone;
  pnlDec.Cursor := crHandPoint;

  //pnlReset
  pnlReset.Caption := 'Reset';
  pnlReset.ParentBackground := false;
  pnlReset.ParentColor := false;
  pnlReset.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  pnlReset.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  pnlReset.font.Size := 16;
  pnlReset.Top := Trunc(0.85 * Screen.Height);
  pnlReset.Width := Trunc(0.6 * Screen.Width);
  pnlReset.Height := Trunc(0.05 * Screen.Height);
  pnlReset.Left := Trunc(0.2 * Screen.Width);
  pnlReset.BorderStyle := bsNone;
  pnlReset.BevelOuter := bvNone;
  pnlReset.Cursor := crHandPoint;

end;

procedure TfrmTracker.InitializeForm;
begin
  //form dimensions
  frmTracker.Left := 0;
  frmTracker.Top := 0;
  frmTracker.Width := Screen.Width;
  frmTracker.Height := Screen.Height;
  frmTracker.Position := poScreenCenter;
  frmTracker.WindowState := wsMaximized;
  frmTracker.Caption := 'Add Watched';
  frmTracker.Color := rgb(frmHome.arrBackgroundColor[1],frmHome.arrBackgroundColor[2],frmHome.arrBackgroundColor[3]);

  //remove border (therefore user cant resize or move the form)
  frmTracker.BorderStyle := bsNone;

  //dynamically create purple header
  shpHeader := TShape.Create(frmTracker);
  shpHeader.Parent := frmTracker;
  shpHeader.Left := 0;
  shpHeader.Top := 0;
  shpHeader.Width := Screen.Width;
  shpHeader.Height := Trunc(0.08 * screen.Height);
  shpHeader.Brush.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
  shpHeader.Pen.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
end;

procedure TfrmTracker.InitializeImages;
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

procedure TfrmTracker.pnlDecClick(Sender: TObject);
begin
  //decrease the count
  if iRightDigit <> 0 then
    Dec(iRightDigit);

  if (iRightDigit = 0) AND (iLeftDigit <> 0) then
  begin
    Dec(iLeftDigit);
    iRightDigit := 9;
  end;

  //make the changes to the images

  case iLeftDigit of
    1 : imgLeft.Picture.LoadFromFile('Images\1.png');
    2 : imgLeft.Picture.LoadFromFile('Images\2.png');
    3 : imgLeft.Picture.LoadFromFile('Images\3.png');
    4 : imgLeft.Picture.LoadFromFile('Images\4.png');
    5 : imgLeft.Picture.LoadFromFile('Images\5.png');
    6 : imgLeft.Picture.LoadFromFile('Images\6.png');
    7 : imgLeft.Picture.LoadFromFile('Images\7.png');
    8 : imgLeft.Picture.LoadFromFile('Images\8.png');
    9 : imgLeft.Picture.LoadFromFile('Images\9.png');
    0 : imgLeft.Picture.LoadFromFile('Images\0.png');
  end;

  case iRightDigit of
    1 : imgRight.Picture.LoadFromFile('Images\1.png');
    2 : imgRight.Picture.LoadFromFile('Images\2.png');
    3 : imgRight.Picture.LoadFromFile('Images\3.png');
    4 : imgRight.Picture.LoadFromFile('Images\4.png');
    5 : imgRight.Picture.LoadFromFile('Images\5.png');
    6 : imgRight.Picture.LoadFromFile('Images\6.png');
    7 : imgRight.Picture.LoadFromFile('Images\7.png');
    8 : imgRight.Picture.LoadFromFile('Images\8.png');
    9 : imgRight.Picture.LoadFromFile('Images\9.png');
    0 : imgRight.Picture.LoadFromFile('Images\0.png');
  end;

  //save to database
  with dmShowTracker do
  begin
    qryShowTracker.SQL.Clear;
    qryShowTracker.SQL.Add('UPDATE Tracker SET LeftDigit = ' + IntToStr(iLeftDigit)
                          + ', RightDigit = ' + IntToStr(iRightDigit));
    qryShowTracker.ExecSQL;
  end;

end;

procedure TfrmTracker.pnlIncClick(Sender: TObject);
begin
  //increase the count
  inc(iRightDigit);
  if iRightDigit = 10 then
  begin
    inc(iLeftDigit);
    iRightDigit := 0;
  end;

  //make the changes to the images

  case iLeftDigit of
    1 : imgLeft.Picture.LoadFromFile('Images\1.png');
    2 : imgLeft.Picture.LoadFromFile('Images\2.png');
    3 : imgLeft.Picture.LoadFromFile('Images\3.png');
    4 : imgLeft.Picture.LoadFromFile('Images\4.png');
    5 : imgLeft.Picture.LoadFromFile('Images\5.png');
    6 : imgLeft.Picture.LoadFromFile('Images\6.png');
    7 : imgLeft.Picture.LoadFromFile('Images\7.png');
    8 : imgLeft.Picture.LoadFromFile('Images\8.png');
    9 : imgLeft.Picture.LoadFromFile('Images\9.png');
    0 : imgLeft.Picture.LoadFromFile('Images\0.png');
  end;

  case iRightDigit of
    1 : imgRight.Picture.LoadFromFile('Images\1.png');
    2 : imgRight.Picture.LoadFromFile('Images\2.png');
    3 : imgRight.Picture.LoadFromFile('Images\3.png');
    4 : imgRight.Picture.LoadFromFile('Images\4.png');
    5 : imgRight.Picture.LoadFromFile('Images\5.png');
    6 : imgRight.Picture.LoadFromFile('Images\6.png');
    7 : imgRight.Picture.LoadFromFile('Images\7.png');
    8 : imgRight.Picture.LoadFromFile('Images\8.png');
    9 : imgRight.Picture.LoadFromFile('Images\9.png');
    0 : imgRight.Picture.LoadFromFile('Images\0.png');
  end;

  //save to database
  with dmShowTracker do
  begin
    qryShowTracker.SQL.Clear;
    qryShowTracker.SQL.Add('UPDATE Tracker SET LeftDigit = ' + IntToStr(iLeftDigit)
                          + ', RightDigit = ' + IntToStr(iRightDigit));
    qryShowTracker.ExecSQL;
  end;

end;

procedure TfrmTracker.pnlResetClick(Sender: TObject);
begin
  iLeftDigit := 0;
  iRightDigit := 0;

  imgLeft.Picture.LoadFromFile('Images\0.png');
  imgRight.Picture.LoadFromFile('Images\0.png');

  //save to database
  with dmShowTracker do
  begin
    qryShowTracker.SQL.Clear;
    qryShowTracker.SQL.Add('UPDATE Tracker SET LeftDigit = ' + IntToStr(iLeftDigit)
                          + ', RightDigit = ' + IntToStr(iRightDigit));
    qryShowTracker.ExecSQL;
  end;

end;

end.
