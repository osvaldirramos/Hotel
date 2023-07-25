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
  Menus, ExtCtrls, Rotinas, Grids, DBGrids, Db, DBTables, ComCtrls,
  Buttons, ToolWin, StdCtrls, Mask, TeEngine, Series, TeeProcs, Chart,
  DBChart, DBCtrls, JvShape, JvToolEdit, ShellApi, ComObj, Variants,
  JvComponent, JvTransBtn;

type
  TForm_Reletorio_Movimento_Hospedagem = class(TForm)
    StatusBar: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton7: TToolButton;
    Label26: TLabel;
    JvDateEdit_Inicio: TJvDateEdit;
    ToolButton8: TToolButton;
    Label29: TLabel;
    JvDateEdit_DataTermino: TJvDateEdit;
    ToolButton6: TToolButton;
    ToolButton_Atividades: TToolButton;
    ToolButton14: TToolButton;
    ToolButton_Excel: TToolButton;
    ToolButton13: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton12: TToolButton;
    ToolButton_Windows: TToolButton;
    ToolButton11: TToolButton;
    Panel8: TPanel;
    JvShape2: TJvShape;
    DBNavigator_Atividades: TDBNavigator;
    Query_Atividades: TQuery;
    DSQ_Atividades: TDataSource;
    DBGrid_Ativ: TDBGrid;
    Panel1: TPanel;
    Label_Fonte_Pagadora: TLabel;
    ComboBox_Fonte_Pagadora: TComboBox;
    Label_NumeroGRU: TLabel;
    MaskEdit_NumeroGRU: TMaskEdit;
    Table_Historico: TTable;
    Table_HistoricoIDENTIDADE: TStringField;
    Table_HistoricoFICHA: TStringField;
    Table_HistoricoPREDIO: TStringField;
    Table_HistoricoAPTO: TFloatField;
    Table_HistoricoDATAENTRADA: TStringField;
    Table_HistoricoHORAENTRADA: TStringField;
    Table_HistoricoNRECIBO: TStringField;
    Table_HistoricoBANCO: TStringField;
    Table_HistoricoNCHEQUE: TStringField;
    Table_HistoricoPRACA: TStringField;
    Table_HistoricoVALORPAGO: TFloatField;
    Table_HistoricoUSUARIO_SAIDA: TStringField;
    Table_HistoricoTIPO_FECHAMENTO: TStringField;
    Table_HistoricoRECEBIDO: TStringField;
    Table_HistoricoOBS: TStringField;
    Table_HistoricoCUSTO_TELEFONE: TFloatField;
    Table_HistoricoSITUACAO_CURSO: TStringField;
    Table_HistoricoANO: TFloatField;
    Table_HistoricoHORA_OPERACAO: TStringField;
    Table_HistoricoDATA_OPERACAO: TDateTimeField;
    Table_HistoricoDATASAIDA: TStringField;
    Table_HistoricoDATAPAGAMENTO: TStringField;
    Table_HistoricoUSUARIO_ENTRADA: TStringField;
    Table_HistoricoADE: TStringField;
    Table_HistoricoHORASAIDA: TStringField;
    Table_HistoricoSARAM: TStringField;
    BitBtn_Registrar: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton_AtividadesClick(Sender: TObject);
    procedure ToolButton_ExcelClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ComboBox_Fonte_PagadoraChange(Sender: TObject);
    procedure BitBtn_RegistrarClick(Sender: TObject);

  private
    { Private declarations }
  public    { Public declarations }
  end;

var
  Form_Reletorio_Movimento_Hospedagem: TForm_Reletorio_Movimento_Hospedagem;

implementation

uses Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure principal
//------------------------------------------------------------------------------

procedure TForm_Reletorio_Movimento_Hospedagem.FormActivate(Sender: TObject);
begin
   Label_NumeroGRU.Visible:= False;
   MaskEdit_NumeroGRU.Visible:= False;
   MaskEdit_NumeroGRU.Text:= '';

   Table_Historico.Open;
   Query_Atividades.Close;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Reletorio_Movimento_Hospedagem.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

