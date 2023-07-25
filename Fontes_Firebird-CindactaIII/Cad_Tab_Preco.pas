unit Cad_Tab_Preco;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, Buttons, Grids, ExtCtrls,
  ComCtrls, Rotinas, Mask, IBCustomDataSet, IBTable, ToolWin;

Const
   ASPAS= '''';

type
  TForm_Tab_Preco = class(TForm)
    Panel2: TPanel;
    DS_Tab_Preco: TDataSource;
    DBGrid_Tab: TDBGrid;
    IBTable_Tab_Preco: TIBTable;
    IBTable_Tab_PrecoPREDIO: TIBStringField;
    IBTable_Tab_PrecoCODIGO: TIBStringField;
    IBTable_Tab_PrecoPOSTO: TIBStringField;
    IBTable_Tab_PrecoVALOR: TIBBCDField;
    GroupBox_Preco: TGroupBox;
    Label_Predio: TLabel;
    Label_Apto: TLabel;
    Label_Ramal: TLabel;
    Label1: TLabel;
    DBEdit_Posto_Graduacao: TDBEdit;
    ComboBox_Predio: TComboBox;
    DBEdit_Valor: TDBEdit;
    DBEdit_Codigo: TDBEdit;
    Panel3: TPanel;
    DBNavigator_Apartamento: TDBNavigator;
    ToolBar4: TToolBar;
    ToolButton_Inserir: TToolButton;
    ToolButton_Alterar: TToolButton;
    ToolButton_Excluir: TToolButton;
    ToolButton_Gravar: TToolButton;
    ToolButton_Ignorar: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    StatusBar: TStatusBar;
    _Patente: TToolBar;
    ToolButton_Patentes: TToolButton;
    procedure FormCreate(Sender: TObject);

    procedure Atualiza;
    procedure Botao(Status: Boolean);
    procedure Habilita_Campos(Status: Boolean);
    procedure ComboBox_PredioChange(Sender: TObject);
    procedure ToolButton_InserirClick(Sender: TObject);
    procedure ToolButton_AlterarClick(Sender: TObject);
    procedure ToolButton_ExcluirClick(Sender: TObject);
    procedure ToolButton_GravarClick(Sender: TObject);
    procedure ToolButton_IgnorarClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton_PatentesClick(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form_Tab_Preco: TForm_Tab_Preco;

implementation

uses Abertura, Divisas, Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Modulo Principal
//------------------------------------------------------------------------------

procedure TForm_Tab_Preco.FormCreate(Sender: TObject);
begin
   Funcoes.AlimentaComboBox(ComboBox_Predio, 0, '1');
   IBTable_Tab_Preco.Open;
   IBTable_Tab_Preco.Filtered:= FALSE;
   IBTable_Tab_Preco.Filter:= 'PREDIO = '+Aspas+ComboBox_Predio.Text+Aspas;
   IBTable_Tab_Preco.Filtered:= TRUE;
   Atualiza;
   Botao(True);
   Habilita_Campos(False);
end;

//------------------------------------------------------------------------------
// Modulo de Inserção de Dados
//------------------------------------------------------------------------------

procedure TForm_Tab_Preco.ToolButton_InserirClick(Sender: TObject);
begin
   Try
     Botao(False);
     Habilita_Campos(True);

     IBTable_Tab_Preco.Append;
     IBTable_Tab_Preco.FieldByName('PREDIO').AsString:= ComboBox_Predio.Text;
     StatusBar.SimpleText:= 'Forneça os Dados da Tabela de Preço';
     DBEdit_Codigo.SetFocus;
   Except
     MessageDlg('Erro na inserção.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Alteração de Dados
//------------------------------------------------------------------------------

procedure TForm_Tab_Preco.ToolButton_AlterarClick(Sender: TObject);
begin
   Try
     Botao(False);
     Habilita_Campos(True);
     IBTable_Tab_Preco.Edit;
     DBEdit_Codigo.SetFocus;
   Except
     MessageDlg('Erro na Alteração.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Exclusão de Dados
//------------------------------------------------------------------------------

procedure TForm_Tab_Preco.ToolButton_ExcluirClick(Sender: TObject);
begin
   Botao(False);
   ToolButton_Gravar.Enabled:= False;
   ToolButton_Ignorar.Enabled:= False;
   if MessageDlg('Confirma a exclusão ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      IBTable_Tab_Preco.Delete;
      DM.IBTransaction_Hotel.CommitRetaining;
      Atualiza;
   end;
   Botao(True);
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_Tab_Preco.ToolButton_GravarClick(Sender: TObject);
begin
   IBTable_Tab_Preco.Post;
   DM.IBTransaction_Hotel.CommitRetaining;
   Botao(True);
   Habilita_Campos(False);
   Atualiza;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_Tab_Preco.ToolButton_IgnorarClick(Sender: TObject);
begin
   Try
      IBTable_Tab_Preco.Cancel;
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

procedure TForm_Tab_Preco.ToolButton_RetornarClick(Sender: TObject);
begin
   IBTable_Tab_Preco.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Procedure de Redresh da Query
//------------------------------------------------------------------------------

procedure TForm_Tab_Preco.Atualiza;
begin
   IBTable_Tab_Preco.Active:= False;
   IBTable_Tab_Preco.Active:= true;
end;

//------------------------------------------------------------------------------
// Habilita o acesso aos campos de tratamento do Apto
//------------------------------------------------------------------------------

procedure TForm_Tab_Preco.Habilita_Campos(Status: Boolean);
begin
   if Status = True then
   begin
      ComboBox_Predio.Enabled:= False;
      DBEdit_Codigo.ReadOnly:= False;
      DBEdit_Posto_Graduacao.ReadOnly:= False;
      DBEdit_Valor.ReadOnly:= False;
   end
   else
   begin
      ComboBox_Predio.Enabled:= True;
      DBEdit_Codigo.ReadOnly:= True;
      DBEdit_Posto_Graduacao.ReadOnly:= True;
      DBEdit_Valor.ReadOnly:= True;
   end;
end;


//------------------------------------------------------------------------------
// Desabilita Botoes
//------------------------------------------------------------------------------

procedure TForm_Tab_Preco.Botao(Status: Boolean);
begin
   DBNavigator_Apartamento.Enabled:= Status;
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
// Seleção do Predio
//------------------------------------------------------------------------------

procedure TForm_Tab_Preco.ComboBox_PredioChange(Sender: TObject);
begin
   IBTable_Tab_Preco.Filtered:= FALSE;
   IBTable_Tab_Preco.Filter:= 'PREDIO = '+ASPAS+ComboBox_Predio.Text+ASPAS;
   IBTable_Tab_Preco.Filtered:= TRUE;
end;

//------------------------------------------------------------------------------
// Mostra as patentes existentes
//------------------------------------------------------------------------------

procedure TForm_Tab_Preco.ToolButton_PatentesClick(Sender: TObject);
begin
   Form_Divisas.ShowModal;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Tab_Preco.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

end.
