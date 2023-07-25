//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Historico.PAS                                  //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de montar o histo-  //
//                             rico de hospedagem.                            //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 17/03/2003                                     //
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

unit Auditoria_Historico;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, ShellApi,
  Menus, DB, DBTables, ComCtrls, ToolWin, StdCtrls, Mask, DBCtrls, ComObj, Variants,
  ExtCtrls, JvEdit, Buttons, Grids, DBGrids, Forms, Rotinas, Dialogs, DateUtils,
  JvToolEdit, JvComponent, JvCaptionPanel, JvShape,
  JvGradient, JvGrdCpt, DBClient;

type
  TForm_Auditoria_Historico = class(TForm)
    Query_Historico: TQuery;
    DSQ_Historico: TDataSource;
    Table_Hospede: TTable;
    DST_Hospede: TDataSource;
    Table_Historico: TTable;
    DST_Historico: TDataSource;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    DBGrid_Hospede: TDBGrid;
    Table_HistoricoIDENTIDADE: TStringField;
    Table_HistoricoFICHA: TStringField;
    Table_HistoricoPREDIO: TStringField;
    Table_HistoricoAPTO: TFloatField;
    Table_HistoricoDATAENTRADA: TStringField;
    Table_HistoricoHORAENTRADA: TStringField;
    Table_HistoricoDATASAIDA: TStringField;
    Table_HistoricoDATAPAGAMENTO: TStringField;
    Table_HistoricoNRECIBO: TStringField;
    Table_HistoricoBANCO: TStringField;
    Table_HistoricoNCHEQUE: TStringField;
    Table_HistoricoPRACA: TStringField;
    Table_HistoricoVALORPAGO: TFloatField;
    Table_HistoricoUSUARIO_ENTRADA: TStringField;
    Table_HistoricoUSUARIO_SAIDA: TStringField;
    Table_HistoricoTIPO_FECHAMENTO: TStringField;
    Table_HistoricoRECEBIDO: TStringField;
    Table_HistoricoOBS: TStringField;
    Table_HospedeIDENTIDADE: TStringField;
    Table_HospedeNOME: TStringField;
    Table_HospedeNOME_GUERRA: TStringField;
    Table_HospedePOSTO: TStringField;
    Table_HospedeNACIONALIDADE: TStringField;
    Table_HospedeTELEFONE_RESIDENCIAL: TStringField;
    Table_HospedeTELEFONE_FUNCIONAL: TStringField;
    Table_HospedeSITUACAO_CURSO: TStringField;
    Table_HospedeOM_ORIGEM: TStringField;
    Table_HospedeDEPENDENTE_DE: TStringField;
    Panel6: TPanel;
    Table_Dependente: TTable;
    Table_DependenteIDENTIDADE: TStringField;
    Table_DependenteFICHA: TStringField;
    Table_DependenteANO: TFloatField;
    Table_DependentePREDIO: TStringField;
    Table_DependenteAPTO: TFloatField;
    Table_DependenteCAMA: TFloatField;
    Table_DependenteNOME: TStringField;
    DST_Dependente: TDataSource;
    Table_HistoricoANO: TFloatField;
    Table_HistoricoCUSTO_TELEFONE: TFloatField;
    Table_HistoricoSITUACAO_CURSO: TStringField;
    Panel_Campos: TPanel;
    Label25: TLabel;
    Label22: TLabel;
    Label19: TLabel;
    Label_Predio: TLabel;
    Label28: TLabel;
    Label5: TLabel;
    Label13: TLabel;
    Label_Situacao_Curso: TLabel;
    Label27: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    Label21: TLabel;
    Label20: TLabel;
    Label23: TLabel;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Label_Email: TLabel;
    Label_Telefone_Residencial: TLabel;
    Label6: TLabel;
    Label_Nome_Guerra: TLabel;
    Label10: TLabel;
    Label15: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    SpeedButton_Consulta: TSpeedButton;
    MaskEdit_Nome: TJvEdit;
    MaskEdit_NRecibo: TJvEdit;
    MaskEdit_Ficha: TJvEdit;
    MaskEdit_Apto: TJvEdit;
    ComboBox_Predio: TComboBox;
    MaskEdit_Ano: TJvEdit;
    PopupMenu_Menu: TPopupMenu;
    Alterar: TMenuItem;
    Gravar: TMenuItem;
    Cancelar: TMenuItem;
    Query_HistoricoPREDIO: TStringField;
    Query_HistoricoAPTO: TFloatField;
    Query_HistoricoIDENTIDADE: TStringField;
    Query_HistoricoNOME: TStringField;
    Query_HistoricoFICHA: TStringField;
    Query_HistoricoDATAENTRADA: TStringField;
    Query_HistoricoDATASAIDA: TStringField;
    Query_HistoricoDATAPAGAMENTO: TStringField;
    Query_HistoricoNRECIBO: TStringField;
    Query_HistoricoANO: TFloatField;
    Bevel1: TBevel;
    JvEdit_Identidade: TJvEdit;
    Label_NReg: TLabel;
    Label1: TLabel;
    DBEdit7: TDBEdit;
    Table_HistoricoHORA_OPERACAO: TStringField;
    Table_HistoricoDATA_OPERACAO: TDateTimeField;
    Label16: TLabel;
    DBEdit22: TDBEdit;
    ToolBar2: TToolBar;
    ToolButton_Reduz: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    ToolButton_Amplia: TToolButton;
    Label11: TLabel;
    Table_HospedeSITUACAO: TStringField;
    Table_HospedeTELEFONE_CELULAR: TStringField;
    Table_HospedeEMAIL: TStringField;
    SpeedButton_Email: TSpeedButton;
    DBEdit_NomeGuerra: TDBEdit;
    DBEdit_PostoGraduacao: TDBEdit;
    DBEdit_DependenteDe: TDBEdit;
    DBEdit_Nacionalidade: TDBEdit;
    DBEdit_TelefoneResidencial: TDBEdit;
    DBEdit_TelefoneFuncional: TDBEdit;
    DBEdit_TelefoneCelular: TDBEdit;
    DBEdit_Email: TDBEdit;
    DBEditOMOrigem: TDBEdit;
    DBEdit_SituacaoCurso: TDBEdit;
    DBEdit_DataEntrada: TDBEdit;
    DBEdit_HoraEntrada: TDBEdit;
    EditDATAPAGAMENTO: TDBEdit;
    DBEdit_DataSaida: TDBEdit;
    DBEdit_Predio: TDBEdit;
    DBEdit_Apto: TDBEdit;
    Edit_SituacaoHistorico: TEdit;
    EditNRECIBO: TDBEdit;
    EditPRACA: TDBEdit;
    EditOBS: TDBEdit;
    EditBANCO: TDBEdit;
    EditVALORPAGO: TDBEdit;
    EditNCHEQUE: TDBEdit;
    Table_Hospedagem: TTable;
    DST_Hospedagem: TDataSource;
    Table_HospedagemIDENTIDADE: TStringField;
    Table_HospedagemFICHA: TStringField;
    Table_HospedagemANO: TFloatField;
    Table_HospedagemPREDIO: TStringField;
    Table_HospedagemAPTO: TFloatField;
    Table_HospedagemCAMA: TFloatField;
    DBGrid_Parcelado: TDBGrid;
    Table_PagParcelado: TTable;
    Table_PagParceladoIDENTIDADE: TStringField;
    Table_PagParceladoFICHA: TStringField;
    Table_PagParceladoANO: TFloatField;
    Table_PagParceladoDATAPAGAMENTO: TStringField;
    Table_PagParceladoVALOR: TFloatField;
    Table_PagParceladoNRECIBO: TStringField;
    DST_PagParcelado: TDataSource;
    Panel_TotalGeral: TPanel;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Query_HistoricoDATA_OPERACAO: TDateTimeField;
    Query_HistoricoTIPO_FECHAMENTO: TStringField;
    Label7: TLabel;
    DBEdit_ficha: TDBEdit;
    Label9: TLabel;
    DBEdit_Ano: TDBEdit;
    Excluir1: TMenuItem;
    Table_HospedeCPF: TStringField;
    Label17: TLabel;
    DBEdit_CPF: TDBEdit;
    ToolButton3: TToolButton;
    Label_Hora_Saida: TLabel;
    DBEdit1: TDBEdit;
    Table_HistoricoHORASAIDA: TStringField;
    Table_HistoricoADE: TStringField;
    Label18: TLabel;
    DBEdit_Saram: TDBEdit;
    Table_HospedeRESIDENCIA: TStringField;
    Table_HospedeNUMERO: TStringField;
    Table_HospedeCIDADE: TStringField;
    Table_HospedeBAIRRO: TStringField;
    Table_HospedeESTADO: TStringField;
    Table_HospedeOBS: TStringField;
    Table_HospedeVEICULO: TStringField;
    Table_HospedePLACA: TStringField;
    Table_HospedeSARAM: TStringField;
    Query_HistoricoSITUACAO_CURSO: TStringField;
    JvEdit_Situacao: TJvEdit;
    Table_HistoricoSARAM: TStringField;
    Table_HistoricoSISCEAB: TStringField;
    Label_Sisceab: TLabel;
    DBEdit_SISCEAB: TDBEdit;
    Query_HistoricoCPF: TStringField;
    JvEdit_CPF: TJvEdit;
    ToolButton4: TToolButton;
    Label24: TLabel;
    DBEdit_Cama: TDBEdit;
    Panel1: TPanel;
    JvShape1: TJvShape;
    DBNavigator1: TDBNavigator;
    Label26: TLabel;
    DBEdit_Ade: TDBEdit;

    procedure TratarNumero(Sender: TObject; var Key: Char);

    procedure Campos(Status: Boolean);

    procedure FormCreate(Sender: TObject);
    procedure MaskEdit_HospedeChange(Sender: TObject);
    procedure MaskEdit_FichaChange(Sender: TObject);
    procedure ComboBox_PredioChange(Sender: TObject);
    procedure ComboBox_SituacaoChange(Sender: TObject);
    Procedure Busca_opcao;
    procedure ComboBox_AnoChange(Sender: TObject);
    procedure Table_HistoricoAfterScroll(DataSet: TDataSet);
    procedure DBGrid_HospedeTitleClick(Column: TColumn);
    procedure SpeedButton_ConsultaClick(Sender: TObject);

    procedure AlterarClick(Sender: TObject);
    procedure GravarClick(Sender: TObject);
    procedure CancelarClick(Sender: TObject);
    procedure JvEdit_IdentidadeKeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton_ReduzClick(Sender: TObject);
    procedure ToolButton_AmpliaClick(Sender: TObject);
    procedure SpeedButton_EmailClick(Sender: TObject);
    procedure DBGrid_HospedeDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Excluir1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);

  private    { private declarations }
   VS_Comando_Where: string;

  public    { public declarations }
     VS_Ano_Old, VS_Ficha_old, VS_OrderBy: String;
  end;

