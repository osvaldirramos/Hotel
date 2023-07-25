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
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, Grids, DBGrids, Mask, ExtCtrls,
  Buttons, ComCtrls, Rotinas, Menus, Dialogs, JvToolEdit, JvEdit, ToolWin,
  JvGradient, JvGrdCpt, IBCustomDataSet, IBTable, IBQuery;

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
    PopupMenu_Deletar: TPopupMenu;
    Deletar1: TMenuItem;
    Panel_Campos: TPanel;
    JvGradient1: TJvGradient;
    EditOBS: TDBEdit;
    Label25: TLabel;
    Label22: TLabel;
    EditPRACA: TDBEdit;
    Label19: TLabel;
    EditNRECIBO: TDBEdit;
    Label7: TLabel;
    DBEdit19: TDBEdit;
    Label28: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    Label13: TLabel;
    DBEdit14: TDBEdit;
    Label_Situacao_Curso: TLabel;
    DBEdit15: TDBEdit;
    Label27: TLabel;
    DBEdit2: TDBEdit;
    EditDATAPAGAMENTO: TDBEdit;
    Label14: TLabel;
    Label2: TLabel;
    Edit_Tipo_Fechamento: TEdit;
    EditNCHEQUE: TDBEdit;
    Label21: TLabel;
    EditBANCO: TDBEdit;
    Label20: TLabel;
    Label23: TLabel;
    EditVALORPAGO: TDBEdit;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    DBEdit13: TDBEdit;
    Label_Cidade: TLabel;
    Label_Bairro: TLabel;
    Label11: TLabel;
    Label_Telefone_Residencial: TLabel;
    Label6: TLabel;
    Label_Nome_Guerra: TLabel;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit16: TDBEdit;
    Label9: TLabel;
    DBEdit11: TDBEdit;
    Label_Numero: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    Label15: TLabel;
    DBEdit21: TDBEdit;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    Label12: TLabel;
    DBEdit20: TDBEdit;
    SpeedButton_Consulta: TSpeedButton;
    MaskEdit_Nome: TJvEdit;
    MaskEdit_NRecibo: TJvEdit;
    MaskEdit_Ficha: TJvEdit;
    MaskEdit_Apto: TJvEdit;
    ComboBox_Predio: TComboBox;
    MaskEdit_Ano: TJvEdit;
    PopupMenu_Alterar: TPopupMenu;
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
    IBQuery_Historico: TIBQuery;
    IBQuery_HistoricoPREDIO: TIBStringField;
    IBQuery_HistoricoAPTO: TSmallintField;
    IBQuery_HistoricoIDENTIDADE: TIBStringField;
    IBQuery_HistoricoNOME: TIBStringField;
    IBQuery_HistoricoFICHA: TIBStringField;
    IBQuery_HistoricoNRECIBO: TIBStringField;
    IBQuery_HistoricoANO: TSmallintField;
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
    IBTable_Hospede: TIBTable;
    IBTable_Dependente: TIBTable;
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
    IBTable_DependenteIDENTIDADE: TIBStringField;
    IBTable_DependenteFICHA: TIBStringField;
    IBTable_DependenteANO: TSmallintField;
    IBTable_DependentePREDIO: TIBStringField;
    IBTable_DependenteAPTO: TSmallintField;
    IBTable_DependenteCAMA: TSmallintField;
    IBTable_DependenteNOME: TIBStringField;
    ToolBar2: TToolBar;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    ToolButton_Amplia: TToolButton;
    ToolButton_Detalhes: TToolButton;
    ToolButton_Ajuda: TToolButton;
    IBQuery_HistoricoDATASAIDA: TDateTimeField;
    IBQuery_HistoricoDATAPAGAMENTO: TDateTimeField;
    IBQuery_HistoricoDATAENTRADA: TDateTimeField;
    IBTable_HistoricoDATAENTRADA: TDateTimeField;
    IBTable_HistoricoDATASAIDA: TDateTimeField;
    IBTable_HistoricoDATAPAGAMENTO: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure MaskEdit_HospedeChange(Sender: TObject);
    procedure MaskEdit_FichaChange(Sender: TObject);
    procedure ComboBox_PredioChange(Sender: TObject);
    procedure ComboBox_SituacaoChange(Sender: TObject);
    Procedure Busca_opcao;
    procedure ComboBox_AnoChange(Sender: TObject);
    procedure DBGrid_HospedeTitleClick(Column: TColumn);
    procedure Deletar1Click(Sender: TObject);
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
    procedure ToolButton_DetalhesClick(Sender: TObject);
    procedure ToolButton_AmpliaClick(Sender: TObject);
    procedure IBTable_HistoricoAfterScroll(DataSet: TDataSet);

  private
    { private declarations }
  public    { public declarations }
     VS_OrderBy: String;

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
begin
   Funcoes.AlimentaComboBox(ComboBox_Predio, 1, '');

   Panel_Campos.Visible:= True;
   ToolButton_Amplia.Visible:= True;
   ToolButton_Detalhes.Visible:= False;

   //---
   // Tratamento das opcoes para altera numero do recibo

   Alterar.Enabled:= true;
   Gravar.Enabled:= False;
   Cancelar.Enabled:= False;

   VS_OrderBy:= 'a.Ano';
   MaskEdit_Ano.Text:= Funcoes.AnoAtual;
   IBTable_Historico.Open;
   IBTable_Hospede.Open;
   IBTable_Dependente.Open;
   Panel_Campos.Enabled:= False;
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
   VS_Comando:= 'Select a.ano, a.predio, a.apto, a.Ficha, a.NRecibo, b.nome, a.DataEntrada, a.DataSaida, a.DataPagamento, a.identidade '+
                ' from Historico a, hospede b '+
                ' where b.identidade = a.identidade ';

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

