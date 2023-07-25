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
  IBQuery, IBCustomDataSet, IBTable;

type
  TForm_Fecha_Conta = class(TForm)
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    StatusBar: TStatusBar;
    DST_Hospedagem: TDataSource;
    DST_Historico: TDataSource;
    DSQ_Tabela_Posto: TDataSource;
    Panel_Caixas: TPanel;
    Panel4: TPanel;
    Panel10: TPanel;
    Panel_Periodo: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel15: TPanel;
    Panel_Posto: TPanel;
    DST_Hospede: TDataSource;
    Panel17: TPanel;
    DBEdit_Posto: TDBEdit;
    DBEdit_QTD_Dependentes: TDBEdit;
    DST_Apto: TDataSource;
    DST_DisponibilizaCama: TDataSource;
    Query_Busca_Valor_Hospedagem0: TQuery;
    DataSource1: TDataSource;
    Panel13: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    StaticText_Valor_Total_Dependentes: TStaticText;
    Panel28: TPanel;
    DSQ_Busca_Valor_Residente: TDataSource;
    MaskEdit_Total_Pagar: TMaskEdit;
    Panel1: TPanel;
    DBText_Ficha: TDBText;
    DBText2: TDBText;
    DBText_Predio: TDBText;
    DBText_Apto: TDBText;
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
    DataSource2: TDataSource;
    DSQ_RegrasPagamento: TDataSource;
    RichEdit_RegraDesconto: TRichEdit;
    DataSource3: TDataSource;
    Label2: TLabel;
    MaskEdit_Ade: TMaskEdit;
    DST_PagParcelado: TDataSource;
    PopupMenu2: TPopupMenu;
    Alterar: TMenuItem;
    Excluir_Parcelado: TMenuItem;
    MaskEdit_Data_Saida: TJvDateEdit;
    JvCalcEdit1: TJvCalcEdit;
    IBTable_Hospedagem: TIBTable;
    IBTable_HospedagemIDENTIDADE: TIBStringField;
    IBTable_HospedagemFICHA: TIBStringField;
    IBTable_HospedagemANO: TSmallintField;
    IBTable_HospedagemPREDIO: TIBStringField;
    IBTable_HospedagemAPTO: TSmallintField;
    IBTable_HospedagemCAMA: TSmallintField;
    IBTable_HospedagemDATAENTRADA: TIBStringField;
    IBTable_HospedagemHORAENTRADA: TIBStringField;
    IBTable_HospedagemDATASAIDA: TIBStringField;
    IBTable_HospedagemDEPENDENTE: TSmallintField;
    IBTable_HospedagemSITUACAO_HOSPEDAGEM: TIBStringField;
    IBTable_HospedagemRECEBE: TIBStringField;
    IBTable_HospedagemDESCONTO: TIBStringField;
    IBTable_Hospede: TIBTable;
    IBTable_HospedeIDENTIDADE: TIBStringField;
    IBTable_HospedeNOME: TIBStringField;
    IBTable_HospedeNOME_GUERRA: TIBStringField;
    IBTable_HospedePOSTO: TIBStringField;
    IBTable_HospedeDEPENDENTE_DE: TIBStringField;
    IBTable_HospedeSITUACAO_CURSO: TIBStringField;
    IBTable_HospedeOM_ORIGEM: TIBStringField;
    IBTable_Historico: TIBTable;
    IBTable_HistoricoIDENTIDADE: TIBStringField;
    IBTable_HistoricoFICHA: TIBStringField;
    IBTable_HistoricoANO: TSmallintField;
    IBTable_HistoricoPREDIO: TIBStringField;
    IBTable_HistoricoAPTO: TSmallintField;
    IBTable_HistoricoHORAENTRADA: TIBStringField;
    IBTable_HistoricoNRECIBO: TIBStringField;
    IBTable_HistoricoBANCO: TIBStringField;
    IBTable_HistoricoNCHEQUE: TIBStringField;
    IBTable_HistoricoPRACA: TIBStringField;
    IBTable_HistoricoVALORPAGO: TIBBCDField;
    IBTable_HistoricoCUSTO_TELEFONE: TIBBCDField;
    IBTable_HistoricoUSUARIO_ENTRADA: TIBStringField;
    IBTable_HistoricoSITUACAO_CURSO: TIBStringField;
    IBTable_HistoricoUSUARIO_SAIDA: TIBStringField;
    IBTable_HistoricoTIPO_FECHAMENTO: TIBStringField;
    IBTable_HistoricoRECEBIDO: TIBStringField;
    IBTable_HistoricoOBS: TIBStringField;
    IBTable_HistoricoHORA_OPERACAO: TIBStringField;
    IBTable_HistoricoDATA_OPERACAO: TDateTimeField;
    IBTable_HistoricoDATAENTRADA: TDateTimeField;
    IBTable_HistoricoDATASAIDA: TDateTimeField;
    IBTable_HistoricoDATAPAGAMENTO: TDateTimeField;
    IBTable_Apto: TIBTable;
    IBTable_AptoPREDIO: TIBStringField;
    IBTable_AptoAPTO: TSmallintField;
    IBTable_AptoCAMA: TSmallintField;
    IBTable_AptoAPTCODIGO: TIBStringField;
    IBTable_AptoNOME: TIBStringField;
    IBTable_DisponibilizaCama: TIBTable;
    IBTable_DisponibilizaCamaPREDIO: TIBStringField;
    IBTable_DisponibilizaCamaAPTO: TSmallintField;
    IBTable_DisponibilizaCamaCAMA: TSmallintField;
    IBTable_DisponibilizaCamaAPTCODIGO: TIBStringField;
    IBTable_DisponibilizaCamaNOME: TIBStringField;
    IBTable_ExcluiDependente: TIBTable;
    IBTable_ExcluiDependenteIDENTIDADE: TIBStringField;
    IBTable_ExcluiDependenteFICHA: TIBStringField;
    IBTable_ExcluiDependenteANO: TSmallintField;
    IBTable_ExcluiDependentePREDIO: TIBStringField;
    IBTable_ExcluiDependenteAPTO: TSmallintField;
    IBTable_ExcluiDependenteCAMA: TSmallintField;
    IBTable_ExcluiDependenteNOME: TIBStringField;
    IBTable_ExcluiDependenteIDADE: TSmallintField;
    IBQuery_Tabela_Posto: TIBQuery;
    IBQuery_Tabela_PostoPREDIO: TIBStringField;
    IBQuery_Tabela_PostoPOSTOGRADUACAO: TIBStringField;
    IBQuery_Tabela_PostoINICIO: TSmallintField;
    IBQuery_Tabela_PostoTERMINO: TSmallintField;
    IBQuery_Tabela_PostoVALOR: TIBBCDField;
    IBQuery_Busca_Valor_Hospedagem: TIBQuery;
    IBQuery_Busca_Valor_HospedagemPREDIO: TIBStringField;
    IBQuery_Busca_Valor_HospedagemCODIGO: TIBStringField;
    IBQuery_Busca_Valor_HospedagemPOSTO: TIBStringField;
    IBQuery_Busca_Valor_HospedagemVALOR: TIBBCDField;
    IBQuery_Busca_Valor_Residente: TIBQuery;
    IBTable_Recibo: TIBTable;
    IBTable_ReciboNRECIBO: TIBStringField;
    IBTable_PagParcelado: TIBTable;
    IBTable_PagParceladoIDENTIDADE: TIBStringField;
    IBTable_PagParceladoFICHA: TIBStringField;
    IBTable_PagParceladoANO: TSmallintField;
    IBTable_PagParceladoDATAPAGAMENTO: TIBStringField;
    IBTable_PagParceladoVALOR: TIBBCDField;
    IBTable_PagParceladoNRECIBO: TIBStringField;
    IBTable_TabelaDePostos: TIBTable;
    IBQuery_RegrasPagamento: TIBQuery;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    SmallintField1: TSmallintField;
    SmallintField2: TSmallintField;
    IBBCDField1: TIBBCDField;
    IBQuery_Exclui_Hospedagem: TIBQuery;
    Label_Calculadora: TLabel;
    Panel3: TPanel;
    ToolButton_Calcular: TSpeedButton;
    ToolButton_Pag_Vista: TSpeedButton;
    ToolButton_Ignorar: TSpeedButton;
    ToolButton_Windows: TSpeedButton;
    ToolButton_Retornar: TSpeedButton;
    IBTable_HistoricoADE: TIBStringField;

    procedure AtualizaRecibo;
    procedure FormCreate(Sender: TObject);

    procedure CalculaParcelas;
    Procedure Tratamento(Status: Boolean);
    procedure Desabilita;
    procedure Habilita;
    procedure Gravar_Historico(Tipo_Fechamento: String; Recebimento: String);
    procedure Limpa_Apto;
    procedure Limpa_Campos;
    procedure Calcula_Hospede_Em_Transito;
    procedure Calcula_Hospede_Residente;
    procedure SetarBusca;
    procedure ToolButton_CalcularClick(Sender: TObject);
    procedure ToolButton_Pag_VistaClick(Sender: TObject);
    procedure ToolButton_PagamentoClick(Sender: TObject);
    procedure ToolButton_IgnorarClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure Excluir_ParceladoClick(Sender: TObject);
  private    { private declarations }
     VI_Recibo: integer;
     VR_ValorPago: Real;
  public    { public declarations }
  end;

