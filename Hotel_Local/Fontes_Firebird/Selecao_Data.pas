//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Selecao_Data.PAS                               //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de selecionar a     //
//                             data para emissao dos relatorio.               //
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

unit Selecao_Data;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Rotinas,
  Buttons, ToolWin, ComCtrls, Db, Grids, DBGrids, StdCtrls, Mask,
  ExtCtrls, IBCustomDataSet, IBQuery, IBTable;

type
  TForm_Movimento = class(TForm)
    DBGrid_Responsaveis: TDBGrid;
    DST_Responsaveis: TDataSource;
    StatusBar: TStatusBar;
    RadioGroup_Relatorio: TRadioGroup;
    DSQ_Historico: TDataSource;
    Panel1: TPanel;
    Label_Relatorio: TLabel;
    DateTimePicker_Data: TDateTimePicker;
    ToolBar2: TToolBar;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    ToolButton_Ajuda: TToolButton;
    ToolButton_Imprimir: TToolButton;
    IBTable_Hospede_Historico: TIBTable;
    IBQuery_Historico: TIBQuery;
    IBTable_Responsaveis: TIBTable;
    IBTable_ResponsaveisCODIGO: TSmallintField;
    IBTable_ResponsaveisNOME: TIBStringField;
    IBTable_ResponsaveisFUNCAO: TIBStringField;
    IBQuery_HistoricoIDENTIDADE: TIBStringField;
    IBQuery_HistoricoFICHA: TIBStringField;
    IBQuery_HistoricoANO: TSmallintField;
    IBQuery_HistoricoPREDIO: TIBStringField;
    IBQuery_HistoricoAPTO: TSmallintField;
    IBQuery_HistoricoDATAENTRADA: TDateTimeField;
    IBQuery_HistoricoHORAENTRADA: TIBStringField;
    IBQuery_HistoricoDATASAIDA: TDateTimeField;
    IBQuery_HistoricoDATAPAGAMENTO: TDateTimeField;
    IBQuery_HistoricoNRECIBO: TIBStringField;
    IBQuery_HistoricoBANCO: TIBStringField;
    IBQuery_HistoricoNCHEQUE: TIBStringField;
    IBQuery_HistoricoPRACA: TIBStringField;
    IBQuery_HistoricoVALORPAGO: TIBBCDField;
    IBQuery_HistoricoCUSTO_TELEFONE: TIBBCDField;
    IBQuery_HistoricoUSUARIO_ENTRADA: TIBStringField;
    IBQuery_HistoricoSITUACAO_CURSO: TIBStringField;
    IBQuery_HistoricoUSUARIO_SAIDA: TIBStringField;
    IBQuery_HistoricoTIPO_FECHAMENTO: TIBStringField;
    IBQuery_HistoricoRECEBIDO: TIBStringField;
    IBQuery_HistoricoHORA_OPERACAO: TIBStringField;
    IBQuery_HistoricoDATA_OPERACAO: TDateTimeField;

    procedure FormActivate(Sender: TObject);

    procedure Trata_Relatorio;
    procedure ToolButton_ImprimirClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public    { Public declarations }
  VR_Cheque, VR_Dinheiro: Real;
  end;

var
  Form_Movimento: TForm_Movimento;

implementation

uses Relatorio_Movimento_Entrada, Relatorio_Movimento_Saida, Rel_Calculos;

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure principal.
//------------------------------------------------------------------------------

procedure TForm_Movimento.FormActivate(Sender: TObject);
begin
   if Funcoes.GetRelatorio = 0 then
   begin
      Funcoes.SetRelatorio(1);
      IBTable_Hospede_Historico.open;
      IBTable_Responsaveis.open;
      IBQuery_Historico.Open;
      DateTimePicker_Data.Date:= Date;

      if ((Funcoes.GetPrivilegio = 'G') or (Funcoes.GetPrivilegio = 'U')) then
         ToolButton_Ajuda.Visible:= True
      else
         ToolButton_Ajuda.Visible:= False;
      end;
end;

//------------------------------------------------------------------------------
// Procedure para retornar para o Menu Principal
//------------------------------------------------------------------------------

procedure TForm_Movimento.ToolButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Movimento.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Procedure para chamar o relatorio
//------------------------------------------------------------------------------

procedure TForm_Movimento.ToolButton_ImprimirClick(Sender: TObject);
begin
   case RadioGroup_Relatorio.ItemIndex of
      0: Begin
            Funcoes.SetRelatorio(1);
            Trata_Relatorio;
         end;
      1: Begin
            Funcoes.SetRelatorio(2);
            Trata_Relatorio;
         end;
      2: Begin
            Funcoes.SetRelatorio(3);
            Trata_Relatorio;
         end;
   end;
end;

//------------------------------------------------------------------------------
// Procedure para chamar o relatorio
//------------------------------------------------------------------------------

procedure TForm_Movimento.Trata_Relatorio;
var
   VS_Comando: String;
   VS_Data: String;
begin
   VS_Data:= Funcoes.DePara(DateToStr(DateTimePicker_Data.Date), '/', '.');
   VS_Data:= VS_Data+' 00:00';

   case Funcoes.GetRelatorio of
      1: Begin
            VS_Comando:= 'Select * from historico where dataEntrada = '+#39+VS_Data+#39;
            IBQuery_Historico.Close;
            IBQuery_Historico.Sql.Clear;
            IBQuery_Historico.Sql.Add(VS_Comando);
            IBQuery_Historico.Open;

            if IBQuery_Historico.RecordCount = 0 then
               MessageDlg('Não possui registro na data selecionada ', mtInformation,[mbOk], 0)
            else
               QRListForm_Movimento_Entrada.QuickRep_Entrada.Preview;
         end;
      2: Begin
            VS_Comando:= 'Select * from historico where DataPagamento = '+#39+VS_Data+#39+' order by nrecibo';
            IBQuery_Historico.Close;
            IBQuery_Historico.Sql.Clear;
            IBQuery_Historico.Sql.Add(VS_Comando);
            IBQuery_Historico.Open;

            if IBQuery_Historico.RecordCount = 0 then
               MessageDlg('Não possui registro na data selecionada ', mtInformation,[mbOk], 0)
            else
               QRListForm_Movimento_Saida.QuickRep_Entrada.Preview;
         end;
      3: Begin
            VS_Comando:= 'Select * from historico where DataPagamento = '+#39+VS_Data+#39+' order by nrecibo';

            IBQuery_Historico.Close;
            IBQuery_Historico.Sql.Clear;
            IBQuery_Historico.Sql.Add(VS_Comando);
            IBQuery_Historico.Open;

            if IBQuery_Historico.RecordCount = 0 then
               MessageDlg('Não possui registro na data selecionada ', mtInformation,[mbOk], 0)
            else
            begin
               VR_Cheque:= 0;
               VR_Dinheiro:= 0;

               IBQuery_Historico.First;
               While not IBQuery_Historico.eof do
               begin
                  if trim(IBQuery_Historico.fieldByNAme('NCheque').AsString) = '' then
                     VR_Dinheiro:= VR_Dinheiro + IBQuery_Historico.fieldByNAme('ValorPago').Asfloat
                  else
                     VR_Cheque:= VR_Cheque + IBQuery_Historico.fieldByNAme('ValorPago').Asfloat;
                  IBQuery_Historico.Next;
               end;
               IBQuery_Historico.Filter:= 'ncheque <> '+#39+'      '+#39;
               IBQuery_Historico.Filtered:= True;
               QRListForm_Calculos.QuickRep_Calculo.Preview;
         end;
      end;
   end;
end;

procedure TForm_Movimento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.
