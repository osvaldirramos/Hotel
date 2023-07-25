program P_Log_Hotel;

uses
  Forms,
  DM_Log_Sistema in 'DM_Log_Sistema.pas' {DataModule2: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Log Sis-Hotel';
  Application.CreateForm(TDataModule2, DataModule2);
  Application.Run;
end.