var
  Form_Fecha_Conta: TForm_Fecha_Conta;

implementation

uses Cad_Hospede, Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento do Modulo principal
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.FormCreate(Sender: TObject);
begin
   RichEdit_RegraDesconto.Lines.Clear;
   MaskEdit_Data_Saida.Text:= DateToStr(Date);

   IBTable_Recibo.Open;
   IBTable_Hospedagem.Open;
   IBTable_Hospede.Open;
   IBTable_Historico.Open;
   IBTable_Apto.Open;
   IBTable_TabelaDePostos.Open;
   IBTable_DisponibilizaCama.Open;
   IBTable_ExcluiDependente.Open;
   IBTable_PagParcelado.Open;

   VR_ValorPago:= 0;

   //--- Verifica se possui pagamento parcelado

   CalculaParcelas;

   //   Query_Busca_Valor_Hospedagem.Open;

   Desabilita;
   Tratamento(False);
   Limpa_Campos;

   if Funcoes.GetPrivilegio = 'G' then
   begin
      MaskEdit_Referente.ReadOnly:= False;
      MaskEdit_Total_Pagar.ReadOnly:= False;
   end
   else
   begin
      MaskEdit_Referente.ReadOnly:= True;
      MaskEdit_Total_Pagar.ReadOnly:= True;
   end;

   if trim(IBTable_Hospede.FieldByName('POSTO').AsString) <> '' then
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

   if trim(DBText_Ficha.Caption) = '' then
   begin
      ShowMessage('Não foi selecionado o hospede...');
      Close;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para o botão Calcular
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.ToolButton_RetornarClick(Sender: TObject);
begin
   IBTable_Hospedagem.Close;
   IBTable_Hospede.Close;
   IBTable_Historico.Close;
   IBTable_Apto.Close;
   IBTable_DisponibilizaCama.Close;
   IBTable_ExcluiDependente.Close;
   IBQuery_Tabela_Posto.Close;
   IBTable_PagParcelado.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento do Botão Calcular
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.ToolButton_CalcularClick(Sender: TObject);
Var
   VS_Comando: String;
   VI_N_Diarias: Real;
