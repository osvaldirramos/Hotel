unit Cad_Tab_Residente;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DBGrids, Buttons, Grids, ExtCtrls,
  ComCtrls, Rotinas, Mask, IBCustomDataSet, IBTable, IBQuery, ToolWin, DB;

Const
   ASPAS= '''';

type
  TForm_Tab_Residente = class(TForm)
    Panel2: TPanel;
    DST_Tab_Residente: TDataSource;
    DBGrid_Tab: TDBGrid;
    DSQ_Posto_Graduacao: TDataSource;
    IBQuery_Posto_Graduacao: TIBQuery;
    IBTable_Tab_Residente: TIBTable;
    IBTable_Tab_ResidentePOSTO: TIBStringField;
    IBTable_Tab_ResidenteVALOR: TIBBCDField;
    IBQuery_Posto_GraduacaoPOSTO: TIBStringField;
    GroupBox_Preco: TGroupBox;
    Label_Apto: TLabel;
    Label_Ramal: TLabel;
    DBEdit_Valor: TDBEdit;
    DBLookupComboBox_Posto: TDBLookupComboBox;
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
    StatusBar: TStatusBar;
    IBTable_Tab_ResidenteN_DEPENDENTE: TSmallintField;
    _Patente: TToolBar;
    ToolButton_Patentes: TToolButton;
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
    procedure _PatenteClick(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form_Tab_Residente: TForm_Tab_Residente;

implementation

uses Module, Divisas;

{$R *.DFM}

//------------------------------------------------------------------------------
// Modulo Principal
//------------------------------------------------------------------------------

procedure TForm_Tab_Residente.FormCreate(Sender: TObject);
begin
   IBQuery_Posto_Graduacao.Open;
   IBTable_Tab_Residente.Open;
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

     IBTable_Tab_Residente.Append;
     IBTable_Tab_Residente.FieldByName('N_Dependente').AsInteger:= 0;
     StatusBar.SimpleText:= 'Forneça os Dados da Tabela de Preço';
     DBLookupComboBox_Posto.SetFocus;
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
   IBTable_Tab_Residente.Edit;
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
      IBTable_Tab_Residente.Delete;
      DM.IBTransaction_Hotel.CommitRetaining;
      Atualiza;
   end;
   Botao(True);
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_Tab_Residente.ToolButton_GravarClick(Sender: TObject);
begin
   IBTable_Tab_Residente.Post;
   DM.IBTransaction_Hotel.CommitRetaining;
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
      IBTable_Tab_Residente.Cancel;
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

procedure TForm_Tab_Residente.ToolButton_RetornarClick(Sender: TObject);
begin
   IBQuery_Posto_Graduacao.Close;
   IBTable_Tab_Residente.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Procedure de Redresh da Query
//------------------------------------------------------------------------------

procedure TForm_Tab_Residente.Atualiza;
begin
   IBTable_Tab_Residente.Active:= False;
   IBTable_Tab_Residente.Active:= true;
end;

//------------------------------------------------------------------------------
// Habilita o acesso aos campos de tratamento do Apto
//------------------------------------------------------------------------------

procedure TForm_Tab_Residente.Habilita_Campos(Status: Boolean);
begin
   if Status = True then
   begin
      DBLookupComboBox_Posto.Enabled:= True;
      DBEdit_Valor.Enabled:= True;
   end
   else
   begin
      DBLookupComboBox_Posto.Enabled:= False;
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
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Tab_Residente.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Mostra as patentes existentes
//------------------------------------------------------------------------------

procedure TForm_Tab_Residente._PatenteClick(Sender: TObject);
begin
   Form_Divisas.ShowModal;
end;

end.
