program ShowTracker_p;

uses
  Vcl.Forms,
  Home_u in 'Home_u.pas' {frmHome},
  Watched_u in 'Watched_u.pas' {frmWatched},
  AddWatched_u in 'AddWatched_u.pas' {frmAddWatched},
  dmShowTracker_u in 'dmShowTracker_u.pas' {dmShowTracker: TDataModule},
  ShowDetails_u in 'ShowDetails_u.pas' {frmShowDetails},
  Edit_u in 'Edit_u.pas' {frmEdit},
  Delete_u in 'Delete_u.pas' {frmDelete},
  AddSeason_u in 'AddSeason_u.pas' {frmAddSeason},
  TimesWatched_u in 'TimesWatched_u.pas' {frmTimesWatched},
  Tracker_u in 'Tracker_u.pas' {frmTracker},
  ToWatch_u in 'ToWatch_u.pas' {frmToWatch},
  AddToWatch_u in 'AddToWatch_u.pas' {frmAddToWatch},
  Stats_u in 'Stats_u.pas' {frmStats};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Show Tracker';
  Application.CreateForm(TfrmHome, frmHome);
  Application.CreateForm(TfrmWatched, frmWatched);
  Application.CreateForm(TfrmAddWatched, frmAddWatched);
  Application.CreateForm(TdmShowTracker, dmShowTracker);
  Application.CreateForm(TfrmShowDetails, frmShowDetails);
  Application.CreateForm(TfrmEdit, frmEdit);
  Application.CreateForm(TfrmDelete, frmDelete);
  Application.CreateForm(TfrmAddSeason, frmAddSeason);
  Application.CreateForm(TfrmTimesWatched, frmTimesWatched);
  Application.CreateForm(TfrmTracker, frmTracker);
  Application.CreateForm(TfrmToWatch, frmToWatch);
  Application.CreateForm(TfrmAddToWatch, frmAddToWatch);
  Application.CreateForm(TfrmStats, frmStats);
  Application.Run;
end.
