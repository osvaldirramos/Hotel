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

unit RelacaoExcel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Rotinas,
  Buttons, ToolWin, ComCtrls, Db, DBTables, Grids, DBGrids, StdCtrls, Mask, ComObj,
  ExtCtrls, Menus, JvToolEdit;

type
  TForm_RelacaoExcel = class(TForm)
    Query_Historico: TQuery;
    StatusBar: TStatusBar;
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
    ToolBar2: TToolBar;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    ToolButton_RelacaoExcel: TToolButton;
    Table_Hospede_Historico: TTable;
    DSQ_Hostorico: TDataSource;
    DBGrid_Turma: TDBGrid;
    ToolBar_PesquisarTurmaAndamento: TToolBar;
    ToolButton5: TToolButton;
    Label_Inicio: TLabel;
    JvDateEdit_Inicio: TJvDateEdit;
    ToolButton4: TToolButton;
    Label_Final: TLabel;
    JvDateEdit_DataTermino: TJvDateEdit;

    procedure FormActivate(Sender: TObject);

    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton_RelacaoExcelClick(Sender: TObject);

  private
    { Private declarations }
  public    { Public declarations }
  VR_Cheque, VR_Dinheiro: Real;
  end;

var
  Form_RelacaoExcel: TForm_RelacaoExcel;

implementation

uses Relatorio_Movimento_Entrada, Relatorio_Movimento_Saida, Rel_Calculos,
  Exclui_Ficha;

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure principal.
//------------------------------------------------------------------------------

procedure TForm_RelacaoExcel.FormActivate(Sender: TObject);
begin
   if Funcoes.GetRelatorio = 0 then
   begin
      Funcoes.SetRelatorio(1);
      Query_Historico.Open;
      JvDateEdit_Inicio.Date:= Date;
      JvDateEdit_DataTermino.Date:= Date;
   end;
end;

//------------------------------------------------------------------------------
// Procedure para retornar para o Menu Principal
//------------------------------------------------------------------------------

procedure TForm_RelacaoExcel.ToolButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_RelacaoExcel.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Procedure para chamar o relatorio
//------------------------------------------------------------------------------


procedure TForm_RelacaoExcel.ToolButton_RelacaoExcelClick(Sender: TObject);
var
   objExcel,Sheet: Variant;
   VS_Comando, cTitulo : string;
   i : integer;
begin
   Table_Hospede_Historico.Open;

   VS_Comando:= 'Select * from historico where ano = '+Funcoes.AnoAtual+' and  '+
                ' (DataSaida >= To_date('+#39+JvDateEdit_Inicio.Text+#39+', '+#39+'DD/MM/YYYY'+#39+') and '+
                ' DataSaida <= To_date('+#39+JvDateEdit_DataTermino.Text+#39+', '+#39+'DD/MM/YYYY'+#39+'))'+
                ' order by DataSaida';
   Query_Historico.Close;
   Query_Historico.Sql.Clear;
   Query_Historico.Sql.Add(VS_Comando);
   Query_Historico.Open;


   // Cria uma instancia para utilizar o Excel

   cTitulo := 'Relação de Saídas';
   objExcel := CreateOleObject('Excel.Application');
   objExcel.Visible := True;
   objExcel.Caption := cTitulo;

   // Adiciona planilha(sheet)
   objExcel.Workbooks.Add;
   objExcel.Workbooks[1].Sheets.Add;
   objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;
   Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

   // Preenchendo as Colunas
   Sheet.Range['A1'] := 'PRÉDIO';
   Sheet.Range['B1'] := 'APTO';
   Sheet.Range['C1'] := 'Nº FICHA';
   Sheet.Range['D1'] := 'NOME';
   Sheet.Range['E1'] := 'ENTRADA';
   Sheet.Range['F1'] := 'SAIDA';

   // por aqui tu limparias a planilha

   i:= 2;
   Query_Historico.First;
   while not Query_Historico.eof do
   begin
       Sheet.Cells[i,1] := Query_Historico.FieldByName('Predio').AsString;
       Sheet.Cells[i,2] := Query_Historico.FieldByName('Apto').AsString;
       Sheet.Cells[i,3] := Query_Historico.FieldByName('ficha').AsString;
       Sheet.Cells[i,4] := Table_Hospede_Historico.FieldByName('nome').AsString;
       Sheet.Cells[i,5] := Query_Historico.FieldByName('dataEntrada').AsString;
       Sheet.Cells[i,6] := Query_Historico.FieldByName('DataSaida').AsString;
       i:= i+1;
       Query_Historico.Next;
   end;
end;

end.


