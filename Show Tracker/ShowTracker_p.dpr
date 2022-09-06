program ShowTracker_p;

uses
  Vcl.Forms,
  Home_u in 'Home_u.pas' {frmHome},
  Watched_u in 'Watched_u.pas' {frmWatched},
  AddWatched_u in 'AddWatched_u.pas' {frmAddWatched},
  dmShowTracker_u in 'dmShowTracker_u.pas' {dmShowTracker: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmHome, frmHome);
  Application.CreateForm(TfrmWatched, frmWatched);
  Application.CreateForm(TfrmAddWatched, frmAddWatched);
  Application.CreateForm(TdmShowTracker, dmShowTracker);
  Application.Run;
end.
