unit Home_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TfrmHome = class(TForm)
    procedure FormCreate(Sender: TObject);
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

{$R *.dfm}

{ TfrmHome }

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
  shpHeader.Height := Trunc(0.05 * screen.Width);
  shpHeader.Brush.Color := rgb(82, 5, 123);
  shpHeader.Pen.Color := rgb(82, 5, 123);

end;

end.