procedure TForm_Reletorio_Movimento_Hospedagem.ToolButton_RetornarClick( Sender: TObject);
begin
   Query_Atividades.Close;
   Close;
end;

procedure TForm_Reletorio_Movimento_Hospedagem.ToolButton_AtividadesClick(Sender: TObject);
var
   VS_Comando: String;
begin
   if JvDateEdit_Inicio.Text = '  /  /    ' then
   begin
      ShowMessage('A Data de início não pode ser branco...');
      JvDateEdit_Inicio.SetFocus;
   end
   else
   begin
      if JvDateEdit_DataTermino.Text = '  /  /    ' then
      begin
         ShowMessage('A Data de término não pode ser branco...');
         JvDateEdit_DataTermino.SetFocus;
      end
      else
      begin
         VS_Comando:= 'Select a.identidade,a.ficha, a.ano, a.datasaida, a.ficha, b.saram, b.Nome, a.ade, a.ValorPago '+
                      ' From Historico a, hospede b '+
                      ' where a.identidade = b.identidade '+
                      ' and   a.TIPO_FECHAMENTO = '+#39+'F'+#39+
                      ' and  (TO_DATE(a.dataentrada) >= '+#39+JvDateEdit_Inicio.Text+#39+
                      ' and   TO_DATE(a.dataentrada)  <= '+#39+JvDateEdit_DataTermino.Text+#39+')'+
                      ' order by a.datasaida';

         Query_Atividades.Close;
         Query_Atividades.Sql.Clear;
         Query_Atividades.Sql.Add( VS_Comando );
         Query_Atividades.Open;

      end;
   end;

end;

procedure TForm_Reletorio_Movimento_Hospedagem.ToolButton_ExcelClick(Sender: TObject);
var
   OpenDesktop, Calc, Sheets, Sheet, wProperties : Variant;
   Connect, OpenOffice : Variant;
   i : Integer; // Linha
   VF_Total_Consig, Total_GRU, Total_Grat, Total_Cortesia: Real;

