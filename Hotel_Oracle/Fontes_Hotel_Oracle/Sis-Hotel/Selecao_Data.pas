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
  Buttons, ToolWin, ComCtrls, Db, DBTables, Grids, DBGrids, StdCtrls, Mask,
  ExtCtrls, Menus, JvToolEdit;

type
  TForm_Movimento = class(TForm)
    DSQ_Hospedagem: TDataSource;
    Table_Hospede: TTable;
    Table_Hospede_Historico: TTable;
    DSQ_Hostorico: TDataSource;
    DBGrid_Responsaveis: TDBGrid;
    Table_Responsaveis: TTable;
    Table_ResponsaveisCODIGO: TFloatField;
    Table_ResponsaveisFUNCAO: TStringField;
    Table_ResponsaveisNOME: TStringField;
    DST_Responsaveis: TDataSource;
    Query_Hospedagem: TQuery;
    Query_Historico: TQuery;
    StatusBar: TStatusBar;
    RadioGroup_Relatorio: TRadioGroup;
    DSQ_Historico: TDataSource;
    Query_HistoricoIDENTIDADE: TStringField;
    Query_HistoricoFICHA: TStringField;
    Query_HistoricoANO: TFloatField;
    Query_HistoricoPREDIO: TStringField;
    Query_HistoricoAPTO: TFloatField;
    Query_HistoricoDATAENTRADA: TStringField;
    Query_HistoricoHORAENTRADA: TStringField;
    Query_HistoricoDATASAIDA: TStringField;
    Query_HistoricoDATAPAGAMENTO: TStringField;
    Query_HistoricoNRECIBO: TStringField;
    Query_HistoricoBANCO: TStringField;
    Query_HistoricoNCHEQUE: TStringField;
    Query_HistoricoPRACA: TStringField;
    Query_HistoricoVALORPAGO: TFloatField;
    Query_HistoricoSITUACAO_CURSO: TStringField;
    Query_HistoricoRECEBIDO: TStringField;
    Panel1: TPanel;
    Label_Inicio: TLabel;
    Label_Final: TLabel;
    ToolBar2: TToolBar;
    ToolButton_Imprimir: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    ToolButton_Ajuda: TToolButton;
    PopupMenu1: TPopupMenu;
    ExcluiFichacadastradaerrada1: TMenuItem;
    JvDateEdit_Inicio: TJvDateEdit;
    JvDateEdit_DataTermino: TJvDateEdit;
    Table_RelMovimento: TTable;
    Query_executa: TQuery;
    Query_PagParcelado: TQuery;
    DSQ_PagParcelado: TDataSource;
    Query_PagParceladoIDENTIDADE: TStringField;
    Query_PagParceladoFICHA: TStringField;
    Query_PagParceladoANO: TFloatField;
    Query_PagParceladoDATAPAGAMENTO: TStringField;
    Query_PagParceladoVALOR: TFloatField;
    Query_PagParceladoNRECIBO: TStringField;
    Query_PagParceladoNOME: TStringField;
    Query_PagParceladoPOSTO: TStringField;
    Table_HospPagParcelado: TTable;
    Table_HospPagParceladoIDENTIDADE: TStringField;
    Table_HospPagParceladoFICHA: TStringField;
    Table_HospPagParceladoANO: TFloatField;
    Table_HospPagParceladoPREDIO: TStringField;
    Table_HospPagParceladoAPTO: TFloatField;
    Table_HospPagParceladoCAMA: TFloatField;
    Table_HospPagParceladoDATAENTRADA: TStringField;
    Table_HospPagParceladoHORAENTRADA: TStringField;
    Table_HospPagParceladoDATASAIDA: TStringField;
    Table_HospPagParceladoDEPENDENTE: TFloatField;
    Table_HospPagParceladoSITUACAO_HOSPEDAGEM: TStringField;
    Table_HospPagParceladoRECEBE: TStringField;
    Table_HospPagParceladoDESCONTO: TStringField;
    Table_RelMovimentoIDENTIDADE: TStringField;
    Table_RelMovimentoFICHA: TStringField;
    Table_RelMovimentoANO: TFloatField;
    Table_RelMovimentoPREDIO: TStringField;
    Table_RelMovimentoAPTO: TFloatField;
    Table_RelMovimentoNOME: TStringField;
    Table_RelMovimentoPOSTO: TStringField;
    Table_RelMovimentoNRECIBO: TStringField;
    Table_RelMovimentoVALORPAGO: TFloatField;
    Table_RelMovimentoDATAPAGAMENTO: TStringField;

    procedure FormActivate(Sender: TObject);

    procedure Trata_Relatorio;
    procedure ToolButton_ImprimirClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ExcluiFichacadastradaerrada1Click(Sender: TObject);

  private
    { Private declarations }
  public    { Public declarations }
  VR_Cheque, VR_Dinheiro: Real;
  end;

var
  Form_Movimento: TForm_Movimento;

implementation

