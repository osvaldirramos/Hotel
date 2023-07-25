unit CadRegrasDeDesconto;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, ComCtrls, Buttons, Grids, ExtCtrls,
  Mask, Rotinas, DBTables, ToolWin;

type
  TForm_CadRegrasDeDesconto = class(TForm)
    Table_RegrasDeDesconto: TTable;
    DST_RegrasDeDesconto: TDataSource;
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
    Panel_ListaDeRegras: TPanel;
    DBGrid_Apto: TDBGrid;
    StatusBar: TStatusBar;
    Panel1: TPanel;
    Label_Situacao_Curso: TLabel;
    Table_RegrasDeDescontoSITUACAO_CURSO: TStringField;
    Table_RegrasDeDescontoDIAS: TFloatField;
    Table_RegrasDeDescontoDESCONTO: TFloatField;
    Label_Dias: TLabel;
    Label2: TLabel;
    DBEdit_Desconto: TDBEdit;
    DBComboBox_SituacaoCurso: TDBComboBox;
    Label1: TLabel;
    DBEdit_Do: TDBEdit;
    Table_RegrasDeDescontoINICIO: TFloatField;
    Table_RegrasDeDescontoTERMINO: TFloatField;
    Label3: TLabel;
    DBEdit_Ate: TDBEdit;
    procedure FormCreate(Sender: TObject);

    procedure Atualiza;
    procedure Botoes(Status: Boolean);

    procedure HabCampos;
    procedure DesabCampos;
    procedure ToolButton_InserirClick(Sender: TObject);
    procedure ToolButton_AlterarClick(Sender: TObject);
    procedure ToolButton_ExcluirClick(Sender: TObject);
    procedure ToolButton_CancelarClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton_GravarClick(Sender: TObject);
  private    { private declarations }
    VS_Opcao: String;
  public
    { public declarations }
  end;

var
  Form_CadRegrasDeDesconto: TForm_CadRegrasDeDesconto;

implementation

{$R *.DFM}

//------------------------------------------------------------------------------
// Modulo Principal
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDesconto.FormCreate(Sender: TObject);
begin
   // Alimenta os ComboBox de Trabalho

   Funcoes.AlimentaDBComboBox(DBComboBox_SituacaoCurso, 0, '', 'SituacaoCurso.cnf');

   //--- Abre as tabelas de trabalho

   Table_RegrasDeDesconto.Open;
   Atualiza;
   Botoes(True);
   DesabCampos;
   StatusBar.SimpleText:= 'Selecione a opção desejada.';
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDesconto.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDesconto.ToolButton_RetornarClick(Sender: TObject);
begin
   Table_RegrasDeDesconto.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Modulo de Inserção de Dados
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDesconto.ToolButton_InserirClick(Sender: TObject);
begin
   Try
     VS_Opcao:= 'Inserção ';
     Botoes(False);
     HabCampos;
     Table_RegrasDeDesconto.Append;
     StatusBar.SimpleText:= 'Forneça a regras do desconto';
     DBComboBox_SituacaoCurso.SetFocus;
   Except
     MessageDlg('Erro na inserção.', mtInformation,[mbOk], 0);
   end;

end;

//------------------------------------------------------------------------------
// Modulo de Alteração de Dados
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDesconto.ToolButton_AlterarClick(Sender: TObject);
begin
   Try
     VS_Opcao:= 'Alteração ';
     Botoes(False);
     HabCampos;
     StatusBar.SimpleText:= 'Entre com a alteração necessária';
     Table_RegrasDeDesconto.Edit;
     DBComboBox_SituacaoCurso.SetFocus;
   Except
     MessageDlg('Erro na Alteração.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Exclusão de Dados
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDesconto.ToolButton_ExcluirClick(Sender: TObject);
begin
   Botoes(False);
   ToolButton_Gravar.Enabled:= False;
   ToolButton_Cancelar.Enabled:= False;
   if MessageDlg('Confirma a exclusão ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Funcoes.Log_Recepcao('Exclusão da Regra de Pagamento dias '+Table_RegrasDeDesconto.FieldByName('Dias').AsString+' Inicio '+Table_RegrasDeDesconto.FieldByName('Inicio').AsString);
      Table_RegrasDeDesconto.Delete;
      Atualiza;
   end;
   Botoes(True);
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDesconto.ToolButton_GravarClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao(VS_Opcao+' da Regra de Pagamento dias '+Table_RegrasDeDesconto.FieldByName('Dias').AsString+' Inicio '+Table_RegrasDeDesconto.FieldByName('Inicio').AsString);
   Table_RegrasDeDesconto.FieldByName('Dias').AsInteger:= Table_RegrasDeDesconto.FieldByName('Inicio').AsInteger;
   Table_RegrasDeDesconto.Post;
   Botoes(True);
   Atualiza;
   DesabCampos;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDesconto.ToolButton_CancelarClick(Sender: TObject);
begin
   Try
      Table_RegrasDeDesconto.Cancel;
      Botoes(True);
      Atualiza;
      DesabCampos;
   Except
      MessageDlg('Erro na Cancelamento.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Procedure de Redresh da Query
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDesconto.Atualiza;
begin
   Table_RegrasDeDesconto.Close;
   Table_RegrasDeDesconto.Open;
end;

//------------------------------------------------------------------------------
// Desabilita o acesso aos campos de tratamento do Aerodromo
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDesconto.DesabCampos;
begin
   DBEdit_Do.ReadOnly:= True;
   DBEdit_Ate.ReadOnly:= True;
   DBEdit_Desconto.ReadOnly:= True;
   DBComboBox_SituacaoCurso.ReadOnly:= True;
   Panel_ListaDeRegras.Enabled:= True;
end;

//------------------------------------------------------------------------------
// Habilita o acesso aos campos de tratamento do Aerodromo
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDesconto.HabCampos;
begin
   DBEdit_Do.ReadOnly:= False;
   DBEdit_Ate.ReadOnly:= False;
   DBEdit_Desconto.ReadOnly:= False;
   DBComboBox_SituacaoCurso.ReadOnly:= False;
   Panel_ListaDeRegras.Enabled:= False;
end;

//------------------------------------------------------------------------------
// Habilita Botoes
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDesconto.Botoes(Status: Boolean);
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

end.
