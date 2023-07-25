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
  StdCtrls, Forms, DBCtrls, DB, DBGrids, Mask, Buttons, ExtCtrls, DBTables,
  ComCtrls, Grids, ToolWin, JvGradient;

type
  TForm_Excluir_Hospede = class(TForm)
    GroupBox_Busca_Por_Nome: TGroupBox;
    MaskEdit_Busca_Nome: TMaskEdit;
    Panel3: TPanel;
    DBGrid_Hospede: TDBGrid;
    StatusBar: TStatusBar;
    Query_Busca_Hospede: TQuery;
    DSQ_Busca_Hospede: TDataSource;
    Table_Exclui_Hospedagem: TTable;
    Table_Historico: TTable;
    Table_HistoricoFICHA: TStringField;
    GroupBox1: TGroupBox;
    MaskEdit_Observacao: TMaskEdit;
    Table_HistoricoDATASAIDA: TStringField;
    Table_HistoricoUSUARIO_SAIDA: TStringField;
    Table_HistoricoTIPO_FECHAMENTO: TStringField;
    Table_HistoricoOBS: TStringField;
    Table_HistoricoIDENTIDADE: TStringField;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DST_Historico: TDataSource;
    DateTimePicker_Data_Saida: TDateTimePicker;
    Table_Apto: TTable;
    DST_Apto: TDataSource;
    Query_Busca_HospedeIDENTIDADE: TStringField;
    Query_Busca_HospedeIDENTIDADE_1: TStringField;
    Query_Busca_HospedeNOME: TStringField;
    Query_Busca_HospedePOSTO: TStringField;
    DST_Exclui_Hospede: TDataSource;
    Table_Exclui_HospedagemIDENTIDADE: TStringField;
    Table_Exclui_HospedagemFICHA: TStringField;
    Table_Exclui_HospedagemPREDIO: TStringField;
    Table_Exclui_HospedagemAPTO: TFloatField;
    Table_Exclui_HospedagemCAMA: TFloatField;
    Table_Exclui_HospedagemDATAENTRADA: TStringField;
    Table_Exclui_HospedagemHORAENTRADA: TStringField;
    Table_Exclui_HospedagemDATASAIDA: TStringField;
    Table_Exclui_HospedagemSITUACAO_HOSPEDAGEM: TStringField;
    Table_Exclui_HospedagemRECEBE: TStringField;
    Table_Exclui_HospedagemDEPENDENTE: TFloatField;
    Table_AptoPREDIO: TStringField;
    Table_AptoAPTO: TFloatField;
    Table_AptoCAMA: TFloatField;
    Table_AptoAPTCODIGO: TStringField;
    Table_Exclui_Dependente: TTable;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField2: TStringField;
    DST_Exclui_Dependente: TDataSource;
    Table_Exclui_HospedagemANO: TFloatField;
    Table_Exclui_HospedagemDESCONTO: TStringField;
    Query_Busca_HospedeANO: TFloatField;
    Table_HistoricoANO: TFloatField;
    Panel2: TPanel;
    DBNavigator_Hospede: TDBNavigator;
    ToolBar4: TToolBar;
    ToolButton_Excluir: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    JvGradient1: TJvGradient;
    JvGradient2: TJvGradient;
    Label_Ficha_Hospede: TLabel;
    Query_Busca_HospedeFICHA: TStringField;
    Table_HistoricoPREDIO: TStringField;
    Table_HistoricoAPTO: TFloatField;
    Table_HistoricoDATAENTRADA: TStringField;
    Table_HistoricoHORAENTRADA: TStringField;
    Table_HistoricoDATAPAGAMENTO: TStringField;
    Table_HistoricoNRECIBO: TStringField;
    Table_HistoricoBANCO: TStringField;
    Table_HistoricoNCHEQUE: TStringField;
    Table_HistoricoPRACA: TStringField;
    Table_HistoricoVALORPAGO: TFloatField;
    Table_HistoricoCUSTO_TELEFONE: TFloatField;
    Table_HistoricoUSUARIO_ENTRADA: TStringField;
    Table_HistoricoSITUACAO_CURSO: TStringField;
    Table_HistoricoRECEBIDO: TStringField;
    Table_HistoricoHORA_OPERACAO: TStringField;
    Table_HistoricoDATA_OPERACAO: TDateTimeField;
    Table_HistoricoADE: TStringField;
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

uses Abertura;

{$R *.DFM}


//------------------------------------------------------------------------------
// Modulo principal
//------------------------------------------------------------------------------

procedure TForm_Excluir_Hospede.FormActivate(Sender: TObject);
var
   VS_Comando: String;
