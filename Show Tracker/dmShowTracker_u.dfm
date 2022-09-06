object dmShowTracker: TdmShowTracker
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 257
  Width = 425
  object conShowTracker: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=G:\Delphi Projects\' +
      'Show Tracker\Win32\Debug\ShowTracker.mdb;Persist Security Info=F' +
      'alse;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 184
    Top = 24
  end
  object tblWatched: TADOTable
    Connection = conShowTracker
    CursorType = ctStatic
    TableName = 'Watched'
    Left = 72
    Top = 104
  end
  object tblToWatch: TADOTable
    Connection = conShowTracker
    CursorType = ctStatic
    TableName = 'ToWatch'
    Left = 288
    Top = 104
  end
  object qryShowTracker: TADOQuery
    Connection = conShowTracker
    Parameters = <>
    Left = 176
    Top = 176
  end
end
