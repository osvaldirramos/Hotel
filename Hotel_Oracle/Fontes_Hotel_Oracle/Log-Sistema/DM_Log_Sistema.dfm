object DataModule2: TDataModule2
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 0
  Width = 0
  object Database_HTL: TDatabase
    DatabaseName = 'hotel1'
    DriverName = 'ORACLE'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME=tns:Hotel'
      'USER NAME=Hotel'
      'NET PROTOCOL=TNS'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'LANGDRIVER='
      'SQLQRYMODE=SERVER'
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'ENABLE INTEGERS=FALSE'
      'LIST SYNONYMS=NONE'
      'ROWSET SIZE=20'
      'BLOBS TO CACHE=64'
      'BLOB SIZE=32'
      'OBJECT MODE=TRUE'
      'PASSWORD= ipvhtl')
    SessionName = 'Default'
    TransIsolation = tiDirtyRead
    Left = 112
    Top = 8
  end
  object Query_Usuario: TQuery
    DatabaseName = 'hotel1'
    SQL.Strings = (
      'Select * from Hotel_Usuario')
    Left = 216
    Top = 8
  end
end