var
  Form_Auditoria_Historico: TForm_Auditoria_Historico;

implementation

uses Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure principal
//------------------------------------------------------------------------------

procedure TForm_Auditoria_Historico.FormCreate(Sender: TObject);
var
   Status: Boolean;
begin
   if Funcoes.GetPrivilegio = 'G' then
      Status:= True
   else
      Status:= False;
   Alterar.Visible:= Status;
   Gravar.Visible:= Status;
   Cancelar.Visible:= Status;

   Panel_Campos.Visible:= True;
   ToolButton_Reduz.Visible:= True;
   ToolButton_Amplia.Visible:= False;

   //---
   // Tratamento das opcoes para altera numero do recibo

   Alterar.Enabled:= true;
   Gravar.Enabled:= False;
   Cancelar.Enabled:= False;

   VS_OrderBy:= 'a.Ano';
   MaskEdit_Ano.Text:= Funcoes.AnoAtual;
   Table_PagParcelado.Open;
   Table_Historico.Open;
   Table_Hospede.Open;
   Table_Dependente.Open;
   Table_Hospedagem.Open;

   Campos(True);
   Busca_opcao;
end;

procedure TForm_Auditoria_Historico.MaskEdit_FichaChange(Sender: TObject);
begin
   Busca_opcao;
