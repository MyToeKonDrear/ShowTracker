unit Edit_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Samples.Spin;

type
  TfrmEdit = class(TForm)
    edtShowName: TEdit;
    lblTimesWatched: TLabel;
    spnTimesWatched: TSpinEdit;
    lblSeasons: TLabel;
    spnSeasons: TSpinEdit;
    pnlEnter: TPanel;
    lblChoice: TLabel;
    pnlSeasons: TPanel;
    pnlTimesWatched: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnlTimesWatchedClick(Sender: TObject);
    procedure pnlSeasonsClick(Sender: TObject);
  private
    { Private declarations }
    shpHeader : TShape;
    procedure InitializeForm;
    procedure InitializeComponents;
  public
    { Public declarations }
  end;

var
  frmEdit: TfrmEdit;

implementation

uses Home_u, ShowDetails_u, dmShowTracker_u, Watched_u;

{$R *.dfm}

{ TfrmEdit }

procedure TfrmEdit.FormCreate(Sender: TObject);
begin
  InitializeForm;
  InitializeComponents;
end;

procedure TfrmEdit.FormShow(Sender: TObject);
begin
  dmShowTracker.tblWatched.Open;
  dmShowTracker.tblWatched.RecNo := frmWatched.iRecordNo;
  edtShowName.Text := dmShowTracker.tblWatched['ShowName'];
  dmShowTracker.tblWatched.Close;
end;

procedure TfrmEdit.InitializeComponents;
begin
  //edtShowName
  edtShowName.Clear;
  edtShowName.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  edtShowName.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  edtShowName.BorderStyle := bsNone;
  edtShowName.Font.Size := 16;
  edtShowName.Width := Trunc(0.5 * Screen.Width);
  edtShowName.Height := Trunc(0.03 * Screen.Height);
  edtShowName.Left := Trunc(0.25 * Screen.Width);
  edtSHowName.Top := Trunc(0.15 * screen.Height);
  edtShowName.Alignment := taLeftJustify;
  edtShowName.Cursor := crIBeam;
  edtShowName.TabOrder := 0;

  //lblChoice
  lblChoice.Left := Trunc(0.25 * Screen.Width);
  lblChoice.top := Trunc(0.3 * Screen.Height);
  lblChoice.Caption := 'Do you want to add new seasons that you have watched or ' + #13 +
                       'change the number of times the show has been watched?';
  lblChoice.Font.Size := 16;
  lblChoice.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);

  //pnlSeasons
  pnlSeasons.Caption := 'Seasons';
  pnlSeasons.ParentBackground := false;
  pnlSeasons.ParentColor := false;
  pnlSeasons.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  pnlSeasons.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  pnlSeasons.font.Size := 16;
  pnlSeasons.Top := Trunc(0.4 * Screen.Height);
  pnlSeasons.Width := Trunc(0.24 * Screen.Width);
  pnlSeasons.Height := Trunc(0.03 * Screen.Height);
  pnlSeasons.Left := Trunc(0.25 * Screen.Width);
  pnlSeasons.BorderStyle := bsNone;
  pnlSeasons.BevelOuter := bvNone;

  //pnlTimesWatched
  pnlTimesWatched.Caption := 'Times Watched';
  pnlTimesWatched.ParentBackground := false;
  pnlTimesWatched.ParentColor := false;
  pnlTimesWatched.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  pnlTimesWatched.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  pnlTimesWatched.font.Size := 16;
  pnlTimesWatched.Top := Trunc(0.4 * Screen.Height);
  pnlTimesWatched.Width := Trunc(0.24 * Screen.Width);
  pnlTimesWatched.Height := Trunc(0.03 * Screen.Height);
  pnlTimesWatched.Left := Trunc(0.51 * Screen.Width);
  pnlTimesWatched.BorderStyle := bsNone;
  pnlTimesWatched.BevelOuter := bvNone;

  //lblTimesWatched
  lblTimesWatched.Left := Trunc(0.25 * Screen.Width);
  lblTimesWatched.top := Trunc(0.3 * Screen.Height);
  lblTimesWatched.Caption := 'How many times in total have you watched the show?';
  lblTimesWatched.Font.Size := 16;
  lblTimesWatched.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  lblTimesWAtched.Hide;

  //spnTimesWatched
  spnTimesWatched.Value := 0;
  spnTimesWatched.MinValue := 0;
  spnTimesWatched.MaxValue := 100;
  spnTimesWatched.Font.Size := 16;
  spnTimesWatched.Font.color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  spnTimesWatched.Width := Trunc(0.25 * SCreen.Width);
  spnTimesWatched.Height := Trunc(0.03 * Screen.Height);
  spnTimesWatched.Top := Trunc(0.4 * Screen.Height);
  spnTimesWatched.Left := Trunc(0.25 * Screen.Width);
  spnTimesWatched.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  spnTimesWatched.Hide;

  //lblSeasons
  lblSeasons.Left := Trunc(0.25 * Screen.Width);
  lblSeasons.top := Trunc(0.3 * Screen.Height);
  lblSeasons.Caption := 'Which new seasons did you watch?' + #13 +
                        'If it is more than one, enter up to the last seasons you completed';
  lblSeasons.Font.Size := 16;
  lblSeasons.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  lblSeasons.Hide;

  //spnSeasons
  spnSeasons.Value := 0;
  spnSeasons.MinValue := 0;
  spnSeasons.MaxValue := 100;
  spnSeasons.Font.Size := 16;
  spnSeasons.Font.color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  spnSeasons.Width := Trunc(0.25 * Screen.Width);
  spnSeasons.Height := Trunc(0.03 * Screen.Height);
  spnSeasons.Top := Trunc(0.4 * Screen.Height);
  spnSeasons.Left := Trunc(0.25 * Screen.Width);
  spnSeasons.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  spnSeasons.hide;

  //pnlEnter
  pnlEnter.Caption := 'Enter';
  pnlEnter.ParentBackground := false;
  pnlEnter.ParentColor := false;
  pnlEnter.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  pnlEnter.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  pnlEnter.font.Size := 16;
  pnlEnter.Top := Trunc(0.8 * Screen.Height);
  pnlEnter.Width := Trunc(0.25 * Screen.Width);
  pnlEnter.Height := Trunc(0.03 * Screen.Height);
  pnlEnter.Left := Trunc(0.5 * Screen.Width);
  pnlEnter.BorderStyle := bsNone;
  pnlEnter.BevelOuter := bvNone;
