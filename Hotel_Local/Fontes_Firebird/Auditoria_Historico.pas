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
  Menus, DB, DBTables, ComCtrls, ToolWin, StdCtrls, Mask, DBCtrls,
  ExtCtrls, JvEdit, Buttons, Grids, DBGrids, Forms, Rotinas, Dialogs,
  JvToolEdit, JvGradient, JvGrdCpt, IBCustomDataSet, IBTable, IBQuery;

type
  TForm_Auditoria_Historico = class(TForm)
    DSQ_Historico: TDataSource;
    DST_Hospede: TDataSource;
    DST_Historico: TDataSource;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    DBGrid_Hospede: TDBGrid;
    Panel6: TPanel;
    DST_Dependente: TDataSource;
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
    Label_Bairro: TLabel;
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
    Bevel1: TBevel;
    JvEdit_Identidade: TJvEdit;
    Label_NReg: TLabel;
    Label1: TLabel;
    DBEdit7: TDBEdit;
    Label16: TLabel;
    DBEdit22: TDBEdit;
    ToolBar2: TToolBar;
    ToolButton_Reduz: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    ToolButton_Ajuda: TToolButton;
    ToolButton_Amplia: TToolButton;
    Label11: TLabel;
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
    DataSource1: TDataSource;
    DBGrid_Parcelado: TDBGrid;
    DST_PagParcelado: TDataSource;
    Panel_TotalGeral: TPanel;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Label7: TLabel;
    DBEdit_ficha: TDBEdit;
    Label9: TLabel;
    DBEdit_Ano: TDBEdit;
    Excluir1: TMenuItem;
    Label17: TLabel;
    DBEdit_CPF: TDBEdit;
    IBQuery_Historico: TIBQuery;
    IBQuery_HistoricoPREDIO: TIBStringField;
    IBQuery_HistoricoAPTO: TSmallintField;
    IBQuery_HistoricoIDENTIDADE: TIBStringField;
    IBQuery_HistoricoNOME: TIBStringField;
    IBQuery_HistoricoFICHA: TIBStringField;
    IBQuery_HistoricoNRECIBO: TIBStringField;
    IBQuery_HistoricoANO: TSmallintField;
    IBQuery_HistoricoDATASAIDA: TDateTimeField;
    IBQuery_HistoricoDATAPAGAMENTO: TDateTimeField;
    IBQuery_HistoricoDATAENTRADA: TDateTimeField;
    IBTable_Historico: TIBTable;
    IBTable_HistoricoIDENTIDADE: TIBStringField;
    IBTable_HistoricoFICHA: TIBStringField;
    IBTable_HistoricoANO: TSmallintField;
    IBTable_HistoricoPREDIO: TIBStringField;
    IBTable_HistoricoAPTO: TSmallintField;
    IBTable_HistoricoHORAENTRADA: TIBStringField;
    IBTable_HistoricoNRECIBO: TIBStringField;
    IBTable_HistoricoBANCO: TIBStringField;
    IBTable_HistoricoNCHEQUE: TIBStringField;
    IBTable_HistoricoPRACA: TIBStringField;
    IBTable_HistoricoVALORPAGO: TIBBCDField;
    IBTable_HistoricoCUSTO_TELEFONE: TIBBCDField;
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
    IBTable_Hospede: TIBTable;
    IBTable_HospedeIDENTIDADE: TIBStringField;
    IBTable_HospedeNOME: TIBStringField;
    IBTable_HospedeNOME_GUERRA: TIBStringField;
    IBTable_HospedePOSTO: TIBStringField;
    IBTable_HospedeDEPENDENTE_DE: TIBStringField;
    IBTable_HospedeNACIONALIDADE: TIBStringField;
    IBTable_HospedeTELEFONE_RESIDENCIAL: TIBStringField;
    IBTable_HospedeTELEFONE_FUNCIONAL: TIBStringField;
    IBTable_HospedeSITUACAO_CURSO: TIBStringField;
    IBTable_HospedeRESIDENCIA: TIBStringField;
    IBTable_HospedeNUMERO: TIBStringField;
    IBTable_HospedeCIDADE: TIBStringField;
    IBTable_HospedeBAIRRO: TIBStringField;
    IBTable_HospedeESTADO: TIBStringField;
    IBTable_HospedeOM_ORIGEM: TIBStringField;
    IBTable_HospedeSITUACAO: TIBStringField;
    IBTable_HospedeOBS: TIBStringField;
    IBTable_Dependente: TIBTable;
    IBTable_DependenteIDENTIDADE: TIBStringField;
    IBTable_DependenteFICHA: TIBStringField;
    IBTable_DependenteANO: TSmallintField;
    IBTable_DependentePREDIO: TIBStringField;
    IBTable_DependenteAPTO: TSmallintField;
    IBTable_DependenteCAMA: TSmallintField;
    IBTable_DependenteNOME: TIBStringField;
    IBTable_Hospedagem: TIBTable;
    IBTable_PagParcelado: TIBTable;
    IBTable_PagParceladoIDENTIDADE: TIBStringField;
    IBTable_PagParceladoFICHA: TIBStringField;
    IBTable_PagParceladoANO: TSmallintField;
    IBTable_PagParceladoDATAPAGAMENTO: TIBStringField;
    IBTable_PagParceladoVALOR: TIBBCDField;
    IBTable_PagParceladoNRECIBO: TIBStringField;
    IBTable_HospedeSEXO: TIBStringField;
    IBTable_HospedeTELEFONE_CELULAR: TIBStringField;
    IBTable_HospedeEMAIL: TIBStringField;
    IBTable_HospedeVEICULO: TIBStringField;
    IBTable_HospedePLACA: TIBStringField;
    IBTable_HospedeCPF: TIBStringField;
    IBTable_HospedagemIDENTIDADE: TIBStringField;
    IBTable_HospedagemFICHA: TIBStringField;
    IBTable_HospedagemANO: TSmallintField;
    IBTable_HospedagemPREDIO: TIBStringField;
    IBTable_HospedagemAPTO: TSmallintField;
    IBTable_HospedagemCAMA: TSmallintField;
    IBTable_HospedagemDATAENTRADA: TIBStringField;
    IBTable_HospedagemHORAENTRADA: TIBStringField;
    IBTable_HospedagemDATASAIDA: TIBStringField;
    IBTable_HospedagemDEPENDENTE: TSmallintField;
    IBTable_HospedagemSITUACAO_HOSPEDAGEM: TIBStringField;
    IBTable_HospedagemRECEBE: TIBStringField;
    IBTable_HospedagemDESCONTO: TIBStringField;
    IBQuery_HistoricoDATA_OPERACAO: TDateTimeField;
    IBQuery_HistoricoTIPO_FECHAMENTO: TIBStringField;

    procedure Campos(Status: Boolean);

    procedure FormCreate(Sender: TObject);
    procedure MaskEdit_HospedeChange(Sender: TObject);
    procedure MaskEdit_FichaChange(Sender: TObject);
    procedure ComboBox_PredioChange(Sender: TObject);
    procedure ComboBox_SituacaoChange(Sender: TObject);
    Procedure Busca_opcao;
    procedure ComboBox_AnoChange(Sender: TObject);
    procedure DBGrid_HospedeTitleClick(Column: TColumn);
    procedure SpeedButton_ConsultaClick(Sender: TObject);

    procedure MaskEdit_AnoKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit_AptoKeyPress(Sender: TObject;var Key: Char);
    procedure MaskEdit_FichaKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit_NReciboKeyPress(Sender: TObject; var Key: Char);
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
    procedure IBTable_HistoricoAfterScroll(DataSet: TDataSet);

  private
    { private declarations }
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
   Funcoes.AlimentaComboBox(ComboBox_Predio, 0, 'Todos');

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
   IBTable_PagParcelado.Open;
   IBTable_Historico.Open;
   IBTable_Hospede.Open;
   IBTable_Dependente.Open;
   IBTable_Hospedagem.Open;

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
   IBQuery_Historico.Close;
   IBTable_Historico.Close;
   IBTable_Hospede.Close;
   IBTable_PagParcelado.Open;
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
   VS_Comando:= 'Select a.ano, a.predio, a.apto, a.Ficha, a.NRecibo, b.nome, a.DataEntrada, a.DataSaida, a.DataPagamento, a.Data_Operacao, a.identidade, a.TIPO_FECHAMENTO '+
                ' from Historico a, hospede b, apartamento p '+
                ' where b.identidade = a.identidade '+
                ' and ((a.predio = p.predio) and (a.apto = p.apto)) ';


   if trim(MaskEdit_Ano.Text) <> '' then
      VS_Comando:= VS_Comando+' and a.ano =  '+#39+trim(MaskEdit_Ano.Text)+#39;

   if trim(ComboBox_Predio.Text) <> '' then
      VS_Comando:= VS_Comando+' and a.Predio =  '+#39+trim(ComboBox_Predio.Text)+#39;

   if trim(MaskEdit_Apto.Text) <> '' then
      VS_Comando:= VS_Comando+' and a.Apto =  '+trim(MaskEdit_Apto.Text);

   if trim(MaskEdit_Ficha.Text) <> '' then
      VS_Comando:= VS_Comando+' and a.Ficha =  '+#39+Funcoes.NFicha(trim(MaskEdit_Ficha.Text))+#39;

   if trim(MaskEdit_NRecibo.Text) <> '' then
      VS_Comando:= VS_Comando+' and a.NRecibo =  '+#39+Funcoes.NFicha(trim(MaskEdit_NRecibo.Text))+#39;

   if trim(MaskEdit_Nome.Text) <> '' then
      VS_Comando:= VS_Comando+' and b.nome like  '+#39+'%'+trim(MaskEdit_Nome.Text)+'%'+#39;

   if trim(JvEdit_Identidade.Text) <> '' then
      VS_Comando:= VS_Comando+' and a.identidade =  '+#39+Funcoes.NIdentidade(trim(JvEdit_Identidade.Text))+#39;

   VS_Comando:= VS_Comando+' order by '+VS_OrderBy;

   IBQuery_Historico.Close;
   IBQuery_Historico.SQL.Clear;
   IBQuery_Historico.SQL.ADD(VS_Comando);
   IBQuery_Historico.Open;
   Label_NReg.Caption:= 'Qtd. Hospede: '+IntToStr(IBQuery_Historico.RecordCount);
