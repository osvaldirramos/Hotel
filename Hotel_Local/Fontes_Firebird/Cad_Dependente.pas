//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Cad_Dependente.PAS                             //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de tratar do cadas- //
//                             tro dos dependentes.                           //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 06/05/2004                                     //
//                                                                            //
// ATUALIZADO                :                                                //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Cad_Dependente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, ExtCtrls, ComCtrls, Grids, DBGrids, Buttons,
  ToolWin, Rotinas;

type
  TForm_Cad_Dep_Hospede = class(TForm)
    DBGrid_Mapa: TDBGrid;
    StatusBar: TStatusBar;
    Panel1: TPanel;
    DBText1: TDBText;
    Label3: TLabel;
    ToolBar2: TToolBar;
    ToolButton_Gravar: TToolButton;
    ToolButton_Cancelar: TToolButton;
    ToolButton2: TToolButton;
    ToolButton_Retornar: TToolButton;
    procedure FormActivate(Sender: TObject);
    procedure Botao(Status: Boolean);
    procedure DBGrid_MapaCellClick(Column: TColumn);
    procedure ToolButton_GravarClick(Sender: TObject);
    procedure ToolButton_CancelarClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Cad_Dep_Hospede: TForm_Cad_Dep_Hospede;

implementation

uses Cad_Hospede, Tabela_Preco, Sel_Apto, Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_Cad_Dep_Hospede.FormActivate(Sender: TObject);
begin
   StatusBar.SimpleText:= 'Selecione a opção desejada.';
   Botao(True);
end;

//------------------------------------------------------------------------------
// Tratamento da gravacao do dependente
//------------------------------------------------------------------------------

procedure TForm_Cad_Dep_Hospede.ToolButton_GravarClick(Sender: TObject);
begin
   Form_Cad_Hospede.IBTable_Dependente.Post;
   DM.IBTransaction_Hotel.CommitRetaining;
   Form_Cad_Hospede.IBTable_Dependente.Close;
   Form_Cad_Hospede.IBTable_Dependente.Open;

   if Form_Cad_Hospede.IBTable_Dependente.FieldByName('Idade').AsString = '' then
   begin
      MessageDlg('Não foi fornecido a Idade do Dependente',mtWarning, [mbOK], 0);
      Form_Cad_Hospede.IBTable_Dependente.Edit;
      DBGrid_Mapa.SetFocus;
   end
   else
   begin
      Botao(True);
      StatusBar.SimpleText:= 'Selecione a opção desejada.';
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do cancelamento do dependente
//------------------------------------------------------------------------------

procedure TForm_Cad_Dep_Hospede.ToolButton_CancelarClick(Sender: TObject);
begin
   Form_Cad_Hospede.IBTable_Dependente.Cancel;
   DM.IBTransaction_Hotel.CommitRetaining;
   Botao(True);
   StatusBar.SimpleText:= 'Selecione a opção desejada.';
end;

//------------------------------------------------------------------------------
// Fecha a janela e retorna para janela de tratamento do cadastro do hospede
//------------------------------------------------------------------------------

procedure TForm_Cad_Dep_Hospede.ToolButton_RetornarClick(Sender: TObject);
begin
   if Form_Cad_Hospede.IBTable_Dependente.RecordCount < StrToInt(Form_Cad_Hospede.MaskEdit_Dependente.text) then
      MessageDlg('O hospede possui '+Form_Cad_Hospede.MaskEdit_Dependente.text+' dependente, para retornar é preciso cadastra-lo(s)',mtWarning, [mbOK], 0)
   else
      Close;
end;

//------------------------------------------------------------------------------
// Trata dos Botoes
//------------------------------------------------------------------------------

procedure TForm_Cad_Dep_Hospede.Botao(Status: Boolean);
begin
   ToolButton_Retornar.Enabled:= Status;

   if Status = False then
      Status:= True
   else
      Status:= False;

   ToolButton_Gravar.Enabled:= Status;
   ToolButton_Cancelar.Enabled:= Status;
end;

procedure TForm_Cad_Dep_Hospede.DBGrid_MapaCellClick(Column: TColumn);
begin
   Botao(False);
   Form_Cad_Hospede.IBTable_Dependente.Edit;
   StatusBar.SimpleText:= 'Entre com o dependente';
end;
procedure TForm_Cad_Dep_Hospede.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.