begin
   Funcoes.Log_Recepcao('Fechamento da Conta - Calcular - '+DBText_Ficha.Caption+'-'+DBText_Predio.Caption+'-'+DBText_Apto.Caption);

   MaskEdit_Data_Saida.Enabled:= False;

    //---
   //--- Calculo do numero de diaria(s)

   VI_N_Diarias:= Funcoes.SubData(StrToDate(MaskEdit_Data_Saida.Text), IBTable_Hospedagem.FieldByName('DATAENTRADA').AsDateTime);
   if VI_N_Diarias = 0 then
      VI_N_Diarias:= 1
   else
      if ((IBTable_Hospedagem.FieldByName('HORAENTRADA').AsInteger >= 0) and
          (IBTable_Hospedagem.FieldByName('HORAENTRADA').AsInteger <= 500)) then
          VI_N_Diarias:= VI_N_Diarias+1;

   MaskEdit_N_Diarias.Caption:= FormatFloat('##0',VI_N_Diarias);

    //---
   //--- Tratamento quando for cortesia

   if IBTable_Hospedagem.FieldByName('Recebe').AsString = 'C' then
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

      if IBTable_Hospedagem.FieldByName('Recebe').AsString = 'T' then
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

         VI_Recibo:= Funcoes.MaiorCodigo('NRecibo', 'Recibo');
         MaskEdit_Recibo.Text:= Funcoes.NFicha(IntToStr(VI_Recibo));

          //---
         //--- Verifica se o posto/Graduacao esta na tabela de Preco

         VS_Comando:= 'Select predio, postoGraduacao, Inicio, Termino, Valor '+
                      'from regrasDeDiarias '+
                      'where postoGraduacao = '+#39+IBTable_TabelaDePostos.FieldByName('PostoGraduacao').AsString+#39+' '+
                      'and   predio = '+#39+trim(IBTAble_Hospedagem.FieldByName('Predio').AsString)+#39;

         IBQuery_RegrasPagamento.Close;
         IBQuery_RegrasPagamento.SQL.Clear;
         IBQuery_RegrasPagamento.SQL.Add(VS_Comando);
         IBQuery_RegrasPagamento.Open;

         if IBQuery_RegrasPagamento.RecordCount = 0 then
         begin
            MessageDlg('O Posto/Graduação '+trim(DBEdit_Posto.Text)+' não foi encontrado na tabela de preço do prédio '+trim(IBTable_Hospedagem.FieldByName('Predio').AsString)+' .'+#13+
                       'Verifique no cadastro do hóspede se o posto esta correto,'+#13+
                       'Caso não consiga corrigir entre em contato com pessoal da gerencia do hotel.', mtError,[mbOk], 0);
         end
         else
         begin
            if Trim(UpperCase(IBTable_Hospede.FieldByName('SITUACAO_CURSO').AsString)) = 'RESIDENTE' then
                Calcula_Hospede_Residente
            else
                Calcula_Hospede_Em_Transito;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Botão Imprimir
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.ToolButton_Pag_VistaClick(Sender: TObject);
var
   VS_Comando: String;
