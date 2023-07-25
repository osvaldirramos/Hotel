//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Abertura.PAS                                   //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de tratar do cadas- //
//                             tro dos apto(s)                                //
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
// ATUALIZADO                : 08/03/2003                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      : 25/08/2003                                     //
// AUTOR                     : Osvaldir D Ramos                               //
// MODULO ALTERADO           :                                                //
// MOTIVO                    : Criação da coluna para tratamento de nome e    //
//                             criação do botao Limpar quando o apto estiver  //
//                             sendo ocupado por numero de ficha              //
//                                                                            //
//----------------------------------------------------------------------------//

unit Cad_Apto;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, Buttons, DBTables, Grids, ExtCtrls,
  ComCtrls, Rotinas, Mask, IBTable, IBCustomDataSet, IBQuery, ToolWin,
  Menus, JvComponent;

Const
   ASPAS= '''';

type
  TForm_Cad_Apto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar: TStatusBar;
    Table_Apto: TTable;
    DST_Apto: TDataSource;
    GroupBox1: TGroupBox;
    Table_Cama: TTable;
    DST_Cama: TDataSource;
    GroupBox_Cama: TGroupBox;
    Label_Apto: TLabel;
    Label_Ramal: TLabel;
    Label_TV: TLabel;
    Label_TV2: TLabel;
    DBEdit_Apto: TDBEdit;
    DBEdit_Ramal: TDBEdit;
    DBEdit_TV1: TDBEdit;
    DBEdit_TV2: TDBEdit;
    Table_AptoPREDIO: TStringField;
    Table_AptoTV1: TStringField;
    Table_AptoTV2: TStringField;
    Table_AptoAPTO: TFloatField;
    Table_CamaPREDIO: TStringField;
    Table_CamaAPTO: TFloatField;
    Table_CamaCAMA: TFloatField;
    Table_AptoRAMAL: TStringField;
    Table_CamaNOME: TStringField;
    Table_CamaAPTCODIGO: TStringField;
    Label1: TLabel;
    Table_AptoVIRTUAL: TStringField;
    DBComboBox1: TDBComboBox;
    DBGrid_Mapa: TDBGrid;
    Query_Monta_Mapa: TQuery;
    DSQ_Monta_Mapa: TDataSource;
    Table_Mapa_Dep: TTable;
    Table_Hospedagem: TTable;
    Table_Hospede01: TTable;
    DST_Hospedagem: TDataSource;
    Table_Hospede: TTable;
    DST_Hospede: TDataSource;
    IBQuery_Delete_Mapa: TIBQuery;
    IBQuery_Mapa: TIBQuery;
    DSQ_Mapa: TDataSource;
    IBTable_Hotel: TIBTable;
    Panel5: TPanel;
    ProgressBar1: TProgressBar;
    GroupBox3: TGroupBox;
    GroupBox2: TGroupBox;
    MaskEdit_Apto: TMaskEdit;
    ComboBox_Predio: TComboBox;
    Panel20: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    Panel37: TPanel;
    Panel38: TPanel;
    Panel40: TPanel;
    Panel41: TPanel;
    Panel52: TPanel;
    Query_Executa: TQuery;
    IBTable_TrataMapa: TIBTable;
    IBTable_TrataMapaCODIGO: TIBStringField;
    IBTable_TrataMapaIDENTIDADE: TIBStringField;
    IBTable_TrataMapaPREDIO: TIBStringField;
    IBTable_TrataMapaAPTO: TIntegerField;
    IBTable_TrataMapaCAMA: TIntegerField;
    IBTable_TrataMapaRAMAL: TIBStringField;
    IBTable_TrataMapaTV1: TIBStringField;
    IBTable_TrataMapaTV2: TIBStringField;
    IBTable_TrataMapaTIPO: TIBStringField;
    IBTable_TrataMapaSITUACAO: TIBStringField;
    IBTable_TrataMapaSITUACAO_CURSO: TIBStringField;
    IBTable_TrataMapaNOME: TIBStringField;
    IBTable_TrataMapaDATA_ENTRADA: TIBStringField;
    IBTable_TrataMapaDATA_SAIDA: TIBStringField;
    IBQuery_MapaCODIGO: TIBStringField;
    IBQuery_MapaIDENTIDADE: TIBStringField;
    IBQuery_MapaPREDIO: TIBStringField;
    IBQuery_MapaAPTO: TIntegerField;
    IBQuery_MapaCAMA: TIntegerField;
    IBQuery_MapaRAMAL: TIBStringField;
    IBQuery_MapaNOME: TIBStringField;
    IBQuery_MapaTIPO: TIBStringField;
    IBQuery_MapaSITUACAO: TIBStringField;
    IBQuery_MapaSITUACAO_CURSO: TIBStringField;
    IBQuery_MapaDATA_ENTRADA: TIBStringField;
    IBQuery_MapaDATA_SAIDA: TIBStringField;
    Panel_CadastrarCama: TPanel;
    SpeedButton_GravarCama: TSpeedButton;
    MaskEdit_Camas: TMaskEdit;
    Panel_TrataApto: TPanel;
    ToolBar1: TToolBar;
    DBGrid1: TDBGrid;
    Table_AptoVisivel: TTable;
    DST_AptoVisivel: TDataSource;
    PopupMenu1: TPopupMenu;
    AbrirJaneladeTratamento1: TMenuItem;
    Table_AptoVISIVEL2: TStringField;
    ToolBar2: TToolBar;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    ToolButton_Ajuda: TToolButton;
    ToolButton_Relatorio: TToolButton;
    ToolButton_Visivel: TToolButton;
    ToolButton_NaoVisivel: TToolButton;
    ToolButton_Fechar: TToolButton;
    ToolBar3: TToolBar;
    ToolButton_InserirCama: TToolButton;
    ToolButton_AlterarCama: TToolButton;
    ToolButton_ExcluirCama: TToolButton;
    ToolButton_GravarCama: TToolButton;
    ToolButton_IgnorarCama: TToolButton;
    ToolButton_DesocuparCama: TToolButton;
    ToolButton_NaoOcuparCama: TToolButton;
    ToolBar4: TToolBar;
    ToolButton_Inserir: TToolButton;
    ToolButton_Alterar: TToolButton;
    ToolButton_Gravar: TToolButton;
    ToolButton_Ignorar: TToolButton;
    Label_Cama: TLabel;
    Label_Situacao: TLabel;
    Label4: TLabel;
    DBEdit_Cama: TDBEdit;
    DBComboBox_Situacao: TDBComboBox;
    DBEdit_AptoCodigo: TDBEdit;
    DBNavigator1: TDBNavigator;
    ToolButton_ExcluiVisivel: TToolButton;
    procedure FormCreate(Sender: TObject);

    procedure Atualiza;
    procedure BotaoApto(Status: Boolean);
    procedure Habilita_Campos_Apto(Status: Boolean);
    procedure ComboBox_PredioChange(Sender: TObject);
    procedure Table_AptoPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure BotaoCama(Status: Boolean);
    procedure Habilita_Campos_Cama(Status: Boolean);
    Function Verifica_Existencia_Hospede: Boolean;
    procedure DBGrid_MapaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

    procedure Monta_Mapa;
    procedure Executa_Query_Monta_Mapa(Query_Monta_Mapa: TQuery;VS_Comando: String);
    Procedure LimpaMapa;
    procedure Executa_Query_Mapa(VS_Busca: String; VI_Opc: Integer);
    procedure Grava_Mapa(VI_Codigo: Integer; VS_Virtual: String; VS_Identidade: String; VS_Predio: String; VS_Apto: String; VS_Cama: String;
                            VS_Ramal: String; VS_TV1: String; VS_TV2: String;
                            VS_CABECALHO: String; VS_Situacao: String;
                            VS_Situacao_Curso: String; VS_Nome: String;
                            VS_DataEntrada: String; VS_DataSaida: String);
    procedure DBGrid_MapaCellClick(Column: TColumn);
    procedure MaskEdit_AptoKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton_GravarCamaClick(Sender: TObject);
    procedure AbrirJaneladeTratamento1Click(Sender: TObject);
    procedure ToolButton_RelatorioClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton_VisivelClick(Sender: TObject);
    procedure ToolButton_NaoVisivelClick(Sender: TObject);
    procedure ToolButton_FecharClick(Sender: TObject);
    procedure ToolButton_InserirCamaClick(Sender: TObject);
    procedure ToolButton_AlterarCamaClick(Sender: TObject);
    procedure ToolButton_ExcluirCamaClick(Sender: TObject);
    procedure ToolButton_GravarCamaClick(Sender: TObject);
    procedure ToolButton_IgnorarCamaClick(Sender: TObject);
    procedure ToolButton_DesocuparCamaClick(Sender: TObject);
    procedure ToolButton_NaoOcuparCamaClick(Sender: TObject);
    procedure ToolButton_InserirClick(Sender: TObject);
    procedure ToolButton_AlterarClick(Sender: TObject);
    procedure ToolButton_GravarClick(Sender: TObject);
    procedure ToolButton_IgnorarClick(Sender: TObject);
    procedure ToolButton_ExcluiVisivelClick(Sender: TObject);
  private    { private declarations }
    VS_Predio, VS_Apto, VS_Opcao: String;
  public     { public declarations }
  end;

var
  Form_Cad_Apto: TForm_Cad_Apto;

implementation

uses Abertura, Rel_Apartamento, Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Modulo Principal
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.FormCreate(Sender: TObject);
begin
   VS_Opcao:= 'Consulta';
   Panel_TrataApto.Visible:= False;

   Table_Hospede.Open;
   Table_Hospedagem.Open;
   Table_Mapa_Dep.Open;
   Table_Apto.Open;
   Table_Hospede01.Open;
   Table_Cama.Open;

   BotaoApto(True);
   BotaoCama(True);

   Habilita_Campos_Apto(False);
   Habilita_Campos_Cama(False);
   ComboBox_Predio.Text:= 'A';
   Monta_Mapa;
end;

//------------------------------------------------------------------------------
// Modulo de Inserção de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.ToolButton_InserirClick(Sender: TObject);
begin
   Try
     if ComboBox_Predio.Text = '' then
     begin
       Showmessage('Não foi selecionado Prédio...');
       ComboBox_Predio.SetFocus;
     end
     else
     begin
        VS_Opcao:= 'Inserir';
        Table_Apto.Append;

        //--- Tratamento para Apto

        BotaoApto(False);
        Habilita_Campos_Apto(True);

        //--- Tratamento para Cama

        Habilita_Campos_Cama(False);
        BotaoCama(False);
        ToolButton_GravarCama.Enabled:= False;
        ToolButton_IgnorarCama.Enabled:= False;

        Table_Apto.FieldByName('PREDIO').AsString:= ComboBox_Predio.Text;
        Table_Apto.FieldByName('Apto').AsString:= '';
        Table_Apto.FieldByName('VIRTUAL').AsString:= 'N';
        Table_Apto.FieldByName('VISIVEL').AsString:= 'S';
        ComboBox_Predio.Enabled:= False;

        StatusBar.SimpleText:= 'Forneça os Dados do Apartamento';
        DBEdit_Apto.SetFocus;
     end;
   Except
     MessageDlg('Erro na inserção.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Alteração de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.ToolButton_AlterarClick(Sender: TObject);
begin
   Try
     //--- Tratamento para Apto

     BotaoApto(False);
     Habilita_Campos_Apto(True);

     //--- Tratamento para Cama

     Habilita_Campos_Cama(False);
     BotaoCama(False);
     ToolButton_GravarCama.Enabled:= False;
     ToolButton_IgnorarCama.Enabled:= False;
     DBEdit_Apto.Enabled:= False;

     VS_Opcao:= 'Alterar';
     Table_Apto.Edit;
     DBEdit_Ramal.SetFocus;
   Except
     MessageDlg('Erro na Alteração.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.ToolButton_GravarClick(Sender: TObject);
var
   VS_Comando: String;
begin
   VS_Predio:= Table_Apto.FieldByName('Predio').AsString;
   VS_Apto:= DBEdit_Apto.Text;
   if VS_Opcao = 'Inserir' then
   begin
      vs_comando:= 'Select count(1) as Qtd from apartamento where predio = '+#39+VS_Predio+#39+' and Apto = '+#39+VS_Apto+#39;
      Query_Executa.Close;
      Query_Executa.SQL.Clear;
      Query_Executa.SQL.Add(VS_Comando);
      Query_Executa.Open;

      if Query_Executa.FieldByName('Qtd').AsInteger > 0 then
      begin
         ShowMessage('Apartamento ja Cadastrado.. Entrar em contato com Administrador');
         VS_Opcao:= 'Consulta';
         Atualiza;
         BotaoApto(True);
         BotaoCama(True);
         Table_AptoVisivel.Close;
         Table_AptoVisivel.Open;
         Habilita_Campos_Apto(False);
         Habilita_Campos_Cama(False);
         Monta_Mapa;
      end
      else
      begin
         Funcoes.Log_Recepcao('Cadastro de Apto - '+VS_Opcao+' Predio = '+VS_Predio);
         Table_Apto.Post;
         Panel_CadastrarCama.Visible:= True;
         MaskEdit_Camas.SetFocus;
      end;
   end
   else
   begin
      Funcoes.Log_Recepcao('Cadastro de Apto - '+VS_Opcao+' Predio = '+VS_Predio);
      Table_Apto.Post;
      VS_Opcao:= 'Consulta';
      Atualiza;
      BotaoApto(True);
      BotaoCama(True);
      Table_AptoVisivel.Close;
      Table_AptoVisivel.Open;
      Habilita_Campos_Apto(False);
      Habilita_Campos_Cama(False);
      Monta_Mapa;
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento a Insercao ou Alteracao do Apto
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.ToolButton_IgnorarClick(Sender: TObject);
begin
   Try
      VS_Opcao:= 'Consulta';
      Table_Apto.Cancel;
      Atualiza;

      BotaoApto(True);
      BotaoCama(True);
      Habilita_Campos_Apto(False);
      Habilita_Campos_Cama(False);
   Except
      MessageDlg('Erro na Cancelamento.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de tratamento dos relatorio dos Apto
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.ToolButton_RelatorioClick(Sender: TObject);
begin
   QRLabelsForm_Apto.Preview;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.ToolButton_RetornarClick(Sender: TObject);
begin
   Table_Cama.Close;
   Table_Apto.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Procedure de Redresh da Query
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.Atualiza;
begin
   Table_Apto.Active:= False;
   Table_Apto.Active:= true;
end;

//------------------------------------------------------------------------------
// Habilita o acesso aos campos de tratamento do Apto
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.Habilita_Campos_Apto(Status: Boolean);
begin
   if Status = True then
   begin
      ComboBox_Predio.Enabled:= False;
      DBEdit_Apto.ReadOnly:= False;
      DBEdit_Ramal.ReadOnly:= False;
      DBEdit_TV1.ReadOnly:= False;
      DBEdit_TV2.ReadOnly:= False;
   end
   else
   begin
      ComboBox_Predio.Enabled:= True;
      DBEdit_Apto.ReadOnly:= True;
      DBEdit_Ramal.ReadOnly:= True;
      DBEdit_TV1.ReadOnly:= True;
      DBEdit_TV2.ReadOnly:= True;
   end;
end;

//------------------------------------------------------------------------------
// Trata da habilitacao dos Botoes de tratamento de apto
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.BotaoApto(Status: Boolean);
begin
   ToolButton_Inserir.Enabled:= Status;
   ToolButton_Alterar.Enabled:= Status;
   ToolButton_Relatorio.Enabled:= Status;
   ToolButton_Retornar.Enabled:= Status;
   ToolButton_Windows.Enabled:= Status;

   if Status = True then
   begin
      ToolButton_Ignorar.Enabled:= False;
      ToolButton_Gravar.Enabled:= False;
   end
   else
   begin
      ToolButton_Ignorar.Enabled:= True;
      ToolButton_Gravar.Enabled:= True;
   end;
end;

procedure TForm_Cad_Apto.ComboBox_PredioChange(Sender: TObject);
begin
   Monta_Mapa
end;

//------------------------------------------------------------------------------
// Tratamento do Erro de Inclusão de um determinado Apto
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.Table_AptoPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
    if (E is EDBEngineError) then
       if (E as EDBEngineError).Errors[0].ErrorCode = 9729 then
       begin
          MessageDlg('Este Apartamento já foi cadastrado...',mtWarning, [mbOK], 0);
          Abort;
          DBEdit_Apto.SetFocus;
       end;
end;

//------------------------------------------------------------------------------
//
// Tratamento da Cama
// Atualizado em : 28/02/2003
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Modulo de Inserção da Cama
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.ToolButton_InserirCamaClick(Sender: TObject);
var
   VS_Comando: String;
begin
   Try
     VS_Opcao:= 'Inserir';
     Table_Cama.Append;
     Table_Cama.FieldByName('APTCODIGO').AsString:= 'DESOCUPADO';

     //---
     //--- Pega a ultima cama

      VS_Comando:= 'Select count(1)+1 QtdReg from aptocama '+
                   ' where Predio = '+#39+IBQuery_Mapa.FieldByName('Predio').AsString+#39+
                   ' and Apto = '+IBQuery_Mapa.FieldByName('Apto').AsString;

      Table_Cama.FieldByName('Cama').AsInteger:= Funcoes.QtdRegistro(VS_Comando);

     //--- Tratamento para Apto

     Habilita_Campos_Apto(False);
     BotaoApto(False);
     ToolButton_Gravar.Enabled:= False;
     ToolButton_Ignorar.Enabled:= False;

     //--- Tratamento para Cama

     Habilita_Campos_Cama(True);
     BotaoCama(False);

     StatusBar.SimpleText:= 'Entre com os dados da cama';
     DBEdit_AptoCodigo.SetFocus;
   Except
     MessageDlg('Erro na inserção da cama.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Alteracao da Cama
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.ToolButton_AlterarCamaClick(Sender: TObject);
begin
   Try
        VS_Opcao:= 'Alterar';
        Table_Cama.Edit;

        //--- Tratamento para Apto

        Habilita_Campos_Apto(False);
        BotaoApto(False);
        ToolButton_Gravar.Enabled:= False;
        ToolButton_Ignorar.Enabled:= False;

        //--- Tratamento para Cama

        Habilita_Campos_Cama(True);
        BotaoCama(False);

     StatusBar.SimpleText:= 'Entre com os dados da cama';
        DBEdit_Cama.SetFocus;
   Except
     MessageDlg('Erro na Alteração da cama.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Exclusao da Cama
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.ToolButton_ExcluirCamaClick(Sender: TObject);
var
   VS_Comando: String;
begin
   VS_Comando:= 'Select count(1) as Qtd From Hospedagem where Predio = '+#39+VS_Predio+#39+
                ' and Apto = '+IBQuery_Mapa.FieldByName('Apto').AsString+
                ' and Cama = '+IBQuery_Mapa.FieldByName('CAMA').AsString;
   Query_Executa.Close;
   Query_Executa.SQL.Clear;
   Query_Executa.SQL.Add(VS_Comando);
   Query_Executa.Open;

   if Query_Executa.FieldByName('Qtd').AsInteger = 0 then
   begin
     if  AnsiUpperCase(Table_Cama.FieldByName('AptCodigo').AsString) = 'OCUPADO' then
     begin
         MessageDlg('A cama '+Table_Cama.FieldByName('CAMA').AsString+' do Apartamento possui Hóspede Cadastrado...', mtInformation,[mbOk], 0);
     end
     else
     begin
       //--- Tratamento para Cama

       BotaoCama(False);
       ToolButton_GravarCama.Enabled:= False;
       ToolButton_IgnorarCama.Enabled:= False;

       //--- Tratamento para Apto

       BotaoApto(False);
       ToolButton_Gravar.Enabled:= False;
       ToolButton_Ignorar.Enabled:= False;

       if MessageDlg('Confirma a exclusão ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       begin
          Funcoes.Log_Recepcao('Cadastro de Cama - Exclusão da Cama do Prédio '+VS_Predio+'Apto = '+Table_Apto.FieldByName('Apto').AsString+' Cama = '+Table_Cama.FieldByName('CAMA').AsString);
          Table_Cama.Delete;
          Monta_Mapa;
       end;
     end;
   end
   else
   begin
       Funcoes.Log_Recepcao('Cadastro de Cama - Tentativa de Exclusão da Cama do Prédio '+VS_Predio+'Apto = '+Table_Apto.FieldByName('Apto').AsString+' Cama = '+Table_Cama.FieldByName('CAMA').AsString);
       ShowMessage('A cama '+Table_Cama.FieldByName('CAMA').AsString+' do Apartamento possui Hóspede Cadastrado...');
   end;
   BotaoCama(True);
   BotaoApto(True);
end;

//------------------------------------------------------------------------------
// Modulo de tratamento da inclusao ou alteracao dos dados do apto
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.ToolButton_GravarCamaClick(Sender: TObject);
begin
   if ((Table_Cama.FieldByName('AptCodigo').AsString = 'DESOCUPADO') or
       (Table_Cama.FieldByName('AptCodigo').AsString = 'NÃO OCUPAR')) then
   begin
      Funcoes.Log_Recepcao('Cadastro de Cama - '+VS_Opcao+' Predio = '+VS_Predio+' Cama = '+Table_Cama.FieldByName('CAMA').AsString);
      Table_Cama.Post;

      Table_Cama.Close;
      Table_Cama.Open;

      BotaoApto(True);
      BotaoCama(True);
      Habilita_Campos_Apto(False);
      Habilita_Campos_Cama(False);
      Monta_Mapa;
   end
   else
   begin
      ShowMessage('A situação de Hospedagem deve ser somente "DESOCUPADO" ou "NÃO OCUPAR"...');
      DBComboBox_Situacao.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento a Insercao ou Alteracao da Cama
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.ToolButton_IgnorarCamaClick(Sender: TObject);
begin
   Try
      Table_Cama.Cancel;
      BotaoApto(True);
      BotaoCama(True);
      Habilita_Campos_Apto(False);
      Habilita_Campos_Cama(False);
   Except
      MessageDlg('Erro na Cancelamento da inserção ou alteração da cama.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Habilita Botoes de tratamento da cama
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.BotaoCama(Status: Boolean);
begin
   ToolButton_InserirCama.Enabled:= Status;
   ToolButton_AlterarCama.Enabled:= Status;
   ToolButton_ExcluirCama.Enabled:= Status;
   ToolButton_DesocuparCama.Enabled:= Status;
   ToolButton_NaoOcuparCama.Enabled:= Status;
   if Status = True then
   begin
      ToolButton_IgnorarCama.Enabled:= False;
      ToolButton_GravarCama.Enabled:= False;
   end
   else
   begin
      ToolButton_IgnorarCama.Enabled:= True;
      ToolButton_GravarCama.Enabled:= True;
   end;

   if IBQuery_Mapa.FieldByName('Tipo').AsString = '3' then     // Desocupado
   begin
      ToolButton_DesocuparCama.Enabled:= False;
   end
   else
   begin
      if (IBQuery_Mapa.FieldByName('Tipo').AsString = '0') then  // Cabecalho
      begin
         ToolButton_AlterarCama.Enabled:= False;
         ToolButton_ExcluirCama.Enabled:= False;
         ToolButton_DesocuparCama.Enabled:= False;
         ToolButton_NaoOcuparCama.Enabled:= False;
      end
      else
      begin
         if (IBQuery_Mapa.FieldByName('Tipo').AsString = '1') then   // Ocupado
         begin
            ToolButton_AlterarCama.Enabled:= False;
            ToolButton_ExcluirCama.Enabled:= False;
            ToolButton_NaoOcuparCama.Enabled:= False;
         end
         else
         begin
            if IBQuery_Mapa.FieldByName('Tipo').AsString = '4' then  // Não Desocupado
            begin
               ToolButton_AlterarCama.Enabled:= False;
               ToolButton_ExcluirCama.Enabled:= False;
               ToolButton_DesocuparCama.Enabled:= False;
            end
            else
            begin
               if IBQuery_Mapa.FieldByName('Tipo').AsString = '5' then   // NAO OCUPAR
               begin
                  ToolButton_InserirCama.Enabled:= False;
                  ToolButton_AlterarCama.Enabled:= False;
                  ToolButton_ExcluirCama.Enabled:= False;
                  ToolButton_NaoOcuparCama.Enabled:= False;
               end;
            end;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Habilita o acesso aos campos de tratamento da Cama
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.Habilita_Campos_Cama(Status: Boolean);
begin
   DBEdit_Cama.Enabled:= Status;
   DBComboBox_Situacao.Enabled:= Status;
   DBEdit_AptoCodigo.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Verifica se existe hospede no apartamento
//------------------------------------------------------------------------------

Function TForm_Cad_Apto.Verifica_Existencia_Hospede: Boolean;
var
   Retorno: Boolean;
begin
   Retorno:= True;
   Table_Cama.First;
   While not Table_Cama.Eof do
   begin
      if (Trim(Table_Cama.FieldByName('APTCODIGO').AsString) <> 'DESOCUPADO') then
      begin
          Retorno:= False;
      end;
      Table_Cama.Next;
   end;

   Result:= Retorno;
end;

//------------------------------------------------------------------------------
// Modulo de tratamento da Desocupacao da Cama
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.ToolButton_DesocuparCamaClick(Sender: TObject);
var
   VS_Comando: String;
   VB_Desocupadar: boolean;
begin
   Try
      VB_Desocupadar:= true;

      //---
      //--- Verifica se o apto possui hospede

      VS_Comando:= 'Select count(*) Nreg from hospedagem '+
                   ' where Predio = '+#39+Table_Cama.FieldByName('Predio').AsString+#39+
                   ' and Apto = '+Table_Cama.FieldByName('Apto').AsString+
                   ' and Cama = '+Table_Cama.FieldByName('Cama').AsString;

      Query_Executa.Close;
      Query_Executa.Sql.Clear;
      Query_Executa.Sql.Add(VS_Comando);
      Query_Executa.Open;

      if Query_Executa.FieldByName('Nreg').AsInteger > 0 then
      begin
         if MessageDlg('Apto possui hospede, verificar no cadastro de Hospede se não é o caso de fechar a hospedagem.'+#13+#13+' Confirma a DESOCUPAÇÃO ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            VB_Desocupadar:= true
         else
            VB_Desocupadar:= False;
      end
      else
      begin
          //---
         //--- Verifica se o apto possui dependente de hospede

         VS_Comando:= 'Select count(*) Nreg from dependente '+
                      ' where Predio = '+#39+Table_Cama.FieldByName('Predio').AsString+#39+
                      ' and Apto = '+Table_Cama.FieldByName('Apto').AsString+
                      ' and Cama = '+Table_Cama.FieldByName('Cama').AsString;

         Query_Executa.Close;
         Query_Executa.Sql.Clear;
         Query_Executa.Sql.Add(VS_Comando);
         Query_Executa.Open;

         if Query_Executa.FieldByName('Nreg').AsInteger > 0 then
         begin
            if MessageDlg('Apto possui dependente, verificar no cadastro de Hospede se não é o caso de fechar a hospedagem.'+#13+#13+' Confirma a DESOCUPAÇÃO ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
               VB_Desocupadar:= true
            else
               VB_Desocupadar:= False;
         end;
      end;

      if VB_Desocupadar = true then
      begin
         //--- Tratamento de Limpeza do Apto

         Table_Cama.Edit;
         Table_Cama.FieldByName('APTCODIGO').AsString:= 'DESOCUPADO';
         Table_Cama.fieldByName('NOME').AsString:= '';
         Table_Cama.Post;
         Table_Cama.Close;
         Table_Cama.Open;
         Funcoes.Log_Recepcao('Cadastro de Apto - DESOCUPAR Predio = '+VS_Predio);
         Monta_Mapa;
      end;
   Except
     MessageDlg('Erro na Desocupação da cama.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de tratamento da Não Ocupacao
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.ToolButton_NaoOcuparCamaClick(Sender: TObject);
begin
   Try
     Table_Cama.Edit;
     Table_Cama.FieldByName('APTCODIGO').AsString:= 'NÃO OCUPAR';

     //--- Tratamento para Apto

     Habilita_Campos_Apto(False);
     BotaoApto(False);
     ToolButton_Gravar.Enabled:= False;
     ToolButton_Ignorar.Enabled:= False;

     //--- Tratamento para Cama

     Habilita_Campos_Cama(True);
     BotaoCama(False);

     StatusBar.SimpleText:= 'Forneça o motivo para não ocupar';
     DBEdit_AptoCodigo.SetFocus;
   Except
     MessageDlg('Erro na Não Ocupacao da cama.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Incia a montagem do mapa
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.Monta_Mapa;
var
   VS_Comando: String;
   VI_Codigo: Integer;
   VS_Predio, VS_Apto: String;
   bmLocal : TBookmark;
begin
   bmLocal:= Query_Monta_Mapa.GetBookMark;

   if trim(ComboBox_Predio.Text) <> '' then
   begin
      VI_Codigo:= 0;
      LimpaMapa;

       //---
      //--- Montagem do Mapa de Ocupacao  - Hospedagem / Reserva / Dependente

//      VS_Comando:= 'select ap.predio, ap.apto, ap.ramal, ap.tv1, ap.tv2, ap.virtual, ac.cama, ac.aptcodigo, ac.nome '+
//                      'from apartamento ap, aptocama ac '+
//                      'where (ap.predio = ac.predio and ap.apto = ac.apto) '+
//                      ' and ap.visivel = '+Aspas+'S'+Aspas;

      VS_Comando:= 'select predio, apto, ramal, tv1, tv2, virtual, cama, aptcodigo, nome '+
                      'from Apto_View ';

      if ComboBox_Predio.Text <> 'Todos' then
          VS_Comando:= VS_Comando+' Where predio = '+Aspas+ComboBox_Predio.Text+Aspas;

      if trim(MaskEdit_Apto.Text) <> '' then
         if ((ComboBox_Predio.Text <> 'Todos') and (ComboBox_Predio.Text <> '')) then
            VS_Comando:= VS_Comando+' and apto = '+MaskEdit_Apto.Text
         else
            VS_Comando:= VS_Comando+' Where apto = '+MaskEdit_Apto.Text;

      VS_Comando:= VS_Comando+' order by predio, apto, cama';

      Executa_Query_Monta_Mapa(Query_Monta_Mapa, VS_Comando);
      ProgressBar1.Max:= Query_Monta_Mapa.RecordCount;

      VS_Predio:= '';
      VS_Apto:= '';

      While not Query_Monta_Mapa.Eof do
      begin
         ProgressBar1.StepBy(1);
         Update;

         //---
         //--- Monta o cabecalho

         if (( VS_Predio <> Query_Monta_Mapa.FieldByName('PREDIO').AsString) or
             ( VS_Apto <> Query_Monta_Mapa.FieldByName('apto').AsString)) then
         begin
            VS_Predio:=Query_Monta_Mapa.FieldByName('PREDIO').AsString;
            VS_Apto:=  Query_Monta_Mapa.FieldByName('apto').AsString;
            VI_Codigo:= VI_Codigo + 1;

            Grava_Mapa(VI_Codigo,
                       Query_Monta_Mapa.FieldByName('virtual').AsString,
                       ' ',
                       Query_Monta_Mapa.FieldByName('PREDIO').AsString,
                       Query_Monta_Mapa.FieldByName('APTO').AsString,
                       '0',
                       Query_Monta_Mapa.FieldByName('RAMAL').AsString,
                       ' ',
                       ' ',
                       CABECALHO,
                       Query_Monta_Mapa.FieldByName('PREDIO').AsString+'    '+
                          Query_Monta_Mapa.FieldByName('APTO').AsString+'    R. '+
                          Query_Monta_Mapa.FieldByName('RAMAL').AsString+'    -    '+
                          Query_Monta_Mapa.FieldByName('TV1').AsString+'  '+
                          Query_Monta_Mapa.FieldByName('TV2').AsString,
                       ' ',
                       ' ',
                       ' ',
                       ' '
                      );
         end;

          //---
         //--- Tratamento quando tiver hospode

         if Trim(AnsiUpperCase(Query_Monta_Mapa.FieldByName('APTCODIGO').AsString)) = 'OCUPADO' then
         begin
            VI_Codigo:= VI_Codigo + 1;
            Grava_Mapa(VI_Codigo,
                        Query_Monta_Mapa.FieldByName('virtual').AsString,
                        Table_Hospede.FieldByName('Identidade').AsString,
                        Query_Monta_Mapa.FieldByName('PREDIO').AsString,
                        Query_Monta_Mapa.FieldByName('apto').AsString,
                        Query_Monta_Mapa.FieldByName('cama').AsString,
                        Query_Monta_Mapa.FieldByName('Ramal').AsString,
                        ' ',
                        ' ',
                        OCUPADO,
                        Query_Monta_Mapa.FieldByName('Cama').AsString+' - '+
                           trim(Table_Hospede.FieldByName('Posto').AsString)+' '+
                           Table_Hospede.FieldByName('NOME_GUERRA').AsString,
                        Table_Hospede.FieldByName('situacao_curso').AsString,
                        Table_Hospede.FieldByName('nome').AsString,
                        Table_Hospedagem.FieldByName('DataEntrada').AsString,
                        Table_Hospedagem.FieldByName('DataSaida').AsString
                       );
         end
         else
         begin
             //---
            //--- DEPENDENTE DE HOSPEDE

            if Trim(Query_Monta_Mapa.FieldByName('APTCODIGO').AsString) = 'DEP' then
            begin
               VI_Codigo:= VI_Codigo + 1;
               Grava_Mapa(VI_Codigo,
                          Query_Monta_Mapa.FieldByName('virtual').AsString,
                          ' ',
                          Query_Monta_Mapa.FieldByName('PREDIO').AsString,
                          Query_Monta_Mapa.FieldByName('apto').AsString,
                          Query_Monta_Mapa.FieldByName('cama').AsString,
                          Query_Monta_Mapa.FieldByName('Ramal').AsString,
                          ' ',
                          ' ',
                          OCUPADO,
                          Query_Monta_Mapa.FieldByName('cama').AsString+' - DEP - '+Table_Mapa_Dep.FieldByName('Nome').AsString,
                          'DEPENDENTE',
                          'DEP - '+Table_Mapa_Dep.FieldByName('Nome').AsString,
                          ' ',
                          ' '
                          );
            end
            else
            begin     //--- DESOCUPADO
               if Trim(Query_Monta_Mapa.FieldByName('APTCODIGO').AsString) = 'DESOCUPADO' then
               begin
                  VI_Codigo:= VI_Codigo + 1;
                  Grava_Mapa(VI_Codigo,
                             Query_Monta_Mapa.FieldByName('virtual').AsString,
                             ' ',
                             Query_Monta_Mapa.FieldByName('PREDIO').AsString,
                             Query_Monta_Mapa.FieldByName('apto').AsString,
                             Query_Monta_Mapa.FieldByName('cama').AsString,
                             Query_Monta_Mapa.FieldByName('Ramal').AsString,
                             ' ',
                             ' ',
                             DESOCUPADO,
                             Query_Monta_Mapa.FieldByName('cama').AsString+' - DESOCUPADO',
                             ' ',
                             ' ',
                             ' ',
                             ' '
                            );
               end
               else
               begin
                 if Query_Monta_Mapa.FieldByName('NOME').AsString = 'NÃO DESOCUPADO' then
                 begin
                    VI_Codigo:= VI_Codigo + 1;
                    Grava_Mapa(VI_Codigo,
                               Query_Monta_Mapa.FieldByName('virtual').AsString,
                               ' ',
                               Query_Monta_Mapa.FieldByName('PREDIO').AsString,
                               Query_Monta_Mapa.FieldByName('apto').AsString,
                               Query_Monta_Mapa.FieldByName('cama').AsString,
                               Query_Monta_Mapa.FieldByName('Ramal').AsString,
                               ' ',
                               ' ',
                               NAODESOCUPADO,
                               Query_Monta_Mapa.FieldByName('cama').AsString+' - '+Trim(Table_Hospede01.FieldByName('Posto').AsString)+' - '+Trim(Table_Hospede01.FieldByName('Nome_Guerra').AsString),
                               Table_Hospede01.FieldByName('SITUACAO_CURSO').AsString,
                               Table_Hospede01.FieldByName('NOME').AsString,
                               ' ',
                               ' '
                             );
                 end
                 else
                 begin
                    if Query_Monta_Mapa.FieldByName('APTCODIGO').AsString = 'NÃO OCUPAR' then
                    begin
                       VI_Codigo:= VI_Codigo + 1;
                       Grava_Mapa(VI_Codigo,
                                  Query_Monta_Mapa.FieldByName('virtual').AsString,
                                  ' ',
                                  Query_Monta_Mapa.FieldByName('PREDIO').AsString,
                                  Query_Monta_Mapa.FieldByName('apto').AsString,
                                  Query_Monta_Mapa.FieldByName('cama').AsString,
                                  Query_Monta_Mapa.FieldByName('Ramal').AsString,
                                  ' ',
                                  ' ',
                                  NAOOCUPAR,
                                  Query_Monta_Mapa.FieldByName('cama').AsString+' - '+Trim(Query_Monta_Mapa.FieldByName('Nome').AsString),
                                  'NÃO OCUPAR',
                                  Query_Monta_Mapa.FieldByName('NOME').AsString,
                                  ' ',
                                  ' '
                                  );
                    end;
                 end;
               end;
            end;
         end;
         Query_Monta_Mapa.Next;
      end;

      DM.IBTransaction_HotelLocal.Commit;
      Executa_Query_Mapa('', 0);

      ProgressBar1.Position:= 0;
      DBGrid_Mapa.SetFocus;
   end;
end;

//------------------------------------------------------------------------------
// Monta query de consulta para montagem do mapa
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.Executa_Query_Monta_Mapa(Query_Monta_Mapa: TQuery;VS_Comando: String);
begin
   Query_Monta_Mapa.Close;
   Query_Monta_Mapa.Sql.Clear;
   Query_Monta_Mapa.Sql.Add(VS_Comando);
   Query_Monta_Mapa.Open;
end;

//------------------------------------------------------------------------------
// Verifica se o arquivo para montar o mapa existe
//------------------------------------------------------------------------------

Procedure TForm_Cad_Apto.LimpaMapa;
begin
    if FileExists('C:\DataBase_ICEA\DB_HotelMapa\HOTELMAPA.GDB') = True then
    begin
       IBQuery_Delete_Mapa.ExecSQL;
       DM.IBTransaction_HotelLocal.Commit;
       IBTable_Hotel.Close;
       IBTable_Hotel.Open;
    end
    else
    begin
        MessageDlg('O Arquivo C:\DataBase_ICEA\DB_HotelMapa\HOTELMAPA.GDB, foi apagado, '+#13+'favor entrar em contato como o administrador ...',mtError, [mbOk],0);
        Application.Terminate;
    end;
end;

//------------------------------------------------------------------------------
// Grava os dados do Mapa
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.Grava_Mapa(VI_Codigo: Integer; VS_Virtual: String; VS_Identidade: String; VS_Predio: String; VS_Apto: String; VS_Cama: String;
                            VS_Ramal: String; VS_TV1: String; VS_TV2: String;
                            VS_CABECALHO: String; VS_Situacao: String;
                            VS_Situacao_Curso: String; VS_Nome: String;
                            VS_DataEntrada: String; VS_DataSaida: String);
begin
   IBTable_Hotel.Append;
   IBTable_Hotel.FieldByName('Codigo').AsInteger:= VI_Codigo;
   IBTable_Hotel.FieldByName('Identidade').AsString:= VS_Identidade;
   IBTable_Hotel.FieldByName('predio').AsString:= VS_Predio;
   IBTable_Hotel.FieldByName('apto').AsString:= VS_Apto;
   IBTable_Hotel.FieldByName('cama').AsString:= VS_Cama;
   IBTable_Hotel.FieldByName('ramal').AsString:= VS_Ramal;
   IBTable_Hotel.FieldByName('tv1').AsString:= VS_TV1;
   IBTable_Hotel.FieldByName('tv2').AsString:= VS_TV2;
   IBTable_Hotel.FieldByName('tipo').AsString:= VS_CABECALHO;
   IBTable_Hotel.FieldByName('situacao').AsString:= VS_Situacao;
   IBTable_Hotel.FieldByName('situacao_curso').AsString:= VS_Situacao_Curso;
   IBTable_Hotel.FieldByName('nome').AsString:= VS_Nome;
   if trim(VS_DataEntrada) <> '' then
      IBTable_Hotel.FieldByName('data_entrada').AsString:= VS_DataEntrada;
   if trim(VS_DataSaida) <> '' then
      IBTable_Hotel.FieldByName('data_saida').AsString:= VS_DataSaida;
   IBTable_Hotel.Post;
end;

//------------------------------------------------------------------------------
// Tratamento de selecao do opcao de procura de hospede
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.Executa_Query_Mapa(VS_Busca: String; VI_Opc: Integer);
var
   VS_Comando: String;
begin
   VS_Comando:= 'select Identidade, codigo, predio, apto, cama, ramal, nome, tipo, situacao, situacao_curso, data_entrada, Data_Saida '+
                ' From mapa '+
                ' Order by predio, apto, cama ';

   IBQuery_Mapa.Close;
   IBQuery_Mapa.Sql.Clear;
   IBQuery_Mapa.Sql.Add(VS_Comando);
   IBQuery_Mapa.Open;
end;

procedure TForm_Cad_Apto.DBGrid_MapaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
//   BotaoCama(True);

   if IBQuery_Mapa.FieldByName('Tipo').AsString = '3' then     // Desocupado
   begin
      ToolButton_DesocuparCama.Enabled:= False;
      DBGrid_Mapa.Canvas.Brush.Color:= clInfoBk;
      DBGrid_Mapa.Canvas.Font.Color:= clBlack;
   end
   else
   begin
      if (IBQuery_Mapa.FieldByName('Tipo').AsString = '0') then  // Cabecalho
      begin
         ToolButton_InserirCama.Enabled:= False;
         ToolButton_AlterarCama.Enabled:= False;
         ToolButton_ExcluirCama.Enabled:= False;
         ToolButton_DesocuparCama.Enabled:= False;
         ToolButton_NaoOcuparCama.Enabled:= False;
         DBGrid_Mapa.Canvas.Brush.Color:= clSilver;
         DBGrid_Mapa.Canvas.Font.Color:= clBlack;
      end
      else
      begin
         if (IBQuery_Mapa.FieldByName('Tipo').AsString = '1') then   // Ocupado
         begin
            ToolButton_NaoOcuparCama.Enabled:= False;
            if (IBQuery_Mapa.FieldByName('Data_Saida').AsString = '' ) then
            begin
               DBGrid_Mapa.Canvas.Brush.Color:= clTeal;
               DBGrid_Mapa.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if (StrToDate(IBQuery_Mapa.FieldByName('Data_Saida').AsString) < date ) then
               begin
                  DBGrid_Mapa.Canvas.Brush.Color:= clAqua;
                  DBGrid_Mapa.Canvas.Font.Color:= clBlack;
               end
               else
               begin
                  DBGrid_Mapa.Canvas.Brush.Color:= clTeal;
                  DBGrid_Mapa.Canvas.Font.Color:= clWhite;
               end;
            end;
         end
         else
         begin
            if IBQuery_Mapa.FieldByName('Tipo').AsString = '2' then   // Reserva
            begin
               DBGrid_Mapa.Canvas.Brush.Color:= clRed;
               DBGrid_Mapa.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Mapa.FieldByName('Tipo').AsString = '4' then  // Não Desocupado
               begin
                  DBGrid_Mapa.Canvas.Brush.Color:= clBlue;
                  DBGrid_Mapa.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Mapa.FieldByName('Tipo').AsString = '5' then   // NAO OCUPAR
                  begin
                     DBGrid_Mapa.Canvas.Brush.Color:= clYellow;
                     DBGrid_Mapa.Canvas.Font.Color:= clBlack;
                  end;
               end;
            end;
         end;
      end;
   end;
   DBGrid_Mapa.Canvas.FillRect(Rect);
   DBGrid_Mapa.Canvas.TextOut(Rect.Left+2,Rect.Top,Column.Field.AsString);
end;

//------------------------------------------------------------------------------
// Procedure para tratar da selecao dos botoes
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.DBGrid_MapaCellClick(Column: TColumn);
begin
   BotaoCama(True);
end;

procedure TForm_Cad_Apto.MaskEdit_AptoKeyPress(Sender: TObject;var Key: Char);
begin
   if Key = #13 then
      Monta_Mapa
end;

//------------------------------------------------------------------------------
// Cadastra cama quando for cadastrado o apto
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.SpeedButton_GravarCamaClick(Sender: TObject);
var
   i: integer;
   bmLocal : TBookmark;
begin
    bmLocal:= IBQuery_Mapa.GetBookMark;
   //--- Grava a primeira Cama

   if ((VS_Predio <> '') and (VS_Apto <> '')) then
   begin
      for i:= 1 to StrToInt(MaskEdit_Camas.Text) do
      begin
         Table_Cama.Append;
         Table_Cama.FieldByName('PREDIO').AsString:= VS_Predio;
         Table_Cama.FieldByName('APTO').AsString:= VS_Apto;
         Table_Cama.FieldByName('APTCODIGO').AsString:= 'DESOCUPADO';
         Table_Cama.FieldByName('NOME').AsString:= '';
         Table_Cama.FieldByName('CAMA').AsInteger:= i;
         Table_Cama.Post;
      end;
      VS_Predio:= '';
      VS_Apto:= '';

      Panel_CadastrarCama.Visible:= False;
   end;

   VS_Opcao:= 'Consulta';
   Atualiza;
   BotaoApto(True);
   BotaoCama(True);
   Habilita_Campos_Apto(False);
   Habilita_Campos_Cama(False);
   Monta_Mapa;
   Query_Monta_Mapa.GotoBookMark(bmLocal);
   Query_Monta_Mapa.FreeBookMark(bmLocal);
end;

procedure TForm_Cad_Apto.ToolButton_VisivelClick(Sender: TObject);
begin
   Table_AptoVisivel.Edit;
   Table_AptoVisivel.FieldByName('Visivel').AsString:= 'S';
   Table_AptoVisivel.Post;
   Table_AptoVisivel.Close;
   Table_AptoVisivel.Open;
end;

procedure TForm_Cad_Apto.ToolButton_NaoVisivelClick(Sender: TObject);
begin
   Table_AptoVisivel.Edit;
   Table_AptoVisivel.FieldByName('Visivel').AsString:= 'N';
   Table_AptoVisivel.Post;
   Table_AptoVisivel.Close;
   Table_AptoVisivel.Open;
end;

procedure TForm_Cad_Apto.ToolButton_FecharClick(Sender: TObject);
begin
   Table_AptoVisivel.Close;
   Panel_TrataApto.Visible:= False;
end;

procedure TForm_Cad_Apto.AbrirJaneladeTratamento1Click(Sender: TObject);
begin
   Table_AptoVisivel.Open;
   Panel_TrataApto.Visible:= True;
end;

procedure TForm_Cad_Apto.ToolButton_ExcluiVisivelClick(Sender: TObject);
begin
   Table_AptoVisivel.Delete;
   Table_AptoVisivel.Close;
   Table_AptoVisivel.Open;
end;

end.


