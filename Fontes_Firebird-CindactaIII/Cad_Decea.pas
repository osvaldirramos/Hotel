unit Cad_Decea;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DBGrids, ComCtrls, Buttons, Grids, ExtCtrls,
  Mask, Rotinas, IBCustomDataSet, IBTable, ToolWin, DB;

type
  TForm_Cad_Decea = class(TForm)
    DST_Decea: TDataSource;
    IBTable_Decea: TIBTable;
    Panel2: TPanel;
    DBGrid_Apto: TDBGrid;
    GroupBox1: TGroupBox;
    DBEdit_Decea: TDBEdit;
    Panel_Botoes: TPanel;
    DBNavigator_Decea: TDBNavigator;
    ToolBar4: TToolBar;
    ToolButton_Inserir: TToolButton;
    ToolButton_Alterar: TToolButton;
    ToolButton_Excluir: TToolButton;
    ToolButton_Gravar: TToolButton;
    ToolButton_Ignorar: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    StatusBar: TStatusBar;

    procedure FormCreate(Sender: TObject);
    procedure ToolButton_InserirClick(Sender: TObject);
    procedure ToolButton_AlterarClick(Sender: TObject);
    procedure ToolButton_ExcluirClick(Sender: TObject);
    procedure ToolButton_GravarClick(Sender: TObject);
    procedure ToolButton_IgnorarClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);

    procedure Atualiza;
    procedure Botoes(Status: Boolean);
    procedure HabCampos;
    procedure DesabCampos;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form_Cad_Decea: TForm_Cad_Decea;

implementation

uses Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Modulo Principal
//------------------------------------------------------------------------------

procedure TForm_Cad_Decea.FormCreate(Sender: TObject);
begin
   IBTable_Decea.Open;
   Atualiza;
   Botoes(True);
   DesabCampos;
end;

//------------------------------------------------------------------------------
// Modulo de Inserção de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Decea.ToolButton_InserirClick(Sender: TObject);
begin
   Try
     Botoes(False);
     HabCampos;
     IBTable_Decea.Append;
     StatusBar.SimpleText:= 'Forneça os Dados da Unidade do Decea';
     DBEdit_Decea.SetFocus;
   Except
     MessageDlg('Erro na inserção.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Alteração de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Decea.ToolButton_AlterarClick(Sender: TObject);
begin
   Try
     Botoes(False);
     HabCampos;
     IBTable_Decea.Edit;
     DBEdit_Decea.SetFocus;
   Except
     MessageDlg('Erro na Alteração.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Exclusão de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Decea.ToolButton_ExcluirClick(Sender: TObject);
begin
   Botoes(False);
   ToolButton_Gravar.Enabled:= False;
   ToolButton_Ignorar.Enabled:= False;
   if MessageDlg('Confirma a exclusão ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      IBTable_Decea.Delete;
      DM.IBTransaction_Hotel.CommitRetaining;
      Atualiza;
   end;
   Botoes(True);
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Decea.ToolButton_GravarClick(Sender: TObject);
begin
   IBTable_Decea.Post;
   DM.IBTransaction_Hotel.CommitRetaining;
   Botoes(True);
   Atualiza;
   DesabCampos;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Decea.ToolButton_IgnorarClick(Sender: TObject);
begin
   Try
      IBTable_Decea.Cancel;
      DM.IBTransaction_Hotel.CommitRetaining;
      Botoes(True);
      Atualiza;
      DesabCampos;
   Except
      MessageDlg('Erro na Cancelamento.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_Cad_Decea.ToolButton_RetornarClick(Sender: TObject);
begin
   IBTable_Decea.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Procedure de Redresh da Query
//------------------------------------------------------------------------------

procedure TForm_Cad_Decea.Atualiza;
begin
   IBTable_Decea.Active:= False;
   IBTable_Decea.Active:= true;
end;

//------------------------------------------------------------------------------
// Desabilita o acesso aos campos de tratamento do Aerodromo
//------------------------------------------------------------------------------

procedure TForm_Cad_Decea.DesabCampos;
begin
   DBEdit_Decea.ReadOnly:= True;
end;

//------------------------------------------------------------------------------
// Habilita o acesso aos campos de tratamento do Aerodromo
//------------------------------------------------------------------------------

procedure TForm_Cad_Decea.HabCampos;
begin
   DBEdit_Decea.ReadOnly:= False;
end;

//------------------------------------------------------------------------------
// Tratamento dos Botoes
//------------------------------------------------------------------------------

procedure TForm_Cad_Decea.Botoes(Status: Boolean);
begin
   DBNavigator_Decea.Enabled:= Status;
   ToolButton_Inserir.Enabled:= Status;
   ToolButton_Alterar.Enabled:= Status;
   ToolButton_Excluir.Enabled:= Status;
   ToolButton_Retornar.Enabled:= Status;
   ToolButton_Windows.Enabled:= Status;

   if Status = True then
      Status:= False
   else
      Status:= True;

   ToolButton_Gravar.Enabled:= Status;
   ToolButton_Ignorar.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Cad_Decea.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

end.
