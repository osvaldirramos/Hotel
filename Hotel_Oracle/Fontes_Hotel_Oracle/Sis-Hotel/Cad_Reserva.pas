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
  StdCtrls, Forms, DBCtrls, DB, Buttons, DBTables, Mask, ExtCtrls, ComCtrls,
  Grids, DBGrids, Rotinas, ToolWin;

type
  TForm_Cad_Reserva = class(TForm)
    DST_Reserva: TDataSource;
    Table_Reserva: TTable;
    Panel3: TPanel;
    DST_Apto: TDataSource;
    StatusBar: TStatusBar;
    DSQ_Reserva: TDataSource;
    Query_Reserva: TQuery;
    Table_Apto: TTable;
    Query_Predio: TQuery;
    DSQ_Predio: TDataSource;
    Table_AptoPREDIO: TStringField;
    Query_Tabela_Posto: TQuery;
    DSQ_Tabela_Posto: TDataSource;
    Query_Busca_Hospede: TQuery;
    Table_AptoAPTO: TFloatField;
    Table_Busca_Cama: TTable;
    StringField1: TStringField;
    Table_Busca_CamaAPTO: TFloatField;
    Table_Busca_CamaCAMA: TFloatField;
    StringField4: TStringField;
    DST_Busca_Cama: TDataSource;
    DBGrid_Hospede: TDBGrid;
    Table_ReservaIDENTIDADE: TStringField;
    Table_ReservaDATAENTRADA: TDateTimeField;
    Table_ReservaNOME: TStringField;
    Table_ReservaNOME_GUERRA: TStringField;
    Table_ReservaPOSTO: TStringField;
    Table_ReservaDEPENDENTE_DE: TStringField;
    Table_ReservaSITUACAO_CURSO: TStringField;
    Table_ReservaOM_ORIGEM: TStringField;
    Table_ReservaDEPENDENTE: TFloatField;
    Table_ReservaHORAENTRADA: TStringField;
    Table_ReservaDATASAIDA: TDateTimeField;
    Table_ReservaPREDIO: TStringField;
    Table_ReservaAPTO: TFloatField;
    Table_ReservaCAMA: TFloatField;
    Table_ReservaRECEBE: TStringField;
    Table_ReservaUSUARIO: TStringField;
    Query_ReservaIDENTIDADE: TStringField;
    Query_ReservaDATAENTRADA: TDateTimeField;
    Query_ReservaNOME: TStringField;
    Query_ReservaNOME_GUERRA: TStringField;
    Query_ReservaPOSTO: TStringField;
    Query_ReservaDEPENDENTE_DE: TStringField;
    Query_ReservaTELEFONE_FUNCIONAL: TStringField;
    Query_ReservaSITUACAO_CURSO: TStringField;
    Query_ReservaOM_ORIGEM: TStringField;
    Query_ReservaDEPENDENTE: TFloatField;
    Query_ReservaHORAENTRADA: TStringField;
    Query_ReservaDATASAIDA: TDateTimeField;
    Query_ReservaPREDIO: TStringField;
    Query_ReservaAPTO: TFloatField;
    Query_ReservaCAMA: TFloatField;
    Query_ReservaRECEBE: TStringField;
    Query_ReservaUSUARIO: TStringField;
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
    Query_Procura: TQuery;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label_Nome_Guerra: TLabel;
    Label23: TLabel;
    Label_Situacao_Curso: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label_Ficha_Hospede: TLabel;
    Label1: TLabel;
    Label_Usuario: TLabel;
    Label2: TLabel;
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
    DBComboBox_Situacao_Curso: TDBComboBox;
    DBComboBox_Recebimento: TDBComboBox;
    Query_Decea: TQuery;
    Table_ReservaTELEFONE_FUNCIONAL: TStringField;
    Table_ReservaCPF: TStringField;
    Label3: TLabel;
    DBEdit_CPF: TDBEdit;
    Table_ReservaSISCEAB: TStringField;
    Label4: TLabel;
    DBComboBox_SISCEAB: TDBComboBox;
    Query_Tabela_PostoPOSTOGRADUAO: TStringField;
    Panel1: TPanel;
    MaskEdit_Busca_Nome: TMaskEdit;
    DBNavigator1: TDBNavigator;
    ToolButton1: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn_PatentesClick(Sender: TObject);

    procedure MaskEdit_Busca_NomeChange(Sender: TObject);
    procedure Query_ReservaAfterScroll(DataSet: TDataSet);
    procedure MaskEdit_IdentidadeExit(Sender: TObject);

    procedure Atualiza;
    procedure Botao(Status: Boolean);
    procedure TrataCampos(Status: Boolean);
    procedure BuscaHospede;
    procedure Busca(VS_Busca: String);
    procedure TrataInsercao;

    Function Procura(VS_Comando: String): Boolean;
    procedure Table_ReservaPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure ToolButton_InserirClick(Sender: TObject);
    procedure ToolButton_AlterarClick(Sender: TObject);
    procedure ToolButton_ExcluirClick(Sender: TObject);
    procedure ToolButton_GravarClick(Sender: TObject);
    procedure ToolButton_CancelarClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
  private
    { private declarations }
  public    { public declarations }
     VI_Codigo: integer;
     VB_ModuloInsercao, VB_Nao_Busca_Identidade, VB_Achou: Boolean;
     VS_Opcao, VS_Identidade, VS_DataEntrada: String;
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
   // Alimenta os ComboBox de Trabalho

   Funcoes.AlimentaDBComboBox(DBComboBox_Situacao_Curso, 0, '', 'SituacaoCurso.cnf');

   //--- Abre as tabelas de trabalho

   Query_Reserva.Close;
   Query_Reserva.Open;
   Table_Reserva.Open;
   Query_Predio.Open;
   Table_Apto.Open;
   Table_Busca_Cama.Open;

    //---
   //--- Verifica o tipo de usuario

   MaskEdit_Identidade.Text:= Table_Reserva.FieldByName('IDENTIDADE').AsString;

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

    //---
   //--- Atualiza o combo de selecao do Posto/Grad e Dependente_de

   Query_Tabela_Posto.Open;
   Query_Tabela_Posto.First;
   While not Query_Tabela_Posto.eof do
   begin
      DBComboBox_Posto_Graduacao.Items.Add(Query_Tabela_Posto.FieldByName('POSTOGRADUAÇÃO').AsString);
      DBComboBox_Dependente_de.Items.Add(Query_Tabela_Posto.FieldByName('POSTOGRADUAÇÃO').AsString);
      Query_Tabela_Posto.Next;
   end;

    //---
   //--- Atualiza o combo de selecao da OM origem

   Query_Decea.Open;
   Query_Decea.First;
   While not Query_Decea.eof do
   begin
      DBComboBox_OM_Origem.Items.Add(Query_Decea.FieldByName('Localidade').AsString);
      Query_Decea.Next;
   end;

   Botao(True);

   TrataCampos(True);
