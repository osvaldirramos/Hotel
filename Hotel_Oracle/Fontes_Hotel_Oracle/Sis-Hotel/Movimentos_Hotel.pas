//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Historico.PAS                                  //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de montar o histo-  //
//                             rico de hospedagem.                            //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 17/03/2003                                     //
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

unit Movimentos_Hotel;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, ShellApi,
  Menus, DB, DBTables, ComCtrls, ToolWin, StdCtrls, Mask, DBCtrls, ComObj, Variants,
  ExtCtrls, JvEdit, Buttons, Grids, DBGrids, Forms, Rotinas, Dialogs, DateUtils,
  JvToolEdit, JvComponent, JvCaptionPanel, JvShape,
  JvGradient, JvGrdCpt, DBClient, StrUtils, TeEngine, Series, TeeProcs,
  Chart, DbChart;




type
  TForm_Movimentos_Hotel = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton7: TToolButton;
    Label26: TLabel;
    JvDateEdit_Inicio: TJvDateEdit;
    ToolButton8: TToolButton;
    Label29: TLabel;
    JvDateEdit_DataTermino: TJvDateEdit;
    ToolButton6: TToolButton;
    ToolButton14: TToolButton;
    ToolButton_Excel: TToolButton;
    ToolButton13: TToolButton;
    ToolButton9: TToolButton;
    ToolButton12: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    Panel8: TPanel;
    JvShape2: TJvShape;
    DBNavigator_Atividades: TDBNavigator;
    Panel3: TPanel;
    Panel4: TPanel;
    Label_Oficiais_Generais: TLabel;
    Label_Oficiais_Superiores: TLabel;
    Label_Oficiais_Intermediarios: TLabel;
    Label_Oficiais_Subalternos_Aspirantes: TLabel;
    Label_SO_SGT: TLabel;
    Label_CB_SD_TF: TLabel;
    Label_Civil: TLabel;
    Label_Valor_Oficiais_Generais: TLabel;
    Label_Valor_Oficiais_Superiores: TLabel;
    Label_Valor_Oficiais_Intermediarios: TLabel;
    Label_Valor_Oficiais_Subalternos_Aspirantes: TLabel;
    Label_Valor_SO_SGT: TLabel;
    Label_Valor_CB_SD_TF: TLabel;
    Label_Valor_Civil: TLabel;
    Label_Arrecadacao: TLabel;
    Label_D_Valor_Civil: TLabel;
    Label_D_Valor_CB_SD_TF: TLabel;
    Label_D_Valor_SO_SGT: TLabel;
    Label_D_Valor_Oficiais_Subalternos_Aspirantes: TLabel;
    Label_D_Valor_Oficiais_Intermediarios: TLabel;
    Label_D_Valor_Oficiais_Superiores: TLabel;
    Label_D_Valor_Oficiais_Generais: TLabel;
    Label_Diarias: TLabel;
    Label38: TLabel;
    Label_Total_Hospede: TLabel;
    DSQ_Atividades: TDataSource;
    DBGrid_Ativ: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Labe_Total_Reg: TLabel;
    Labe_Total_Hosp: TLabel;
    Labe_Total_Fech: TLabel;
    Labe_Total_Canc: TLabel;
    Query_Executa: TQuery;
    Label_Total_Diarias: TLabel;
    ClientDataSet_Hospede: TClientDataSet;
    ClientDataSet_HospedeNome: TStringField;
    ClientDataSet_HospedePosto: TStringField;
    ClientDataSet_HospedeEntrada: TStringField;
    ClientDataSet_HospedeSaida: TStringField;
    ClientDataSet_HospedeDiarias: TIntegerField;
    ClientDataSet_HospedeSituacao: TStringField;
    ClientDataSet_HospedeClassificacao: TIntegerField;
    ToolButton1: TToolButton;
    Label21: TLabel;
    Label_Valor_Outros: TLabel;
    Label_D_Valor_Outros: TLabel;
    Memo_Ativ: TMemo;
    ToolButton_Visualicaoa: TToolButton;
    ToolButton3: TToolButton;
    Panel5: TPanel;
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
    GroupBox14: TGroupBox;
    Label_ValorTotal: TLabel;
    Query_Historico: TQuery;
    Query_HistoricoDATAPAGAMENTO: TStringField;
    Query_HistoricoDATA_OPERACAO: TDateTimeField;
    Query_HistoricoVALORPAGO: TFloatField;
    Query_HistoricoIDENTIDADE: TStringField;
    Query_HistoricoFICHA: TStringField;
    Query_HistoricoANO: TFloatField;
    DataSource2: TDataSource;
    Table_Estatistica: TTable;
    Table_EstatisticaCODIGO: TFloatField;
    Table_EstatisticaSITUACAO: TStringField;
    Table_EstatisticaVALOR: TFloatField;
    Query_Estatistica: TQuery;
    Query_EstatisticaCODIGO: TFloatField;
    Query_EstatisticaSITUACAO: TStringField;
    Query_EstatisticaVALOR: TFloatField;
    Query_PagParcelado: TQuery;
    Query_PagParceladoIDENTIDADE: TStringField;
    Query_PagParceladoFICHA: TStringField;
    Query_PagParceladoANO: TFloatField;
    Query_PagParceladoDATAPAGAMENTO: TStringField;
    Query_PagParceladoVALOR: TFloatField;
    Query_PagParceladoNRECIBO: TStringField;
    DSQ_PagParcelado: TDataSource;
    GroupBox13: TGroupBox;
    SpeedButton_Atualiza_Mapa: TSpeedButton;
    ComboBox_Ano: TComboBox;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    Query_Atividades: TQuery;
    DataSource1: TDataSource;
    Label5: TLabel;

