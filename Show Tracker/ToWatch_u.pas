unit ToWatch_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmToWatch = class(TForm)
    imgHome: TImage;
    imgExit: TImage;
    imgBryn: TImage;
    imgLogo: TImage;
    redToWatch: TRichEdit;
    pnlAdd: TPanel;
    pnlDelete: TPanel;
    pnlRandom: TPanel;
    cmbDelete: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure imgExitClick(Sender: TObject);
    procedure imgExitMouseEnter(Sender: TObject);
    procedure imgExitMouseLeave(Sender: TObject);
    procedure imgHomeClick(Sender: TObject);
    procedure imgHomeMouseEnter(Sender: TObject);
    procedure imgHomeMouseLeave(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnlDeleteClick(Sender: TObject);
    procedure cmbDeleteClick(Sender: TObject);
    procedure pnlRandomClick(Sender: TObject);
  private
    { Private declarations }
    shpHeader : TShape;
    procedure InitializeForm;
    procedure InitializeImages;
    procedure InitializeComponents;
  public
    { Public declarations }
    procedure LoadToWatch;
  end;

var
  frmToWatch: TfrmToWatch;

implementation

uses Home_u, dmShowTracker_u;

{$R *.dfm}

{ TfrmToWatch }

procedure TfrmToWatch.cmbDeleteClick(Sender: TObject);
Var
  sName : string;
begin
  //confirm
  sName := cmbDelete.Items[cmbDelete.ItemIndex];
  if MessageDLG('Are you sure you want to permanently delete ' + sName +
     '?',mtConfirmation,[mbYES,mbNO],0) = mrNO then
     begin
       MessageDLG(sName + ' was not deleted', mtInformation,[mbOK],0);
       pnlDelete.Hide;
       pnlAdd.Show;
       pnlDelete.Show;
       pnlrandom.Show;
       EXIT;
     end;

  //Delete From Database
  with dmShowTracker do
  begin
    qryShowTracker.SQL.Clear;
    qryShowTracker.SQL.Add('DELETE FROM ToWatch WHERE ShowName = ' + QuotedStr(sName));
    qryShowTracker.ExecSQL;
  end;

  //Feedback
  MessageDLG(sName + ' was successfully deleted',mtInformation,[mbOK],0);


  pnlDelete.Hide;
  pnlAdd.Show;
  pnlDelete.Show;
  pnlrandom.Show;
  cmbDelete.Text := 'Select a show to delete from here';


  frmToWatch.Hide;
  frmHome.Show;
end;

procedure TfrmToWatch.FormCreate(Sender: TObject);
begin
  InitializeForm;
  InitializeImages;
  InitializeComponents;
end;

procedure TfrmToWatch.FormShow(Sender: TObject);
begin
  LoadToWatch;
end;

procedure TfrmToWatch.imgExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmToWatch.imgExitMouseEnter(Sender: TObject);
begin
  imgExit.Picture.LoadFromFile('Images\ExitImage2.jpg');
end;

procedure TfrmToWatch.imgExitMouseLeave(Sender: TObject);
begin
  imgExit.Picture.LoadFromFile('Images\ExitImage1.jpg');
end;

procedure TfrmToWatch.imgHomeClick(Sender: TObject);
begin
  frmToWatch.Hide;
  frmHome.Show;
end;

procedure TfrmToWatch.imgHomeMouseEnter(Sender: TObject);
begin
  imgHome.Picture.LoadFromFile('Images\HomeImage2.jpg');
end;

procedure TfrmToWatch.imgHomeMouseLeave(Sender: TObject);
begin
  imgHome.Picture.LoadFromFile('Images\HomeImage1.jpg');
end;

procedure TfrmToWatch.InitializeComponents;
begin
  //redToWatch
  redToWatch.Width := Screen.Width;
  redToWatch.Height := Trunc(0.8 * Screen.Height) - shpHeader.Height;
  redToWatch.Top := shpHeader.Height;
  redToWatch.Left := 0;
  redToWatch.Color := rgb(frmHome.arrBackgroundColor[1],frmHome.arrBackgroundColor[2],frmHome.arrBackgroundColor[3]);
  redToWatch.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  redToWatch.Font.Size := 16;
  redToWatch.Clear;
  redToWatch.BorderStyle := bsNone;
  redToWatch.ScrollBars := ssVertical;
  redToWatch.ReadOnly := True;
  redToWatch.TabStop := false;
  redToWatch.Cursor := crDefault;
  redToWatch.Paragraph.TabCount := 1;
  redToWatch.Paragraph.Tab[0] := Trunc(0.5 * Screen.Width);


  //pnlAdd
  pnlAdd.Caption := 'Add Show';
  pnlAdd.ParentBackground := false;
  pnlAdd.ParentColor := false;
  pnlAdd.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  pnlAdd.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  pnlAdd.font.Size := 16;
  pnlAdd.Top := Trunc(0.85 * Screen.Height);
  pnlAdd.Width := Trunc(0.29 * Screen.Width);
  pnlAdd.Height := Trunc(0.03 * Screen.Height);
  pnlAdd.Left := Trunc(0.2 * Screen.Width);
  pnlAdd.BorderStyle := bsNone;
  pnlAdd.BevelOuter := bvNone;
  pnlAdd.Cursor := crHandPoint;

  //pnlDelete
  pnlDelete.Caption := 'Delete Show';
  pnlDelete.ParentBackground := false;
  pnlDelete.ParentColor := false;
  pnlDelete.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  pnlDelete.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  pnlDelete.font.Size := 16;
  pnlDelete.Top := Trunc(0.85 * Screen.Height);
  pnlDelete.Width := Trunc(0.29 * Screen.Width);
  pnlDelete.Height := Trunc(0.03 * Screen.Height);
  pnlDelete.Left := Trunc(0.51 * Screen.Width);
  pnlDelete.BorderStyle := bsNone;
  pnlDelete.BevelOuter := bvNone;
  pnlDelete.Cursor := crHandPoint;

  //pnlRandom
  pnlRandom.Caption := 'Pick a Randow Show';
  pnlRandom.ParentBackground := false;
  pnlRandom.ParentColor := false;
  pnlRandom.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  pnlRandom.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  pnlRandom.font.Size := 16;
  pnlRandom.Top := Trunc(0.9 * Screen.Height);
  pnlRandom.Width := Trunc(0.6 * Screen.Width);
  pnlRandom.Height := Trunc(0.03 * Screen.Height);
  pnlRandom.Left := Trunc(0.2 * Screen.Width);
  pnlRandom.BorderStyle := bsNone;
  pnlRandom.BevelOuter := bvNone;
  pnlRandom.Cursor := crHandPoint;

  //cmbDelete
  cmbDelete.Left := Trunc(0.2 * Screen.Width);
  cmbDelete.Top := Trunc(0.9 * Screen.Height);
  cmbDelete.Width := Trunc(0.6 * Screen.Width);
  cmbDelete.Font.Size := 16;
  cmbDelete.font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  cmbDelete.Text := 'Select a show to delete from here';
  cmbDelete.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  cmbDelete.Hide;
end;

procedure TfrmToWatch.InitializeForm;
begin
  //form dimensions
  frmToWatch.Left := 0;
  frmToWatch.Top := 0;
  frmToWatch.Width := Screen.Width;
  frmToWatch.Height := Screen.Height;
  frmToWatch.Position := poScreenCenter;
  frmToWatch.WindowState := wsMaximized;
  frmToWatch.Caption := 'Add Watched';
  frmToWatch.Color := rgb(frmHome.arrBackgroundColor[1],frmHome.arrBackgroundColor[2],frmHome.arrBackgroundColor[3]);

  //remove border (therefore user cant resize or move the form)
  frmToWatch.BorderStyle := bsNone;

  //dynamically create purple header
  shpHeader := TShape.Create(frmToWatch);
  shpHeader.Parent := frmToWatch;
  shpHeader.Left := 0;
  shpHeader.Top := 0;
  shpHeader.Width := Screen.Width;
  shpHeader.Height := Trunc(0.08 * screen.Height);
  shpHeader.Brush.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
  shpHeader.Pen.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
end;

procedure TfrmToWatch.InitializeImages;
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

procedure TfrmToWatch.LoadToWatch;
Var
  sLine, sLine2 : string;
begin
  redTowatch.Clear;
  //Load From shows from Database
  dmShowTracker.tblToWatch.Open;
  dmShowTracker.tblToWatch.First;

  repeat
    sLine := dmShowTracker.tblToWatch['ShowName'];
    dmShowTracker.tblToWatch.Next;
    if dmShowTracker.tblToWatch.Eof then
    begin
      redToWatch.Lines.Add(sLine);
      break;
    end;
    sLine2 := dmShowTracker.tblToWatch['ShowName'];
    dmShowTracker.tblToWatch.Next;
    redToWatch.Lines.Add(sLine + #9 + sLine2 + #13);
  until (dmShowTracker.tblToWatch.Eof) ;

  dmShowTracker.tblToWatch.Close;

  //populate cmbDelete
  cmbDelete.Clear;
  cmbDelete.Text := 'Select a show to delete from here';
  dmShowTracker.tblToWatch.Open;
  dmShowTracker.tblToWatch.First;

  repeat
    cmbDelete.items.Add(dmShowTracker.tblToWatch['ShowName']);
    dmShowTracker.tblToWatch.Next;
  until (dmShowTracker.tblToWatch.Eof) ;

  dmShowTracker.tblToWatch.Close;

end;

procedure TfrmToWatch.pnlDeleteClick(Sender: TObject);
begin

  pnlDelete.Hide;
  pnlAdd.Hide;
  pnlRandom.Hide;
  cmbDelete.Show;
end;

procedure TfrmToWatch.pnlRandomClick(Sender: TObject);
Var
  iRandom, iRecordCount : integer;
begin
  dmShowTracker.tblToWatch.Open;
  iRecordCount := dmShowTracker.tblToWatch.RecordCount;

  iRandom := Random(iRecordCount) + 1;

  dmShowTracker.tblToWatch.RecNo := iRandom;

  MessageDLG('Random Show: ' + dmShowTracker.tblToWatch['ShowName'], mtInformation, [mbOK],0);
end;

end.
