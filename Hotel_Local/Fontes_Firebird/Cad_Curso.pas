unit Cad_Curso;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DBGrids, ComCtrls, Buttons, Grids, ExtCtrls,
  Mask, Rotinas, IBCustomDataSet, IBTable, ToolWin, DB, JvComponent,
  JvEnterTab;

type
  TForm_Cad_Curso = class(TForm)
    DST_Curso: TDataSource;
    IBTable_Curso: TIBTable;
    Panel2: TPanel;
    DBGrid_Curso: TDBGrid;
    StatusBar: TStatusBar;
    ToolBar2: TToolBar;
    ToolButton_Inserir: TToolButton;
    ToolButton_Alterar: TToolButton;
    ToolButton_Excluir: TToolButton;
    ToolButton_Gravar: TToolButton;
    ToolButton_Cancelar: TToolButton;
    ToolButton2: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    GroupBox1: TGroupBox;
    DBEdit_Decea: TDBEdit;
    JvEnterAsTab1: TJvEnterAsTab;

    procedure ToolButton_InserirClick(Sender: TObject);
    procedure ToolButton_AlterarClick(Sender: TObject);
    procedure ToolButton_ExcluirClick(Sender: TObject);
    procedure ToolButton_GravarClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);

    procedure Atualiza;
    procedure Botoes(Status: Boolean);
    procedure HabCampos;
    procedure DesabCampos;
    procedure ToolButton_CancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form_Cad_Curso: TForm_Cad_Curso;

implementation

uses Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Modulo Principal
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.FormActivate(Sender: TObject);
begin
  IBTable_Curso.Open;
  Atualiza;
  Botoes(True);
  DesabCampos;
  DBGrid_Curso.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Inserção de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.ToolButton_InserirClick(Sender: TObject);
begin
   Try
     Botoes(False);
     HabCampos;
     IBTable_Curso.Append;
     StatusBar.SimpleText:= 'Forneça os Dados da Unidade do Decea';
     DBEdit_Decea.SetFocus;
   Except
     MessageDlg('Erro na inserção.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Alteração de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.ToolButton_AlterarClick(Sender: TObject);
begin
   Try
     Botoes(False);
     HabCampos;
     IBTable_Curso.Edit;
     DBEdit_Decea.SetFocus;
   Except
     MessageDlg('Erro na Alteração.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Exclusão de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.ToolButton_ExcluirClick(Sender: TObject);
begin
   Botoes(False);
   ToolButton_Gravar.Enabled:= False;
   ToolButton_Cancelar.Enabled:= False;
   if MessageDlg('Confirma a exclusão ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      IBTable_Curso.Delete;
      DM.IBTransaction_Hotel.CommitRetaining;
      Atualiza;
   end;
   Botoes(True);
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.ToolButton_GravarClick(Sender: TObject);
begin
   IBTable_Curso.Post;
   DM.IBTransaction_Hotel.CommitRetaining;
   Botoes(True);
   Atualiza;
   DesabCampos;
   DBGrid_Curso.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.ToolButton_CancelarClick(Sender: TObject);
begin
   Try
      IBTable_Curso.Cancel;
      DM.IBTransaction_Hotel.CommitRetaining;
      Botoes(True);
      Atualiza;
      DesabCampos;
      DBGrid_Curso.SetFocus;
   Except
      MessageDlg('Erro na Cancelamento.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.ToolButton_RetornarClick(Sender: TObject);
begin
   IBTable_Curso.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Procedure de Redresh da Query
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.Atualiza;
begin
   IBTable_Curso.Active:= False;
   IBTable_Curso.Active:= true;
end;

//------------------------------------------------------------------------------
// Desabilita o acesso aos campos de tratamento do Aerodromo
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.DesabCampos;
begin
   DBEdit_Decea.ReadOnly:= True;
end;

//------------------------------------------------------------------------------
// Habilita o acesso aos campos de tratamento do Aerodromo
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.HabCampos;
begin
   DBEdit_Decea.ReadOnly:= False;
end;

//------------------------------------------------------------------------------
// Tratamento dos Botoes
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.Botoes(Status: Boolean);
begin
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
   ToolButton_Cancelar.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;


procedure TForm_Cad_Curso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;


end.
