unit Home_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, jpeg,
  Vcl.ComCtrls;

type
  TfrmHome = class(TForm)
    imgExit: TImage;
    imgHome: TImage;
    imgLogo: TImage;
    imgBryn: TImage;
    pnlAddWatched: TPanel;
    pnlWatched: TPanel;
    pnlDelete: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure imgHomeMouseEnter(Sender: TObject);
    procedure imgHomeMouseLeave(Sender: TObject);
    procedure imgExitMouseEnter(Sender: TObject);
    procedure imgExitMouseLeave(Sender: TObject);
    procedure imgExitClick(Sender: TObject);
    procedure pnlAddWatchedClick(Sender: TObject);
    procedure pnlAddWatchedMouseEnter(Sender: TObject);
    procedure pnlAddWatchedMouseLeave(Sender: TObject);
    procedure pnlWatchedClick(Sender: TObject);
    procedure pnlWatchedMouseEnter(Sender: TObject);
    procedure pnlWatchedMouseLeave(Sender: TObject);
    procedure pnlDeleteClick(Sender: TObject);
    procedure pnlDeleteMouseEnter(Sender: TObject);
    procedure pnlDeleteMouseLeave(Sender: TObject);
  private
    { Private declarations }
    shpHeader : TShape;
    procedure InitializeForm;
    procedure InitializeImages;
    procedure InitializeComponents;
  public
    { Public declarations }
    arrBackgroundColor : array[1..3] of integer;
    arrSecondaryColor : array[1..3] of integer;
    arrTertiaryColor : array[1..3] of integer;
    arrTextColor : array[1..3] of integer;
  end;

var
  frmHome: TfrmHome;

implementation

uses Watched_u, AddWatched_u, Edit_u, Delete_u, TimesWatched_u;

{$R *.dfm}

{ TfrmHome }

procedure TfrmHome.FormCreate(Sender: TObject);
begin
  //populate array colors
  arrBackgroundcolor[1] := 0;
  arrBackgroundcolor[2] := 0;
  arrBackgroundcolor[3] := 0;

  arrSecondaryColor[1] := 82;
  arrSecondaryColor[2] := 5;
  arrSecondaryColor[3] := 123;

  arrTertiaryColor[1] := 137;
  arrTertiaryColor[2] := 44;
  arrTertiaryColor[3] := 220;

  arrTextColor[1] := 255;
  arrTextColor[2] := 255;
  arrTextColor[3] := 255;


  InitializeForm;
  InitializeImages;
  InitializeComponents;
  imgHome.visible := false;
end;

procedure TfrmHome.imgExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmHome.imgExitMouseEnter(Sender: TObject);
begin
  imgExit.Picture.LoadFromFile('Images\ExitImage2.jpg');
end;

procedure TfrmHome.imgExitMouseLeave(Sender: TObject);
begin
  imgExit.Picture.LoadFromFile('Images\ExitImage1.jpg');
end;

procedure TfrmHome.imgHomeMouseEnter(Sender: TObject);
begin
  imgHome.Picture.LoadFromFile('Images\HomeImage2.jpg');
end;

procedure TfrmHome.imgHomeMouseLeave(Sender: TObject);
begin
  imgHome.Picture.LoadFromFile('Images\HomeImage1.jpg');
end;

