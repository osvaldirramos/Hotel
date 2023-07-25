//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Cad_Reserva.PAS                                //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de tratar do cadas- //
//                             tro das Reservas.                              //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 11/08/1999                                     //
//                                                                            //
// ATUALIZADO                : 11/03/2003                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Cad_Reserva;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, Buttons, Mask, ExtCtrls, ComCtrls, DBTables,
  Grids, DBGrids, Rotinas, ToolWin, IBCustomDataSet, IBQuery, IBTable,
  JvGradient, JvComponent, JvEnterTab;

type
  TForm_Cad_Reserva = class(TForm)
    DST_Reserva: TDataSource;
    Panel3: TPanel;
    DST_Apto: TDataSource;
    StatusBar: TStatusBar;
    DSQ_Reserva: TDataSource;
    DSQ_Predio: TDataSource;
    DSQ_Tabela_Posto: TDataSource;
    DST_Busca_Cama: TDataSource;
    DBGrid_Hospede: TDBGrid;
    IBQuery_Decea: TIBQuery;
    IBQuery_Busca_Hospede: TIBQuery;
    IBQuery_Tabela_Posto: TIBQuery;
    IBQuery_Tabela_PostoPOSTO: TIBStringField;
    IBQuery_Tabela_PostoCODIGO: TIBStringField;
    IBQuery_Tabela_PostoCODTABELA: TIBStringField;
    IBQuery_Predio: TIBQuery;
    IBQuery_Reserva: TIBQuery;
    IBQuery_ReservaIDENTIDADE: TIBStringField;
    IBQuery_ReservaDATAENTRADA: TDateTimeField;
    IBQuery_ReservaNOME: TIBStringField;
    IBQuery_ReservaNOME_GUERRA: TIBStringField;
    IBQuery_ReservaPOSTO: TIBStringField;
    IBQuery_ReservaDEPENDENTE_DE: TIBStringField;
    IBQuery_ReservaTELEFONE_FUNCIONAL: TIBStringField;
    IBQuery_ReservaSITUACAO_CURSO: TIBStringField;
    IBQuery_ReservaOM_ORIGEM: TIBStringField;
    IBQuery_ReservaDEPENDENTE: TSmallintField;
    IBQuery_ReservaHORAENTRADA: TIBStringField;
    IBQuery_ReservaDATASAIDA: TDateTimeField;
    IBQuery_ReservaPREDIO: TIBStringField;
    IBQuery_ReservaAPTO: TSmallintField;
    IBQuery_ReservaCAMA: TSmallintField;
    IBQuery_ReservaRECEBE: TIBStringField;
    IBQuery_ReservaUSUARIO: TIBStringField;
    IBTable_Reserva: TIBTable;
    IBTable_ReservaIDENTIDADE: TIBStringField;
    IBTable_ReservaDATAENTRADA: TDateTimeField;
    IBTable_ReservaNOME: TIBStringField;
    IBTable_ReservaNOME_GUERRA: TIBStringField;
    IBTable_ReservaPOSTO: TIBStringField;
    IBTable_ReservaDEPENDENTE_DE: TIBStringField;
    IBTable_ReservaTELEFONE_FUNCIONAL: TIBStringField;
    IBTable_ReservaSITUACAO_CURSO: TIBStringField;
    IBTable_ReservaOM_ORIGEM: TIBStringField;
    IBTable_ReservaDEPENDENTE: TSmallintField;
    IBTable_ReservaHORAENTRADA: TIBStringField;
    IBTable_ReservaDATASAIDA: TDateTimeField;
    IBTable_ReservaPREDIO: TIBStringField;
    IBTable_ReservaAPTO: TSmallintField;
    IBTable_ReservaCAMA: TSmallintField;
    IBTable_ReservaRECEBE: TIBStringField;
    IBTable_ReservaUSUARIO: TIBStringField;
    IBTable_Apto: TIBTable;
    IBTable_AptoPREDIO: TIBStringField;
    IBTable_AptoAPTO: TSmallintField;
    IBTable_Busca_Cama: TIBTable;
    IBStringField1: TIBStringField;
    SmallintField1: TSmallintField;
    IBTable_Busca_CamaCAMA: TSmallintField;
    IBTable_Busca_CamaAPTCODIGO: TIBStringField;
    IBTable_Busca_CamaNOME: TIBStringField;
    Label20: TLabel;
    Label_Ficha_Hospede: TLabel;
    ToolBar2: TToolBar;
    ToolButton9: TToolButton;
    ToolButton_Inserir: TToolButton;
    ToolButton_Alterar: TToolButton;
    ToolButton_Excluir: TToolButton;
    ToolButton_Gravar: TToolButton;
    ToolButton_Cancelar: TToolButton;
    ToolButton2: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    JvGradient1: TJvGradient;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label1: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label_Nome_Guerra: TLabel;
    Label23: TLabel;
    Label_Situacao_Curso: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label_Usuario: TLabel;
    Label4: TLabel;
    DBText1: TDBText;
    Label_Recebimento: TLabel;
    Label_Local_Recebimento: TLabel;
    BitBtn_Patentes: TBitBtn;
    DBEdit_Nome: TDBEdit;
    DBEdit_Nome_Guerra: TDBEdit;
    DBEdit_Telefone_Funcional: TDBEdit;
    DBEdit_Data_Entrada: TDBEdit;
    DBEdit_Hora_Entrada: TDBEdit;
    DBEdit_Data_Saida: TDBEdit;
    DBLookupComboBox_Predio: TDBLookupComboBox;
    DBLookupComboBox_Apto: TDBLookupComboBox;
    MaskEdit_Identidade: TMaskEdit;
    DBEdit_Dependente: TDBEdit;
    DBComboBox_OM_Origem: TDBComboBox;
    DBComboBox_Posto_Graduacao: TDBComboBox;
    DBComboBox_Dependente_de: TDBComboBox;
    Panel_Busca: TPanel;
    GroupBox1: TGroupBox;
    MaskEdit_Busca_Identidade: TMaskEdit;
    GroupBox_Busca_Por_Nome: TGroupBox;
    MaskEdit_Busca_Nome: TMaskEdit;
    DBComboBox_Situacao_Curso: TDBComboBox;
    DBComboBox_Recebimento: TDBComboBox;
    JvEnterAsTab1: TJvEnterAsTab;
    procedure FormCreate(Sender: TObject);

    procedure MaskEdit_Busca_NomeChange(Sender: TObject);
    procedure MaskEdit_IdentidadeExit(Sender: TObject);

    procedure Atualiza;
    procedure Botao(Status: Boolean);
    procedure TrataCampos(Status: Boolean);
    procedure BuscaHospede;
    procedure Busca(VS_Busca: String);
    procedure TrataInsercao;

    procedure MaskEdit_Busca_IdentidadeChange(Sender: TObject);
    procedure ToolButton_InserirClick(Sender: TObject);
    procedure ToolButton_AlterarClick(Sender: TObject);
    procedure ToolButton_ExcluirClick(Sender: TObject);
    procedure ToolButton_GravarClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure IBQuery_ReservaAfterScroll(DataSet: TDataSet);
    procedure IBTable_ReservaPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure ToolButton_PatentesClick(Sender: TObject);
    procedure ToolButton_CancelarClick(Sender: TObject);
  private
    { private declarations }
  public    { public declarations }
     VI_Codigo: integer;
     VB_ModuloInsercao, VB_Nao_Busca_Identidade, VB_Achou: Boolean;
     VS_Identidade, VS_DataEntrada: String;
  end;

