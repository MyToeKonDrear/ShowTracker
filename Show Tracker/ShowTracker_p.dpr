program ShowTracker_p;

uses
  Vcl.Forms,
  Home_u in 'Home_u.pas' {frmHome},
  Watched_u in 'Watched_u.pas' {frmWatched};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmHome, frmHome);
  Application.CreateForm(TfrmWatched, frmWatched);
  Application.Run;
end.
