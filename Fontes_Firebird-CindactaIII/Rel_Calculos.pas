//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Rel_Calculos.PAS                               //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de montar o relato- //
//                             rio de apresentacao dos calculos.              //
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

unit Rel_Calculos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, StdCtrls, jpeg;

type
  TQRListForm_Calculos = class(TForm)
    QuickRep_Calculo: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel_Data: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel2: TQRLabel;
    QRBand2: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel_Total_Cheque: TQRLabel;
    QRLabel_Total_Dinheiro: TQRLabel;
    QRLabel_Total_Geral: TQRLabel;
    QRLabel_Relatorio: TQRLabel;
    QRLabel_Cabecalho_instituto: TQRLabel;
    QRImage1: TQRImage;
    procedure QuickRep_CalculoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QRListForm_Calculos: TQRListForm_Calculos;

implementation

uses Selecao_Data;

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure para mostrar a data do relatorio e os valores totais
//------------------------------------------------------------------------------

procedure TQRListForm_Calculos.QuickRep_CalculoBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   QRLabel_Data.Caption:= DateToStr(Form_Movimento.DateTimePicker_Data.date);

   QRLabel_Total_Cheque.Caption:= FormatFloat('######0.00', Form_Movimento.VR_Cheque);
   QRLabel_Total_Dinheiro.Caption:= FormatFloat('######0.00', Form_Movimento.VR_Dinheiro);
   QRLabel_Total_Geral.Caption:= FormatFloat('######0.00', Form_Movimento.VR_Cheque+Form_Movimento.VR_Dinheiro);
end;

end.
