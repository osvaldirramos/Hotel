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

unit Rel_Mapa_Ocupacao_R;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Qrctrls, QuickRpt, ExtCtrls, jpeg, JvGIF;

type
  TQRListForm_Mapa_Hospedagem_R = class(TForm)
    QuickRep_Mapa_Ocupacao: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText_Situacao: TQRDBText;
    QRDBText_Nome: TQRDBText;
    QRDBText_DataEntrada: TQRDBText;
    QRDBText_DataSaida: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData3: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape2: TQRShape;
    QRLabel_Hora_Saida: TQRLabel;
    QRLabel_Situacao_Curso: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRSysData_Hora: TQRSysData;
    QRImage1: TQRImage;
    QRDBText_Cama: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText_SituacaoCurso: TQRDBText;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QRListForm_Mapa_Hospedagem_R: TQRListForm_Mapa_Hospedagem_R;

implementation

uses Recepcao;

{$R *.DFM}

procedure TQRListForm_Mapa_Hospedagem_R.DetailBand1BeforePrint( Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   DetailBand1.Color:= clWhite;
   QRDBText_Cama.Font.Color:= clWhite;
   QRDBText_Nome.Font.Color:= clWhite;
   QRDBText_Situacao.Color:= clWhite;
   QRDBText_SituacaoCurso.Color:= clWhite;
   QRDBText_DataEntrada.Color:= clWhite;
   QRDBText_DataSaida.Color:= clWhite;

   if Form_MenuRecepcao.IBQuery_Busca.FieldByName('Tipo').AsString = '3' then
   begin
      QRDBText_Cama.Font.Color:= clBlack;
      QRDBText_Nome.Font.Color:= clBlack;
      QRDBText_Situacao.Font.Color:= clBlack;
      QRDBText_SituacaoCurso.Font.Color:= clBlack;
      QRDBText_DataEntrada.Font.Color:= clBlack;
      QRDBText_DataSaida.Font.Color:= clBlack;
   end
   else
   begin
      if (Form_MenuRecepcao.IBQuery_Busca.FieldByName('Tipo').AsString = '0') then
      begin
         QRDBText_Cama.Font.Color:= clWhite;
         QRDBText_Nome.Font.Color:= clWhite;
         QRDBText_Situacao.Font.Color:= clWhite;
         QRDBText_SituacaoCurso.Font.Color:= clWhite;
         QRDBText_DataEntrada.Font.Color:= clWhite;
         QRDBText_DataSaida.Font.Color:= clWhite;

         QRDBText_Cama.Color:= clGray;
         QRDBText_Nome.Color:= clGray;
         QRDBText_Situacao.Color:= clGray;
         QRDBText_SituacaoCurso.Color:= clGray;
         QRDBText_DataEntrada.Color:= clGray;
         QRDBText_DataSaida.Color:= clGray;

         DetailBand1.Color:= clGray;
      end
      else
      begin
         if ((Form_MenuRecepcao.IBQuery_Busca.FieldByName('Tipo').AsString = '1')) then
         begin
            QRDBText_Cama.Font.Color:= clTeal;
            QRDBText_Nome.Font.Color:= clTeal;
            QRDBText_Situacao.Font.Color:= clTeal;
            QRDBText_SituacaoCurso.Font.Color:= clTeal;
            QRDBText_DataEntrada.Font.Color:= clTeal;
            QRDBText_DataSaida.Font.Color:= clTeal;
         end
         else
         begin
            if Form_MenuRecepcao.IBQuery_Busca.FieldByName('Tipo').AsString = '2' then
            begin
               QRDBText_Cama.Font.Color:= clRed;
               QRDBText_Nome.Font.Color:= clRed;
               QRDBText_Situacao.Font.Color:= clRed;
               QRDBText_SituacaoCurso.Font.Color:= clRed;
               QRDBText_DataEntrada.Font.Color:= clRed;
               QRDBText_DataSaida.Font.Color:= clRed;
            end
            else
            begin
               if Form_MenuRecepcao.IBQuery_Busca.FieldByName('Tipo').AsString = '4' then
               begin
                  QRDBText_Cama.Font.Color:= clBlue;
                  QRDBText_Nome.Font.Color:= clBlue;
                  QRDBText_Situacao.Font.Color:= clBlue;
                  QRDBText_SituacaoCurso.Font.Color:= clBlue;
                  QRDBText_DataEntrada.Font.Color:= clBlue;
                  QRDBText_DataSaida.Font.Color:= clBlue;
               end
               else
               begin
                  if Form_MenuRecepcao.IBQuery_Busca.FieldByName('Tipo').AsString = '5' then
                  begin
                     QRDBText_Cama.Font.Color:= $00004000;
                     QRDBText_Nome.Font.Color:= $00004000;
                     QRDBText_Situacao.Font.Color:= $00004000;
                     QRDBText_SituacaoCurso.Font.Color:= $00004000;
                     QRDBText_DataEntrada.Font.Color:= $00004000;
                     QRDBText_DataSaida.Font.Color:= $00004000;
                  end;
               end;
            end;
         end;
      end;
   end;
end;

end.