end;

//------------------------------------------------------------------------------
// Procedure para procurar Hospede por nome
//------------------------------------------------------------------------------

procedure TForm_Auditoria_Historico.MaskEdit_HospedeChange(Sender: TObject);
begin
   Busca_opcao;
end;

//------------------------------------------------------------------------------
// Procedure para retornar para o menu principal
//------------------------------------------------------------------------------

procedure TForm_Auditoria_Historico.ToolButton_RetornarClick(Sender: TObject);
begin
   Query_Historico.Close;
   Table_Historico.Close;
   Table_Hospede.Close;
    Table_PagParcelado.Open;
   Close;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Auditoria_Historico.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Procedure Busca por predio
//------------------------------------------------------------------------------

procedure TForm_Auditoria_Historico.ComboBox_PredioChange(Sender: TObject);
begin
   Busca_opcao;
end;

//------------------------------------------------------------------------------
// Procedure de Busca
//------------------------------------------------------------------------------

Procedure TForm_Auditoria_Historico.Busca_opcao;
var
  VS_Comando: String;
begin
   VS_Comando_Where:= '';

//   if JvDateEdit_Inicio.Text <> '  /  /    ' then
//   begin
//      VS_Comando:= 'Select a.ano, a.predio, a.apto, a.Ficha, a.NRecibo, b.nome, b.posto, a.DataEntrada, a.DataSaida, a.DataPagamento, a.Data_Operacao, a.identidade, a.TIPO_FECHAMENTO, a.Situacao_Curso, b.cpf, '+
//                   ' TO_DATE('+#39+JvDateEdit_DataTermino.Text+#39+') - To_Date(a.DataEntrada) as Tempo '+
//                   ' from Historico a, hospede b, apartamento p '+
//                   ' where b.identidade = a.identidade '+
//                   ' and ((a.predio = p.predio) and (a.apto = p.apto) and (p.visivel = '+#39+'S'+#39+')) ';
//   end
//   else
//   begin
      VS_Comando:= 'Select a.ano, a.predio, a.apto, a.Ficha, a.NRecibo, b.nome, b.posto, a.DataEntrada, a.DataSaida, a.DataPagamento, a.Data_Operacao, a.identidade, a.TIPO_FECHAMENTO, a.Situacao_Curso, b.cpf '+
                   ' from Historico a, hospede b, apartamento p '+
                   ' where b.identidade = a.identidade '+
                   ' and ((a.predio = p.predio) and (a.apto = p.apto) and (p.visivel = '+#39+'S'+#39+')) ';
