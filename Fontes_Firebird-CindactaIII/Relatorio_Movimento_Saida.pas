//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Relatorio_Movimento_Entrada.PAS                //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de montar o relato- //
//                             rio diario de movimento do Hotel.              //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 02/12/2003                                     //
//                                                                            //
// ATUALIZADO                :                                                //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Relatorio_Movimento_Saida;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Qrctrls, QuickRpt, ExtCtrls, Rotinas, jpeg;

type
  TQRListForm_Movimento_Saida = class(TForm)
    QuickRep_Entrada: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel_Relatorio: TQRLabel;
    QRLabel_Entrada: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel_Data: TQRLabel;
    QRShape1: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape6: TQRShape;
    QRShape12: TQRShape;
    QRLabel9: TQRLabel;
    QRSysData1: TQRSysData;
    QRDBText_Nome: TQRDBText;
    QRDBText_Funcao: TQRDBText;
    QRExpr1: TQRExpr;
    QRImage_Logo: TQRImage;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel10: TQRLabel;
    QRShape15: TQRShape;
    QRLabel4: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRDBText5: TQRDBText;
    QRShape18: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel_PostoGrad: TQRLabel;
    procedure QuickRep_EntradaBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public    { Public declarations }
      VR_Valor: Real;
  end;

var
  QRListForm_Movimento_Saida: TQRListForm_Movimento_Saida;

implementation

uses Selecao_Data;

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure para mostrar a data do relatorio
//------------------------------------------------------------------------------

procedure TQRListForm_Movimento_Saida.QuickRep_EntradaBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   VR_Valor:= 0;
   QRLabel_Data.Caption:= DateToStr(Form_Movimento.DateTimePicker_Data.date);
end;

//------------------------------------------------------------------------------
// Procedure para mostrar a soma dos valores
//------------------------------------------------------------------------------

procedure TQRListForm_Movimento_Saida.DetailBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   if ((Form_Movimento.IBTable_Hospede_Historico.FieldByNAme('Posto').AsSTring <> '') and
       (Form_Movimento.IBTable_Hospede_Historico.FieldByNAme('Posto').AsSTring <> NULL)) then
      QRLabel_PostoGrad.Caption:= Form_Movimento.IBTable_Hospede_Historico.FieldByNAme('Posto').AsSTring
   else
      QRLabel_PostoGrad.Caption:= 'Dep - '+Form_Movimento.IBTable_Hospede_Historico.FieldByNAme('Dependente_de').AsSTring;

   VR_Valor:= VR_Valor + Form_Movimento.IBQuery_Historico.FieldByNAme('VALORPAGO').AsFloat;
   QRLabel3.Caption:= FormatFloat('#######.00',VR_VAlor);
end;

end.
