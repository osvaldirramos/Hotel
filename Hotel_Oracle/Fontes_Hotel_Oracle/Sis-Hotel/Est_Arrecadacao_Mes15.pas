//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Menu_Soldado.PAS                               //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de montar o menu    //
//                             que sera utilizado pelo pessoal da recepcao.   //
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
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Est_Arrecadacao_Mes15;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, Rotinas, Grids, DBGrids, Db, DBTables, ComCtrls,
  Buttons, ToolWin, StdCtrls, Mask, TeEngine, Series, TeeProcs, Chart,
  DBChart, DBCtrls, JvGradient;

type
  TForm_Est_Arrecadacao_Mes15 = class(TForm)
    StatusBar: TStatusBar;
    Query_Historico: TQuery;
    Table_Estatistica: TTable;
    DBChart1: TDBChart;
    Table_EstatisticaCODIGO: TFloatField;
    Table_EstatisticaSITUACAO: TStringField;
    Table_EstatisticaVALOR: TFloatField;
    Series1: TBarSeries;
    Query_Estatistica: TQuery;
    Query_EstatisticaCODIGO: TFloatField;
    Query_EstatisticaSITUACAO: TStringField;
    Query_EstatisticaVALOR: TFloatField;
    DataSource1: TDataSource;
    ToolBar2: TToolBar;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    ToolButton_Ajuda: TToolButton;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    Label_Jan: TLabel;
    GroupBox2: TGroupBox;
    Label_Fev: TLabel;
    GroupBox3: TGroupBox;
    Label_Mar: TLabel;
    GroupBox4: TGroupBox;
    Label_Mai: TLabel;
    GroupBox5: TGroupBox;
    Label_Abr: TLabel;
    GroupBox6: TGroupBox;
    Label_Jun: TLabel;
    GroupBox7: TGroupBox;
    Label_Jul: TLabel;
    GroupBox8: TGroupBox;
    Label_Ago: TLabel;
    GroupBox9: TGroupBox;
    Label_Set: TLabel;
    GroupBox10: TGroupBox;
    Label_Nov: TLabel;
    GroupBox11: TGroupBox;
    Label_Out: TLabel;
    GroupBox12: TGroupBox;
    Label_Dez: TLabel;
    GroupBox13: TGroupBox;
    SpeedButton_Atualiza_Mapa: TSpeedButton;
    ComboBox_Ano: TComboBox;
    GroupBox14: TGroupBox;
    Label_ValorTotal: TLabel;
    Query_PagParcelado: TQuery;
    DSQ_PagParcelado: TDataSource;
    Query_PagParceladoIDENTIDADE: TStringField;
    Query_PagParceladoFICHA: TStringField;
    Query_PagParceladoANO: TFloatField;
    Query_PagParceladoDATAPAGAMENTO: TStringField;
    Query_PagParceladoVALOR: TFloatField;
    Query_PagParceladoNRECIBO: TStringField;
    JvGradient1: TJvGradient;
    ToolButton1: TToolButton;
    Query_HistoricoDATAPAGAMENTO: TStringField;
    Query_HistoricoDATA_OPERACAO: TDateTimeField;
    Query_HistoricoVALORPAGO: TFloatField;
    Query_HistoricoIDENTIDADE: TStringField;
    Query_HistoricoFICHA: TStringField;
    Query_HistoricoANO: TFloatField;
    Query_HistoricoDATAENTRADA: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure Calcular;
    procedure Grava(Cod: integer; Desc: String; Valor: Real);
    procedure SpeedButton_Atualiza_MapaClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);

  private
    { Private declarations }
  public    { Public declarations }
  end;

var
  Form_Est_Arrecadacao_Mes15: TForm_Est_Arrecadacao_Mes15;

implementation

uses Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure principal
//------------------------------------------------------------------------------

procedure TForm_Est_Arrecadacao_Mes15.FormActivate(Sender: TObject);
begin
   ComboBox_Ano.Text:= Funcoes.AnoAtual;
   Query_Historico.Open;
   Table_Estatistica.Open;
   Calcular;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Est_Arrecadacao_Mes15.ToolButton_RetornarClick(Sender: TObject);
