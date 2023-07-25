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

unit Relatorio_Movimento_Entrada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, Rotinas;

type
  TQRListForm_Movimento_Entrada = class(TForm)
    QuickRep_Entrada: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel_Cabecalho_instituto: TQRLabel;
    QRLabel_Relatorio: TQRLabel;
    QRLabel_Entrada: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel_Data: TQRLabel;
    QRShape1: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText_Funcao: TQRDBText;
    QRDBText_Nome: TQRDBText;
    QRShape3: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRImage_Logo: TQRImage;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText8: TQRDBText;
    procedure QuickRep_EntradaBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QRListForm_Movimento_Entrada: TQRListForm_Movimento_Entrada;

implementation

uses Selecao_Data;

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure para mostrar a data do relatorio
//------------------------------------------------------------------------------

procedure TQRListForm_Movimento_Entrada.QuickRep_EntradaBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   QRLabel_Data.Caption:= Form_Movimento.JvDateEdit_Inicio.Text+' à '+Form_Movimento.JvDateEdit_DataTermino.Text;
end;

end.