begin
    VS_Comando:= 'Select a.identidade, a.ficha, b.identidade, b.nome, b.Posto, a.ano '+
                 'from hospedagem a, hospede b '+
                 'where b.identidade = a.identidade '+
                 ' and a.ano = '+Funcoes.AnoAtual+
                 ' order by b.nome';

   Executa_Query(VS_Comando);

   Table_Exclui_Hospedagem.Open;
   Table_Historico.Open;
   Table_Apto.Open;
   Table_Exclui_Dependente.Open;

   DateTimePicker_Data_Saida.Date:= Date;

   if Query_Busca_Hospede.RecordCount = 0 then
       ToolButton_Excluir.Enabled:= False;

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

     Table_Apto.Open;
     Table_Exclui_Dependente.Open;
     if ((Table_Exclui_Hospedagem.FieldByName('Dependente').ASInteger > 0) and (Table_Exclui_Dependente.Recordcount > 0)) then
     begin
        VI_Cont:= 1;
        While VI_Cont <= Table_Exclui_Hospedagem.FieldByName('Dependente').ASInteger do
        begin
           Table_Exclui_Dependente.Edit;
           Table_Exclui_Dependente.FieldByName('AptCodigo').AsString:= 'DESOCUPADO';
           Table_Exclui_Dependente.Post;
           Table_Exclui_Dependente.Close;
           Table_Exclui_Dependente.Open;
           VI_Cont:= VI_Cont +1;
        end;
     end;

      //---
     //--- Limpa apto em que o hospede esta hospedado

     Table_Apto.Edit;
     Table_Apto.FieldByName('AptCodigo').AsString:= 'DESOCUPADO';
     Table_Apto.Post;

      //---
     //--- Grava os dados finais para o historico

     VS_Ficha:= Table_Historico.FieldByName('Ficha').AsString;

     Table_Historico.Edit;
     Table_Historico.FieldByName('DATASAIDA').AsString:= DateToStr(DateTimePicker_Data_Saida.date);
     Table_Historico.FieldByName('DATA_OPERACAO').AsString:= DateToStr(Date);
     Table_Historico.FieldByName('USUARIO_SAIDA').AsString:= Funcoes.GetUsuario;
     Table_Historico.FieldByName('TIPO_FECHAMENTO').AsString:= 'C';
     Table_Historico.FieldByName('OBS').AsString:= MaskEdit_Observacao.text;
     Table_Historico.Post;

     //---
     //--- Exclui o hospede

     Table_Exclui_Hospedagem.Delete;

     Query_Busca_Hospede.Close;
     Query_Busca_Hospede.Open;

      //---
     //--- Exclui o hospede quando este for cadastrado por ficha

     VS_Comando:= 'Update aptocama set AptCodigo = '+#39+'DESOCUPADO'+#39+
                  ', Nome = '+#39+' '+#39+
                  ' Where AptCodigo = '+#39+trim(VS_Ficha)+#39;
     Funcoes.ExecSql(VS_Comando);

     MaskEdit_Observacao.Text:= '';
     MaskEdit_Busca_Nome.Text:= '';
   end;
   DBNavigator_Hospede.Enabled:= True;
   if Query_Busca_Hospede.RecordCount = 0 then
        ToolButton_Excluir.Enabled:= False
   else
      ToolButton_Excluir.Enabled:= True;
   ToolButton_Retornar.Enabled:= True;
   ToolButton_Windows.Enabled:= True;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_Excluir_Hospede.ToolButton_RetornarClick(Sender: TObject);
begin
   Query_Busca_Hospede.Close;
   Table_Exclui_Hospedagem.Close;
   Table_Historico.Close;
   Table_Apto.Close;
   Table_Exclui_Dependente.Close;
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
{    VS_Comando:= 'Select a.identidade, a.Ficha, b.identidade, b.nome, b.Posto, a.ano '+
                 'from hospedagem a, hospede b '+
                 'where b.identidade = a.identidade '+
                 'and a.ano = '+Funcoes.AnoAtual+' '+
                 'and b.nome like '+#39+'%'+MaskEdit_Busca_Nome.Text+'%'+#39+
                 ' order by b.nome';
}
    VS_Comando:= 'Select a.identidade, a.Ficha, b.identidade, b.nome, b.Posto, a.ano '+
                 'from hospedagem a, hospede b '+
                 'where b.identidade = a.identidade '+
                 'and b.nome like '+#39+'%'+MaskEdit_Busca_Nome.Text+'%'+#39+
                 ' order by b.nome';

   Executa_Query(VS_Comando);
end;

//------------------------------------------------------------------------------
// Procedure para tratar da execusão da query
//------------------------------------------------------------------------------

procedure TForm_Excluir_Hospede.Executa_Query(VS_Comando: String);
begin
   Query_Busca_Hospede.Close;
   Query_Busca_Hospede.SQL.Clear;
   Query_Busca_Hospede.SQL.ADD(VS_Comando);
   Query_Busca_Hospede.Open;
end;

end.