begin
   Query_Historico.Close;
   Table_Estatistica.Close;
   Close;
end;

procedure TForm_Est_Arrecadacao_Mes15.Calcular;
var
   VI_N_Diarias: Real;
   VS_Ano, VS_Comando: String;
   VI_Retorno: Integer;
   Jan, Fev, Mar, Abr, Mai, Jun, Jul, Ago, Sete, Outu, Nov, Dez: Real;
begin

{   VS_Comando:= 'Select DataPagamento, ValorPago, Identidade, Ficha, ano '+
                ' From Historico '+
                ' Where Ano = '+ComboBox_Ano.Text+
                ' and DataPagamento <> '+#39+' '+#39;
}

   VS_Comando:= 'Select DataPagamento, dataEntrada, Data_Operacao, ValorPago, Identidade, Ficha, ano from historico where ano = '+ComboBox_Ano.Text+' and nrecibo is not NULL ';
   Query_Historico.Close;
   Query_Historico.Sql.Clear;
   Query_Historico.Sql.Add(VS_Comando);
   Query_Historico.Open;

   Jan:= 0.0;
   Fev:= 0.0;
   Mar:= 0.0;
   Abr:= 0.0;
   Mai:= 0.0;
   Jun:= 0.0;
   Jul:= 0.0;
   Ago:= 0.0;
   Sete:= 0.0;
   Outu:= 0.0;
   Nov:= 0.0;
   Dez:= 0.0;


   Query_Historico.First;
   While not Query_Historico.Eof do
   begin
      VS_Ano:= Query_Historico.FieldByName('Ano').AsString;
      if trim(Query_Historico.FieldByName('DATAENTRADA').AsString) <> '' then
      begin
      if trim(Query_Historico.FieldByName('DataPagamento').AsString) <> '' then
      begin
      VI_N_Diarias:= Funcoes.SubData(Query_Historico.FieldByName('DataPagamento').AsDateTime, Query_Historico.FieldByName('DATAENTRADA').AsDateTime);
      VI_Retorno:= Funcoes.Extrai_Mes(Query_Historico.FieldByName('DataPagamento').AsString);
