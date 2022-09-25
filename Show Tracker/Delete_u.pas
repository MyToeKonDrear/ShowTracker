unit Delete_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, vcl.ExtCtrls, Vcl.StdCtrls, StrUtils;

type
  TfrmDelete = class(TForm)
    cmbShowNames: TComboBox;
    lblSelect: TLabel;
    edtSearch: TEdit;
    lblSearch: TLabel;
    pnlDelete: TPanel;
    pnlSearch: TPanel;
    lblDelete: TLabel;
    cmbTimesWatched: TComboBox;
    lblTimesWatched: TLabel;
    cmbSeasons: TComboBox;
    lblSeasons: TLabel;
    lblName: TLabel;
    imgLogo: TImage;
    imgHome: TImage;
    imgBryn: TImage;
    imgExit: TImage;
    Image5: TImage;
    procedure FormCreate(Sender: TObject);
    procedure cmbShowNamesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnlDeleteClick(Sender: TObject);
    procedure edtSearchClick(Sender: TObject);
    procedure pnlSearchClick(Sender: TObject);
    procedure cmbSeasonsClick(Sender: TObject);
    procedure cmbTimesWatchedClick(Sender: TObject);
    procedure imgExitClick(Sender: TObject);
    procedure imgExitMouseEnter(Sender: TObject);
    procedure imgExitMouseLeave(Sender: TObject);
    procedure imgHomeClick(Sender: TObject);
    procedure imgHomeMouseEnter(Sender: TObject);
    procedure imgHomeMouseLeave(Sender: TObject);
    procedure pnlSearchMouseEnter(Sender: TObject);
    procedure pnlSearchMouseLeave(Sender: TObject);
    procedure pnlDeleteMouseEnter(Sender: TObject);
    procedure pnlDeleteMouseLeave(Sender: TObject);
  private
    { Private declarations }
    shpHeader : TShape;
    iID, iRecordNo, iCount : integer;
    arrPrimaryKeySeasons : array [1..100] of integer;
    arrPrimaryKeyTimesWatched : array [1..100] of integer;
    procedure InitializeForm;
    procedure InitializeComponents;
    procedure InitializeImages;
  public
    { Public declarations }
  end;

var
  frmDelete: TfrmDelete;

implementation

uses Home_u, Watched_u, dmShowTracker_u;

{$R *.dfm}

{ TfrmDelete }

procedure TfrmDelete.cmbSeasonsClick(Sender: TObject);
Var
  sName : string;
  iPrimaryKey : integer;
begin
  sName := cmbSeasons.Items[cmbSeasons.ItemIndex];
  iPrimaryKey := arrPrimaryKeySeasons[cmbSeasons.ItemIndex + 1];

  //confirm
  if MessageDLG('Are you sure you want to permanently delete ' + sName +
     '?',mtConfirmation,[mbYES,mbNO],0) = mrNO then
     begin
       MessageDLG(sName + ' was not deleted', mtInformation,[mbOK],0);
       EXIT;
     end;

  //delete from database
  with dmShowTracker do
  begin
    qryShowTracker.SQL.Clear;
    qryShowTracker.SQL.Add('DELETE FROM NewSeasons WHERE PrimaryKey = ' + intToStr(iPrimaryKey));
    qryShowTracker.ExecSQL;
  end;

  //feedback
  MessageDLG(sName + ' was successfully deleted',mtInformation,[mbOK],0);

  lblSearch.Show;
  cmbShowNames.Show;
  lblSelect.Show;
  edtSearch.Show;
  pnlSearch.Show;
  lblname.Hide;
  lblTimesWatched.Hide;
  cmbTimesWatched.Hide;
  lblSeasons.Hide;
  cmbSeasons.Hide;
  pnlDelete.Hide;

  frmDelete.Hide;
  frmHome.Show;

end;

procedure TfrmDelete.cmbShowNamesClick(Sender: TObject);
Var sName, sShowName : string;
    bFound : boolean;
