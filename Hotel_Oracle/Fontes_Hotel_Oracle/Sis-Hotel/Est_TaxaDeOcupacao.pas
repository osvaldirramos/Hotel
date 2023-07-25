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

unit Est_TaxaDeOcupacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, Rotinas, Grids, DBGrids, Db, DBTables, ComCtrls,
  Buttons, ToolWin, StdCtrls, Mask, TeEngine, Series, TeeProcs, Chart,
  DBChart, DBCtrls, JvGradient;

type
  TForm_Est_TaxaDeOcupacao = class(TForm)
    StatusBar: TStatusBar;
    Panel2: TPanel;
    Query_Historico: TQuery;
    DSQ_Historico: TDataSource;
    ToolBar2: TToolBar;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
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
    GroupBox7: TGroupBox;
    Label_Jun: TLabel;
    GroupBox8: TGroupBox;
    Label_Jul: TLabel;
    GroupBox9: TGroupBox;
    Label_Ago: TLabel;
    GroupBox10: TGroupBox;
    Label_Set: TLabel;
    GroupBox11: TGroupBox;
    Label_Nov: TLabel;
    GroupBox12: TGroupBox;
    Label_Out: TLabel;
    GroupBox13: TGroupBox;
    Label_Dez: TLabel;
    GroupBox15: TGroupBox;
    Label_ValorTotal: TLabel;
    Query_Estatistica: TQuery;
    Query_EstatisticaCODIGO: TFloatField;
    Query_EstatisticaSITUACAO: TStringField;
    Query_EstatisticaVALOR: TFloatField;
    Table_Estatistica: TTable;
    Table_EstatisticaCODIGO: TFloatField;
    Table_EstatisticaSITUACAO: TStringField;
    Table_EstatisticaVALOR: TFloatField;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    GroupBox6: TGroupBox;
    ComboBox_Predio: TComboBox;
    GroupBox14: TGroupBox;
    SpeedButton1: TSpeedButton;
    ComboBox_Ano: TComboBox;
    ToolButton3: TToolButton;
    procedure FormActivate(Sender: TObject);
    procedure Grava(Cod: integer; Desc: String; Valor: Real);
    procedure SpeedButton_Atualiza_MapaClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);

  private
    { Private declarations }
  public    { Public declarations }
  end;

var
  Form_Est_TaxaDeOcupacao: TForm_Est_TaxaDeOcupacao;

implementation

uses Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure principal
//------------------------------------------------------------------------------

procedure TForm_Est_TaxaDeOcupacao.FormActivate(Sender: TObject);
begin
   ComboBox_Ano.Text:= Funcoes.AnoAtual;
   Query_Historico.Open;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Est_TaxaDeOcupacao.ToolButton_RetornarClick(Sender: TObject);
begin
   Query_Historico.Close;
   Table_Estatistica.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento do botao de execucao da atualizacão das informacoes
//------------------------------------------------------------------------------

procedure TForm_Est_TaxaDeOcupacao.SpeedButton_Atualiza_MapaClick(Sender: TObject);
var
   Ano, Mes, Dia : word;
   VS_Comando: String;
   Jan, Fev, Mar, Abr, Mai, Jun, Jul, Ago, Sete, Outu, Nov, Dez: Real;
begin
   if ComboBox_Ano.Text = '' then
   begin
      ShowMessage('Para realizar consulta é preciso fornecer o ano...');
      ComboBox_Ano.SetFocus;
   end
   else
   begin
      if ComboBox_Predio.Text = '' then
         VS_Comando:= 'Select Identidade, DataEntrada, ano from historico where ano = '+ComboBox_Ano.Text
      else
         VS_Comando:= 'Select Identidade, DataEntrada, ano from historico where ano = '+ComboBox_Ano.Text+' and Predio  = '+#39+ComboBox_Predio.Text+#39;

      Query_Historico.Close;
      Query_Historico.Sql.Clear;
      Query_Historico.Sql.Add(VS_Comando);
      Query_Historico.Open;

      Jan:= 0;
      Fev:= 0;
      Mar:= 0;
      Abr:= 0;
      Mai:= 0;
      Jun:= 0;
      Jul:= 0;
      Ago:= 0;
      Sete:= 0;
      Outu:= 0;
      Nov:= 0;
      Dez:= 0;

      Query_Historico.First;
      While not Query_Historico.Eof do
      begin
         if Query_Historico.FieldByName('DataEntrada').AsString <> '' then
         begin
            DecodeDate (StrToDate(Query_Historico.FieldByName('DataEntrada').AsString), Ano, Mes, Dia);
            if IntToStr(Ano) = ComboBox_Ano.Text then
            begin
               case Mes of
                  1: Jan:= Jan+ 1;
                  2: Fev:= Fev+ 1;
                  3: Mar:= Mar+ 1;
                  4: Abr:= Abr+ 1;
                  5: Mai:= Mai+ 1;
                  6: Jun:= Jun+ 1;
                  7: Jul:= Jul+ 1;
                  8: Ago:= Ago+ 1;
                  9: Sete:= Sete+ 1;
                  10: Outu:= Outu+ 1;
                  11: Nov:= Nov+ 1;
                  12: Dez:= Dez+ 1;
               end;
            end;
            Query_Historico.Next;
         end;
      end;
      Label_Jan.Caption:= FormatFloat('####0',Jan);
      Label_Fev.Caption:= FormatFloat('####0',Fev);
      Label_Mar.Caption:= FormatFloat('####0',Mar);
      Label_Abr.Caption:= FormatFloat('####0',Abr);
      Label_Mai.Caption:= FormatFloat('####0',Mai);
      Label_Jun.Caption:= FormatFloat('####0',Jun);
      Label_Jul.Caption:= FormatFloat('####0',Jul);
      Label_Ago.Caption:= FormatFloat('####0',Ago);
      Label_Set.Caption:= FormatFloat('####0',Sete);
      Label_Out.Caption:= FormatFloat('####0',Outu);
      Label_Nov.Caption:= FormatFloat('####0',Nov);
      Label_Dez.Caption:= FormatFloat('####0',Dez);
      Label_ValorTotal.Caption:= FormatFloat('####0',Jan+Fev+Mar+Abr+Mai+jun+Jul+Ago+Sete+Outu+Nov+Dez);

      Table_Estatistica.Open;
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
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Est_TaxaDeOcupacao.Grava(Cod: integer; Desc: String; Valor: Real);
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

procedure TForm_Est_TaxaDeOcupacao.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

end.
