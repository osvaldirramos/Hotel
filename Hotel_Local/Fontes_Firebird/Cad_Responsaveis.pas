//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Cad_Responsaveis.PAS                           //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade tratar do cadastro  //
//                             dos responsaveis do hotel.                     //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 03/12/2003                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Cad_Responsaveis;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, ComCtrls, Buttons, Grids, ExtCtrls,
  Mask, Rotinas, ToolWin, IBCustomDataSet, IBTable;

type
  TForm_Cad_Responsaveis = class(TForm)
    DST_Responsaveis: TDataSource;
    IBTable_Responsaveis: TIBTable;
    IBTable_ResponsaveisCODIGO: TSmallintField;
    IBTable_ResponsaveisNOME: TIBStringField;
    IBTable_ResponsaveisFUNCAO: TIBStringField;
    StatusBar: TStatusBar;
    DBGrid_Responsaveis: TDBGrid;
    ToolBar2: TToolBar;
    ToolButton9: TToolButton;
    ToolButton_Alterar: TToolButton;
    ToolButton_Gravar: TToolButton;
    ToolButton_Cancelar: TToolButton;
    ToolButton2: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    procedure FormCreate(Sender: TObject);

    procedure Atualiza;
    procedure Desabilita;
    procedure Habilita;
    procedure HabCampos;
    procedure DesabCampos;
    procedure ToolButton_AlterarClick(Sender: TObject);
    procedure ToolButton_GravarClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton_CancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form_Cad_Responsaveis: TForm_Cad_Responsaveis;

implementation

uses Module, Abertura;

{$R *.DFM}

//------------------------------------------------------------------------------
// Modulo Principal
//------------------------------------------------------------------------------

procedure TForm_Cad_Responsaveis.FormCreate(Sender: TObject);
begin
   IBTable_Responsaveis.Open;
   Atualiza;
   Habilita;
   DesabCampos;
end;

//------------------------------------------------------------------------------
// Modulo de Altera��o de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Responsaveis.ToolButton_AlterarClick(Sender: TObject);
begin
   Try
     Desabilita;
     HabCampos;
     IBTable_Responsaveis.Edit;
   Except
     MessageDlg('Erro na Altera��o.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Responsaveis.ToolButton_GravarClick(Sender: TObject);
begin
   IBTable_Responsaveis.Post;
   DM.IBTransaction_Hotel.CommitRetaining;
   Habilita;
   Atualiza;
   DesabCampos;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Responsaveis.ToolButton_CancelarClick(Sender: TObject);
begin
   Try
      IBTable_Responsaveis.Cancel;
      DM.IBTransaction_Hotel.CommitRetaining;
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

procedure TForm_Cad_Responsaveis.ToolButton_RetornarClick(Sender: TObject);
begin
   IBTable_Responsaveis.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Procedure de Redresh da Query
//------------------------------------------------------------------------------

procedure TForm_Cad_Responsaveis.Atualiza;
begin
   IBTable_Responsaveis.Active:= False;
   IBTable_Responsaveis.Active:= true;
end;

//------------------------------------------------------------------------------
// Desabilita o acesso aos campos de tratamento do Aerodromo
//------------------------------------------------------------------------------

procedure TForm_Cad_Responsaveis.DesabCampos;
begin
   DBGrid_Responsaveis.ReadOnly:= True;
end;

//------------------------------------------------------------------------------
// Habilita o acesso aos campos de tratamento do Aerodromo
//------------------------------------------------------------------------------

procedure TForm_Cad_Responsaveis.HabCampos;
begin
   DBGrid_Responsaveis.ReadOnly:= False;
end;

//------------------------------------------------------------------------------
// Habilita Botoes
//------------------------------------------------------------------------------

procedure TForm_Cad_Responsaveis.Habilita;
begin
   ToolButton_Alterar.Enabled:= True;
   ToolButton_Gravar.Enabled:= False;
   ToolButton_Cancelar.Enabled:= False;
   ToolButton_Retornar.Enabled:= True;
   ToolButton_Windows.Enabled:= True;
end;

//------------------------------------------------------------------------------
// Desabilita Botoes
//------------------------------------------------------------------------------

procedure TForm_Cad_Responsaveis.Desabilita;
begin
   ToolButton_Alterar.Enabled:= False;
   ToolButton_Gravar.Enabled:= True;
   ToolButton_Cancelar.Enabled:= True;
   ToolButton_Retornar.Enabled:= False;
   ToolButton_Windows.Enabled:= False;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Cad_Responsaveis.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

procedure TForm_Cad_Responsaveis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.
