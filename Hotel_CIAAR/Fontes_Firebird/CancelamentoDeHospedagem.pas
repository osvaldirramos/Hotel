unit CancelamentoDeHospedagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, ComCtrls, ToolWin, StdCtrls, Mask, IBQuery, DB,
  IBCustomDataSet, IBTable, Rotinas;

type
  TForm_CancelamentoDeHospedagem = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit_Observacao: TMaskEdit;
    DateTimePicker_Data_Saida: TDateTimePicker;
    ToolBar4: TToolBar;
    ToolButton_Excluir: TToolButton;
    ToolButton_Retornar: TToolButton;
    StatusBar: TStatusBar;
    DBText_Nome: TDBText;
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
    DST_Exclui_Hospede: TDataSource;
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
    IBTable_HistoricoDATAENTRADA: TDateTimeField;
    IBTable_HistoricoDATASAIDA: TDateTimeField;
    IBTable_HistoricoDATAPAGAMENTO: TDateTimeField;
    DST_Historico: TDataSource;
    IBTable_Apto: TIBTable;
    IBTable_AptoPREDIO: TIBStringField;
    IBTable_AptoAPTO: TSmallintField;
    IBTable_AptoCAMA: TSmallintField;
    IBTable_AptoAPTCODIGO: TIBStringField;
    DST_Apto: TDataSource;
    IBTable_Exclui_Dependente: TIBTable;
    IBTable_Exclui_DependentePREDIO: TIBStringField;
    IBTable_Exclui_DependenteAPTO: TSmallintField;
    IBTable_Exclui_DependenteCAMA: TSmallintField;
    IBTable_Exclui_DependenteAPTCODIGO: TIBStringField;
    IBTable_Exclui_DependenteNOME: TIBStringField;
    DST_Exclui_Dependente: TDataSource;
    IBQuery_Exclui_Ficha: TIBQuery;
    IBTable_Hospede: TIBTable;
    DST_Hospede: TDataSource;
    IBTable_HospedeIDENTIDADE: TIBStringField;
    IBTable_HospedeNOME: TIBStringField;
    procedure ToolButton_ExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_CancelamentoDeHospedagem: TForm_CancelamentoDeHospedagem;

implementation

uses Recepcao, Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Modulo principal
//------------------------------------------------------------------------------

procedure TForm_CancelamentoDeHospedagem.FormActivate(Sender: TObject);
begin
   IBTable_Exclui_Hospede.Open;
   IBTable_Historico.Open;
   IBTable_Apto.Open;
   IBTable_Exclui_Dependente.Open;
   IBTable_Hospede.Open;

   DateTimePicker_Data_Saida.Date:= Date;
   MaskEdit_Observacao.SetFocus;
end;

//------------------------------------------------------------------------------
// Procedure com a finalidade de tratar do botao excluir
//------------------------------------------------------------------------------

procedure TForm_CancelamentoDeHospedagem.ToolButton_ExcluirClick(Sender: TObject);
var
   VI_Cont: integer;
   VS_Ficha, VS_Comando: String;
begin
   if MessageDlg('Confirma o Cancelamento da Hospedagem ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
     if trim(MaskEdit_Observacao.Text) = '' then
     begin
         ShowMessage('Para realizar o Cancelamento da hospedagem é necessário dizer o motivo...');
         MaskEdit_Observacao.SetFocus;
     end
     else
     begin
        if DateTimePicker_Data_Saida.Date < date then
        begin
           ShowMessage('A Data de Fechamento não pode ser menor que a data de...'+DateToStr(Date));
           DateTimePicker_Data_Saida.SetFocus;
        end
        else
        begin
             //---
            //--- Limpa dependente quando tiver

           IBTable_Apto.Open;
           IBTable_Exclui_Dependente.Open;
           if ((IBTable_Exclui_Hospede.FieldByName('Dependente').ASInteger > 0) and (IBTable_Exclui_Dependente.Recordcount > 0)) then
           begin
              VI_Cont:= 1;
              While VI_Cont <= IBTable_Exclui_Hospede.FieldByName('Dependente').ASInteger do
              begin
                 IBTable_Exclui_Dependente.Edit;
                 IBTable_Exclui_Dependente.FieldByName('AptCodigo').AsString:= 'DESOCUPADO';
                 IBTable_Exclui_Dependente.Post;

                  //---
                 //--- Exclui o Dependente

                 VS_Comando:= 'Delete from Dependente '+
                              ' Where Predio = '+#39+IBTable_Exclui_Dependente.FieldByName('Predio').AsString+
                              ' and Apto = '+#39+IBTable_Exclui_Dependente.FieldByName('Apto').AsString+
                              ' and Cama = '+#39+IBTable_Exclui_Dependente.FieldByName('Cama').AsString;
                 Funcoes.ExecSql_Servidor(VS_Comando);

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

            //---
           //--- Exclui o hospede

           IBTable_Exclui_Hospede.Delete;

            //---
           //--- Exclui o hospede quando este for cadastrado por ficha

           VS_Comando:= 'Update aptocama set AptCodigo = '+#39+'DESOCUPADO'+#39+
                        ', Nome = '+#39+' '+#39+
                        ' Where AptCodigo = '+#39+trim(VS_Ficha)+#39;
           Funcoes.ExecSql_Servidor(VS_Comando);
           Close;
        end;
     end;
   end;
end;


procedure TForm_CancelamentoDeHospedagem.ToolButton_RetornarClick(Sender: TObject);
begin
   IBTable_Exclui_Hospede.Close;
   IBTable_Historico.Close;
   IBTable_Apto.Close;
   IBTable_Exclui_Dependente.Close;
   IBTable_Hospede.Close;

   Close;
end;

end.
