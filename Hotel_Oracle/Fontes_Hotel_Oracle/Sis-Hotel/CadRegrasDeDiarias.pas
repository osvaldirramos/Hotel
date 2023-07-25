unit CadRegrasDeDiarias;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, ComCtrls, Buttons, Grids, ExtCtrls,
  Mask, Rotinas, DBTables, ToolWin, JvEdit, JvGradient;

type
  TForm_CadRegrasDeDiarias = class(TForm)
    Table_RegrasDeDiaria: TTable;
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
    StatusBar: TStatusBar;
    Panel_Campos: TPanel;
    Table_RegrasDeDiariaPREDIO: TStringField;
    Table_RegrasDeDiariaINICIO: TFloatField;
    Table_RegrasDeDiariaTERMINO: TFloatField;
    Table_RegrasDeDiariaVALOR: TFloatField;
    DBComboBox_SituacaoCurso: TDBComboBox;
    DBComboBox_Predio: TDBComboBox;
    DBEdit_Do: TDBEdit;
    DBEdit_Ate: TDBEdit;
    DBEdit_Valor: TDBEdit;
    Panel_ListaDeRegras: TPanel;
    DBGrid_Apto: TDBGrid;
    Panel6: TPanel;
    ComboBox_Predio: TComboBox;
    Query_RegrasDiaria: TQuery;
    DSQ_RegrasDiaria: TDataSource;
    Query_RegrasDiariaPREDIO: TStringField;
    Query_RegrasDiariaINICIO: TFloatField;
    Query_RegrasDiariaTERMINO: TFloatField;
    Query_RegrasDiariaVALOR: TFloatField;
    ComboBox_PostoGraduacao: TComboBox;
    Table_RegrasDeDiariaPOSTOGRADUAO: TStringField;
    Query_RegrasDiariaPOSTOGRADUAO: TStringField;
    JvGradient1: TJvGradient;
    Label_ValorDiaria: TLabel;
    Label3: TLabel;
    Label_Dias: TLabel;
    Label_Predio: TLabel;
    Label_PostoGraduacao: TLabel;
    Query_RegrasDiariaSISCEAB: TFloatField;
    Label1: TLabel;
    DBEdit_SISCEAB: TDBEdit;
    Table_RegrasDeDiariaSISCEAB: TFloatField;

    procedure FormCreate(Sender: TObject);

    procedure RelacaoPostoGraduacao;
    procedure Atualiza;
    procedure Botoes(Status: Boolean);

    procedure Campos(Status: Boolean);
    procedure ToolButton_InserirClick(Sender: TObject);
    procedure ToolButton_AlterarClick(Sender: TObject);
    procedure ToolButton_ExcluirClick(Sender: TObject);
    procedure ToolButton_CancelarClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton_GravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MaskEdit_PostoGraduacaoChange(Sender: TObject);
  private        { private declarations }
      VS_opcao: String;
  public
    { public declarations }
  end;

var
  Form_CadRegrasDeDiarias: TForm_CadRegrasDeDiarias;

implementation

uses Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Modulo Principal
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDiarias.FormCreate(Sender: TObject);
begin
   // Alimenta os ComboBox de Trabalho

   Funcoes.AlimentaDBComboBox(DBComboBox_Predio, 0, '', 'Predio.cnf');

   //--- Abre as tabelas de trabalho

   Query_RegrasDiaria.Open;
   Table_RegrasDeDiaria.Open;
   Atualiza;
   Botoes(True);
   Campos(False);
   RelacaoPostoGraduacao;
   StatusBar.SimpleText:= 'Selecione a opção desejada.';
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDiarias.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDiarias.ToolButton_RetornarClick(Sender: TObject);
begin
   Table_RegrasDeDiaria.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Modulo de Inserção de Dados
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDiarias.ToolButton_InserirClick(Sender: TObject);
begin
   Try
     VS_opcao:= 'Inserção ';
     Botoes(False);
     Campos(True);
     Table_RegrasDeDiaria.Append;
     StatusBar.SimpleText:= 'Forneça a regras do desconto';
     Label_PostoGraduacao.Visible:= True;
     DBComboBox_SituacaoCurso.Visible:= True;
     Label_Predio.Visible:= True;
     DBComboBox_Predio.Visible:= True;
     DBComboBox_SituacaoCurso.SetFocus;
   Except
     MessageDlg('Erro na inserção.', mtInformation,[mbOk], 0);
   end;

end;

