program P_Voucher;

uses
  Forms,
  Consulta_Voucher in 'Consulta_Voucher.pas' {Form_Con_Voucher},
  Module in 'Module.pas' {DM: TDataModule},
  Abertura in 'Abertura.pas' {Form_Abertura};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm_Abertura, Form_Abertura);
  Application.CreateForm(TForm_Con_Voucher, Form_Con_Voucher);
  Application.Run;
end.