begin
   if ((trim(MaskEdit_Recibo.Text) = '') and (dm.Habilitado_Para <> 'UNIFA')) then
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

         if ((Funcoes.QtdRegistro(VS_Comando) > 0) and (dm.Habilitado_Para <> 'UNIFA')) then
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

procedure TForm_Fecha_Conta.ToolButton_PagamentoClick(Sender: TObject);
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
            IBTable_PagParcelado.Append;
            IBTable_PagParcelado.FieldByName('IDENTIDADE').AsString:= IBTable_Historico.FieldByName('IDENTIDADE').AsString;
            IBTable_PagParcelado.FieldByName('FICHA').AsString:= IBTable_Historico.FieldByName('FICHA').AsString;
            IBTable_PagParcelado.FieldByName('ANO').AsString:= IBTable_Historico.FieldByName('ANO').AsString;
            IBTable_PagParcelado.FieldByName('DATAPAGAMENTO').AsString:= MaskEdit_Data_Saida.Text;
            IBTable_PagParcelado.FieldByName('VALOR').AsString:= MaskEdit_Total_Pagar.Text;
            IBTable_PagParcelado.FieldByName('NRECIBO').AsString:= MaskEdit_Recibo.Text;
            IBTable_PagParcelado.Post;
            DM.IBTransaction_Hotel.CommitRetaining;

            //--- Atualiza o numero do recibo

            AtualizaRecibo;
            Form_Cad_Hospede.Monta_Mapa(1);
            Close;
       end;
    end;
end;

//------------------------------------------------------------------------------
// Este modulo tem a finalidade de atualizar o Numero do Recibo
//------------------------------------------------------------------------------

Procedure TForm_Fecha_Conta.AtualizaRecibo;
begin
   if StrToInt(MaskEdit_Recibo.Text) > StrToInt(Trim(IBTable_Recibo.FieldByName('NRecibo').AsString)) then
   begin
      IBTable_Recibo.Edit;
      IBTable_Recibo.FieldByName('NRecibo').AsString:= MaskEdit_Recibo.Text;
      IBTable_Recibo.Post;
      DM.IBTransaction_Hotel.CommitRetaining;
   end;
end;

//------------------------------------------------------------------------------
// Este modulo tem a finalidade de Desabiltar os Edit's de tratamento.
//------------------------------------------------------------------------------

Procedure TForm_Fecha_Conta.Tratamento(Status: Boolean);
begin
   MaskEdit_Recibo.Enabled:= Status;
   MaskEdit_Ade.Enabled:= Status;
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

   MaskEdit_Ade.Clear;
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
   ToolButton_Calcular.Enabled:= True;
   ToolButton_Ignorar.Enabled:= False;
   ToolButton_Pag_Vista.Enabled:= False;
   ToolButton_Retornar.Enabled:= True;
   ToolButton_Windows.Enabled:= True;
end;

//------------------------------------------------------------------------------
// Este modulo tem a finalidade de Habilitar os Botoes
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.Habilita;
begin
   ToolButton_Calcular.Enabled:= False;
   ToolButton_Ignorar.Enabled:= True;
   ToolButton_Pag_Vista.Enabled:= True;
   ToolButton_Retornar.Enabled:= False;
   ToolButton_Windows.Enabled:= False;
end;

//------------------------------------------------------------------------------
// Este modulo tem a finalidade de tratar o botao Ignorar
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.ToolButton_IgnorarClick(Sender: TObject);
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

procedure TForm_Fecha_Conta.Limpa_Apto;
var
   VS_Nome, VS_Situacao: String;
