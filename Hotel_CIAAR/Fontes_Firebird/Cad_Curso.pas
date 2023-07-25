unit Cad_Curso;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, ComCtrls, Buttons, Grids, ExtCtrls,
  Mask, Rotinas, IBCustomDataSet, IBTable, ToolWin;

type
  TForm_Cad_Curso = class(TForm)
    DST_Curso: TDataSource;
    IBTable_Curso: TIBTable;
    Panel3: TPanel;
    DBNavigator_Curso: TDBNavigator;
    ToolBar4: TToolBar;
    ToolButton_Inserir: TToolButton;
    ToolButton_Alterar: TToolButton;
    ToolButton_Excluir: TToolButton;
    ToolButton_Gravar: TToolButton;
    ToolButton_Ignorar: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    StatusBar: TStatusBar;
    Panel2: TPanel;
    DBGrid_Apto: TDBGrid;
    GroupBox1: TGroupBox;
    DBEdit_Curso: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure ToolButton_InserirClick(Sender: TObject);
    procedure ToolButton_AlterarClick(Sender: TObject);
    procedure ToolButton_ExcluirClick(Sender: TObject);
    procedure ToolButton_GravarClick(Sender: TObject);
    procedure ToolButton_IgnorarClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);

    procedure Atualiza;
    procedure Desabilita;
    procedure Habilita;
    procedure HabCampos;
    procedure DesabCampos;
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

procedure TForm_Cad_Curso.FormCreate(Sender: TObject);
begin
   IBTable_Curso.Open;
   Atualiza;
   Habilita;
   DesabCampos;
   StatusBar.SimpleText:= 'Selecione a opção desejada.';
end;

//------------------------------------------------------------------------------
// Modulo de Inserção de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.ToolButton_InserirClick(Sender: TObject);
begin
   Try
     Desabilita;
     HabCampos;
     IBTable_Curso.Append;
     StatusBar.SimpleText:= 'Forneça os Dados do curso';
     DBEdit_Curso.SetFocus;
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
     Desabilita;
     HabCampos;
     StatusBar.SimpleText:= 'Entre com a alteração necessária';
     IBTable_Curso.Edit;
     DBEdit_Curso.SetFocus;
   Except
     MessageDlg('Erro na Alteração.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Exclusão de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.ToolButton_ExcluirClick(Sender: TObject);
begin
   Desabilita;
   ToolButton_Gravar.Enabled:= False;
   ToolButton_Ignorar.Enabled:= False;
   if MessageDlg('Confirma a exclusão ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      IBTable_Curso.Delete;
      DM.IBTransaction_Hotel.CommitRetaining;
      Atualiza;
   end;
   Habilita;
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.ToolButton_GravarClick(Sender: TObject);
begin
   IBTable_Curso.Post;
   DM.IBTransaction_Hotel.CommitRetaining;
   Habilita;
   Atualiza;
   DesabCampos;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.ToolButton_IgnorarClick(Sender: TObject);
begin
   Try
      IBTable_Curso.Cancel;
      DM.IBTransaction_Hotel.CommitRetaining;
      Habilita;
      Atualiza;
      DesabCampos;
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
   DBEdit_Curso.ReadOnly:= True;
end;

//------------------------------------------------------------------------------
// Habilita o acesso aos campos de tratamento do Aerodromo
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.HabCampos;
begin
   DBEdit_Curso.ReadOnly:= False;
end;

//------------------------------------------------------------------------------
// Habilita Botoes
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.Habilita;
begin
   DBNavigator_Curso.Enabled:= True;
   ToolButton_Inserir.Enabled:= True;
   ToolButton_Alterar.Enabled:= True;
   ToolButton_Excluir.Enabled:= True;
   ToolButton_Gravar.Enabled:= False;
   ToolButton_Ignorar.Enabled:= False;
   ToolButton_Retornar.Enabled:= True;
   ToolButton_Windows.Enabled:= True;
end;

//------------------------------------------------------------------------------
// Desabilita Botoes
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.Desabilita;
begin
   DBNavigator_Curso.Enabled:= False;
   ToolButton_Inserir.Enabled:= False;
   ToolButton_Alterar.Enabled:= False;
   ToolButton_Excluir.Enabled:= False;
   ToolButton_Gravar.Enabled:= True;
   ToolButton_Ignorar.Enabled:= True;
   ToolButton_Retornar.Enabled:= False;
   ToolButton_Windows.Enabled:= False;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

end.
