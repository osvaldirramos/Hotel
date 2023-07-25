//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Exclui_Ficha.PAS                                //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de excluir fichas   //
//                             digitada errada.                               //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 15/06/2004                                               //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Exclui_Ficha;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, ComCtrls, Buttons, Grids, ExtCtrls,
  Mask, Rotinas, DBTables, ToolWin;

type
  TForm_Exclui_Ficha = class(TForm)
    GroupBox1: TGroupBox;
    Edit_NFicha: TEdit;
    ToolBar2: TToolBar;
    ToolButton_Alterar: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    ToolButton_Ajuda: TToolButton;
    StatusBar: TStatusBar;
    GroupBoxAno: TGroupBox;
    Edit_Ano: TEdit;
    procedure ToolButton_AlterarClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form_Exclui_Ficha: TForm_Exclui_Ficha;

implementation

uses Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Modulo de Exclusão de Dados
//------------------------------------------------------------------------------

procedure TForm_Exclui_Ficha.ToolButton_AlterarClick(Sender: TObject);
var
   VS_Comando, VS_Ficha: String;
begin
   if MessageDlg('Confirma a exclusão ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      VS_Ficha:= FormatFloat('000000', strToInt(Edit_NFicha.Text));
      VS_Comando:= 'Delete from hospedagem where ficha = '+#39+VS_Ficha+#39;
      Funcoes.ExecSql(VS_Comando);

      VS_Comando:= 'Delete from historico where ficha = '+#39+VS_Ficha+#39;
      Funcoes.ExecSql(VS_Comando);

      VS_Comando:= 'Delete from Dependente where ficha = '+#39+VS_Ficha+#39+' and Ano = '+Edit_Ano.Text;
      Funcoes.ExecSql(VS_Comando);

      Edit_NFicha.Text:= '';
   end;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_Exclui_Ficha.ToolButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Exclui_Ficha.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Modulo Principal
//------------------------------------------------------------------------------

procedure TForm_Exclui_Ficha.FormActivate(Sender: TObject);
begin
   Edit_Ano.Text:= Funcoes.AnoAtual;
end;

end.
