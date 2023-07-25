unit Cad_Facilidades;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, StdCtrls, Mask, DBCtrls, Buttons, Db, Grids, DBGrids, ExtCtrls,
  ComCtrls, Rotinas, ToolWin;

type
  TForm_Cad_Facilidades = class(TForm)
    Panel3: TPanel;
    DBGrid_Hospede: TDBGrid;
    Table_Facilidade: TTable;
    DST_Facilidade: TDataSource;
    GroupBox1: TGroupBox;
    Label_Predio: TLabel;
    Label_Apto: TLabel;
    Label_Ramal: TLabel;
    Label_TV: TLabel;
    Label_TV2: TLabel;
    Query_Facilidade: TQuery;
    DSQ_Facilidades: TDataSource;
    Label1: TLabel;
    DBEdit_Tipo: TDBEdit;
    DBEdit_Nome: TDBEdit;
    DBEdit_Telefone: TDBEdit;
    DBEdit_Endereco: TDBEdit;
    DBEdit_Horario: TDBEdit;
    DBEdit_OBS: TDBEdit;
    StatusBar: TStatusBar;
    Table_FacilidadeTIPO: TStringField;
    Table_FacilidadeNOME: TStringField;
    Table_FacilidadeENDERECO: TStringField;
    Query_FacilidadeTIPO: TStringField;
    Query_FacilidadeNOME: TStringField;
    Query_FacilidadeHORARIO: TStringField;
    Table_FacilidadeHORARIO: TStringField;
    Table_FacilidadeOBS: TStringField;
    Table_FacilidadeTELEFONE: TStringField;
    Query_FacilidadeTELEFONE: TStringField;
    ToolBar2: TToolBar;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    ToolButton_Ajuda: TToolButton;
    ToolBar_Botoes_1: TToolBar;
    ToolButton_Inserir: TToolButton;
    ToolButton_Alterar: TToolButton;
    ToolButton_Excluir: TToolButton;
    ToolButton_Gravar: TToolButton;
    ToolButton_Ignorar: TToolButton;
    ToolBar1: TToolBar;
    MaskEdit_Tipo: TMaskEdit;
    MaskEdit_Nome: TMaskEdit;
    MaskEdit_Telefone: TMaskEdit;
    MaskEdit_Func: TMaskEdit;
    procedure FormActivate(Sender: TObject);

    procedure Atualiza;
    procedure TrataCampos(Status: Boolean);
    procedure Botao(Status: Boolean);
    procedure Busca_Facilidade;
    procedure MaskEdit_TipoChange(Sender: TObject);
    procedure DBGrid_HospedeTitleClick(Column: TColumn);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton_InserirClick(Sender: TObject);
    procedure ToolButton_AlterarClick(Sender: TObject);
    procedure ToolButton_ExcluirClick(Sender: TObject);
    procedure ToolButton_GravarClick(Sender: TObject);
    procedure ToolButton_IgnorarClick(Sender: TObject);
  private
    { Private declarations }
  public    { Public declarations }
     VS_Opcao, VS_OrderBy: String;
  end;

var
  Form_Cad_Facilidades: TForm_Cad_Facilidades;

implementation

uses Abertura, Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_Cad_Facilidades.FormActivate(Sender: TObject);
begin
   MaskEdit_Tipo.Text:= '';
   MaskEdit_Func.Text:= '';
   MaskEdit_Telefone.Text:= '';
   MaskEdit_Nome.Text:= '';

   VS_OrderBy:= 'tipo';
   Busca_Facilidade;
   Table_Facilidade.Open;

   if ((Funcoes.GetPrivilegio = 'G') or (Funcoes.GetPrivilegio = 'U')) then
      ToolBar_Botoes_1.Visible:= True
   else
      ToolBar_Botoes_1.Visible:= False;

   Atualiza;
   Botao(True);
   TrataCampos(True);
end;

//------------------------------------------------------------------------------
// Modulo de Inserção de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Facilidades.ToolButton_InserirClick(Sender: TObject);
begin
   VS_Opcao:= 'Inserção';
   Botao( False );
   TrataCampos(False);

   Table_Facilidade.Append;
   Table_Facilidade.FieldByName('TIPO').AsString:= '';
   Table_Facilidade.FieldByName('NOME').AsString:= '';
   StatusBar.SimpleText:= 'Forneça os dados da Facilidade';
   DBEdit_Tipo.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Alteração de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Facilidades.ToolButton_AlterarClick(Sender: TObject);
begin
   Try
     VS_Opcao:= 'Alteração';
     Botao(False);
     TrataCampos(False);
     Table_Facilidade.Edit;
     DBEdit_Tipo.SetFocus;
   Except
     MessageDlg('Erro na Alteração.', mtInformation,[mbOk], 0);
   end;

end;