begin
  //confirm
  {sName := cmbShowNames.Items[cmbShowNames.ItemIndex];
  if MessageDLG('Are you sure you want to permanently delete ' + sName +
     '?',mtConfirmation,[mbYES,mbNO],0) = mrNO then
     begin
       MessageDLG(sName + ' was not deleted', mtInformation,[mbOK],0);
       EXIT;
     end;

  //Delete From Database
  with dmShowTracker do
  begin
    qryShowTracker.SQL.Clear;
    qryShowTracker.SQL.Add('DELETE FROM Watched WHERE ShowName = ' + QuotedStr(sName));
    qryShowTracker.ExecSQL;
  end;

  //Feedback
  MessageDLG(sName + ' was successfully deleted',mtInformation,[mbOK],0); }

  sName := cmbShowNames.Items[cmbShowNames.ItemIndex];

  sShowName := '';
  bFound := false;
  iRecordNo := 0;
  iID := 0;

  //search for name in database
  dmShowTracker.tblWatched.Open;
  dmShowTracker.tblWatched.First;
    repeat
      if ContainsStr(lowercase(dmShowTracker.tblWatched['ShowName']), Lowercase(sName)) then
      begin
        bFound := true;
        sShowName := dmShowTracker.tblWatched['ShowName'];
        iID := dmShowTracker.tblWatched['ID'];
        iRecordNo := dmShowTracker.tblWatched.RecNo;
        lblName.Caption := sShowName;
        break;
      end;
      dmShowTracker.tblWatched.Next;
    until (dmShowTracker.tblWatched.Eof);
  dmShowTracker.tblWatched.Close;

  if bFound = false then
  begin
    MessageDLG(sName + ' was not found in the database',
               mtError,[mbOK],0);
    EXIT;
  end;

  dmShowTracker.tblNewSeasons.Open;
  dmShowTracker.tblNewSeasons.First;

  //validation
  if sShowName = '' then
  begin
    MessageDLG('There has been an error (Search Failed), notify developer',mtError,[mbOK],0);
    EXIT;
  end;


  //populate cmbTimesWatched
  iCount := 1;
  repeat
    if (dmShowTracker.tblNewSeasons['ID'] = iID)
    AND (dmShowTracker.tblNewSeasons['TimesWatched'] > 0) then
    begin
      cmbTimesWatched.Items.Add('Watched ' + IntToStr(dmShowTracker.tblNewSeasons['TimesWatched']) + ' time/s on '
                               + dateToStr(dmShowTracker.tblNewSeasons['DateCompleted']));
      arrPrimaryKeyTimesWatched[iCount] := dmSHowTracker.tblNewSeasons['PrimaryKey'];
      inc(iCount);
    end;
    dmShowTracker.tblNewSeasons.Next;
  until (dmShowTracker.tblNewSeasons.Eof);

  //populate cmbSeasons
  dmShowTracker.tblNewSeasons.First;
  iCount := 1;

  repeat
    if (dmShowTracker.tblNewSeasons['ID'] = iID)
    AND (dmShowTracker.tblNewSeasons['Seasons'] > 0) then
    begin
      if dmShowTracker.tblNewSeasons['Seasons'] > 1 then
        cmbSeasons.Items.Add('You completed seasons ' +
        IntToStr((dmShowTracker.tblNewSeasons['OldSeasons'] + 1)) + ' - ' +
        intToStr((dmShowTracker.tblNewSeasons['Seasons'] + dmShowTracker.tblNewSeasons['OldSeasons'])) +
        ' on ' + DateToStr(dmShowTracker.tblNewSeasons['DateCompleted']) + #13)
      else
        cmbSeasons.Items.Add('You completed season ' +
        IntToStr((dmShowTracker.tblNewSeasons['Seasons'] + dmShowTracker.tblNewSeasons['OldSeasons'])) +
        ' on ' + DateToStr(dmShowTracker.tblNewSeasons['DateCompleted']) + #13);
      arrPrimaryKeySeasons[iCount] := dmShowTracker.tblNewSeasons['PrimaryKey'];
      inc(iCount);
    end;
    dmShowTracker.tblNewSeasons.Next;
  until (dmShowTracker.tblNewSeasons.Eof);

  dmShowTracker.tblNewSeasons.Close;

  lblSearch.Hide;
  cmbShowNames.Hide;
  lblSelect.Hide;
  edtSearch.Hide;
  pnlSearch.Hide;
  lblName.Show;
  lblTimesWatched.Show;
  cmbTimesWatched.Show;
  lblSeasons.Show;
  cmbSeasons.Show;
  pnlDelete.Show;
end;

procedure TfrmDelete.cmbTimesWatchedClick(Sender: TObject);
Var
  sName : string;
  iPrimaryKey : integer;
begin
  sName := cmbTimesWatched.Items[cmbTimesWatched.ItemIndex];
  iPrimaryKey := arrPrimaryKeyTimesWatched[cmbTimesWatched.ItemIndex + 1];

  //confirm
  if MessageDLG('Are you sure you want to permanently delete ' + sName +
     '?',mtConfirmation,[mbYES,mbNO],0) = mrNO then
     begin
       MessageDLG(sName + ' was not deleted', mtInformation,[mbOK],0);
       EXIT;
     end;

  //delete from database
  with dmShowTracker do
  begin
    qryShowTracker.SQL.Clear;
    qryShowTracker.SQL.Add('DELETE FROM NewSeasons WHERE PrimaryKey = ' + intToStr(iPrimaryKey));
    qryShowTracker.ExecSQL;
  end;

  //feedback
  MessageDLG(sName + ' was successfully deleted',mtInformation,[mbOK],0);

  lblSearch.Show;
  cmbShowNames.Show;
  lblSelect.Show;
  edtSearch.Show;
  pnlSearch.Show;
  lblname.Hide;
  lblTimesWatched.Hide;
  cmbTimesWatched.Hide;
  lblSeasons.Hide;
  cmbSeasons.Hide;
  pnlDelete.Hide;

  frmDelete.Hide;
  frmHome.Show;
end;

procedure TfrmDelete.edtSearchClick(Sender: TObject);
begin
  edtSearch.Text := '';
end;

procedure TfrmDelete.FormCreate(Sender: TObject);
begin
  InitializeForm;
  InitializeComponents;
  InitializeImages;
end;

procedure TfrmDelete.FormShow(Sender: TObject);
begin
  edtSearch.Text := 'Type the name of a show to search for it';
  cmbShowNames.Clear;
  cmbShowNames.Text := 'Select a show from here';

  dmShowTracker.tblWatched.Open;
  dmShowTracker.tblWatched.First;
  repeat
    cmbShowNames.Items.Add(dmShowTracker.tblWatched['ShowName']);
    dmShowTracker.tblWatched.Next;
  until (dmShowTracker.tblWatched.Eof);
  dmShowTracker.tblWatched.Close;
end;

procedure TfrmDelete.imgExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmDelete.imgExitMouseEnter(Sender: TObject);
begin
  imgExit.Picture.LoadFromFile('Images\ExitImage2.jpg');
end;

procedure TfrmDelete.imgExitMouseLeave(Sender: TObject);
begin
  imgExit.Picture.LoadFromFile('Images\ExitImage1.jpg');
end;

procedure TfrmDelete.imgHomeClick(Sender: TObject);
begin
  frmDelete.Hide;
  frmHome.Show;
end;

procedure TfrmDelete.imgHomeMouseEnter(Sender: TObject);
begin
  imgHome.Picture.LoadFromFile('Images\HomeImage2.jpg');
end;

procedure TfrmDelete.imgHomeMouseLeave(Sender: TObject);
begin
  imgHome.Picture.LoadFromFile('Images\HomeImage1.jpg');
end;

procedure TfrmDelete.InitializeComponents;
begin
  //pnlSearch
  pnlSearch.Caption := 'Search';
  pnlSearch.ParentBackground := false;
  pnlSearch.ParentColor := false;
  pnlSearch.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  pnlSearch.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  pnlSearch.font.Size := 16;
  pnlSearch.Top := Trunc(0.8 * Screen.Height);
  pnlSearch.Width := Trunc(0.25 * Screen.Width);
  pnlSearch.Height := Trunc(0.03 * Screen.Height);
  pnlSearch.Left := Trunc(0.5 * Screen.Width);
  pnlSearch.BorderStyle := bsNone;
  pnlSearch.BevelOuter := bvNone;
  pnlSearch.Cursor := crHandPoint;

  //lblSelect
  lblSelect.Left := Trunc(0.25 * Screen.Width);
  lblSelect.top := Trunc(0.20 * Screen.Height);
  lblSelect.Caption := 'You can select a show name using the drop down selector';
  lblSelect.Font.Size := 16;
  lblSelect.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);

  //cmbShowNames
  cmbShowNames.Left := Trunc(0.25 * Screen.Width);
  cmbShowNames.Top := Trunc(0.25 * Screen.Height);
  cmbShowNames.Width := Trunc(0.5 * Screen.Width);
  cmbShowNames.Font.Size := 16;
  cmbShowNames.font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  cmbShowNames.Text := 'Select a show from here';
  cmbShowNames.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);

  //lblSearch
  lblSearch.Left := Trunc(0.25 * Screen.Width);
  lblSearch.top := Trunc(0.55 * Screen.Height);
  lblSearch.Caption := 'If you want to search for the show, type the name here';
  lblSearch.Font.Size := 16;
  lblSearch.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);

  //edtSearch
  edtSearch.Left := Trunc(0.25 * Screen.Width);
  edtSearch.Top := Trunc(0.6 * Screen.Height);
  edtSearch.width := Trunc(0.5 * Screen.Width);
  edtSearch.Font.Size := 16;
  edtSearch.font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  edtSearch.Text := 'Type the name of a show to search for it';
  edtSearch.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);

  //pnlDelete
  pnlDelete.Caption := 'Click to delete entire show';
  pnlDelete.ParentBackground := false;
  pnlDelete.ParentColor := false;
  pnlDelete.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  pnlDelete.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  pnlDelete.font.Size := 16;
  pnlDelete.Top := Trunc(0.80 * Screen.Height);
  pnlDelete.Width := Trunc(0.5 * Screen.Width);
  pnlDelete.Height := Trunc(0.03 * Screen.Height);
  pnlDelete.Left := Trunc(0.25 * Screen.Width);
  pnlDelete.BorderStyle := bsNone;
  pnlDelete.BevelOuter := bvNone;
  pnlDelete.Hide;
  pnlDelete.Cursor := crHandPoint;

  //lblName
  lblName.Left := Trunc(0.25 * Screen.Width);
  lblName.top := Trunc(0.15 * Screen.Height);
  lblName.Font.Size := 24;
  lblName.Font.Color := rgb(frmHome.arrTertiaryCOlor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  lblName.Hide;

  //lblTimesWatched
  lblTimesWatched.Left := Trunc(0.25 * Screen.Width);
  lblTimesWatched.top := Trunc(0.3 * Screen.Height);
  lblTimesWatched.Caption := 'Select a rewatch to delete it using the drop down selector';
  lblTimesWatched.Font.Size := 16;
  lblTimesWatched.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  lblTimesWatched.Hide;

  //cmbTimesWatched
  cmbTimesWatched.Left := Trunc(0.25 * Screen.Width);
  cmbTimesWatched.Top := Trunc(0.35 * Screen.Height);
  cmbTimesWatched.Width := Trunc(0.3 * Screen.Width);
  cmbTimesWatched.Font.Size := 16;
  cmbTimesWatched.font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  cmbTimesWatched.Text := 'Select a rewatch to delete from here';
  cmbTimesWatched.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  cmbTimesWatched.Hide;

  //cmbSeasons
  cmbSeasons.Left := Trunc(0.25 * Screen.Width);
  cmbSeasons.Top := Trunc(0.6 * Screen.Height);
  cmbSeasons.Width := Trunc(0.5 * Screen.Width);
  cmbSeasons.Font.Size := 16;
  cmbSeasons.font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  cmbSeasons.Text := 'Select a season to delete from here';
  cmbSeasons.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  cmbSeasons.Hide;

  //lblSeasons
  lblSeasons.Left := Trunc(0.25 * Screen.Width);
  lblSeasons.top := Trunc(0.55 * Screen.Height);
  lblSeasons.Caption := 'Select a season to delete using the drop down selector';
  lblSeasons.Font.Size := 16;
  lblSeasons.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  lblSeasons.Hide;
end;

procedure TfrmDelete.InitializeForm;
begin
  //form dimensions
  frmDelete.Left := 0;
  frmDelete.Top := 0;
  frmDelete.Width := Screen.Width;
  frmDelete.Height := Screen.Height;
  frmDelete.Position := poScreenCenter;
  frmDelete.WindowState := wsMaximized;
  frmDelete.Caption := 'Add Watched';
  frmDelete.Color := rgb(frmHome.arrBackgroundColor[1],frmHome.arrBackgroundColor[2],frmHome.arrBackgroundColor[3]);

  //remove border (therefore user cant resize or move the form)
  frmDelete.BorderStyle := bsNone;

  //dynamically create purple header
  shpHeader := TShape.Create(frmDelete);
  shpHeader.Parent := frmDelete;
  shpHeader.Left := 0;
  shpHeader.Top := 0;
  shpHeader.Width := Screen.Width;
  shpHeader.Height := Trunc(0.08 * screen.Height);
  shpHeader.Brush.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
  shpHeader.Pen.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
end;

procedure TfrmDelete.InitializeImages;
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

procedure TfrmDelete.pnlDeleteClick(Sender: TObject);
begin
  dmShowTracker.tblWatched.Open;
  dmShowTracker.tblWatched.RecNo := iRecordno;

  //confirm
  if MEssageDLG('Are you sure you want to permanently delete ' + dmSHowTracker.tblWatched['ShowName'] +
     '?',mtConfirmation,[mbYES,mbNO],0) = mrNO then
     begin
       MessageDLG(dmSHowTracker.tblWatched['ShowName'] + ' was not deleted', mtInformation,[mbOK],0);
       EXIT;
     end;

  //delete from database
  with dmShowTracker do
  begin
    qryShowTracker.SQL.Clear;
    qryShowTracker.SQL.Add('DELETE FROM Watched WHERE ShowName = ' + QuotedStr(dmSHowTracker.tblWatched['ShowName']));
    qryShowTracker.ExecSQL;
  end;

  with dmShowTracker do
  begin
    qryShowTracker.SQL.Clear;
    qryShowTracker.SQL.Add('DELETE FROM NewSeasons WHERE ID = ' + IntToStr(dmShowTracker.tblWatched['ID']));
    qryShowTracker.ExecSQL;
  end;

  //feedback
  MessageDLG(dmSHowTracker.tblWatched['ShowName'] + ' has been successfully deleted',mtInformation,[mbOK],0);

  dmShowTracker.tblWatched.Close;

  lblSearch.Show;
  cmbShowNames.Show;
  lblSelect.Show;
  edtSearch.Show;
  pnlSearch.Show;
  lblname.Hide;
  lblTimesWatched.Hide;
  cmbTimesWatched.Hide;
  lblSeasons.Hide;
  cmbSeasons.Hide;
  pnlDelete.Hide;

  frmWatched.PopulatestgWatched;

  frmDelete.Hide;
  frmHome.Show;
end;

procedure TfrmDelete.pnlDeleteMouseEnter(Sender: TObject);
begin
  pnlDelete.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
end;

procedure TfrmDelete.pnlDeleteMouseLeave(Sender: TObject);
begin
  pnlDelete.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
end;

procedure TfrmDelete.pnlSearchClick(Sender: TObject);
Var
  sName, sShowName : string;
  bFound : boolean;
begin
  //Validation
  if edtSearch.Text = '' then
  begin
    MessageDLG('Please Enter a shows name to search for it',mtError,[mbOK],0);
    edtSearch.SetFocus;
    EXIT;
  end;

  if edtSearch.Text = 'Type the name of a show to search for it' then
  begin
    MessageDLG('Please Enter a shows name to search for it',mtError,[mbOK],0);
    edtSearch.SetFocus;
    EXIT;
  end;

  sName := edtSearch.Text;
  sShowName := '';
  bFound := false;
  iRecordNo := 0;

  //search for name in database
  dmShowTracker.tblWatched.Open;
  dmShowTracker.tblWatched.First;
    repeat
      if ContainsStr(lowercase(dmShowTracker.tblWatched['ShowName']), Lowercase(sName)) then
      begin
        bFound := true;
        sShowName := dmShowTracker.tblWatched['ShowName'];
        iID := dmShowTracker.tblWatched['ID'];
        iRecordNo := dmShowTracker.tblWatched.RecNo;
        lblName.Caption := sShowName;
        break;
      end;
      dmShowTracker.tblWatched.Next;
    until (dmShowTracker.tblWatched.Eof);
  dmShowTracker.tblWatched.Close;

  if bFound = false then
  begin
    MessageDLG(sName + ' was not found in the database',
               mtError,[mbOK],0);
    EXIT;
  end;

  dmShowTracker.tblNewSeasons.Open;
  dmShowTracker.tblNewSeasons.First;

  //validation
  if sShowName = '' then
  begin
    MessageDLG('There has been an error (Search Failed), notify developer',mtError,[mbOK],0);
    EXIT;
  end;


  //populate cmbTimesWatched
  iCount := 1;
  repeat
    if (dmShowTracker.tblNewSeasons['ID'] = iID)
    AND (dmShowTracker.tblNewSeasons['TimesWatched'] > 0) then
    begin
      cmbTimesWatched.Items.Add('Watched ' + IntToStr(dmShowTracker.tblNewSeasons['TimesWatched']) + ' time/s on '
                               + dateToStr(dmShowTracker.tblNewSeasons['DateCompleted']));
      arrPrimaryKeyTimesWatched[iCount] := dmSHowTracker.tblNewSeasons['PrimaryKey'];
      inc(iCount);
    end;
    dmShowTracker.tblNewSeasons.Next;

  until (dmShowTracker.tblNewSeasons.Eof);

  //populate cmbSeasons
  dmShowTracker.tblNewSeasons.First;

  iCount := 1;
  repeat
    if (dmShowTracker.tblNewSeasons['ID'] = iID)
    AND (dmShowTracker.tblNewSeasons['Seasons'] > 0) then
    begin
      if dmShowTracker.tblNewSeasons['Seasons'] > 1 then
        cmbSeasons.Items.Add('You completed seasons ' +
        IntToStr((dmShowTracker.tblNewSeasons['OldSeasons'] + 1)) + ' - ' +
        intToStr((dmShowTracker.tblNewSeasons['Seasons'] + dmShowTracker.tblNewSeasons['OldSeasons'])) +
        ' on ' + DateToStr(dmShowTracker.tblNewSeasons['DateCompleted']) + #13)
      else
        cmbSeasons.Items.Add('You completed season ' +
        IntToStr((dmShowTracker.tblNewSeasons['Seasons'] + dmShowTracker.tblNewSeasons['OldSeasons'])) +
        ' on ' + DateToStr(dmShowTracker.tblNewSeasons['DateCompleted']) + #13);
      arrPrimaryKeySeasons[iCount] := dmShowTracker.tblNewSeasons['PrimaryKey'];
      inc(iCount);
    end;
    dmShowTracker.tblNewSeasons.Next;
  until (dmShowTracker.tblNewSeasons.Eof);

  dmShowTracker.tblNewSeasons.Close;

  lblSearch.Hide;
  cmbShowNames.Hide;
  lblSelect.Hide;
  edtSearch.Hide;
  pnlSearch.Hide;
  lblname.Show;
  lblTimesWatched.Show;
  cmbTimesWatched.Show;
  lblSeasons.Show;
  cmbSeasons.Show;
  pnlDelete.Show;
end;

procedure TfrmDelete.pnlSearchMouseEnter(Sender: TObject);
begin
  pnlSearch.Color := rgb(frmHome.arrSecondaryColor[1],frmHome.arrSecondaryColor[2],frmHome.arrSecondaryColor[3]);
end;

procedure TfrmDelete.pnlSearchMouseLeave(Sender: TObject);
begin
  pnlSearch.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
end;

end.
