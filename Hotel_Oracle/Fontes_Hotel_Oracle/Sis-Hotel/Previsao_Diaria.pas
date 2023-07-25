unit Previsao_Diaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ToolWin, Menus, DBTables, DB, Mask, Rotinas,
  JvToolEdit, JvGradient, DBCtrls, ExtCtrls, JvGradientCaption,
  JvComponent, JvTransBtn;

type
  TForm_Previsao_Diaria = class(TForm)
    StatusBar: TStatusBar;
    DSQ_Tabela_Posto: TDataSource;
    Table_Apto: TTable;
    StringField5: TStringField;
    FloatField3: TFloatField;
    Table_AptoCAMA: TFloatField;
    Table_AptoNOME: TStringField;
    Table_AptoAPTCODIGO: TStringField;
    DST_Apto: TDataSource;
    Query_Busca_Valor_Hospedagem00: TQuery;
    DataSource1: TDataSource;
    Query_Tabela_Posto: TQuery;
    Query_Tabela_PostoPREDIO: TStringField;
    Query_Tabela_PostoPOSTOGRADUAO: TStringField;
    Query_Tabela_PostoINICIO: TFloatField;
    Query_Tabela_PostoTERMINO: TFloatField;
    Query_Tabela_PostoVALOR: TFloatField;
    Query_Busca_Valor_Residente: TQuery;
    DSQ_Busca_Valor_Residente: TDataSource;
    DSQ_RegrasPagamento: TDataSource;
    Query_RegrasPagamento: TQuery;
    Query_RegrasPagamentoPREDIO: TStringField;
    Query_RegrasPagamentoPOSTOGRADUAO: TStringField;
    Query_RegrasPagamentoINICIO: TFloatField;
    Query_RegrasPagamentoTERMINO: TFloatField;
    Query_RegrasPagamentoVALOR: TFloatField;
    Panel_Periodo: TPanel;
    JvGradient2: TJvGradient;
    Label_Diarias: TLabel;
    Label_Data_saida: TLabel;
    Label_Data_Inicio: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MaskEdit_N_Diarias: TStaticText;
    MaskEdit_Entrada: TJvDateEdit;
    MaskEdit_Saida: TJvDateEdit;
    ComboBox_Predio: TComboBox;
    ComboBox_Situacao_Curso: TComboBox;
    MaskEdit_Horal: TMaskEdit;
    ComboBox_PostoGraduacao: TComboBox;
    MaskEdit_Dependente: TMaskEdit;
    Panel_BotoesPrincipal: TPanel;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvTransparentButton_Calcular: TJvTransparentButton;
    JvGradientCaption3: TJvGradientCaption;
    RichEdit_RegraDesconto: TRichEdit;

    procedure Calcula_Hospede_Em_Transito;

    procedure FormActivate(Sender: TObject);
    procedure ComboBox_PredioExit(Sender: TObject);
    procedure JvTransparentButton_CalcularClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Previsao_Diaria: TForm_Previsao_Diaria;

implementation

uses Module;

{$R *.dfm}