begin
   if RadioGroup_Ocupacao.ItemIndex = 0 then
   begin
      VS_Situacao:= 'NÃO OCUPAR';
      VS_Nome:= 'ARRUMAR';
   end
   else
   begin
      VS_Situacao:= IBTable_Hospedagem.FieldByName('Identidade').AsString;
      VS_Nome:= 'NÃO DESOCUPADO'
   end;

   if IBTable_Hospedagem.FieldByName('DEPENDENTE').AsInteger > 0 then
   begin
      IBTable_DisponibilizaCama.First;
      While not IBTable_DisponibilizaCama.eof do
      begin
         IBTable_DisponibilizaCama.Edit;
         IBTable_DisponibilizaCama.FieldByName('AptCodigo').AsString:= VS_Situacao;
         IBTable_DisponibilizaCama.FieldByName('Nome').AsString:= VS_Nome;
         IBTable_DisponibilizaCama.Post;
         DM.IBTransaction_Hotel.CommitRetaining;

         //--- Exclui o Dependente

         if IBTable_ExcluiDependente.RecordCount > 0 then
            IBTable_ExcluiDependente.Delete;

         IBTable_DisponibilizaCama.Next;
      end;
   end;


   IBTable_Apto.Edit;
   IBTable_Apto.FieldByName('AptCodigo').AsString:= VS_Situacao;
   IBTable_Apto.FieldByName('Nome').AsString:= VS_Nome;
   IBTable_Apto.Post;
   DM.IBTransaction_Hotel.CommitRetaining;

   IBTable_Hospedagem.Delete;
   DM.IBTransaction_Hotel.CommitRetaining;

   RadioGroup_Ocupacao.ItemIndex:= 0;
end;

//------------------------------------------------------------------------------
// Este modulo tem a finalidade de tratar o botao Ignorar
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.Gravar_Historico(Tipo_Fechamento: String; Recebimento: String);
var
   VS_Ficha, VS_Comando: String;
begin
   //---
   //--- Grava os dados finais para o historico

   VS_Ficha:= IBTable_Historico.FieldByName('Ficha').AsString;

   IBTable_Historico.Edit;
   IBTable_Historico.FieldByName('DATASAIDA').AsString:= MaskEdit_Data_Saida.Text;
   IBTable_Historico.FieldByName('USUARIO_SAIDA').AsString:= Funcoes.GetUsuario;

   if Recebimento = 'S' then
      IBTable_Historico.FieldByName('DATAPAGAMENTO').AsString:= MaskEdit_Data_Saida.Text
   else
      IBTable_Historico.FieldByName('DATAPAGAMENTO').AsString:= '';

   if Trim(MaskEdit_Recibo.Text) = '' then
      IBTable_Historico.FieldByName('NRECIBO').AsString:= ''
   else
      IBTable_Historico.FieldByName('NRECIBO').AsString:= Funcoes.NFicha(Trim(MaskEdit_Recibo.Text));

   IBTable_Historico.FieldByName('BANCO').AsString:= ComboBox_Banco.Text;
   IBTable_Historico.FieldByName('ADE').AsString:= MaskEdit_Ade.Text;
   IBTable_Historico.FieldByName('NCHEQUE').AsString:= MaskEdit_N_Cheque.Text;
   IBTable_Historico.FieldByName('PRACA').AsString:= MaskEdit_Praca.Text;
   IBTable_Historico.FieldByName('VALORPAGO').AsString:= MaskEdit_Total_Pagar.Text;
   IBTable_Historico.FieldByName('CUSTO_TELEFONE').AsString:= '0';
   IBTable_Historico.FieldByName('TIPO_FECHAMENTO').AsString:= Tipo_Fechamento;
   IBTable_Historico.FieldByName('RECEBIDO').AsString:= Recebimento;
   IBTable_Historico.FieldByName('OBS').AsString:= MaskEdit_Referente.Text;
   IBTable_Historico.FieldByName('SITUACAO_CURSO').AsString:= DBEdit_Situacao_Curso.Text;
   IBTable_Historico.FieldByName('Hora_Operacao').AsString:= TimeToStr(Time);
   IBTable_Historico.FieldByName('Data_Operacao').AsString:= DateToStr(Date);
   IBTable_Historico.FieldByName('SITUACAO_CURSO').AsString:= DBEdit_Situacao_Curso.Text;
   IBTable_Historico.Post;
   DM.IBTransaction_Hotel.CommitRetaining;

   Limpa_Apto;

    //---
   //--- Exclui o hospede

   IBQuery_Exclui_Hospedagem.Params[0].AsString:= VS_Ficha;
   IBQuery_Exclui_Hospedagem.ExecSql;

    //---
   //--- Exclui o hospede quando este for cadastrado por ficha

   VS_Comando:= 'Update aptocama set AptCodigo = '+#39+'DESOCUPADO'+#39+
                ', Nome = '+#39+' '+#39+
                ' Where AptCodigo = '+#39+trim(VS_Ficha)+#39;

   //--- Atualiza o numero do recibo

   AtualizaRecibo;

   Limpa_Campos;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.ToolButton_WindowsClick(Sender: TObject);
