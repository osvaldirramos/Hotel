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
  StdCtrls, Forms, DBCtrls, DB, DBGrids, Buttons, Grids, ExtCtrls, DBTables,
  ComCtrls, Rotinas, Mask, IBTable, IBCustomDataSet, IBQuery, ToolWin,
  JvComponent, JvEnterTab;

type
  TForm_Cad_Apto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar: TStatusBar;
    DST_Apto: TDataSource;
    GroupBox1: TGroupBox;
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
    Label1: TLabel;
    DBComboBox1: TDBComboBox;
    DBGrid_Mapa: TDBGrid;
    DSQ_Monta_Mapa: TDataSource;
    DST_Hospedagem: TDataSource;
    DST_Hospede: TDataSource;
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
    Panel_CadastrarCama: TPanel;
    SpeedButton_GravarCama: TSpeedButton;
    ToolBar2: TToolBar;
    ToolButton_Relatorio: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    Label_Cama: TLabel;
    Label_Situacao: TLabel;
    Label4: TLabel;
    DBEdit_Cama: TDBEdit;
    DBComboBox_Situacao: TDBComboBox;
    DBEdit_AptoCodigo: TDBEdit;
    IBQuery_Monta_Mapa: TIBQuery;
    IBTable_Mapa_Dep: TIBTable;
    IBTable_Hospedagem: TIBTable;
    IBTable_Hospede01: TIBTable;
    IBTable_Hospede: TIBTable;
    IBTable_Apto: TIBTable;
    IBTable_AptoPREDIO: TIBStringField;
    IBTable_AptoAPTO: TSmallintField;
    IBTable_AptoRAMAL: TIBStringField;
    IBTable_AptoTV1: TIBStringField;
    IBTable_AptoTV2: TIBStringField;
    IBTable_AptoVIRTUAL: TIBStringField;
    IBTable_Cama: TIBTable;
    IBTable_CamaPREDIO: TIBStringField;
    IBTable_CamaAPTO: TSmallintField;
    IBTable_CamaCAMA: TSmallintField;
    IBTable_CamaAPTCODIGO: TIBStringField;
    IBTable_CamaNOME: TIBStringField;
    MaskEdit_Camas: TMaskEdit;
    ToolBar4: TToolBar;
    ToolButton_Inserir: TToolButton;
    ToolButton_Alterar: TToolButton;
    ToolButton_Gravar: TToolButton;
    ToolButton_Ignorar: TToolButton;
    ToolBar3: TToolBar;
    ToolButton_InserirCama: TToolButton;
    ToolButton_AlterarCama: TToolButton;
    ToolButton_ExcluirCama: TToolButton;
    ToolButton_GravarCama: TToolButton;
    ToolButton_IgnorarCama: TToolButton;
    ToolButton_Desocupar: TToolButton;
    ToolButton_NaoOcuparCama: TToolButton;
    ToolButton_Excluir: TToolButton;
    JvEnterAsTab1: TJvEnterAsTab;
    IBTable_Apto_Del: TIBTable;
    IBStringField1: TIBStringField;
    SmallintField1: TSmallintField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    DST_Apto_Del: TDataSource;
    IBTable_CamaDel: TIBTable;
    IBStringField6: TIBStringField;
    SmallintField2: TSmallintField;
    SmallintField3: TSmallintField;
    IBStringField7: TIBStringField;
    IBStringField8: TIBStringField;
    DST_CamaDel: TDataSource;
    procedure FormCreate(Sender: TObject);

    procedure Atualiza;
    procedure BotaoApto(Status: Boolean);
    procedure Habilita_Campos_Apto(Status: Boolean);
    procedure ComboBox_PredioChange(Sender: TObject);
    procedure BotaoCama(Status: Boolean);
    procedure Habilita_Campos_Cama(Status: Boolean);
    Function Verifica_Existencia_Hospede: Boolean;
    procedure DBGrid_MapaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);

    procedure Monta_Mapa;
    procedure Executa_Query_Monta_Mapa(Query_Monta_Mapa: TIBQuery;VS_Comando: String);
    procedure Executa_Query_Mapa(VS_Busca: String; VI_Opc: Integer);
    procedure DBGrid_MapaCellClick(Column: TColumn);
    procedure MaskEdit_AptoExit(Sender: TObject);
    procedure MaskEdit_AptoKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton_GravarCamaClick(Sender: TObject);
    procedure ToolButton_RelatorioClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton_InserirClick(Sender: TObject);
    procedure ToolButton_AlterarClick(Sender: TObject);
    procedure ToolButton_ExcluirClick(Sender: TObject);
    procedure ToolButton_GravarClick(Sender: TObject);
    procedure ToolButton_IgnorarClick(Sender: TObject);
    procedure ToolButton_InserirCamaClick(Sender: TObject);
    procedure ToolButton_AlterarCamaClick(Sender: TObject);
    procedure ToolButton_ExcluirCamaClick(Sender: TObject);
    procedure ToolButton_IgnorarCamaClick(Sender: TObject);
    procedure ToolButton_DesocuparClick(Sender: TObject);
    procedure ToolButton_LimparClick(Sender: TObject);
    procedure ToolButton_GravarCamaClick(Sender: TObject);
    procedure ToolButton_NaoOcuparCamaClick(Sender: TObject);
    procedure IBTable_AptoPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
  private    { private declarations }
    VS_Predio, VS_Apto, VS_Opcao: String;
    VB_AtivarBotoes: Boolean;
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
   IBTable_Apto_Del.Open;
   IBTable_CamaDel.Open;
   IBTable_Apto_Del.First;
   While not IBTable_Apto_Del.Eof do
   begin
      if IBTable_CamaDel.FieldByName('Predio').AsString = '' then
      begin
         IBTable_Apto_Del.Delete;
         DM.IBTransaction_Hotel.CommitRetaining;
      end
      else
      begin
         IBTable_Apto_Del.Next;
      end;
   end;

   Funcoes.AlimentaComboBox(ComboBox_Predio, 0, '');

   VS_Opcao:= 'Consulta';
   VB_AtivarBotoes:= True;

   IBTable_Hospede.Open;
   IBTable_Hospedagem.Open;
   IBTable_Mapa_Dep.Open;
   IBTable_Apto.Open;
   IBTable_Hospede01.Open;
   IBTable_Cama.Open;

   Panel_CadastrarCama.Visible:= False;
   BotaoApto(True);
   BotaoCama(True);

   Habilita_Campos_Apto(False);
   Habilita_Campos_Cama(False);
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
       Showmessage('Não foi selecionado '+PredioAndar+'...');
       ComboBox_Predio.SetFocus;
     end
     else
     begin
        VS_Opcao:= 'Inserir';
        IBTable_Apto.Append;

        //--- Tratamento para Apto

        BotaoApto(False);
        Habilita_Campos_Apto(True);

        //--- Tratamento para Cama

        Habilita_Campos_Cama(False);
        BotaoCama(False);
        ToolButton_GravarCama.Enabled:= False;
        ToolButton_IgnorarCama.Enabled:= False;

        IBTable_Apto.FieldByName('PREDIO').AsString:= ComboBox_Predio.Text;
        IBTable_Apto.FieldByName('Apto').AsString:= '';
        IBTable_Apto.FieldByName('VIRTUAL').AsString:= 'N';
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
     IBTable_Apto.Edit;
     DBEdit_Ramal.SetFocus;
   Except
     MessageDlg('Erro na Alteração.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Exclusão de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.ToolButton_ExcluirClick(Sender: TObject);
var
   VS_Comando: String;
begin
   //--- Tratamento para Cama

   VS_Opcao:= 'Excluir';
   BotaoCama(False);
   ToolButton_GravarCama.Enabled:= False;
   ToolButton_IgnorarCama.Enabled:= False;

   //--- Tratamento para Apto

   BotaoApto(False);
   ToolButton_Gravar.Enabled:= False;
   ToolButton_Ignorar.Enabled:= False;

   if MessageDlg('Ao excluir o Apto automaticamente será excluido a cama '+#13+'Confirma a exclusão ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      if Verifica_Existencia_Hospede = True then
      begin
         VS_Comando:= 'Delete from APTOCAMA where Predio = '+#39+IBTable_Apto.FieldByName('Predio').AsString+#39+' and Apto = '+IBTable_Apto.FieldByName('Apto').AsSTring;
         Funcoes.ExecSql_Servidor(VS_Comando);

         IBTable_Apto.Delete;
         DM.IBTransaction_Hotel.CommitRetaining;
         Monta_Mapa;
      end
      else
      begin
          MessageDlg('Este Apartamento possui Hóspede Cadastrado...', mtInformation,[mbOk], 0);
      end;
   end;
   BotaoApto(True);
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.ToolButton_GravarClick(Sender: TObject);
begin

   VS_Predio:= IBTable_Apto.FieldByName('Predio').AsString;
   VS_Apto:= IBTable_Apto.FieldByName('Apto').AsString;
   IBTable_Apto.Post;
   DM.IBTransaction_Hotel.CommitRetaining;
   if VS_Opcao = 'Inserir' then
   begin
      Panel_CadastrarCama.Visible:= True;
      MaskEdit_Camas.Text:= '0';
      MaskEdit_Camas.SetFocus;
   end
   else
   begin
      VS_Opcao:= 'Consulta';
      Atualiza;
      BotaoApto(True);
      BotaoCama(True);
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
      IBTable_Apto.Cancel;
      DM.IBTransaction_Hotel.CommitRetaining;
      Atualiza;

      Panel_CadastrarCama.Visible:= False;
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
   IBTable_Cama.Close;
   IBTable_Apto.Close;
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
   IBTable_Apto.Active:= False;
   IBTable_Apto.Active:= true;
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
   ToolButton_Excluir.Enabled:= Status;
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
   Monta_Mapa;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da selecao do mapa pelo apto
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.MaskEdit_AptoExit(Sender: TObject);
begin
  Monta_Mapa;
end;

//------------------------------------------------------------------------------
// Tratamento do Erro de Inclusão de um determinado Apto
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.IBTable_AptoPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
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
     IBTable_Cama.Append;
     IBTable_Cama.FieldByName('APTCODIGO').AsString:= 'DESOCUPADO';

     //---
     //--- Pega a ultima cama

      VS_Comando:= 'Select count(1)+1 QtdReg from AptoCama '+
                   ' where Predio = '+#39+DM.IBQuery_Mapa.FieldByName('Predio').AsString+#39+
                   ' and Apto = '+DM.IBQuery_Mapa.FieldByName('Apto').AsString;

      IBTable_Cama.FieldByName('Cama').AsInteger:= Funcoes.QtdRegistro(VS_Comando);

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
     IBTable_Cama.Cancel;
     Monta_Mapa;
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Alteracao da Cama
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.ToolButton_AlterarCamaClick(Sender: TObject);
begin
   Try
      VS_Opcao:= 'Alterar';
      IBTable_Cama.Edit;

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
begin
   if  IBTable_Cama.FieldByName('AptCodigo').AsString = 'OCUPADO' then
   begin
       MessageDlg('A cama '+IBTable_Cama.FieldByName('CAMA').AsString+' do Apartamento possui Hóspede Cadastrado...', mtInformation,[mbOk], 0);
   end
   else
   begin
     //--- Tratamento para Cama

     VS_Opcao:= 'Excluir';
     BotaoCama(False);
     ToolButton_GravarCama.Enabled:= False;
     ToolButton_IgnorarCama.Enabled:= False;

     //--- Tratamento para Apto
     BotaoApto(False);
     ToolButton_Gravar.Enabled:= False;
     ToolButton_Ignorar.Enabled:= False;

     if MessageDlg('Confirma a exclusão ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
        IBTable_Cama.Delete;
        DM.IBTransaction_Hotel.CommitRetaining;
        Monta_Mapa;
     end;
   end;
   BotaoCama(True);
   BotaoApto(True);
end;

//------------------------------------------------------------------------------
// Modulo de tratamento da inclusao ou alteracao dos dados do apto
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.ToolButton_GravarCamaClick(Sender: TObject);
begin
   VS_Opcao:= 'Consulta';
   IBTable_Cama.Post;
   DM.IBTransaction_Hotel.CommitRetaining;
   IBTable_Cama.Close;
   IBTable_Cama.Open;
   BotaoApto(True);
   BotaoCama(True);
   Habilita_Campos_Apto(False);
   Habilita_Campos_Cama(False);
   Monta_Mapa;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento a Insercao ou Alteracao da Cama
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.ToolButton_IgnorarCamaClick(Sender: TObject);
begin
   Try
      VS_Opcao:= 'Consulta';
      IBTable_Cama.Cancel;
      DM.IBTransaction_Hotel.CommitRetaining;
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
   ToolButton_Desocupar.Enabled:= Status;
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

   if DM.IBQuery_Mapa.FieldByName('Tipo').AsString = '3' then     // Desocupado
   begin
      ToolButton_Desocupar.Enabled:= False;
   end
   else
   begin
      if (DM.IBQuery_Mapa.FieldByName('Tipo').AsString = '0') then  // Cabecalho
      begin
         ToolButton_AlterarCama.Enabled:= False;
         ToolButton_ExcluirCama.Enabled:= False;
         ToolButton_Desocupar.Enabled:= False;
         ToolButton_NaoOcuparCama.Enabled:= False;
      end
      else
      begin
         if (DM.IBQuery_Mapa.FieldByName('Tipo').AsString = '1') then   // Ocupado
         begin
            ToolButton_AlterarCama.Enabled:= False;
            ToolButton_ExcluirCama.Enabled:= False;
            ToolButton_NaoOcuparCama.Enabled:= False;
         end
         else
         begin
            if DM.IBQuery_Mapa.FieldByName('Tipo').AsString = '4' then  // Não Desocupado
            begin
               ToolButton_AlterarCama.Enabled:= False;
               ToolButton_ExcluirCama.Enabled:= False;
               ToolButton_NaoOcuparCama.Enabled:= False;
            end
            else
            begin
               if DM.IBQuery_Mapa.FieldByName('Tipo').AsString = '5' then   // NAO OCUPAR
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
   IBTable_Cama.First;
   While not IBTable_Cama.Eof do
   begin
      if (Trim(IBTable_Cama.FieldByName('APTCODIGO').AsString) <> 'DESOCUPADO') then
      begin
          Retorno:= False;
      end;
      IBTable_Cama.Next;
   end;

   Result:= Retorno;
end;

//------------------------------------------------------------------------------
// Modulo de tratamento da Desocupacao da Cama
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.ToolButton_DesocuparClick(Sender: TObject);
var
   VS_Comando: String;
   VB_Desocupadar: boolean;
begin
   Try
      VS_Opcao:= 'Desocupar';
      VB_Desocupadar:= true;

      //---
      //--- Verifica se o apto possui hospede

      VS_Comando:= 'Select count(*) Nreg from hospedagem '+
                   ' where Predio = '+#39+IBTable_Cama.FieldByName('Predio').AsString+#39+
                   ' and Apto = '+IBTable_Cama.FieldByName('Apto').AsString+
                   ' and Cama = '+IBTable_Cama.FieldByName('Cama').AsString;
      Funcoes.QueryExecuta(VS_Comando);

      if DM.IBQuery_Executa.FieldByName('Nreg').AsInteger > 0 then
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
                      ' where Predio = '+#39+IBTable_Cama.FieldByName('Predio').AsString+#39+
                      ' and Apto = '+IBTable_Cama.FieldByName('Apto').AsString+
                      ' and Cama = '+IBTable_Cama.FieldByName('Cama').AsString;

         Funcoes.QueryExecuta(VS_Comando);

         if DM.IBQuery_Executa.FieldByName('Nreg').AsInteger > 0 then
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

         IBTable_Cama.Edit;
         IBTable_Cama.FieldByName('APTCODIGO').AsString:= 'DESOCUPADO';
         IBTable_Cama.fieldByName('NOME').AsString:= '';
         IBTable_Cama.Post;
         DM.IBTransaction_Hotel.CommitRetaining;
         IBTable_Cama.Close;
         IBTable_Cama.Open;
         Monta_Mapa;
      end;
   Except
     MessageDlg('Erro na Descucupação da cama.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de tratamento da Não Ocupacao
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.ToolButton_LimparClick(Sender: TObject);
begin
   Try
     VS_Opcao:= 'Não Ocupar';
     IBTable_Cama.Edit;
     IBTable_Cama.FieldByName('APTCODIGO').AsString:= 'NÃO OCUPAR';

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
     MessageDlg('Erro na inserção da cama.', mtInformation,[mbOk], 0);
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
begin
   if trim(ComboBox_Predio.Text) <> '' then
   begin
      VS_Opcao:= 'Consulta';
      VI_Codigo:= 0;
      Funcoes.LimpaMapa;

       //---
      //--- Montagem do Mapa de Ocupacao  - Hospedagem / Reserva / Dependente


      if ComboBox_Predio.Text = 'Todos' then
         VS_Comando:= 'select ap.predio, ap.apto, ap.ramal, ap.tv1, ap.tv2, ap.virtual, ac.cama, ac.aptcodigo, ac.nome '+
                      'from apartamento ap, aptocama ac '+
                      'where (ap.predio = ac.predio and ap.apto = ac.apto) '
      else       // selecao por apto
         VS_Comando:= 'select ap.predio, ap.apto, ap.ramal, ap.tv1, ap.tv2, ap.virtual, ac.cama, ac.aptcodigo, ac.nome '+
                      'from apartamento ap, aptocama ac '+
                      'where (ap.predio = ac.predio and ap.apto = ac.apto) '+
                      ' and ap.predio = '+#39+ComboBox_Predio.Text+#39;

      if trim(MaskEdit_Apto.Text) <> '' then
         VS_Comando:= VS_Comando+' and ap.apto = '+MaskEdit_Apto.Text;

      VS_Comando:= VS_Comando+' order by ap.predio, ap.apto, ac.cama';

      Executa_Query_Monta_Mapa(IBQuery_Monta_Mapa, VS_Comando);
      ProgressBar1.Max:= IBQuery_Monta_Mapa.RecordCount;

      VS_Predio:= '';
      VS_Apto:= '';

      While not IBQuery_Monta_Mapa.Eof do
      begin
         ProgressBar1.StepBy(1);
         Update;

         //---
         //--- Monta o cabecalho

         if (( VS_Predio <> IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString) or
             ( VS_Apto <> IBQuery_Monta_Mapa.FieldByName('apto').AsString)) then
         begin
            VS_Predio:=IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString;
            VS_Apto:=  IBQuery_Monta_Mapa.FieldByName('apto').AsString;
            VI_Codigo:= VI_Codigo + 1;

            Funcoes.Grava_Mapa(VI_Codigo,
                       IBQuery_Monta_Mapa.FieldByName('virtual').AsString,
                       ' ',
                       IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString,
                       IBQuery_Monta_Mapa.FieldByName('APTO').AsString,
                       '0',
                       IBQuery_Monta_Mapa.FieldByName('RAMAL').AsString,
                       ' ',
                       ' ',
                       CABECALHO,
                       IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString+'    '+
                          IBQuery_Monta_Mapa.FieldByName('APTO').AsString+'    R. '+
                          IBQuery_Monta_Mapa.FieldByName('RAMAL').AsString+'    -    '+
                          IBQuery_Monta_Mapa.FieldByName('TV1').AsString+'  '+
                          IBQuery_Monta_Mapa.FieldByName('TV2').AsString,
                       ' ',
                       ' ',
                       ' ',
                       ' '
                      );
         end;

          //---
         //--- Tratamento quando tiver hospode

         if Trim(IBQuery_Monta_Mapa.FieldByName('APTCODIGO').AsString) = 'OCUPADO' then
         begin
            VI_Codigo:= VI_Codigo + 1;
            Funcoes.Grava_Mapa(VI_Codigo,
                        IBQuery_Monta_Mapa.FieldByName('virtual').AsString,
                        IBTable_Hospede.FieldByName('Identidade').AsString,
                        IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString,
                        IBQuery_Monta_Mapa.FieldByName('apto').AsString,
                        IBQuery_Monta_Mapa.FieldByName('cama').AsString,
                        IBQuery_Monta_Mapa.FieldByName('Ramal').AsString,
                        ' ',
                        ' ',
                        OCUPADO,
                        IBQuery_Monta_Mapa.FieldByName('Cama').AsString+' - '+
                           trim(IBTable_Hospede.FieldByName('Posto').AsString)+' '+
                           IBTable_Hospede.FieldByName('NOME_GUERRA').AsString,
                        IBTable_Hospede.FieldByName('situacao_curso').AsString,
                        IBTable_Hospede.FieldByName('nome').AsString,
                        IBTable_Hospedagem.FieldByName('DataEntrada').AsString,
                        IBTable_Hospedagem.FieldByName('DataSaida').AsString
                       );
         end
         else
         begin
             //---
            //--- DEPENDENTE DE HOSPEDE

            if Trim(IBQuery_Monta_Mapa.FieldByName('APTCODIGO').AsString) = 'DEP' then
            begin
               VI_Codigo:= VI_Codigo + 1;
               Funcoes.Grava_Mapa(VI_Codigo,
                          IBQuery_Monta_Mapa.FieldByName('virtual').AsString,
                          ' ',
                          IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString,
                          IBQuery_Monta_Mapa.FieldByName('apto').AsString,
                          IBQuery_Monta_Mapa.FieldByName('cama').AsString,
                          IBQuery_Monta_Mapa.FieldByName('Ramal').AsString,
                          ' ',
                          ' ',
                          OCUPADO,
                          IBQuery_Monta_Mapa.FieldByName('cama').AsString+' - DEP - '+IBTable_Mapa_Dep.FieldByName('Nome').AsString,
                          'DEPENDENTE',
                          'DEP - '+IBTable_Mapa_Dep.FieldByName('Nome').AsString,
                          ' ',
                          ' '
                          );
            end
            else
            begin     //--- DESOCUPADO
               if Trim(IBQuery_Monta_Mapa.FieldByName('APTCODIGO').AsString) = 'DESOCUPADO' then
               begin
                  VI_Codigo:= VI_Codigo + 1;
                  Funcoes.Grava_Mapa(VI_Codigo,
                             IBQuery_Monta_Mapa.FieldByName('virtual').AsString,
                             ' ',
                             IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString,
                             IBQuery_Monta_Mapa.FieldByName('apto').AsString,
                             IBQuery_Monta_Mapa.FieldByName('cama').AsString,
                             IBQuery_Monta_Mapa.FieldByName('Ramal').AsString,
                             ' ',
                             ' ',
                             DESOCUPADO,
                             IBQuery_Monta_Mapa.FieldByName('cama').AsString+' - DESOCUPADO',
                             ' ',
                             ' ',
                             ' ',
                             ' '
                            );
               end
               else
               begin
                 if IBQuery_Monta_Mapa.FieldByName('NOME').AsString = 'NÃO DESOCUPADO' then
                 begin
                    VI_Codigo:= VI_Codigo + 1;
                    Funcoes.Grava_Mapa(VI_Codigo,
                               IBQuery_Monta_Mapa.FieldByName('virtual').AsString,
                               ' ',
                               IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString,
                               IBQuery_Monta_Mapa.FieldByName('apto').AsString,
                               IBQuery_Monta_Mapa.FieldByName('cama').AsString,
                               IBQuery_Monta_Mapa.FieldByName('Ramal').AsString,
                               ' ',
                               ' ',
                               NAODESOCUPADO,
                               IBQuery_Monta_Mapa.FieldByName('cama').AsString+' - '+Trim(IBTable_Hospede01.FieldByName('Posto').AsString)+' - '+Trim(IBTable_Hospede01.FieldByName('Nome_Guerra').AsString),
                               IBTable_Hospede01.FieldByName('SITUACAO_CURSO').AsString,
                               IBTable_Hospede01.FieldByName('NOME').AsString,
                               ' ',
                               ' '
                             );
                 end
                 else
                 begin
                    if IBQuery_Monta_Mapa.FieldByName('APTCODIGO').AsString = 'NÃO OCUPAR' then
                    begin
                       VI_Codigo:= VI_Codigo + 1;
                       Funcoes.Grava_Mapa(VI_Codigo,
                                  IBQuery_Monta_Mapa.FieldByName('virtual').AsString,
                                  ' ',
                                  IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString,
                                  IBQuery_Monta_Mapa.FieldByName('apto').AsString,
                                  IBQuery_Monta_Mapa.FieldByName('cama').AsString,
                                  IBQuery_Monta_Mapa.FieldByName('Ramal').AsString,
                                  ' ',
                                  ' ',
                                  NAOOCUPAR,
                                  IBQuery_Monta_Mapa.FieldByName('cama').AsString+' - '+Trim(IBQuery_Monta_Mapa.FieldByName('Nome').AsString),
                                  'NÃO OCUPAR',
                                  IBQuery_Monta_Mapa.FieldByName('NOME').AsString,
                                  ' ',
                                  ' '
                                  );
                    end;
                 end;
               end;
            end;
         end;
         IBQuery_Monta_Mapa.Next;
      end;

      DM.IBTransaction_HotelLocal.Commit;
      Executa_Query_Mapa('', 0);
      ProgressBar1.Position:= 0;
   end;
end;

//------------------------------------------------------------------------------
// Monta query de consulta para montagem do mapa
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.Executa_Query_Monta_Mapa(Query_Monta_Mapa: TIBQuery;VS_Comando: String);
begin
   IBQuery_Monta_Mapa.Close;
   IBQuery_Monta_Mapa.Sql.Clear;
   IBQuery_Monta_Mapa.Sql.Add(VS_Comando);
   IBQuery_Monta_Mapa.Open;
end;

//------------------------------------------------------------------------------
// Tratamento de selecao do opcao de procura de hospede
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.Executa_Query_Mapa(VS_Busca: String; VI_Opc: Integer);
var
   VS_Comando: String;
begin
   VS_Comando:= 'select Identidade, codigo, predio, apto, cama, ramal, nome, tipo, situacao, situacao_curso, data_entrada, Data_Saida from mapa';
   if trim(VS_Busca) <> '' then
   begin
      case VI_Opc of
         2: VS_Comando:= VS_Comando+' where situacao like '+#39+'%'+VS_Busca+'%'+#39;
         3: VS_Comando:= VS_Comando+' where nome like '+#39+'%'+VS_Busca+'%'+#39;
         4: VS_Comando:= VS_Comando+' where apto = '+VS_Busca;
      end;
   end;
   VS_Comando:= VS_Comando+' order by predio, apto, cama ';

   DM.IBQuery_Mapa.Close;
   DM.IBQuery_Mapa.Sql.Clear;
   DM.IBQuery_Mapa.Sql.Add(VS_Comando);
   DM.IBQuery_Mapa.Open;
end;

procedure TForm_Cad_Apto.DBGrid_MapaDrawColumnCell(Sender: TObject;const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if VS_Opcao = 'Consulta' then
   begin
      BotaoCama(True);

      if DM.IBQuery_Mapa.FieldByName('Tipo').AsString = '3' then     // Desocupado
      begin
         ToolButton_Desocupar.Enabled:= False;
         ToolButton_NaoOcuparCama.Enabled:= False;
         DBGrid_Mapa.Canvas.Brush.Color:= clInfoBk;
         DBGrid_Mapa.Canvas.Font.Color:= clBlack;
      end
      else
      begin
         if (DM.IBQuery_Mapa.FieldByName('Tipo').AsString = '0') then  // Cabecalho
         begin
            ToolButton_InserirCama.Enabled:= False;
            ToolButton_AlterarCama.Enabled:= False;
            ToolButton_ExcluirCama.Enabled:= False;
            ToolButton_Desocupar.Enabled:= False;
            ToolButton_NaoOcuparCama.Enabled:= False;
            DBGrid_Mapa.Canvas.Brush.Color:= clSilver;
            DBGrid_Mapa.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (DM.IBQuery_Mapa.FieldByName('Tipo').AsString = '1') then   // Ocupado
            begin
               if (DM.IBQuery_Mapa.FieldByName('Data_Saida').AsString = '' ) then
               begin
                  DBGrid_Mapa.Canvas.Brush.Color:= clTeal;
                  DBGrid_Mapa.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if (StrToDate(DM.IBQuery_Mapa.FieldByName('Data_Saida').AsString) < date ) then
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
               if DM.IBQuery_Mapa.FieldByName('Tipo').AsString = '2' then   // Reserva
               begin
                  DBGrid_Mapa.Canvas.Brush.Color:= clRed;
                  DBGrid_Mapa.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if DM.IBQuery_Mapa.FieldByName('Tipo').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Mapa.Canvas.Brush.Color:= clBlue;
                     DBGrid_Mapa.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if DM.IBQuery_Mapa.FieldByName('Tipo').AsString = '5' then   // NAO OCUPAR
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
end;

//------------------------------------------------------------------------------
// Procedure para tratar da selecao dos botoes
//------------------------------------------------------------------------------

procedure TForm_Cad_Apto.DBGrid_MapaCellClick(Column: TColumn);
begin
   BotaoCama(True);
end;

procedure TForm_Cad_Apto.MaskEdit_AptoKeyPress(Sender: TObject;
  var Key: Char);
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
begin
   //--- Grava a primeira Cama

   if ((VS_Predio <> '') and (VS_Apto <> '')) then
   begin
      for i:= 1 to StrToInt(MaskEdit_Camas.Text) do
      begin
         IBTable_Cama.Append;
         IBTable_Cama.FieldByName('PREDIO').AsString:= VS_Predio;
         IBTable_Cama.FieldByName('APTO').AsString:= VS_Apto;
         IBTable_Cama.FieldByName('APTCODIGO').AsString:= 'DESOCUPADO';
         IBTable_Cama.FieldByName('NOME').AsString:= '';
         IBTable_Cama.FieldByName('CAMA').AsInteger:= i;
         IBTable_Cama.Post;
      end;
      DM.IBTransaction_Hotel.CommitRetaining;
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
end;

procedure TForm_Cad_Apto.ToolButton_NaoOcuparCamaClick(Sender: TObject);
begin
   Try
      VS_Opcao:= 'Alterar';
     IBTable_Cama.Edit;
     IBTable_Cama.FieldByName('APTCODIGO').AsString:= 'NÃO OCUPAR';

     //--- Tratamento para Cama

      Habilita_Campos_Apto(False);
      BotaoApto(False);
      ToolButton_Gravar.Enabled:= False;
      ToolButton_Ignorar.Enabled:= False;

      //--- Tratamento para Cama

     DBEdit_AptoCodigo.Enabled:= True;

      ToolButton_InserirCama.Enabled:= False;
      ToolButton_AlterarCama.Enabled:= False;
      ToolButton_ExcluirCama.Enabled:= False;
      ToolButton_Desocupar.Enabled:= False;
      ToolButton_NaoOcuparCama.Enabled:= False;
      ToolButton_IgnorarCama.Enabled:= True;
      ToolButton_GravarCama.Enabled:= True;


     StatusBar.SimpleText:= 'Forneça o motivo para não ocupar';
     DBEdit_AptoCodigo.SetFocus;
   Except
     MessageDlg('Erro na Não Ocupacao da cama.', mtInformation,[mbOk], 0);
   end;
end;

end.
