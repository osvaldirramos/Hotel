program P_Historico;

uses
  Forms,
  Module in 'Module.pas' {DM: TDataModule},
  Auditoria_Historico in 'Auditoria_Historico.pas' {Form_Auditoria_Historico},
  Rotinas in 'Rotinas.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm_Auditoria_Historico, Form_Auditoria_Historico);
  Application.Run;
end.