var
   hToken : THandle;
   pPrivileges : TTokenPrivileges;
   pOldPrivileges: TTokenPrivileges;
   Zero: DWord;
   ptZero: DWord;
   tResult: Boolean;
begin
   if Funcoes.GetPrivilegio = 'G' then
   begin
      Funcoes.Windows;
   end
   else
   begin
     if MessageDlg('Deseja sair do sistema e Desligar o Micro ?', mtConfirmation, [mbYes, mbNo], 1) = mrYes then
     begin
        //Checa a versão do Windows
        if Win32Platform = VER_PLATFORM_WIN32_NT then
        begin
           tResult := OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, hToken);
           if tResult then
              tResult := LookupPrivilegeValue(nil, 'SeShutdownPrivilege', pPrivileges.Privileges[0].Luid);
           pPrivileges.PrivilegeCount := 1;
           pPrivileges.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
           Zero := 0;
           ptZero := SizeOf(pOldPrivileges);
           if tResult then
              Windows.AdjustTokenPrivileges(hToken, False, pPrivileges, ptZero, pOldPrivileges, Zero);
        end;
        ExitWindowsEx(EWX_SHUTDOWN + EWX_FORCE, 0);
     end;
   end;
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

   if IBTable_Hospedagem.FieldByName('DEPENDENTE').AsInteger = 0 then
      MaskEdit_Referente.Text:= 'Proveniente de '+MaskEdit_N_Diarias.Caption+' diarias de hospedagem no Hotel do ICEA.'
   else
      MaskEdit_Referente.Text:= 'Proveniente de '+MaskEdit_N_Diarias.Caption+' diarias de hospedagem no Hotel do ICEA com '+IBTable_Hospedagem.FieldByName('DEPENDENTE').AsString+' dep.';

   //---
   //--- Calculando Valor Pagar

   VF_ValorPagar:= 0;
   VF_TotalPagar:=  0;

   if IBQuery_RegrasPagamento.RecordCount = 0 then
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

      IBQuery_RegrasPagamento.First;
      While ((not IBQuery_RegrasPagamento.Eof) and (VB_Calcular = True)) do
      begin
         VI_dias:= VI_Dias + 1;
         if VI_Dias > StrToInt(MaskEdit_N_Diarias.Caption) then
         begin
            VF_TotalPagar:= VF_TotalPagar + VF_ValorPagar;
            VB_Calcular:= False;
         end
         else
         begin
            if VI_dias > IBQuery_RegrasPagamento.FieldByName('TERMINO').AsInteger then
            begin
               VF_TotalPagar:= VF_TotalPagar + VF_ValorPagar;
               RichEdit_RegraDesconto.Lines.Add( '( Diaria de R$ '+Funcoes.LReplStr(FormatFloat('##0.00' ,IBQuery_RegrasPagamento.FieldByName('Valor').AsFloat), ' ', 6)+') '+
                                                    'Período de '+Funcoes.LReplStr(IBQuery_RegrasPagamento.FieldByName('Inicio').AsString, ' ', 3)+' a '+
                                                     Funcoes.LReplStr(IBQuery_RegrasPagamento.FieldByName('Termino').AsString, ' ', 3)+' -> '+
                                                     Funcoes.LReplStr(FormatFloat('####0.00',VF_ValorPagar), ' ', 8)
                                               );
               VF_ValorPagar:= 0;

               IBQuery_RegrasPagamento.Next;
            end;
         end;

         if VI_Des = 0 then
            VF_ValorPagar:= VF_ValorPagar + IBQuery_RegrasPagamento.FieldByName('Valor').AsFloat
         else
            VI_Des:= VI_Des - 1;
      end;

       if IBQuery_RegrasPagamento.FieldByName('Valor').AsFloat > 0 then
       begin
         VF_ValorPagar:= VF_ValorPagar - IBQuery_RegrasPagamento.FieldByName('Valor').AsFloat;
         RichEdit_RegraDesconto.Lines.Add( '( Diaria de R$ '+Funcoes.LReplStr(FormatFloat('##0.00' ,IBQuery_RegrasPagamento.FieldByName('Valor').AsFloat), ' ', 6)+') '+
                                           'Período de '+Funcoes.LReplStr(IBQuery_RegrasPagamento.FieldByName('Inicio').AsString, ' ', 3)+' a '+
                                           Funcoes.LReplStr(MaskEdit_N_Diarias.Caption, ' ', 3)+' -> '+
                                           Funcoes.LReplStr(FormatFloat('####0.00',VF_ValorPagar), ' ', 8)
                                          );
       end;
       //---
      //--- Calculando o valor total de dependentes

      VF_Valor:= VF_TotalPagar * 0.50;
      VF_Valor:= (VF_Valor*IBTable_Hospedagem.FieldByName('DEPENDENTE').AsFloat);
      StaticText_Valor_Total_Dependentes.Caption:= FormatFloat('####0.00',VF_Valor);

      //--- Calcula das Diarias

      if Form_Cad_Hospede.RadioGroup_Desconto.ItemIndex = 1 then
      begin
         VF_TotalPagar:= VF_TotalPagar/2;
         RichEdit_RegraDesconto.Lines.Add( 'Desconto de----------------------------------> '+
                                            Funcoes.LReplStr(FormatFloat('####0.00',VF_TotalPagar), ' ', 8)
                                          );

      end;

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
   VS_ValorDiarias, VS_Comando: String;
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

   if trim(IBTable_Hospede.FieldByName('POSTO').AsString) <> '' then
   begin
      VS_Comando:= 'Select * from Residente '+
                   ' Where Posto = '+#39+IBTable_Hospede.FieldByName('POSTO').AsString+#39;
   end
   else
   begin
      VS_Comando:= 'Select * from Residente '+
                   ' Where Posto = '+#39+IBTable_Hospede.FieldByName('DEPENDENTE_DE').AsString+#39;
   end;

   IBQuery_Busca_Valor_Residente.Close;
   IBQuery_Busca_Valor_Residente.SQL.Clear;
   IBQuery_Busca_Valor_Residente.SQL.Add(VS_Comando);
   IBQuery_Busca_Valor_Residente.Open;

   VS_ValorDiarias:= FormatFloat('###.00',IBQuery_Busca_Valor_Residente.FieldByName('Valor').AsFloat);

    //---
   //--- Calculando o valor total a pagar