end;

procedure TForm_Auditoria_Historico.ComboBox_SituacaoChange(Sender: TObject);
begin
   Busca_opcao;
end;

procedure TForm_Auditoria_Historico.ComboBox_AnoChange(Sender: TObject);
begin
   Busca_opcao;
end;

procedure TForm_Auditoria_Historico.IBTable_HistoricoAfterScroll( DataSet: TDataSet);
var
   VR_ValorPago: Real;
begin
   if IBTable_Historico.FieldByName('TIPO_FECHAMENTO').AsString = 'H'then
      Edit_SituacaoHistorico.Text:= 'Hóspede'
   else
      if IBTable_Historico.FieldByName('TIPO_FECHAMENTO').AsString = 'F' then
         Edit_SituacaoHistorico.Text:= 'Fechado'
      else
         if IBTable_Historico.FieldByName('TIPO_FECHAMENTO').AsString = 'C' then
            Edit_SituacaoHistorico.Text:= 'Cancelado'
         else
            if IBTable_Historico.FieldByName('TIPO_FECHAMENTO').AsString = 'T' then
               Edit_SituacaoHistorico.Text:= 'Tesouraria';

   //--- Calcula o Total Parcelado

   if IBTable_PagParcelado.RecordCount = 0 then
   begin
       DBGrid_Parcelado.Visible:= False;
       Panel_TotalGeral.Visible:= False;
   end
   else
   begin
       DBGrid_Parcelado.Visible:= True;
       Panel_TotalGeral.Visible:= True;
       IBTable_PagParcelado.First;
       While Not IBTable_PagParcelado.Eof do
       begin
          VR_ValorPago:= VR_ValorPago+IBTable_PagParcelado.FieldByName('Valor').AsFloat;
          IBTable_PagParcelado.Next;
       end;
       Panel_TotalGeral.Caption:= FormatFloat('#####0.00' , VR_ValorPago+IBTable_Historico.FieldByName('VALORPAGO').AsFloat);
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