end;

procedure TfrmEdit.InitializeForm;
begin
  //form dimensions
  frmEdit.Left := 0;
  frmEdit.Top := 0;
  frmEdit.Width := Screen.Width;
  frmEdit.Height := Screen.Height;
  frmEdit.Position := poScreenCenter;
  frmEdit.WindowState := wsMaximized;
  frmEdit.Color := rgb(frmHome.arrBackgroundcolor[1],frmHome.arrBackgroundcolor[2],frmHome.arrBackgroundcolor[3]);

  //remove border (therefore user cant resize or move the form)
  frmEdit.BorderStyle := bsNone;

  //dynamically create purple header
  shpHeader := TShape.Create(frmEdit);
  shpHeader.Parent := frmEdit;
  shpHeader.Left := 0;
  shpHeader.Top := 0;
  shpHeader.Width := Screen.Width;
  shpHeader.Height := Trunc(0.08 * screen.Height);
  shpHeader.Brush.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
  shpHeader.Pen.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
end;

procedure TfrmEdit.pnlSeasonsClick(Sender: TObject);
begin
  pnlSeasons.Hide;
  lblChoice.Hide;
  pnlTimesWatched.Hide;
  lblSeasons.Show;
  spnSeasons.Show;
end;

procedure TfrmEdit.pnlTimesWatchedClick(Sender: TObject);
begin
  pnlTimesWatched.Hide;
  pnlSeasons.Hide;
  lblChoice.Hide;
  lblTimesWatched.Show;
  spnTimesWatched.Show;
end;

end.