//   if TerminoDia = UltimoDiaDoMes then   // Calcular Parcial
   if StrToFloat(Tempo) >= 30 then
   begin
      RichEdit_RegraDesconto.Lines.Add( ' Diaria de R$ '+Funcoes.LReplStr(FormatFloat('####0.00', StrToFloat(VS_ValorDiarias)), ' ', 8));
      Dias:= '';

      if IBTable_Hospedagem.FieldByName('DEPENDENTE').AsInteger = 0 then
          MaskEdit_Referente.Text:= 'Proveniente de diarias de Residente no Hotel do ICEA.'
      else
         MaskEdit_Referente.Text:= 'Proveniente de diarias de Residente no Hotel do ICEA com '+IBTable_Hospedagem.FieldByName('DEPENDENTE').AsString+' dep.';
   end
   else
   begin
      RichEdit_RegraDesconto.Lines.Add( 'Valor da Diaria R$ '+Funcoes.LReplStr(FormatFloat('####0.00', StrToFloat(VS_ValorDiarias)), ' ', 8));
      ValorDiaria:= StrToFloat(VS_ValorDiarias)/UltimoDiaDoMes;
      ValorDiaria:= ValorDiaria*StrToFloat(Tempo);
      VS_ValorDiarias:= FormatFloat('###.00',ValorDiaria);
      Dias:= tempo;
      RichEdit_RegraDesconto.Lines.Add( 'Diaria proporcionais a '+Dias+' dias - R$ '+Funcoes.LReplStr(FormatFloat('####0.00', StrToFloat(VS_ValorDiarias)), ' ', 8));

      if IBTable_Hospedagem.FieldByName('DEPENDENTE').AsInteger = 0 then
          MaskEdit_Referente.Text:= 'Proveniente de '+Tempo+' diarias proporcionais de Residente no Hotel do ICEA.'
      else
         MaskEdit_Referente.Text:= 'Proveniente de '+Tempo+' diarias  proporcionais de Residente no Hotel do ICEA com '+IBTable_Hospedagem.FieldByName('DEPENDENTE').AsString+' dep.';
   end;

    //---
   //--- Calculando o valor total de dependentes

   VF_Valor:= StrToFloat(VS_ValorDiarias) * 0.20;
   VF_Valor:= (VF_Valor*IBTable_Hospedagem.FieldByName('DEPENDENTE').AsFloat);

   StaticText_Valor_Total_Dependentes.Caption:= FormatFloat('####0.00',VF_Valor);
   VS_ValorDiarias:= FloatToStr(StrToFloat(VS_ValorDiarias)+VF_Valor);

   MaskEdit_Total_Pagar.Text:= FormatFloat('####0.00',StrToFloat(VS_ValorDiarias));

   Habilita;
   Tratamento(True);
   MaskEdit_Recibo.setfocus;
