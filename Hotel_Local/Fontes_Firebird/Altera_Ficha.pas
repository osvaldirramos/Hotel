//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Altera_Ficha.PAS                               //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de alterar o numero //
//                             fichas digitada errada.                        //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 21/02/2005                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Altera_Ficha;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs, ComCtrls,
  ToolWin, StdCtrls, ExtCtrls, Forms, DBCtrls, DB, DBGrids, Buttons,
  Grids, Mask, Rotinas;

type
  TForm_Altera_Ficha = class(TForm)
    ToolBar2: TToolBar;
    ToolButton_Alterar: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    ToolButton_Ajuda: TToolButton;
    GroupBox1: TGroupBox;
    Edit_NFicha: TEdit;
    StatusBar: TStatusBar;
    procedure FormActivate(Sender: TObject);
    procedure ToolButton_AlterarClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);

  private
    { private declarations }
  public    { public declarations }
   VS_Ficha_Anterior: String;
  end;

var
  Form_Altera_Ficha: TForm_Altera_Ficha;

implementation

uses Module;

{$R *.DFM}


//------------------------------------------------------------------------------
// Modulo Principal
//------------------------------------------------------------------------------

procedure TForm_Altera_Ficha.FormActivate(Sender: TObject);
var
   VS_Comando: String;
begin
   VS_Comando:= 'Select ficha from ficha';
   Funcoes.QueryExecuta(VS_Comando);
   VS_Ficha_Anterior:= DM.IBQuery_Executa.FieldByName('Ficha').AsString;
   Edit_NFicha.Text:= FormatFloat('000000', StrToInt(Trim(DM.IBQuery_Executa.FieldByName('Ficha').AsString)));
end;

//------------------------------------------------------------------------------
// Modulo de Exclus�o de Dados
//------------------------------------------------------------------------------

procedure TForm_Altera_Ficha.ToolButton_AlterarClick(Sender: TObject);
var
   VS_Comando, VS_Ficha: String;
begin

   if trim(Edit_NFicha.Text) = '' then
         MessageDlg('O n�mero da Ficha n�o pode ser branco.', mtInformation,[mbOk], 0)
   else
   begin
      if MessageDlg('Confirma a altera��o ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
         VS_Ficha:= FormatFloat('000000', strToInt(Edit_NFicha.Text));
         VS_Comando:= 'update ficha set ficha = '+#39+VS_Ficha+#39;
         Funcoes.ExecSql_Servidor(VS_Comando);
      end;
   end;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_Altera_Ficha.ToolButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Altera_Ficha.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

end.