//   end;


   if trim(MaskEdit_Ano.Text) <> '' then
      VS_Comando_Where:= VS_Comando_Where+' and a.ano = '+#39+trim(MaskEdit_Ano.Text)+#39;

   if trim(ComboBox_Predio.Text) <> '' then
      VS_Comando_Where:= VS_Comando_Where+' and a.Predio = '+#39+trim(ComboBox_Predio.Text)+#39;

   if trim(MaskEdit_Apto.Text) <> '' then
      VS_Comando_Where:= VS_Comando_Where+' and a.Apto = '+trim(MaskEdit_Apto.Text);

   if trim(MaskEdit_Ficha.Text) <> '' then
      VS_Comando_Where:= VS_Comando_Where+' and a.Ficha = '+#39+Funcoes.NFicha(trim(MaskEdit_Ficha.Text))+#39;

   if trim(MaskEdit_NRecibo.Text) <> '' then
      VS_Comando_Where:= VS_Comando_Where+' and a.NRecibo = '+#39+Funcoes.NFicha(trim(MaskEdit_NRecibo.Text))+#39;

   if trim(MaskEdit_Nome.Text) <> '' then
      VS_Comando_Where:= VS_Comando_Where+' and b.nome like '+#39+'%'+trim(MaskEdit_Nome.Text)+'%'+#39;

   if trim(JvEdit_Identidade.Text) <> '' then
      VS_Comando_Where:= VS_Comando_Where+' and a.identidade =  '+#39+Funcoes.NIdentidade(trim(JvEdit_Identidade.Text))+#39;

   if trim(JvEdit_CPF.Text) <> '' then
      VS_Comando_Where:= VS_Comando_Where+' and b.cpf like '+#39+trim(JvEdit_CPF.Text)+'%'+#39;

   if trim(JvEdit_Situacao.Text) <> '' then
      VS_Comando_Where:= VS_Comando_Where+' and a.Situacao_Curso Like '+#39+JvEdit_Situacao.Text+'%'+#39;

   VS_Comando:= VS_Comando+VS_Comando_Where+' order by '+VS_OrderBy;

   Query_Historico.Close;
   Query_Historico.SQL.Clear;
   Query_Historico.SQL.ADD(VS_Comando);
   Query_Historico.Open;
   Label_NReg.Caption:= 'Qtd. Hospede: '+IntToStr(Query_Historico.RecordCount);
