//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Sel_Hospede.PAS                                //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade permitir a selecao  //
//                             de um determinado hospede.                     //
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

unit Sel_Hospede;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Rotinas,
  StdCtrls, Db, Grids, DBGrids, ComCtrls, Buttons, ExtCtrls,
  ToolWin, IBCustomDataSet, IBQuery;

type
  TForm_Sel_Hospede = class(TForm)
    StatusBar: TStatusBar;
    DBGrid_Mapa: TDBGrid;
    DSQ_sel_Hospede: TDataSource;
    IBQuery_Sel_Hospede: TIBQuery;
    ToolBar1: TToolBar;
    Edit_Posto: TEdit;
    Edit_Identidade: TEdit;
    ToolBar3: TToolBar;
    ToolButton_Retornar: TToolButton;
    ToolButton_Cancelar: TToolButton;
    Edit_Nome: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure Edit_IdentidadeChange(Sender: TObject);
    procedure Executa_Query;
    procedure DBGrid_MapaDblClick(Sender: TObject);
    procedure Edit_IdentidadeKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid_MapaTitleClick(Column: TColumn);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_CancelarClick(Sender: TObject);
  private
    { Private declarations }
  public    { Public declarations }
      VS_Comando, VS_OrderBy, VS_Identidade: String;
  end;

var
  Form_Sel_Hospede: TForm_Sel_Hospede;

implementation

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_Sel_Hospede.FormActivate(Sender: TObject);
begin
   VS_OrderBy:= 'Nome';
   VS_Comando:= 'Select Identidade, nome, posto from hospede order by ';
   Executa_Query;
   VS_Identidade:= '';
end;

//------------------------------------------------------------------------------
// Procedure para buscar o hospede pela Identidade
//------------------------------------------------------------------------------

procedure TForm_Sel_Hospede.Edit_IdentidadeChange(Sender: TObject);
begin
   Executa_Query;
end;

//------------------------------------------------------------------------------
// Procedure para buscar o hospede pelo nome
//------------------------------------------------------------------------------

procedure TForm_Sel_Hospede.Executa_Query;
var
   VS_Comando: String;
   VB_Where: Boolean;
begin
   VB_Where:= False;
   VS_Comando:= 'Select Identidade, nome, posto from hospede ';

   if Trim(Edit_Identidade.Text) <> '' then
   begin
      VS_Comando:= VS_Comando+' where identidade like '+#39+Funcoes.NIdentidade(Edit_Identidade.Text)+'%'+#39;
      VB_Where:= True;
   end;

   if Trim(Edit_Posto.Text) <> '' then
   begin
      if VB_Where = False then
      begin
         VS_Comando:= VS_Comando+' where posto like '+#39+Edit_Posto.Text+'%'+#39;
         VB_Where:= True;
      end
      else
         VS_Comando:= VS_Comando+' and posto like '+#39+Edit_Posto.Text+'%'+#39
   end;

   if Trim(Edit_Nome.Text) <> '' then
   begin
      if VB_Where = False then
         VS_Comando:= VS_Comando+' where nome like '+#39+Edit_Nome.Text+'%'+#39
      else
         VS_Comando:= VS_Comando+' and nome like '+#39+Edit_Nome.Text+'%'+#39
   end;

   IBQuery_Sel_Hospede.Close;
   IBQuery_Sel_Hospede.Sql.Clear;
   IBQuery_Sel_Hospede.Sql.Add(VS_Comando+'order by '+VS_OrderBy);
   IBQuery_Sel_Hospede.Open;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Cancelar
//------------------------------------------------------------------------------

procedure TForm_Sel_Hospede.ToolButton_CancelarClick(Sender: TObject);
begin
   Funcoes.SetIdentidade ('');
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Retornar
//------------------------------------------------------------------------------

procedure TForm_Sel_Hospede.ToolButton_RetornarClick(Sender: TObject);
begin
   if IBQuery_Sel_Hospede.RecordCount > 0 then
   begin
      Funcoes.SetIdentidade (IBQuery_Sel_Hospede.FieldByName('Identidade').AsString);
   end
   else
   begin
      if Trim(Edit_Identidade.Text) = '' then
      begin
         Funcoes.SetIdentidade ('');
      end
      else
      begin
         Funcoes.SetIdentidade (Edit_Identidade.Text);
      end;
   end;

   Close;
end;

//----------------------------------------------------------------------------//
// Traramento do click duplo no mapa
//----------------------------------------------------------------------------//

procedure TForm_Sel_Hospede.DBGrid_MapaDblClick(Sender: TObject);
begin
   ToolButton_RetornarClick(Sender);
end;

//----------------------------------------------------------------------------//
// Tratamento p/ verificar se foi pressionado somente numero na selecao da identidade
//----------------------------------------------------------------------------//

procedure TForm_Sel_Hospede.Edit_IdentidadeKeyPress(Sender: TObject;var Key: Char);
begin
   if not (Key in['0'..'9',Chr(8)]) then Key:= #0;
end;

procedure TForm_Sel_Hospede.DBGrid_MapaTitleClick(Column: TColumn);
begin
   if column.Title.Caption = 'IDENTIDADE' then
   begin
       VS_OrderBy:= 'Identidade';
   end
   else
   begin
      if trim(column.Title.Caption) = 'POSTO' then
      begin
          VS_OrderBy:= 'Posto';
      end
      else
      begin
         if column.Title.Caption = 'NOME' then
         begin
            VS_OrderBy:= 'Nome';
         end;
      end;
   end;
   Executa_Query
end;

end.
