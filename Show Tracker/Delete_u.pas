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
    procedure FormCreate(Sender: TObject);
    procedure cmbShowNamesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnlDeleteClick(Sender: TObject);
    procedure edtSearchClick(Sender: TObject);
  private
    { Private declarations }
    shpHeader : TShape;
    procedure InitializeForm;
    procedure InitializeComponents;
  public
    { Public declarations }
  end;

var
  frmDelete: TfrmDelete;

implementation

uses Home_u, Watched_u, dmShowTracker_u;

{$R *.dfm}

{ TfrmDelete }

procedure TfrmDelete.cmbShowNamesClick(Sender: TObject);
Var sName : string;
begin
  //confirm
  sName := cmbShowNames.Items[cmbShowNames.ItemIndex];
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
  MessageDLG(sName + ' was successfully deleted',mtInformation,[mbOK],0);

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
end;

procedure TfrmDelete.FormShow(Sender: TObject);
begin
  dmShowTracker.tblWatched.Open;
  dmShowTracker.tblWatched.First;
  repeat
    cmbShowNames.Items.Add(dmShowTracker.tblWatched['ShowName']);
    dmShowTracker.tblWatched.Next;
  until (dmShowTracker.tblWatched.Eof);
  dmShowTracker.tblWatched.Close;
end;

procedure TfrmDelete.InitializeComponents;
begin
  //lblSelect
  lblSelect.Left := Trunc(0.25 * Screen.Width);
  lblSelect.top := Trunc(0.25 * Screen.Height);
  lblSelect.Caption := 'Select a show name to delete it using the drop down selector';
  lblSelect.Font.Size := 16;
  lblSelect.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);

  //cmbShowNames
  cmbShowNames.Left := Trunc(0.25 * Screen.Width);
  cmbShowNames.Top := Trunc(0.3 * Screen.Height);
  cmbShowNames.Width := Trunc(0.5 * Screen.Width);
  cmbShowNames.Font.Size := 16;
  cmbShowNames.font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  cmbShowNames.Text := 'Select a show to delete from here';
  cmbShowNames.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);

  //lblSearch
  lblSearch.Left := Trunc(0.25 * Screen.Width);
  lblSearch.top := Trunc(0.6 * Screen.Height);
  lblSearch.Caption := 'If you want to search for the show to delete it, type the name here';
  lblSearch.Font.Size := 16;
  lblSearch.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);

  //edtSearch
  edtSearch.Left := Trunc(0.25 * Screen.Width);
  edtSearch.Top := Trunc(0.65 * Screen.Height);
  edtSearch.width := Trunc(0.5 * Screen.Width);
  edtSearch.Font.Size := 16;
  edtSearch.font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  edtSearch.Text := 'Type the name of a show to search for it';
  edtSearch.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);

  //pnlDelete
  pnlDelete.Caption := 'Delete';
  pnlDelete.ParentBackground := false;
  pnlDelete.ParentColor := false;
  pnlDelete.Color := rgb(frmHome.arrTertiaryColor[1],frmHome.arrTertiaryColor[2],frmHome.arrTertiaryColor[3]);
  pnlDelete.Font.Color := rgb(frmHome.arrTextColor[1],frmHome.arrTextColor[2],frmHome.arrTextColor[3]);
  pnlDelete.font.Size := 16;
  pnlDelete.Top := Trunc(0.8 * Screen.Height);
  pnlDelete.Width := Trunc(0.25 * Screen.Width);
  pnlDelete.Height := Trunc(0.03 * Screen.Height);
  pnlDelete.Left := Trunc(0.5 * Screen.Width);
  pnlDelete.BorderStyle := bsNone;
  pnlDelete.BevelOuter := bvNone;

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

procedure TfrmDelete.pnlDeleteClick(Sender: TObject);
Var sName, sShowName : string;
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

  //search for name in database
  dmShowTracker.tblWatched.Open;
  dmShowTracker.tblWatched.First;
    repeat
      if ContainsStr(lowercase(dmShowTracker.tblWatched['ShowName']), Lowercase(sName)) then
      begin
        bFound := true;
        sShowName := dmShowTracker.tblWatched['ShowName'];
        break;
      end;
      dmShowTracker.tblWatched.Next;
    until (dmShowTracker.tblWatched.Eof);
  dmShowTracker.tblWatched.Close;

  if bFound = false then
  begin
    MessageDLG(sName + ' was not found in the database, try using the drop down selector',
               mtError,[mbOK],0);
    EXIT;
  end;

  //validation
  if sShowName = '' then
  begin
    MessageDLG('There has been an error (Search Failed), notify developer',mtError,[mbOK],0);
    EXIT;
  end;

  //confirm
  if MEssageDLG('Are you sure you want to permanently delete ' + sShowName +
     '?',mtConfirmation,[mbYES,mbNO],0) = mrNO then
     begin
       MessageDLG(sShowName + ' was not deleted', mtInformation,[mbOK],0);
       edtSearch.SetFocus;
       EXIT;
     end;

  //delete from database
  with dmShowTracker do
  begin
    qryShowTracker.SQL.Clear;
    qryShowTracker.SQL.Add('DELETE FROM Watched WHERE ShowName = ' + QuotedStr(sShowName));
    qryShowTracker.ExecSQL;
  end;

  //feedback
  MessageDLG(sShowName + ' has been successfully deleted',mtInformation,[mbOK],0);

  frmDelete.Hide;
  frmHome.Show;
end;

end.