end;

//------------------------------------------------------------------------------
// Modulo de Inserção de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Reserva.ToolButton_InserirClick(Sender: TObject);
begin
   VS_Opcao:= 'Inserção ';
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
     VS_Opcao:= 'Alteração ';
     Botao(False);
     TrataCampos(False);
     MaskEdit_Identidade.Enabled:= False;
     Table_Reserva.Edit;
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
   VS_Comando, VS_Predio, VS_Apto, VS_NomeGuerra: String;
begin
   Botao(False);
   ToolButton_Gravar.Enabled:= False;
   ToolButton_Cancelar.Enabled:= False;
   if MessageDlg('Confirma o cancelamento da hospedagem ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      VS_NomeGuerra:= Table_Reserva.FieldByName('NOME_GUERRA').AsString;
      VS_Predio:= Table_Reserva.FieldByName('PREDIO').AsString;
      VS_Apto:= Table_Reserva.FieldByName('APTO').AsString;

      Funcoes.Log_Recepcao('Exclusão Reserva '+VS_NomeGuerra+' do Prédio '+VS_Predio+' Apto '+VS_Apto);
      Table_Reserva.Delete;
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
       if Procura(VS_Comando) = False then
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
         if Procura(VS_Comando) = False then
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
      Funcoes.Log_Recepcao(VS_Opcao+' da Reserva Prédio '+Table_Reserva.FieldByName('Predio').AsString+' Apto '+Table_Reserva.FieldByName('Apto').AsString);
      Table_Reserva.FieldByName('Cama').AsString:= Table_Busca_Cama.FieldByName('Cama').AsString;
      Table_Reserva.Post;
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
      Table_Reserva.Cancel;
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
   Query_Reserva.Close;
   Table_Reserva.Close;
   Query_Predio.Close;
   Query_Tabela_Posto.Close;
   Query_Busca_Hospede.Close;
   Table_Apto.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Procedure de Redresh da Query
//------------------------------------------------------------------------------

procedure TForm_Cad_Reserva.Atualiza;
begin
   Query_Reserva.Close;
   Query_Reserva.Open;
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

   if Query_Reserva.Recordcount = 0 then
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
end;

//------------------------------------------------------------------------------
// Mostra as patentes existentes
//------------------------------------------------------------------------------

procedure TForm_Cad_Reserva.BitBtn_PatentesClick(Sender: TObject);
begin
   Form_Divisas.ShowModal;
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

         Table_Reserva.Append;
         Table_Reserva.FieldByName('NOME').AsString:= '';
         VB_Achou:= False;

         VS_Comando:='Select * from hospede where identidade = '+#39+MaskEdit_Identidade.Text+#39;

         Query_Busca_Hospede.Close;
         Query_Busca_Hospede.SQL.Clear;
         Query_Busca_Hospede.SQL.Add(VS_Comando);
         Query_Busca_Hospede.Open;

         if Query_Busca_Hospede.RecordCount = 1 then
         begin
            //--- Tratamento dos campos quando o hospede existir

            Table_Reserva.FieldByName('IDENTIDADE').AsString:= Query_Busca_Hospede.FieldByName('IDENTIDADE').AsString;
            Table_Reserva.FieldByName('NOME').AsString:= Query_Busca_Hospede.FieldByName('NOME').AsString;
            Table_Reserva.FieldByName('NOME_GUERRA').AsString:= Query_Busca_Hospede.FieldByName('NOME_GUERRA').AsString;
            Table_Reserva.FieldByName('POSTO').AsString:= Query_Busca_Hospede.FieldByName('POSTO').AsString;
            Table_Reserva.FieldByName('TELEFONE_FUNCIONAL').AsString:= Query_Busca_Hospede.FieldByName('TELEFONE_FUNCIONAL').AsString;
            Table_Reserva.FieldByName('OM_ORIGEM').AsString:= Query_Busca_Hospede.FieldByName('OM_ORIGEM').AsString;
         end;

         Table_Reserva.FieldByName('DataEntrada').AsString:= DateToStr(Date);
         Table_Reserva.FieldByName('DataSaida').AsString:= DateToStr(Date);
         Table_Reserva.FieldByName('Dependente').AsInteger:= 0;
         Table_Reserva.FieldByName('HoraEntrada').AsString:= Funcoes.HoraAtual;
         Table_Reserva.FieldByName('Recebe').AsString:= 'H';

         Table_Reserva.FieldByName('Usuario').AsString:= Funcoes.GetUsuario;
         Table_Reserva.FieldByName('IDENTIDADE').AsString:= MaskEdit_Identidade.Text;
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
// Procedure para atualizar a Identidade ao selecionar a reserva
//------------------------------------------------------------------------------

procedure TForm_Cad_Reserva.Query_ReservaAfterScroll(DataSet: TDataSet);
begin
   if Query_Reserva.Recordcount = 0 then
   begin
      ToolButton_Alterar.Enabled:= False;
      ToolButton_Excluir.Enabled:= False;
   end;

   MaskEdit_Identidade.Text:= Table_Reserva.FieldByName('IDENTIDADE').AsString;
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

   Query_Reserva.Close;
   Query_Reserva.SQL.Clear;
   Query_Reserva.SQL.ADD(VS_Comando);
   Query_Reserva.Open;
end;

//------------------------------------------------------------------------------
// Funcao para procurar o select do VS_Comando
//------------------------------------------------------------------------------

Function TForm_Cad_Reserva.Procura(VS_Comando: String): Boolean;
begin
   Query_Procura.Close;
   Query_Procura.SQL.Clear;
   Query_Procura.SQL.Add(VS_Comando);
   Query_Procura.Open;

   if Query_Procura.RecordCount = 0 then
      Result:= False
   else
      Result:= True;
end;

//------------------------------------------------------------------------------
// Tratamento de Erro no arquivo de reserva
//------------------------------------------------------------------------------

procedure TForm_Cad_Reserva.Table_ReservaPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
    if (E is EDBEngineError) then
       if (E as EDBEngineError).Errors[0].ErrorCode = 9729 then
       begin
          MessageDlg('Já existe uma reserva com esta'+#13+#13+'Identidade e esta Data de Entrada...',mtWarning, [mbOK], 0);
          Abort;
          MaskEdit_Identidade.SetFocus;
       end;
end;

end.