end;

procedure TForm_Auditoria_Historico.ComboBox_SituacaoChange(Sender: TObject);
begin
   Busca_opcao;
end;

procedure TForm_Auditoria_Historico.ComboBox_AnoChange(Sender: TObject);
begin
   Busca_opcao;
end;

procedure TForm_Auditoria_Historico.Table_HistoricoAfterScroll(DataSet: TDataSet);
var
   VR_ValorPago: Real;
begin
   if Table_Historico.FieldByName('TIPO_FECHAMENTO').AsString = 'H'then
      Edit_SituacaoHistorico.Text:= 'Hóspede'
   else
      if Table_Historico.FieldByName('TIPO_FECHAMENTO').AsString = 'F' then
         Edit_SituacaoHistorico.Text:= 'Fechado'
      else
         if Table_Historico.FieldByName('TIPO_FECHAMENTO').AsString = 'C' then
            Edit_SituacaoHistorico.Text:= 'Cancelado'
         else
            if Table_Historico.FieldByName('TIPO_FECHAMENTO').AsString = 'T' then
               Edit_SituacaoHistorico.Text:= 'Tesouraria';

   if Table_PagParcelado.RecordCount = 0 then
   begin
       DBGrid_Parcelado.Visible:= False;
       Panel_TotalGeral.Visible:= False;
   end
   else
   begin
      DBGrid_Parcelado.Visible:= True;
      Panel_TotalGeral.Visible:= True;
      Table_PagParcelado.First;
      While Not Table_PagParcelado.Eof do
      begin
         VR_ValorPago:= VR_ValorPago+Table_PagParcelado.FieldByName('Valor').AsFloat;
         Table_PagParcelado.Next;
      end;
      Panel_TotalGeral.Caption:= FormatFloat('#####0.00' , VR_ValorPago+Table_Historico.FieldByName('VALORPAGO').AsFloat);
   end;

end;

procedure TForm_Auditoria_Historico.DBGrid_HospedeTitleClick(Column: TColumn);
begin
   if column.Title.Caption = 'ANO' then
       VS_OrderBy:= 'a.ano'
   else
      if trim(column.Title.Caption) = 'PRÉDIO' then
          VS_OrderBy:= 'a.Predio'
      else
         if column.Title.Caption = 'APTO' then
            VS_OrderBy:= 'a.Apto'
         else
            if trim(column.Title.Caption) = 'Nº FICHA' then
               VS_OrderBy:= 'a.ficha'
            else
               if column.Title.Caption = 'RECIBO' then
                  VS_OrderBy:= 'a.NRecibo'
               else
                  if trim(column.Title.Caption) = 'NOME' then
                      VS_OrderBy:= 'b.nome'
                  else
                     if column.Title.Caption = 'ENTRADA' then
                        VS_OrderBy:= 'a.DataEntrada'
                     else
                        if column.Title.Caption = 'SAÍDA' then
                           VS_OrderBy:= 'a.DataSaida'
                        else
                           if column.Title.Caption = 'PAGAMENTO' then
                              VS_OrderBy:= 'a.DataPagamento'
                           else
                               if column.Title.Caption = 'IDENTIDADE' then
                                  VS_OrderBy:= 'a.Identidade';
   Busca_opcao;
