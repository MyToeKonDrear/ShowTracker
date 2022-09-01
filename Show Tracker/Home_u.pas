unit Home_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmHome = class(TForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    shpHeader : TShape;
    procedure InitializeForm;
  public
    { Public declarations }
  end;

var
  frmHome: TfrmHome;

implementation

uses Watched_u;

{$R *.dfm}

{ TfrmHome }

procedure TfrmHome.Button1Click(Sender: TObject);
begin
  frmHome.Hide;
  frmWatched.Show;
end;

procedure TfrmHome.FormCreate(Sender: TObject);
begin
  InitializeForm;
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
  frmHome.Color := rgb(0,0,0);

  //remove border (therefore user cant resize or move the form)
  frmHome.BorderStyle := bsNone;

  //dynamically create purple header
  shpHeader := TShape.Create(frmHome);
  shpHeader.Parent := frmHome;
  shpHeader.Left := 0;
  shpHeader.Top := 0;
  shpHeader.Width := Screen.Width;
  shpHeader.Height := Trunc(0.08 * screen.Height);
  shpHeader.Brush.Color := rgb(82, 5, 123);
  shpHeader.Pen.Color := rgb(82, 5, 123);
end;

end.
