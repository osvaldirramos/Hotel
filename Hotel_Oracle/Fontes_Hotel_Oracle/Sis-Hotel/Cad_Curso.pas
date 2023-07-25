unit Cad_Curso;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, ComCtrls, Buttons, Grids, ExtCtrls,
  Mask, Rotinas, DBTables, ToolWin;

type
  TForm_Cad_Curso = class(TForm)
    Table_Curso: TTable;
    DST_Curso: TDataSource;
    Table_CursoCURSO: TStringField;
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
    GroupBox1: TGroupBox;
    DBEdit_Curso: TDBEdit;
    StatusBar: TStatusBar;
    DBGrid_Apto: TDBGrid;
    procedure FormCreate(Sender: TObject);

    procedure Atualiza;
    procedure Desabilita;
    procedure Habilita;
    procedure HabCampos;
    procedure DesabCampos;
    procedure ToolButton_InserirClick(Sender: TObject);
    procedure ToolButton_AlterarClick(Sender: TObject);
    procedure ToolButton_ExcluirClick(Sender: TObject);
    procedure ToolButton_CancelarClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton_GravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private      { private declarations }
     VS_Opcao: String;
  public
    { public declarations }
  end;

var
  Form_Cad_Curso: TForm_Cad_Curso;

implementation

{$R *.DFM}

//------------------------------------------------------------------------------
// Modulo Principal
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.FormCreate(Sender: TObject);
begin
   Table_Curso.Open;
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
     VS_Opcao:= 'Inserção ';
     Desabilita;
     HabCampos;
     Table_Curso.Append;
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
     VS_Opcao:= 'Alteração ';
     Desabilita;
     HabCampos;
     StatusBar.SimpleText:= 'Entre com a alteração necessária';
     Table_Curso.Edit;
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
   ToolButton_Cancelar.Enabled:= False;
   if MessageDlg('Confirma a exclusão ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Funcoes.Log_Recepcao('Exclusão do Curso '+Table_Curso.FieldByName('Curso').AsString);
      Table_Curso.Delete;
      Atualiza;
   end;
   Habilita;
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.ToolButton_GravarClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao(VS_Opcao+' do Curso '+Table_Curso.FieldByName('Curso').AsString);
   Table_Curso.Post;
   Habilita;
   Atualiza;
   DesabCampos;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.ToolButton_CancelarClick(Sender: TObject);
begin
   Try
      Table_Curso.Cancel;
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
   Table_Curso.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Procedure de Redresh da Query
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.Atualiza;
begin
   Table_Curso.Active:= False;
   Table_Curso.Active:= true;
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
   ToolButton_Inserir.Enabled:= True;
   ToolButton_Alterar.Enabled:= True;
   ToolButton_Excluir.Enabled:= True;
   ToolButton_Gravar.Enabled:= False;
   ToolButton_Cancelar.Enabled:= False;
   ToolButton_Retornar.Enabled:= True;
   ToolButton_Windows.Enabled:= True;
end;

//------------------------------------------------------------------------------
// Desabilita Botoes
//------------------------------------------------------------------------------

procedure TForm_Cad_Curso.Desabilita;
begin
   ToolButton_Inserir.Enabled:= False;
   ToolButton_Alterar.Enabled:= False;
   ToolButton_Excluir.Enabled:= False;
   ToolButton_Gravar.Enabled:= True;
   ToolButton_Cancelar.Enabled:= True;
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


procedure TForm_Cad_Curso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.