procedure TfrmHome.InitializeComponents;
begin
  //pnlAddWatched
  pnlAddWatched.Caption := 'Add a New Show';
  pnlAddWatched.ParentBackground := false;
  pnlAddWatched.ParentColor := false;
  pnlAddWatched.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  pnlAddWatched.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  pnlAddWatched.font.Size := 16;
  pnlAddWatched.Top := Trunc(0.2 * Screen.Height);
  pnlAddWatched.Width := Trunc(0.5 * Screen.Width);
  pnlAddWatched.Height := Trunc(0.1 * Screen.Height);
  pnlAddWatched.Left := Trunc(0.25 * Screen.Width);
  pnlAddWatched.BorderStyle := bsNone;
  pnlAddWatched.BevelOuter := bvNone;

  //pnlWatched
  pnlWatched.Caption := 'View Watched Shows';
  pnlWatched.ParentBackground := false;
  pnlWatched.ParentColor := false;
  pnlWatched.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  pnlWatched.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  pnlWatched.font.Size := 16;
  pnlWatched.Top := Trunc(0.5 * Screen.Height);
  pnlWatched.Width := Trunc(0.5 * Screen.Width);
  pnlWatched.Height := Trunc(0.1 * Screen.Height);
  pnlWatched.Left := Trunc(0.25 * Screen.Width);
  pnlWatched.BorderStyle := bsNone;
  pnlWatched.BevelOuter := bvNone;

  //pnlDelete
  pnlDelete.Caption := 'Delete Shows';
  pnlDelete.ParentBackground := false;
  pnlDelete.ParentColor := false;
  pnlDelete.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  pnlDelete.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  pnlDelete.font.Size := 16;
  pnlDelete.Top := Trunc(0.8 * Screen.Height);
  pnlDelete.Width := Trunc(0.5 * Screen.Width);
  pnlDelete.Height := Trunc(0.1 * Screen.Height);
  pnlDelete.Left := Trunc(0.25 * Screen.Width);
  pnlDelete.BorderStyle := bsNone;
  pnlDelete.BevelOuter := bvNone;
end;

procedure TfrmHome.InitializeForm;
begin
  //form dimensions
  frmHome.Left := 0;
  frmHome.Top := 0;
  frmHome.Width := Screen.Width;
  frmHome.Height := Screen.Height;
  frmHome.Position := poScreenCenter;
  frmHome.WindowState := wsMaximized;
  frmHome.Caption := 'Home';
  frmHome.Color := rgb(arrBackgroundcolor[1],arrBackgroundcolor[2],arrBackgroundcolor[3]);

  //remove border (therefore user cant resize or move the form)
  frmHome.BorderStyle := bsNone;

  //dynamically create purple header
  shpHeader := TShape.Create(frmHome);
  shpHeader.Parent := frmHome;
  shpHeader.Left := 0;
  shpHeader.Top := 0;
  shpHeader.Width := Screen.Width;
  shpHeader.Height := Trunc(0.08 * screen.Height);
  shpHeader.Brush.Color := rgb(arrSecondaryColor[1],arrSecondaryColor[2],arrSecondaryColor[3]);
  shpHeader.Pen.Color := rgb(arrSecondaryColor[1],arrSecondaryColor[2],arrSecondaryColor[3]);
end;

procedure TfrmHome.InitializeImages;
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

procedure TfrmHome.pnlAddWatchedClick(Sender: TObject);
begin
  frmHome.Hide;
  frmAddWatched.Show;
end;

procedure TfrmHome.pnlAddWatchedMouseEnter(Sender: TObject);
begin
  pnlAddWatched.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
end;

procedure TfrmHome.pnlAddWatchedMouseLeave(Sender: TObject);
begin
  pnlAddWatched.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
end;

procedure TfrmHome.pnlDeleteClick(Sender: TObject);
begin
  frmHome.Hide;
  frmWatched.PopulatestgWatched;
  frmDelete.Show;
end;

procedure TfrmHome.pnlDeleteMouseEnter(Sender: TObject);
begin
  pnlDelete.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
end;

procedure TfrmHome.pnlDeleteMouseLeave(Sender: TObject);
begin
  pnlDelete.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
end;

procedure TfrmHome.pnlWatchedClick(Sender: TObject);
begin
  frmHome.Hide;
  frmWatched.PopulatestgWatched;  //updates frmWatched after deleting and opening frmWatched again #trust
  frmWatched.Show;
end;

procedure TfrmHome.pnlWatchedMouseEnter(Sender: TObject);
begin
  pnlwatched.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
end;

procedure TfrmHome.pnlWatchedMouseLeave(Sender: TObject);
begin
  pnlWatched.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
end;

end.
