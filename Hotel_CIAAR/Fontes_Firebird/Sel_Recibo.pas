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
  StdCtrls, Forms, DBCtrls, DB, Mask, ComCtrls, Grids, DBGrids,
  Buttons, ExtCtrls, Rotinas, JvGradient, ToolWin, IBCustomDataSet,
  IBTable, IBQuery;

type
  TForm_Fecha_Conta = class(TForm)
    Panel2: TPanel;
    ScrollBox: TScrollBox;
    StatusBar: TStatusBar;
    DST_Hospedagem: TDataSource;
    DST_Historico: TDataSource;
    DST_Table_Tabela_Posto: TDataSource;
    Panel_Caixas: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel_Periodo: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel_Valor_Diaria: TPanel;
    Panel_Total_Sem_Desconto: TPanel;
    Panel16: TPanel;
    Panel_Desconto: TPanel;
    Panel18: TPanel;
    Panel_Valor_Desconto: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel15: TPanel;
    Panel_Posto: TPanel;
    DST_Hospede: TDataSource;
    Panel17: TPanel;
    DBEdit_Posto: TDBEdit;
    DST_Apto: TDataSource;
    DST_DisponibilizaCama: TDataSource;
    Panel14: TPanel;
    Edit_Valor_Diarias: TStaticText;
    Edit_Total_Sem_Desconto: TStaticText;
    Edit_Desconto: TStaticText;
    Edit_Valor_Desconto: TStaticText;
    Panel13: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel22: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    StaticText_Valor_Total_Dependentes: TStaticText;
    MaskEdit_Gasto_Telefone: TMaskEdit;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel31: TPanel;
    StaticText_Diarias_Pagar: TStaticText;
    DSQ_Busca_Valor_Residente: TDataSource;
    MaskEdit_Total_Pagar: TMaskEdit;
    Panel1: TPanel;
    DBText1: TDBText;
    DBText_Nome: TDBText;
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
    MaskEdit_Data_Saida: TMaskEdit;
    Label_Data_saida: TLabel;
    DBEdit_Data_Entrada: TDBEdit;
    Label_Data_Inicio: TLabel;
    DBEdit_Situacao_Curso: TDBEdit;
    Label1: TLabel;
    ToolBar4: TToolBar;
    ToolButton_Calcular: TToolButton;
    ToolButton_Pag_Vista: TToolButton;
    ToolButton_Pagamento: TToolButton;
    ToolButton_Ignorar: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    IBQuery_Busca_Valor_Hospedagem: TIBQuery;
    IBTable_Recibo: TIBTable;
    IBQuery_Busca_Valor_Residente: TIBQuery;
    IBTable_ReciboNRECIBO: TIBStringField;
    IBTable_Hospedagem: TIBTable;
    IBQuery_Tabela_Posto: TIBQuery;
    IBQuery_Tabela_PostoPREDIO: TIBStringField;
    IBQuery_Tabela_PostoVALOR: TIBBCDField;
    IBQuery_Tabela_PostoPOSTO: TIBStringField;
    IBQuery_Tabela_PostoCODIGO: TIBStringField;
    IBQuery_Exclui_Hospedagem: TIBQuery;
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
    IBTable_Historico: TIBTable;
    IBTable_Apto: TIBTable;
    IBTable_DisponibilizaCama: TIBTable;
    IBTable_HospedeIDENTIDADE: TIBStringField;
    IBTable_HospedeNOME: TIBStringField;
    IBTable_HospedeNOME_GUERRA: TIBStringField;
    IBTable_HospedePOSTO: TIBStringField;
    IBTable_HospedeDEPENDENTE_DE: TIBStringField;
    IBTable_HospedeSITUACAO_CURSO: TIBStringField;
    IBTable_HospedeOM_ORIGEM: TIBStringField;
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
    IBTable_AptoPREDIO: TIBStringField;
    IBTable_AptoAPTO: TSmallintField;
    IBTable_AptoCAMA: TSmallintField;
    IBTable_AptoAPTCODIGO: TIBStringField;
    IBTable_AptoNOME: TIBStringField;
    IBTable_DisponibilizaCamaPREDIO: TIBStringField;
    IBTable_DisponibilizaCamaAPTO: TSmallintField;
    IBTable_DisponibilizaCamaCAMA: TSmallintField;
    IBTable_DisponibilizaCamaAPTCODIGO: TIBStringField;
    IBTable_DisponibilizaCamaNOME: TIBStringField;
    IBTable_Dependente: TIBTable;
    IBTable_DependenteIDENTIDADE: TIBStringField;
    IBTable_DependenteFICHA: TIBStringField;
    IBTable_DependenteANO: TSmallintField;
    IBTable_DependentePREDIO: TIBStringField;
    IBTable_DependenteAPTO: TSmallintField;
    IBTable_DependenteCAMA: TSmallintField;
    IBTable_DependenteNOME: TIBStringField;
    IBTable_DependenteIDADE: TSmallintField;
    DST_Dependente: TDataSource;
    Label_QTD_Dependentes: TLabel;
    Label2: TLabel;
    MaskEdit_HoraSaida: TMaskEdit;
    IBTable_HistoricoDATAENTRADA: TDateTimeField;
    IBTable_HistoricoDATASAIDA: TDateTimeField;
    IBTable_HistoricoDATAPAGAMENTO: TDateTimeField;
    IBTable_ExcluiDependente: TIBTable;
    DataSource1: TDataSource;
    IBTable_ExcluiDependenteIDENTIDADE: TIBStringField;
    IBTable_ExcluiDependenteFICHA: TIBStringField;
    IBTable_ExcluiDependenteANO: TSmallintField;
    IBTable_ExcluiDependentePREDIO: TIBStringField;
    IBTable_ExcluiDependenteAPTO: TSmallintField;
    IBTable_ExcluiDependenteCAMA: TSmallintField;
    IBTable_ExcluiDependenteNOME: TIBStringField;
    IBTable_ExcluiDependenteIDADE: TSmallintField;
    IBQuery_Busca_Valor_HospedagemPREDIO: TIBStringField;
    IBQuery_Busca_Valor_HospedagemCODIGO: TIBStringField;
    IBQuery_Busca_Valor_HospedagemPOSTO: TIBStringField;
    IBQuery_Busca_Valor_HospedagemVALOR: TIBBCDField;

    procedure FormCreate(Sender: TObject);

    procedure MaskEdit_Gasto_TelefoneExit(Sender: TObject);
    procedure MaskEdit_Gasto_TelefoneKeyPress(Sender: TObject; var Key: Char);

    Procedure Tratamento(Status: Boolean);
    procedure Desabilita;
    procedure Habilita;
    procedure Gravar_Historico(Tipo_Fechamento: String; Recebimento: String);
    procedure Limpa_Apto;
    procedure Limpa_Campos;
    procedure Calcula_Total_Pagar;
    procedure Calcula_Hospede_Em_Transito;
    procedure Calcula_Hospede_Residente;
    procedure Calcula_Hospede_Em_TransitoDesconto;
    procedure Calcula_Hospede_VisitaEsp;

    procedure SetarBusca;
    procedure ToolButton_CalcularClick(Sender: TObject);
    procedure ToolButton_Pag_VistaClick(Sender: TObject);
    procedure ToolButton_PagamentoClick(Sender: TObject);
    procedure ToolButton_IgnorarClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
  private    { private declarations }
     VI_Recibo: integer;
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
var
   VR_QtdDep: Real;
