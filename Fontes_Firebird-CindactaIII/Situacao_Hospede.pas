//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Abertura.PAS                                   //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade montar a Tela de    //
//                             tratamento para hospede indesejaveis.          //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 19/02/2004                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Situacao_Hospede;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, ComCtrls, Grids, DBGrids, ExtCtrls, DBCtrls,
  Buttons, Rotinas, Mask, IBTable, IBCustomDataSet, IBQuery, ToolWin;

type
  TForm_Situacao_Hospede = class(TForm)
    Panel2: TPanel;
    DBGrid_Hospede: TDBGrid;
    GroupBox1: TGroupBox;
    StatusBar: TStatusBar;
    DSQ_Sel_Hospede: TDataSource;
    Edit_Sel_Nome: TEdit;
    IBQuery_Sel_Hospede: TIBQuery;
    IBTable_Hospede: TIBTable;
    Panel_Botoes: TPanel;
    DBNavigator_Decea: TDBNavigator;
    ToolBar4: TToolBar;
    ToolButton_Inserir: TToolButton;
    ToolButton_Limpar: TToolButton;
    ToolButton_Gravar: TToolButton;
    ToolButton_Ignorar: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    GroupBox2: TGroupBox;
    DBMemo_Obs: TDBEdit;
    procedure Edit_Sel_NomeChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    Procedure Botoes(Status: Boolean);
    procedure ToolButton_InserirClick(Sender: TObject);
    procedure ToolButton_LimparClick(Sender: TObject);
    procedure ToolButton_IgnorarClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton_GravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Situacao_Hospede: TForm_Situacao_Hospede;

implementation

uses Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure principal
//------------------------------------------------------------------------------

procedure TForm_Situacao_Hospede.FormActivate(Sender: TObject);
begin
   IBQuery_Sel_Hospede.Open;
   IBTable_hospede.OPen;
   Botoes(True);
   StatusBar.SimpleText:= 'Selecione o hóspede e a opção desejada';
end;

//------------------------------------------------------------------------------
// Selecao do hospede atraves do fornecimento do nome
//------------------------------------------------------------------------------

procedure TForm_Situacao_Hospede.Edit_Sel_NomeChange(Sender: TObject);
var
   VS_Comando: String;
begin
   VS_Comando:= 'Select Identidade, nome, Nome_Guerra from hospede where nome like '+
                 #39+Edit_Sel_Nome.Text+'%'+#39+' Order by Nome';
   IBQuery_Sel_Hospede.Close;
   IBQuery_Sel_Hospede.Sql.Clear;
   IBQuery_Sel_Hospede.Sql.Add(VS_Comando);
   IBQuery_Sel_Hospede.Open;
end;

//------------------------------------------------------------------------------
// Habilita o hospede como indesejavel
//------------------------------------------------------------------------------

procedure TForm_Situacao_Hospede.ToolButton_InserirClick(Sender: TObject);
begin
   Try
     Botoes(False);
     IBTable_Hospede.Edit;
     IBTable_Hospede.FieldByName('Situacao').AsString:= 'I';
     StatusBar.SimpleText:= 'Forneça a observação da restrição ao hóspede';
     DBMemo_Obs.SetFocus;
   Except
     MessageDlg('Erro na inserção.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Desabilita o hospede como indesejavel
//------------------------------------------------------------------------------

procedure TForm_Situacao_Hospede.ToolButton_LimparClick(Sender: TObject);
begin
   Try
     Botoes(False);
     IBTable_Hospede.Edit;
     IBTable_Hospede.FieldByName('Situacao').AsString:= 'D';
     IBTable_Hospede.FieldByName('Obs').AsString:= '';
     IBTable_Hospede.Post;
     DM.IBTransaction_Hotel.CommitRetaining;
     Botoes(True);
   Except
     MessageDlg('Erro na inserção.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Grava a habilitacao do hospede como indesejavel
//------------------------------------------------------------------------------

procedure TForm_Situacao_Hospede.ToolButton_GravarClick(Sender: TObject);
begin
   Try
     Botoes(True);
     IBTable_Hospede.Post;
     DM.IBTransaction_Hotel.CommitRetaining;
     StatusBar.SimpleText:= 'Selecione o hóspede e a opção desejada';
   Except
     MessageDlg('Erro na inserção.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Cancela a habilitacao do hospede como indesejavel
//------------------------------------------------------------------------------

procedure TForm_Situacao_Hospede.ToolButton_IgnorarClick(Sender: TObject);
begin
   Try
     Botoes(True);
     IBTable_Hospede.Cancel;
     DM.IBTransaction_Hotel.CommitRetaining;
     StatusBar.SimpleText:= 'Selecione o hóspede e a opção desejada';
   Except
     MessageDlg('Erro na inserção.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_Situacao_Hospede.ToolButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Situacao_Hospede.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Tratamento dos botoes
//------------------------------------------------------------------------------

procedure TForm_Situacao_Hospede.Botoes(Status: Boolean);
begin
   DBNavigator_Decea.Enabled:= Status;
   DBGrid_Hospede.Enabled:= Status;
   ToolButton_Inserir.Enabled:= Status;
   ToolButton_Limpar.Enabled:= Status;
   ToolButton_Retornar.Enabled:= Status;

   if Status = True then
     Status:= False
   else
      Status:= True;

   DBMemo_Obs.Enabled:= Status;
   ToolButton_Ignorar.Enabled:= Status;
   ToolButton_Gravar.Enabled:= Status;
end;

end.
