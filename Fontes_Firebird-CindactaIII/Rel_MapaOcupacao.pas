//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Mapa_OcupacaoR.PAS                              //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de montar o mapa de //
//                             hospedagem para recepcao.                      //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 12/03/2003                                     //
//                                                                            //
// ATUALIZADO                :                                                //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//

unit Rel_MapaOcupacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Qrctrls, QuickRpt, ExtCtrls, jpeg;

type
  TQRListForm_MapaOcupacao = class(TForm)
    QuickRep_Mapa_Ocupacao: TQuickRep;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData3: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRSysData_Hora: TQRSysData;
    QRImage1: TQRImage;
    QRDBText_Dia01: TQRDBText;
    QRDBText_Dia02: TQRDBText;
    QRDBText_Dia03: TQRDBText;
    QRDBText_Dia04: TQRDBText;
    QRDBText_Dia05: TQRDBText;
    QRDBText_Dia06: TQRDBText;
    QRDBText_Dia07: TQRDBText;
    QRDBText_Dia08: TQRDBText;
    QRDBText_Dia09: TQRDBText;
    QRDBText_Dia10: TQRDBText;
    QRDBText_Dia11: TQRDBText;
    QRDBText_Dia12: TQRDBText;
    QRDBText_Dia13: TQRDBText;
    QRDBText_Dia14: TQRDBText;
    QRDBText_Dia15: TQRDBText;
    QRDBText_Dia16: TQRDBText;
    QRDBText_Dia17: TQRDBText;
    QRDBText_Dia18: TQRDBText;
    QRDBText_Dia19: TQRDBText;
    QRDBText_Dia20: TQRDBText;
    QRDBText_Dia21: TQRDBText;
    QRDBText_Dia22: TQRDBText;
    QRDBText_Dia23: TQRDBText;
    QRDBText_Dia24: TQRDBText;
    QRDBText_Dia25: TQRDBText;
    QRDBText_Dia26: TQRDBText;
    QRDBText_Dia27: TQRDBText;
    QRDBText_Dia28: TQRDBText;
    QRDBText_Dia29: TQRDBText;
    QRDBText_Dia30: TQRDBText;
    QRDBText_Dia31: TQRDBText;
    QRDBText_DiaCama: TQRDBText;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel30: TQRLabel;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QRListForm_MapaOcupacao: TQRListForm_MapaOcupacao;

implementation

uses Recepcao;

{$R *.DFM}

