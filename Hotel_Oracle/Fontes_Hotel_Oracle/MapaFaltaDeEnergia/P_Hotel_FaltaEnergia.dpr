program P_Hotel_FaltaEnergia;

uses
  Forms,
  Abertura in 'Abertura.pas' {Form_Abertura},
  Sobre in 'Sobre.pas' {Form_Sobre},
  Unit2 in 'Unit2.pas' {DM: TDataModule},
  Recepcao in 'Recepcao.pas' {Form_MenuRecepcao},
  Rotinas in '..\Sis-Hotel\Rotinas.pas',
  Divisas in '..\Sis-Hotel\Divisas.pas' {Form_Divisas},
  Rel_Mapa_Ocupacao_R in 'Rel_Mapa_Ocupacao_R.pas' {QRListForm_Mapa_Hospedagem_R},
  Rel_MapaOcupacao in 'Rel_MapaOcupacao.pas' {QRListForm_MapaOcupacao};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Hotel-Falta-Energia';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm_MenuRecepcao, Form_MenuRecepcao);
  Application.CreateForm(TForm_Abertura, Form_Abertura);
  Application.CreateForm(TForm_Sobre, Form_Sobre);
  Application.CreateForm(TForm_Divisas, Form_Divisas);
  Application.CreateForm(TQRListForm_Mapa_Hospedagem_R, QRListForm_Mapa_Hospedagem_R);
  Application.CreateForm(TQRListForm_MapaOcupacao, QRListForm_MapaOcupacao);
  Application.Run;
end.
