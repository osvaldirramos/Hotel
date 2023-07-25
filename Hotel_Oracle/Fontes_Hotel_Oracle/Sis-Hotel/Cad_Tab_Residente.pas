unit Cad_Tab_Residente;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, Buttons, DBTables, Grids, ExtCtrls,
  ComCtrls, Rotinas, Mask, ToolWin, JvGradient;

Const
   ASPAS= '''';

type
  TForm_Tab_Residente = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar: TStatusBar;
    DST_Tab_Residente: TDataSource;
    Table_Tab_Residente: TTable;
    GroupBox_Preco: TGroupBox;
    DBEdit_Valor: TDBEdit;
    Query_TabelaPreco: TQuery;
    DSQ_TabelaPreco: TDataSource;
    Table_Tab_ResidentePOSTO: TStringField;
    Table_Tab_ResidenteVALOR: TFloatField;
    Query_TabelaPrecoPOSTO: TStringField;
    Panel3: TPanel;
    DBNavigator_Residente: TDBNavigator;
    ToolBar4: TToolBar;
    ToolButton_Inserir: TToolButton;
    ToolButton_Alterar: TToolButton;
    ToolButton_Excluir: TToolButton;
    ToolButton_Gravar: TToolButton;
    ToolButton_Ignorar: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    DBEdit_Posto: TDBEdit;
    Query_TabelaPrecoVALOR: TFloatField;
    JvGradient1: TJvGradient;
    JvGradient2: TJvGradient;
    Label_Ramal: TLabel;
    Label_Apto: TLabel;
    DBGrid_Apto: TDBGrid;
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

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form_Tab_Residente: TForm_Tab_Residente;

implementation

{$R *.DFM}

//------------------------------------------------------------------------------
// Modulo Principal
//------------------------------------------------------------------------------

procedure TForm_Tab_Residente.FormCreate(Sender: TObject);
begin
   Query_TabelaPreco.Open;
   Table_Tab_Residente.Open;
   Atualiza;
   Botao(True);
   Habilita_Campos(False);
end;

//------------------------------------------------------------------------------
// Modulo de Inserção de Dados
//------------------------------------------------------------------------------

procedure TForm_Tab_Residente.ToolButton_InserirClick(Sender: TObject);
begin
   Try
     Botao(False);
     Habilita_Campos(True);

     Table_Tab_Residente.Append;
     StatusBar.SimpleText:= 'Forneça os Dados da Tabela de Preço';
   Except
     MessageDlg('Erro na inserção.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Alteração de Dados
//------------------------------------------------------------------------------

procedure TForm_Tab_Residente.ToolButton_AlterarClick(Sender: TObject);
begin
     Botao(False);
     Habilita_Campos(True);
     Table_Tab_Residente.Edit;
     DBEdit_Valor.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Exclusão de Dados
//------------------------------------------------------------------------------

procedure TForm_Tab_Residente.ToolButton_ExcluirClick(Sender: TObject);
begin
   Botao(False);
   ToolButton_Gravar.Enabled:= False;
   ToolButton_Ignorar.Enabled:= False;
   if MessageDlg('Confirma a exclusão ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Table_Tab_Residente.Delete;
      Atualiza;
   end;
   Botao(True);
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_Tab_Residente.ToolButton_GravarClick(Sender: TObject);
begin
   Table_Tab_Residente.Post;
   Botao(True);
   Habilita_Campos(False);
   Atualiza;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_Tab_Residente.ToolButton_IgnorarClick(Sender: TObject);
begin
   Try
      Table_Tab_Residente.Cancel;
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

procedure TForm_Tab_Residente.ToolButton_RetornarClick(Sender: TObject);
begin
   Query_TabelaPreco.Close;
   Table_Tab_Residente.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Procedure de Redresh da Query
//------------------------------------------------------------------------------

procedure TForm_Tab_Residente.Atualiza;
begin
   Query_TabelaPreco.Close;
   Query_TabelaPreco.Open;
end;

//------------------------------------------------------------------------------
// Habilita o acesso aos campos de tratamento do Apto
//------------------------------------------------------------------------------

procedure TForm_Tab_Residente.Habilita_Campos(Status: Boolean);
begin
   if Status = True then
   begin
      DBEdit_Posto.Enabled:= True;
      DBEdit_Valor.Enabled:= True;
   end
   else
   begin
      DBEdit_Posto.Enabled:= False;
      DBEdit_Valor.Enabled:= False;
   end;
end;


//------------------------------------------------------------------------------
// Desabilita Botoes
//------------------------------------------------------------------------------

procedure TForm_Tab_Residente.Botao(Status: Boolean);
begin
   DBNavigator_Residente.Enabled:= Status;
   ToolButton_Inserir.Enabled:= Status;
   ToolButton_Alterar.Enabled:= Status;
   ToolButton_Excluir.Enabled:= Status;
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

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Tab_Residente.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;
end.