//------------------------------------------------------------------------------
// Modulo de Alteração de Dados
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDiarias.ToolButton_AlterarClick(Sender: TObject);
begin
   Try
     VS_opcao:= 'Alteração ';
     Botoes(False);
     Campos(True);
     StatusBar.SimpleText:= 'Entre com a alteração necessária';
     Table_RegrasDeDiaria.Edit;

     Label_PostoGraduacao.Visible:= False;
     DBComboBox_SituacaoCurso.Visible:= False;
     Label_Predio.Visible:= False;
     DBComboBox_Predio.Visible:= False;

     DBEdit_Valor.SetFocus;
   Except
     MessageDlg('Erro na Alteração.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Exclusão de Dados
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDiarias.ToolButton_ExcluirClick(Sender: TObject);
begin
   Botoes(False);
   ToolButton_Gravar.Enabled:= False;
   ToolButton_Cancelar.Enabled:= False;
   if MessageDlg('Confirma a exclusão ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Funcoes.Log_Recepcao('Exclusão da Regra de Diarias Apto '+DBComboBox_Predio.Text);
      Table_RegrasDeDiaria.Delete;

      Atualiza;
   end;
   Botoes(True);
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDiarias.ToolButton_GravarClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao(VS_opcao+' da Regra de Diarias Apto '+DBComboBox_Predio.Text);
   Table_RegrasDeDiaria.Post;
   Botoes(True);
   Atualiza;
   Campos(False);
   RelacaoPostoGraduacao;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDiarias.ToolButton_CancelarClick(Sender: TObject);
begin
   Try
      Table_RegrasDeDiaria.Cancel;
      Botoes(True);
      Atualiza;
      Campos(False);
   Except
      MessageDlg('Erro na Cancelamento.', mtInformation,[mbOk], 0);
      Campos(False);
   end;
end;

//------------------------------------------------------------------------------
// Procedure de Redresh da Query
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDiarias.Atualiza;
var
   bmLocal : TBookmark;
begin
   bmLocal:= Query_RegrasDiaria.GetBookMark;
   Query_RegrasDiaria.Close;
   Query_RegrasDiaria.Open;
   Query_RegrasDiaria.GotoBookMark(bmLocal);
   Query_RegrasDiaria.FreeBookMark(bmLocal);
end;

//------------------------------------------------------------------------------
// Desabilita o acesso aos campos
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDiarias.Campos(Status: Boolean);
begin

    DBComboBox_SituacaoCurso.Enabled:= Status;
    DBComboBox_Predio.Enabled:= Status;
    DBEdit_Do.Enabled:= Status;
    DBEdit_Ate.Enabled:= Status;
    DBEdit_Valor.Enabled:= Status;
    DBEdit_SISCEAB.Enabled:= Status;

    Panel_Campos.Visible:= Status;

    if Status = True then
       Status:= False
    else
       Status:= True;

    Panel_ListaDeRegras.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Habilita Botoes
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDiarias.Botoes(Status: Boolean);
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

procedure TForm_CadRegrasDeDiarias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

procedure TForm_CadRegrasDeDiarias.MaskEdit_PostoGraduacaoChange(Sender: TObject);
var
    VS_Comando: String;
begin
   VS_Comando:= 'Select * from REGRASDEDIARIAS ';

   if ComboBox_PostoGraduacao.Text <> '' Then
      VS_Comando:= VS_Comando+' Where Upper(PostoGraduação) = '+#39+ComboBox_PostoGraduacao.Text+#39;

   if ComboBox_Predio.Text <> '' Then
      if ComboBox_PostoGraduacao.Text <> '' Then
         VS_Comando:= VS_Comando+' and Predio = '+#39+ComboBox_Predio.Text+#39
      else
         VS_Comando:= VS_Comando+' Where Predio = '+#39+ComboBox_Predio.Text+#39;

    Query_RegrasDiaria.Close;
    Query_RegrasDiaria.SQL.Clear;
    Query_RegrasDiaria.SQL.Add(VS_Comando+' Order By Predio, PostoGraduação, inicio');
    Query_RegrasDiaria.Open;
end;

procedure TForm_CadRegrasDeDiarias.RelacaoPostoGraduacao;
var
    VS_Comando: String;
begin
   ComboBox_PostoGraduacao.Items.Clear;
   ComboBox_PostoGraduacao.Items.Add('');

   VS_Comando:= 'Select distinct PostoGraduação from REGRASDEDIARIAS order By PostoGraduação';
   DM.Query_ExecutaQuery.Close;
   DM.Query_ExecutaQuery.SQL.Clear;
   DM.Query_ExecutaQuery.SQL.Add(VS_Comando);
   DM.Query_ExecutaQuery.Open;

   DM.Query_ExecutaQuery.First;
   While not DM.Query_ExecutaQuery.Eof do
   begin
      ComboBox_PostoGraduacao.Items.Add(DM.Query_ExecutaQuery.FieldByName('PostoGraduação').AsString);
      DM.Query_ExecutaQuery.Next;
   end;
end;

end.
