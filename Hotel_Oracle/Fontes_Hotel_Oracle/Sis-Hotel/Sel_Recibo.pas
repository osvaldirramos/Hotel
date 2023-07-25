//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Sel_Recibo.PAS                                 //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de trata do fecha-  //
//                             mento da conta do hospede.                     //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 19/03/2003                                     //
//                                                                            //
// ATUALIZADO                : 27/04/04                                       //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      : 27/04/04                                       //
// AUTOR                     : Anl Osvaldir                                   //
// MODULO ALTERADO           : BitBtn_CalcularClick                           //
// MOTIVO                    : Correcao na emissao de msg no  fechamento      //
//                             quando for T(Tesouraria)ou C(Cortesia).        //
//----------------------------------------------------------------------------//

unit Sel_Recibo;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, Mask, DBTables, ComCtrls, Grids, DBGrids,
  Buttons, ExtCtrls, Rotinas, JvGradient, ToolWin, Menus, JvToolEdit,
  JvDBCtrl, JvRichEd, JvDBRichEd, JvComponent, JvCaptionPanel, JvCurrEdit,
  JvGradientCaption, JvTransBtn;

type
  TForm_Fecha_Conta = class(TForm)
    ScrollBox: TScrollBox;
    StatusBar: TStatusBar;
    DST_Hospedagem: TDataSource;
    Table_Hospedagem: TTable;
    Table_Historico: TTable;
    DST_Historico: TDataSource;
    DSQ_Tabela_Posto: TDataSource;
    Table_HospedagemIDENTIDADE: TStringField;
    Table_HospedagemFICHA: TStringField;
    Table_HospedagemPREDIO: TStringField;
    Table_HospedagemAPTO: TFloatField;
    Table_HospedagemCAMA: TFloatField;
    Table_HospedagemDATAENTRADA: TStringField;
    Table_HospedagemHORAENTRADA: TStringField;
    Table_HospedagemDATASAIDA: TStringField;
    Table_HospedagemRECEBE: TStringField;
    Table_HospedagemDESCONTO: TStringField;
    Panel_Caixas: TPanel;
    Panel10: TPanel;
    Panel_Periodo: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel15: TPanel;
    Panel_Posto: TPanel;
    Table_Hospede: TTable;
    DST_Hospede: TDataSource;
    Panel17: TPanel;
    DBEdit_Posto: TDBEdit;
    DBEdit_QTD_Dependentes: TDBEdit;
    Table_HospedagemDEPENDENTE: TFloatField;
    Table_HistoricoIDENTIDADE: TStringField;
    Table_HistoricoFICHA: TStringField;
    Table_HistoricoPREDIO: TStringField;
    Table_HistoricoAPTO: TFloatField;
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
    Table_Apto: TTable;
    StringField5: TStringField;
    FloatField3: TFloatField;
    Table_AptoCAMA: TFloatField;
    DST_Apto: TDataSource;
    DST_DisponibilizaCama: TDataSource;
    Table_DisponibilizaCama: TTable;
    StringField6: TStringField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    Panel13: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    StaticText_Valor_Total_Dependentes: TStaticText;
    Panel28: TPanel;
    Table_HistoricoCUSTO_TELEFONE: TFloatField;
    Table_HospedeIDENTIDADE: TStringField;
    Table_HospedeNOME: TStringField;
    Table_HospedeNOME_GUERRA: TStringField;
    Table_HospedePOSTO: TStringField;
    Table_HospedeDEPENDENTE_DE: TStringField;
    Query_Tabela_Posto: TQuery;
    Table_HospedeSITUACAO_CURSO: TStringField;
    Query_Busca_Valor_Residente: TQuery;
    DSQ_Busca_Valor_Residente: TDataSource;
    Table_HistoricoSITUACAO_CURSO: TStringField;
    MaskEdit_Total_Pagar: TMaskEdit;
    Table_AptoNOME: TStringField;
    Table_DisponibilizaCamaNOME: TStringField;
    Panel1: TPanel;
    DBText_Ficha: TDBText;
    DBText2: TDBText;
    DBText_Predio: TDBText;
    DBText_Apto: TDBText;
    Table_DisponibilizaCamaAPTCODIGO: TStringField;
    Query_Exclui_Hospedagem: TQuery;
    Table_AptoAPTCODIGO: TStringField;
    Table_HospedeOM_ORIGEM: TStringField;
    Table_HistoricoANO: TFloatField;
    Table_HistoricoHORA_OPERACAO: TStringField;
    Table_HistoricoDATA_OPERACAO: TDateTimeField;
    Table_HistoricoDATAENTRADA: TStringField;
    Table_HistoricoDATASAIDA: TStringField;
    Table_HistoricoDATAPAGAMENTO: TStringField;
    Table_Recibo: TTable;
    Table_ReciboNRECIBO: TStringField;
    Table_HospedagemANO: TFloatField;
    Table_HospedagemSITUACAO_HOSPEDAGEM: TStringField;
    JvGradient1: TJvGradient;
    RadioGroup_Ocupacao: TRadioGroup;
    MaskEdit_Praca: TMaskEdit;
    Label_Praca: TLabel;
    Banco: TLabel;
    ComboBox_Banco: TComboBox;
    Label_N_Cheque: TLabel;
    MaskEdit_N_Cheque: TMaskEdit;
    Label_N_Recibo: TLabel;
    MaskEdit_Recibo: TMaskEdit;
    Label_Referente: TLabel;
    MaskEdit_Referente: TMaskEdit;
    JvGradient2: TJvGradient;
    Label_Diarias: TLabel;
    MaskEdit_N_Diarias: TStaticText;
    Label_Data_saida: TLabel;
    DBEdit_Data_Entrada: TDBEdit;
    Label_Data_Inicio: TLabel;
    DBEdit_Situacao_Curso: TDBEdit;
    Label1: TLabel;
    Table_ExcluiDependente: TTable;
    DataSource2: TDataSource;
    Table_ExcluiDependenteIDENTIDADE: TStringField;
    Table_ExcluiDependenteFICHA: TStringField;
    Table_ExcluiDependenteANO: TFloatField;
    Table_ExcluiDependentePREDIO: TStringField;
    Table_ExcluiDependenteAPTO: TFloatField;
    Table_ExcluiDependenteCAMA: TFloatField;
    Table_ExcluiDependenteNOME: TStringField;
    DSQ_RegrasPagamento: TDataSource;
    Query_RegrasPagamento: TQuery;
    Query_Tabela_PostoPREDIO: TStringField;
    Query_Tabela_PostoPOSTOGRADUAO: TStringField;
    Query_Tabela_PostoINICIO: TFloatField;
    Query_Tabela_PostoTERMINO: TFloatField;
    Query_Tabela_PostoVALOR: TFloatField;
    Query_RegrasPagamentoPREDIO: TStringField;
    Query_RegrasPagamentoPOSTOGRADUAO: TStringField;
    Query_RegrasPagamentoINICIO: TFloatField;
    Query_RegrasPagamentoTERMINO: TFloatField;
    Query_RegrasPagamentoVALOR: TFloatField;
    Table_TabelaDePostos: TTable;
    DataSource3: TDataSource;
    Table_TabelaDePostosPOSTOGRADUAO: TStringField;
    Table_TabelaDePostosPOSTO: TStringField;
    Table_HistoricoUSUARIO_ENTRADA: TStringField;
    Table_HistoricoADE: TStringField;
    Label3: TLabel;
    Table_PagParcelado: TTable;
    DST_PagParcelado: TDataSource;
    Table_PagParceladoIDENTIDADE: TStringField;
    Table_PagParceladoFICHA: TStringField;
    Table_PagParceladoANO: TFloatField;
    Table_PagParceladoDATAPAGAMENTO: TStringField;
    Table_PagParceladoVALOR: TFloatField;
    DBGridPagParcelado: TDBGrid;
    Label4: TLabel;
    Table_PagParceladoNRECIBO: TStringField;
    PopupMenu2: TPopupMenu;
    Alterar: TMenuItem;
    Excluir_Parcelado: TMenuItem;
    JvCaptionPanel_Parcelado: TJvCaptionPanel;
    DBRichEdit_Editor_Demo_00: TJvDBRichEdit;
    JvGradient3: TJvGradient;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit_NRecibo: TDBEdit;
    DBEdit_Valor: TDBEdit;
    ToolBar2: TToolBar;
    ToolButton_Gravar: TToolButton;
    ToolButton_Cancelar: TToolButton;
    ToolButton1: TToolButton;
    DBEdit_DataPagamento: TDBEdit;
    MaskEdit_UltimoPag: TJvDateEdit;
    MaskEdit_Data_Saida: TJvDateEdit;
    Label_Calculadora: TLabel;
    Panel_BotoesPrincipal: TPanel;
    JvTransparentButton_Pag_Vista: TJvTransparentButton;
    JvTransparentButton_Retornar: TJvTransparentButton;
    JvTransparentButton_Windows: TJvTransparentButton;
    JvTransparentButton_Calcular: TJvTransparentButton;
    JvGradientCaption3: TJvGradientCaption;
    JvTransparentButton_Cancelar: TJvTransparentButton;
    JvTransparentButton_Pag_Parcelado: TJvTransparentButton;
    Label8: TLabel;
    MaskEdit_Hora_Saida: TMaskEdit;
    Table_HistoricoHORASAIDA: TStringField;
    Table_HistoricoSARAM: TStringField;
    Table_HospedeNACIONALIDADE: TStringField;
    Table_HospedeSARAM: TStringField;
    Table_HospedagemSISCEAB: TStringField;
    Query_RegrasPagamentoSISCEAB: TFloatField;
    RichEdit_RegraDesconto: TRichEdit;
    JvCalcEdit1: TJvCalcEdit;
    DBText_Cama: TDBText;
    Label_Fonte_Pagadora: TLabel;
    MaskEdit_NumeroGRU: TMaskEdit;
    ComboBox_Fonte_Pagadora: TComboBox;
    Label_NumeroGRU: TLabel;

    procedure FormCreate(Sender: TObject);

    procedure FecharPagParcelado;
    procedure CalculaParcelas;
    Procedure Tratamento(Status: Boolean);
    procedure Desabilita;
    procedure Habilita;
    procedure Gravar_Historico(Tipo_Fechamento: String; Recebimento: String);
    procedure Limpa_Apto(Predio, Apto: String);
    procedure Limpa_Campos;
    procedure Calcula_Hospede_Em_Transito;
    procedure Calcula_Hospede_Residente;
    procedure SetarBusca;
    procedure Excluir_ParceladoClick(Sender: TObject);
    procedure AlterarClick(Sender: TObject);
    procedure ToolButton_GravarClick(Sender: TObject);
    procedure ToolButton_CancelarClick(Sender: TObject);
    procedure JvTransparentButton_CalcularClick(Sender: TObject);
    procedure JvTransparentButton_Pag_VistaClick(Sender: TObject);
    procedure JvTransparentButton_RetornarClick(Sender: TObject);
    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_CancelarClick(Sender: TObject);
    procedure JvTransparentButton_Pag_ParceladoClick(Sender: TObject);
    procedure Table_TabelaDePostosPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure ComboBox_Fonte_PagadoraChange(Sender: TObject);
  private    { private declarations }
     VI_Recibo: integer;
     VR_ValorPago: Real;
  public    { public declarations }
  end;

