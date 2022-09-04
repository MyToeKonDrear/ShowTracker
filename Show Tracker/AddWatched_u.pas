unit AddWatched_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Samples.Spin, Vcl.WinXPickers;

type
  TfrmAddWatched = class(TForm)
    edtShowName: TEdit;
    spnSeasons: TSpinEdit;
    lblSeasons: TLabel;
    lblEpisodes: TLabel;
    spnEpisodes: TSpinEdit;
    lblDateCompleted: TLabel;
    dpDateCompleted: TDatePicker;
    procedure FormCreate(Sender: TObject);
    procedure edtShowNameMouseEnter(Sender: TObject);
  private
    { Private declarations }
    shpHeader : TShape;
    procedure InitializeForm;
    procedure InitializeComponents;
  public
    { Public declarations }
  end;

var
  frmAddWatched: TfrmAddWatched;

implementation

uses Home_u;

{$R *.dfm}

{ TfrmAddWatched }

procedure TfrmAddWatched.edtShowNameMouseEnter(Sender: TObject);
begin
  //change color and caption of edtShowName
  edtShowName.Text := '';
  edtShowName.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
end;

procedure TfrmAddWatched.FormCreate(Sender: TObject);
begin
  InitializeForm;
  InitializeComponents;
end;

procedure TfrmAddWatched.InitializeComponents;
begin
  //edtShowName
  edtShowName.Clear;
  edtShowName.Text := 'Enter the name of the show';
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

  //lblSeasons
  lblSeasons.Caption := 'How many seasons did you watch?';
  lblSeasons.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  lblSeasons.Font.Size := 16;
  lblSeasons.Left := Trunc(0.25 * Screen.width);
  lblSeasons.Top := Trunc(0.3 * Screen.Height);

  //spnSeasons
  spnSeasons.Value := 0;
  spnSeasons.MinValue := 0;
  spnSeasons.MaxValue := 100;
  spnSeasons.Font.Size := 16;
  spnSeasons.Font.color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  spnSeasons.Width := lblSeasons.Width;
  spnSeasons.Top := Trunc(0.34 * Screen.Height);
  spnSeasons.Left := Trunc(0.25 * Screen.Width);
  spnSeasons.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);

  //lblEpisodes
  lblEpisodes.Caption := 'How many episodes did you watch? Leave at 0 if you completed the season';
  lblEpisodes.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  lblEpisodes.Font.Size := 16;
  lblEpisodes.Left := Trunc(0.25 * Screen.width);
  lblEpisodes.Top := Trunc(0.5 * Screen.Height);

  //spnEpisodes
  spnEpisodes.Value := 0;
  spnEpisodes.MinValue := 0;
  spnEpisodes.MaxValue := 100;
  spnEpisodes.Font.Size := 16;
  spnEpisodes.Font.color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  spnEpisodes.Width := lblSeasons.Width;
  spnEpisodes.Top := Trunc(0.54 * Screen.Height);
  spnEpisodes.Left := Trunc(0.25 * Screen.Width);
  spnEpisodes.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);

  //lblDateCompleted
  lblDateCompleted.Caption := 'What date did you complete the show on?';
  lblDateCompleted.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  lblDateCompleted.Font.Size := 16;
  lblDateCompleted.Left := Trunc(0.25 * Screen.width);
  lblDateCompleted.Top := Trunc(0.7 * Screen.Height);

  //dpDateCompleted
  dpDateCompleted.Date := Date;
  dpDateCompleted.Left := Trunc(0.25 * Screen.Width);
  dpDateCompleted.Top := Trunc(0.74 * Screen.Height);
  dpDateCompleted.Width := lblSeasons.Width;
  dpDateCompleted.Height := edtShowName.Height;
  dpDateCompleted.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  dpDateCompleted.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  dpDateCompleted.Font.Size := 16;
  dpDateCompleted.SelectionColor := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  dpDateCompleted.SelectionFontColor := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
  dpDateCompleted.PopupColor := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  dpDateCompleted.HighlightColor := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
  dpDAteCompleted.HotColor :=  rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  dpDateCompleted.BorderStyle := bsNone;
  dpDateCompleted.DateFormat := 'dd/MMM/yyyy';
end;

procedure TfrmAddWatched.InitializeForm;
begin
  //form dimensions
  frmAddWatched.Left := 0;
  frmAddWatched.Top := 0;
  frmAddWatched.Width := Screen.Width;
  frmAddWatched.Height := Screen.Height;
  frmAddWatched.Position := poScreenCenter;
  frmAddWatched.WindowState := wsMaximized;
  frmAddWatched.Caption := 'Add Watched';
  frmAddWatched.Color := rgb(frmHome.arrBackgroundColor[1],frmHome.arrBackgroundColor[2],frmHome.arrBackgroundColor[3]);

  //remove border (therefore user cant resize or move the form)
  frmAddWatched.BorderStyle := bsNone;

  //dynamically create purple header
  shpHeader := TShape.Create(frmAddWatched);
  shpHeader.Parent := frmAddWatched;
  shpHeader.Left := 0;
  shpHeader.Top := 0;
  shpHeader.Width := Screen.Width;
  shpHeader.Height := Trunc(0.05 * screen.Width);
  shpHeader.Brush.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
  shpHeader.Pen.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
end;

end.
