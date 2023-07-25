//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Fecha_Ocupacao.PAS                             //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de desocupar apto   //
//                             que esta na situacao de NAO DESOCUPAR          //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 20/08/1999                                     //
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

unit Fecha_Ocupacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, StdCtrls, Buttons, DBCtrls, ExtCtrls,
  ComCtrls, Rotinas, Mask, ToolWin, IBCustomDataSet, IBTable, IBQuery;

type
  TForm_Desocupacao = class(TForm)
    Panel1: TPanel;
    Label_Fecha_ocupacao: TLabel;
    Panel3: TPanel;
    DBGrid_Hospede: TDBGrid;
    DSQ_Apto_Ocupado: TDataSource;
    StatusBar: TStatusBar;
    DST_Hospede: TDataSource;
    Panel_Nome: TPanel;
    DataSource1: TDataSource;
    DBText1: TDBText;
    DBText2: TDBText;
    Panel2: TPanel;
    ToolBar4: TToolBar;
    ToolButton_Retornar: TToolButton;
    ToolButton_Desocupar: TToolButton;
    ToolButton_Windows: TToolButton;
    DBNavigator_Hospede: TDBNavigator;
    IBQuery_Apto_Ocupado: TIBQuery;
    IBTable_Hospede: TIBTable;
    IBQuery_Apto_OcupadoPREDIO: TIBStringField;
    IBQuery_Apto_OcupadoAPTO: TSmallintField;
    IBQuery_Apto_OcupadoCAMA: TSmallintField;
    IBQuery_Apto_OcupadoAPTCODIGO: TIBStringField;
    IBQuery_Apto_OcupadoNOME: TIBStringField;
    IBTable_HospedeIDENTIDADE: TIBStringField;
    IBTable_HospedeNOME_GUERRA: TIBStringField;
    IBTable_HospedePOSTO: TIBStringField;
    IBTable_Apto_Ocupado: TIBTable;
    procedure FormActivate(Sender: TObject);
    procedure ToolButton_DesocuparClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Desocupacao: TForm_Desocupacao;

implementation

uses Abertura, Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Modulo principal
//------------------------------------------------------------------------------

procedure TForm_Desocupacao.FormActivate(Sender: TObject);
begin
   IBQuery_Apto_Ocupado.open;
   IBQuery_Apto_Ocupado.Close;
   IBQuery_Apto_Ocupado.open;
   IBTable_Apto_Ocupado.Open;
   IBTable_Hospede.Open;

   if IBQuery_Apto_Ocupado.RecordCount = 0 then
      ToolButton_Desocupar.Enabled:= False
   else
      ToolButton_Desocupar.Enabled:= True;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_Desocupacao.ToolButton_RetornarClick(Sender: TObject);
begin
   IBQuery_Apto_Ocupado.Close;
   IBTable_Apto_Ocupado.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Desocupacao.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da descupacao
//------------------------------------------------------------------------------

procedure TForm_Desocupacao.ToolButton_DesocuparClick(Sender: TObject);
begin
   IBTable_Apto_Ocupado.Edit;
   IBTable_Apto_Ocupado.FieldByName('AptCodigo').AsString:= 'DESOCUPADO';;
   IBTable_Apto_Ocupado.Post;
   DM.IBTransaction_Hotel.CommitRetaining;

   IBQuery_Apto_Ocupado.Close;
   IBQuery_Apto_Ocupado.Open;

   if IBQuery_Apto_Ocupado.RecordCount = 0 then
      ToolButton_Desocupar.Enabled:= False
   else
      ToolButton_Desocupar.Enabled:= True;
end;

end.