var
  Form_Fecha_Conta: TForm_Fecha_Conta;

implementation

uses Cad_Hospede;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento do Modulo principal
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.FormCreate(Sender: TObject);
begin
   RichEdit_RegraDesconto.Lines.Clear;
   MaskEdit_Data_Saida.Text:= DateToStr(Date);
   JvCaptionPanel_Parcelado.Visible:= False;

   Label_NumeroGRU.Visible:= False;
   MaskEdit_NumeroGRU.Visible:= False;

   Query_RegrasPagamento.Open;
   Table_Recibo.Open;
   Table_Hospedagem.Open;
   Table_Hospede.Open;
   Table_Historico.Open;
   Table_Apto.Open;
   Table_TabelaDePostos.Open;
   Table_DisponibilizaCama.Open;
   Table_ExcluiDependente.Open;
   Table_PagParcelado.Open;

   VR_ValorPago:= 0;

   //--- Verifica se possui pagamento parcelado

   CalculaParcelas;

   //   Query_Busca_Valor_Hospedagem.Open;

   Desabilita;
   Tratamento(False);
   Limpa_Campos;

   if Funcoes.GetPrivilegio = 'G' then
   begin
      JvTransparentButton_Pag_Parcelado.Visible:= True;
      MaskEdit_Referente.ReadOnly:= False;
      MaskEdit_Total_Pagar.ReadOnly:= False;
   end
   else
   begin
      if Funcoes.GetPrivilegio = 'U' then
         JvTransparentButton_Pag_Parcelado.Visible:= True
      else
         JvTransparentButton_Pag_Parcelado.Visible:= False;
      MaskEdit_Referente.ReadOnly:= True;
      MaskEdit_Total_Pagar.ReadOnly:= True;
   end;

   if trim(Table_Hospede.FieldByName('POSTO').AsString) <> '' then
   begin
      Panel_Posto.Caption:= 'Posto/Graduação...................................';
      DBEdit_Posto.DataField:= 'POSTO';
   end
   else
   begin
      Panel_Posto.Caption:= 'Dependente de.......................................';
      DBEdit_Posto.DataField:= 'DEPENDENTE_DE';
   end;

   RadioGroup_Ocupacao.ItemIndex:= 0;
