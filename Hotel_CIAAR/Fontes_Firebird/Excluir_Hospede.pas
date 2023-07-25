//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Excluir_Hospede.PAS                            //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de Cancelar uma hos-//
//                             pedagem.                                       //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 11/08/1999                                     //
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

unit Excluir_Hospede;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Rotinas, Dialogs,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, Mask, Buttons, ExtCtrls, ComCtrls, Grids, ToolWin, IBCustomDataSet, IBTable, IBQuery;

type
  TForm_Excluir_Hospede = class(TForm)
    GroupBox_Busca_Por_Nome: TGroupBox;
    MaskEdit_Busca_Nome: TMaskEdit;
    Panel3: TPanel;
    DBGrid_Hospede: TDBGrid;
    StatusBar: TStatusBar;
    DSQ_Busca_Hospede: TDataSource;
    GroupBox1: TGroupBox;
    MaskEdit_Observacao: TMaskEdit;
    Panel1: TPanel;
    Label_Ficha_Hospede: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    DST_Historico: TDataSource;
    DateTimePicker_Data_Saida: TDateTimePicker;
    DST_Apto: TDataSource;
    DST_Exclui_Hospede: TDataSource;
    DST_Exclui_Dependente: TDataSource;
    Panel2: TPanel;
    DBNavigator_Hospede: TDBNavigator;
    ToolBar4: TToolBar;
    ToolButton_Excluir: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    IBQuery_Busca_Hospede: TIBQuery;
    IBQuery_Busca_HospedeIDENTIDADE: TIBStringField;
    IBQuery_Busca_HospedeNOME: TIBStringField;
    IBQuery_Busca_HospedePOSTO: TIBStringField;
    IBQuery_Busca_HospedeANO: TSmallintField;
    IBTable_Exclui_Hospede: TIBTable;
    IBTable_Exclui_HospedeIDENTIDADE: TIBStringField;
    IBTable_Exclui_HospedeFICHA: TIBStringField;
    IBTable_Exclui_HospedeANO: TSmallintField;
    IBTable_Exclui_HospedePREDIO: TIBStringField;
    IBTable_Exclui_HospedeAPTO: TSmallintField;
    IBTable_Exclui_HospedeCAMA: TSmallintField;
    IBTable_Exclui_HospedeDATAENTRADA: TIBStringField;
    IBTable_Exclui_HospedeHORAENTRADA: TIBStringField;
    IBTable_Exclui_HospedeDATASAIDA: TIBStringField;
    IBTable_Exclui_HospedeDEPENDENTE: TSmallintField;
    IBTable_Exclui_HospedeSITUACAO_HOSPEDAGEM: TIBStringField;
    IBTable_Exclui_HospedeRECEBE: TIBStringField;
    IBTable_Exclui_HospedeDESCONTO: TIBStringField;
    IBTable_Historico: TIBTable;
    IBTable_HistoricoIDENTIDADE: TIBStringField;
    IBTable_HistoricoFICHA: TIBStringField;
    IBTable_HistoricoANO: TSmallintField;
    IBTable_HistoricoPREDIO: TIBStringField;
    IBTable_HistoricoAPTO: TSmallintField;
    IBTable_HistoricoHORAENTRADA: TIBStringField;
    IBTable_HistoricoUSUARIO_ENTRADA: TIBStringField;
    IBTable_HistoricoSITUACAO_CURSO: TIBStringField;
    IBTable_HistoricoUSUARIO_SAIDA: TIBStringField;
    IBTable_HistoricoTIPO_FECHAMENTO: TIBStringField;
    IBTable_HistoricoRECEBIDO: TIBStringField;
    IBTable_HistoricoOBS: TIBStringField;
    IBTable_HistoricoHORA_OPERACAO: TIBStringField;
    IBTable_HistoricoDATA_OPERACAO: TDateTimeField;
    IBTable_Apto: TIBTable;
    IBTable_AptoPREDIO: TIBStringField;
    IBTable_AptoAPTO: TSmallintField;
    IBTable_AptoCAMA: TSmallintField;
    IBTable_AptoAPTCODIGO: TIBStringField;
    IBTable_Exclui_Dependente: TIBTable;
    IBTable_Exclui_DependentePREDIO: TIBStringField;
    IBTable_Exclui_DependenteAPTO: TSmallintField;
    IBTable_Exclui_DependenteCAMA: TSmallintField;
    IBTable_Exclui_DependenteAPTCODIGO: TIBStringField;
    IBTable_Exclui_DependenteNOME: TIBStringField;
    IBQuery_Exclui_Ficha: TIBQuery;
    IBTable_HistoricoDATAENTRADA: TDateTimeField;
    IBTable_HistoricoDATASAIDA: TDateTimeField;
    IBTable_HistoricoDATAPAGAMENTO: TDateTimeField;
    IBQuery_Busca_HospedeFICHA: TIBStringField;
    procedure FormActivate(Sender: TObject);
    procedure MaskEdit_Busca_NomeChange(Sender: TObject);
    procedure Executa_Query(VS_Comando: String);
    procedure ToolButton_ExcluirClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form_Excluir_Hospede: TForm_Excluir_Hospede;

implementation

uses Abertura, Module;

{$R *.DFM}


//------------------------------------------------------------------------------
// Modulo principal
//------------------------------------------------------------------------------

procedure TForm_Excluir_Hospede.FormActivate(Sender: TObject);
var
   VS_Comando: String;