var
  Form_Cad_Reserva: TForm_Cad_Reserva;

implementation

uses Abertura, Cad_Hospede, Divisas, Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_Cad_Reserva.FormCreate(Sender: TObject);
begin
   IBQuery_Reserva.Close;
   IBQuery_Reserva.Open;
   IBTable_Reserva.Open;
   IBQuery_Predio.Open;
   IBTable_Apto.Open;
   IBTable_Busca_Cama.Open;

    //---
   //--- Verifica o tipo de usuario

   MaskEdit_Identidade.Text:= IBTable_Reserva.FieldByName('IDENTIDADE').AsString;

   if Funcoes.GetPrivilegio = 'G' then
   begin
      Label_Recebimento.Visible:= True;
      DBComboBox_Recebimento.Visible:= True;
      Label_Local_Recebimento.Visible:= True;
   end
   else
   begin
      Label_Recebimento.Visible:= False;
      DBComboBox_Recebimento.Visible:= False;
      Label_Local_Recebimento.Visible:= False;
   end;

   DBComboBox_Situacao_Curso.Items.Clear;
   DBComboBox_Situacao_Curso.Items.Add('TRANSITO');
   DBComboBox_Situacao_Curso.Items.Add('RESIDENTE');

   if DM.Habilitado_Para = 'HOTEL CTA' then
   begin