end;

//------------------------------------------------------------------------------
// Tratamento para o botão Calcular
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.JvTransparentButton_RetornarClick( Sender: TObject);
begin
   Table_Hospedagem.Close;
   Table_Hospede.Close;
   Table_Historico.Close;
   Table_Apto.Close;
   Table_DisponibilizaCama.Close;
   Table_ExcluiDependente.Close;
   Query_Tabela_Posto.Close;
   Table_PagParcelado.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento do Botão Calcular
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.JvTransparentButton_CalcularClick(Sender: TObject);
Var
//   VS_Comando: String;
   VI_N_Diarias: Real;
begin
   if trim(MaskEdit_Hora_Saida.Text) = '' then
   begin
      ShowMEssage('É preciso fornecer a hora de saída...');
      MaskEdit_Hora_Saida.SetFocus;
   end
   else
   begin
      Funcoes.Log_Recepcao('Fechamento da Conta - Calcular - '+DBText_Ficha.Caption+'-'+DBText_Predio.Caption+'-'+DBText_Apto.Caption);

      MaskEdit_Data_Saida.Enabled:= False;

       //---
      //--- Calculo do numero de diaria(s)

      VI_N_Diarias:= Funcoes.SubData(StrToDate(MaskEdit_Data_Saida.Text), Table_Hospedagem.FieldByName('DATAENTRADA').AsDateTime);
