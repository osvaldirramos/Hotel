//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Altera_Recibo.PAS                               //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de alterar o numero //
//                             do recibo digitada errada.                        //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 08/03/2006                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Altera_Recibo;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, ComCtrls, Buttons, Grids, ExtCtrls,
  Mask, Rotinas, DBTables, ToolWin;

type
  TForm_Altera_Recibo = class(TForm)
    GroupBox1: TGroupBox;
    Edit_NRecibo: TEdit;
    StatusBar: TStatusBar;
    ToolBar2: TToolBar;
    ToolButton_Alterar: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    ToolButton_Ajuda: TToolButton;
    procedure FormActivate(Sender: TObject);
    procedure ToolButton_AlterarClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);

  private
    { private declarations }
  public    { public declarations }
   VS_Recibo_Anterior: String;
  end;

var
  Form_Altera_Recibo: TForm_Altera_Recibo;

implementation

uses Module;

{$R *.DFM}


//------------------------------------------------------------------------------
// Modulo Principal
//------------------------------------------------------------------------------

procedure TForm_Altera_Recibo.FormActivate(Sender: TObject);
var
   VS_Comando: String;
begin
   VS_Comando:= 'Select Nrecibo from recibo';

   Dm.Query_Executa.Close;
   Dm.Query_Executa.SQL.Clear;
   Dm.Query_Executa.Sql.Add(VS_Comando);
   Dm.Query_Executa.Open;

   VS_Recibo_Anterior:= Dm.Query_Executa.FieldByName('Nrecibo').AsString;
   Edit_NRecibo.Text:= FormatFloat('000000', Dm.Query_Executa.FieldByName('NRecibo').AsInteger);
end;

//------------------------------------------------------------------------------
// Modulo de Exclusão de Dados
//------------------------------------------------------------------------------

procedure TForm_Altera_Recibo.ToolButton_AlterarClick(Sender: TObject);
var
   VS_Comando, VS_Recibo: String;
begin

   if trim(Edit_NRecibo.Text) = '' then
         MessageDlg('O número do Recibo não pode ser branco.', mtInformation,[mbOk], 0)
   else
   begin
      if MessageDlg('Confirma a alteração ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
         VS_Recibo:= FormatFloat('000000', strToInt(Edit_NRecibo.Text));
         VS_Comando:= 'update recibo set nrecibo = '+#39+VS_Recibo+#39;
         Funcoes.ExecSql(VS_Comando);
      end;
   end;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_Altera_Recibo.ToolButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Altera_Recibo.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

end.
