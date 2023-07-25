unit Cad_Decea;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, ComCtrls, Buttons, Grids, ExtCtrls,
  Mask, Rotinas, DBTables, ToolWin;

type
  TForm_Cad_Decea = class(TForm)
    Table_Decea: TTable;
    DST_Decea: TDataSource;
    Table_DeceaLOCALIDADE: TStringField;
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
    DBGrid_Apto: TDBGrid;
    StatusBar: TStatusBar;
    procedure FormCreate(Sender: TObject);

    procedure Atualiza;
    procedure Desabilita;
    procedure Habilita;
    procedure HabCampos;
    procedure DesabCampos;
    procedure ToolButton_InserirClick(Sender: TObject);
    procedure ToolButton_AlterarClick(Sender: TObject);
    procedure ToolButton_ExcluirClick(Sender: TObject);
    procedure ToolButton_GravarClick(Sender: TObject);
    procedure ToolButton_CancelarClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
  private          { private declarations }
     VS_Opcao: String;
  public
    { public declarations }
  end;

var
  Form_Cad_Decea: TForm_Cad_Decea;

implementation

{$R *.DFM}

//------------------------------------------------------------------------------
// Modulo Principal
//------------------------------------------------------------------------------

procedure TForm_Cad_Decea.FormCreate(Sender: TObject);
begin
   Table_Decea.Open;
   Atualiza;
   Habilita;
   DesabCampos;
end;

//------------------------------------------------------------------------------
// Modulo de Inserção de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Decea.ToolButton_InserirClick(Sender: TObject);
begin
   Try
     VS_Opcao:= 'Inserção ';
     Desabilita;
     HabCampos;
     Table_Decea.Append;
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
     VS_Opcao:= 'Alteração ';
     Desabilita;
     HabCampos;
     Table_Decea.Edit;
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
   Desabilita;
   ToolButton_Gravar.Enabled:= False;
   ToolButton_Cancelar.Enabled:= False;
   if MessageDlg('Confirma a exclusão ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Funcoes.Log_Recepcao('Exclusão da Unidade do DECEA '+Table_Decea.FieldByName('Localidade').AsString);
      Table_Decea.Delete;
      Atualiza;
   end;
   Habilita;
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Decea.ToolButton_GravarClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao(VS_Opcao+' da Unidade do DECEA '+Table_Decea.FieldByName('Localidade').AsString);
   Table_Decea.Post;
   Habilita;
   Atualiza;
   DesabCampos;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Decea.ToolButton_CancelarClick(Sender: TObject);
begin
   Try
      Table_Decea.Cancel;
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

procedure TForm_Cad_Decea.ToolButton_RetornarClick(Sender: TObject);
begin
   Table_Decea.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Procedure de Redresh da Query
//------------------------------------------------------------------------------

procedure TForm_Cad_Decea.Atualiza;
begin
   Table_Decea.Active:= False;
   Table_Decea.Active:= true;
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
// Habilita Botoes
//------------------------------------------------------------------------------

procedure TForm_Cad_Decea.Habilita;
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

procedure TForm_Cad_Decea.Desabilita;
begin
   ToolButton_Inserir.Enabled:= False;
   ToolButton_Alterar.Enabled:= False;
   ToolButton_Excluir.Enabled:= False;
   ToolButton_Retornar.Enabled:= False;
   ToolButton_Windows.Enabled:= False;
   ToolButton_Gravar.Enabled:= True;
   ToolButton_Cancelar.Enabled:= True;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Cad_Decea.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

end.