end;

//------------------------------------------------------------------------------
// Tratamento para calcular o montante que ira pagar
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.CalculaParcelas;
var
   VF_Valor, VF_TotalPagar, VF_ValorPagar: Real;
   VB_Calcular: Boolean;

   VR_NDiarias: real;
   VI_Des, VI_dias: integer;
   VS_Comando: String;
begin
   VS_Comando:= 'Select predio, PostoGraduacao, Inicio, Termino, Valor '+
                'from regrasDeDiarias '+
                'where PostoGraduacao = '+#39+IBTable_TabelaDePostos.FieldByName('PostoGraduacao').AsString+#39+' '+
                'and   predio = '+#39+trim(IBTable_Hospedagem.FieldByName('Predio').AsString)+#39;

   IBQuery_RegrasPagamento.Close;
   IBQuery_RegrasPagamento.SQL.Clear;
   IBQuery_RegrasPagamento.SQL.Add(VS_Comando);
   IBQuery_RegrasPagamento.Open;

   if IBQuery_RegrasPagamento.RecordCount = 0 then
   begin
      MessageDlg('O Posto/Graduação '+trim(DBEdit_Posto.Text)+' não foi encontrado na tabela de preço do prédio '+trim(IBTable_Hospedagem.FieldByName('Predio').AsString)+' .'+#13+
                 'Verifique no cadastro do hóspede se o posto esta correto,'+#13+
                 'Caso não consiga corrigir entre em contato com pessoal da gerencia do hotel.', mtError,[mbOk], 0);
      Close;
   end
   else
   begin

       //---
      //--- Calculando Valor Pagar

      VF_ValorPagar:= 0;
      VF_TotalPagar:=  0;

      if IBQuery_RegrasPagamento.RecordCount = 0 then
      begin
         RichEdit_RegraDesconto.Lines.Add( 'Não existe regra de Pagamento.');
      end
      else
      begin
         VB_Calcular:= True;
         VI_dias:= 0;

         VR_NDiarias:= Funcoes.SubData(StrToDate(IBTable_Hospedagem.FieldByName('DataSaida').AsString ), StrToDate(DBEdit_Data_Entrada.Text));
         if VR_NDiarias >= 11 then
         begin
            VI_Des:= 3;
         end
         else
         begin
            VI_Des:= 0;
         end;

         //--- Calcula valor total de pagamento

         IBQuery_RegrasPagamento.First;
         While ((not IBQuery_RegrasPagamento.Eof) and (VB_Calcular = True)) do
         begin
            VI_dias:= VI_Dias + 1;
            if VI_Dias > VR_NDiarias then
            begin
               VF_TotalPagar:= VF_TotalPagar + VF_ValorPagar;
               VB_Calcular:= False;
            end
            else
            begin
               if VI_dias > IBQuery_RegrasPagamento.FieldByName('TERMINO').AsInteger then
               begin
                  VF_TotalPagar:= VF_TotalPagar + VF_ValorPagar;
                  VF_ValorPagar:= 0;

                  IBQuery_RegrasPagamento.Next;
               end;
            end;

            if VI_Des = 0 then
               VF_ValorPagar:= VF_ValorPagar + IBQuery_RegrasPagamento.FieldByName('Valor').AsFloat
            else
               VI_Des:= VI_Des - 1;
         end;

          //---
         //--- Calculando o valor total de dependentes

         VF_Valor:= VF_TotalPagar * 0.50;
         VF_Valor:= (VF_Valor*IBTable_Hospedagem.FieldByName('DEPENDENTE').AsFloat);

         VF_TotalPagar:= VF_TotalPagar+VF_Valor;
      end;
   end;

end;

procedure TForm_Fecha_Conta.Excluir_ParceladoClick(Sender: TObject);
begin
   if MessageDlg('Confirma a exclusão ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      IBTable_PagParcelado.Delete;
      CalculaParcelas;
   end;

end;

end.
