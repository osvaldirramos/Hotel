//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Est_Arrecadacao_Mes.PAS                        //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de montar a estatis-//
//                             ca por mes.                                    //
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

unit Est_Arrecadacao_Mes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, Rotinas, Grids, DBGrids, Db, ComCtrls,
  Buttons, ToolWin, StdCtrls, Mask, TeEngine, Series, TeeProcs, Chart,
  DBChart, DBCtrls, IBCustomDataSet, IBQuery, IBTable;

type
  TForm_Est_Arrecadacao_Mes = class(TForm)
    StatusBar: TStatusBar;
    DSQ_Historico: TDataSource;
    IBQuery_Historico: TIBQuery;
    IBQuery_HistoricoIDENTIDADE: TIBStringField;
    IBQuery_HistoricoFICHA: TIBStringField;
    IBQuery_HistoricoANO: TSmallintField;
    IBQuery_HistoricoVALORPAGO: TIBBCDField;
    IBQuery_Estatistica: TIBQuery;
    IBQuery_EstatisticaCODIGO: TSmallintField;
    IBQuery_EstatisticaSITUACAO: TIBStringField;
    IBQuery_EstatisticaVALOR: TIBBCDField;
    IBTable_Estatistica: TIBTable;
    IBTable_EstatisticaCODIGO: TSmallintField;
    IBTable_EstatisticaSITUACAO: TIBStringField;
    IBTable_EstatisticaVALOR: TIBBCDField;
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
    DBChart1: TDBChart;
    Series1: TBarSeries;
    IBQuery_HistoricoDATAPAGAMENTO: TDateTimeField;
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
  Form_Est_Arrecadacao_Mes: TForm_Est_Arrecadacao_Mes;

implementation

uses Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure principal
//------------------------------------------------------------------------------

procedure TForm_Est_Arrecadacao_Mes.FormActivate(Sender: TObject);
begin
   ComboBox_Ano.Text:= Funcoes.AnoAtual;
   IBQuery_Historico.Open;
   IBTable_Estatistica.Open;
   Calcular;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Est_Arrecadacao_Mes.ToolButton_RetornarClick(Sender: TObject);
begin
   IBQuery_Historico.Close;
   IBTable_Estatistica.Close;
   Close;
end;

procedure TForm_Est_Arrecadacao_Mes.Calcular;
var
   VS_Comando: String;
   VI_Retorno: Integer;
   Jan, Fev, Mar, Abr, Mai, Jun, Jul, Ago, Sete, Outu, Nov, Dez: Real;
begin
   VS_Comando:= 'Select * from Historico where Ano = '+ComboBox_Ano.Text+' and DataPagamento <> +'#39+' '+#39+' order by dataPagamento';
   IBQuery_Historico.Close;
   IBQuery_Historico.Sql.Clear;
   IBQuery_Historico.Sql.Add(VS_Comando);
   IBQuery_Historico.Open;

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

   IBQuery_Historico.First;
   While not IBQuery_Historico.Eof do
   begin
      VI_Retorno:= Funcoes.Extrai_Mes(IBQuery_Historico.FieldByName('DataPagamento').AsString);

      case VI_Retorno of
         1: Jan:= Jan+ IBQuery_Historico.FieldByName('ValorPago').AsFloat;
         2: Fev:= Fev+ IBQuery_Historico.FieldByName('ValorPago').AsFloat;
         3: Mar:= Mar+ IBQuery_Historico.FieldByName('ValorPago').AsFloat;
         4: Abr:= Abr+ IBQuery_Historico.FieldByName('ValorPago').AsFloat;
         5: Mai:= Mai+ IBQuery_Historico.FieldByName('ValorPago').AsFloat;
         6: Jun:= Jun+ IBQuery_Historico.FieldByName('ValorPago').AsFloat;
         7: Jul:= Jul+ IBQuery_Historico.FieldByName('ValorPago').AsFloat;
         8: Ago:= Ago+ IBQuery_Historico.FieldByName('ValorPago').AsFloat;
         9: Sete:= Sete+ IBQuery_Historico.FieldByName('ValorPago').AsFloat;
         10: Outu:= Outu+ IBQuery_Historico.FieldByName('ValorPago').AsFloat;
         11: Nov:= Nov+ IBQuery_Historico.FieldByName('ValorPago').AsFloat;
         12: Dez:= Dez+ IBQuery_Historico.FieldByName('ValorPago').AsFloat;
      end;
      IBQuery_Historico.Next;
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

   Funcoes.ExecSql_Servidor('Delete from Estatistica');
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
   IBQuery_Estatistica.Close;
   IBQuery_Estatistica.Open;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Est_Arrecadacao_Mes.Grava(Cod: integer; Desc: String; Valor: Real);
begin
   IBTable_Estatistica.Append;
   IBTable_Estatistica.FieldByName('CODIGO').AsInteger:= Cod;
   IBTable_Estatistica.FieldByName('SITUACAO').AsString:= Desc;
   IBTable_Estatistica.FieldByName('VALOR').AsFloat:= Valor;
   IBTable_Estatistica.Post;
   DM.IBTransaction_Hotel.CommitRetaining;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Est_Arrecadacao_Mes.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

procedure TForm_Est_Arrecadacao_Mes.SpeedButton_Atualiza_MapaClick(
  Sender: TObject);
begin
   Calcular;
end;

end.