begin
   if Query_Atividades.FieldByName('Ficha').AsString = '' then
      ShowMessage('Excel'+#13+#13+'Não ´criado o relatório...')
   else
   begin
      Screen.Cursor := crSQLWait;

      // Cria o link OLE com o OpenOffice
//      if VarIsEmpty(OpenOffice) then
         OpenOffice := CreateOleObject('com.sun.star.ServiceManager');
//      Connect := not (VarIsEmpty(OpenOffice) or VarIsNull(OpenOffice));

      // Inicia o Calc
      OpenDesktop := OpenOffice.CreateInstance('com.sun.star.frame.Desktop');
      wProperties := VarArrayCreate([0, - 1], varVariant);
      Calc := OpenDesktop.LoadComponentFromURL('private:factory/scalc', '_blank', 0, wProperties);
      sheets := Calc.Sheets;
      Sheet := Sheets.getByIndex(0);

      // Cria linha de cabeçalho
      i := 0;

      VF_Total_Consig := 0;
      Total_GRU := 0;
      Total_Grat := 0;
      Total_Cortesia := 0;

      // Preenchendo o Cabecalho do Curso
      Sheet.getCellByPosition(0,i).SetString('RELAÇÃO DE HOSPEDES ' );

      i:= i + 2;
      Sheet.getCellByPosition(0,i).SetString('De: '+JvDateEdit_Inicio.Text+' a '+JvDateEdit_DataTermino.Text);

      // Preenche o cabecalho

      i:= i + 1;
      Sheet.getCellByPosition(0,i).SetString('DATA SAÍDA');
      Sheet.getCellByPosition(1,i).SetString('FICHAS');
      Sheet.getCellByPosition(2,i).SetString('MATRÍCULA');
      Sheet.getCellByPosition(3,i).SetString('CONSIGNADO');
      Sheet.getCellByPosition(4,i).SetString('GRU');
      Sheet.getCellByPosition(5,i).SetString('GRAT REP');
      Sheet.getCellByPosition(6,i).SetString('CORTESIA');
      Sheet.getCellByPosition(7,i).SetString('GRN N');

      Query_Atividades.First;
      while not Query_Atividades.eof do
      begin
         if trim(Query_Atividades.FieldByName('ade').AsString) <> '' then
         begin
            i:= i+1;
            Sheet.getCellByPosition(0,i).SetString(copy(Query_Atividades.FieldByName('datasaida').AsString, 1, 2));
            Sheet.getCellByPosition(1,i).SetString(Query_Atividades.FieldByName('Ficha').AsString);
            Sheet.getCellByPosition(2,i).SetString(Query_Atividades.FieldByName('saram').AsString);

            if Query_Atividades.FieldByName('ade').AsString  = 'CONSIG' then
            begin
               Sheet.getCellByPosition(3,i).SetString('R$ '+FormatFloat('####0.00',Query_Atividades.FieldByName('ValorPago').AsFloat));
               VF_Total_Consig:= VF_Total_Consig+Query_Atividades.FieldByName('ValorPago').AsFloat;
            end
            else
            begin
               if Query_Atividades.FieldByName('ade').AsString  = 'GRAT REP' then
               begin
                  Sheet.getCellByPosition(5,i).SetString('R$ '+FormatFloat('####0.00',Query_Atividades.FieldByName('ValorPago').AsFloat));
                  Total_Grat :=  Total_Grat+Query_Atividades.FieldByName('ValorPago').AsFloat;
               end
               else
               begin
                  if Query_Atividades.FieldByName('ade').AsString  = 'CORTESIA' then
                  begin
                     Sheet.getCellByPosition(6,i).SetString('R$ '+FormatFloat('####0.00',Query_Atividades.FieldByName('ValorPago').AsFloat));
                     Total_Cortesia := Total_Cortesia+Query_Atividades.FieldByName('ValorPago').AsFloat;
                  end
                  else
                  begin
                     if copy(Query_Atividades.FieldByName('ade').AsString, 1, 3) = 'GRU' then
                     begin
                        Sheet.getCellByPosition(4,i).SetString('R$ '+FormatFloat('####0.00',Query_Atividades.FieldByName('ValorPago').AsFloat));
                        Sheet.getCellByPosition(7,i).SetString(copy(Query_Atividades.FieldByName('ade').AsString, 5, 3));
                        Total_GRU := Total_GRU+Query_Atividades.FieldByName('ValorPago').AsFloat;
                     end;
                  end;
               end;
            end;
         end;

         Query_Atividades.Next;
      end;

      i:= i+2;

      Sheet.getCellByPosition(3,i).SetString('R$ '+FormatFloat('####0.00',VF_Total_Consig));
      Sheet.getCellByPosition(5,i).SetString('R$ '+FormatFloat('####0.00',Total_Grat));
      Sheet.getCellByPosition(6,i).SetString('R$ '+FormatFloat('####0.00',Total_Cortesia));
      Sheet.getCellByPosition(4,i).SetString('R$ '+FormatFloat('####0.00',Total_GRU));
   end;
   Screen.Cursor := crDefault;
end;


procedure TForm_Reletorio_Movimento_Hospedagem.ComboBox_Fonte_PagadoraChange(
  Sender: TObject);
begin
   if ComboBox_Fonte_Pagadora.Text = 'GRU' then
   begin
      Label_NumeroGRU.Visible:= True;
      MaskEdit_NumeroGRU.Visible:= True;
   end
   else
   begin
      Label_NumeroGRU.Visible:= False;
      MaskEdit_NumeroGRU.Visible:= False;
      MaskEdit_NumeroGRU.Text:= '';
   end;

end;

procedure TForm_Reletorio_Movimento_Hospedagem.BitBtn_RegistrarClick( Sender: TObject);
begin
   Table_Historico.Edit;
   Table_Historico.FieldByName('Ade').AsString:= trim(ComboBox_Fonte_Pagadora.Text+' '+MaskEdit_NumeroGRU.Text );
   Table_Historico.Post;

   Query_Atividades.Close;
   Query_Atividades.Open;

end;


end.