//      if ((Table_Hospedagem.FieldByName('HORAENTRADA').AsInteger >= 0) and (Table_Hospedagem.FieldByName('HORAENTRADA').AsInteger <= 500)) then
      if ((Table_Hospedagem.FieldByName('HORAENTRADA').AsInteger >= 0) and (Table_Hospedagem.FieldByName('HORAENTRADA').AsInteger <= 1300)) then
         VI_N_Diarias:= VI_N_Diarias+1;

      if ((StrToInt(MaskEdit_Hora_Saida.Text) >= 1200) and (StrToInt(MaskEdit_Hora_Saida.Text) <= 2359)) then
         VI_N_Diarias:= VI_N_Diarias+1;

      MaskEdit_N_Diarias.Caption:= FormatFloat('##0',VI_N_Diarias);

       //---
      //--- Tratamento quando for cortesia

      if Table_Hospedagem.FieldByName('Recebe').AsString = 'C' then
      begin
         Tratamento(False);

         if MessageDlg('Esta hospedagem é cortesia.'+#13+#13+'Confirma o Fechamento da hospedagem ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         begin
            if StrToInt(MaskEdit_N_Diarias.Caption) > 1 then
               MaskEdit_Referente.Text:= 'Cortesia proveniente de '+MaskEdit_N_Diarias.Caption+' diarias de hospedagem no Hotel do ICEA.'
            else
               MaskEdit_Referente.Text:= 'Cortesia proveniente de '+MaskEdit_N_Diarias.Caption+' diaria de hospedagem no Hotel do ICEA.';

            Gravar_Historico('C', 'S');
            Form_Cad_Hospede.Monta_Mapa(1);
            Close;
         end
         else
         begin
            SetarBusca;
            Limpa_Campos;
            Desabilita;
            Tratamento(False);
         end;
      end
      else
      begin

          //---
         //--- Pagamento deve ser na tesouraria

         if Table_Hospedagem.FieldByName('Recebe').AsString = 'T' then
         begin
            if MessageDlg('O pagamento deverá ser realizado na tesouraria '+#13+#13+'Confirma o Fechamento da hospedagem ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
               Tratamento(False);
               if StrToInt(MaskEdit_N_Diarias.Caption) > 1 then
                  MaskEdit_Referente.Text:= 'O pagamento das '+MaskEdit_N_Diarias.Caption+' diarias de hospedagem foi realizada na tesouraria.'
               else
                  MaskEdit_Referente.Text:= 'O pagamento de 1 diaria de hospedagem foi realizada na tesouraria.';

               Gravar_Historico('T', 'S');
               Form_Cad_Hospede.Monta_Mapa(1);
               Close;
            end
            else
            begin
               SetarBusca;
               Limpa_Campos;
               Desabilita;
               Tratamento(False);
            end;
         end
         else
         begin
             //---
            //--- Tratamento para coletar o numero do ultimo recibo

            MaskEdit_Recibo.Text:= '';

            if Trim(UpperCase(Table_Hospede.FieldByName('SITUACAO_CURSO').AsString)) = 'RESIDENTE' then
            begin
               Query_Busca_Valor_Residente.Close;
               Query_Busca_Valor_Residente.SQL.Clear;
               if trim(Table_Hospede.FieldByName('POSTO').AsString) <> '' then
                  Query_Busca_Valor_Residente.SQL.Add('Select * from Residente Where Posto = '+#39+Table_Hospede.FieldByName('POSTO').AsString+#39)
               else
                  Query_Busca_Valor_Residente.SQL.Add('Select * from Residente Where Posto = '+#39+Table_Hospede.FieldByName('DEPENDENTE_DE').AsString+#39);
               Query_Busca_Valor_Residente.Open;

               if Query_Busca_Valor_Residente.RecordCount = 0 then
               begin
                  MessageDlg('O Posto/Graduação '+trim(DBEdit_Posto.Text)+' não foi encontrado na tabela de preço de Residente.'+#13+
                             'Verifique no cadastro do hóspede se o posto esta correto,'+#13+
                             'Caso não consiga corrigir entre em contato com pessoal da gerencia do hotel.', mtError,[mbOk], 0);
               end
               else
               begin
                  Calcula_Hospede_Residente;
               end;
            end
            else
            begin
                //---
               //--- Verifica se o posto/Graduacao esta na tabela de Preco

               Query_RegrasPagamento.Close;
               Query_RegrasPagamento.SQL.Clear;
               Query_RegrasPagamento.SQL.Add(' Select predio, postoGraduação, Inicio, Termino, Valor, Sisceab '+
                                             ' From regrasDeDiarias '+
                                             ' Where upper(postoGraduação) = '+#39+trim(DBEdit_Posto.Text)+#39+' '+
                                             ' and   predio = '+#39+trim(TAble_Hospedagem.FieldByName('Predio').AsString)+#39+
                                             ' order by Inicio'
                                            );
               Query_RegrasPagamento.Open;

               if Query_RegrasPagamento.RecordCount = 0 then
               begin
                   MessageDlg('O Posto/Graduação '+trim(DBEdit_Posto.Text)+'   -   @'+Query_RegrasPagamento.FieldByName('postoGraduação').AsString+'@ não foi encontrado na tabela de preço do prédio '+trim(Table_Hospedagem.FieldByName('Predio').AsString)+' .'+#13+
                              'Verifique no cadastro do hóspede se o posto esta correto,'+#13+
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
// Tratamento do Botão Imprimir
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.JvTransparentButton_Pag_VistaClick(Sender: TObject);
var
   VS_Comando: String;
begin
   if trim(MaskEdit_Recibo.Text) = '' then
   begin
      MessageDlg('O Nº do recibo não pode ser branco.', mtInformation,[mbOk], 0);
      MaskEdit_Recibo.setfocus;
   end
   else
   begin
      if Funcoes.NFicha(MaskEdit_Recibo.Text) = '000000' then
      begin
         MessageDlg('O Nº do recibo não pode ser "000000".', mtInformation,[mbOk], 0);
         MaskEdit_Recibo.setfocus;
      end
      else
      begin
         VS_Comando:= 'Select count(*) QtdReg from Historico where nrecibo = '+
                      #39+trim(Funcoes.NFicha(Trim(MaskEdit_Recibo.Text)))+
                      #39+' and ano = '+#39+Funcoes.AnoAtual+#39;

         if Funcoes.QtdRegistro(VS_Comando) > 0 then
         begin
            MessageDlg('O Nº Recibo fornecido já existe, '+#13+'VERIFICAR se o número do recibo esta correto...', mtInformation,[mbOk], 0);
            MaskEdit_Recibo.setfocus;
         end
         else
         begin
            if MessageDlg('Confirma o fechamento da hospedagem com pagamento a vista ?',mtConfirmation, [mbYes, mbNo], 1) = mrYes then
            begin
              Funcoes.Log_Recepcao('Fechamento da Conta - Pag a Vista - '+DBText_Ficha.Caption+'-'+DBText_Predio.Caption+'-'+DBText_Apto.Caption);

               Gravar_Historico('F', 'S');
               Tratamento(False);
               Desabilita;
               Form_Cad_Hospede.Monta_Mapa(1);
               Close;
            end;
            SetarBusca;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Botão Pagamento
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.JvTransparentButton_Pag_ParceladoClick(Sender: TObject);
var
   VB_Gravar: Boolean;
   VS_Comando: String;
begin
   VB_Gravar:= True;

   if trim(MaskEdit_Total_Pagar.Text) = ''  then
   begin
      MessageDlg('O valor não pode ser branco.', mtInformation,[mbOk], 0);
      VB_Gravar:= False;
      MaskEdit_Total_Pagar.setfocus;
   end
   else
   begin
   if trim(MaskEdit_Recibo.Text) = '' then
   begin
      MessageDlg('O Nº do recibo não pode ser branco.', mtInformation,[mbOk], 0);
      VB_Gravar:= False;
      MaskEdit_Recibo.setfocus;
   end
   else
   begin
      VS_Comando:= 'Select count(*) QtdReg from Historico where nrecibo = '+
                   #39+trim(Funcoes.NFicha(Trim(MaskEdit_Recibo.Text)))+
                   #39+' and ano = '+#39+Funcoes.AnoAtual+#39;

      if Funcoes.QtdRegistro(VS_Comando) > 0 then
      begin
         MessageDlg('O Nº Recibo fornecido já existe...', mtInformation,[mbOk], 0);
         VB_Gravar:= False;
         MaskEdit_Recibo.setfocus;
      end
      else
      begin
         if Funcoes.NFicha(MaskEdit_Recibo.Text) = '000000' then
         begin
            MessageDlg('O Nº do recibo não pode ser "000000".', mtInformation,[mbOk], 0);
            VB_Gravar:= False;
            MaskEdit_Recibo.setfocus;
         end
      end;
    end;
    end;

    if VB_Gravar = True Then
    begin
       if MessageDlg('Confirma o fechamento da hospedagem com Pagamento Parcelado ?',mtConfirmation, [mbYes, mbNo], 1) = mrYes then
       begin
            Funcoes.Log_Recepcao('Fechamento da Conta - Pag a Parcelado - '+DBText_Ficha.Caption+'-'+DBText_Predio.Caption+'-'+DBText_Apto.Caption);

            MaskEdit_Recibo.Text:= Funcoes.NFicha(MaskEdit_Recibo.Text);
            Table_PagParcelado.Append;
            Table_PagParcelado.FieldByName('IDENTIDADE').AsString:= Table_Historico.FieldByName('IDENTIDADE').AsString;
            Table_PagParcelado.FieldByName('FICHA').AsString:= Table_Historico.FieldByName('FICHA').AsString;
            Table_PagParcelado.FieldByName('ANO').AsString:= Table_Historico.FieldByName('ANO').AsString;
            Table_PagParcelado.FieldByName('DATAPAGAMENTO').AsString:= MaskEdit_Data_Saida.Text;
            Table_PagParcelado.FieldByName('VALOR').AsString:= MaskEdit_Total_Pagar.Text;
            Table_PagParcelado.FieldByName('NRECIBO').AsString:= MaskEdit_Recibo.Text;
            Table_PagParcelado.Post;

            //--- Atualiza o numero do recibo

            Table_Recibo.First;
            if StrToInt(MaskEdit_Recibo.Text) > Table_Recibo.FieldByName('NRecibo').Asinteger then
            begin
               Table_Recibo.Edit;
               Table_Recibo.FieldByName('NRecibo').AsString:= MaskEdit_Recibo.Text;
               Table_Recibo.Post;
            end;
            Form_Cad_Hospede.Monta_Mapa(1);
            Close;
       end;
    end;
end;

//------------------------------------------------------------------------------
// Este modulo tem a finalidade de Desabiltar os Edit's de tratamento.
//------------------------------------------------------------------------------

Procedure TForm_Fecha_Conta.Tratamento(Status: Boolean);
begin
   MaskEdit_Recibo.Enabled:= Status;
//   MaskEdit_Ade.Enabled:= Status;
   MaskEdit_N_Cheque.Enabled:= Status;
   ComboBox_Banco.Enabled:= Status;
   MaskEdit_Praca.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Este modulo tem a finalidade de limpar os campos de entrada de informacoes
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.Limpa_Campos;
begin
   RichEdit_RegraDesconto.Lines.Clear;
   StaticText_Valor_Total_Dependentes.Caption:= '0,00';
   MaskEdit_Total_Pagar.Text:= '0,00';

   ComboBox_Fonte_Pagadora.Text:= 'CONSIGNADO';

   MaskEdit_NumeroGRU.Clear;
   MaskEdit_Recibo.Clear;
   MaskEdit_N_Cheque.Clear;
   ComboBox_Banco.Text:= '';
   MaskEdit_Praca.Clear;
   MaskEdit_Referente.Text:= '';
end;

//------------------------------------------------------------------------------
// Este modulo tem a finalidade de Desabilitar os Botoes
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.Desabilita;
begin
   JvTransparentButton_Calcular.Enabled:= True;
   JvTransparentButton_Cancelar.Enabled:= False;
   JvTransparentButton_Pag_Vista.Enabled:= False;
   JvTransparentButton_Pag_Parcelado.Enabled:= False;
   JvTransparentButton_Retornar.Enabled:= True;
   JvTransparentButton_Windows.Enabled:= True;
end;

//------------------------------------------------------------------------------
// Este modulo tem a finalidade de Habilitar os Botoes
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.Habilita;
begin
   JvTransparentButton_Calcular.Enabled:= False;
   JvTransparentButton_Cancelar.Enabled:= True;
   JvTransparentButton_Pag_Vista.Enabled:= True;
   JvTransparentButton_Pag_Parcelado.Enabled:= True;
   JvTransparentButton_Retornar.Enabled:= False;
   JvTransparentButton_Windows.Enabled:= False;
end;

//------------------------------------------------------------------------------
// Este modulo tem a finalidade de tratar o botao Ignorar
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.JvTransparentButton_CancelarClick(Sender: TObject);
begin
   if MessageDlg('Confirma o cancelamento do fechamento da conta ?',mtConfirmation, [mbYes, mbNo], 1) = mrYes then
   begin
      SetarBusca;
      Limpa_Campos;
      Desabilita;
      Tratamento(False);
   end;
end;

//------------------------------------------------------------------------------
// Este modulo tem a finalidade de setar Busca
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.SetarBusca;
begin
   MaskEdit_Data_Saida.Enabled:= True;
   MaskEdit_N_Diarias.Caption:= '';
end;

//------------------------------------------------------------------------------
// Este modulo tem a finalidade de Limpar o Apto
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.Limpa_Apto(Predio, Apto: String);
var
   VS_Comando, VS_Nome, VS_Situacao: String;
   Sender: TObject;
begin

   if Table_Apto.FieldByName('Apto').AsInteger = 900 then
   begin
      VS_Situacao:= 'DESOCUPADO';
      VS_Nome:= '';
   end
   else
   begin
      VS_Situacao:= 'NÃO OCUPAR';
      VS_Nome:= 'ARRUMAR';
   end;

   if RadioGroup_Ocupacao.ItemIndex = 1 then
   begin
      VS_Situacao:= Table_Hospedagem.FieldByName('Identidade').AsString;
      VS_Nome:= 'NÃO DESOCUPADO'
   end;

   if Table_Hospedagem.FieldByName('DEPENDENTE').AsInteger > 0 then
   begin
      Table_DisponibilizaCama.First;
      While not Table_DisponibilizaCama.eof do
      begin
         Table_DisponibilizaCama.Edit;
         Table_DisponibilizaCama.FieldByName('AptCodigo').AsString:= VS_Situacao;
         Table_DisponibilizaCama.FieldByName('Nome').AsString:= VS_Nome;
         Table_DisponibilizaCama.Post;

         //--- Exclui o Dependente

         if Table_ExcluiDependente.RecordCount > 0 then
            Table_ExcluiDependente.Delete;

         Table_DisponibilizaCama.Next;
      end;
   end;

   Table_Apto.Edit;
   Table_Apto.FieldByName('AptCodigo').AsString:= VS_Situacao;
   Table_Apto.FieldByName('Nome').AsString:= VS_Nome;
   Table_Apto.Post;

   JvTransparentButton_RetornarClick( Sender);
end;

//------------------------------------------------------------------------------
// Este modulo tem a finalidade de tratar o botao Ignorar
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.Gravar_Historico(Tipo_Fechamento: String; Recebimento: String);
var
   VS_Predio, VS_Apto, VS_Ficha, VS_Comando: String;
begin
   //---
   //--- Grava os dados finais para o historico

   VS_Ficha:= Table_Historico.FieldByName('Ficha').AsString;
   VS_Predio:= Table_Historico.FieldByName('Predio').AsString;
   VS_Apto:= Table_Historico.FieldByName('Apto').AsString;

   Table_Historico.Edit;
   Table_Historico.FieldByName('DATASAIDA').AsString:= MaskEdit_Data_Saida.Text;
   Table_Historico.FieldByName('USUARIO_SAIDA').AsString:= Funcoes.GetUsuario;

   if Recebimento = 'S' then
      Table_Historico.FieldByName('DATAPAGAMENTO').AsString:= MaskEdit_Data_Saida.Text
   else
      Table_Historico.FieldByName('DATAPAGAMENTO').AsString:= '';

   if Trim(MaskEdit_Recibo.Text) = '' then
      Table_Historico.FieldByName('NRECIBO').AsString:= ''
   else
      Table_Historico.FieldByName('NRECIBO').AsString:= Funcoes.NFicha(Trim(MaskEdit_Recibo.Text));

   Table_Historico.FieldByName('BANCO').AsString:= ComboBox_Banco.Text;
   Table_Historico.FieldByName('NCHEQUE').AsString:= MaskEdit_N_Cheque.Text;
   Table_Historico.FieldByName('PRACA').AsString:= MaskEdit_Praca.Text;
   Table_Historico.FieldByName('VALORPAGO').AsString:= MaskEdit_Total_Pagar.Text;
   Table_Historico.FieldByName('CUSTO_TELEFONE').AsString:= '0';
   Table_Historico.FieldByName('TIPO_FECHAMENTO').AsString:= Tipo_Fechamento;
   Table_Historico.FieldByName('RECEBIDO').AsString:= Recebimento;
   Table_Historico.FieldByName('OBS').AsString:= MaskEdit_Referente.Text;
   Table_Historico.FieldByName('SITUACAO_CURSO').AsString:= DBEdit_Situacao_Curso.Text;
   Table_Historico.FieldByName('Hora_Operacao').AsString:= TimeToStr(Time);
   Table_Historico.FieldByName('Data_Operacao').AsString:= DateToStr(Date);
   Table_Historico.FieldByName('SITUACAO_CURSO').AsString:= DBEdit_Situacao_Curso.Text;
   Table_Historico.FieldByName('HoraSaida').AsString:= MaskEdit_Hora_Saida.Text;

   if ComboBox_Fonte_Pagadora.Text = 'GRU' then
      Table_Historico.FieldByName('ADE').AsString:= ComboBox_Fonte_Pagadora.Text+' '+trim(MaskEdit_NumeroGRU.Text)   //--- Tratamento para cadastrar a GRU
   else
      Table_Historico.FieldByName('ADE').AsString:= ComboBox_Fonte_Pagadora.Text;
   Table_Historico.Post;

   Limpa_Apto(Table_Historico.FieldByName('Predio').AsString, Table_Historico.FieldByName('Apto').AsString);

    //---
   //--- Exclui o hospede

   VS_Comando:= 'Delete from hospedagem  where ficha  = '+VS_Ficha;

   Query_Exclui_Hospedagem.Close;
   Query_Exclui_Hospedagem.SQL.Clear;
   Query_Exclui_Hospedagem.SQL.Add(VS_Comando);
   Query_Exclui_Hospedagem.ExecSql;


   VS_Comando:= 'Select h.Nome, f.ficha from hospedagem f, hospede h where f.identidade = h.identidade and predio = '+#39+VS_Predio+#39+' and Apto = '+VS_Apto;
   Query_Exclui_Hospedagem.Close;
   Query_Exclui_Hospedagem.SQL.Clear;
   Query_Exclui_Hospedagem.SQL.Add(VS_Comando);
   Query_Exclui_Hospedagem.Open;

   if Query_Exclui_Hospedagem.FieldByName('Ficha').AsString <> '' then
   begin
      Table_Apto.Open;
      Table_Apto.Edit;
      Table_Apto.FieldByName('AptCodigo').AsString:= 'OCUPADO';
      Table_Apto.FieldByName('Nome').AsString:= Query_Exclui_Hospedagem.FieldByName('Nome').AsString;
      Table_Apto.Post;
   end;

   //--- Atualiza o numero do recibo

   Table_Recibo.First;
   if VI_Recibo > Table_Recibo.FieldByName('NRecibo').Asinteger then
   begin
      Table_Recibo.Edit;
      Table_Recibo.FieldByName('NRecibo').Asinteger:= VI_Recibo;
      Table_Recibo.Post;
   end;

   Limpa_Campos;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.JvTransparentButton_WindowsClick( Sender: TObject);
begin
   if Funcoes.GetPrivilegio = 'G' then
      Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Calcula o hospede que esta em transito
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.Calcula_Hospede_Em_Transito;
var
   VF_Valor, VF_TotalPagar, VF_ValorPagar: Real;
   VB_Calcular: Boolean;

   VI_Des, VI_dias: integer;
begin
   RichEdit_RegraDesconto.Lines.Clear;

    //---
   //--- Calculo do Pagamento

   if Table_Hospedagem.FieldByName('DEPENDENTE').AsInteger = 0 then
      MaskEdit_Referente.Text:= 'Proveniente de '+MaskEdit_N_Diarias.Caption+' diárias de hospedagem no Hotel do ICEA.'
   else
      MaskEdit_Referente.Text:= 'Proveniente de '+MaskEdit_N_Diarias.Caption+' diárias de hospedagem no Hotel do ICEA com '+Table_Hospedagem.FieldByName('DEPENDENTE').AsString+' dep.';

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
      VI_Des:= 0;
      VF_ValorPagar:= 0;

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
            if Table_Hospedagem.FieldByName('SISCEAB').AsString = 'SIM' then
                VF_ValorPagar:= VF_ValorPagar + Query_RegrasPagamento.FieldByName('SISCEAB').AsFloat
            else
               VF_ValorPagar:= VF_ValorPagar + Query_RegrasPagamento.FieldByName('Valor').AsFloat
         else
            VI_Des:= VI_Des - 1;
      end;

       if Query_RegrasPagamento.FieldByName('Valor').AsFloat > 0 then
       begin
         if Table_Hospedagem.FieldByName('SISCEAB').AsString = 'SIM' then
         begin
             VF_ValorPagar:= VF_ValorPagar - Query_RegrasPagamento.FieldByName('SISCEAB').AsFloat;

             RichEdit_RegraDesconto.Lines.Add( 'VALOR CACULADOS COM DESCONTO PARA O SISCEAB'+#13+
                                               '( Diaria de R$ '+Funcoes.LReplStr(FormatFloat('##0.00' ,Query_RegrasPagamento.FieldByName('SISCEAB').AsFloat), ' ', 6)+') '+
                                               'Período de '+Funcoes.LReplStr(Query_RegrasPagamento.FieldByName('Inicio').AsString, ' ', 3)+' a '+
                                                Funcoes.LReplStr(MaskEdit_N_Diarias.Caption, ' ', 3)+' -> '+
                                                Funcoes.LReplStr(FormatFloat('####0.00',VF_ValorPagar), ' ', 8)
                                              );
         end
         else
         begin
             VF_ValorPagar:= VF_ValorPagar - Query_RegrasPagamento.FieldByName('Valor').AsFloat;

             RichEdit_RegraDesconto.Lines.Add( 'VALOR CACULADOS SEM DESCONTO PARA O SISCEAB'+#13+
                                               '( Diaria de R$ '+Funcoes.LReplStr(FormatFloat('##0.00' ,Query_RegrasPagamento.FieldByName('Valor').AsFloat), ' ', 6)+') '+
                                               'Período de '+Funcoes.LReplStr(Query_RegrasPagamento.FieldByName('Inicio').AsString, ' ', 3)+' a '+
                                                Funcoes.LReplStr(MaskEdit_N_Diarias.Caption, ' ', 3)+' -> '+
                                                Funcoes.LReplStr(FormatFloat('####0.00',VF_ValorPagar), ' ', 8)
                                              );
         end;
       end;
       //---
      //--- Calculando o valor total de dependentes

      VF_Valor:= VF_TotalPagar * 0.50;
      VF_Valor:= (VF_Valor*Table_Hospedagem.FieldByName('DEPENDENTE').AsFloat);
      StaticText_Valor_Total_Dependentes.Caption:= FormatFloat('####0.00',VF_Valor);

      //--- Calcula das Diarias

       if VR_ValorPago > 0 then
       begin
          RichEdit_RegraDesconto.Lines.Add( 'Soma das Diárias-----------------------------> '+
                                        Funcoes.LReplStr(FormatFloat('####0.00',VF_TotalPagar), ' ', 8)
                                       );
         RichEdit_RegraDesconto.Lines.Add( 'Valor Pago-----------------------------------> '+
                                           Funcoes.LReplStr(FormatFloat('####0.00',VR_ValorPago), ' ', 8)
                                          );
         VF_TotalPagar:= VF_TotalPagar - VR_ValorPago;
       end;


      RichEdit_RegraDesconto.Lines.Add( 'Total Pagar----------------------------------> '+
                                        Funcoes.LReplStr(FormatFloat('####0.00',VF_TotalPagar), ' ', 8)
                                       );

      MaskEdit_Total_Pagar.Text:= FormatFloat('####0.00',(VF_TotalPagar+VF_Valor));

   end;

   Habilita;
   Tratamento(True);
   MaskEdit_Recibo.setfocus;
end;

//------------------------------------------------------------------------------
// Calcula o hospede que esta em transito
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.Calcula_Hospede_Residente;
var
   Dias, Tempo: String;
   VS_ValorDiarias: String;
   VF_Valor, UltimoDiaDoMes, ValorDiaria: Real;

   InicioDia, InicioMes, InicioAno: Word;
   TerminoDia, TerminoMes, TerminoAno: Word;
begin
   DecodeDate( StrToDate(DBEdit_Data_Entrada.Text), Inicioano, Iniciomes, Iniciodia);
   DecodeDate( StrToDate(MaskEdit_Data_Saida.Text), TerminoAno, TerminoMes, TerminoDia);
   UltimoDiaDoMes:= StrToFloat(IntToStr(Funcoes.DiasNoMes(TerminoAno, TerminoMes)));

   Tempo:= FloatToStr(StrToDate(MaskEdit_Data_Saida.Text) - StrToDate(DBEdit_Data_Entrada.Text));
   MaskEdit_N_Diarias.Caption:= Tempo;

    //---
   //--- Calculo do Pagamento

   VS_ValorDiarias:= FormatFloat('###.00',Query_Busca_Valor_Residente.FieldByName('Valor').AsFloat);

    //---
   //--- Calculando o valor total a pagar

//   if TerminoDia = UltimoDiaDoMes then   // Calcular Parcial
   if StrToFloat(Tempo) = 30 then
   begin
      RichEdit_RegraDesconto.Lines.Add( ' Diaria de Residente no Hotel do ICEA R$ '+Funcoes.LReplStr(FormatFloat('####0.00', StrToFloat(VS_ValorDiarias)), ' ', 8));
      Dias:= '';
      if Table_Hospedagem.FieldByName('DEPENDENTE').AsInteger = 0 then
          MaskEdit_Referente.Text:= 'Proveniente de diarias de Residente no Hotel do ICEA.'
      else
         MaskEdit_Referente.Text:= 'Proveniente de diarias de Residente no Hotel do ICEA com '+Table_Hospedagem.FieldByName('DEPENDENTE').AsString+' dep.';
   end
   else
   begin
      RichEdit_RegraDesconto.Lines.Add( 'Valor da Diaria R$ '+Funcoes.LReplStr(FormatFloat('####0.00', StrToFloat(VS_ValorDiarias)), ' ', 8));
//      ValorDiaria:= StrToFloat(VS_ValorDiarias)/UltimoDiaDoMes;
      ValorDiaria:= StrToFloat(VS_ValorDiarias)/30;
      ValorDiaria:= ValorDiaria*StrToFloat(Tempo);
      VS_ValorDiarias:= FormatFloat('###.00',ValorDiaria);
      Dias:= tempo;
      RichEdit_RegraDesconto.Lines.Add( 'Diaria proporcionais a '+Dias+' dias - R$ '+Funcoes.LReplStr(FormatFloat('####0.00', StrToFloat(VS_ValorDiarias)), ' ', 8));

      if Table_Hospedagem.FieldByName('DEPENDENTE').AsInteger = 0 then
          MaskEdit_Referente.Text:= 'Proveniente de '+Tempo+' diárias proporcionais de Residente no Hotel do ICEA.'
      else
         MaskEdit_Referente.Text:= 'Proveniente de '+Tempo+' diárias  proporcionais de Residente no Hotel do ICEA com '+Table_Hospedagem.FieldByName('DEPENDENTE').AsString+' dep.';
   end;

    //---
   //--- Calculando o valor total de dependentes

   VF_Valor:= StrToFloat(VS_ValorDiarias) * 0.50;
   VF_Valor:= (VF_Valor*Table_Hospedagem.FieldByName('DEPENDENTE').AsFloat);

   StaticText_Valor_Total_Dependentes.Caption:= FormatFloat('####0.00',VF_Valor);
   VS_ValorDiarias:= FloatToStr(StrToFloat(VS_ValorDiarias)+VF_Valor);

   MaskEdit_Total_Pagar.Text:= FormatFloat('####0.00',StrToFloat(VS_ValorDiarias));

   Habilita;
   Tratamento(True);
   MaskEdit_Recibo.setfocus;
end;

//------------------------------------------------------------------------------
// Tratamento para calcular o montante que ira pagar
//---
//--- Calculando Valor Pagar
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.CalculaParcelas;
var
   VF_Valor, VF_TotalPagar, VF_ValorPagar: Real;
   VB_Calcular: Boolean;

   VR_NDiarias: real;
   VI_Des, VI_dias: integer;
begin
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
         VI_Des:= 0;

         VR_NDiarias:= Funcoes.SubData(StrToDate(Table_Hospedagem.FieldByName('DataSaida').AsString ), StrToDate(DBEdit_Data_Entrada.Text));
//         if VR_NDiarias >= 11 then
//         begin
//            VI_Des:= 3;
//         end;

         //--- Calcula valor total de pagamento

         Query_RegrasPagamento.First;
         While ((not Query_RegrasPagamento.Eof) and (VB_Calcular = True)) do
         begin
            VI_dias:= VI_Dias + 1;
            if VI_Dias > VR_NDiarias then
            begin
               VF_TotalPagar:= VF_TotalPagar + VF_ValorPagar;
               VB_Calcular:= False;
            end
            else
            begin
               if VI_dias > Query_RegrasPagamento.FieldByName('TERMINO').AsInteger then
               begin
                  VF_TotalPagar:= VF_TotalPagar + VF_ValorPagar;
                  VF_ValorPagar:= 0;

                  Query_RegrasPagamento.Next;
               end;
            end;

            if VI_Des = 0 then
               VF_ValorPagar:= VF_ValorPagar + Query_RegrasPagamento.FieldByName('Valor').AsFloat
            else
               VI_Des:= VI_Des - 1;
         end;

          //---
         //--- Calculando o valor total de dependentes

         VF_Valor:= VF_TotalPagar * 0.50;
         VF_Valor:= (VF_Valor*Table_Hospedagem.FieldByName('DEPENDENTE').AsFloat);


          //---
         //--- Encontra a data do Ultimo data de Pagamento e valor total pago

         VR_ValorPago:= 0;
         if Table_PagParcelado.RecordCount = 0 then
         begin
            MaskEdit_UltimoPag.Text:= Table_Hospedagem.FieldByName('DataEntrada' ).AsString;
         end
         else
         begin
            Table_PagParcelado.First;
            While Not Table_PagParcelado.Eof do
            begin
               VR_ValorPago:= VR_ValorPago+Table_PagParcelado.FieldByName('Valor').AsFloat;
               Table_PagParcelado.Next;
            end;
            MaskEdit_UltimoPag.Text:= Table_PagParcelado.FieldByName('DataPagamento' ).AsString;
            Table_PagParcelado.First;
         end;
      end;
end;

procedure TForm_Fecha_Conta.Excluir_ParceladoClick(Sender: TObject);
begin
   if MessageDlg('Confirma a exclusão ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Table_PagParcelado.Delete;
      CalculaParcelas;
   end;

end;

//------------------------------------------------------------------------------
// Habilita a Janela de tratamento do Pagamento Parcelado
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.AlterarClick(Sender: TObject);
begin
   JvCaptionPanel_Parcelado.Visible:= True;
   Table_PagParcelado.Edit;
   DBEdit_DataPagamento.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento da Gravacao dos dados do Parcelamento
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.ToolButton_GravarClick(Sender: TObject);
begin
   Table_PagParcelado.Post;
   FecharPagParcelado;
end;

//------------------------------------------------------------------------------
// Tratamento da Cancalmento da alteracao dos dados do Parcelamento
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.ToolButton_CancelarClick(Sender: TObject);
begin
   Table_PagParcelado.Cancel;
   FecharPagParcelado;
end;

//------------------------------------------------------------------------------
// Fechar a janela de tratamento do pagamento parcelado
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.FecharPagParcelado;
begin
   Table_PagParcelado.Close;
   Table_PagParcelado.Open;
   JvCaptionPanel_Parcelado.Visible:= false;
end;

procedure TForm_Fecha_Conta.Table_TabelaDePostosPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
    if (E is EDBEngineError) then
       if (E as EDBEngineError).Errors[0].ErrorCode = 9729 then
       begin
          MessageDlg('Já foi realizado pagamento parcelo para este hospede com a data selecionada...',mtWarning, [mbOK], 0);
          Abort;
          DBEdit_DataPagamento.SetFocus;
       end;
end;
procedure TForm_Fecha_Conta.ComboBox_Fonte_PagadoraChange(Sender: TObject);
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

end.
