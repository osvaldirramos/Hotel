program P_Mapa;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {DM: TDataModule},
  Recepcao in 'Recepcao.pas' {Form_MenuRecepcao};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm_MenuRecepcao, Form_MenuRecepcao);
  Application.Run;
end.