//      DBComboBox_Situacao_Curso.Items.Add('CURSO<30D');
      DBComboBox_Situacao_Curso.Items.Add('CURSO>30D');
      DBComboBox_Situacao_Curso.Items.Add('CURSO PNR');
      DBComboBox_Situacao_Curso.Items.Add('VISITA ESP');
   end;

    //---
   //--- Atualiza o combo de selecao do Posto/Grad e Dependente_de

   IBQuery_Tabela_Posto.Open;
   IBQuery_Tabela_Posto.First;
   While not IBQuery_Tabela_Posto.eof do
   begin
      DBComboBox_Posto_Graduacao.Items.Add(IBQuery_Tabela_Posto.FieldByName('Posto').AsString);
      DBComboBox_Dependente_de.Items.Add(IBQuery_Tabela_Posto.FieldByName('Posto').AsString);
      IBQuery_Tabela_Posto.Next;
   end;

    //---
   //--- Atualiza o combo de selecao da OM origem

   IBQuery_Decea.Open;
   IBQuery_Decea.First;
   While not IBQuery_Decea.eof do
   begin
      DBComboBox_OM_Origem.Items.Add(IBQuery_Decea.FieldByName('Localidade').AsString);
      IBQuery_Decea.Next;
   end;

   Botao(True);

   TrataCampos(True);
end;

//------------------------------------------------------------------------------
// Modulo de Inserção de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Reserva.ToolButton_InserirClick(Sender: TObject);
begin
   VB_ModuloInsercao:= True;
   TrataInsercao;
end;

//------------------------------------------------------------------------------
// Modulo de tratamento da Inserção de Dados da reserva
//------------------------------------------------------------------------------

procedure TForm_Cad_Reserva.TrataInsercao;
begin
   Botao( False );
   TrataCampos(False);

   StatusBar.SimpleText:= 'Forneça o nº da identidade do hospede e pressione a tecla <ENTER>';

   DBEdit_Nome.Clear;
   DBEdit_Nome_Guerra.Clear;
   DBEdit_Telefone_Funcional.Clear;
   DBComboBox_OM_Origem.Text:= '';
   DBComboBox_Situacao_Curso.Text:= '';
   DBEdit_Dependente.Clear;
   DBEdit_Data_Entrada.Clear;
   DBEdit_Hora_Entrada.Clear;
   DBEdit_Data_Saida.Clear;
   DBComboBox_Posto_Graduacao.Text:= '';
   DBComboBox_Dependente_de.Text:= '';
   DBEdit_Data_Entrada.Clear;
   DBEdit_Data_Saida.Clear;
   DBComboBox_Recebimento.Text:= '';

   if VB_ModuloInsercao = True then
   begin
      MaskEdit_Identidade.Enabled:= True;
      MaskEdit_Identidade.Clear;
      MaskEdit_Identidade.SetFocus;
   end
   else
   begin
      DBEdit_Nome.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Alteração de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Reserva.ToolButton_AlterarClick(Sender: TObject);
