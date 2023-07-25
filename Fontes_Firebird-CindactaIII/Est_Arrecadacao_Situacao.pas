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

unit Est_Arrecadacao_Situacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, Rotinas, Grids, DBGrids, Db, ComCtrls,
  Buttons, ToolWin, StdCtrls, Mask, TeEngine, Series, TeeProcs, Chart,
  DBChart, DBCtrls, IBCustomDataSet, IBQuery, IBTable;

type
  TForm_Est_Arrecadacao_Situacao = class(TForm)
    DST_Estatistica: TDataSource;
    DSQ_Historico: TDataSource;
    IBQuery_Historico: TIBQuery;
    IBTable_Estatistica: TIBTable;
    IBTable_EstatisticaCODIGO: TSmallintField;
    IBTable_EstatisticaSITUACAO: TIBStringField;
    IBTable_EstatisticaVALOR: TIBBCDField;
    IBQuery_Estatistica: TIBQuery;
    IBQuery_EstatisticaCODIGO: TSmallintField;
    IBQuery_EstatisticaSITUACAO: TIBStringField;
    IBQuery_EstatisticaVALOR: TIBBCDField;
    ToolBar2: TToolBar;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    ToolButton_Ajuda: TToolButton;
    Panel2: TPanel;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    Label_Curso: TLabel;
    GroupBox2: TGroupBox;
    Label_Transito: TLabel;
    GroupBox3: TGroupBox;
    Label_Residente: TLabel;
    GroupBox4: TGroupBox;
    Label_Outros: TLabel;
    GroupBox14: TGroupBox;
    Label_ValorTotal: TLabel;
    GroupBox6: TGroupBox;
    SpeedButton_Atualiza_Mapa: TSpeedButton;
    ComboBox_Ano: TComboBox;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    StatusBar1: TStatusBar;
    IBTable_Curso: TIBTable;
    IBTable_CursoCURSO: TIBStringField;
    IBQuery_HistoricoVALORPAGO: TIBBCDField;
    IBQuery_HistoricoIDENTIDADE: TIBStringField;
    IBQuery_HistoricoSITUACAO_CURSO: TIBStringField;
    IBQuery_HistoricoFICHA: TIBStringField;
    IBQuery_HistoricoDATAPAGAMENTO: TDateTimeField;
    procedure FormActivate(Sender: TObject);
    procedure Calcular;
    procedure Grava(Cod: integer; Desc: String; Valor: Real);
    procedure SpeedButton_FiltrarMesClick(Sender: TObject);
    procedure SpeedButton_Atualiza_MapaClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);

  private
    { Private declarations }
  public    { Public declarations }
  end;

var
  Form_Est_Arrecadacao_Situacao: TForm_Est_Arrecadacao_Situacao;

implementation

uses Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure principal
//------------------------------------------------------------------------------

procedure TForm_Est_Arrecadacao_Situacao.FormActivate(Sender: TObject);
begin
   ComboBox_Ano.Text:= Funcoes.AnoAtual;
   IBQuery_Historico.Open;
   IBTable_Estatistica.Open;
   IBTable_Curso.Open;
   Calcular;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Est_Arrecadacao_Situacao.ToolButton_RetornarClick(Sender: TObject);
begin
   IBQuery_Historico.Close;
   IBTable_Estatistica.Close;
   IBTable_Curso.Open;
   Close;
end;

procedure TForm_Est_Arrecadacao_Situacao.Calcular;
var
   VS_Comando: String;
   Curso, Transito, Residente, outros: Real;
begin
   VS_Comando:= 'Select DataPagamento, ValorPago, Identidade,SITUACAO_CURSO, Ficha from Historico where Ano = '+ComboBox_Ano.Text+' and DataPagamento <> +'#39+' '+#39+' order by dataPagamento';
   IBQuery_Historico.Close;
   IBQuery_Historico.Sql.Clear;
   IBQuery_Historico.Sql.Add(VS_Comando);
   IBQuery_Historico.Open;

   Curso:= 0;
   Transito:= 0;
   Residente:= 0;
   outros:= 0;

   IBQuery_Historico.First;
   While not IBQuery_Historico.Eof do
   begin
     if Trim(IBQuery_Historico.FieldByName('SITUACAO_CURSO').AsString) = 'TRANSITO' then
        Transito:= Transito+IBQuery_Historico.FieldByName('ValorPago').AsFloat
     else
     begin
        if Trim(IBQuery_Historico.FieldByName('SITUACAO_CURSO').AsString) = 'RESIDENTE' then
        begin
           Residente:= Residente+IBQuery_Historico.FieldByName('ValorPago').AsFloat;
        end
        else
        begin
           if IBtable_Curso.RecordCount = 1 then
              Curso:= Curso+IBQuery_Historico.FieldByName('ValorPago').AsFloat
           else
              Outros:= Outros+IBQuery_Historico.FieldByName('ValorPago').AsFloat;
        end;
     end;
     IBQuery_Historico.Next;
   end;

   Label_Curso.Caption:= FormatFloat('#####0.00',Curso);
   Label_Transito.Caption:= FormatFloat('#####0.00',Transito);
   Label_Residente.Caption:= FormatFloat('#####0.00',Residente);
   Label_Outros.Caption:= FormatFloat('#####0.00',Outros);
   Label_ValorTotal.Caption:= FormatFloat('#####0.00',Curso+Transito+Residente+Outros);

   Funcoes.ExecSql_Servidor('Delete from Estatistica');
   Grava(1, 'Curso', Curso);
   Grava(2, 'Transito', Transito);
   Grava(3, 'Residente', Residente);
   Grava(4, 'Outros', Outros);
   IBQuery_Estatistica.Close;
   IBQuery_Estatistica.Open;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Est_Arrecadacao_Situacao.Grava(Cod: integer; Desc: String; Valor: Real);
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

procedure TForm_Est_Arrecadacao_Situacao.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

procedure TForm_Est_Arrecadacao_Situacao.SpeedButton_FiltrarMesClick(Sender: TObject);
begin
   Calcular;
end;

procedure TForm_Est_Arrecadacao_Situacao.SpeedButton_Atualiza_MapaClick(Sender: TObject);
begin
   Calcular;
end;

end.