procedure TForm_Auditoria_Historico.MaskEdit_AnoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9', chr(8)]) then
       key:= #0
end;

procedure TForm_Auditoria_Historico.MaskEdit_AptoKeyPress(Sender: TObject;var Key: Char);
begin
  if not (key in['0'..'9', chr(8)]) then
       key:= #0
end;

procedure TForm_Auditoria_Historico.MaskEdit_FichaKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9', chr(8)]) then
       key:= #0
end;

procedure TForm_Auditoria_Historico.MaskEdit_NReciboKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9', 'P', chr(8)]) then
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
   IBTable_Historico.Edit;
   EditNRECIBO.SetFocus;

end;

procedure TForm_Auditoria_Historico.GravarClick(Sender: TObject);
begin
   if VS_Ficha_old <> DBEdit_ficha.Text then
   begin
      DBEdit_ficha.Text:= Funcoes.NFicha(DBEdit_ficha.Text);
      IBTable_Hospedagem.Edit;
      IBTable_Hospedagem.FieldByName('Ficha').AsString:= DBEdit_ficha.Text;
      IBTable_Hospedagem.Post;
      DM.IBTransaction_Hotel.CommitRetaining;
   end;

   if VS_Ano_old <> DBEdit_Ano.Text then
   begin
      IBTable_Hospedagem.Edit;
      IBTable_Hospedagem.FieldByName('ano').AsString:= DBEdit_Ano.Text;
      IBTable_Hospedagem.Post;
      DM.IBTransaction_Hotel.CommitRetaining;
   end;

   EditNRECIBO.Text:= Funcoes.NFicha(EditNRECIBO.Text);
   Alterar.Enabled:= True;
   Gravar.Enabled:= False;
   Cancelar.Enabled:= False;


   if Edit_SituacaoHistorico.Text = 'HÓSPEDE' then
      IBTable_Historico.FieldByName('TIPO_FECHAMENTO').AsString:= 'H'
   else
      if Edit_SituacaoHistorico.Text = 'FECHADO' then
         IBTable_Historico.FieldByName('TIPO_FECHAMENTO').AsString:= 'F'
      else
         if Edit_SituacaoHistorico.Text = 'CANCELADO' then
            IBTable_Historico.FieldByName('TIPO_FECHAMENTO').AsString:= 'C'
         else
            if Edit_SituacaoHistorico.Text = 'TESOURARIA' then
               IBTable_Historico.FieldByName('TIPO_FECHAMENTO').AsString:= 'T';
   IBTable_Historico.Post;
   DM.IBTransaction_Hotel.CommitRetaining;
   Campos(True);

   IBQuery_Historico.Close;
   IBQuery_Historico.Open;
