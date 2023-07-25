unit Cad_Tab_Posto;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, Buttons, Grids, ExtCtrls,
  ComCtrls, Rotinas, Mask, ToolWin, IBCustomDataSet, IBTable, IBQuery;

type
  TForm_Tab_Posto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DS_Tab_Preco: TDataSource;
    DBGrid_Tab: TDBGrid;
    GroupBox_Preco: TGroupBox;
    DBEdit_Posto_Graduacao: TDBEdit;
    Label1: TLabel;
    DBEdit_Codigo: TDBEdit;
    DSQ_Posto: TDataSource;
    Label2: TLabel;
    DBGrid_Posto_Graduacao: TDBGrid;
    IBQuery_Posto: TIBQuery;
    IBTable_Tab_Posto: TIBTable;
    IBQuery_PostoPOSTO: TIBStringField;
    IBQuery_PostoCODIGO: TIBStringField;
    IBTable_Tab_PostoCODIGO: TIBStringField;
    IBTable_Tab_PostoCODTABELA: TIBStringField;
    IBTable_Tab_PostoPOSTO: TIBStringField;
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
    ToolBar_Patente: TToolBar;
    ToolButton_Patentes: TToolButton;
    StatusBar: TStatusBar;
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
    procedure ToolButton_PatentesClick(Sender: TObject);

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
   IBTable_Tab_Posto.Open;
   IBQuery_Posto.Open;
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

     IBTable_Tab_Posto.Append;
     StatusBar.SimpleText:= 'Forneça os Dados da Tabela de Preço';
     DBEdit_Codigo.SetFocus;
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
     IBTable_Tab_Posto.Edit;
     DBEdit_Codigo.SetFocus;
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
      IBTable_Tab_Posto.Delete;
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
   IBTable_Tab_Posto.Post;
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
      IBTable_Tab_Posto.Cancel;
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
   IBTable_Tab_Posto.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Procedure de Redresh da Query
//------------------------------------------------------------------------------

procedure TForm_Tab_Posto.Atualiza;
begin
   IBTable_Tab_Posto.Active:= False;
   IBTable_Tab_Posto.Active:= true;
end;

//------------------------------------------------------------------------------
// Habilita o acesso aos campos de tratamento do Apto
//------------------------------------------------------------------------------

procedure TForm_Tab_Posto.Habilita_Campos(Status: Boolean);
begin
   if Status = True then
   begin
      DBGrid_Tab.Enabled:= False;
      DBGrid_Posto_Graduacao.Enabled:= False;
      DBEdit_Codigo.ReadOnly:= False;
      DBEdit_Posto_Graduacao.ReadOnly:= False;
   end
   else
   begin
      DBGrid_Tab.Enabled:= True;
      DBGrid_Posto_Graduacao.Enabled:= True;
      DBEdit_Codigo.ReadOnly:= True;
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

end.