procedure TForm_Previsao_Diaria.FormActivate(Sender: TObject);
begin
   ComboBox_PostoGraduacao.Items.Clear;
   Funcoes.AlimentaComboBox(ComboBox_Predio, 1, '', 'Predio.cnf');
   Funcoes.AlimentaComboBox(ComboBox_Situacao_Curso, 0, '', 'SituacaoCurso.cnf');
   ComboBox_PredioExit(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento para fechar a Form
//------------------------------------------------------------------------------

procedure TForm_Previsao_Diaria.JvTransparentButton_RetornarClick( Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento para fechara  Form e retornar para Windows
//------------------------------------------------------------------------------

procedure TForm_Previsao_Diaria.JvTransparentButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Calcular
//------------------------------------------------------------------------------

procedure TForm_Previsao_Diaria.JvTransparentButton_CalcularClick(Sender: TObject);
var
   VI_N_Diarias: Real;
   VS_Comando:String;
begin
   if (trim(ComboBox_PostoGraduacao.Text) = '' ) then
   begin
      ShowMessage('O Posto Graduação não pode ser branco...');
      ComboBox_PostoGraduacao.SetFocus;
   end
   else
   begin
      if (MaskEdit_Entrada.Text = '  /  /    ' ) then
      begin
         ShowMessage('A data de entrada não pode ser branco...');
         MaskEdit_Entrada.SetFocus;
      end
      else
      begin
         if (MaskEdit_Saida.Text = '  /  /    ' ) then
         begin
            ShowMessage('A data de saída não pode ser branco...');
            MaskEdit_Saida.SetFocus;
         end
         else
         begin
            if (trim(MaskEdit_Horal.Text) = '' ) then
            begin
               ShowMessage('A Hora não pode ser branco...');
               MaskEdit_Horal.SetFocus;
            end
            else
            begin
               VI_N_Diarias:= Funcoes.SubData(StrToDate(MaskEdit_Saida.Text), StrToDate(MaskEdit_Entrada.Text));
               if ((StrToInt(MaskEdit_Horal.Text) >= 0) and (StrToInt(MaskEdit_Horal.Text) <= 500)) then
                  VI_N_Diarias:= VI_N_Diarias+1;

               MaskEdit_N_Diarias.Caption:= FormatFloat('##0',VI_N_Diarias);

                //---
               //--- Verifica se o posto/Graduacao esta na tabela de Preco

               VS_Comando:= 'Select predio, postoGraduação, Inicio, Termino, Valor '+
                            'from regrasDeDiarias '+
                            'where upper(postoGraduação) = '+#39+trim(ComboBox_PostoGraduacao.Text)+#39+' '+
                            'and   predio = '+#39+trim(ComboBox_Predio.Text)+#39+
                            ' order by Inicio';

               Query_RegrasPagamento.Close;
               Query_RegrasPagamento.SQL.Clear;
               Query_RegrasPagamento.SQL.Add(VS_Comando);
               Query_RegrasPagamento.Open;

               if Query_RegrasPagamento.RecordCount = 0 then
               begin
                  MessageDlg('O Posto/Graduação '+trim(ComboBox_PostoGraduacao.Text)+' não foi encontrado na tabela de preço do prédio '+trim(ComboBox_Predio.Text)+' .'+#13+
                             'Verifique se o posto esta correto,'+#13+
                             'Caso não consiga corrigir entre em contato com pessoal da gerencia do hotel.', mtError,[mbOk], 0);
               end
               else
               begin
                  Calcula_Hospede_Em_Transito;
               end;
            end;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Calcula o hospede que esta em transito
//------------------------------------------------------------------------------

procedure TForm_Previsao_Diaria.Calcula_Hospede_Em_Transito;
var
   VF_Valor, VF_TotalPagar, VF_ValorPagar: Real;
   VB_Calcular: Boolean;

   VI_Des, VI_dias: integer;
begin
   RichEdit_RegraDesconto.Lines.Clear;

   //---
   //--- Calculando Valor Pagar

   VF_ValorPagar:= 0;
   VF_TotalPagar:=  0;

   if Query_RegrasPagamento.RecordCount = 0 then
   begin
      RichEdit_RegraDesconto.Lines.Add( 'Não existe regra de Pagamento.');
   end
   else
   begin
      VB_Calcular:= True;
      VI_dias:= 0;

      if StrToInt(MaskEdit_N_Diarias.Caption) >= 11 then
      begin
         RichEdit_RegraDesconto.Lines.Add( 'Houve desconto de 3 dias na diaria');
         VI_Des:= 3;
      end
      else
      begin
         VI_Des:= 0;
      end;

      Query_RegrasPagamento.First;
      While ((not Query_RegrasPagamento.Eof) and (VB_Calcular = True)) do
      begin
         VI_dias:= VI_Dias + 1;
         if VI_Dias > StrToInt(MaskEdit_N_Diarias.Caption) then
         begin
            VF_TotalPagar:= VF_TotalPagar + VF_ValorPagar;
            VB_Calcular:= False;
         end
         else
         begin
            if VI_dias > Query_RegrasPagamento.FieldByName('TERMINO').AsInteger then
            begin
               VF_TotalPagar:= VF_TotalPagar + VF_ValorPagar;
               RichEdit_RegraDesconto.Lines.Add( '( Diaria de R$ '+Funcoes.LReplStr(FormatFloat('##0.00' ,Query_RegrasPagamento.FieldByName('Valor').AsFloat), ' ', 6)+') '+
                                                    'Período de '+Funcoes.LReplStr(Query_RegrasPagamento.FieldByName('Inicio').AsString, ' ', 3)+' a '+
                                                     Funcoes.LReplStr(Query_RegrasPagamento.FieldByName('Termino').AsString, ' ', 3)+' -> '+
                                                     Funcoes.LReplStr(FormatFloat('####0.00',VF_ValorPagar), ' ', 8)
                                               );
               VF_ValorPagar:= 0;

               Query_RegrasPagamento.Next;
            end;
         end;

         if VI_Des = 0 then
            VF_ValorPagar:= VF_ValorPagar + Query_RegrasPagamento.FieldByName('Valor').AsFloat
         else
            VI_Des:= VI_Des - 1;
      end;

       if Query_RegrasPagamento.FieldByName('Valor').AsFloat > 0 then
       begin
         VF_ValorPagar:= VF_ValorPagar - Query_RegrasPagamento.FieldByName('Valor').AsFloat;
         RichEdit_RegraDesconto.Lines.Add( '( Diaria de R$ '+Funcoes.LReplStr(FormatFloat('##0.00' ,Query_RegrasPagamento.FieldByName('Valor').AsFloat), ' ', 6)+') '+
                                           'Período de '+Funcoes.LReplStr(Query_RegrasPagamento.FieldByName('Inicio').AsString, ' ', 3)+' a '+
                                           Funcoes.LReplStr(MaskEdit_N_Diarias.Caption, ' ', 3)+' -> '+
                                           Funcoes.LReplStr(FormatFloat('####0.00',VF_ValorPagar), ' ', 8)
                                          );
       end;
       //---
      //--- Calculando o valor total de dependentes

      VF_Valor:= VF_TotalPagar * 0.50;
      VF_Valor:= VF_Valor*StrToFloat(MaskEdit_Dependente.Text);

      //--- Calcula das Diarias

       if VF_ValorPagar > 0 then
       begin
          RichEdit_RegraDesconto.Lines.Add( 'Dependentes ( '+FormatFloat('#0',StrToInt(MaskEdit_Dependente.Text)) +' )---------------------------> '+
                                        Funcoes.LReplStr(FormatFloat('####0.00',VF_Valor), ' ', 8)
                                       );
       end;

      RichEdit_RegraDesconto.Lines.Add( '' );
      RichEdit_RegraDesconto.Lines.Add( 'Total Pagar----------------------------------> '+
                                        Funcoes.LReplStr(FormatFloat('####0.00',VF_TotalPagar+VF_Valor), ' ', 8)
                                       );
   end;
end;

procedure TForm_Previsao_Diaria.ComboBox_PredioExit(Sender: TObject);
var
   VS_Comando: String;
begin
   VS_Comando:= 'Select distinct postoGraduação From regrasDeDiarias '+
                'where predio = '+#39+ComboBox_Predio.Text+#39+
                ' order by postoGraduação';

   DM.Query_ExecutaQuery.Close;
   DM.Query_ExecutaQuery.Sql.Clear;
   DM.Query_ExecutaQuery.Sql.Add(VS_Comando);
   DM.Query_ExecutaQuery.Open;

   ComboBox_PostoGraduacao.Items.Clear;
   While not  DM.Query_ExecutaQuery.Eof do
   begin
      ComboBox_PostoGraduacao.Items.Add(DM.Query_ExecutaQuery.FieldByName('postoGraduação').AsString);
      DM.Query_ExecutaQuery.Next;
   end;
end;




end.
