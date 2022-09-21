object dmShowTracker: TdmShowTracker
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 257
  Width = 425
  object conShowTracker: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=G:\De' +
      'lphi Projects\Show Tracker\Win32\Debug\ShowTracker.mdb;Mode=Shar' +
      'e Deny None;Persist Security Info=False;Jet OLEDB:System databas' +
      'e="";Jet OLEDB:Registry Path="";Jet OLEDB:Database Password="";J' +
      'et OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLE' +
      'DB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=' +
      '1;Jet OLEDB:New Database Password="";Jet OLEDB:Create System Dat' +
      'abase=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Cop' +
      'y Locale on Compact=False;Jet OLEDB:Compact Without Replica Repa' +
      'ir=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 184
    Top = 24
  end
  object tblWatched: TADOTable
    Connection = conShowTracker
    CursorType = ctStatic
    TableName = 'Watched'
    Left = 24
    Top = 96
  end
  object tblToWatch: TADOTable
    Connection = conShowTracker
    CursorType = ctStatic
    TableName = 'ToWatch'
    Left = 216
    Top = 104
  end
  object qryShowTracker: TADOQuery
    Connection = conShowTracker
    Parameters = <>
    Left = 176
    Top = 176
  end
  object tblNewSeasons: TADOTable
    Connection = conShowTracker
    CursorType = ctStatic
    TableName = 'NewSeasons'
    Left = 96
    Top = 96
  end
  object tblTracker: TADOTable
    Connection = conShowTracker
    CursorType = ctStatic
    TableName = 'Tracker'
    Left = 296
    Top = 104
  end
end
