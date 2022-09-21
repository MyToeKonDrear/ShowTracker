unit Watched_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids;

type
  TfrmWatched = class(TForm)
    imgBryn: TImage;
    imgHome: TImage;
    imgExit: TImage;
    imgLogo: TImage;
    stgWatched: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgExitMouseEnter(Sender: TObject);
    procedure imgExitMouseLeave(Sender: TObject);
    procedure imgHomeMouseEnter(Sender: TObject);
    procedure imgHomeMouseLeave(Sender: TObject);
    procedure imgHomeClick(Sender: TObject);
    procedure imgExitClick(Sender: TObject);
    procedure stgWatchedDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure stgWatchedDblClick(Sender: TObject);
  private
    { Private declarations }
    shpHeader : TShape;
    procedure InitializeForm;
    procedure InitializeComponents;
    procedure InitializeImages;
  public
    { Public declarations }
    iRecordNo : integer;
    procedure PopulatestgWatched;
  end;

var
  frmWatched: TfrmWatched;

implementation

uses Home_u, dmShowTracker_u, ShowDetails_u;

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
  InitializeImages;
end;

procedure TfrmWatched.FormShow(Sender: TObject);
begin
  PopulatestgWatched;
end;

procedure TfrmWatched.imgExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmWatched.imgExitMouseEnter(Sender: TObject);
begin
  imgExit.Picture.LoadFromFile('Images\ExitImage2.jpg');
end;

procedure TfrmWatched.imgExitMouseLeave(Sender: TObject);
begin
  imgExit.Picture.LoadFromFile('Images\ExitImage1.jpg');
end;

procedure TfrmWatched.imgHomeClick(Sender: TObject);
begin
  frmHome.Show;
  frmWatched.Hide;
end;

procedure TfrmWatched.imgHomeMouseEnter(Sender: TObject);
begin
  imgHome.Picture.LoadFromFile('Images\HomeImage2.jpg');
end;

procedure TfrmWatched.imgHomeMouseLeave(Sender: TObject);
begin
  imgHome.Picture.LoadFromFile('Images\HomeImage1.jpg');
end;

procedure TfrmWatched.InitializeComponents;
begin
  //stgWatched
  stgWatched.Left := 0;
  stgWatched.Top := shpHeader.Height;
  stgWatched.width := Screen.Width;
  stgWatched.Height := Trunc(0.99 * (screen.Height - shpHEader.Height));
  stgWatched.Font.Size := 16;
  stgWatched.FixedCols := 0;
  stgWatched.FixedRows := 0;
  stgWatched.BorderStyle := bsNone;
  stgWatched.BevelInner := bvNone;
  stgWatched.BevelOuter := bvNone;
  stgWatched.ScrollBars := ssVertical;
  stgWatched.GridLineWidth := 0;
  //stgWatched.Canvas.Brush.Color := rgb(frmHome.arrBackgroundColor[1],frmHome.arrBackgroundColor[2],frmHome.arrBackgroundColor[3]);
  // stgWatched.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  stgWatched.DefaultDrawing := false;
  stgwatched.Cursor := crHandPoint;
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
  shpHeader.Height := Trunc(0.08 * screen.Height);
  shpHeader.Brush.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
  shpHeader.Pen.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
end;

procedure TfrmWatched.InitializeImages;
begin
  //imglogo
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

procedure TfrmWatched.PopulatestgWatched;
Var
  iOrderWatched, iRow : integer;
begin
  //setup size and count of rows and coloumns
  stgWatched.ColCount := 4;
  dmShowTRacker.tblWatched.Open;
  stgWatched.RowCount := dmShowTracker.tblWatched.RecordCount + 1;//skip a row between each entry for aesthetically-pleasing spacing
  dmShowTracker.tblWatched.Close;

  stgWatched.ColWidths[0] := Trunc(0.05 * Screen.Width);
  stgWatched.ColWidths[1] := Trunc(0.45 * Screen.Width);
  stgWatched.ColWidths[2] := Trunc(0.05 * Screen.Width);
  stgWatched.ColWidths[3] := Trunc(0.44 * Screen.Width); //not 45% because then grid shifts to the right when column 3 names are selected

  dmShowTracker.tblWatched.Open;
  dmShowTracker.tblWatched.First;
  iOrderWatched := 1;
  iRow := 0;
  repeat
    stgWatched.Cells[0, iRow] := IntToStr(iORderWatched);
    stgWatched.Cells[1, iRow] := dmShowTracker.tblWatched['ShowName'];
    inc(iOrderWatched);
    dmShowTracker.tblWatched.Next;
    if dmShowTracker.tblWatched.Eof = true then break;    
    stgWatched.Cells[2, iRow] := IntToStr(iOrderWatched);
    stgWatched.Cells[3, iRow] := dmShowTRacker.tblWatched['ShowName'];
    iRow := iRow + 2;
    inc(iOrderWatched);
    dmShowTRacker.tblWatched.Next;
  until (dmShowTracker.tblWatched.Eof);
  dmShowTracker.tblWatched.Close;

  stgWatched.Row := stgwatched.VisibleRowCount - 1;
end;

procedure TfrmWatched.stgWatchedDblClick(Sender: TObject);
begin
  if (stgWatched.Col = 0) OR (stgWatched.Col = 2) then
    EXIT;
  iRecordNo := 0;
  if stgWatched.Col = 1 then
    iRecordNo := stgWatched.Row + 1  //plus one because database index(RecNo) starts from 1 not 0 like stringGrid
  else iRecordNo := stgWatched.Row + 2;

  frmWatched.hide;
  frmShowDetails.Show;
end;

procedure TfrmWatched.stgWatchedDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  stgWatched.Canvas.Brush.Color := rgb(frmHome.arrBackgroundColor[1],frmHome.arrBackgroundColor[2],frmHome.arrBackgroundColor[3]);
  stgWatched.Canvas.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  stgWatched.Canvas.Font.Size := 16;
  stgWatched.Canvas.FillRect(Rect);
  stgWatched.Canvas.TextOut(Rect.Left,Rect.Top,stgWAtched.Cells[ACol,ARow]);

  if (stgWatched.Col = aCol) AND (stgWatched.Row = aRow) AND (stgWatched.Col <> 0) AND (stgWatched.Col <> 2) then
    with stgWatched do
    begin
      //paint the background Green
      Canvas.Font.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
      Canvas.FillRect(Rect);
      Canvas.TextOut(Rect.Left+2,Rect.Top+2,Cells[ACol, ARow]);
    end;
end;

end.
