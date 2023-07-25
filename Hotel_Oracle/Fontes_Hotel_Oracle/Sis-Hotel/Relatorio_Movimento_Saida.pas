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
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, Rotinas;

type
  TQRListForm_Movimento_Saida = class(TForm)
    QuickRep_Entrada: TQuickRep;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel_Cabecalho_instituto: TQRLabel;
    QRImage_Logo: TQRImage;
    QRLabel_Relatorio: TQRLabel;
    QRLabel_Entrada: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel_Data: TQRLabel;
    QRShape1: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
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
    QRLabel10: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape6: TQRShape;
    QRShape12: TQRShape;
    QRLabel9: TQRLabel;
    QRSysData1: TQRSysData;
    QRDBText_Nome: TQRDBText;
    QRDBText_Funcao: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    Query_executa: TQuery;
    Query_executaIDENTIDADE: TStringField;
    Query_executaFICHA: TStringField;
    Query_executaANO: TFloatField;
    Query_executaPREDIO: TStringField;
    Query_executaAPTO: TFloatField;
    Query_executaNOME: TStringField;
    Query_executaPOSTO: TStringField;
    Query_executaNRECIBO: TStringField;
    Query_executaVALORPAGO: TFloatField;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    Query_executaDATAPAGAMENTO: TStringField;
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
   Query_executa.Close;
   Query_executa.Open;
   VR_Valor:= 0;
   QRLabel_Data.Caption:= Form_Movimento.JvDateEdit_Inicio.Text+' à '+Form_Movimento.JvDateEdit_DataTermino.Text;
end;

//------------------------------------------------------------------------------
// Procedure para mostrar a soma dos valores
//------------------------------------------------------------------------------

procedure TQRListForm_Movimento_Saida.DetailBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   VR_Valor:= VR_Valor + Query_executa.FieldByNAme('VALORPAGO').AsFloat;
   QRLabel3.Caption:= FormatFloat('#######.00',VR_VAlor);
end;

end.