//      VI_Retorno:= Funcoes.Extrai_Mes(Query_Historico.FieldByName('data_operacao').AsString);

      if VI_N_Diarias >= 15 then
      begin
      case VI_Retorno of
         1: Jan:= Jan+ Query_Historico.FieldByName('ValorPago').AsFloat;
         2: Fev:= Fev+ Query_Historico.FieldByName('ValorPago').AsFloat;
         3: Mar:= Mar+ Query_Historico.FieldByName('ValorPago').AsFloat;
         4: Abr:= Abr+ Query_Historico.FieldByName('ValorPago').AsFloat;
         5: Mai:= Mai+ Query_Historico.FieldByName('ValorPago').AsFloat;
         6: Jun:= Jun+ Query_Historico.FieldByName('ValorPago').AsFloat;
         7: Jul:= Jul+ Query_Historico.FieldByName('ValorPago').AsFloat;
         8: Ago:= Ago+ Query_Historico.FieldByName('ValorPago').AsFloat;
         9: Sete:= Sete+ Query_Historico.FieldByName('ValorPago').AsFloat;
         10: Outu:= Outu+ Query_Historico.FieldByName('ValorPago').AsFloat;
         11: Nov:= Nov+ Query_Historico.FieldByName('ValorPago').AsFloat;
         12: Dez:= Dez+ Query_Historico.FieldByName('ValorPago').AsFloat;
      end;
      end;
      end;
      end;
      Query_Historico.Next;
   end;

   VS_Comando:= 'Select IDENTIDADE, FICHA, ANO, DATAPAGAMENTO, VALOR, NRECIBO '+
                ' From PagParcelado '+
                ' where ano = '+ComboBox_Ano.Text;

   Query_PagParcelado.Close;
   Query_PagParcelado.Sql.Clear;
   Query_PagParcelado.Sql.Add(VS_Comando);
   Query_PagParcelado.Open;

   Query_PagParcelado.First;
   While not Query_PagParcelado.eof do
   begin
      VI_Retorno:= Funcoes.Extrai_Mes(Query_PagParcelado.FieldByName('DataPagamento').AsString);

      case VI_Retorno of
         1: Jan:= Jan+ Query_PagParcelado.FieldByName('Valor').AsFloat;
         2: Fev:= Fev+ Query_PagParcelado.FieldByName('Valor').AsFloat;
         3: Mar:= Mar+ Query_PagParcelado.FieldByName('Valor').AsFloat;
         4: Abr:= Abr+ Query_PagParcelado.FieldByName('Valor').AsFloat;
         5: Mai:= Mai+ Query_PagParcelado.FieldByName('Valor').AsFloat;
         6: Jun:= Jun+ Query_PagParcelado.FieldByName('Valor').AsFloat;
         7: Jul:= Jul+ Query_PagParcelado.FieldByName('Valor').AsFloat;
         8: Ago:= Ago+ Query_PagParcelado.FieldByName('Valor').AsFloat;
         9: Sete:= Sete+ Query_PagParcelado.FieldByName('Valor').AsFloat;
         10: Outu:= Outu+ Query_PagParcelado.FieldByName('Valor').AsFloat;
         11: Nov:= Nov+ Query_PagParcelado.FieldByName('Valor').AsFloat;
         12: Dez:= Dez+ Query_PagParcelado.FieldByName('Valor').AsFloat;
      end;
      Query_PagParcelado.Next;
   end;

   Label_Jan.Caption:= FormatFloat('#####0.00',Jan);
   Label_Fev.Caption:= FormatFloat('#####0.00',Fev);
   Label_Mar.Caption:= FormatFloat('#####0.00',Mar);
   Label_Abr.Caption:= FormatFloat('#####0.00',Abr);
   Label_Mai.Caption:= FormatFloat('#####0.00',Mai);
   Label_Jun.Caption:= FormatFloat('#####0.00',Jun);
   Label_Jul.Caption:= FormatFloat('#####0.00',Jul);
   Label_Ago.Caption:= FormatFloat('#####0.00',Ago);
   Label_Set.Caption:= FormatFloat('#####0.00',Sete);
   Label_Out.Caption:= FormatFloat('#####0.00',Outu);
   Label_Nov.Caption:= FormatFloat('#####0.00',Nov);
   Label_Dez.Caption:= FormatFloat('#####0.00',Dez);
   Label_ValorTotal.Caption:= FormatFloat('#####0.00',Jan+Fev+Mar+Abr+Mai+jun+Jul+Ago+Sete+Outu+Nov+Dez);

   DM.Query_Limpa_Estatistica.ExecSql;
   Grava(1, 'Jan', Jan);
   Grava(2, 'Fev', Fev);
   Grava(3, 'Mar', Mar);
   Grava(4, 'Abr', Abr);
   Grava(5, 'Mai', Mai);
   Grava(6, 'Jun', jun);
   Grava(7, 'Jul', Jul);
   Grava(8, 'Ago', Ago);
   Grava(9, 'Set', Sete);
   Grava(10,'Out', Outu);
   Grava(11,'Nov', Nov);
   Grava(12,'Dez', Dez);
   Query_Estatistica.Close;
   Query_Estatistica.Open;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Est_Arrecadacao_Mes15.Grava(Cod: integer; Desc: String; Valor: Real);
begin
   Table_Estatistica.Append;
   Table_Estatistica.FieldByName('CODIGO').AsInteger:= Cod;
   Table_Estatistica.FieldByName('SITUACAO').AsString:= Desc;
   Table_Estatistica.FieldByName('VALOR').AsFloat:= Valor;
   Table_Estatistica.Post;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Est_Arrecadacao_Mes15.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

procedure TForm_Est_Arrecadacao_Mes15.SpeedButton_Atualiza_MapaClick(Sender: TObject);
begin
   Calcular;
end;

end.