uses Relatorio_Movimento_Entrada, Relatorio_Movimento_Saida, Rel_Calculos,
  Exclui_Ficha;

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure principal.
//------------------------------------------------------------------------------

procedure TForm_Movimento.FormActivate(Sender: TObject);
begin
   if Funcoes.GetRelatorio = 0 then
   begin
      Funcoes.SetRelatorio(1);
      Table_Hospede_Historico.open;
      Table_Hospede.open;
      Table_Responsaveis.open;
      Query_Historico.Open;
      JvDateEdit_Inicio.Date:= Date;
      JvDateEdit_DataTermino.Date:= Date;
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
   if (trim(JvDateEdit_Inicio.Text) = '') or (trim(JvDateEdit_DataTermino.Text) = '') then
      MessageDlg('O valor inicial e o valor final não pode ser branco', mtInformation,[mbOk], 0)
   else
   begin
      if JvDateEdit_Inicio.Date > JvDateEdit_DataTermino.Date then
          MessageDlg('A data inicial não pode ser maior que a data final', mtInformation,[mbOk], 0)
      else
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
   end;
end;

//------------------------------------------------------------------------------
// Procedure para chamar o relatorio
//------------------------------------------------------------------------------

procedure TForm_Movimento.Trata_Relatorio;
var
   VS_Comando: String;