procedure TQRListForm_MapaOcupacao.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo01').AsInteger of
      0:   QRDBText_Dia01.Font.Color:= clGray;
      1:   QRDBText_Dia01.Font.Color:= clTeal;
      2:   QRDBText_Dia01.Font.Color:= clRed;
      3:   QRDBText_Dia01.Font.Color:= clBlack;
      4:   QRDBText_Dia01.Font.Color:= clBlue;
      5:   QRDBText_Dia01.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo02').AsInteger of
      0:   QRDBText_Dia02.Font.Color:= clGray;
      1:   QRDBText_Dia02.Font.Color:= clTeal;
      2:   QRDBText_Dia02.Font.Color:= clRed;
      3:   QRDBText_Dia02.Font.Color:= clBlack;
      4:   QRDBText_Dia02.Font.Color:= clBlue;
      5:   QRDBText_Dia02.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo03').AsInteger of
      0:   QRDBText_Dia03.Font.Color:= clGray;
      1:   QRDBText_Dia03.Font.Color:= clTeal;
      2:   QRDBText_Dia03.Font.Color:= clRed;
      3:   QRDBText_Dia03.Font.Color:= clBlack;
      4:   QRDBText_Dia03.Font.Color:= clBlue;
      5:   QRDBText_Dia03.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo04').AsInteger of
      0:   QRDBText_Dia04.Font.Color:= clGray;
      1:   QRDBText_Dia04.Font.Color:= clTeal;
      2:   QRDBText_Dia04.Font.Color:= clRed;
      3:   QRDBText_Dia04.Font.Color:= clBlack;
      4:   QRDBText_Dia04.Font.Color:= clBlue;
      5:   QRDBText_Dia04.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo05').AsInteger of
      0:   QRDBText_Dia05.Font.Color:= clGray;
      1:   QRDBText_Dia05.Font.Color:= clTeal;
      2:   QRDBText_Dia05.Font.Color:= clRed;
      3:   QRDBText_Dia05.Font.Color:= clBlack;
      4:   QRDBText_Dia05.Font.Color:= clBlue;
      5:   QRDBText_Dia05.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo06').AsInteger of
      0:   QRDBText_Dia06.Font.Color:= clGray;
      1:   QRDBText_Dia06.Font.Color:= clTeal;
      2:   QRDBText_Dia06.Font.Color:= clRed;
      3:   QRDBText_Dia06.Font.Color:= clBlack;
      4:   QRDBText_Dia06.Font.Color:= clBlue;
      5:   QRDBText_Dia06.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo07').AsInteger of
      0:   QRDBText_Dia07.Font.Color:= clGray;
      1:   QRDBText_Dia07.Font.Color:= clTeal;
      2:   QRDBText_Dia07.Font.Color:= clRed;
      3:   QRDBText_Dia07.Font.Color:= clBlack;
      4:   QRDBText_Dia07.Font.Color:= clBlue;
      5:   QRDBText_Dia07.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo08').AsInteger of
      0:   QRDBText_Dia08.Font.Color:= clGray;
      1:   QRDBText_Dia08.Font.Color:= clTeal;
      2:   QRDBText_Dia08.Font.Color:= clRed;
      3:   QRDBText_Dia08.Font.Color:= clBlack;
      4:   QRDBText_Dia08.Font.Color:= clBlue;
      5:   QRDBText_Dia08.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo09').AsInteger of
      0:   QRDBText_Dia09.Font.Color:= clGray;
      1:   QRDBText_Dia09.Font.Color:= clTeal;
      2:   QRDBText_Dia09.Font.Color:= clRed;
      3:   QRDBText_Dia09.Font.Color:= clBlack;
      4:   QRDBText_Dia09.Font.Color:= clBlue;
      5:   QRDBText_Dia09.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo10').AsInteger of
      0:   QRDBText_Dia10.Font.Color:= clGray;
      1:   QRDBText_Dia10.Font.Color:= clTeal;
      2:   QRDBText_Dia10.Font.Color:= clRed;
      3:   QRDBText_Dia10.Font.Color:= clBlack;
      4:   QRDBText_Dia10.Font.Color:= clBlue;
      5:   QRDBText_Dia10.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo11').AsInteger of
      0:   QRDBText_Dia11.Font.Color:= clGray;
      1:   QRDBText_Dia11.Font.Color:= clTeal;
      2:   QRDBText_Dia11.Font.Color:= clRed;
      3:   QRDBText_Dia11.Font.Color:= clBlack;
      4:   QRDBText_Dia11.Font.Color:= clBlue;
      5:   QRDBText_Dia11.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo12').AsInteger of
      0:   QRDBText_Dia12.Font.Color:= clGray;
      1:   QRDBText_Dia12.Font.Color:= clTeal;
      2:   QRDBText_Dia12.Font.Color:= clRed;
      3:   QRDBText_Dia12.Font.Color:= clBlack;
      4:   QRDBText_Dia12.Font.Color:= clBlue;
      5:   QRDBText_Dia12.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo13').AsInteger of
      0:   QRDBText_Dia13.Font.Color:= clGray;
      1:   QRDBText_Dia13.Font.Color:= clTeal;
      2:   QRDBText_Dia13.Font.Color:= clRed;
      3:   QRDBText_Dia13.Font.Color:= clBlack;
      4:   QRDBText_Dia13.Font.Color:= clBlue;
      5:   QRDBText_Dia13.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo14').AsInteger of
      0:   QRDBText_Dia14.Font.Color:= clGray;
      1:   QRDBText_Dia14.Font.Color:= clTeal;
      2:   QRDBText_Dia14.Font.Color:= clRed;
      3:   QRDBText_Dia14.Font.Color:= clBlack;
      4:   QRDBText_Dia14.Font.Color:= clBlue;
      5:   QRDBText_Dia14.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo15').AsInteger of
      0:   QRDBText_Dia15.Font.Color:= clGray;
      1:   QRDBText_Dia15.Font.Color:= clTeal;
      2:   QRDBText_Dia15.Font.Color:= clRed;
      3:   QRDBText_Dia15.Font.Color:= clBlack;
      4:   QRDBText_Dia15.Font.Color:= clBlue;
      5:   QRDBText_Dia15.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo16').AsInteger of
      0:   QRDBText_Dia16.Font.Color:= clGray;
      1:   QRDBText_Dia16.Font.Color:= clTeal;
      2:   QRDBText_Dia16.Font.Color:= clRed;
      3:   QRDBText_Dia16.Font.Color:= clBlack;
      4:   QRDBText_Dia16.Font.Color:= clBlue;
      5:   QRDBText_Dia16.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo17').AsInteger of
      0:   QRDBText_Dia17.Font.Color:= clGray;
      1:   QRDBText_Dia17.Font.Color:= clTeal;
      2:   QRDBText_Dia17.Font.Color:= clRed;
      3:   QRDBText_Dia17.Font.Color:= clBlack;
      4:   QRDBText_Dia17.Font.Color:= clBlue;
      5:   QRDBText_Dia17.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo18').AsInteger of
      0:   QRDBText_Dia18.Font.Color:= clGray;
      1:   QRDBText_Dia18.Font.Color:= clTeal;
      2:   QRDBText_Dia18.Font.Color:= clRed;
      3:   QRDBText_Dia18.Font.Color:= clBlack;
      4:   QRDBText_Dia18.Font.Color:= clBlue;
      5:   QRDBText_Dia18.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo19').AsInteger of
      0:   QRDBText_Dia19.Font.Color:= clGray;
      1:   QRDBText_Dia19.Font.Color:= clTeal;
      2:   QRDBText_Dia19.Font.Color:= clRed;
      3:   QRDBText_Dia19.Font.Color:= clBlack;
      4:   QRDBText_Dia19.Font.Color:= clBlue;
      5:   QRDBText_Dia19.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo20').AsInteger of
      0:   QRDBText_Dia20.Font.Color:= clGray;
      1:   QRDBText_Dia20.Font.Color:= clTeal;
      2:   QRDBText_Dia20.Font.Color:= clRed;
      3:   QRDBText_Dia20.Font.Color:= clBlack;
      4:   QRDBText_Dia20.Font.Color:= clBlue;
      5:   QRDBText_Dia20.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo21').AsInteger of
      0:   QRDBText_Dia21.Font.Color:= clGray;
      1:   QRDBText_Dia21.Font.Color:= clTeal;
      2:   QRDBText_Dia21.Font.Color:= clRed;
      3:   QRDBText_Dia21.Font.Color:= clBlack;
      4:   QRDBText_Dia21.Font.Color:= clBlue;
      5:   QRDBText_Dia21.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo22').AsInteger of
      0:   QRDBText_Dia22.Font.Color:= clGray;
      1:   QRDBText_Dia22.Font.Color:= clTeal;
      2:   QRDBText_Dia22.Font.Color:= clRed;
      3:   QRDBText_Dia22.Font.Color:= clBlack;
      4:   QRDBText_Dia22.Font.Color:= clBlue;
      5:   QRDBText_Dia22.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo23').AsInteger of
      0:   QRDBText_Dia23.Font.Color:= clGray;
      1:   QRDBText_Dia23.Font.Color:= clTeal;
      2:   QRDBText_Dia23.Font.Color:= clRed;
      3:   QRDBText_Dia23.Font.Color:= clBlack;
      4:   QRDBText_Dia23.Font.Color:= clBlue;
      5:   QRDBText_Dia23.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo24').AsInteger of
      0:   QRDBText_Dia24.Font.Color:= clGray;
      1:   QRDBText_Dia24.Font.Color:= clTeal;
      2:   QRDBText_Dia24.Font.Color:= clRed;
      3:   QRDBText_Dia24.Font.Color:= clBlack;
      4:   QRDBText_Dia24.Font.Color:= clBlue;
      5:   QRDBText_Dia24.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo25').AsInteger of
      0:   QRDBText_Dia25.Font.Color:= clGray;
      1:   QRDBText_Dia25.Font.Color:= clTeal;
      2:   QRDBText_Dia25.Font.Color:= clRed;
      3:   QRDBText_Dia25.Font.Color:= clBlack;
      4:   QRDBText_Dia25.Font.Color:= clBlue;
      5:   QRDBText_Dia25.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo26').AsInteger of
      0:   QRDBText_Dia26.Font.Color:= clGray;
      1:   QRDBText_Dia26.Font.Color:= clTeal;
      2:   QRDBText_Dia26.Font.Color:= clRed;
      3:   QRDBText_Dia26.Font.Color:= clBlack;
      4:   QRDBText_Dia26.Font.Color:= clBlue;
      5:   QRDBText_Dia26.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo27').AsInteger of
      0:   QRDBText_Dia27.Font.Color:= clGray;
      1:   QRDBText_Dia27.Font.Color:= clTeal;
      2:   QRDBText_Dia27.Font.Color:= clRed;
      3:   QRDBText_Dia27.Font.Color:= clBlack;
      4:   QRDBText_Dia27.Font.Color:= clBlue;
      5:   QRDBText_Dia27.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo28').AsInteger of
      0:   QRDBText_Dia28.Font.Color:= clGray;
      1:   QRDBText_Dia28.Font.Color:= clTeal;
      2:   QRDBText_Dia28.Font.Color:= clRed;
      3:   QRDBText_Dia28.Font.Color:= clBlack;
      4:   QRDBText_Dia28.Font.Color:= clBlue;
      5:   QRDBText_Dia28.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo29').AsInteger of
      0:   QRDBText_Dia29.Font.Color:= clGray;
      1:   QRDBText_Dia29.Font.Color:= clTeal;
      2:   QRDBText_Dia29.Font.Color:= clRed;
      3:   QRDBText_Dia29.Font.Color:= clBlack;
      4:   QRDBText_Dia29.Font.Color:= clBlue;
      5:   QRDBText_Dia25.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo30').AsInteger of
      0:   QRDBText_Dia30.Font.Color:= clGray;
      1:   QRDBText_Dia30.Font.Color:= clTeal;
      2:   QRDBText_Dia30.Font.Color:= clRed;
      3:   QRDBText_Dia30.Font.Color:= clBlack;
      4:   QRDBText_Dia30.Font.Color:= clBlue;
      5:   QRDBText_Dia30.Font.Color:= clAqua;
   end;

   Case Form_MenuRecepcao.IBQuery_Visao.FieldByName('Tipo31').AsInteger of
      0:   QRDBText_Dia31.Font.Color:= clGray;
      1:   QRDBText_Dia31.Font.Color:= clTeal;
      2:   QRDBText_Dia31.Font.Color:= clRed;
      3:   QRDBText_Dia31.Font.Color:= clBlack;
      4:   QRDBText_Dia31.Font.Color:= clBlue;
      5:   QRDBText_Dia31.Font.Color:= clAqua;
   end;
end;
end.
