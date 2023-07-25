//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Cad_Usuario.PAS                                //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade tratar do cadastro  //
//                             dos usuarios do hotel.                         //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      :                                                //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Cad_Usuario;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, ComCtrls, Buttons, Grids, ExtCtrls,
  Mask, Rotinas, DBTables, ToolWin;

type
  TForm_Cad_Usuario = class(TForm)
    Panel1: TPanel;
    StatusBar: TStatusBar;
    Label_Privilegio: TLabel;
    Label_Senha: TLabel;
    Label_Nome: TLabel;
    DBEdit_Senha: TDBEdit;
    DBComboBox_Privilegio: TDBComboBox;
    DBEdit_Usuario: TDBEdit;
    Label1: TLabel;
    Table_Usuario: TTable;
    Table_UsuarioUSUARIO: TStringField;
    Table_UsuarioSENHA: TStringField;
    Table_UsuarioPRIVILEGIO: TStringField;
    DS_Usuario: TDataSource;
    DBGrid_Usuario: TDBGrid;
    Panel2: TPanel;
    DBNavigator_Usuario: TDBNavigator;
    ToolBar4: TToolBar;
    ToolButton_Inserir: TToolButton;
    ToolButton_Alterar: TToolButton;
    ToolButton_Excluir: TToolButton;
    ToolButton_Gravar: TToolButton;
    ToolButton_Ignorar: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
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
    procedure ToolButton_IgnorarClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
  private    { private declarations }
    VS_Opcao: String;
  public
    { public declarations }
  end;

var
  Form_Cad_Usuario: TForm_Cad_Usuario;

implementation

uses Module, Abertura;

{$R *.DFM}

//------------------------------------------------------------------------------
// Modulo Principal
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario.FormCreate(Sender: TObject);
begin
   Table_Usuario.Open;
   Atualiza;
   Habilita;
   DesabCampos;
end;

//------------------------------------------------------------------------------
// Modulo de Inserção de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario.ToolButton_InserirClick(Sender: TObject);
begin
   Try
     VS_opcao:= 'Inserção ';
     Desabilita;
     HabCampos;
     Table_Usuario.Append;
     DBEdit_Usuario.Text:= '';
     DBEdit_Senha.Text:= '';
     Table_Usuario.FieldByName('Usuario').AsString:= '';
     Table_Usuario.FieldByName('Senha').AsString:= '';
     Table_Usuario.FieldByName('Privilegio').AsString:= '';

     StatusBar.SimpleText:= 'Forneça os Dados do Usuário';
     DBEdit_Usuario.SetFocus;
   Except
     MessageDlg('Erro na inserção.', mtInformation,[mbOk], 0);
   end;

end;

//------------------------------------------------------------------------------
// Modulo de Alteração de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario.ToolButton_AlterarClick(Sender: TObject);
begin
   Try
     VS_opcao:= 'Alteração ';
     Desabilita;
     HabCampos;
     Table_Usuario.Edit;
     DBEdit_Usuario.SetFocus;
   Except
     MessageDlg('Erro na Alteração.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Exclusão de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario.ToolButton_ExcluirClick(Sender: TObject);
begin
   Desabilita;
   ToolButton_Gravar.Enabled:= False;
   ToolButton_Ignorar.Enabled:= False;
   if MessageDlg('Confirma a exclusão ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Funcoes.Log_Recepcao('Exclusão do Usuario  '+Table_Usuario.FieldByName('Usuario').AsString);
      Table_Usuario.Delete;
      Atualiza;
   end;
   Habilita;
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario.ToolButton_GravarClick(Sender: TObject);
begin
  Funcoes.Log_Recepcao(VS_opcao+' do Usuario  '+Table_Usuario.FieldByName('Usuario').AsString);
   Table_Usuario.Post;
   Habilita;
   Atualiza;
   DesabCampos;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario.ToolButton_IgnorarClick(Sender: TObject);
begin
   Try
      Table_Usuario.Cancel;
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

procedure TForm_Cad_Usuario.ToolButton_RetornarClick(Sender: TObject);
begin
   Table_Usuario.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Procedure de Redresh da Query
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario.Atualiza;
begin
   Table_Usuario.Active:= False;
   Table_Usuario.Active:= true;
end;

//------------------------------------------------------------------------------
// Desabilita o acesso aos campos de tratamento do Aerodromo
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario.DesabCampos;
begin
   DBEdit_Usuario.ReadOnly:= True;
   DBEdit_Senha.ReadOnly:= True;
   DBComboBox_Privilegio.ReadOnly:= True;
end;

//------------------------------------------------------------------------------
// Habilita o acesso aos campos de tratamento do Aerodromo
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario.HabCampos;
begin
   DBEdit_Usuario.ReadOnly:= False;
   DBEdit_Senha.ReadOnly:= False;
   DBComboBox_Privilegio.ReadOnly:= False;
end;

//------------------------------------------------------------------------------
// Habilita Botoes
//------------------------------------------------------------------------------

procedure TForm_Cad_Usuario.Habilita;
begin
   DBNavigator_Usuario.Enabled:= True;
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

procedure TForm_Cad_Usuario.Desabilita;
begin
   DBNavigator_Usuario.Enabled:= False;
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

procedure TForm_Cad_Usuario.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

end.