begin
   ToolButton_Pagamento.Visible:= UtilizaOpcaoParaPagamento;

   MaskEdit_HoraSaida.Text:= Funcoes.HoraAtual;
   MaskEdit_Data_Saida.Text:= DateToStr(Date);

   IBTable_Recibo.Open;
   IBTable_Hospedagem.Open;
   IBTable_Hospede.Open;
   IBTable_Historico.Open;
   IBTable_Apto.Open;
   IBTable_DisponibilizaCama.Open;
   IBTable_Dependente.Open;
   IBTable_ExcluiDependente.Open;
   IBQuery_Busca_Valor_Hospedagem.Open;

   Desabilita;
   Tratamento(False);
   Limpa_Campos;

   if DM.Habilitado_Para = 'HOTEL CTA' then
   begin
      //--- Encontra os dependentes pagantes
      VR_QtdDep:= 0;
      IBTable_Dependente.First;
      While not IBTable_Dependente.Eof do
      begin
         if Trim(IBTable_Dependente.FieldByName('Idade').AsString) = '' then
         begin
             MessageDlg('Não é possível Realizar o Calculo, existe Dependente que não foi Cadastrado a Idade'+#13+
                        'para Fechar a Conta cadastrar a Idade do Dependente...', mtInformation,[mbOk], 0);
             ToolButton_Calcular.Enabled:= False;
             ToolButton_RetornarClick(Sender);
         end
         else
         begin
            if IBTable_Dependente.FieldByName('Idade').AsInteger > 6 then
               VR_QtdDep:= VR_QtdDep+1;
            IBTable_Dependente.Next;
         end;
      end;

      Label_QTD_Dependentes.Caption:= Trim(FloatToStr( VR_QtdDep));
   end
   else
   begin
      if DM.Habilitado_Para = 'CIAAR' then
      begin
          //--- Encontra os dependentes pagantes
          VR_QtdDep:= 0;
          IBTable_Dependente.First;
          While not IBTable_Dependente.Eof do
          begin
          if Trim(IBTable_Dependente.FieldByName('Idade').AsString) = '' then
            begin
             MessageDlg('Não é possível Realizar o Calculo, existe Dependente que não foi Cadastrado a Idade'+#13+
                           'para Fechar a Conta cadastrar a Idade do Dependente...', mtInformation,[mbOk], 0);
                ToolButton_Calcular.Enabled:= False;
                ToolButton_RetornarClick(Sender);
            end
            else
            begin
                if IBTable_Dependente.FieldByName('Idade').AsInteger >= 6 then
                    VR_QtdDep:= VR_QtdDep+1;
                IBTable_Dependente.Next;
            end;
          end;

         Label_QTD_Dependentes.Caption:= Trim(FloatToStr( VR_QtdDep));
      end
      else
      begin
         Label_QTD_Dependentes.Caption:= IBTable_Hospedagem.FieldByname('Dependente').AsString;
      end;
   end;

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
   IBTable_Dependente.Close;
   IBTable_ExcluiDependente.Close;

   IBQuery_Tabela_Posto.Close;
   IBQuery_Busca_Valor_Hospedagem.Close;
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
   MaskEdit_Data_Saida.Enabled:= False;
   MaskEdit_Gasto_Telefone.Enabled:= False;

    //---
   //--- Calculo do numero de diaria(s)

   VI_N_Diarias:= Funcoes.SubData(StrToDate(MaskEdit_Data_Saida.Text), IBTable_Hospedagem.FieldByName('DATAENTRADA').AsDateTime);
   if ((IBTable_Hospedagem.FieldByName('HORAENTRADA').AsInteger >= 0) and
       (IBTable_Hospedagem.FieldByName('HORAENTRADA').AsInteger <= 500)) then
   begin
      VI_N_Diarias:= VI_N_Diarias+1;
   end;

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
   begin      //--- Pagamento deve ser na tesouraria
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

         VS_Comando:= 'select tpr.predio, tpr.valor, tpo.posto, tpo.codigo '+
                      'from tabela_preco tpr, tabela_posto tpo '+
                      'where (tpr.codigo = tpo.codigo) '+
                      'and (tpo.posto = '+#39+trim(DBEdit_Posto.Text)+#39+' '+
                      'and  tpr.predio = '+#39+trim(IBTable_Hospedagem.FieldByName('Predio').AsString)+#39+')';

         IBQuery_Tabela_Posto.Close;
         IBQuery_Tabela_Posto.SQL.Clear;
         IBQuery_Tabela_Posto.SQL.Add(VS_Comando);
         IBQuery_Tabela_Posto.Open;

         if IBQuery_Tabela_Posto.RecordCount = 0 then
         begin
            MessageDlg('O Posto/Graduação '+trim(DBEdit_Posto.Text)+' não foi encontrado na tabela de preço do '+PredioAndar+trim(IBTable_Hospedagem.FieldByName('Predio').AsString)+' .'+#13+
                       'Verifique no cadastro do hóspede se o posto esta correto,'+#13+
                       'Caso não consiga corrigir entre em contato com pessoal da gerencia do hotel.', mtError,[mbOk], 0);
         end
         else
         begin
            if DM.Habilitado_Para = 'HOTEL CTA' then
            begin
               if ((Trim(UpperCase(IBTable_Hospede.FieldByName('SITUACAO_CURSO').AsString)) = 'RESIDENTE') or
                   (Trim(UpperCase(IBTable_Hospede.FieldByName('SITUACAO_CURSO').AsString)) = 'CURSO PNR')) then
                   Calcula_Hospede_Residente
               else
                  if ((Trim(UpperCase(IBTable_Hospede.FieldByName('SITUACAO_CURSO').AsString)) = 'TRANSITO') or
                      (Trim(UpperCase(IBTable_Hospede.FieldByName('SITUACAO_CURSO').AsString)) = 'CURSO<30D')) then
                      Calcula_Hospede_Em_Transito
                  else
                     if (Trim(UpperCase(IBTable_Hospede.FieldByName('SITUACAO_CURSO').AsString)) = 'CURSO>30D') then
                        Calcula_Hospede_Em_TransitoDesconto
                     else
                        Calcula_Hospede_VisitaEsp;
            end
            else
            begin
               if DM.Habilitado_Para = 'BASE AREA MANAUS' then
               begin
                  if ((VI_N_Diarias > 21) and (VI_N_Diarias > 30)) then
                      Calcula_Hospede_Residente
                  else
                     if Trim(UpperCase(IBTable_Hospede.FieldByName('SITUACAO_CURSO').AsString)) = 'RESIDENTE' then
                         Calcula_Hospede_Residente
                     else
                         Calcula_Hospede_Em_Transito;
               end
               else
               begin
                  if ((DM.Habilitado_Para = 'NATAL') or (DM.Habilitado_Para = 'CIAAR')) then
                  begin
                     if Trim(UpperCase(IBTable_Hospede.FieldByName('SITUACAO_CURSO').AsString)) = 'RESIDENTE' then
                         Calcula_Hospede_Residente
                     else
                        Calcula_Hospede_Em_Transito;
                  end;
               end;
            end;
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
                      #39+trim(Funcoes.NFicha(Trim(MaskEdit_Recibo.Text)))+#39+
                      ' and ano = '+#39+Funcoes.AnoAtual+#39;

         if Funcoes.QtdRegistro(VS_Comando) > 0 then
         begin
            MessageDlg('O Nº Recibo fornecido já existe, '+#13+'VERIFICAR se o número do recibo esta correto...', mtInformation,[mbOk], 0);
            MaskEdit_Recibo.setfocus;
         end
         else
         begin
            if MessageDlg('Confirma o fechamento da hospedagem com pagamento a vista ?',mtConfirmation, [mbYes, mbNo], 1) = mrYes then
            begin
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
         else
         begin
            if trim(MaskEdit_N_Cheque.Text) = '' then
            begin
               MessageDlg('O Nº do cheque não pode ser branco.', mtInformation,[mbOk], 0);
               VB_Gravar:= False;
               MaskEdit_N_Cheque.setfocus;
            end
            else
            begin
               if trim(ComboBox_Banco.Text) = '' then
               begin
                  MessageDlg('O nome do banco não pode ser branco.', mtInformation,[mbOk], 0);
                  VB_Gravar:= False;
                  ComboBox_Banco.setfocus;
               end
               else
               begin
                  if trim(MaskEdit_Praca.Text) = '' then
                  begin
                     MessageDlg('O nome da praça não pode ser branco.', mtInformation,[mbOk], 0);
                     VB_Gravar:= False;
                     MaskEdit_Praca.setfocus;
                  end
               end;
            end;
         end;
      end;

      if VB_Gravar = True Then
      begin
         if MessageDlg('Confirma o fechamento da hospedagem com cheque p/p ?',mtConfirmation, [mbYes, mbNo], 1) = mrYes then
         begin
            MaskEdit_Recibo.Text:= Funcoes.NFicha(MaskEdit_Recibo.Text);
            Gravar_Historico('F', 'P');
            Tratamento(False);
            SetarBusca;
            Desabilita;

            Form_Cad_Hospede.Monta_Mapa(1);
            Close;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Este modulo tem a finalidade de Desabiltar os Edit's de tratamento.
//------------------------------------------------------------------------------

Procedure TForm_Fecha_Conta.Tratamento(Status: Boolean);
begin
   MaskEdit_Recibo.Enabled:= Status;
   MaskEdit_N_Cheque.Enabled:= Status;
   ComboBox_Banco.Enabled:= Status;
   MaskEdit_Praca.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Este modulo tem a finalidade de limpar os campos de entrada de informacoes
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.Limpa_Campos;
begin
   Edit_Valor_Diarias.Caption:= '0,00';
   Edit_Total_Sem_Desconto.Caption:= '0,00';
   Edit_Desconto.Caption:= '0';
   Edit_Valor_Desconto.Caption:= '0,00';
   StaticText_Valor_Total_Dependentes.Caption:= '0,00';
   StaticText_Diarias_Pagar.Caption:= '0,00';
   MaskEdit_Gasto_Telefone.Text:= '0,00';
   MaskEdit_Total_Pagar.Text:= '0,00';

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
   ToolButton_Pagamento.Enabled:= False;
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
   ToolButton_Pagamento.Enabled:= True;
   ToolButton_Retornar.Enabled:= False;
   ToolButton_Windows.Enabled:= False;
end;

//------------------------------------------------------------------------------
// Este modulo tem a finalidade de tratar o botao Ignorar
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.ToolButton_IgnorarClick(Sender: TObject);
begin
   if MessageDlg('Confirma o cancelamento do fechamento do conta ?',mtConfirmation, [mbYes, mbNo], 1) = mrYes then
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
   MaskEdit_Gasto_Telefone.Enabled:= True;
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

         //--- Exclui o Dependente
         
         if IBTable_ExcluiDependente.RecordCount > 0 then
         begin
            IBTable_ExcluiDependente.Delete;
         end;
         IBTable_DisponibilizaCama.Next;
      end;
   end;
   DM.IBTransaction_Hotel.CommitRetaining;

   IBTable_Apto.Edit;
   IBTable_Apto.FieldByName('AptCodigo').AsString:= VS_Situacao;
   IBTable_Apto.FieldByName('Nome').AsString:= VS_Nome;
   IBTable_Apto.Post;
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
   IBTable_Historico.FieldByName('NCHEQUE').AsString:= MaskEdit_N_Cheque.Text;
   IBTable_Historico.FieldByName('PRACA').AsString:= MaskEdit_Praca.Text;
   IBTable_Historico.FieldByName('VALORPAGO').AsString:= MaskEdit_Total_Pagar.Text;
   IBTable_Historico.FieldByName('CUSTO_TELEFONE').AsString:= MaskEdit_Gasto_Telefone.Text;
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
   DM.IBTransaction_Hotel.CommitRetaining;

    //---
   //--- Exclui o hospede quando este for cadastrado por ficha

   VS_Comando:= 'Update aptocama set AptCodigo = '+#39+'NÃO OCUPAR'+#39+
                ', Nome = '+#39+'ARRUMAR'+#39+
                ' Where AptCodigo = '+#39+trim(VS_Ficha)+#39;
   Funcoes.ExecSql_Servidor(VS_Comando);

   //--- Atualiza o numero do recibo

   IBTable_Recibo.Open;
   IBTable_Recibo.First;
   if Trim(IBTable_Recibo.FieldByName('NRecibo').AsString) <> '' then
   begin
      if VI_Recibo > StrToInt(Trim(IBTable_Recibo.FieldByName('NRecibo').AsString)) then
      begin
         IBTable_Recibo.Edit;
         IBTable_Recibo.FieldByName('NRecibo').Asinteger:= VI_Recibo;
         IBTable_Recibo.Post;
         DM.IBTransaction_Hotel.CommitRetaining;
      end;
   end
   else
   begin
      ShowMessage('Pedir para administração ajustar o número do Recibo...');
   end;

   Limpa_Campos;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento Telefone
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.MaskEdit_Gasto_TelefoneExit(Sender: TObject);
begin
   Calcula_Total_Pagar;
end;

procedure TForm_Fecha_Conta.MaskEdit_Gasto_TelefoneKeyPress(
  Sender: TObject; var Key: Char);
begin
    if Key = #13 then
       Calcula_Total_Pagar;
end;

//------------------------------------------------------------------------------
// Calculando o valor total a pagar
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.Calcula_Total_Pagar;
Var
   VF_Valor: Real;
begin
   MaskEdit_Gasto_Telefone.Text:= FormatFloat('####0.00',StrToFloat(MaskEdit_Gasto_Telefone.Text));
   VF_Valor:= StrToFloat(StaticText_Diarias_Pagar.Caption)+
              StrToFloat(MaskEdit_Gasto_Telefone.Text);

   MaskEdit_Total_Pagar.Text:= FormatFloat('####0.00',VF_Valor);
end;

//------------------------------------------------------------------------------
// Calcula o hospede que esta em transito
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.Calcula_Hospede_Em_Transito;
var
   VS_Comando: String;
   VR_QtdDep, VF_ValorDesconto, VF_Valor: Real;
begin
   VR_QtdDep:= StrToFloat(Label_QTD_Dependentes.Caption);

   if StrToInt(trim(MaskEdit_HoraSaida.Text)) >= 1400 then
      MaskEdit_N_Diarias.Caption:= IntToStr(StrToInt(MaskEdit_N_Diarias.Caption)+1);

    //---
   //--- Calculo do Pagamento

   VS_Comando:= 'Select * from Tabela_Preco '+
                ' Where Predio = '+#39+IBTable_Hospedagem.FieldByName('Predio').AsString+#39+
                ' and Codigo = '+#39+IBQuery_Tabela_Posto.FieldByName('CODIGO').AsString+#39;

   IBQuery_Busca_Valor_Hospedagem.Close;
   IBQuery_Busca_Valor_Hospedagem.SQL.Clear;
   IBQuery_Busca_Valor_Hospedagem.SQL.Add(VS_Comando);
   IBQuery_Busca_Valor_Hospedagem.Open;

   if IBTable_Hospedagem.FieldByName('DEPENDENTE').AsInteger = 0 then
      MaskEdit_Referente.Text:= 'Proveniente de '+MaskEdit_N_Diarias.Caption+' diarias de hospedagem no Hotel.'
   else
   begin
      MaskEdit_Referente.Text:= 'Proveniente de '+MaskEdit_N_Diarias.Caption+' diarias de hospedagem no Hotel com '+Trim(FloatToStr(VR_QtdDep))+' dep.';
   end;

   Edit_Valor_Diarias.Caption:= FormatFloat('###.00',IBQuery_Busca_Valor_Hospedagem.FieldByName('Valor').AsFloat);

    //---
   //--- Calculando Desconto

   if DM.Habilitado_Para = 'HOTEL CTA' then
   begin
      VF_ValorDesconto:= 0;
      Edit_Desconto.Caption:= '0 dia';
   end
   else
   begin
      if DM.Habilitado_Para = 'BASE AREA MANAUS' then
      begin
         VF_ValorDesconto:= 0;
         Edit_Desconto.Caption:= '0 dia';
      end
      else
      begin
         if DM.Habilitado_Para = 'NATAL' then
         begin
            VF_ValorDesconto:= 0;
            Edit_Desconto.Caption:= '0 dia';
         end
         else
         begin
            if DM.Habilitado_Para = 'CIAAR' then
            begin
               VF_ValorDesconto:= 0;
               Edit_Desconto.Caption:= '0 dia';
            end;
         end;
      end;
   end;

    //---
   //--- Calculando o total sem desconto

   Edit_Total_Sem_Desconto.Caption:= FormatFloat('####0.00',StrToFloat(MaskEdit_N_Diarias.Caption)*StrToFloat(Edit_Valor_Diarias.Caption));

    //---
   //--- Calculando do desconto

   Edit_Valor_Desconto.Caption:= FormatFloat('####0.00',VF_ValorDesconto);

    //---
   //--- Calculando o valor total de dependentes

   VF_Valor:= StrToFloat(Edit_Valor_Diarias.Caption)*
              StrToFloat(MaskEdit_N_Diarias.Caption)-
              StrToFloat(Edit_Valor_Desconto.Caption);

   if Trim(IBQuery_Tabela_Posto.FieldByName('Codigo').AsString) = '08' then    // CIVIL SEM VÍNCULO
      StaticText_Valor_Total_Dependentes.Caption:= FormatFloat('####0.00',VF_Valor*VR_QtdDep)
   else
      StaticText_Valor_Total_Dependentes.Caption:= FormatFloat('####0.00',(VF_Valor/2)*VR_QtdDep);

    //---
   //--- Calculando o valor total a pagar de diarias

   VF_Valor:= (StrToFloat(Edit_Valor_Diarias.Caption)*
               StrToFloat(MaskEdit_N_Diarias.Caption)-
               StrToFloat(Edit_Valor_Desconto.Caption));

   StaticText_Diarias_Pagar.Caption:= FormatFloat('####0.00',(VF_Valor)+StrToFloat(StaticText_Valor_Total_Dependentes.Caption));

    //---
   //--- Calculando o valor total a pagar

   VF_Valor:= StrToFloat(StaticText_Diarias_Pagar.Caption)+
              StrToFloat(MaskEdit_Gasto_Telefone.Text);

   MaskEdit_Total_Pagar.Text:= FormatFloat('####0.00',(VF_Valor));

   Habilita;
   Tratamento(True);
   MaskEdit_Recibo.setfocus;
end;

//------------------------------------------------------------------------------
// Calcula o hospede que esta em Transito com Desconto
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.Calcula_Hospede_Em_TransitoDesconto;
var
   VS_Comando: String;
   VR_QtdDep, VF_ValorDesconto, VF_Valor: Real;
   VI_DiasDesconto: integer;
begin
   VR_QtdDep:= StrToFloat(Label_QTD_Dependentes.Caption);

   if StrToInt(trim(MaskEdit_HoraSaida.Text)) >= 1400 then
      MaskEdit_N_Diarias.Caption:= IntToStr(StrToInt(MaskEdit_N_Diarias.Caption)+1);

    //---
   //--- Calculo do Pagamento

   VS_Comando:= 'Select * from Tabela_Preco '+
                ' Where Predio = '+#39+IBTable_Hospedagem.FieldByName('Predio').AsString+#39+
                ' and Codigo = '+#39+IBQuery_Tabela_Posto.FieldByName('CODIGO').AsString+#39;

   IBQuery_Busca_Valor_Hospedagem.Close;
   IBQuery_Busca_Valor_Hospedagem.SQL.Clear;
   IBQuery_Busca_Valor_Hospedagem.SQL.Add(VS_Comando);
   IBQuery_Busca_Valor_Hospedagem.Open;

   if IBTable_Hospedagem.FieldByName('DEPENDENTE').AsInteger = 0 then
      MaskEdit_Referente.Text:= 'Proveniente de '+MaskEdit_N_Diarias.Caption+' diarias de hospedagem no Hotel.'
   else
   begin
      MaskEdit_Referente.Text:= 'Proveniente de '+MaskEdit_N_Diarias.Caption+' diarias de hospedagem no Hotel com '+Trim(FloatToStr(VR_QtdDep))+' dep.';
   end;

   Edit_Valor_Diarias.Caption:= FormatFloat('###.00',IBQuery_Busca_Valor_Hospedagem.FieldByName('Valor').AsFloat);

    //---
   //--- Calculando Desconto

   if DM.Habilitado_Para = 'HOTEL CTA' then
   begin
      if IBTable_Hospedagem.FieldByName('Desconto').AsString = '1' then
      begin
         VI_DiasDesconto:= StrToInt(MaskEdit_N_Diarias.Caption);
         VF_ValorDesconto:= (VI_DiasDesconto*StrToFloat(Edit_Valor_Diarias.Caption));
         VF_ValorDesconto:= VF_ValorDesconto - ((VF_ValorDesconto*50)/100);
         if VI_DiasDesconto = 1 then
            Edit_Desconto.Caption:= FormatFloat('###', VI_DiasDesconto)+' dia'
         else
            Edit_Desconto.Caption:= FormatFloat('###', VI_DiasDesconto)+' dias';
      end
      else
      begin
         if StrToInt(MaskEdit_N_Diarias.Caption) <= 15 then   // Calculando o total sem desconto
         begin
            VF_ValorDesconto:= 0;
            Edit_Desconto.Caption:= '0 dia';
         end
         else
         begin
            VI_DiasDesconto:= StrToInt(MaskEdit_N_Diarias.Caption) - 15;
            VF_ValorDesconto:= (VI_DiasDesconto*StrToFloat(Edit_Valor_Diarias.Caption));
            VF_ValorDesconto:= VF_ValorDesconto - ((VF_ValorDesconto*50)/100);
            if VI_DiasDesconto = 1 then
               Edit_Desconto.Caption:= FormatFloat('###', VI_DiasDesconto)+' dia'
            else
               Edit_Desconto.Caption:= FormatFloat('###', VI_DiasDesconto)+' dias';
         end;
      end;
   end
   else
   begin
      if DM.Habilitado_Para = 'BASE AREA MANAUS' then
      begin
         VF_ValorDesconto:= 0;
         Edit_Desconto.Caption:= '0 dia';
      end;
   end;

    //---
   //--- Calculando o total sem desconto

   Edit_Total_Sem_Desconto.Caption:= FormatFloat('####0.00',StrToFloat(MaskEdit_N_Diarias.Caption)*StrToFloat(Edit_Valor_Diarias.Caption));

    //---
   //--- Calculando do desconto

   Edit_Valor_Desconto.Caption:= FormatFloat('####0.00',VF_ValorDesconto);

    //---
   //--- Calculando o valor total de dependentes

   VF_Valor:= StrToFloat(Edit_Valor_Diarias.Caption)*
              StrToFloat(MaskEdit_N_Diarias.Caption)-
              StrToFloat(Edit_Valor_Desconto.Caption);

   StaticText_Valor_Total_Dependentes.Caption:= FormatFloat('####0.00',(VF_Valor/2)*VR_QtdDep);

    //---
   //--- Calculando o valor total a pagar de diarias

   VF_Valor:= (StrToFloat(Edit_Valor_Diarias.Caption)*
               StrToFloat(MaskEdit_N_Diarias.Caption)-
               StrToFloat(Edit_Valor_Desconto.Caption));

   StaticText_Diarias_Pagar.Caption:= FormatFloat('####0.00',(VF_Valor)+StrToFloat(StaticText_Valor_Total_Dependentes.Caption));

    //---
   //--- Calculando o valor total a pagar

   VF_Valor:= StrToFloat(StaticText_Diarias_Pagar.Caption)+
              StrToFloat(MaskEdit_Gasto_Telefone.Text);

   MaskEdit_Total_Pagar.Text:= FormatFloat('####0.00',(VF_Valor));

   Habilita;
   Tratamento(True);
   MaskEdit_Recibo.setfocus;
end;

//------------------------------------------------------------------------------
// Calcula o hospede Vista Esposa
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.Calcula_Hospede_VisitaEsp;
var
   VS_Comando: String;
   VR_QtdDep, VF_ValorDesconto, VF_Valor: Real;
   VI_DiasDesconto: integer;
begin
   VR_QtdDep:= StrToFloat(Label_QTD_Dependentes.Caption);

   if StrToInt(trim(MaskEdit_HoraSaida.Text)) >= 1400 then
      MaskEdit_N_Diarias.Caption:= IntToStr(StrToInt(MaskEdit_N_Diarias.Caption)+1);

    //---
   //--- Calculo do Pagamento

   VS_Comando:= 'Select * from Tabela_Preco '+
                ' Where Predio = '+#39+IBTable_Hospedagem.FieldByName('Predio').AsString+#39+
                ' and Codigo = '+#39+IBQuery_Tabela_Posto.FieldByName('CODIGO').AsString+#39;

   IBQuery_Busca_Valor_Hospedagem.Close;
   IBQuery_Busca_Valor_Hospedagem.SQL.Clear;
   IBQuery_Busca_Valor_Hospedagem.SQL.Add(VS_Comando);
   IBQuery_Busca_Valor_Hospedagem.Open;

   if IBTable_Hospedagem.FieldByName('DEPENDENTE').AsInteger = 0 then
      MaskEdit_Referente.Text:= 'Proveniente de '+MaskEdit_N_Diarias.Caption+' diarias de hospedagem no Hotel.'
   else
      MaskEdit_Referente.Text:= 'Proveniente de '+MaskEdit_N_Diarias.Caption+' diarias de hosp. no Hotel com '+Trim(FloatToStr(VR_QtdDep))+' dep. Desc. de 50%.';

   Edit_Valor_Diarias.Caption:= FormatFloat('###.00',IBQuery_Busca_Valor_Hospedagem.FieldByName('Valor').AsFloat);

    //---
   //--- Calculando Desconto


   Edit_Total_Sem_Desconto.Caption:= FormatFloat('####0.00',StrToFloat(MaskEdit_N_Diarias.Caption)*StrToFloat(Edit_Valor_Diarias.Caption));

    //---
   //--- Calculando do desconto

   VF_ValorDesconto:= (StrToFloat(Edit_Total_Sem_Desconto.Caption)*50)/100;
   Edit_Valor_Desconto.Caption:= FormatFloat('####0.00',VF_ValorDesconto);

    //---
   //--- Calculando o valor total de dependentes

   VF_Valor:= StrToFloat(Edit_Valor_Diarias.Caption)*
              StrToFloat(MaskEdit_N_Diarias.Caption)-
              StrToFloat(Edit_Valor_Desconto.Caption);

   StaticText_Valor_Total_Dependentes.Caption:= FormatFloat('####0.00',(VF_Valor)*VR_QtdDep);

    //---
   //--- Calculando o valor total a pagar de diarias

   VF_Valor:= (StrToFloat(Edit_Valor_Diarias.Caption)*
               StrToFloat(MaskEdit_N_Diarias.Caption)-
               StrToFloat(Edit_Valor_Desconto.Caption));

   StaticText_Diarias_Pagar.Caption:= FormatFloat('####0.00',(VF_Valor)+StrToFloat(StaticText_Valor_Total_Dependentes.Caption));

    //---
   //--- Calculando o valor total a pagar

   VF_Valor:= StrToFloat(StaticText_Diarias_Pagar.Caption)+
              StrToFloat(MaskEdit_Gasto_Telefone.Text);

   MaskEdit_Total_Pagar.Text:= FormatFloat('####0.00',(VF_Valor));

   Habilita;
   Tratamento(True);
   MaskEdit_Recibo.setfocus;
end;

//------------------------------------------------------------------------------
// Calcula o hospede que eh Residente
//------------------------------------------------------------------------------

procedure TForm_Fecha_Conta.Calcula_Hospede_Residente;
var
   Dias, Tempo, VS_Comando: String;
   ValorDiariaDep, VR_Valor, UltimoDiaDoMes, ValorDiaria, VR_QtdDep, VF_Valor: Real;
   InicioDia, InicioMes, InicioAno: Word;
   TerminoDia, TerminoMes, TerminoAno: Word;
begin
   DecodeDate( StrToDate(DBEdit_Data_Entrada.Text), Inicioano, Iniciomes, Iniciodia);
   DecodeDate( StrToDate(MaskEdit_Data_Saida.Text), TerminoAno, TerminoMes, TerminoDia);
   UltimoDiaDoMes:= StrToFloat(IntToStr(Funcoes.DiasNoMes(TerminoAno, TerminoMes)));

    //---
   //--- Zera o numero de diarias

   Tempo:= FloatToStr(StrToDate(MaskEdit_Data_Saida.Text) - StrToDate(DBEdit_Data_Entrada.Text));
   MaskEdit_N_Diarias.Caption:= Tempo;

    //---
   //--- Calculo do Pagamento

   if trim(IBTable_Hospede.FieldByName('POSTO').AsString) <> '' then
   begin
      if DM.Habilitado_Para = 'HOTEL CTA' then
      begin
         VS_Comando:= 'Select * from Residente '+
                      ' Where Posto = '+#39+IBTable_Hospede.FieldByName('POSTO').AsString+#39+
                      ' and N_Dependente = 0';
      end
      else
      begin
         if DM.Habilitado_Para = 'BASE AREA MANAUS' then
         begin
            VS_Comando:= 'Select * from Residente '+
                         ' Where Posto = '+#39+IBTable_Hospede.FieldByName('POSTO').AsString+#39+
                         ' and N_Dependente = '+IBTable_Hospedagem.FieldByName('Dependente').AsString;
         end
         else
         begin
            if DM.Habilitado_Para = 'NATAL' then
            begin
               VS_Comando:= 'Select * from Residente '+
                            ' Where Posto = '+#39+IBTable_Hospede.FieldByName('POSTO').AsString+#39+
                            ' and N_Dependente = 0';
            end
            else
            if DM.Habilitado_Para = 'CIAAR' then
            begin
               VS_Comando:= 'Select * from Residente '+
                            ' Where Posto = '+#39+IBTable_Hospede.FieldByName('POSTO').AsString+#39+
                            ' and N_Dependente = 0';
            end;
         end;
      end;
   end
   else
   begin
      if DM.Habilitado_Para = 'HOTEL CTA' then
      begin
         VS_Comando:= 'Select * from Residente '+
                      ' Where Posto = '+#39+IBTable_Hospedagem.FieldByName('DEPENDENTE_DE').AsString+#39+
                      ' and N_Dependente = 0';
      end
      else
      begin
         if DM.Habilitado_Para = 'BASE AREA MANAUS' then
         begin
            VS_Comando:= 'Select * from Residente '+
                         ' Where Posto = '+#39+IBTable_Hospede.FieldByName('DEPENDENTE_DE').AsString+#39+
                         ' and N_Dependente = '+IBTable_Hospede.FieldByName('Dependente').AsString;
         end
         else
         begin
            if DM.Habilitado_Para = 'NATAL' then
            begin
               VS_Comando:= 'Select * from Residente '+
                            ' Where Posto = '+#39+IBTable_Hospedagem.FieldByName('DEPENDENTE_DE').AsString+#39+
                            ' and N_Dependente = 0';
            end
            else
            begin
               if DM.Habilitado_Para = 'CIAAR' then
               begin
                  VS_Comando:= 'Select * from Residente '+
                               ' Where Posto = '+#39+IBTable_Hospedagem.FieldByName('DEPENDENTE_DE').AsString+#39+
                               ' and N_Dependente = 0';
               end;
            end;
         end;
      end;
   end;

   IBQuery_Busca_Valor_Residente.Close;
   IBQuery_Busca_Valor_Residente.SQL.Clear;
   IBQuery_Busca_Valor_Residente.SQL.Add(VS_Comando);
   IBQuery_Busca_Valor_Residente.Open;

   //--- Calculo do Valor a ser pago

   if DM.Habilitado_Para = 'HOTEL CTA' then
   begin
      if TerminoDia = UltimoDiaDoMes then   // Calcular Parcial
      begin
         Edit_Valor_Diarias.Caption:= FormatFloat('###.00',IBQuery_Busca_Valor_Residente.FieldByName('Valor').AsFloat);
         Dias:= '';
      end
      else
      begin
//         ValorDiaria:= IBQuery_Busca_Valor_Residente.FieldByName('Valor').AsFloat/UltimoDiaDoMes;
         ValorDiaria:= IBQuery_Busca_Valor_Residente.FieldByName('Valor').AsFloat/30;
         ValorDiaria:= ValorDiaria*StrToFloat(Tempo);
         Edit_Valor_Diarias.Caption:= FormatFloat('###.00', ValorDiaria);
         Dias:= tempo;

//         if StrToFloat(Label_QTD_Dependentes.Caption) > 0 then
//         begin
//            ValorDiariaDep:= (ValorDiaria*25)/100;
//            ValorDiariaDep:= ValorDiariaDep*StrToFloat(Label_QTD_Dependentes.Caption);
//            StaticText_Valor_Total_Dependentes.Caption:= FormatFloat('####0.00',ValorDiariaDep)
//         end;
      end;
   end
   else
   begin
      if DM.Habilitado_Para = 'NATAL' then
      begin
         VR_Valor:= (IBQuery_Busca_Valor_Residente.FieldByName('Valor').AsFloat*6)/100;
         if ((StrToInt(Tempo) > 1) and (StrToInt(Tempo) < 10)) then
             Edit_Valor_Diarias.Caption:= FormatFloat('###.00',(VR_Valor*33.3333)/100)
         else
            if ((StrToInt(Tempo) > 11) and (StrToInt(Tempo) < 20)) then
                Edit_Valor_Diarias.Caption:= FormatFloat('###.00',(VR_Valor*66.6666)/100)
            else
                Edit_Valor_Diarias.Caption:= FormatFloat('###.00',VR_Valor);
      end
      else
      begin
         Edit_Valor_Diarias.Caption:= FormatFloat('###.00',IBQuery_Busca_Valor_Residente.FieldByName('Valor').AsFloat);
      end;
   end;


    //---
   //--- Calculando Desconto

   if DM.Habilitado_Para <> 'NATAL' then
   begin
      if trim(IBTable_Hospede.FieldByName('POSTO').AsString) <> '' then
      begin
         MaskEdit_Referente.Text:= 'Proveniente de '+Dias+' diaria de residente no Hotel.';
         Edit_Desconto.Caption:= '0';
      end
      else
      begin
         MaskEdit_Referente.Text:= 'Dependente de '+Dias+
                                    trim(IBTable_Hospede.FieldByName('DEPENDENTE_DE').AsString)+
                                    ', residente no Hotel.';
         Edit_Desconto.Caption:= '0';
      end;
   end
   else
   begin
      if IBTable_Hospedagem.FieldByName('Desconto').AsInteger = 0 then
         Edit_Desconto.Caption:= '0'
      else
         Edit_Desconto.Caption:= '50';
   end;

    //---
   //--- Calculando o total sem desconto

   Edit_Total_Sem_Desconto.Caption:= Edit_Valor_Diarias.Caption;

    //---
   //--- Calculando Com desconto


   if DM.Habilitado_Para <> 'NATAL' then
   begin
      Edit_Valor_Desconto.Caption:= FormatFloat('####0.00',StrToFloat(Edit_Total_Sem_Desconto.Caption)*
                                                           StrToFloat(Edit_Desconto.Caption)/100);
   end
   else
   begin
      Edit_Total_Sem_Desconto.Caption:= Edit_Valor_Diarias.Caption;
   end;

    //---
   //--- Calculando o valor total de dependentes

   if DM.Habilitado_Para = 'HOTEL CTA' then
   begin
      VF_Valor:= StrToFloat(Edit_Valor_Diarias.Caption) * 0.25;
      VF_Valor:= (VF_Valor*StrToFloat(Label_QTD_Dependentes.Caption));
//      VF_Valor:= (VF_Valor*VR_QtdDep);

      StaticText_Valor_Total_Dependentes.Caption:= FormatFloat('####0.00',VF_Valor);
   end
   else
   begin
      if DM.Habilitado_Para = 'NATAL' then
      begin
         VF_Valor:= StrToFloat(Edit_Valor_Diarias.Caption) * 0.10;
         VF_Valor:= (VF_Valor*VR_QtdDep);

         StaticText_Valor_Total_Dependentes.Caption:= FormatFloat('####0.00',VF_Valor);
      end
      else
      begin
         if DM.Habilitado_Para = 'NATAL' then
         begin
            VF_Valor:= StrToFloat(Edit_Valor_Diarias.Caption) * 1.5;
            VF_Valor:= (VF_Valor*VR_QtdDep);

            StaticText_Valor_Total_Dependentes.Caption:= FormatFloat('####0.00',VF_Valor);

         end;
      end;
   end;

    //---
   //--- Calculando o valor total a pagar de diarias

   VF_Valor:= (StrToFloat(Edit_Valor_Diarias.Caption) - StrToFloat(Edit_Valor_Desconto.Caption));

   StaticText_Diarias_Pagar.Caption:= FormatFloat('####0.00',(VF_Valor)+
                                      StrToFloat(StaticText_Valor_Total_Dependentes.Caption));

    //---
   //--- Calculando o valor total a pagar

   VF_Valor:= StrToFloat(StaticText_Diarias_Pagar.Caption)+
              StrToFloat(MaskEdit_Gasto_Telefone.Text);

   MaskEdit_Total_Pagar.Text:= FormatFloat('####0.00',(VF_Valor));

   Habilita;
   Tratamento(True);
   MaskEdit_Recibo.setfocus;
end;
end.