end;

procedure TForm_Auditoria_Historico.TratarNumero(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9', chr(8)]) then
       key:= #0
end;

procedure TForm_Auditoria_Historico.SpeedButton_ConsultaClick(Sender: TObject);
begin
   Busca_opcao;
end;

procedure TForm_Auditoria_Historico.ToolButton_ReduzClick(Sender: TObject);
begin
   Panel_Campos.Visible:= False;
   ToolButton_Reduz.Visible:= False;
   ToolButton_Amplia.Visible:= True
end;

procedure TForm_Auditoria_Historico.ToolButton_AmpliaClick(Sender: TObject);
begin
   Panel_Campos.Visible:= True;
   ToolButton_Reduz.Visible:= True;
   ToolButton_Amplia.Visible:= False
end;

procedure TForm_Auditoria_Historico.AlterarClick(Sender: TObject);
begin
   VS_Ficha_old:= DBEdit_ficha.Text;
   VS_Ano_old:= DBEdit_Ano.Text;
   Campos(False);
   Alterar.Enabled:= False;
   Gravar.Enabled:= True;
   Cancelar.Enabled:= True;
   Table_Historico.Edit;
   Table_Hospedagem.Edit;
   DBEdit_Ade.SetFocus;

end;

procedure TForm_Auditoria_Historico.GravarClick(Sender: TObject);
begin
   if VS_Ficha_old <> DBEdit_ficha.Text then
   begin
      DBEdit_ficha.Text:= Funcoes.NFicha(DBEdit_ficha.Text);
      Table_Hospedagem.Edit;
      Table_Hospedagem.FieldByName('Ficha').AsString:= DBEdit_ficha.Text;
//      Table_Hospedagem.Post;
   end;

   if VS_Ano_old <> DBEdit_Ano.Text then
   begin
      Table_Hospedagem.Edit;
      Table_Hospedagem.FieldByName('ano').AsString:= DBEdit_Ano.Text;
//      Table_Hospedagem.Post;
   end;

   EditNRECIBO.Text:= Funcoes.NFicha(EditNRECIBO.Text);
   Alterar.Enabled:= True;
   Gravar.Enabled:= False;
   Cancelar.Enabled:= False;


   if Edit_SituacaoHistorico.Text = 'HÓSPEDE' then
      Table_Historico.FieldByName('TIPO_FECHAMENTO').AsString:= 'H'
   else
      if Edit_SituacaoHistorico.Text = 'FECHADO' then
         Table_Historico.FieldByName('TIPO_FECHAMENTO').AsString:= 'F'
      else
         if Edit_SituacaoHistorico.Text = 'CANCELADO' then
            Table_Historico.FieldByName('TIPO_FECHAMENTO').AsString:= 'C'
         else
            if Edit_SituacaoHistorico.Text = 'TESOURARIA' then
               Table_Historico.FieldByName('TIPO_FECHAMENTO').AsString:= 'T';
   Table_Historico.Post;
   Table_Hospedagem.Post;

   Campos(True);
   SpeedButton_ConsultaClick(Sender);
end;

procedure TForm_Auditoria_Historico.CancelarClick(Sender: TObject);
begin
   Alterar.Enabled:= True;
   Gravar.Enabled:= False;
   Cancelar.Enabled:= False;
   Table_Historico.Cancel;
   Campos(True);
   SpeedButton_ConsultaClick(Sender);
end;

procedure TForm_Auditoria_Historico.JvEdit_IdentidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9', chr(8)]) then
      key:= #0
end;

//------------------------------------------------------------------------------
// Tratamento do botao de chamada do EMail
//------------------------------------------------------------------------------

procedure TForm_Auditoria_Historico.SpeedButton_EmailClick(Sender: TObject);
var
    email: string;
begin
  if DBEdit_Email.Text <> '' then
  begin
     email:='mailto:'+DBEdit_Email.Text;         // seu endereço de e-mail
     email:=email+'?subject='+' ';     // assunto
     email:=email+'&body='+' ';       // corpo do e-mail
     ShellExecute(Handle,'open',pchar(email),nil,nil,SW_SHOWNORMAL);
  end
  else
  begin
     Showmessage('O hospede selecionado não possui endereço eletrônico ...');
     DBGrid_Hospede.SetFocus;
  end;
end;

//------------------------------------------------------------------------------
// Habilita os campos para leitura ou nao
//------------------------------------------------------------------------------

procedure TForm_Auditoria_Historico.Campos(Status: Boolean);
begin
    DBEdit_ficha.ReadOnly:= Status;
    DBEdit_Ano.ReadOnly:= Status;
    DBEdit_NomeGuerra.ReadOnly:= Status;
    DBEdit_PostoGraduacao.ReadOnly:= Status;
    DBEdit_DependenteDe.ReadOnly:= Status;
    DBEdit_Nacionalidade.ReadOnly:= Status;
    DBEdit_TelefoneResidencial.ReadOnly:= Status;
    DBEdit_TelefoneFuncional.ReadOnly:= Status;
    DBEdit_TelefoneCelular.ReadOnly:= Status;
    DBEdit_Email.ReadOnly:= Status;
    DBEditOMOrigem.ReadOnly:= Status;
    DBEdit_SituacaoCurso.ReadOnly:= Status;
    DBEdit_DataEntrada.ReadOnly:= Status;
    DBEdit_HoraEntrada.ReadOnly:= Status;
    EditDATAPAGAMENTO.ReadOnly:= Status;
    DBEdit_DataSaida.ReadOnly:= Status;
    DBEdit_Predio.ReadOnly:= Status;
    DBEdit_Apto.ReadOnly:= Status;
    DBEdit_SISCEAB.ReadOnly:= Status;
    Edit_SituacaoHistorico.ReadOnly:= Status;
    EditNRECIBO.ReadOnly:= Status;
    EditPRACA.ReadOnly:= Status;
    EditOBS.ReadOnly:= Status;
    EditBANCO.ReadOnly:= Status;
    EditVALORPAGO.ReadOnly:= Status;
    EditNCHEQUE.ReadOnly:= Status;
    DBEdit17.ReadOnly:= Status;
    DBEdit18.ReadOnly:= Status;
    DBEdit7.ReadOnly:= Status;
    DBEdit22.ReadOnly:= Status;
    DBEdit_CPF.ReadOnly:= Status;
    DBEdit_Cama.ReadOnly:= Status;
    DBEdit_Ade.ReadOnly:= Status;

end;

procedure TForm_Auditoria_Historico.DBGrid_HospedeDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if Query_Historico.FieldByName('TIPO_FECHAMENTO').AsString = 'H' then
      DBGrid_Hospede.Canvas.Font.Color:= clBlack
   else
      if Query_Historico.FieldByName('TIPO_FECHAMENTO').AsString = 'F' then
         DBGrid_Hospede.Canvas.Font.Color:= clNavy
      else
         if Query_Historico.FieldByName('TIPO_FECHAMENTO').AsString = 'C' then
            DBGrid_Hospede.Canvas.Font.Color:= clOlive
         else
            DBGrid_Hospede.Canvas.Font.Color:= clBlack;

   if Query_Historico.FieldByName('DataPagamento').AsString <> '' then
      if Query_Historico.FieldByName('DataPagamento').AsdateTime <> Query_Historico.FieldByName('Data_OPeracao').AsdateTime then
         DBGrid_Hospede.Canvas.Font.Color:= clRed;

  if gdSelected in State then
    DBGrid_Hospede.Canvas.Brush.Color := clSkyBlue;

   DBGrid_Hospede.Canvas.FillRect(Rect);
   DBGrid_Hospede.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm_Auditoria_Historico.Excluir1Click(Sender: TObject);
begin
   if MessageDlg('Confirma a Exclusão do Historico ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Table_Hospede.Delete;
      Table_Historico.Delete;
      SpeedButton_ConsultaClick(Sender);
   end;
end;

procedure TForm_Auditoria_Historico.ToolButton3Click(Sender: TObject);
var
   objExcel,Sheet: Variant;
   cTitulo : string;
   i : integer;
begin
   // Cria uma instancia para utilizar o Excel

   cTitulo := 'Relação de Moradores';
   objExcel := CreateOleObject('Excel.Application');
   objExcel.Visible := True;
   objExcel.Caption := cTitulo;

   // Adiciona planilha(sheet)
   objExcel.Workbooks.Add;
   objExcel.Workbooks[1].Sheets.Add;
   objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;
   Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

   // Preenchendo as Colunas
   Sheet.Range['A1'] := 'ANO';
   Sheet.Range['B1'] := 'PRÉDIO';
   Sheet.Range['C1'] := 'APTO';
   Sheet.Range['D1'] := 'Nº FICHA';
   Sheet.Range['E1'] := 'RECIBO';
   Sheet.Range['F1'] := 'IDENTIDADE';
   Sheet.Range['G1'] := 'CPF';
   Sheet.Range['H1'] := 'NOME';
   Sheet.Range['I1'] := 'ENTRADA';
   Sheet.Range['J1'] := 'SAIDA';
   Sheet.Range['K1'] := 'PAGAMENTO';
   Sheet.Range['L1'] := 'VALOR';
   Sheet.Range['M1'] := 'SISCEAB';
   Sheet.Range['N1'] := 'STATUS';

   // por aqui tu limparias a planilha

   i:= 2;
   Query_Historico.First;
   while not Query_Historico.eof do
   begin
       Sheet.Cells[i,1] := Query_Historico.FieldByName('ano').AsString;
       Sheet.Cells[i,2] := Query_Historico.FieldByName('Predio').AsString;
       Sheet.Cells[i,3] := Query_Historico.FieldByName('Apto').AsString;
       Sheet.Cells[i,4] := Query_Historico.FieldByName('ficha').AsString;
       Sheet.Cells[i,5] := Query_Historico.FieldByName('NRecibo').AsString;
       Sheet.Cells[i,6] := Query_Historico.FieldByName('identidade').AsString;
       Sheet.Cells[i,7] := Query_Historico.FieldByName('cpf').AsString;
       Sheet.Cells[i,8] := Query_Historico.FieldByName('nome').AsString;
       Sheet.Cells[i,9] := Query_Historico.FieldByName('dataEntrada').AsString;
       Sheet.Cells[i,10] := Query_Historico.FieldByName('DataSaida').AsString;
       Sheet.Cells[i,11] := Query_Historico.FieldByName('DataPagamento').AsString;
       Sheet.Cells[i,12] := Table_Historico.FieldByName('ValorPago').AsFloat;
       Sheet.Cells[i,13] := Table_Historico.FieldByName('SISCEAB').AsString;

       if Query_Historico.FieldByName('TIPO_FECHAMENTO').AsString = 'H' then
           Sheet.Cells[i,14] := 'HÓSPEDE'
       else
          if Query_Historico.FieldByName('TIPO_FECHAMENTO').AsString = 'F' then
              Sheet.Cells[i,14] := 'FECHADO'
          else
             if Query_Historico.FieldByName('TIPO_FECHAMENTO').AsString = 'C' then
                 Sheet.Cells[i,14] := 'CANCELADO'
             else
                 Sheet.Cells[i,14] := 'TESOURARIA';

       i:= i+1;
       Query_Historico.Next;
   end;
end;

end.

