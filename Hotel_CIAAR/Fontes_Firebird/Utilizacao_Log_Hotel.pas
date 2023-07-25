//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Utilizacao_Sistema.PAS                         //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de mostrar consulta //
//                             dos acessos realizados pela senha HOTEL.       //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 04/11/2003                                     //
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

unit Utilizacao_Log_Hotel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ComCtrls, Grids, DBGrids, Buttons, StdCtrls, Mask, ExtCtrls,
  Rotinas, DBCtrls, ToolWin, IBCustomDataSet, IBQuery, JvToolEdit;

type
  TForm_UtilizacaoDoSistema = class(TForm)
    Panel2: TPanel;
    DBGrid_Mapa: TDBGrid;
    StatusBar: TStatusBar;
    DSQ_Verifica: TDataSource;
    IBQuery_Verifica: TIBQuery;
    IBQuery_VerificaVUSUARIO: TIBStringField;
    IBQuery_VerificaVDATA: TDateTimeField;
    IBQuery_VerificaVHORAENTRADA: TIBStringField;
    IBQuery_VerificaVHORASAIDA: TIBStringField;
    ToolBar1: TToolBar;
    ComboBox_Usuario: TComboBox;
    JvDateEdit_Data: TJvDateEdit;
    ToolButton1: TToolButton;
    ToolBar4: TToolBar;
    ToolButton_Relatorio: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    DBNavigator_Residente: TDBNavigator;
    procedure FormActivate(Sender: TObject);
    procedure Busca_Utilizacao;
    procedure ToolButton_RelatorioClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ComboBox_UsuarioChange(Sender: TObject);
    procedure JvDateEdit_DataChange(Sender: TObject);
    procedure DBGrid_MapaTitleClick(Column: TColumn);
  private    { Private declarations }
     VS_OrderBy: String;
  public
    { Public declarations }
  end;

var
  Form_UtilizacaoDoSistema: TForm_UtilizacaoDoSistema;

implementation

uses Module, Rel_UtilizacaoSistema;

{$R *.DFM}

//------------------------------------------------------------------------------
// Modulo principal
//------------------------------------------------------------------------------

procedure TForm_UtilizacaoDoSistema.FormActivate(Sender: TObject);
begin
   // Alimenta o comboBox de usuario

   Funcoes.QueryExecuta('Select Usuario from usuario order by usuario' );

   ComboBox_Usuario.Items.Clear;
   ComboBox_Usuario.Items.Add(' ');
   DM.IBQuery_Executa.First;
   While not DM.IBQuery_Executa.eof do
   begin
      ComboBox_Usuario.Items.Add(DM.IBQuery_Executa.FieldByName('Usuario').AsString);
      DM.IBQuery_Executa.Next;
   end;

   // Tratamento para setar o acesso do usuario

   VS_OrderBy:= 'VData';

   Busca_Utilizacao;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_UtilizacaoDoSistema.ToolButton_RetornarClick(Sender: TObject);
begin
   IBQuery_Verifica.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_UtilizacaoDoSistema.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Mostra a utlizacao do sistema no periodo selecionado
//------------------------------------------------------------------------------

procedure TForm_UtilizacaoDoSistema.Busca_Utilizacao;
var
   VS_Data, VS_Comando: String;
   VB_Where: Boolean;
begin
   VB_Where:= False;
   VS_Comando:= 'Select * from Verifica ';

   if trim(ComboBox_Usuario.Text) <> '' then
   begin
      VS_Comando:= VS_Comando+' Where VUsuario = '+#39+trim(ComboBox_Usuario.Text)+#39;
      VB_Where:= true;
   end;

   if JvDateEdit_Data.Text <> '  /  /    ' then
   begin
      VS_Data:= Funcoes.DePara(JvDateEdit_Data.Text, '/', '.');
      VS_Data:= VS_Data+' 00:00';
      if VB_Where = False then
         VS_Comando:= VS_Comando+' Where VData = '+#39+VS_Data+#39
      else
         VS_Comando:= VS_Comando+' and VData = '+#39+VS_Data+#39;
   end;
   VS_Comando:= VS_Comando+' order by '+VS_OrderBy;

   IBQuery_Verifica.Close;
   IBQuery_Verifica.SQL.Clear;
   IBQuery_Verifica.SQL.ADD(VS_Comando);
   IBQuery_Verifica.Open;
end;

//------------------------------------------------------------------------------
// chamada para relatorio
//------------------------------------------------------------------------------

procedure TForm_UtilizacaoDoSistema.ToolButton_RelatorioClick(Sender: TObject);
begin
   Form_Rel_UtilizacaoSistema.Preview;
end;

procedure TForm_UtilizacaoDoSistema.ComboBox_UsuarioChange(Sender: TObject);
begin
   Busca_Utilizacao;
end;

procedure TForm_UtilizacaoDoSistema.JvDateEdit_DataChange(Sender: TObject);
begin
   Busca_Utilizacao;
end;

//------------------------------------------------------------------------------
// Procedure para tratar do order by
//------------------------------------------------------------------------------

procedure TForm_UtilizacaoDoSistema.DBGrid_MapaTitleClick(Column: TColumn);
begin
   if column.Title.Caption = 'Usuário' then
       VS_OrderBy:= 'VUsuario,VData, VHoraEntrada'
   else
      if column.Title.Caption = 'Data' then
         VS_OrderBy:= 'VData, VHoraEntrada'
      else
        if trim(column.Title.Caption) = 'Hora Entrada' then
           VS_OrderBy:= 'VHoraEntrada'
        else
           if trim(column.Title.Caption) = 'Hora Saída' then
               VS_OrderBy:= 'VHoraSaida';
   Busca_Utilizacao;
end;

end.
