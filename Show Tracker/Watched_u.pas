unit Watched_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmWatched = class(TForm)
    redWatched: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    shpHeader : TShape;
    procedure InitializeForm;
    procedure InitializeComponents;
  public
    { Public declarations }
    procedure LoadWatchedShows;
  end;

var
  frmWatched: TfrmWatched;

implementation

uses Home_u, dmShowTracker_u;

{$R *.dfm}

{ TfrmWatched }

procedure TfrmWatched.Button1Click(Sender: TObject);
begin
  frmWatched.Hide;
  frmHome.Show;
end;

procedure TfrmWatched.FormCreate(Sender: TObject);
begin
  InitializeForm;
  InitializeComponents;
end;

procedure TfrmWatched.FormShow(Sender: TObject);
begin
  LoadWatchedShows;
end;

procedure TfrmWatched.InitializeComponents;
begin
  //redWatched initialization
  redWatched.Clear;
  redWatched.Top := trunc(0.08 * Screen.Height);
  redWatched.Left := 0;
  redWatched.Width := Screen.Width;
  redWatched.Height := (Screen.Height - shpHeader.Height);
  redWatched.Color := rgb(frmHome.arrBackgroundColor[1],frmHome.arrBackgroundColor[2],frmHome.arrBackgroundColor[3]);
  redWatched.font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  redWatched.Font.Size := 16;
  redWatched.ScrollBars := ssVertical;
  redWatched.HideScrollBars := false;
  redWatched.BorderStyle := bsNone;
  redWatched.ReadOnly := true;
  redWatched.TabStop := false;
  redWatched.Paragraph.TabCount := 3;
  redWatched.Paragraph.Tab[0] := 50;
  redWatched.Paragraph.Tab[1] := 700;
  redWatched.Paragraph.Tab[2] := 750;
end;

procedure TfrmWatched.InitializeForm;
begin
  //form dimensions
  frmWatched.Left := 0;
  frmWatched.Top := 0;
  frmWatched.Width := Screen.Width;
  frmWatched.Height := Screen.Height;
  frmWatched.Position := poScreenCenter;
  frmWatched.WindowState := wsMaximized;
  frmWatched.Caption := 'Home';
  frmWatched.Color := rgb(frmHome.arrBackgroundColor[1],frmHome.arrBackgroundColor[2],frmHome.arrBackgroundColor[3]);

  //remove border (therefore user cant resize or move the form)
  frmWatched.BorderStyle := bsNone;

  //dynamically create purple header
  shpHeader := TShape.Create(frmWatched);
  shpHeader.Parent := frmWatched;
  shpHeader.Left := 0;
  shpHeader.Top := 0;
  shpHeader.Width := Screen.Width;
  shpHeader.Height := Trunc(0.05 * screen.Width);
  shpHeader.Brush.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
  shpHeader.Pen.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
end;

procedure TfrmWatched.LoadWatchedShows;
Var
  i, iOrderWatched : integer;
  sLine : string;
begin
  redWatched.Clear;

  iOrderWatched := 1;
  dmShowTracker.tblWatched.Open;
  dmShowTracker.tblWatched.First;
    repeat
      sLine := '';
      sline := #13 + IntToStr(iOrderWatched) + #9 + dmShowTracker.tblWatched['ShowName'] + #9;
      inc(iOrderWatched);
      dmShowTracker.tblWatched.Next;
      sLine := sLine + IntToStr(iOrderWatched) + #9 + dmShowTracker.tblWatched['ShowName'];
      inc(iOrderWatched);
      dmShowTracker.tblWatched.Next;
      redWatched.Lines.Add(sLine);
    until (dmShowTracker.tblWatched.Eof);
  dmShowTracker.tblWatched.Close;
end;

end.