begin
   if JvDateEdit_Inicio.Date > JvDateEdit_DataTermino.Date then
   begin
        ShowMessage('A Data de de Inicio não pode ser maior que a data de Termino...');
   end
   else
   begin
      case Funcoes.GetRelatorio of
         1: Begin
               VS_Comando:= 'Select * from hospedagem where '+
                            ' (DataEntrada >= To_date('+#39+JvDateEdit_Inicio.Text+#39+', '+#39+'DD/MM/YYYY'+#39+') and '+
                            ' DataSaida <= To_date('+#39+JvDateEdit_DataTermino.Text+#39+', '+#39+'DD/MM/YYYY'+#39+'))'+
                            ' order by TO_Number(Ficha)';
               Query_Hospedagem.Close;
               Query_Hospedagem.Sql.Clear;
               Query_Hospedagem.Sql.Add(VS_Comando);
               Query_Hospedagem.Open;

               if Query_Hospedagem.RecordCount = 0 then
                  MessageDlg('Não possui ficha no período selecionado...', mtInformation,[mbOk], 0)
               else
                  QRListForm_Movimento_Entrada.QuickRep_Entrada.Preview;
            end;
         2: Begin
               Table_RelMovimento.Open;
               VS_Comando:= 'Delete From Rel_Movimento';
               Query_executa.Close;
               Query_executa.SQL.Clear;
               Query_executa.SQL.Add(VS_comando);
               Query_executa.ExecSQL;

               VS_Comando:= 'Select * from historico where ano = '+Funcoes.AnoAtual+' and nrecibo is not NULL and '+
                            ' (Datapagamento >= To_date('+#39+JvDateEdit_Inicio.Text+#39+', '+#39+'DD/MM/YYYY'+#39+') and '+
                            ' Datapagamento <= To_date('+#39+JvDateEdit_DataTermino.Text+#39+', '+#39+'DD/MM/YYYY'+#39+'))'+
                            ' order by nrecibo';

               Query_Historico.Close;
               Query_Historico.Sql.Clear;
               Query_Historico.Sql.Add(VS_Comando);
               Query_Historico.Open;
               Query_Historico.Filtered:= False;
               Table_Hospede_Historico.Open;

               Query_Historico.First;
               While not Query_Historico.eof do
               begin
                  if ((StrToDate(Query_Historico.FieldByName('DataPagamento').AsString) >= JvDateEdit_Inicio.Date) and
                      (StrToDate(Query_Historico.FieldByName('DataPagamento').AsString) <= JvDateEdit_DataTermino.Date)) Then
                  begin
                     Table_RelMovimento.Append;
                     Table_RelMovimento.FieldByName('IDENTIDADE').AsString:= Query_Historico.FieldByName('IDENTIDADE').AsString;
                     Table_RelMovimento.FieldByName('FICHA').AsString:= Query_Historico.FieldByName('FICHA').AsString;
                     Table_RelMovimento.FieldByName('ANO').AsString:= Query_Historico.FieldByName('ANO').AsString;
                     Table_RelMovimento.FieldByName('PREDIO').AsString:=  Query_Historico.FieldByName('PREDIO').AsString;
                     Table_RelMovimento.FieldByName('APTO').AsString:= Query_Historico.FieldByName('APTO').AsString;
                     Table_RelMovimento.FieldByName('NOME').AsString:=  Table_Hospede_Historico.FieldByName('NOME').AsString;
                     Table_RelMovimento.FieldByName('POSTO').AsString:=  Table_Hospede_Historico.FieldByName('POSTO').AsString;
                     Table_RelMovimento.FieldByName('NRECIBO').AsString:= Query_Historico.FieldByName('NRECIBO').AsString;
                     Table_RelMovimento.FieldByName('VALORPAGO').AsString:=  Query_Historico.FieldByName('VALORPAGO').AsString;
                     Table_RelMovimento.FieldByName('Datapagamento').AsString:=  Query_Historico.FieldByName('Datapagamento').AsString;
                     Table_RelMovimento.Post;
                  end;

                  Query_Historico.Next;
               end;

               ///--- Pega os valores pagos semanalmente


               VS_Comando:= 'Select p.IDENTIDADE, p.FICHA, p.ANO, p.DATAPAGAMENTO, p.VALOR, p.NRECIBO, H.Nome, h.POSTO '+
                            ' From HOSPEDE h,  PagParcelado p '+
                            ' Where p.Identidade = h.Identidade '+
                            ' order by nrecibo';

               Query_PagParcelado.Close;
               Query_PagParcelado.Open;
               Table_HospPagParcelado.Open;

               Query_PagParcelado.First;
               While not Query_PagParcelado.eof do
               begin
                  if ((StrToDate(Query_PagParcelado.FieldByName('DataPagamento').AsString) >= JvDateEdit_Inicio.Date) and
                      (StrToDate(Query_PagParcelado.FieldByName('DataPagamento').AsString) <= JvDateEdit_DataTermino.Date)) Then
                  begin
                     Table_RelMovimento.Append;
                     Table_RelMovimento.FieldByName('IDENTIDADE').AsString:= Query_PagParcelado.FieldByName('IDENTIDADE').AsString;
                     Table_RelMovimento.FieldByName('FICHA').AsString:= Query_PagParcelado.FieldByName('FICHA').AsString;
                     Table_RelMovimento.FieldByName('ANO').AsString:= Query_PagParcelado.FieldByName('ANO').AsString;
                     Table_RelMovimento.FieldByName('PREDIO').AsString:=  Table_HospPagParcelado.FieldByName('PREDIO').AsString;
                     Table_RelMovimento.FieldByName('APTO').AsString:= Table_HospPagParcelado.FieldByName('APTO').AsString;
                     Table_RelMovimento.FieldByName('NOME').AsString:=  Query_PagParcelado.FieldByName('NOME').AsString;
                     Table_RelMovimento.FieldByName('POSTO').AsString:=  Query_PagParcelado.FieldByName('POSTO').AsString;
                     Table_RelMovimento.FieldByName('NRECIBO').AsString:= Query_PagParcelado.FieldByName('NRECIBO').AsString;
                     Table_RelMovimento.FieldByName('VALORPAGO').AsString:=  Query_PagParcelado.FieldByName('valor').AsString;
                     Table_RelMovimento.FieldByName('Datapagamento').AsString:=  Query_PagParcelado.FieldByName('Datapagamento').AsString;
                     Table_RelMovimento.Post;
                  end;

                  Query_PagParcelado.Next;
               end;
               QRListForm_Movimento_Saida.QuickRep_Entrada.Preview;
            end;
            
         3: Begin
               VS_Comando:= 'Select * from historico where ano = '+Funcoes.AnoAtual+' and nrecibo is not NULL and '+
                            ' (DataEntrada >= To_date('+#39+JvDateEdit_Inicio.Text+#39+', '+#39+'DD/MM/YYYY'+#39+') and '+
                            ' DataSaida <= To_date('+#39+JvDateEdit_DataTermino.Text+#39+', '+#39+'DD/MM/YYYY'+#39+'))'+
                            ' order by nrecibo';

               Query_Historico.Close;
               Query_Historico.Sql.Clear;
               Query_Historico.Sql.Add(VS_Comando);
               Query_Historico.Open;
               Query_Historico.Filtered:= False;
               Table_Hospede_Historico.Open;

               if Query_Historico.RecordCount = 0 then
                  MessageDlg('Não possui fechamento entre '+trim(JvDateEdit_Inicio.Text)+' e '+trim(JvDateEdit_Inicio.Text), mtInformation,[mbOk], 0)
               else
               begin
                  VR_Cheque:= 0;
                  VR_Dinheiro:= 0;

                  Query_Historico.First;
                  While not Query_Historico.eof do
                  begin
                     if trim(Query_Historico.fieldByNAme('NCheque').AsString) = '' then
                        VR_Dinheiro:= VR_Dinheiro + Query_Historico.fieldByNAme('ValorPago').Asfloat
                     else
                        VR_Cheque:= VR_Cheque + Query_Historico.fieldByNAme('ValorPago').Asfloat;
                     Query_Historico.Next;
                  end;
                  Query_Historico.Filtered:= True;
                  QRListForm_Calculos.QuickRep_Calculo.Preview;
            end;
         end;
      end;
   end;
end;

procedure TForm_Movimento.ExcluiFichacadastradaerrada1Click(Sender: TObject);
begin
   Form_Exclui_Ficha.Show;
end;

end.
