unit Home_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, jpeg;

type
  TfrmHome = class(TForm)
    Button1: TButton;
    imgExit: TImage;
    imgHome: TImage;
    imgLogo: TImage;
    imgBryn: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

uses Watched_u, AddWatched_u;

{$R *.dfm}

{ TfrmHome }

procedure TfrmHome.Button1Click(Sender: TObject);
begin
  frmHome.Hide;
  frmWatched.Show;
end;

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
end;

procedure TfrmHome.InitializeComponents;
begin

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
  imgLogo.Cursor := crHandPoint;
  imgLogo.BringToFront;

  //exit image
  imgExit.Width := Trunc(0.1 * Screen.Width);
  imgExit.Height := Trunc(0.8 * shpHeader.Height);
  imgExit.Left := Screen.Width - imgExit.Width + Trunc(0.48 * imgExit.Width);
  imgExit.top := Trunc(0.1 * shpHeader.Height);
  imgExit.Proportional := true;
  imgExit.Picture.LoadFromFile('Images\ExitImage1.jpg');
  imgExit.Cursor := crHandPoint;
  imgExit.BringToFront;

  //Home image
  imgHome.Width := Trunc(0.1 * Screen.Width);
  imgHome.Height := Trunc(0.8 * shpHeader.Height);
  imgHome.Left := imgExit.Left - Trunc(0.55 * imgHome.Width);
  imgHome.top := Trunc(0.1 * shpHeader.Height);
  imgHome.Proportional := true;
  imgHome.Picture.LoadFromFile('Images\HomeImage1.jpg');
  imgHome.Cursor := crHandPoint;
  imgHome.BringToFront;

  //Bryn Image
  imgBryn.Width := Trunc(0.1 * Screen.Width);
  imgBryn.Height := shpHeader.Height;
  imgBryn.Left := Trunc(0.45 * Screen.Width);
  imgBryn.top := 0;
  imgBryn.Proportional := true;
  imgBryn.Picture.LoadFromFile('Images\BrynImage.jpg');
  imgBryn.Cursor := crHandPoint;
  imgBryn.BringToFront;
end;

end.