//------------------------------------------------------------------------------
// Modulo de Exclusão de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Facilidades.ToolButton_ExcluirClick(Sender: TObject);
begin
   Botao(False);
   ToolButton_Gravar.Enabled:= False;
   ToolButton_Ignorar.Enabled:= False;
   if MessageDlg('Confirma a exclusão ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Funcoes.Log_Recepcao('Exclusão da Facilidade'+Table_Facilidade.FieldByName('Nome').AsString);
      Table_Facilidade.Delete;
      Atualiza;
   end;
   Botao(True);
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Facilidades.ToolButton_GravarClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao(VS_Opcao+' da Facilidade'+Table_Facilidade.FieldByName('Nome').AsString);
   Table_Facilidade.Post;

   Botao(True);
   Atualiza;
   TrataCampos(True);
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Facilidades.ToolButton_IgnorarClick(Sender: TObject);
begin
   Try
      Table_Facilidade.Cancel;
      Botao(True);
      Atualiza;
      TrataCampos(True);
   Except
      MessageDlg('Erro na Cancelamento.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_Cad_Facilidades.ToolButton_RetornarClick(Sender: TObject);
begin
   Query_Facilidade.Close;
   Table_Facilidade.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Cad_Facilidades.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Procedure de Redresh da Query
//------------------------------------------------------------------------------

procedure TForm_Cad_Facilidades.Atualiza;
begin
   Query_Facilidade.Close;
   Query_Facilidade.Open;
end;

//------------------------------------------------------------------------------
// Desabilita o acesso aos campos de tratamento do Aerodromo
//------------------------------------------------------------------------------

procedure TForm_Cad_Facilidades.TrataCampos(Status: Boolean);
begin
    DBEdit_Tipo.ReadOnly:= Status;
    DBEdit_Nome.ReadOnly:= Status;
    DBEdit_Telefone.ReadOnly:= Status;
    DBEdit_Endereco.ReadOnly:= Status;
    DBEdit_Horario.ReadOnly:= Status;
    DBEdit_OBS.ReadOnly:= Status;
end;

//------------------------------------------------------------------------------
// Trata dos Botoes
//------------------------------------------------------------------------------

procedure TForm_Cad_Facilidades.Botao(Status: Boolean);
begin
   ToolButton_Inserir.Enabled:= Status;
   ToolButton_Alterar.Enabled:= Status;
   ToolButton_Excluir.Enabled:= Status;
   ToolButton_Retornar.Enabled:= Status;
   ToolButton_Windows.Enabled:= Status;
   ToolButton_Ajuda.Enabled:= Status;

   if Status = False then
      Status:= True
   else
      Status:= False;

   ToolButton_Gravar.Enabled:= Status;
   ToolButton_Ignorar.Enabled:= Status;
end;

procedure TForm_Cad_Facilidades.MaskEdit_TipoChange(Sender: TObject);
begin
   Busca_Facilidade;
end;

//------------------------------------------------------------------------------
// Tratamento da query de busca de facilidade
//------------------------------------------------------------------------------

procedure TForm_Cad_Facilidades.Busca_Facilidade;
Var
   VS_Comando: String;
   VB_Where: Boolean;
begin
   VB_Where:=  False;
   VS_Comando:= 'Select * from Facilidade ';

   if trim(MaskEdit_Tipo.text) <> '' then
   begin
      VS_Comando:= VS_Comando+' Where tipo like '+#39+'%'+MaskEdit_Tipo.text+'%'+#39;
      VB_Where:= True;
   end;

   if trim(MaskEdit_Nome.text) <> '' then
   begin
      if VB_Where = False then
         VS_Comando:= VS_Comando+' Where nome like '+#39+'%'+MaskEdit_Nome.text+'%'+#39
      else
         VS_Comando:= VS_Comando+' and nome like '+#39+'%'+MaskEdit_Nome.text+'%'+#39;
      VB_Where:= True;
   end;

   if trim(MaskEdit_Telefone.text) <> '' then
   begin
      if VB_Where = False then
         VS_Comando:= VS_Comando+' Where telefone like '+#39+'%'+MaskEdit_Telefone.text+'%'+#39
      else
         VS_Comando:= VS_Comando+' and telefone like '+#39+'%'+MaskEdit_Telefone.text+'%'+#39;
      VB_Where:= True;
   end;

   if trim(MaskEdit_Func.text) <> '' then
   begin
      if VB_Where = False then
         VS_Comando:= VS_Comando+' Where Horario like '+#39+'%'+MaskEdit_Func.text+'%'+#39
      else
         VS_Comando:= VS_Comando+' and Horario like '+#39+'%'+MaskEdit_Func.text+'%'+#39
   end;

   VS_Comando:= VS_Comando+' order by '+VS_OrderBy;

   Query_Facilidade.Close;
   Query_Facilidade.SQL.Clear;
   Query_Facilidade.Sql.Add(VS_Comando);
   Query_Facilidade.Open;
end;

//------------------------------------------------------------------------------
// Tratamento da selecao do cabecalho
//------------------------------------------------------------------------------

procedure TForm_Cad_Facilidades.DBGrid_HospedeTitleClick(Column: TColumn);
begin
   if column.Title.Caption = 'TIPO' then
       VS_OrderBy:= 'tipo'
   else
      if trim(column.Title.Caption) = 'NOME' then
          VS_OrderBy:= 'nome'
      else
         if column.Title.Caption = 'TELEFONE' then
            VS_OrderBy:= 'telefone'
         else
            if column.Title.Caption = 'HORARIO FUNCIONAMENTO' then
               VS_OrderBy:= 'horario';
   Busca_Facilidade;
end;

end.