end;

procedure TForm_Auditoria_Historico.CancelarClick(Sender: TObject);
begin
   Alterar.Enabled:= True;
   Gravar.Enabled:= False;
   Cancelar.Enabled:= False;
   IBTable_Historico.Cancel;
   DM.IBTransaction_Hotel.CommitRetaining;
   Campos(True);

   IBQuery_Historico.Close;
   IBQuery_Historico.Open;

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
end;

procedure TForm_Auditoria_Historico.DBGrid_HospedeDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if IBQuery_Historico.FieldByName('TIPO_FECHAMENTO').AsString = 'H' then
      DBGrid_Hospede.Canvas.Font.Color:= clBlack
   else
      if IBQuery_Historico.FieldByName('TIPO_FECHAMENTO').AsString = 'F' then
         DBGrid_Hospede.Canvas.Font.Color:= clNavy
      else
         if IBQuery_Historico.FieldByName('TIPO_FECHAMENTO').AsString = 'C' then
             DBGrid_Hospede.Canvas.Font.Color:= clOlive
         else
            DBGrid_Hospede.Canvas.Font.Color:= clBlack;

   if IBQuery_Historico.FieldByName('DataPagamento').AsString <> '' then
      if IBQuery_Historico.FieldByName('DataPagamento').AsdateTime <> IBQuery_Historico.FieldByName('Data_OPeracao').AsdateTime then
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
      IBTable_Historico.Delete;

      IBQuery_Historico.Close;
      IBQuery_Historico.Open;
   end;
end;

end.
