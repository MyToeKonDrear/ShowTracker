unit ShowDetails_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmShowDetails = class(TForm)
    lblShowName: TLabel;
    lblSeasons: TLabel;
    lblTimesWatched: TLabel;
    bvlDetailsBorder: TBevel;
    pnlEdit: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    shpHeader : TShape;
    procedure InitializeForm;
    procedure InitializeComponents;
    procedure LoadShowDetails;
  public
    { Public declarations }
  end;

var
  frmShowDetails: TfrmShowDetails;

implementation

uses Home_u, Watched_u, dmShowTracker_u;

{$R *.dfm}

{ TfrmShowDetails }

procedure TfrmShowDetails.FormCreate(Sender: TObject);
begin
  InitializeForm;
  InitializeComponents;
end;

procedure TfrmShowDetails.FormShow(Sender: TObject);
begin
  LoadShowDetails;
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
  lblShowName.Font.Size := 16;
  lblShowName.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  lblShowName.Caption := 'Default caption as;dlkalsdka;sdkasdlkjasdkljahsdjkashdajksdasd';

  //lblSeasons
  lblSeasons.Left := Trunc(0.25 * Screen.Width);
  lblSeasons.top := Trunc(0.2 * Screen.Height);
  lblSeasons.Font.Size := 16;
  lblSeasons.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  lblSeasons.Caption := 'Seasons and episodes watched go here';

  //lblTimesWatched
  lblTimesWatched.Left := Trunc(0.25 * Screen.Width);
  lblTimesWatched.top := Trunc(0.3 * Screen.Height);
  lblTimesWatched.Font.Size := 16;
  lblTimesWatched.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  lblTimesWatched.Caption := 'Number of times the show has been watched goes ' + #13 + 'here';

  //pnlEdit
  pnlEdit.Caption := 'Edit Show';
  pnlEdit.ParentBackground := false;
  pnlEdit.ParentColor := false;
  pnlEdit.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  pnlEdit.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  pnlEdit.font.Size := 16;
  pnlEdit.Top := Trunc(0.9 * Screen.Height);
  pnlEdit.Width := Trunc(0.3 * Screen.Width);
  pnlEdit.Height := Trunc(0.03 * Screen.Height);
  pnlEdit.Left := Trunc(0.5 * Screen.Width);
  pnlEdit.BorderStyle := bsNone;
  pnlEdit.BevelOuter := bvNone;
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

procedure TfrmShowDetails.LoadShowDetails;
begin
  dmShowTracker.tblWatched.Open;
  dmShowTracker.tblWatched.RecNo := frmWatched.iRecordNo;

  lblShowName.Caption := dmShowTracker.tblWatched['ShowName'];
  lblSeasons.Caption := 'Seasons Watched: ' + #9 + IntToStr(dmShowTracker.tblWatched['Seasons']) + #13 +
                        'Episodes Watched: ' + #9 + IntToStr(dmShowTracker.tblWatched['Seasons']);
  lblTimesWatched.Caption := 'Number of times you have watched the show: ' + #9 + IntToStr(dmShowTracker.tblWatched['TimesWatched']);

  dmShowTracker.tblWatched.Close;
end;

end.
