//------------------------------------------------------------------------------
// Tabela de Postos
//
//------------------------------------------------------------------------------
//  Codigo   Descricao
//------------------------------------------------------------------------------
//    01	OFICIAL GENERAL
//    02	OFICIAL SUPERIOR
//    03	OFICIAL INTERMEDIÁRIO
//    04	OFICIAL SUBALTERNO
//    05	ASPIRANTE OU GUARDA MARINHA
//    06	CV NS C/ VÍNCULO
//    07	CV NS S/ VÍNCULO
//    08	GRADUADOS
//    09	CV NM C/ VÍNCULO
//    10	CV NM S/ VÍNCULO
//    11	CABO
//    12	CADETE
//    13	SOLDADO
//    14	TAIFEIRO
//    15	CV SUP INFRAERO
//    16	CV NM INFRAERO
//------------------------------------------------------------------------------

unit Cad_Tab_Posto;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, Buttons, DBTables, Grids, ExtCtrls,
  ComCtrls, Rotinas, Mask, ToolWin, IBCustomDataSet, IBQuery, IBTable;

Const
   ASPAS= '''';

type
  TForm_Tab_Posto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar: TStatusBar;
    DS_TabelaDePosto: TDataSource;
    DBGrid_Tab: TDBGrid;
    GroupBox_Preco: TGroupBox;
    DBEdit_Posto_Graduacao: TDBEdit;
    Label2: TLabel;
    Panel4: TPanel;
    Panel3: TPanel;
    DBNavigator_Posto: TDBNavigator;
    ToolBar4: TToolBar;
    ToolButton_Inserir: TToolButton;
    ToolButton_Alterar: TToolButton;
    ToolButton_Excluir: TToolButton;
    ToolButton_Gravar: TToolButton;
    ToolButton_Ignorar: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    Panel5: TPanel;
    _Patente: TToolBar;
    ToolButton_Patentes: TToolButton;
    IBTable_TabelaPosto: TIBTable;
    IBQuery_Executa: TIBQuery;
    IBTable_TabelaPostoCODIGO: TIBStringField;
    IBTable_TabelaPostoCODTABELA: TIBStringField;
    IBTable_TabelaPostoPOSTO: TIBStringField;
    procedure FormCreate(Sender: TObject);

    procedure Atualiza;
    procedure Botao(Status: Boolean);
    procedure Habilita_Campos(Status: Boolean);
    procedure ToolButton_InserirClick(Sender: TObject);
    procedure ToolButton_AlterarClick(Sender: TObject);
    procedure ToolButton_ExcluirClick(Sender: TObject);
    procedure ToolButton_GravarClick(Sender: TObject);
    procedure ToolButton_IgnorarClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure Table_TabelaDePostoPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure ToolButton_PatentesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form_Tab_Posto: TForm_Tab_Posto;

implementation

uses Abertura, Divisas, Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Modulo Principal
//------------------------------------------------------------------------------

procedure TForm_Tab_Posto.FormCreate(Sender: TObject);
begin
   IBTable_TabelaPosto.Open;
   Botao(True);
   Habilita_Campos(False);
end;

//------------------------------------------------------------------------------
// Modulo de Inserção de Dados
//------------------------------------------------------------------------------

procedure TForm_Tab_Posto.ToolButton_InserirClick(Sender: TObject);
begin
   Try
     Botao(False);
     Habilita_Campos(True);

     IBTable_TabelaPosto.Append;

     //--- Tratamento para encontrar o ultimo numero

     IBQuery_Executa.Close;
     IBQuery_Executa.Sql.Clear;
     IBQuery_Executa.SQL.Add('Select max(codTabela) Valor from tabela_posto where codigo = 10');
     IBQuery_Executa.Open;

     IBTable_TabelaPosto.FieldByName('Codigo').AsString:= '10';
     if  IBQuery_Executa.FieldByName('Valor').AsString = '' then
        IBTable_TabelaPosto.FieldByName('CodTabela').AsString:= '1'
     else
        IBTable_TabelaPosto.FieldByName('CodTabela').AsString:= IBQuery_Executa.FieldByName('Valor').AsString;
     StatusBar.SimpleText:= 'Forneça o Posto pertencente a esta tabela';
     DBEdit_Posto_Graduacao.SetFocus;
   Except
     MessageDlg('Erro na inserção.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Alteração de Dados
//------------------------------------------------------------------------------

procedure TForm_Tab_Posto.ToolButton_AlterarClick(Sender: TObject);
begin
   Try
     Botao(False);
     Habilita_Campos(True);

     IBTable_TabelaPosto.Edit;
     DBEdit_Posto_Graduacao.SetFocus;
   Except
     MessageDlg('Erro na Alteração.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Exclusão de Dados
//------------------------------------------------------------------------------

procedure TForm_Tab_Posto.ToolButton_ExcluirClick(Sender: TObject);
begin
   Botao(False);
   ToolButton_Gravar.Enabled:= False;
   ToolButton_Ignorar.Enabled:= False;
   if MessageDlg('Confirma a exclusão ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      IBTable_TabelaPosto.Delete;
      DM.IBTransaction_Hotel.CommitRetaining;
      Atualiza;
   end;
   Botao(True);
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_Tab_Posto.ToolButton_GravarClick(Sender: TObject);
begin
   IBTable_TabelaPosto.Post;
   DM.IBTransaction_Hotel.CommitRetaining;
   Botao(True);
   Habilita_Campos(False);
   Atualiza;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_Tab_Posto.ToolButton_IgnorarClick(Sender: TObject);
begin
   Try
      IBTable_TabelaPosto.Cancel;
      DM.IBTransaction_Hotel.CommitRetaining;
      Botao(True);
      Habilita_Campos(False);
      Atualiza;
   Except
      MessageDlg('Erro na Cancelamento.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_Tab_Posto.ToolButton_RetornarClick(Sender: TObject);
begin
   IBTable_TabelaPosto.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Procedure de Redresh da Query
//------------------------------------------------------------------------------

procedure TForm_Tab_Posto.Atualiza;
begin
   IBTable_TabelaPosto.Active:= False;
   IBTable_TabelaPosto.Active:= true;
end;

//------------------------------------------------------------------------------
// Habilita o acesso aos campos de tratamento do Apto
//------------------------------------------------------------------------------

procedure TForm_Tab_Posto.Habilita_Campos(Status: Boolean);
begin
   if Status = True then
   begin
      DBGrid_Tab.Enabled:= False;
      DBEdit_Posto_Graduacao.ReadOnly:= False;
   end
   else
   begin
      DBGrid_Tab.Enabled:= True;
      DBEdit_Posto_Graduacao.ReadOnly:= True;
   end;
end;


//------------------------------------------------------------------------------
// Desabilita Botoes
//------------------------------------------------------------------------------

procedure TForm_Tab_Posto.Botao(Status: Boolean);
begin
   DBNavigator_Posto.Enabled:= Status;
   ToolButton_Inserir.Enabled:= Status;
   ToolButton_Alterar.Enabled:= Status;
   ToolButton_Excluir.Enabled:= Status;
   ToolButton_Retornar.Enabled:= Status;
   ToolButton_Windows.Enabled:= Status;
   ToolButton_Patentes.Enabled:= Status;

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

//------------------------------------------------------------------------------
// Mostra as patentes existentes
//------------------------------------------------------------------------------

procedure TForm_Tab_Posto.ToolButton_PatentesClick(Sender: TObject);
begin
   Form_Divisas.ShowModal;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Tab_Posto.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

procedure TForm_Tab_Posto.Table_TabelaDePostoPostError(DataSet: TDataSet;E: EDatabaseError; var Action: TDataAction);
begin
   if (E is EDBEngineError) then
      if (E as EDBEngineError).Errors[0].ErrorCode = 9729 then
      begin
         MessageDlg('Já existe posto gravado com este código...',mtWarning, [mbOK], 0);
         Abort;
         DBEdit_Posto_Graduacao.SetFocus;
      end;
end;


procedure TForm_Tab_Posto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.
