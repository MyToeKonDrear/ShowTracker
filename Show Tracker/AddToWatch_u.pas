unit AddToWatch_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmAddToWatch = class(TForm)
    imgLogo: TImage;
    imgBryn: TImage;
    imgExit: TImage;
    imgHome: TImage;
    edtName: TEdit;
    pnlEnter: TPanel;
    procedure imgHomeClick(Sender: TObject);
    procedure imgHomeMouseEnter(Sender: TObject);
    procedure imgHomeMouseLeave(Sender: TObject);
    procedure imgExitClick(Sender: TObject);
    procedure imgExitMouseEnter(Sender: TObject);
    procedure imgExitMouseLeave(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pnlEnterClick(Sender: TObject);
  private
    { Private declarations }
    shpHeader : TShape;
    procedure InitializeForm;
    procedure InitializeImages;
    procedure InitializeComponents;
  public
    { Public declarations }
  end;

var
  frmAddToWatch: TfrmAddToWatch;

implementation

uses Home_u, dmShowTracker_u, ToWatch_u;

{$R *.dfm}

{ TfrmAddToWatch }

procedure TfrmAddToWatch.FormCreate(Sender: TObject);
begin
  InitializeForm;
  InitializeImages;
  InitializeComponents;
end;

procedure TfrmAddToWatch.imgExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmAddToWatch.imgExitMouseEnter(Sender: TObject);
begin
  imgExit.Picture.LoadFromFile('Images\ExitImage2.jpg');
end;

procedure TfrmAddToWatch.imgExitMouseLeave(Sender: TObject);
begin
  imgExit.Picture.LoadFromFile('Images\ExitImage1.jpg');
end;

procedure TfrmAddToWatch.imgHomeClick(Sender: TObject);
begin
  frmAddToWatch.Hide;
  frmHome.Show;
end;

procedure TfrmAddToWatch.imgHomeMouseEnter(Sender: TObject);
begin
  imgHome.Picture.LoadFromFile('Images\HomeImage2.jpg');
end;

procedure TfrmAddToWatch.imgHomeMouseLeave(Sender: TObject);
begin
  imgHome.Picture.LoadFromFile('Images\HomeImage1.jpg');
end;

procedure TfrmAddToWatch.InitializeForm;
begin
  //form dimensions
  frmAddToWatch.Left := 0;
  frmAddToWatch.Top := 0;
  frmAddToWatch.Width := Screen.Width;
  frmAddToWatch.Height := Screen.Height;
  frmAddToWatch.Position := poScreenCenter;
  frmAddToWatch.WindowState := wsMaximized;
  frmAddToWatch.Caption := 'Add Watched';
  frmAddToWatch.Color := rgb(frmHome.arrBackgroundColor[1],frmHome.arrBackgroundColor[2],frmHome.arrBackgroundColor[3]);

  //remove border (therefore user cant resize or move the form)
  frmAddToWatch.BorderStyle := bsNone;

  //dynamically create purple header
  shpHeader := TShape.Create(frmAddToWatch);
  shpHeader.Parent := frmAddToWatch;
  shpHeader.Left := 0;
  shpHeader.Top := 0;
  shpHeader.Width := Screen.Width;
  shpHeader.Height := Trunc(0.08 * screen.Height);
  shpHeader.Brush.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
  shpHeader.Pen.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
end;

procedure TfrmAddToWatch.InitializeImages;
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

procedure TfrmAddToWatch.pnlEnterClick(Sender: TObject);
Var
  sName : string;
begin
  //Validation
  if edtname.Text = '' then
  begin
    MessageDLG('Please enter a name for the show',mtError,[mbOK],0);
    EXIT;
  end;

  sName := edtName.Text;

  //confirm
  if MessageDLG('Are you sure you want to enter ' + sName + '?',mtConfirmation,[mbYES,mbNO],0) = mrNo then
  begin
    MessageDLG(sName + ' was not saved',mtInformation,[mbOK],0);
    edtName.Clear;
    EXIT;
  end;

  //save to database
  with dmShowTracker do
  begin
    qryShowTracker.SQL.Clear;
    qryShowTracker.SQL.Add('INSERT INTO ToWatch (ShowName) VALUES (' + QuotedStr(sName) + ')');
    qryShowTracker.ExecSQL;
  end;

  //feedback
  MessageDLG(sName + ' has been successfully saved',mtInformation,[mbOK],0);

  edtName.Clear;
  edtName.Text := 'Enter Show Name';

  frmAddToWatch.Hide;
  frmHome.Show;
end;

procedure TfrmAddToWatch.InitializeComponents;
begin
  //edtName
  edtName.Clear;
  edtName.Text := 'Enter Show Name';
  edtName.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  edtName.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  edtName.BorderStyle := bsNone;
  edtName.Font.Size := 16;
  edtName.Width := Trunc(0.6 * Screen.Width);
  edtName.Height := Trunc(0.03 * Screen.Height);
  edtName.Left := Trunc(0.2 * Screen.Width);
  edtName.Top := Trunc(0.3 * screen.Height);
  edtName.Alignment := taLeftJustify;
  edtName.Cursor := crIBeam;
  edtName.TabOrder := 0;

  //pnlEnter
  pnlEnter.Caption := 'Add Show';
  pnlEnter.ParentBackground := false;
  pnlEnter.ParentColor := false;
  pnlEnter.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  pnlEnter.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  pnlEnter.font.Size := 16;
  pnlEnter.Top := Trunc(0.6 * Screen.Height);
  pnlEnter.Width := Trunc(0.3 * Screen.Width);
  pnlEnter.Height := Trunc(0.03 * Screen.Height);
  pnlEnter.Left := Trunc(0.5 * screen.Width);
  pnlEnter.BorderStyle := bsNone;
  pnlEnter.BevelOuter := bvNone;
  pnlEnter.Cursor := crHandPoint;


end;

end.