procedure TForm_Auditoria_Historico.IBTable_HistoricoAfterScroll(DataSet: TDataSet);
begin
   if IBTable_Historico.FieldByName('TIPO_FECHAMENTO').AsString = 'H'then
      Edit_Tipo_Fechamento.Text:= 'Hóspede'
   else
      if IBTable_Historico.FieldByName('TIPO_FECHAMENTO').AsString = 'F' then
         Edit_Tipo_Fechamento.Text:= 'Fechado'
      else
         if IBTable_Historico.FieldByName('TIPO_FECHAMENTO').AsString = 'C' then
            Edit_Tipo_Fechamento.Text:= 'Cancelado'
         else
            if IBTable_Historico.FieldByName('TIPO_FECHAMENTO').AsString = 'T' then
               Edit_Tipo_Fechamento.Text:= 'Tesouraria'
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

procedure TForm_Auditoria_Historico.Deletar1Click(Sender: TObject);
begin
   if MessageDlg('Confirma a exclusão do hospede do historico ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      IBTable_Historico.Delete;
      DM.IBTransaction_Hotel.CommitRetaining;
      Busca_opcao;
   end;
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
  if not (key in['0'..'9', chr(8)]) then
      key:= #0
end;

procedure TForm_Auditoria_Historico.SpeedButton_ConsultaClick(Sender: TObject);
begin
   Busca_opcao;
end;

procedure TForm_Auditoria_Historico.ToolButton_AmpliaClick(Sender: TObject);
begin
   Panel_Campos.Visible:= False;
   ToolButton_Amplia.Visible:= False;
   ToolButton_Detalhes.Visible:= True
end;

procedure TForm_Auditoria_Historico.ToolButton_DetalhesClick(Sender: TObject);
begin
   Panel_Campos.Visible:= True;
   ToolButton_Amplia.Visible:= True;
   ToolButton_Detalhes.Visible:= False
end;

procedure TForm_Auditoria_Historico.AlterarClick(Sender: TObject);
begin
   Panel_Campos.Enabled:= True;
   Alterar.Enabled:= False;
   Gravar.Enabled:= True;
   Cancelar.Enabled:= True;
   IBTable_Historico.Edit;
   EditNRECIBO.SetFocus;

end;

procedure TForm_Auditoria_Historico.GravarClick(Sender: TObject);
begin
   EditNRECIBO.Text:= Funcoes.NFicha(EditNRECIBO.Text);
   Alterar.Enabled:= True;
   Gravar.Enabled:= False;
   Cancelar.Enabled:= False;
   IBTable_Historico.Post;
   DM.IBTransaction_Hotel.CommitRetaining;
   Panel_Campos.Enabled:= False;

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
   Panel_Campos.Enabled:= False;

   IBQuery_Historico.Close;
   IBQuery_Historico.Open;

end;

procedure TForm_Auditoria_Historico.JvEdit_IdentidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9', chr(8)]) then
      key:= #0
end;


end.