begin
    VS_Comando:= 'Select b.identidade, b.nome, b.Posto, a.ano, a.ficha '+
                 'from hospedagem a, hospede b '+
                 'where b.identidade = a.identidade '+
                 ' and a.ano = '+Funcoes.AnoAtual+
                 ' order by b.nome';

   Executa_Query(VS_Comando);

   IBTable_Exclui_Hospede.Open;
   IBTable_Historico.Open;
   IBTable_Apto.Open;
   IBTable_Exclui_Dependente.Open;

   DateTimePicker_Data_Saida.Date:= Date;
end;

//------------------------------------------------------------------------------
// Procedure com a finalidade de tratar do botao excluir
//------------------------------------------------------------------------------

procedure TForm_Excluir_Hospede.ToolButton_ExcluirClick(Sender: TObject);
var
   VI_Cont: integer;
   VS_Ficha, VS_Comando: String;
begin
   DBNavigator_Hospede.Enabled:= False;
   ToolButton_Excluir.Enabled:= False;
   ToolButton_Retornar.Enabled:= False;
   ToolButton_Windows.Enabled:= False;
   if MessageDlg('Confirma o Cancelamento da Hospedagem ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
       //---
      //--- Limpa dependente quando tiver

     IBTable_Apto.OPen;
     IBTable_Exclui_Dependente.OPen;
     if ((IBTable_Exclui_Hospede.FieldByName('Dependente').ASInteger > 0) and (IBTable_Exclui_Dependente.Recordcount > 0)) then
     begin
        VI_Cont:= 1;
        While VI_Cont <= IBTable_Exclui_Hospede.FieldByName('Dependente').ASInteger do
        begin
           IBTable_Exclui_Dependente.Edit;
           IBTable_Exclui_Dependente.FieldByName('AptCodigo').AsString:= 'DESOCUPADO';
           IBTable_Exclui_Dependente.Post;
           DM.IBTransaction_Hotel.CommitRetaining;
           IBTable_Exclui_Dependente.Close;
           IBTable_Exclui_Dependente.Open;
           VI_Cont:= VI_Cont +1;
        end;
     end;

      //---
     //--- Limpa apto em que o hospede esta hospedado

     IBTable_Apto.Edit;
     IBTable_Apto.FieldByName('AptCodigo').AsString:= 'DESOCUPADO';
     IBTable_Apto.Post;
     DM.IBTransaction_Hotel.CommitRetaining;

      //---
     //--- Grava os dados finais para o historico

    VS_Ficha:= IBTable_Historico.FieldByName('Ficha').AsString;

     IBTable_Historico.Edit;
     IBTable_Historico.FieldByName('DATASAIDA').AsString:= DateToStr(DateTimePicker_Data_Saida.date);
     IBTable_Historico.FieldByName('USUARIO_SAIDA').AsString:= Funcoes.GetUsuario;
     IBTable_Historico.FieldByName('TIPO_FECHAMENTO').AsString:= 'C';
     IBTable_Historico.FieldByName('OBS').AsString:= MaskEdit_Observacao.text;
     IBTable_Historico.Post;
     DM.IBTransaction_Hotel.CommitRetaining;

     //---
     //--- Exclui o hospede

     IBTable_Exclui_Hospede.Delete;
     DM.IBTransaction_Hotel.CommitRetaining;

     IBQuery_Busca_Hospede.Close;
     IBQuery_Busca_Hospede.Open;

    //---
   //--- Exclui o hospede quando este for cadastrado por ficha

   VS_Comando:= 'Update aptocama set AptCodigo = '+#39+'DESOCUPADO'+#39+
                ', Nome = '+#39+' '+#39+
                ' Where AptCodigo = '+#39+trim(VS_Ficha)+#39;
   Funcoes.ExecSql_Servidor(VS_Comando);

   MaskEdit_Observacao.Text:= '';
   MaskEdit_Busca_Nome.Text:= '';

   if IBQuery_Busca_Hospede.RecordCount = 0 then
      ToolButton_Excluir.Enabled:= False;

   end;
   DBNavigator_Hospede.Enabled:= True;
   ToolButton_Excluir.Enabled:= True;
   ToolButton_Retornar.Enabled:= True;
   ToolButton_Windows.Enabled:= True;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_Excluir_Hospede.ToolButton_RetornarClick(Sender: TObject);
begin
   IBQuery_Busca_Hospede.Close;
   IBTable_Exclui_Hospede.Close;
   IBTable_Historico.Close;
   IBTable_Apto.Close;
   IBTable_Exclui_Dependente.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Excluir_Hospede.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Procedure para buscar o hospede pelo nome
//------------------------------------------------------------------------------

procedure TForm_Excluir_Hospede.MaskEdit_Busca_NomeChange(Sender: TObject);
var
   VS_Comando: String;                                                      
begin
    VS_Comando:= 'Select a.identidade, b.identidade, b.nome, b.Posto, a.ano, a.ficha  '+
                 'from hospedagem a, hospede b '+
                 'where b.identidade = a.identidade '+
                 'and a.ano = '+Funcoes.AnoAtual+' '+
                 'and b.nome like '+#39+'%'+MaskEdit_Busca_Nome.Text+'%'+#39+
                 ' order by b.nome';

   Executa_Query(VS_Comando);
end;

//------------------------------------------------------------------------------
// Procedure para tratar da execusão da query
//------------------------------------------------------------------------------

procedure TForm_Excluir_Hospede.Executa_Query(VS_Comando: String);
begin
   IBQuery_Busca_Hospede.Close;
   IBQuery_Busca_Hospede.SQL.Clear;
   IBQuery_Busca_Hospede.SQL.ADD(VS_Comando);
   IBQuery_Busca_Hospede.Open;
end;

end.