//    procedure VerificaHospedagem;

    procedure FormCreate(Sender: TObject);

    procedure Calcular;
    procedure Grava(Cod: integer; Desc: String; Valor: Real);
    
    procedure JvDateEdit_InicioExit(Sender: TObject);
    procedure JvDateEdit_DataTerminoExit(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton_ExcelClick(Sender: TObject);
    procedure DBGrid_AtivDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton_VisualicaoaClick(Sender: TObject);
    procedure SpeedButton_Atualiza_MapaClick(Sender: TObject);

  private    { private declarations }
   VS_Comando_Where: string;

{   VS_Posto, VS_Comando, VS_TipoFechamento: String;
   Oficiais_Generais, Oficiais_Superiores, Oficiais_Intermediarios, Oficiais_Subalternos_Aspirantes, SO_SGT, CB_SD_TF, Civil: Integer;
   D_Oficiais_Generais, D_Oficiais_Superiores, D_Oficiais_Intermediarios, D_Oficiais_Subalternos_Aspirantes, D_SO_SGT, D_CB_SD_TF, D_Civil: real;
   Tempo, TempoCompleto: integer;
   Total_Registros, Total_Hospedes, Total_Fechamentos, Total_Cancelamentos: Integer;
   Data_Entrada, Data_Saida: TDateTime;
   ValorDiarias, ValorDiaria, ValorMes, TotalMes: Real;
}
  public    { public declarations }
     VS_Ano_Old, VS_Ficha_old, VS_OrderBy: String;

  end;

var
  Form_Movimentos_Hotel: TForm_Movimentos_Hotel;

implementation

uses Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure principal
//------------------------------------------------------------------------------

procedure TForm_Movimentos_Hotel.FormCreate(Sender: TObject);
var
   Status: Boolean;
   VS_Comando: String;
   Valor: Real;
begin
   if Funcoes.GetPrivilegio = 'G' then
      Status:= True
   else
      Status:= False;

   ComboBox_Ano.Text:= Funcoes.AnoAtual;
   Query_Historico.Open;
   Table_Estatistica.Open;

   Label_Jan.Caption:= '0.00';
   Label_Fev.Caption:= '0.00';
   Label_Mar.Caption:= '0.00';
   Label_Abr.Caption:= '0.00';
   Label_Mai.Caption:= '0.00';
   Label_Jun.Caption:= '0.00';
   Label_Jul.Caption:= '0.00';
   Label_Ago.Caption:= '0.00';
   Label_Set.Caption:= '0.00';
   Label_Out.Caption:= '0.00';
   Label_Nov.Caption:= '0.00';
   Label_Dez.Caption:= '0.00';

   Calcular;

   Memo_Ativ.Visible:= False;
   Valor:= 0;

{   VS_Comando:= 'select EXTRACT(MONTH FROM TO_DATE(a.datapagamento)) as mes, sum(a.ValorPago) as "VALOR"'+
                ' From Historico a, hospede b'+
                ' where a.identidade = b.identidade'+
                ' and a.ano = '+#39+Funcoes.AnoAtual+#39+
                ' and a.datapagamento is not null '+
                ' group by EXTRACT(MONTH FROM TO_DATE(a.datapagamento))'+
                ' order by EXTRACT(MONTH FROM TO_DATE(a.datapagamento)) ';

         Query_Executa.Close;
         Query_Executa.Sql.Clear;
         Query_Executa.Sql.Add(VS_Comando);
         Query_Executa.Open;

         Query_Executa.First;
         While not Query_Executa.Eof do
         begin
            if Query_Executa.FieldByName('Valor').AsInteger = 1 then
                Label_Jan.Caption:=  FormatFloat('######0.00', Query_Executa.FieldByName('Valor').AsFloat)
            else
               if Query_Executa.FieldByName('Valor').AsInteger = 2 then
                   Label_Fev.Caption:=  FormatFloat('######0.00', Query_Executa.FieldByName('Valor').AsFloat)
               else
                  if Query_Executa.FieldByName('Valor').AsInteger = 3 then
                      Label_Mar.Caption:=  FormatFloat('######0.00', Query_Executa.FieldByName('Valor').AsFloat)
                  else
                     if Query_Executa.FieldByName('Valor').AsInteger = 4 then
                         Label_Abr.Caption:=  FormatFloat('######0.00', Query_Executa.FieldByName('Valor').AsFloat)
                     else
                        if Query_Executa.FieldByName('Valor').AsInteger = 5 then
                            Label_Mai.Caption:=  FormatFloat('######0.00', Query_Executa.FieldByName('Valor').AsFloat)
                        else
                           if Query_Executa.FieldByName('Valor').AsInteger = 6 then
                               Label_Jun.Caption:=  FormatFloat('######0.00', Query_Executa.FieldByName('Valor').AsFloat)
                           else
                              if Query_Executa.FieldByName('Valor').AsInteger = 7 then
                                  Label_Jul.Caption:=  FormatFloat('######0.00', Query_Executa.FieldByName('Valor').AsFloat)
                              else
                                 if Query_Executa.FieldByName('Valor').AsInteger = 8 then
                                     Label_Ago.Caption:=  FormatFloat('######0.00', Query_Executa.FieldByName('Valor').AsFloat)
                                 else
                                    if Query_Executa.FieldByName('Valor').AsInteger = 9 then
                                        Label_Set.Caption:=  FormatFloat('######0.00', Query_Executa.FieldByName('Valor').AsFloat)
                                    else
                                       if Query_Executa.FieldByName('Valor').AsInteger = 10 then
                                           Label_Out.Caption:=  FormatFloat('######0.00', Query_Executa.FieldByName('Valor').AsFloat)
                                       else
                                          if Query_Executa.FieldByName('Valor').AsInteger = 11 then
                                              Label_Nov.Caption:=  FormatFloat('######0.00', Query_Executa.FieldByName('Valor').AsFloat)
                                          else
                                             if Query_Executa.FieldByName('Valor').AsInteger = 12 then
                                                 Label_Dez.Caption:=  FormatFloat('######0.00', Query_Executa.FieldByName('Valor').AsFloat);


            Valor:= Valor+Query_Executa.FieldByName('Valor').AsFloat;
            Query_Executa.Next;
         end;
         Label_Arrecada.Caption:= FormatFloat('######0.00', Valor);
}

end;


//------------------------------------------------------------------------------
// Procedure para retornar para o menu principal
//------------------------------------------------------------------------------

procedure TForm_Movimentos_Hotel.ToolButton9Click(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Movimentos_Hotel.ToolButton10Click(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento do botao para mostrar a estatistica
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// Tratamento da data inicial da verificacao
//------------------------------------------------------------------------------

procedure TForm_Movimentos_Hotel.JvDateEdit_InicioExit(Sender: TObject);
begin
   if JvDateEdit_DataTermino.Text = '  /  /    ' then
       JvDateEdit_DataTermino.Date:= JvDateEdit_Inicio.Date;
end;

//------------------------------------------------------------------------------
// Tratamento da data de termino da verificacao
//------------------------------------------------------------------------------

procedure TForm_Movimentos_Hotel.JvDateEdit_DataTerminoExit(Sender: TObject);
begin
   if JvDateEdit_Inicio.Text = '  /  /    ' then
       JvDateEdit_Inicio.Date:= JvDateEdit_DataTermino.Date;
end;


procedure TForm_Movimentos_Hotel.ToolButton_ExcelClick(Sender: TObject);
var
   OpenDesktop, Calc, Sheets, Sheet, wProperties : Variant;
   Connect, OpenOffice : Variant;
   i : Integer; // Linha
begin
//   if IBQuery_PTS_base_Semana.RecordCount = 0 then
//      ShowMessage('Excel'+#13+#13+'O Curso selecionada não possuí PTS Base Cadastrado...')
//   else
//   begin
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

      // Preenchendo o Cabecalho do Curso
      Sheet.getCellByPosition(0,i).SetString('RELAÇÃO DE HOSPEDES ' );

      i:= i + 2;
      Sheet.getCellByPosition(0,i).SetString('De: '+JvDateEdit_Inicio.Text+' a '+JvDateEdit_DataTermino.Text);

      // Preenche o cabecalho

      i:= i + 1;
      Sheet.getCellByPosition(0,i).SetString('NOME');
      Sheet.getCellByPosition(1,i).SetString('POSTO');
      Sheet.getCellByPosition(2,i).SetString('DATA ENTRADA');
      Sheet.getCellByPosition(3,i).SetString('DATA SAÍDA');
      Sheet.getCellByPosition(5,i).SetString('DIÁRIA');
      Sheet.getCellByPosition(6,i).SetString('SITUAÇÃO');

      ClientDataSet_Hospede.First;
      while not ClientDataSet_Hospede.eof do
      begin

         i:= i+1;
         Sheet.getCellByPosition(0,i).SetString(ClientDataSet_Hospede.FieldByName('Nome').AsString);
         Sheet.getCellByPosition(1,i).SetString(ClientDataSet_Hospede.FieldByName('posto').AsString);
         Sheet.getCellByPosition(2,i).SetString(ClientDataSet_Hospede.FieldByName('entrada').AsString);
         Sheet.getCellByPosition(3,i).SetString(ClientDataSet_Hospede.FieldByName('saida').AsString);
         Sheet.getCellByPosition(4,i).SetString(ClientDataSet_Hospede.FieldByName('Diarias').AsString);
         Sheet.getCellByPosition(6,i).SetString(ClientDataSet_Hospede.FieldByName('situacao').AsString);
         ClientDataSet_Hospede.Next;
      end;
//   end;
   Screen.Cursor := crDefault;
end;


procedure TForm_Movimentos_Hotel.DBGrid_AtivDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
//   if VB_AtualizarHistorico = False then
//   begin
      DBGrid_Ativ.Canvas.Font.Color:= clBlack;

      if ClientDataSet_Hospede.FieldByName('classificacao').AsString = '1' then
         DBGrid_Ativ.Canvas.Brush.Color:= $006BB6B6
      else
      if ClientDataSet_Hospede.FieldByName('classificacao').AsString = '2' then
         DBGrid_Ativ.Canvas.Brush.Color:= $00D2E1FF
      else
      if ClientDataSet_Hospede.FieldByName('classificacao').AsString = '3' then
         DBGrid_Ativ.Canvas.Brush.Color:= $00ACD7D7
      else
      if ClientDataSet_Hospede.FieldByName('classificacao').AsString = '4' then
         DBGrid_Ativ.Canvas.Brush.Color:= $00FF8CFF
      else
      if ClientDataSet_Hospede.FieldByName('classificacao').AsString = '5' then
         DBGrid_Ativ.Canvas.Brush.Color:= $009B9B00
      else
      if ClientDataSet_Hospede.FieldByName('classificacao').AsString = '6' then
         DBGrid_Ativ.Canvas.Brush.Color:= $00FFFF1A
      else
         DBGrid_Ativ.Canvas.Brush.Color:= $000075EA;

     if gdSelected in State then
       DBGrid_Ativ.Canvas.Brush.Color := clSkyBlue;

      DBGrid_Ativ.Canvas.FillRect(Rect);
      DBGrid_Ativ.DefaultDrawColumnCell(Rect, DataCol, Column, State);
//   end;

end;


procedure TForm_Movimentos_Hotel.ToolButton1Click(Sender: TObject);
var
   VS_DE, VS_DS, VS_TipoFechamento, Caracter, VS_Posto, VS_Comando, VS_Data_Entrada,VS_Tipo, VS_Dep, VS_Duplicidade: String;
   Oficiais_Generais, Oficiais_Superiores, Oficiais_Intermediarios, Oficiais_Subalternos_Aspirantes, SO_SGT, CB_SD_TF, Civil, Outros: Real;
   VS_Nome_old, VS_Data_Entrada_old, VS_Data_Saida_old: String;

   D_Oficiais_Generais, D_Oficiais_Superiores, D_Oficiais_Intermediarios, D_Oficiais_Subalternos_Aspirantes, D_SO_SGT, D_CB_SD_TF, D_Civil, D_Outros: real;
   Tempo, Dependente, Soma : Real;
   Data_Entrada, Data_Saida: TDateTime;
   ValorDiarias: Real;
   VB_Achou: Boolean;

   Diarias, Somar, Classificacao: integer;
   Total_Registros, Total_Hospedes, Total_Fechamentos, Total_Cancelamentos: Integer;
   Total_Diarias, Total_Hospede: Integer;

   
begin
   ClientDataSet_Hospede.EmptyDataSet;

   Labe_Total_Reg.Caption:= '0';
   Labe_Total_Hosp.Caption:= '0';
   Labe_Total_Fech.Caption:= '0';
   Labe_Total_Canc.Caption:= '0';


   Total_Registros:= 0;
   Total_Hospedes:= 0;
   Total_Fechamentos:= 0;
   Total_Cancelamentos:= 0;


   Oficiais_Generais:= 0;
   Oficiais_Superiores:= 0;
   Oficiais_Intermediarios:= 0;
   Oficiais_Subalternos_Aspirantes:= 0;
   SO_SGT:= 0;
   CB_SD_TF:= 0;
   Civil:= 0;
   Outros:= 0;

   D_Oficiais_Generais:= 0;
   D_Oficiais_Superiores:= 0;
   D_Oficiais_Intermediarios:= 0;
   D_Oficiais_Subalternos_Aspirantes:= 0;
   D_SO_SGT:= 0;
   D_CB_SD_TF:= 0;
   D_Civil:= 0;
   D_Outros:= 0;

   ValorDiarias:= 0;

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
         VS_Data_Entrada:= DateToStr(StrToDate(JvDateEdit_Inicio.Text)-150);

//         Memo1.Lines.Clear;

//         Memo2.Lines.Clear;

         VS_Comando:= 'Select a.ficha, b.Nome, b.posto, a.dataentrada, a.datasaida, a.Tipo_Fechamento, a.ValorPago, a.obs, a.horaSaida '+
                      ' From Historico a, hospede b '+
                      ' where a.identidade = b.identidade '+
                      ' and (TO_DATE(a.dataentrada) >= '+#39+VS_Data_Entrada+#39+
                      ' and TO_DATE(a.dataentrada)  <= '+#39+JvDateEdit_DataTermino.Text+#39+')';

//         Memo1.Lines.Add(VS_Comando+' order by b.posto, a.dataentrada, b.Nome ');


         Query_Atividades.Close;
         Query_Atividades.Sql.Clear;
         Query_Atividades.Sql.Add(VS_Comando+' order by b.posto, a.dataentrada, b.Nome ');
         Query_Atividades.Open;

         VS_Nome_old:= Query_Atividades.FieldByName('Nome').AsString;
         VS_Data_Entrada_old:= Query_Atividades.FieldByName('dataentrada').AsString;
         VS_Data_Saida_old:= Query_Atividades.FieldByName('datasaida').AsString;


         Query_Atividades.First;
         While not Query_Atividades.Eof do
         begin

          //--- Classificação por situacao de

           Classificacao:= 0;

            Total_Registros:= Total_Registros + 1;

            if Query_Atividades.FieldByName('Tipo_Fechamento').AsString = 'H' then
            begin
               Total_Hospedes:= Total_Hospedes + 1;
               Diarias:= 0;
//               ValorDiaria:= 0;
               VS_TipoFechamento:= 'HÓSPEDE'
            end
            else
            begin
               if Query_Atividades.FieldByName('Tipo_Fechamento').AsString = 'C' then
               begin
                  Total_Cancelamentos:= Total_Cancelamentos + 1;
                  Diarias:= 0;
//                  ValorDiaria:= 0;
                  VS_TipoFechamento:= 'CANCELADO';
               end
               else
               begin
                  if Query_Atividades.FieldByName('Tipo_Fechamento').AsString = 'F' then
                  begin
                     Total_Fechamentos:= Total_Fechamentos + 1;
                     Diarias:= 0;
                     VS_TipoFechamento:= 'FECHADO';
                  end;
               end;
            end;

            //--- Contabilização das diarias

            if Query_Atividades.FieldByName('datasaida').AsdateTime >= JvDateEdit_Inicio.Date then
            begin

               if copy(Query_Atividades.FieldByName('dataentrada').AsString,3,1) <> '/' then
                   VS_DE:= copy(Query_Atividades.FieldByName('dataentrada').AsString,1,2)+'/'+copy(Query_Atividades.FieldByName('dataentrada').AsString,3,2)+'/'+trim(copy(Query_Atividades.FieldByName('dataentrada').AsString,5,4))
               else
                   VS_DE:= Query_Atividades.FieldByName('dataentrada').AsString;

               if copy(Query_Atividades.FieldByName('datasaida').AsString,3,1) <> '/' then
                   VS_DS:= copy(Query_Atividades.FieldByName('datasaida').AsString,1,2)+'/'+copy(Query_Atividades.FieldByName('datasaida').AsString,3,2)+'/'+trim(copy(Query_Atividades.FieldByName('datasaida').AsString,5,4))
               else
                   VS_DS:= Query_Atividades.FieldByName('datasaida').AsString;


                ///--- Analise se hospedagem duplicada
                //---

                VS_Duplicidade:= ' ';
                if (( VS_Nome_old = Query_Atividades.FieldByName('Nome').AsString) and
                    ( VS_Data_Entrada_old = Query_Atividades.FieldByName('dataentrada').AsString) and
                    ( VS_Data_Saida_old = Query_Atividades.FieldByName('datasaida').AsString)) then
                begin
                    VS_Duplicidade:= '++';
                end;

                VS_Nome_old:= Query_Atividades.FieldByName('Nome').AsString;
                VS_Data_Entrada_old:= Query_Atividades.FieldByName('dataentrada').AsString;
                VS_Data_Saida_old:= Query_Atividades.FieldByName('datasaida').AsString;


               VB_Achou:= False;



//               if Query_Atividades.FieldByName('dataentrada').AsdateTime >= JvDateEdit_Inicio.Date then
               if StrToDate(VS_DE) >= JvDateEdit_Inicio.Date then
                   Data_Entrada:= StrToDate(VS_DE)
               else
                   Data_Entrada:= JvDateEdit_Inicio.Date;


//               if Query_Atividades.FieldByName('datasaida').AsdateTime = JvDateEdit_DataTermino.Date then
               if StrToDate(VS_DS) >= JvDateEdit_Inicio.Date then
               begin
                   Tempo:= 0;
                   Data_Saida:= StrToDate(VS_DS);

                  if trim(Query_Atividades.FieldByName('horaSaida').AsString) <> '' then
                     if ((Query_Atividades.FieldByName('horaSaida').AsInteger >= 1200) and (Query_Atividades.FieldByName('horaSaida').AsInteger <= 2359)) then
                        Tempo:= Tempo+1;
               end
               else
               begin
                  if Query_Atividades.FieldByName('datasaida').AsdateTime < JvDateEdit_DataTermino.Date then
                  begin
                     Tempo:= 1;
                     Data_Saida:= StrToDate(VS_DS);
                  end
                  else
                  begin
                      Tempo:= 0;
                      Data_Saida:= JvDateEdit_DataTermino.Date;

                      if ((Query_Atividades.FieldByName('dataentrada').AsdateTime >= JvDateEdit_Inicio.Date) and 
                          (Query_Atividades.FieldByName('datasaida').AsdateTime > JvDateEdit_DataTermino.Date)) then
                      begin
                          Tempo:= 1;
                      end
                      else
                      begin
                         if trim(Query_Atividades.FieldByName('horaSaida').AsString) <> '' then
                           if ((Query_Atividades.FieldByName('horaSaida').AsInteger >= 1200) and (Query_Atividades.FieldByName('horaSaida').AsInteger <= 2359)) then
                              Tempo:= Tempo+1;
                      end;
                  end;
               end;

               Tempo:= Tempo + DaysBetween(Data_Saida, Data_Entrada);

               //--- Determina o tempo com dependente

               Dependente:= 0;
               VS_Dep:= ' ';
               Caracter := RightStr(Query_Atividades.FieldByName('obs').AsString,6);

               if copy(Caracter, 3,3) = 'dep' then
               begin
                  VS_Dep:= copy(Caracter, 1,1);
                  Dependente:= StrToInt(copy(Caracter, 1,1));

                  Dependente:= (tempo*Dependente)/2;
               end;

               Soma:= Tempo + Dependente;


               ValorDiarias:= ValorDiarias+Query_Atividades.FieldByName('ValorPago').AsFloat;

               //----
               //--- Verifica se o a hospedagem apresenta duplicidade

               VS_Posto:= UpperCase(trim(Query_Atividades.FieldByName('Posto').AsString));
               VS_Tipo:= 'Nenhum';

                       //-------------------
                //--- Tratamento Oficiais_Generais
               //-------------------

               if ((VS_Posto = 'BRIGADEIRO') or
                   (VS_Posto = 'MAJ BRIG') or (VS_Posto = 'MAJ BRIGADEIRO') or (VS_Posto = 'MAJOR BRIGADEIRO') or
                   (VS_Posto = 'TEN BRIG') or (VS_Posto = 'TENENTE BRIGADEIRO') or (VS_Posto = 'MAJOR BRIGADEIRO') or
                   (VS_Posto = 'OFICIAL GENERAL') or
                   (copy(VS_Posto, 1,3) = 'GEN') or
                   (VS_Posto = 'VICE-ALMIRANTE')) Then
               begin
                  VS_Tipo:= 'Oficiais_Generais               ';
                  VB_Achou:= True;
                  Oficiais_Generais:= Oficiais_Generais + Soma;
                  D_Oficiais_Generais:= D_Oficiais_Generais + Query_Atividades.FieldByName('ValorPago').AsInteger;
               end
               else
               begin                //--- Tratamento para Oficiais_Superiores              MAJOR
                  if ((VS_Posto = 'CORONEL') or (VS_Posto = 'TENENTE CORONEL') or (VS_Posto = 'MAJOR') or (VS_Posto = 'MAJ')) then
                  begin
                     VS_Tipo:= 'Oficiais Superiores             ';
                     VB_Achou:= True;
                     Oficiais_Superiores:= Oficiais_Superiores + Soma;
                     D_Oficiais_Superiores:= D_Oficiais_Superiores + Query_Atividades.FieldByName('ValorPago').AsInteger;
                  end                //--- Tratamento para Oficiais_Intermediarios
                  else
                  begin
                     if ((VS_Posto = 'CAP') or (VS_Posto = 'CAPITÃO')) then
                     begin
                        VS_Tipo:= 'Oficiais Intermediarios         ';
                        Oficiais_Intermediarios:= Oficiais_Intermediarios + Soma;
                        D_Oficiais_Intermediarios:= D_Oficiais_Intermediarios + Query_Atividades.FieldByName('ValorPago').AsInteger;
                     end                //--- Tratamento para Oficiais_Subalternos_Aspirantes
                     else
                     begin
                        if ((VS_Posto = '1º TEN') or (VS_Posto = '1º TENENTE') or (VS_Posto = '1ºTEN') or (VS_Posto = '2º TEN') or
                            (VS_Posto = '2º TENENTE') or (VS_Posto = 'CADETES')) then
                        begin
                           VS_Tipo:= 'Oficiais Subalternos Aspirantes ';
                           Oficiais_Subalternos_Aspirantes:= Oficiais_Subalternos_Aspirantes + Soma;
                           D_Oficiais_Subalternos_Aspirantes:= D_Oficiais_Subalternos_Aspirantes + Query_Atividades.FieldByName('ValorPago').AsInteger;
                        end
                        else
                        begin              //--- Tratamento SO_SGT
                           if ((VS_Posto = 'SUBOFICIAL') or (VS_Posto = 'SO') or
                               (VS_Posto = '1S') or (VS_Posto = '2S') or (VS_Posto = '3S') or
                               (VS_Posto = '1º SARGENTO') or (VS_Posto = '2º SARGENTO') or (VS_Posto = '3º SARGENTO')) then
                           begin
                              VS_Tipo:= 'SO_SGT                          ';
                              SO_SGT:= SO_SGT + Soma;
                              D_SO_SGT:= D_SO_SGT + Query_Atividades.FieldByName('ValorPago').AsInteger;
                           end              //--- Tratamento para CB_SD_TF
                           else
                           begin
                              if ((VS_Posto = 'CB') or (VS_Posto = 'SD') or (VS_Posto = 'SOLDADO') or (VS_Posto = 'CABOS') ) then
                              begin
                                 VS_Tipo:= 'CB_SD_TF                        ';
                                 CB_SD_TF:= CB_SD_TF + Soma;
                                 D_CB_SD_TF:= D_CB_SD_TF + Query_Atividades.FieldByName('ValorPago').AsInteger;
                              end               //--- Tratamento Civil
                              else
                              begin
                                 if ((copy(VS_Posto,1,5) = 'CIVIL') or (copy(VS_Posto,1,5) = 'CIVÍL') or (copy(VS_Posto,1,2) = 'CV')) then
                                 begin
                                    VS_Tipo:= 'Civil                           ';
                                    Civil:= Civil + Soma;
                                    D_Civil:= D_Civil + Query_Atividades.FieldByName('ValorPago').AsInteger;
                                 end
                                 else
                                 begin
                                    VS_Tipo:= 'Outros                          ';
                                    Outros:= Outros + Soma;
                                    D_Outros:= D_Outros + Query_Atividades.FieldByName('ValorPago').AsInteger;

                                 end;
                              end;
                           end;
                        end;
                     end;
                  end;
               end;


               ClientDataSet_Hospede.Append;
               ClientDataSet_Hospede.FieldByName('Nome').AsString:= Query_Atividades.FieldByName('Nome').AsString;
               ClientDataSet_Hospede.FieldByName('Posto').AsString:= Query_Atividades.FieldByName('posto').AsString;
               ClientDataSet_Hospede.FieldByName('Entrada').AsString:= VS_DE;
               ClientDataSet_Hospede.FieldByName('Saida').AsString:= VS_DS;
               ClientDataSet_Hospede.FieldByName('Diarias').AsInteger:= Diarias;
               ClientDataSet_Hospede.FieldByName('Situacao').AsString:= VS_TipoFechamento;
               ClientDataSet_Hospede.FieldByName('Classificacao').AsInteger:= Classificacao;

               ClientDataSet_Hospede.Post;

               Memo_Ativ.Lines.Add( FormatFloat('000', Tempo)+'   - '+
                                VS_Dep+' - '+
                                FormatFloat('00.0', Dependente)+' - '+
                                '['+FormatFloat('000.0', Soma)+'] - '+
                                VS_Tipo+' - '+
                                trim(Query_Atividades.FieldByName('dataentrada').AsString)+' - '+
                                trim(Query_Atividades.FieldByName('datasaida').AsString)+' - '+
                                trim(Query_Atividades.FieldByName('ficha').AsString)+' - '+
                                trim(Query_Atividades.FieldByName('Posto').AsString)+' - '+
                                Query_Atividades.FieldByName('Nome').AsString
                              );
            end;
            Query_Atividades.Next;
         end;
      end;
   end;

   Labe_Total_Hosp.Caption:= FormatFloat('####0.0', Total_Hospedes);
   Labe_Total_Fech.Caption:= FormatFloat('####0.0', Total_Fechamentos);
   Labe_Total_Canc.Caption:= FormatFloat('####0.0', Total_Cancelamentos);


   ValorDiarias:= D_Oficiais_Generais+D_Oficiais_Superiores+D_Oficiais_Intermediarios+D_Oficiais_Subalternos_Aspirantes+D_SO_SGT+D_CB_SD_TF+D_Civil+D_Outros;

   Label_Valor_Oficiais_Generais.Caption:= FormatFloat('####0.0', Oficiais_Generais);
   Label_Valor_Oficiais_Superiores.Caption:= FormatFloat('####0.0', Oficiais_Superiores);
   Label_Valor_Oficiais_Intermediarios.Caption:= FormatFloat('####0.0', Oficiais_Intermediarios);
   Label_Valor_Oficiais_Subalternos_Aspirantes.Caption:= FormatFloat('####0.0', Oficiais_Subalternos_Aspirantes);
   Label_Valor_SO_SGT.Caption:= FormatFloat('####0.0', SO_SGT);
   Label_Valor_CB_SD_TF.Caption:= FormatFloat('####0.00', CB_SD_TF);
   Label_Valor_Civil.Caption:= FormatFloat('####0.0', Civil);
   Label_Valor_Outros.Caption:= FormatFloat('####0.0', Outros);

   Label_D_Valor_Oficiais_Generais.Caption:= FormatFloat('####0.00', D_Oficiais_Generais);
   Label_D_Valor_Oficiais_Superiores.Caption:= FormatFloat('####0.00', D_Oficiais_Superiores);
   Label_D_Valor_Oficiais_Intermediarios.Caption:= FormatFloat('####0.00', D_Oficiais_Intermediarios);
   Label_D_Valor_Oficiais_Subalternos_Aspirantes.Caption:= FormatFloat('####0.00', D_Oficiais_Subalternos_Aspirantes);
   Label_D_Valor_SO_SGT.Caption:= FormatFloat('####0.00', D_SO_SGT);
   Label_D_Valor_CB_SD_TF.Caption:= FormatFloat('####0.00', D_CB_SD_TF);
   Label_D_Valor_Civil.Caption:= FormatFloat('####0.00', D_Civil);

   Label_Total_Hospede.Caption:= FormatFloat('####0.00', Oficiais_Generais+Oficiais_Superiores+Oficiais_Intermediarios+Oficiais_Subalternos_Aspirantes+SO_SGT+D_CB_SD_TF+Civil+Outros);
   Label_Total_Diarias.Caption:= FormatFloat('####0.00', D_Oficiais_Generais+D_Oficiais_Superiores+D_Oficiais_Intermediarios+D_Oficiais_Subalternos_Aspirantes+D_SO_SGT+D_CB_SD_TF+D_Civil+D_Outros);


   ClientDataSet_Hospede.First;



end;

procedure TForm_Movimentos_Hotel.ToolButton_VisualicaoaClick(Sender: TObject);
begin
   if Memo_Ativ.Visible = False then
   begin
      Memo_Ativ.Visible:= True;
      DBGrid_Ativ.Visible:= False;
   end
   else
   begin
      Memo_Ativ.Visible:= False;
      DBGrid_Ativ.Visible:= True;
   end;
end;

procedure TForm_Movimentos_Hotel.SpeedButton_Atualiza_MapaClick(Sender: TObject);
begin
   Calcular;

end;

procedure TForm_Movimentos_Hotel.Calcular;
var
   VS_Ano, VS_Comando: String;
   VI_Retorno: Integer;
   Jan, Fev, Mar, Abr, Mai, Jun, Jul, Ago, Sete, Outu, Nov, Dez: Real;
begin

{   VS_Comando:= 'Select DataPagamento, ValorPago, Identidade, Ficha, ano '+
                ' From Historico '+
                ' Where Ano = '+ComboBox_Ano.Text+
                ' and DataPagamento <> '+#39+' '+#39;
}

   VS_Comando:= 'Select DataPagamento, Data_Operacao, ValorPago, Identidade, Ficha, ano from historico where ano = '+ComboBox_Ano.Text+' and nrecibo is not NULL ';
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
      VI_Retorno:= Funcoes.Extrai_Mes(Query_Historico.FieldByName('DataPagamento').AsString);
//      VI_Retorno:= Funcoes.Extrai_Mes(Query_Historico.FieldByName('data_operacao').AsString);

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

procedure TForm_Movimentos_Hotel.Grava(Cod: integer; Desc: String; Valor: Real);
begin
   Table_Estatistica.Append;
   Table_Estatistica.FieldByName('CODIGO').AsInteger:= Cod;
   Table_Estatistica.FieldByName('SITUACAO').AsString:= Desc;
   Table_Estatistica.FieldByName('VALOR').AsFloat:= Valor;
   Table_Estatistica.Post;
end;

end.


