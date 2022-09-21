unit dmShowTracker_u;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmShowTracker = class(TDataModule)
    conShowTracker: TADOConnection;
    tblWatched: TADOTable;
    tblToWatch: TADOTable;
    qryShowTracker: TADOQuery;
    tblNewSeasons: TADOTable;
    tblTracker: TADOTable;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmShowTracker: TdmShowTracker;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmShowTracker.DataModuleCreate(Sender: TObject);
begin
  //connects the database
    conShowTracker.ConnectionString :=
    'Provider=Microsoft.Jet.OLEDB.4.0;' + 'Data Source=' + 'ShowTracker.mdb' + ';' +
    'Mode=ReadWrite;' + 'Persist Security Info=False;' +
    'Jet OLEDB:Database Password=*************';
  conShowTracker.Provider := 'Provider=Microsoft.Jet.OLEDB.4.0;';
  conShowTracker.Open;
end;

end.