begin
   Try
     Botao(False);
     TrataCampos(False);
     MaskEdit_Identidade.Enabled:= False;
     IBTable_Reserva.Edit;
     DBEdit_Nome.SetFocus;
   Except
     MessageDlg('Erro na Alteração.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Exclusão de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Reserva.ToolButton_ExcluirClick(Sender: TObject);
var
   VS_Comando, VS_Predio, VS_Apto, VS_NomeGuerra, VS_Nome: String;
begin
   Botao(False);
   ToolButton_Gravar.Enabled:= False;
   ToolButton_Cancelar.Enabled:= False;
   if MessageDlg('Confirma o cancelamento da reserva ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      VS_Nome:= IBTable_Reserva.FieldByName('NOME').AsString;
      VS_NomeGuerra:= IBTable_Reserva.FieldByName('NOME_GUERRA').AsString;
      VS_Predio:= IBTable_Reserva.FieldByName('PREDIO').AsString;
      VS_Apto:= IBTable_Reserva.FieldByName('APTO').AsString;

      if Trim(VS_NomeGuerra) = '' then
         VS_Comando:= 'Delete from Reserva where predio = '+#39+VS_Predio+#39+' and apto = '+#39+VS_Apto+#39+' and Nome = '+#39+VS_Nome+#39
      else
         VS_Comando:= 'Delete from Reserva where predio = '+#39+VS_Predio+#39+' and apto = '+#39+VS_Apto+#39+' and Nome_Guerra = '+#39+VS_NomeGuerra+#39;
      Funcoes.ExecSql_Servidor(VS_Comando);
      Atualiza;
   end;
   Botao(True);
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Reserva.ToolButton_GravarClick(Sender: TObject);
var
   VS_Comando: String;
   VB_Grava: Boolean;
begin

   VB_Grava:= True;

    //---
   // Analiza a Hora

   if (VB_Grava = True) then
   begin
      if Funcoes.ValidaHora(DBEdit_Hora_Entrada.Text) = 'IIII'  then
      begin
         VB_Grava:= False;
         DBEdit_Hora_Entrada.SetFocus;
      end;
   end;

   //---
   //--- Analiza o Posto Graduacao

   if ((trim(DBComboBox_Posto_Graduacao.Text) <> '') and (VB_Grava = True))  then
   begin
       VS_Comando:= 'Select * from TABELA_POSTO where posto = '+#39+trim(DBComboBox_Posto_Graduacao.Text)+#39;
       if Funcoes.Procura(VS_Comando) = False then
       begin
          MessageDlg('O posto deve ser escolhida na lista...', mtInformation,[mbOk], 0);
          VB_Grava:= False;
       end;
   end;

    //---
   //--- Analisa Dependente de

   if ((trim(DBComboBox_Dependente_de.Text) <> '') and (trim(DBComboBox_Posto_Graduacao.Text) <> '') and (VB_Grava = True))  then
   begin
      MessageDlg('O Hospede não pode ser o próprio e o dependente ao mesmo tempo...', mtInformation,[mbOk], 0);
      VB_Grava:= False;
   end;

    //---
   //--- Analisa Dependente de

   if ((trim(DBComboBox_Dependente_de.Text) = '') and (trim(DBComboBox_Posto_Graduacao.Text) = '') and (VB_Grava = True))  then
   begin
      MessageDlg('Não foi escolhido o posto...', mtInformation,[mbOk], 0);
      VB_Grava:= False;
   end
   else
   begin
      if ((trim(DBComboBox_Dependente_de.Text) <> '') and (trim(DBComboBox_Posto_Graduacao.Text) = '') and (VB_Grava = True))  then
      begin
         VS_Comando:= 'Select * from TABELA_POSTO where posto = '+#39+trim(DBComboBox_Dependente_de.Text)+#39;
         if Funcoes.Procura(VS_Comando) = False then
         begin
            MessageDlg('O posto do dependente deve ser escolhida na lista...', mtInformation,[mbOk], 0);
            VB_Grava:= False;
         end;
      end;
   end;

    //---
   //--- Analisa se a Data de Entrada eh menor que a data de saida

   if ((StrToDate(DBEdit_Data_Entrada.Text) > StrToDate(DBEdit_Data_Saida.Text)) and (VB_Grava = True)) then
   begin
      MessageDlg('A Data de Entrada não pode ser menor que a data de saída...', mtInformation,[mbOk], 0);
      VB_Grava:= False;
   end;

   //--- Inicia a Gravacao

   if VB_Grava = True then
   begin
      IBTable_Reserva.FieldByName('Cama').AsString:= IBTable_Busca_Cama.FieldByName('Cama').AsString;
      IBTable_Reserva.Post;
      DM.IBTransaction_Hotel.CommitRetaining;
      MaskEdit_Identidade.Enabled:= True;
      Atualiza;
      Botao(True);
      TrataCampos(True);
   end;

end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Reserva.ToolButton_CancelarClick(Sender: TObject);
begin
   Try
      IBTable_Reserva.Cancel;
      DM.IBTransaction_Hotel.CommitRetaining;
      MaskEdit_Identidade.Enabled:= True;
      Botao(True);
      Atualiza;
      TrataCampos(True);
   Except
      MessageDlg('Erro na Cancelamento.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_Cad_Reserva.ToolButton_RetornarClick(Sender: TObject);
begin
   IBQuery_Reserva.Close;
   IBTable_Reserva.Close;
   IBQuery_Predio.Close;
   IBQuery_Tabela_Posto.Close;
   IBQuery_Busca_Hospede.Close;
   IBTable_Apto.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Procedure de Redresh da Query
//------------------------------------------------------------------------------

procedure TForm_Cad_Reserva.Atualiza;
begin
   IBQuery_Reserva.Close;
   IBQuery_Reserva.Open;
end;

//------------------------------------------------------------------------------
// Desabilita o acesso aos campos de tratamento do Aerodromo
//------------------------------------------------------------------------------

procedure TForm_Cad_Reserva.TrataCampos(Status: Boolean);
begin
   VB_Nao_Busca_Identidade:= Status;
   DBGrid_Hospede.Enabled:= Status;
   DBEdit_Nome.ReadOnly:= Status;
   DBEdit_Nome_Guerra.ReadOnly:= Status;
   DBEdit_Telefone_Funcional.ReadOnly:= Status;
   DBComboBox_OM_Origem.ReadOnly:= Status;
   DBComboBox_Situacao_Curso.ReadOnly:= Status;
   DBEdit_Dependente.ReadOnly:= Status;
   DBEdit_Data_Entrada.ReadOnly:= Status;
   DBEdit_Hora_Entrada.ReadOnly:= Status;
   DBEdit_Data_Saida.ReadOnly:= Status;
   DBComboBox_Posto_Graduacao.ReadOnly:= Status;
   DBComboBox_Dependente_de.ReadOnly:= Status;
   DBLookupComboBox_Predio.ReadOnly:= Status;
   DBLookupComboBox_Apto.ReadOnly:= Status;
end;

//------------------------------------------------------------------------------
// Trata dos Botoes
//------------------------------------------------------------------------------

procedure TForm_Cad_Reserva.Botao(Status: Boolean);
begin
   ToolButton_Inserir.Enabled:= Status;
    //---
   //--- Tratamento dos botoes quando não houver reserva

   if IBQuery_Reserva.Recordcount = 0 then
   begin
      ToolButton_Alterar.Enabled:= False;
      ToolButton_Excluir.Enabled:= False;
   end
   else
   begin
      ToolButton_Alterar.Enabled:= Status;

      if Funcoes.GetPrivilegio = 'C' then
         ToolButton_Excluir.Enabled:= False
      else
         ToolButton_Excluir.Enabled:= Status;

   end;
   ToolButton_Retornar.Enabled:= Status;
   ToolButton_Windows.Enabled:= Status;

   if Status = False then
      Status:= True
   else
      Status:= False;

   ToolButton_Gravar.Enabled:= Status;
   ToolButton_Cancelar.Enabled:= Status;
   MaskEdit_Busca_Identidade.SetFocus
end;

//------------------------------------------------------------------------------
// Rotina para buscar o hospede quando for pressionado a tecla TAB
//------------------------------------------------------------------------------

procedure TForm_Cad_Reserva.MaskEdit_IdentidadeExit(Sender: TObject);
begin
   if ToolButton_Inserir.Enabled = True then
   begin
      VB_ModuloInsercao:= False;
      TrataInsercao;
   end;

   if Trim(MaskEdit_Identidade.Text) <> '' then
       BuscaHospede;
end;

//------------------------------------------------------------------------------
// Rotina para buscar o hospede atraves da identidade
//------------------------------------------------------------------------------

procedure TForm_Cad_Reserva.BuscaHospede;
var
   VS_Comando: String;
begin
   if VB_Nao_Busca_Identidade = False then
   begin
      if MaskEdit_Identidade.Text = '' then
      begin
         MessageDlg('O nº da identidade não pode ser branco...', mtInformation,[mbOk], 0);
         MaskEdit_Identidade.SetFocus;
      end
      else
      begin
         //--- Verifica se o Hospede ja existe

         MaskEdit_Identidade.Text:= Funcoes.NIdentidade(Trim(MaskEdit_Identidade.Text));

         IBTable_Reserva.Append;
         IBTable_Reserva.FieldByName('NOME').AsString:= '';
         VB_Achou:= False;

         VS_Comando:='Select * from hospede where identidade = '+#39+MaskEdit_Identidade.Text+#39;

         IBQuery_Busca_Hospede.Close;
         IBQuery_Busca_Hospede.SQL.Clear;
         IBQuery_Busca_Hospede.SQL.Add(VS_Comando);
         IBQuery_Busca_Hospede.Open;

         if IBQuery_Busca_Hospede.RecordCount = 1 then
         begin
            //--- Tratamento dos campos quando o hospede existir

            IBTable_Reserva.FieldByName('IDENTIDADE').AsString:= IBQuery_Busca_Hospede.FieldByName('IDENTIDADE').AsString;
            IBTable_Reserva.FieldByName('NOME').AsString:= IBQuery_Busca_Hospede.FieldByName('NOME').AsString;
            IBTable_Reserva.FieldByName('NOME_GUERRA').AsString:= IBQuery_Busca_Hospede.FieldByName('NOME_GUERRA').AsString;
            IBTable_Reserva.FieldByName('POSTO').AsString:= IBQuery_Busca_Hospede.FieldByName('POSTO').AsString;
            IBTable_Reserva.FieldByName('TELEFONE_FUNCIONAL').AsString:= IBQuery_Busca_Hospede.FieldByName('TELEFONE_FUNCIONAL').AsString;
            IBTable_Reserva.FieldByName('OM_ORIGEM').AsString:= IBQuery_Busca_Hospede.FieldByName('OM_ORIGEM').AsString;
         end;

         IBTable_Reserva.FieldByName('DataEntrada').AsString:= DateToStr(Date);
         IBTable_Reserva.FieldByName('DataSaida').AsString:= DateToStr(Date);
         IBTable_Reserva.FieldByName('Dependente').AsInteger:= 0;
         IBTable_Reserva.FieldByName('HoraEntrada').AsString:= Funcoes.HoraAtual;
         IBTable_Reserva.FieldByName('Recebe').AsString:= 'H';

         IBTable_Reserva.FieldByName('Usuario').AsString:= Funcoes.GetUsuario;
         IBTable_Reserva.FieldByName('IDENTIDADE').AsString:= MaskEdit_Identidade.Text;
         StatusBar.SimpleText:= 'Forneça os Dados do Hóspede';
         MaskEdit_Identidade.Enabled:= False;
         DBEdit_Nome.SetFocus;
      end;
  end;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Cad_Reserva.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Procedure com a finalidade de procurar a reserva desejada por nome
//------------------------------------------------------------------------------

procedure TForm_Cad_Reserva.MaskEdit_Busca_NomeChange(Sender: TObject);
begin
   Busca(MaskEdit_Busca_Nome.Text);
end;

//------------------------------------------------------------------------------
// Procedure com a finalidade de procurar a reserva desejada por identidade
//------------------------------------------------------------------------------

procedure TForm_Cad_Reserva.MaskEdit_Busca_IdentidadeChange(
  Sender: TObject);
begin
   Busca(MaskEdit_Busca_Identidade.Text);
end;

//------------------------------------------------------------------------------
// Procedure para atualizar a Identidade ao selecionar a reserva
//------------------------------------------------------------------------------

procedure TForm_Cad_Reserva.IBQuery_ReservaAfterScroll(DataSet: TDataSet);
begin
   if IBQuery_Reserva.Recordcount = 0 then
   begin
      ToolButton_Alterar.Enabled:= False;
      ToolButton_Excluir.Enabled:= False;
   end;

   MaskEdit_Identidade.Text:= IBTable_Reserva.FieldByName('IDENTIDADE').AsString;
end;

//------------------------------------------------------------------------------
// Procedure com a finalidade de procurar a reserva desejada
//------------------------------------------------------------------------------

procedure TForm_Cad_Reserva.Busca(VS_Busca: String);
Var
   VS_Comando: String;
begin
    VS_Comando:= 'Select * from reserva'+
                 ' where identidade like '+#39+'%'+VS_Busca+'%'+#39+
                 ' or nome like '+#39+'%'+VS_Busca+'%'+#39+
                 ' order by nome, DataEntrada';

   IBQuery_Reserva.Close;
   IBQuery_Reserva.SQL.Clear;
   IBQuery_Reserva.SQL.ADD(VS_Comando);
   IBQuery_Reserva.Open;
end;

//------------------------------------------------------------------------------
// Tratamento de Erro no arquivo de reserva
//------------------------------------------------------------------------------

procedure TForm_Cad_Reserva.IBTable_ReservaPostError(DataSet: TDataSet;E: EDatabaseError; var Action: TDataAction);
begin
    if (E is EDBEngineError) then
       if (E as EDBEngineError).Errors[0].ErrorCode = 9729 then
       begin
          MessageDlg('Já existe uma reserva com esta'+#13+#13+'Identidade e esta Data de Entrada...',mtWarning, [mbOK], 0);
          Abort;
          MaskEdit_Identidade.SetFocus;
       end;
end;

//------------------------------------------------------------------------------
// Mostra as patentes existentes
//------------------------------------------------------------------------------

procedure TForm_Cad_Reserva.ToolButton_PatentesClick(Sender: TObject);
begin
   Application.CreateForm(TForm_Divisas, Form_Divisas);
   Form_Divisas.ShowModal;
end;



end.

