//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Cad_Hospede.PAS                                //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de tratar do cadas- //
//                             tro dos Hospedes.                              //
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
// ATUALIZADO                : 11/03/2003                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Cad_Hospede;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, Buttons, DBTables, Mask, ExtCtrls, ComCtrls,
  Grids, DBGrids, Rotinas, ToolWin, IBTable, IBCustomDataSet, IBQuery,
  JvLabel, JvBlinkingLabel, JvGradient, JvShape, JvComponent,
  JvCaptionPanel;

type
  TForm_Cad_Hospede = class(TForm)
    Query_Exclui_Reserva: TQuery;
    Panel2: TPanel;
    Query_Busca_Predio: TQuery;
    DST_CadHospede: TDataSource;
    Table_CadHospede: TTable;
    Table_CadHospedeIDENTIDADE: TStringField;
    Table_CadHospedeNOME: TStringField;
    Table_CadHospedeNOME_GUERRA: TStringField;
    Table_CadHospedePOSTO: TStringField;
    Table_CadHospedeDEPENDENTE_DE: TStringField;
    Table_CadHospedeNACIONALIDADE: TStringField;
    Table_CadHospedeSITUACAO_CURSO: TStringField;
    Table_CadHospedeRESIDENCIA: TStringField;
    Table_CadHospedeCIDADE: TStringField;
    Table_CadHospedeBAIRRO: TStringField;
    Table_CadHospedeESTADO: TStringField;
    Table_CadHospedeNUMERO: TStringField;
    Table_CadHospedeOM_ORIGEM: TStringField;
    Table_CadHospedeSITUACAO: TStringField;
    Table_CadHospedeOBS: TStringField;
    Table_CadHospedeEMAIL: TStringField;

    Table_CadHospedagem: TTable;
    Table_CadHospedagemIDENTIDADE: TStringField;
    Table_CadHospedagemFICHA: TStringField;
    Table_CadHospedagemPREDIO: TStringField;
    Table_CadHospedagemAPTO: TFloatField;
    Table_CadHospedagemCAMA: TFloatField;
    Table_CadHospedagemDATAENTRADA: TStringField;
    Table_CadHospedagemHORAENTRADA: TStringField;
    Table_CadHospedagemDATASAIDA: TStringField;
    Table_CadHospedagemDEPENDENTE: TFloatField;
    Table_CadHospedagemSITUACAO_HOSPEDAGEM: TStringField;
    Table_CadHospedagemRECEBE: TStringField;
    Table_CadHospedagemDESCONTO: TStringField;
    Table_CadHospedagemANO: TFloatField;
    DST_CadHospedagem: TDataSource;
    Query_Busca_Hospede: TQuery;
    DSQ_Busca_Hospede: TDataSource;
    Query_Procura: TQuery;
    Table_Historico: TTable;
    Query_Tabela_Posto: TQuery;
    Query_Decea: TQuery;
    Query_DeceaLOCALIDADE: TStringField;
    Query_Cama: TQuery;
    DSQ_Cama: TDataSource;
    Table_Atualiza_Cama: TTable;
    Query_Atualiza_Cama: TQuery;
    DSQ_Atualiza_Cama: TDataSource;
    Table_Atualiza_CamaPREDIO: TStringField;
    Table_Atualiza_CamaAPTO: TFloatField;
    Table_Atualiza_CamaCAMA: TFloatField;
    Table_Atualiza_CamaAPTCODIGO: TStringField;
    Table_Atualiza_CamaNOME: TStringField;
    Panel1: TPanel;
    Table_Ficha: TTable;
    DSQ_Busca_Predio: TDataSource;
    GroupBox_Principal: TGroupBox;
    Query_Sel_Dep: TQuery;
    DSQ_Sel_Dep: TDataSource;
    Table_Dependente: TTable;
    Table_DependenteIDENTIDADE: TStringField;
    Table_DependenteANO: TFloatField;
    Table_DependentePREDIO: TStringField;
    Table_DependenteAPTO: TFloatField;
    Table_DependenteCAMA: TFloatField;
    Table_DependenteNOME: TStringField;
    DST_Dependente: TDataSource;
    Table_CadReserva: TTable;
    Table_CadReservaIDENTIDADE: TStringField;
    Table_CadReservaDATAENTRADA: TDateTimeField;
    Table_CadReservaNOME: TStringField;
    Table_CadReservaNOME_GUERRA: TStringField;
    Table_CadReservaPOSTO: TStringField;
    Table_CadReservaDEPENDENTE_DE: TStringField;
    Table_CadReservaTELEFONE_FUNCIONAL: TStringField;
    Table_CadReservaSITUACAO_CURSO: TStringField;
    Table_CadReservaOM_ORIGEM: TStringField;
    Table_CadReservaDEPENDENTE: TFloatField;
    Table_CadReservaHORAENTRADA: TStringField;
    Table_CadReservaDATASAIDA: TDateTimeField;
    Table_CadReservaPREDIO: TStringField;
    Table_CadReservaAPTO: TFloatField;
    Table_CadReservaCAMA: TFloatField;
    Table_CadReservaRECEBE: TStringField;
    Table_CadReservaUSUARIO: TStringField;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel42: TPanel;
    Panel10: TPanel;
    Panel13: TPanel;
    Panel8: TPanel;
    Panel18: TPanel;
    Panel21: TPanel;
    Panel7: TPanel;
    Panel12: TPanel;
    Panel43: TPanel;
    Panel44: TPanel;
    Panel45: TPanel;
    Panel47: TPanel;
    Panel48: TPanel;
    Panel50: TPanel;
    Panel5: TPanel;
    Panel14: TPanel;
    Table_DependenteFICHA: TStringField;
    StatusBar: TStatusBar;
    IBTable_Apto_Ocupado: TIBTable;
    IBQuery_Verifica_Mapa: TIBQuery;
    IBTable_Hotel: TIBTable;
    IBQuery_Mapa: TIBQuery;
    DSQ_Mapa: TDataSource;
    IBQuery_Delete_Mapa: TIBQuery;
    Query_Monta_Mapa: TQuery;
    DSQ_Monta_Mapa: TDataSource;
    Table_Mapa_Dep: TTable;
    Table_Hospedagem: TTable;
    Table_Reserva: TTable;
    Table_Hospede01: TTable;
    DST_Hospedagem: TDataSource;
    Table_Hospede: TTable;
    DST_Hospede: TDataSource;
    Table_Apto_Ocupado: TTable;
    Table_Apto_OcupadoPREDIO: TStringField;
    Table_Apto_OcupadoAPTO: TFloatField;
    Table_Apto_OcupadoCAMA: TFloatField;
    Table_Apto_OcupadoAPTCODIGO: TStringField;
    Table_Apto_OcupadoNOME: TStringField;
    Table_CadHospedeVEICULO: TStringField;
    Table_CadHospedePLACA: TStringField;
    Table_CadHospedeCPF: TStringField;
    Panel_FichaHospede: TPanel;
    ToolBar_Rodape: TToolBar;
    ToolButton_MostraFicha: TToolButton;
    ToolButton_AmpliaMapa: TToolButton;
    ToolButton2: TToolButton;
    ToolButton_Patentes: TToolButton;
    DBGrid_Mapa: TDBGrid;
    ToolBar2: TToolBar;
    ToolButton_Hospedar: TToolButton;
    ToolButton_Alterar: TToolButton;
    ToolButton_Gravar: TToolButton;
    ToolButton_Cancelar: TToolButton;
    ToolButton_Fechar_Conta: TToolButton;
    ToolButton_Desocupar: TToolButton;
    ToolButton_Tabela_Preco: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    IBTable_Apto_OcupadoPREDIO: TIBStringField;
    IBTable_Apto_OcupadoAPTO: TIntegerField;
    IBTable_Apto_OcupadoCAMA: TIntegerField;
    IBTable_Apto_OcupadoCODIGO: TIBStringField;
    IBTable_Apto_OcupadoRAMAL: TIBStringField;
    IBTable_Apto_OcupadoTV1: TIBStringField;
    IBTable_Apto_OcupadoTV2: TIBStringField;
    IBTable_Apto_OcupadoTIPO: TIBStringField;
    IBTable_Apto_OcupadoSITUACAO: TIBStringField;
    IBTable_Apto_OcupadoSITUACAO_CURSO: TIBStringField;
    IBTable_Apto_OcupadoNOME: TIBStringField;
    IBTable_Apto_OcupadoDATA_ENTRADA: TIBStringField;
    IBTable_Apto_OcupadoDATA_SAIDA: TIBStringField;
    IBTable_Apto_OcupadoIDENTIDADE: TIBStringField;
    JvGradient1: TJvGradient;
    Panel_MostraHospede: TPanel;
    ProgressBar1: TProgressBar;
    SpeedButton_Atualiza_Mapa: TSpeedButton;
    MaskEdit_Busca_Nome_Completo: TMaskEdit;
    MaskEdit_Nome_Guerra: TMaskEdit;
    Label18: TLabel;
    Label19: TLabel;
    ComboBox_Predio: TComboBox;
    Label2: TLabel;
    Label_SelApto: TLabel;
    MaskEdit_Apto: TMaskEdit;
    MaskEdit_Ramal: TMaskEdit;
    Label5: TLabel;
    JvGradient2: TJvGradient;
    DBText1: TDBText;
    Label4: TLabel;
    DBText2: TDBText;
    Label1: TLabel;
    DBText_Nome: TDBText;
    DBText3: TDBText;
    JvGradient3: TJvGradient;
    Label_mome: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label_Telefone_Residencial: TLabel;
    Label13: TLabel;
    Label_Nome_Guerra: TLabel;
    Label10: TLabel;
    Label_Email: TLabel;
    Label12: TLabel;
    Label_Situacao_Curso: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label_Recebimento: TLabel;
    Label_Local_Recebimento: TLabel;
    Label_Ficha_Hospede: TLabel;
    Label_Dependente_de: TLabel;
    Label17: TLabel;
    SpeedButton_Predio: TSpeedButton;
    SpeedButton_Identidade: TSpeedButton;
    SpeedButton_Dependente: TSpeedButton;
    Label_TelefoneCelular: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label20: TLabel;
    MaskEdit_Ficha: TMaskEdit;
    MaskEdit_Nome: TMaskEdit;
    MaskEdit_Nome_de_Guerra: TMaskEdit;
    ComboBox_Posto_Graduacao: TComboBox;
    MaskEdit_Nacionalidade: TMaskEdit;
    MaskEdit_Identidade: TMaskEdit;
    MaskEdit_Telefone_Residencial: TMaskEdit;
    MaskEdit_Telefone_Funcional: TMaskEdit;
    MaskEdit_EMail: TMaskEdit;
    MaskEdit_Hora_Entrada: TMaskEdit;
    ComboBox_Recebimento: TComboBox;
    DateTimePicker_Entrada: TDateTimePicker;
    DateTimePicker_Saida: TDateTimePicker;
    MaskEdit_Dependente: TMaskEdit;
    ComboBox_Dependente_de: TComboBox;
    RadioGroup_Desconto: TRadioGroup;
    ComboBox_OM_Origem: TComboBox;
    ComboBox_Situacao_Curso: TComboBox;
    Edit_Predio: TEdit;
    Edit_Apto: TEdit;
    Panel_Aviso: TPanel;
    JvBlinkingLabel1: TJvBlinkingLabel;
    MaskEdit_Telefone_Celular: TMaskEdit;
    MaskEdit_Veiculo: TMaskEdit;
    MaskEdit_Placa: TMaskEdit;
    MaskEdit_CPF: TMaskEdit;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    Table_CadHospedeTELEFONE_RESIDENCIAL: TStringField;
    Table_CadHospedeTELEFONE_FUNCIONAL: TStringField;
    Table_CadHospedeTELEFONE_CELULAR: TStringField;
    ToolButton_Voucher: TToolButton;
    ToolButton6: TToolButton;
    Table_CadReservaCPF: TStringField;
    Table_FichaFICHA: TStringField;
    SpeedButton_Previa: TSpeedButton;
    Label21: TLabel;
    MaskEdit_Saram: TMaskEdit;
    Table_CadHospedeSARAM: TStringField;
    Label22: TLabel;
    ComboBox_Sisceab: TComboBox;
    Table_CadHospedagemSISCEAB: TStringField;
    Table_CadReservaSISCEAB: TStringField;
    Table_HistoricoIDENTIDADE: TStringField;
    Table_HistoricoFICHA: TStringField;
    Table_HistoricoANO: TFloatField;
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
    Table_HistoricoCUSTO_TELEFONE: TFloatField;
    Table_HistoricoUSUARIO_ENTRADA: TStringField;
    Table_HistoricoSITUACAO_CURSO: TStringField;
    Table_HistoricoUSUARIO_SAIDA: TStringField;
    Table_HistoricoTIPO_FECHAMENTO: TStringField;
    Table_HistoricoRECEBIDO: TStringField;
    Table_HistoricoOBS: TStringField;
    Table_HistoricoHORA_OPERACAO: TStringField;
    Table_HistoricoDATA_OPERACAO: TDateTimeField;
    Table_HistoricoADE: TStringField;
    Table_HistoricoHORASAIDA: TStringField;
    Table_HistoricoSARAM: TStringField;
    Table_HistoricoSISCEAB: TStringField;
    DBNavigator_Hospede: TDBNavigator;
    ToolButton5: TToolButton;
    Query_Reserva: TQuery;
    DSQ_Reserva: TDataSource;
    Panel6: TPanel;
    JvCaptionPanel3: TJvCaptionPanel;
    JvShape5: TJvShape;
    DBNavigator3: TDBNavigator;
    Panel9: TPanel;
    MaskEdit1: TMaskEdit;
    MaskEdit_Predio: TMaskEdit;
    MaskEdit2: TMaskEdit;
    DBGrid_Reserva: TDBGrid;
    JvGradient4: TJvGradient;

    procedure BuscaReserva(Sender: TObject);

    procedure Mostra_Hospede;
    procedure Mostra_Reserva;

    procedure FormCreate(Sender: TObject);

    procedure Botao(Status: Boolean);
    procedure TrataCampos(Status: Boolean);
    procedure Limpar_Caixas_de_Entrada;
    procedure Monta_Posto_Predio;
    procedure FecharTabelas;
    procedure SelecionarDependene;

    procedure MaskEdit_IdentidadeExit(Sender: TObject);
    procedure Table_CadHospedagemPostError(DataSet: TDataSet;E: EDatabaseError; var Action: TDataAction);
    procedure Table_HistoricoPostError(DataSet: TDataSet;E: EDatabaseError; var Action: TDataAction);
    procedure Table_CadHospedePostError(DataSet: TDataSet; E: EDatabaseError;var Action: TDataAction);
    procedure ComboBox_OM_OrigemExit(Sender: TObject);
    Procedure BuscaHospede;

    procedure Monta_Mapa(Situacao: integer);

    procedure DBGrid_MapaDrawColumnCell(Sender: TObject;
     const Rect: TRect; DataCol: Integer; Column: TColumn;State: TGridDrawState);

   procedure ComboBox_PredioChange(Sender: TObject);
   procedure Executa_Query_Monta_Mapa(Query_Monta_Mapa: TQuery;VS_Comando: String);
   procedure Executa_Query_Mapa(VS_Busca: String; VI_Opc: Integer);
   procedure ComboBox_Busca_PredioChange(Sender: TObject);
   procedure ComboBox_PredioKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
   procedure MaskEdit_Busca_Nome_CompletoChange(Sender: TObject);
   procedure MaskEdit_Nome_GuerraChange(Sender: TObject);
   procedure MaskEdit_RamalChange(Sender: TObject);
   procedure SpeedButton_Atualiza_MapaClick(Sender: TObject);
   procedure TrataBotoes_Hospede;
   procedure DBGrid_MapaKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
   procedure Executa_Query_Cama(VS_Comando: String);
   procedure SpeedButton_PredioClick(Sender: TObject);
   procedure Hospedar_Dep(VS_Predio: String; VS_Cama: String; VI_Dep: integer);
   procedure MaskEdit_AptoChange(Sender: TObject);
   procedure SpeedButton_IdentidadeClick(Sender: TObject);
   procedure Cancela_Hospedagem;
   procedure SpeedButton_DependenteClick(Sender: TObject);
   procedure MaskEdit_FichaKeyPress(Sender: TObject; var Key: Char);

   Procedure LimpaMapa;
   procedure Grava_Mapa(VI_Codigo: Integer; VS_Virtual: String; VS_Identidade: String; VS_Predio: String; VS_Apto: String; VS_Cama: String;
                           VS_Ramal: String; VS_TV1: String; VS_TV2: String;
                           VS_CABECALHO: String; VS_Situacao: String;
                           VS_Situacao_Curso: String; VS_Nome: String;
                           VS_DataEntrada: String; VS_DataSaida: String);

    procedure Table_CadHospedagemAfterScroll(DataSet: TDataSet);
    procedure ToolButton_HospedarClick(Sender: TObject);
    procedure ToolButton_AlterarClick(Sender: TObject);
    procedure ToolButton_GravarClick(Sender: TObject);
    procedure ToolButton_CancelarClick(Sender: TObject);
    procedure ToolButton_Fechar_ContaClick(Sender: TObject);
    procedure ToolButton_DesocuparClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton_MostraFichaClick(Sender: TObject);
    procedure ToolButton_AmpliaMapaClick(Sender: TObject);
    procedure MaskEdit_NomeExit(Sender: TObject);
    procedure ToolButton_PatentesClick(Sender: TObject);
    procedure ToolButton_VoucherClick(Sender: TObject);
    procedure Edit_PredioChange(Sender: TObject);
    procedure SpeedButton_PreviaClick(Sender: TObject);
    procedure MaskEdit_AptoEnter(Sender: TObject);
    procedure DBGrid_ReservaTitleClick(Column: TColumn);
  private
    { private declarations }
    VS_OrderBy: String;
  public    { public declarations }
    VB_Tipo_Reserva, VB_Alerta, VB_Achou: Boolean;
    VS_Ant_Depedente, VS_Ant_Cama, VS_Ant_Apto, VS_Ant_Predio: String;
    VS_Nome_Reserva, VS_Predio_Reserva, VS_Apto_Reserva, VS_Cama_Reserva, VS_Data_Entrada_Reserva, VS_Data_Saida_Reserva, VS_Opcao : String;
    VI_Ficha, VI_Codigo: Integer;
  end;

var
  Form_Cad_Hospede: TForm_Cad_Hospede;

implementation

uses Abertura, Divisas, Sel_Recibo, Sel_Apto,Sel_Hospede, Cad_Dependente, Module,
  Voucher, Previsao_Diaria;

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.FormCreate(Sender: TObject);
begin
   if Funcoes.GetCad_Hospede = False then
   begin
      VS_OrderBy:= ' order By Predio, Apto ';

   // Tratamento para limpar os dependentes apartir do apto 9000 - 120/02/19

      DM.Query_ExecutaQuery.Close;
      DM.Query_ExecutaQuery.SQL.Clear;
      DM.Query_ExecutaQuery.Sql.Add('Update aptocama set AptCodigo = '+#39+'DESOCUPADO'+#39+'where aptcodigo = '+#39+'DEP'+#39+' and apto >= 900');
      DM.Query_ExecutaQuery.ExecSQL;

      MaskEdit_Apto.Text:= '';
      Panel_Aviso.Visible:= False;

      VS_Opcao:= 'Inicio';

      // Alimenta os ComboBox de Trabalho

     Funcoes.AlimentaComboBox(ComboBox_Predio, 0, 'Todos', 'Predio.cnf');
     Funcoes.AlimentaComboBox(ComboBox_Situacao_Curso, 0, '', 'SituacaoCurso.cnf');

     //--- Abre as tabelas de trabalho

      Table_CadHospedagem.Open;
      Table_CadHospede.Open;
      Table_CadReserva.Open;
      Table_Historico.Open;
      Table_Dependente.Open;
      Table_Ficha.Open;
      Table_Mapa_Dep.Open;
      IBTable_Apto_Ocupado.Open;

      Table_Hospedagem.Open;
      Table_Hospede.Open;
      Table_Reserva.Open;
      Table_Mapa_Dep.Open;
      Table_Hospede01.Open;

       //---
      //--- Preenche o campo OM de origem

      Query_Decea.Open;
      Query_Decea.First;
      ComboBox_OM_Origem.Items.Clear;
      While not Query_Decea.eof do
      begin
         ComboBox_OM_Origem.Items.Add(Query_Decea.FieldByName('Localidade').AsString);
         Query_Decea.Next;
      end;
      Query_Decea.Close;

       //---
      //--- Verifica o tipo de usuario

      if Funcoes.GetPrivilegio = 'G' then
      begin
         RadioGroup_Desconto.Visible:= True;
         Label_Recebimento.Visible:= True;
         ComboBox_Recebimento.Visible:= True;
         Label_Local_Recebimento.Visible:= True;
      end
      else
      begin
         RadioGroup_Desconto.Visible:= False;
         Label_Recebimento.Visible:= False;
         ComboBox_Recebimento.Visible:= False;
         Label_Local_Recebimento.Visible:= False;
      end;

      Funcoes.SetCad_Hospede(True);
      TrataBotoes_Hospede;
      SpeedButton_Predio.Enabled:= False;
      TrataCampos(True);

      ToolButton_MostraFichaClick(Sender);
      ComboBox_Predio.Text:= ' ';
      statusbar.Panels[2].text:= '  Selecione o Prédio';
      LimpaMapa;
      Executa_Query_Mapa('', 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Inserção de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.ToolButton_HospedarClick(Sender: TObject);
begin
   ComboBox_Situacao_Curso.Style:= csDropDownList;
   ComboBox_SISCEAB.Style:= csDropDownList;
   Panel_Aviso.Visible:= True;
   // Seta a ficha com o numero da ultima ficha

   VB_Tipo_Reserva:= False;
   VB_Alerta:= False;
   VI_Ficha:= Funcoes.MaiorCodigo('Ficha', 'Ficha');
   MaskEdit_Ficha.Text:= Funcoes.NFicha(IntToStr(VI_Ficha));

   // Seta as variaveis inicial

   VS_Ant_Predio:= 'IA';
   VS_Ant_Apto:= '000';
   VS_Ant_Cama:= '0';

   DBGrid_Mapa.Enabled:= False;
   GroupBox_Principal.Enabled:= False;
   VS_Opcao:= 'Hospedar';
   VS_Cama:= IBQuery_Mapa.FieldByName('Cama').AsString;
   Botao( False );
   statusbar.Panels[2].text:= ' Forneça a Identidade do Hospede';

    //---
   //--- Tratamento do cadastro do hospede quando for reserva

   if (IBQuery_Mapa.FieldByName('TIPO').AsInteger = 2) then
   begin
     VB_Tipo_Reserva:= True;
     TrataCampos(False);

     VS_Nome_Reserva:= Table_CadReserva.FieldByName('NOME').AsString;
     VS_Predio_Reserva:= Table_CadReserva.FieldByName('Predio').AsString;
     VS_Apto_Reserva:= Table_CadReserva.FieldByName('Apto').AsString;
     VS_Cama_Reserva:= Table_CadReserva.FieldByName('Cama').AsString;
     VS_Data_Entrada_Reserva:= Table_CadReserva.FieldByName('DataEntrada').AsString;
     VS_Data_Saida_Reserva:= Table_CadReserva.FieldByName('DataSaida').AsString;

     if trim(Table_CadReserva.FieldByName('NOME').AsString) <> '' then
        MaskEdit_Nome.text:= Table_CadReserva.FieldByName('NOME').AsString;

     if trim(Table_CadReserva.FieldByName('NOME_Guerra').AsString) <> '' then
        MaskEdit_Nome_de_Guerra.text:= Table_CadReserva.FieldByName('NOME_Guerra').AsString;

     if trim(Table_CadReserva.FieldByName('CPF').AsString) <> '' then
        MaskEdit_CPF.text:= Table_CadReserva.FieldByName('CPF').AsString;

     if trim(Table_CadReserva.FieldByName('DataEntrada').AsString) <> '' then
        DateTimePicker_Entrada.DateTime:= Table_CadReserva.FieldByName('DataEntrada').AsDateTime;

     if trim(Table_CadReserva.FieldByName('DataSaida').AsString) <> '' then
        DateTimePicker_Saida.DateTime:= Table_CadReserva.FieldByName('DataSaida').AsDateTime;

     if trim(Table_CadReserva.FieldByName('Telefone_Funcional').AsString) <> '' then
        MaskEdit_Telefone_Funcional.Text:= Table_CadReserva.FieldByName('Telefone_Funcional').AsString;

     if trim(Table_CadReserva.FieldByName('Posto').AsString) <> '' then
        ComboBox_Posto_Graduacao.Text:= Table_CadReserva.FieldByName('Posto').AsString;

     if trim(Table_CadReserva.FieldByName('Dependente_de').AsString) <> '' then
        ComboBox_Dependente_de.Text:= Table_CadReserva.FieldByName('Dependente_de').AsString;

     if trim(Table_CadReserva.FieldByName('Situacao_Curso').AsString) <> '' then
        ComboBox_Situacao_Curso.Text:= Table_CadReserva.FieldByName('Situacao_Curso').AsString;

     if trim(Table_CadReserva.FieldByName('OM_Origem').AsString) <> '' then
        ComboBox_OM_Origem.Text:= Table_CadReserva.FieldByName('OM_Origem').AsString;

     if trim(Table_CadReserva.FieldByName('Sisceab').AsString) <> '' then
        ComboBox_Sisceab.Text:= Table_CadReserva.FieldByName('Sisceab').AsString;

   end
   else
   begin
      MaskEdit_Identidade.Clear;
      Limpar_Caixas_de_Entrada;
      Edit_Predio.Text:= IBQuery_Mapa.FieldByName('Predio').AsString;
      Edit_Apto.Text:= IBQuery_Mapa.FieldByName('Apto').AsString;
      ComboBox_SISCEAB.Text:= 'SIM';
   end;
   MaskEdit_Identidade.ReadOnly:= False;
   MaskEdit_Identidade.Enabled:= True;
   MaskEdit_Identidade.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Alteração de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.ToolButton_AlterarClick(Sender: TObject);
begin
   VB_Tipo_Reserva:= False;
   VB_Alerta:= False;
   VS_Opcao:= 'Alterar';
   Botao( False );
   TrataCampos(False);
   SpeedButton_Predio.Enabled:= True;
   Monta_Posto_Predio;

   MaskEdit_Identidade.Enabled:= False;
   SpeedButton_Identidade.Enabled:= False;
   DBGrid_Mapa.Enabled:= False;
   GroupBox_Principal.Enabled:= False;

   // Guarda os dados anteriores do apto

   VS_Predio:= Table_CadHospedagem.FieldByName('PREDIO').AsString;
   VS_Apto:= Table_CadHospedagem.FieldByName('APTO').AsString;
   VS_Cama:= Table_CadHospedagem.FieldByName('CAMA').AsString;

   VS_Ant_Predio:= Table_CadHospedagem.FieldByName('PREDIO').AsString;
   VS_Ant_Apto:= Table_CadHospedagem.FieldByName('APTO').AsString;
   VS_Ant_Cama:= Table_CadHospedagem.FieldByName('CAMA').AsString;
   VS_Ant_Depedente:= Table_CadHospedagem.FieldByName('DEPENDENTE').AsString;
   VS_Cama:= Table_CadHospedagem.FieldByName('CAMA').AsString;

   ComboBox_Situacao_Curso.Style:= csDropDown;
   ComboBox_Situacao_Curso.Text:= Table_CadHospede.FieldByName('SITUACAO_CURSO').AsString;

   statusbar.Panels[2].text:= ' Entre com a alteração necessária.';

   MaskEdit_Nome.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.ToolButton_GravarClick(Sender: TObject);
var
   Qtd_Cama, QtdHospedagem: Integer;
   VS_SQL_Cama, VS_Comando: String;
   VB_Retorno_Cama, VB_Grava: Boolean;
begin
   VB_Alerta:= True;
   VB_Grava:= True;

    //---
   // Analiza a Ficha

   if ((MaskEdit_Identidade.Text = '000000000000') and (VB_Grava = True)) then
   begin
      ShowMessage('É proibido colocar identidade somente zero...'+#13+'Lembre sempre de solicitar a identidade do Hospede');
      VB_Grava:= False;
      MaskEdit_Identidade.SetFocus;
   end;

   if ((MaskEdit_Ficha.Text = '') and (VB_Grava = True))  then
   begin
       MessageDlg('O nº da Ficha não pode ser branco...', mtInformation,[mbOk], 0);
       VB_Grava:= False;
       MaskEdit_Ficha.SetFocus;
   end
   else
   begin
      if ((MaskEdit_Ficha.Text <> '') and (VB_Grava = True))  then
      begin
         MaskEdit_Ficha.Text:= Funcoes.NFicha(MaskEdit_Ficha.Text);
         if VS_Opcao = 'Hospedar' then
         begin
            VS_Comando:= 'Select ficha from hospedagem where Ficha = '+#39+trim(MaskEdit_Ficha.Text)+#39+' and ano = '+Funcoes.AnoAtual;
            if Funcoes.Procura(VS_Comando) = true then
            begin
               MessageDlg('Já existe hospedagem com a Ficha ('+MaskEdit_Ficha.Text+').', mtInformation,[mbOk], 0);
               VB_Grava:= False;
               MaskEdit_Ficha.SetFocus;
            end
            else
            begin
               VS_Comando:= 'Select ficha from historico where Ficha = '+#39+trim(MaskEdit_Ficha.Text)+#39+' and ano = '+Funcoes.AnoAtual;
               if Funcoes.Procura(VS_Comando) = true then
               begin
                  MessageDlg('Já existe hospedagem com a Ficha ('+MaskEdit_Ficha.Text+'), verificar Histórico.', mtInformation,[mbOk], 0);
                  VB_Grava:= False;
                  MaskEdit_Ficha.SetFocus;
               end;
            end;
         end;
      end;
   end;

    //---
   // Analiza o Nome

   if ((MaskEdit_Nome.Text = '') and (VB_Grava = True))  then
   begin
      MessageDlg('O nome não pode ser branco...', mtInformation,[mbOk], 0);
      VB_Grava:= False;
      MaskEdit_Nome.SetFocus;
   end;

    //---
   // Analiza o Nome de Guerra

   if ((MaskEdit_Nome_de_Guerra.Text = '') and (VB_Grava = True))  then
   begin
      MessageDlg('O nome de guerra não pode ser branco...', mtInformation,[mbOk], 0);
      VB_Grava:= False;
      MaskEdit_Nome_de_Guerra.SetFocus;
   end;

    //---
   //--- Analiza o Posto Graduacao

   if ((trim(ComboBox_Dependente_de.Text) = '') and (trim(ComboBox_Posto_Graduacao.Text) = '') and (VB_Grava = True))  then
   begin
      MessageDlg('Não foi escolhido o posto...', mtInformation,[mbOk], 0);
      VB_Grava:= False;
   end
   else
   begin
      if ((trim(ComboBox_Posto_Graduacao.Text) <> '') and (VB_Grava = True))  then
      begin
         VS_Comando:= 'select distinct PostoGraduação from REGRASDEDIARIAS where predio = '+#39+Edit_Predio.Text+#39+' and upper(PostoGraduação) = '+#39+trim(ComboBox_Posto_Graduacao.Text)+#39;
         if Funcoes.Procura(VS_Comando) = False then
         begin
            VS_Comando:= 'select distinct Posto from Residente where upper(Posto) = '+#39+trim(ComboBox_Posto_Graduacao.Text)+#39;
            if Funcoes.Procura(VS_Comando) = False then
            begin
               MessageDlg('O posto deve ser escolhida na lista...', mtInformation,[mbOk], 0);
               VB_Grava:= False;
               ComboBox_Posto_Graduacao.SetFocus;
            end;
         end;
      end
      else
      begin
          //---
         //--- Analisa se foi selecionado o posto graduacao para o proprio e para dependente de

         if ((trim(ComboBox_Dependente_de.Text) <> '') and (trim(ComboBox_Posto_Graduacao.Text) <> '') and (VB_Grava = True))  then
         begin
            MessageDlg('O Posto/Graduação deve ser do próprio ou dependente'+#13+'não pode estar preenchido para o próprio e dependente ao mesmo tempo...', mtInformation,[mbOk], 0);
            ComboBox_Posto_Graduacao.SetFocus;
            VB_Grava:= False;
         end;

          //---
         //--- Analisa Dependente de

         if ((trim(ComboBox_Dependente_de.Text) <> '') and (trim(ComboBox_Posto_Graduacao.Text) = '') and (VB_Grava = True))  then
         begin
            VS_Comando:= 'select distinct PostoGraduação from REGRASDEDIARIAS where predio = '+#39+Edit_Predio.Text+#39+' and upper(PostoGraduação) = '+#39+trim(ComboBox_Posto_Graduacao.Text)+#39;
            if Funcoes.Procura(VS_Comando) = False then
            begin
               VS_Comando:= 'select distinct Posto from Residente where upper(Posto) = '+#39+trim(ComboBox_Posto_Graduacao.Text)+#39;
               if Funcoes.Procura(VS_Comando) = False then
               begin
                  MessageDlg('O posto deve ser escolhida na lista...', mtInformation,[mbOk], 0);
                  VB_Grava:= False;
               end;
            end;
         end;
      end;
   end;

    //---
   //--- Analisa a Nacionalidade

   if ((MaskEdit_Nacionalidade.Text = '') and (VB_Grava = True))  then
   begin
      MessageDlg('A nacionalidade não pode ser branco...', mtInformation,[mbOk], 0);
      VB_Grava:= False;
      MaskEdit_Nacionalidade.SetFocus;
   end;

    //---
   // Analiza o telefone

   if ((MaskEdit_Telefone_Funcional.Text = '') and
       (MaskEdit_Telefone_Residencial.Text = '') and
       (MaskEdit_Telefone_Residencial.Text = '') and
       (VB_Grava = True))  then
   begin
      MessageDlg('É necessário pelo menos um telefone...', mtInformation,[mbOk], 0);
      VB_Grava:= False;
      MaskEdit_Telefone_Residencial.SetFocus;
   end;

    //---
   // Analiza a OM de origem

   if ((ComboBox_OM_Origem.Text = '') and (VB_Grava = True))  then
   begin
      MessageDlg('A OM de origem não pode ser branco...', mtInformation,[mbOk], 0);
      VB_Grava:= False;
      ComboBox_OM_Origem.SetFocus;
   end;

    //---
   // Analiza o Curso

   if ((ComboBox_Situacao_Curso.Text = '') and (VB_Grava = True))  then
   begin
      MessageDlg('A situação do curso não pode ser branco...', mtInformation,[mbOk], 0);
      VB_Grava:= False;
      ComboBox_Situacao_Curso.SetFocus;
   end;


    //---
   // Analiza o SICEAB

   if ((ComboBox_SISCEAB.Text = '') and (VB_Grava = True))  then
   begin
      MessageDlg('A seleção do SISCEAB não pode ser branco...', mtInformation,[mbOk], 0);
      VB_Grava:= False;
      ComboBox_SISCEAB.SetFocus;
   end;

    //---
   // Analiza o Dependente

   if ((MaskEdit_Dependente.Text = '') and (VB_Grava = True))  then
   begin
      MessageDlg('O nº de dependente não pode ser branco...', mtInformation,[mbOk], 0);
      VB_Grava:= False;
      MaskEdit_Dependente.SetFocus;
   end;

    //---
   // tratamento quando a data de entrada for > que a data do sistema

   if ((DateTimePicker_Entrada.date > date+1) and (VB_Grava = True))  then
   begin
      MessageDlg('A data de entrada não pode ser maior que a data do sistema...', mtInformation,[mbOk], 0);
      VB_Grava:= False;
      DateTimePicker_Entrada.SetFocus;
   end;

    //---
   // tratamento quando a data de entrada for maior que a data de saida

   if ((DateTimePicker_entrada.date > DateTimePicker_saida.date) and (VB_Grava = True))  then
   begin
      MessageDlg('A data de entrada não pode ser maior que a data de saída...', mtInformation,[mbOk], 0);
      VB_Grava:= False;
      DateTimePicker_Entrada.SetFocus;
   end;

    //---
   // Analiza a Hora

   if (VB_Grava = True) then
   begin
      if Funcoes.ValidaHora(MaskEdit_Hora_Entrada.Text) = 'IIII' then
      begin
         VB_Grava:= False;
         MaskEdit_Hora_Entrada.SetFocus;
      end;
   end;

    //---
   // Analiza a local de recebimento

   if (ComboBox_Recebimento.Text = '') then
   begin
      MessageDlg('O local de recebimento não pode ser branco...', mtInformation,[mbOk], 0);
      VB_Grava:= False;
   end;

   VB_Retorno_Cama:= True;

    //----------------
   //--- Verifica se existe cama disponivel

   if ((VS_Ant_Predio <> VS_Predio) or (VS_Ant_Apto <> VS_Apto) or (VS_Cama <> VS_Ant_Cama)) then
   begin
       //----------------
      //--- Verifica se existe vaga disponivel

      Funcoes.Log_Recepcao('Cadastro de Hospede - Troca de Apto Origem '+VS_Ant_Predio+' '+VS_Ant_Apto+' '+VS_Ant_Cama+' Para '+VS_Predio+' '+VS_Apto+' '+VS_Cama);
      QtdHospedagem:= 1+StrToInt(MaskEdit_Dependente.Text);   // Soma o numero de hospedagem

      VS_Comando:= 'Select * from AptoCama '+
                   ' Where predio = '+#39+Edit_Predio.Text+#39+
                   ' and Apto = '+#39+Edit_Apto.Text+#39+
                   ' and AptCodigo = '+#39+'DESOCUPADO'+#39;

      Query_Cama.Close;
      Query_Cama.Sql.Clear;
      Query_Cama.Sql.Add(VS_Comando);
      Query_Cama.Open;

      Qtd_Cama:= Query_Cama.RecordCount;                // Soma o numero de camas disponivel do apto

      if QtdHospedagem > Qtd_Cama then
      begin
         VB_Retorno_Cama:= False;
      end
      else
      begin
         VS_Comando:= 'Select * from AptoCama '+
                      ' Where predio = '+#39+Edit_Predio.Text+#39+
                      ' and Apto = '+#39+Edit_Apto.Text+#39+
                      ' and Cama = '+#39+VS_Cama+#39;
         Query_Cama.Close;
         Query_Cama.Sql.Clear;
         Query_Cama.Sql.Add(VS_Comando);
         Query_Cama.Open;

         if ((UpperCase(Query_Cama.fieldByName('AptCodigo').AsString) = 'OCUPADO') or
             (UpperCase(Query_Cama.fieldByName('AptCodigo').AsString) = 'DEP' )) then
         begin
            //-- Tratamento quando a cama estiver ocupada
            VS_Comando:= 'Select * from AptoCama Where (predio = '+#39+Edit_Predio.Text+#39+
                         ' and Apto = '+#39+Edit_Apto.Text+#39+') and Cama <> '+#39+VS_Cama+#39;

            Query_Cama.Close;
            Query_Cama.Sql.Clear;
            Query_Cama.Sql.Add(VS_Comando);
            Query_Cama.Open;

            VS_Cama:= '0';
            VB_Retorno_Cama:= False;
            While ((not Query_Cama.eof) and (VS_Cama = '0'))do
            begin
               if Query_Cama.fieldByName('AptCodigo').AsString = 'DESOCUPADO' then
               begin
                  VS_Cama:= Query_Cama.fieldByName('Cama').AsString;
                  VB_Retorno_Cama:= True;
               end;
               Query_Cama.Next;
            end;
         end;
      end;
   end;

   If VB_Retorno_Cama = False then
   begin
      MessageDlg('O Apartamento selecionado não possui cama disponível ! '+#13+
                 'Selecione outro apartamento.', mtInformation,[mbOk], 0);
      VB_Grava:= False;
   end;

    //---
   //--- Inicia a Gravacao

   if VB_Grava = True then
   begin
       //---
      //--- Gravacao dos dados do Hospede

      ComboBox_Situacao_Curso.Style:= csDropDown;
      Panel_Aviso.Visible:= False;
      if VS_Opcao = 'Hospedar' then
      begin
         if VB_Achou = True then
         begin
            Table_CadHospede.MasterSource:= DSQ_Busca_Hospede;
            Table_CadHospede.Edit;
         end
         else
            Table_CadHospede.Insert;
      end
      else
         Table_CadHospede.Edit;

      Table_CadHospede.FieldByName('NOME').AsString:= MaskEdit_Nome.Text;
      Table_CadHospede.FieldByName('NOME_GUERRA').AsString:= MaskEdit_Nome_de_Guerra.Text;
      Table_CadHospede.FieldByName('POSTO').AsString := UpperCase(ComboBox_Posto_Graduacao.Text);
      Table_CadHospede.FieldByName('DEPENDENTE_DE').AsString := UpperCase(ComboBox_Dependente_de.Text);
      Table_CadHospede.FieldByName('NACIONALIDADE').AsString:= MaskEdit_Nacionalidade.Text;
      Table_CadHospede.FieldByName('IDENTIDADE').AsString:= MaskEdit_Identidade.Text;
      Table_CadHospede.FieldByName('CPF').AsString:= MaskEdit_CPF.Text;
      Table_CadHospede.FieldByName('TELEFONE_RESIDENCIAL').AsString:= MaskEdit_Telefone_Residencial.Text;
      Table_CadHospede.FieldByName('TELEFONE_FUNCIONAL').AsString:= MaskEdit_Telefone_Funcional.Text;
      Table_CadHospede.FieldByName('OM_ORIGEM').AsString:= UpperCase(ComboBox_OM_Origem.Text);
      Table_CadHospede.FieldByName('SITUACAO_CURSO').AsString:= UpperCase(ComboBox_Situacao_Curso.Text);
      Table_CadHospede.FieldByName('TELEFONE_CELULAR').AsString:=  MaskEdit_Telefone_Celular.Text;
      Table_CadHospede.FieldByName('EMAIL').AsString:= MaskEdit_EMail.Text;
      Table_CadHospede.FieldByName('Veiculo').AsString:= MaskEdit_Veiculo.Text;
      Table_CadHospede.FieldByName('Placa').AsString:= MaskEdit_Placa.Text;
      Table_CadHospede.FieldByName('Saram').AsString:= MaskEdit_Saram.Text;

      Table_CadHospede.Post;
      Funcoes.Log_Recepcao('Cadastro de Hospede - '+VS_Opcao+'Hospede '+ MaskEdit_Nome.Text+' Predio = '+VS_Predio);

       //---
      //--- Gravacao dos dados do Historico

      if VS_Opcao = 'Hospedar' then
      begin
         Table_Historico.Insert;
         Table_Historico.FieldByName('USUARIO_ENTRADA').AsString:= Funcoes.GetUsuario;
         Table_Historico.FieldByName('Ano').AsString:= Funcoes.AnoAtual;
      end
      else
      begin
         Table_Historico.Edit;
      end;

       //---
      //--- Grava os dados inciais para o historico

      Table_Historico.FieldByName('IDENTIDADE').AsString:= Trim(MaskEdit_Identidade.Text);
      Table_Historico.FieldByName('FICHA').AsString:= Funcoes.NFicha(Trim(MaskEdit_Ficha.Text));
      Table_Historico.FieldByName('PREDIO').AsString := UpperCase(Edit_Predio.Text);
      Table_Historico.FieldByName('APTO').AsString := UpperCase(Edit_Apto.Text);
      Table_Historico.FieldByName('DATAENTRADA').AsString:= DateToStr(DateTimePicker_Entrada.Date);
      Table_Historico.FieldByName('HORAENTRADA').AsString:= MaskEdit_Hora_Entrada.Text;
      Table_Historico.FieldByName('DATASAIDA').AsString:= DateToStr(DateTimePicker_Saida.Date);
      Table_Historico.FieldByName('TIPO_FECHAMENTO').AsString:= 'H';
      Table_Historico.FieldByName('SITUACAO_CURSO').AsString:= UpperCase(ComboBox_Situacao_Curso.Text);
      Table_Historico.FieldByName('SISCEAB').AsString:= UpperCase(ComboBox_SISCEAB.Text);
      Table_Historico.Post;

       //---
      //--- Gravacao dos dados da Hospedagem

      if VS_Opcao = 'Hospedar' then
      begin
         Table_CadHospedagem.Insert;
         Table_CadHospedagem.FieldByName('Ano').AsString:= Funcoes.AnoAtual;
         Table_CadHospedagem.FieldByName('IDENTIDADE').AsString:= Trim(MaskEdit_Identidade.Text);
      end
      else
         Table_CadHospedagem.Edit;

      Table_CadHospedagem.FieldByName('FICHA').AsString:= Funcoes.NFicha(Trim(MaskEdit_Ficha.Text));
      Table_CadHospedagem.FieldByName('PREDIO').AsString := UpperCase(Edit_Predio.Text);
      Table_CadHospedagem.FieldByName('APTO').AsString := UpperCase(Edit_Apto.Text);
      Table_CadHospedagem.FieldByName('CAMA').AsString:= VS_Cama;

      Table_CadHospedagem.FieldByName('DATAENTRADA').AsString:= DateToStr(DateTimePicker_Entrada.Date);
      Table_CadHospedagem.FieldByName('HORAENTRADA').AsString:= MaskEdit_Hora_Entrada.Text;
      Table_CadHospedagem.FieldByName('DATASAIDA').AsString:= DateToStr(DateTimePicker_Saida.Date);
      Table_CadHospedagem.FieldByName('RECEBE').AsString:= UpperCase(ComboBox_Recebimento.Text);
      Table_CadHospedagem.FieldByName('Dependente').AsString:= MaskEdit_Dependente.Text;
      Table_CadHospedagem.FieldByName('Desconto').AsInteger:= RadioGroup_Desconto.ItemIndex;
      Table_CadHospedagem.FieldByName('SISCEAB').AsString:= UpperCase(ComboBox_SISCEAB.Text);
      Table_CadHospedagem.Post;

      // Tratamento da ocupacao da cama pelo hospede

      VS_Predio:= Edit_Predio.Text;
      VS_Apto:= Edit_Apto.Text;

      if VS_Opcao = 'Hospedar' then
      begin
         VS_SQL_Cama:= 'Update APTOCAMA set AptCodigo = '+#39+'OCUPADO'+#39+
                       ' Where predio = '+#39+VS_Predio+#39+
                       ' and Apto = '+#39+VS_Apto+#39+
                       ' and Cama = '+#39+VS_Cama+#39;
         Executa_Query_Cama(VS_SQL_Cama);

         //--- Verifica se existe dependente

         if StrToInt(MaskEdit_Dependente.Text) > 0 then
            Hospedar_Dep(VS_Predio, VS_Apto, StrToInt(MaskEdit_Dependente.Text));
         end
         else
         begin
            if ((VS_Ant_Predio <> VS_Predio) or (VS_Ant_Apto <> VS_Apto) or (VS_Cama <> VS_Ant_Cama)) then
            begin

               //--- Libera o apto anterior

               VS_SQL_Cama:= 'Update APTOCAMA set AptCodigo = '+#39+'DESOCUPADO'+#39+
                             ' Where predio = '+#39+VS_Ant_Predio+#39+
                             ' and Apto = '+#39+VS_Ant_Apto+#39+
                             ' and Cama = '+#39+VS_Ant_Cama+#39;
               Executa_Query_Cama(VS_SQL_Cama);

               //--- Grava o hospede no novo apto

               VS_SQL_Cama:= 'Update APTOCAMA set AptCodigo = '+#39+'OCUPADO'+#39+
                             ' Where predio = '+#39+VS_Predio+#39+
                             ' and Apto = '+#39+VS_Apto+#39+
                             ' and Cama = '+#39+VS_Cama+#39;
               Executa_Query_Cama(VS_SQL_Cama);
            end;

            //--- Limpa os dependentes anterior, se tiver

            if StrToInt(VS_Ant_Depedente) > 0 then
            begin
               VS_SQL_Cama:= 'Update APTOCAMA set AptCodigo = '+#39+'DESOCUPADO'+#39+
                             ' Where predio = '+#39+VS_Ant_Predio+#39+
                             ' and Apto = '+#39+VS_Ant_Apto+#39+
                             ' and AptCodigo = '+#39+'DEP'+#39;
               Executa_Query_Cama(VS_SQL_Cama);
            end;

            //--- Grava dependente

            if StrToInt(MaskEdit_Dependente.Text) > 0 then
               Hospedar_Dep(VS_Predio, VS_Apto, StrToInt(MaskEdit_Dependente.Text));
         end;

         //--- Atualiza o numero da Ficha na tabela de ficha

         if VS_Opcao = 'Hospedar' then
         begin
            Table_Ficha.First;
            Table_Ficha.Edit;
            Table_Ficha.FieldByName('Ficha').Asinteger:= VI_Ficha;
            Table_Ficha.Post;
         end;

         //--- Exclui reserva quando efetuada hospedagem

         if (VB_Tipo_Reserva = True) then
         begin
            Table_CadReserva.Delete;

{            VS_SQL_Cama:= 'delete from Reserva '+
                          ' Where nome = '+#39+ trim(VS_Nome_Reserva)+#39+
                          ' and predio = '+#39+VS_Predio_Reserva+#39+
                          ' and Apto = '+#39+VS_Apto_Reserva+#39+
                          ' and Cama = '+#39+VS_Cama_Reserva+#39;
            Executa_Query_Cama(VS_SQL_Cama);
}
         end;

         if ((VS_Opcao = 'Hospedar') and (VB_Achou = True)) then
            Table_CadHospede.MasterSource:= DST_CadHospedagem;

         Panel_Aviso.Visible:= False;

         VS_Opcao:= 'Inicio';
         DBGrid_Mapa.Enabled:= True;
         GroupBox_Principal.Enabled:= True;

         TrataBotoes_Hospede;
         TrataCampos(True);
         Monta_Mapa(1);
      end;
end;

//------------------------------------------------------------------------------
//-- Proceduer para tratar do hospedagem de dependentes
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.Hospedar_Dep(VS_Predio: String; VS_Cama: String; VI_Dep: integer);
var
   VI_Cont_Dep: integer;
   VS_Comando: String;
begin
    //---
   //--- Seleciona Dependente

   Query_Sel_Dep.Open;
   if  VS_Opcao = 'Alterar' then
   begin
      VS_Comando:= 'Select * from dependente where ficha = '+#39+Funcoes.NFicha(MaskEdit_Ficha.Text)+#39;
      Query_Sel_Dep.Close;
      Query_Sel_Dep.Sql.Clear;
      Query_Sel_Dep.Sql.Add(VS_Comando);
      Query_Sel_Dep.Open;
      Query_Sel_Dep.First;
   end;

   VI_Cont_Dep:= 1;

   VS_Comando:= 'Select * from aptocama where predio = '+#39+VS_Predio+#39+' and Apto = '+#39+VS_Apto+#39;

   Query_Atualiza_Cama.Close;
   Query_Atualiza_Cama.Sql.Clear;
   Query_Atualiza_Cama.Sql.Add(VS_Comando);
   Query_Atualiza_Cama.Open;
   Table_Atualiza_Cama.Open;

  Query_Atualiza_Cama.First;
  While not Query_Atualiza_Cama.Eof do
  begin
     if ((Table_Atualiza_Cama.FieldByName('AptCodigo').AsString = 'DESOCUPADO') and
         ( VI_Cont_Dep <= VI_Dep)) then
     begin
        Table_Atualiza_Cama.Edit;
        Table_Atualiza_Cama.FieldByName('AptCodigo').AsString:= 'DEP';
        Table_Atualiza_Cama.Post;

        if  VS_Opcao = 'Alterar' then
        begin
           Table_Dependente.Edit;
           Table_Dependente.FieldByName('FICHA').AsString:= UpperCase(MaskEdit_Ficha.Text);
           Table_Dependente.FieldByName('ANO').AsString:= Funcoes.AnoAtual;;
           Table_Dependente.FieldByName('PREDIO').AsString:= UpperCase(Edit_Predio.Text);
           Table_Dependente.FieldByName('APTO').AsString:= UpperCase(Edit_Apto.Text);
           Table_Dependente.FieldByName('CAMA').AsString:= Table_Atualiza_Cama.FieldByName('Cama').AsString;
           Table_Dependente.Post;
           Table_Dependente.Close;
           Table_Dependente.Open;
           if VI_Cont_Dep < VI_Dep then
              Query_Sel_Dep.Next;
        end
        else
        begin
           Table_Dependente.Append;
           Table_Dependente.FieldByName('IDENTIDADE').AsString:= Trim(MaskEdit_Identidade.Text);
           Table_Dependente.FieldByName('FICHA').AsString:= Funcoes.NFicha(Trim(MaskEdit_Ficha.Text));
           Table_Dependente.FieldByName('ANO').AsString:= Funcoes.AnoAtual;
           Table_Dependente.FieldByName('PREDIO').AsString:= UpperCase(Edit_Predio.Text);
           Table_Dependente.FieldByName('APTO').AsString:= UpperCase(Edit_Apto.Text);
           Table_Dependente.FieldByName('CAMA').AsString:= Table_Atualiza_Cama.FieldByName('Cama').AsString;
           Table_Dependente.FieldByName('NOME').AsString:= '';
           Table_Dependente.Post;
           Table_Dependente.Close;
           Table_Dependente.Open;
        end;
        VI_Cont_Dep:= VI_Cont_Dep + 1;
     end;
     Query_Atualiza_Cama.Next;
  end;
  Table_Dependente.Close;
  Table_Dependente.Open;

   if VS_Opcao = 'Hospedar' then
      SelecionarDependene;
end;

//------------------------------------------------------------------------------
// Chamada para form de tratamento do cadastro de dependente
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.SelecionarDependene;
begin
   Query_Sel_Dep.Close;
   Query_Sel_Dep.Sql.Clear;
   Query_Sel_Dep.Sql.Add('Select * from dependente where ficha = '+#39+Funcoes.NFicha(MaskEdit_Ficha.Text)+#39);
   Query_Sel_Dep.Open;
   Form_Cad_Dep_Hospede.ShowModal;
end;

//------------------------------------------------------------------------------
// Procedure para trata da execusao da Query_Cama
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.Executa_Query_Cama(VS_Comando: String);
begin
   Query_Cama.Close;
   Query_Cama.Sql.Clear;
   Query_Cama.Sql.Add(VS_Comando);
   Query_Cama.ExecSql;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.ToolButton_CancelarClick(Sender: TObject);
begin
   ComboBox_Situacao_Curso.Style:= csDropDown;
   statusbar.Panels[2].text:= 'Selecione o Prédio';
   Panel_Aviso.Visible:= False;
   MaskEdit_Ficha.Clear;
   Cancela_Hospedagem;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.Cancela_Hospedagem;
begin
   Table_CadHospedagem.Close;
   Table_CadHospedagem.Open;
   VS_Opcao:= 'Inicio';
   DBGrid_Mapa.Enabled:= True;
   GroupBox_Principal.Enabled:= True;

   TrataBotoes_Hospede;
   TrataCampos(True);
   Monta_Mapa(1);
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.ToolButton_RetornarClick(Sender: TObject);
begin
   FecharTabelas;
   Close;
end;

//------------------------------------------------------------------------------
// Trata da Habilitação e Desabilitação ao acesso aos campos
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.TrataCampos(Status: Boolean);
begin
    MaskEdit_Ficha.ReadOnly:= Status;
    MaskEdit_Nome.ReadOnly:= Status;
    MaskEdit_Nome_de_Guerra.ReadOnly:= Status;
    MaskEdit_Nacionalidade.ReadOnly:= Status;
    MaskEdit_Identidade.ReadOnly:= Status;
    MaskEdit_CPF.ReadOnly:= Status;
    MaskEdit_Telefone_Residencial.ReadOnly:= Status;
    MaskEdit_Telefone_Funcional.ReadOnly:= Status;
    MaskEdit_Hora_Entrada.ReadOnly:= Status;
    MaskEdit_Dependente.ReadOnly:= Status;
    MaskEdit_Telefone_Celular.ReadOnly:= Status;
    MaskEdit_EMail.ReadOnly:= Status;
    MaskEdit_Veiculo.ReadOnly:= Status;
    MaskEdit_Placa.ReadOnly:= Status;
    MaskEdit_Saram.ReadOnly:= Status;
   if Status = False then
      Status:= True
   else
      Status:= False;

   MaskEdit_Identidade.Enabled:= Status;
   MaskEdit_CPF.Enabled:= Status;
   ComboBox_Posto_Graduacao.Enabled:= Status;
   ComboBox_Dependente_de.Enabled:= Status;
   ComboBox_OM_Origem.Enabled:= Status;
   ComboBox_Situacao_Curso.Enabled:= Status;
   ComboBox_SISCEAB.Enabled:= Status;
   DateTimePicker_Entrada.Enabled:= Status;
   DateTimePicker_Saida.Enabled:= Status;
   ComboBox_Recebimento.Enabled:= Status;
   RadioGroup_Desconto.Enabled:= Status;

   if ((VS_Opcao = 'Alterar') and (Funcoes.GetPrivilegio = 'C'))  then
   begin
      MaskEdit_Ficha.Enabled:= True;
      DateTimePicker_Entrada.Enabled:= True;
      DateTimePicker_Saida.Enabled:= True;
      MaskEdit_Hora_Entrada.Enabled:= True;
      RadioGroup_Desconto.Enabled:= True;
   end;
end;

//------------------------------------------------------------------------------
// Trata dos Botoes
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.Botao(Status: Boolean);
begin
   SpeedButton_Dependente.Enabled:= False;

   ToolButton_Hospedar.Enabled:= Status;
   ToolButton_Alterar.Enabled:= Status;
   ToolButton_Fechar_Conta.Enabled:= Status;
   ToolButton_Desocupar.Enabled:= Status;
   ToolButton_Tabela_Preco.Enabled:= Status;
   ToolButton_Retornar.Enabled:= Status;
   ToolButton_Windows.Enabled:= Status;

   if Status = False then
      Status:= True
   else
      Status:= False;

   SpeedButton_Identidade.Enabled:= Status;
   ToolButton_Gravar.Enabled:= Status;
   ToolButton_Cancelar.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Mostra as patentes existentes
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.ToolButton_PatentesClick(Sender: TObject);
begin
  Application.CreateForm(TForm_Divisas, Form_Divisas);
   Form_Divisas.ShowModal;
end;

//------------------------------------------------------------------------------
// Atualiza os dados do hospede
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.Mostra_Hospede;
begin
    if Table_CadHospedagem.Recordcount = 0 then
       Limpar_Caixas_de_Entrada
    else
    begin
       MaskEdit_Ficha.Text:= Table_CadHospedagem.FieldByName('FICHA').AsString;
       MaskEdit_Nome.Text:= Table_CadHospede.FieldByName('NOME').AsString;
       Edit_Predio.Text:= Table_CadHospedagem.FieldByName('PREDIO').AsString;
       Edit_Apto.Text:= Table_CadHospedagem.FieldByName('APTO').AsString;
       MaskEdit_Nome_de_Guerra.Text:= Table_CadHospede.FieldByName('NOME_GUERRA').AsString;
       ComboBox_Posto_Graduacao.Text:= Table_CadHospede.FieldByName('POSTO').AsString;
       ComboBox_Dependente_de.Text:= Table_CadHospede.FieldByName('Dependente_De').AsString;
       MaskEdit_Nacionalidade.Text:= Table_CadHospede.FieldByName('NACIONALIDADE').AsString;
       MaskEdit_Identidade.Text:= Table_CadHospede.FieldByName('IDENTIDADE').AsString;
       MaskEdit_CPF.Text:= Table_CadHospede.FieldByName('CPF').AsString;
       MaskEdit_Telefone_Residencial.Text:= Table_CadHospede.FieldByName('TELEFONE_RESIDENCIAL').AsString;
       MaskEdit_Telefone_Funcional.Text:= Table_CadHospede.FieldByName('TELEFONE_FUNCIONAL').AsString;
       MaskEdit_Telefone_Celular.Text:= Table_CadHospede.FieldByName('TELEFONE_CELULAR').AsString;
       ComboBox_OM_Origem.Text:= Table_CadHospede.FieldByName('OM_ORIGEM').AsString;
       ComboBox_Situacao_Curso.Text:= Table_CadHospede.FieldByName('SITUACAO_CURSO').AsString;
       ComboBox_SISCEAB.Text:= Table_CadHospedagem.FieldByName('SISCEAB').AsString;
       MaskEdit_Hora_Entrada.Text:= Table_CadHospedagem.FieldByName('HORAENTRADA').AsString;
       MaskEdit_Dependente.Text:= Table_CadHospedagem.FieldByName('Dependente').AsString;
       ComboBox_Recebimento.Text:= Table_CadHospedagem.FieldByName('RECEBE').AsString;
       RadioGroup_Desconto.ItemIndex:= Table_CadHospedagem.FieldByName('Desconto').AsInteger;
       MaskEdit_EMail.Text:= Table_CadHospede.FieldByName('EMAIL').AsString;
       MaskEdit_Veiculo.Text:= Table_CadHospede.FieldByName('Veiculo').AsString;
       MaskEdit_Placa.Text:= Table_CadHospede.FieldByName('Placa').AsString;
       MaskEdit_Saram.Text:= Table_CadHospede.FieldByName('Saram').AsString;

       if Trim(Table_CadHospedagem.FieldByName('DATAENTRADA').AsString) = '' then
          DateTimePicker_Entrada.Date:=  Date
       else
          DateTimePicker_Entrada.Date:= StrToDate(Table_CadHospedagem.FieldByName('DATAENTRADA').AsString);

       if Trim(Table_CadHospedagem.FieldByName('DATASAIDA').AsString) = '' then
          DateTimePicker_Saida.Date:=  Date
       else
          DateTimePicker_Saida.Date:= StrToDate(Table_CadHospedagem.FieldByName('DATASAIDA').AsString);

       if MaskEdit_Dependente.Text = '' then
          SpeedButton_Dependente.Enabled:= False
       else
          if StrToInt(MaskEdit_Dependente.Text) = 0 then
             SpeedButton_Dependente.Enabled:= False
          else
             SpeedButton_Dependente.Enabled:= True;
    end;
end;

//------------------------------------------------------------------------------
// Atualiza os dados da reserva
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.Mostra_Reserva;
begin
   MaskEdit_Identidade.Text:= Table_CadReserva.FieldByName('IDENTIDADE').AsString;
   MaskEdit_Nome.Text:= Table_CadReserva.FieldByName('NOME').AsString;
   MaskEdit_Nome_de_Guerra.Text:= Table_CadReserva.FieldByName('NOME_GUERRA').AsString;
   ComboBox_Posto_Graduacao.Text:= Table_CadReserva.FieldByName('POSTO').AsString;
   ComboBox_Dependente_de.Text:= Table_CadReserva.FieldByName('DEPENDENTE_DE').AsString;
   MaskEdit_Telefone_Funcional.Text:= Table_CadReserva.FieldByName('TELEFONE_FUNCIONAL').AsString;
   ComboBox_Situacao_Curso.Text:= Table_CadReserva.FieldByName('SITUACAO_CURSO').AsString;
   ComboBox_SISCEAB.Text:= Table_CadReserva.FieldByName('SISCEAB').AsString;
   MaskEdit_Dependente.Text:= Table_CadReserva.FieldByName('DEPENDENTE').AsString;
   ComboBox_OM_Origem.Text:= Table_CadReserva.FieldByName('OM_ORIGEM').AsString;
   MaskEdit_Hora_Entrada.Text:= Table_CadReserva.FieldByName('HORAENTRADA').AsString;
   Edit_Predio.Text:= Table_CadReserva.FieldByName('PREDIO').AsString;
   Edit_Apto.Text:= Table_CadReserva.FieldByName('APTO').AsString;
   ComboBox_Recebimento.Text:= Table_CadReserva.FieldByName('Recebe').AsString;

   if Trim(Table_CadReserva.FieldByName('DATAENTRADA').AsString) = '' then
      DateTimePicker_Saida.Date:=  Date
   else
      DateTimePicker_Entrada.Date:= StrToDate(Table_CadReserva.FieldByName('DATASAIDA').AsString);

   if Trim(Table_Reserva.FieldByName('DATASAIDA').AsString) = '' then
      DateTimePicker_Saida.Date:=  Date
   else
      DateTimePicker_Saida.Date:= StrToDate(Table_CadReserva.FieldByName('DATASAIDA').AsString);

   MaskEdit_Ficha.Clear;
   MaskEdit_Nacionalidade.Text:= 'BRA';
   MaskEdit_Telefone_Funcional.Clear;
   MaskEdit_Telefone_Celular.Clear;
   MaskEdit_EMail.Text:= '';
   MaskEdit_Veiculo.Text:= '';
   MaskEdit_Placa.Text:= '';
   MaskEdit_Saram.Text:= '';
end;

//------------------------------------------------------------------------------
// Rotina para buscar o hospede quando for pressionado a tecla TAB
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.MaskEdit_IdentidadeExit(Sender: TObject);
begin
   if Trim(MaskEdit_Identidade.Text) <> '' then
      BuscaHospede
   else
   begin
      MaskEdit_Identidade.Text:= Funcoes.NIdentidade(Trim(MaskEdit_Identidade.Text));
      MaskEdit_Ficha.Clear;
      Cancela_Hospedagem;
   end;
end;

//------------------------------------------------------------------------------
// Chamada para form de selecao de hospede
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.SpeedButton_IdentidadeClick(Sender: TObject);
begin
   Form_Sel_Hospede.ShowModal;
   if Funcoes.GetIdentidade = '' then
      MaskEdit_Identidade.SetFocus
   else
   begin
      MaskEdit_Identidade.Text:= Funcoes.GetIdentidade;
      BuscaHospede;
   end;
end;

//------------------------------------------------------------------------------
// Chamada para form de tratamento do cadastro de dependente
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.SpeedButton_DependenteClick(Sender: TObject);
begin
   SelecionarDependene;
   Monta_Mapa(1);
end;

//------------------------------------------------------------------------------
// Rotina para buscar o hospede atraves da identidade
//------------------------------------------------------------------------------

Procedure TForm_Cad_Hospede.BuscaHospede;
var
   Sender: TObject;
   VS_Comando: String;
begin
   if Trim(MaskEdit_Identidade.Text) = '' then
   begin
      ToolButton_CancelarClick(Sender)
   end
   else
   begin
      MaskEdit_Identidade.Text:= Funcoes.NIdentidade(Trim(MaskEdit_Identidade.Text));
      //--- Verifica se o Hospede se existe dados do hospede

      VB_Achou:= False;

      VS_Comando:='Select * from hospede where identidade = '+#39+Trim(MaskEdit_Identidade.Text)+#39;
      Query_Busca_Hospede.Close;
      Query_Busca_Hospede.SQL.Clear;
      Query_Busca_Hospede.SQL.Add(VS_Comando);
      Query_Busca_Hospede.Open;

      if Query_Busca_Hospede.FieldByName('Situacao').AsString = 'I' then
      begin
         MessageDlg('O hóspede '+Query_Busca_Hospede.FieldByName('nome').AsString+' não pode ser hospedado,'+#13+
                    'por ter  '+Query_Busca_Hospede.FieldByName('obs').AsString+#13+#13+
                    'Contate o gerente',mtWarning, [mbOK], 0);
         Limpar_Caixas_de_Entrada;
         VS_Opcao:= '';
         DBGrid_Mapa.Enabled:= True;
         GroupBox_Principal.Enabled:= True;
         TrataBotoes_Hospede;
         TrataCampos(True);
         DBGrid_Mapa.SetFocus
      end
      else
      begin
         if Query_Busca_Hospede.RecordCount = 1 then
         begin
            //--- Tratamento dos campos quando o hospede existir

            MaskEdit_Identidade.Text:= Query_Busca_Hospede.FieldByName('IDENTIDADE').AsString;
            MaskEdit_Nome.Text:= Query_Busca_Hospede.FieldByName('NOME').AsString;
            MaskEdit_Nome_de_Guerra.Text:= Query_Busca_Hospede.FieldByName('NOME_GUERRA').AsString;
            ComboBox_Posto_Graduacao.Text:= Query_Busca_Hospede.FieldByName('POSTO').AsString;
            ComboBox_Dependente_de.Text:= Query_Busca_Hospede.FieldByName('Dependente_De').AsString;
            MaskEdit_Nacionalidade.Text:= Query_Busca_Hospede.FieldByName('NACIONALIDADE').AsString;
            MaskEdit_Telefone_Residencial.Text:= Query_Busca_Hospede.FieldByName('TELEFONE_RESIDENCIAL').AsString;
            MaskEdit_Telefone_Funcional.Text:= Query_Busca_Hospede.FieldByName('TELEFONE_FUNCIONAL').AsString;
            MaskEdit_Telefone_Celular.Text:= Query_Busca_Hospede.FieldByName('TELEFONE_CELULAR').AsString;
            ComboBox_Situacao_Curso.Text:= '';
            ComboBox_SISCEAB.Text:= 'SIM';
            ComboBox_OM_Origem.Text:= Query_Busca_Hospede.FieldByName('OM_ORIGEM').AsString;
            MaskEdit_EMail.Text:= Query_Busca_Hospede.FieldByName('EMAIL').AsString;
            MaskEdit_Veiculo.Text:= Query_Busca_Hospede.FieldByName('Veiculo').AsString;
            MaskEdit_Placa.Text:= Query_Busca_Hospede.FieldByName('Placa').AsString;
            MaskEdit_Saram.Text:= Query_Busca_Hospede.FieldByName('Saram').AsString;
            VB_Achou:= True;
         end;

         SpeedButton_Predio.Enabled:= True;
         SpeedButton_Identidade.Enabled:= False;
         MaskEdit_Identidade.Enabled:= False;
         TrataCampos(False);
         Monta_Posto_Predio;

         statusbar.Panels[2].text:= 'Forneça os Dados do Hóspede';
         MaskEdit_Identidade.Enabled:= False;

         MaskEdit_Ficha.Enabled:= True;
         MaskEdit_Ficha.SetFocus;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Rotina para limpeza das caixa de entrada de dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.Limpar_Caixas_de_Entrada;
Begin
   MaskEdit_Identidade.Text:= '';
   Edit_Predio.Text:= '';
   Edit_Apto.Text:= '';
   ComboBox_Recebimento.Text:= '';

   if VS_Opcao <> 'Hospedar' then
       MaskEdit_Ficha.Clear;

   MaskEdit_CPF.Clear;
   MaskEdit_Nome.Clear;
   MaskEdit_Nome_de_Guerra.Clear;
   ComboBox_Posto_Graduacao.Clear;
   ComboBox_Dependente_de.Clear;
   MaskEdit_Nacionalidade.Text:= 'BRA';
   MaskEdit_Telefone_Residencial.Clear;
   MaskEdit_Telefone_Funcional.Clear;
   MaskEdit_Telefone_Celular.Clear;
   ComboBox_OM_Origem.Text:= '';
   ComboBox_Situacao_Curso.Text:= '';
   ComboBox_SISCEAB.Text:= 'SIM';
   MaskEdit_Dependente.Text:= '0';

   Edit_Predio.Text:= '';
   Edit_Apto.Text:= '';
   MaskEdit_Hora_Entrada.Clear;
   ComboBox_Recebimento.Text:= 'H';
   DateTimePicker_Entrada.Date:= Date;
   DateTimePicker_Saida.Date:= Date;
   RadioGroup_Desconto.ItemIndex:= 0;
   MaskEdit_EMail.Text:= '';
   MaskEdit_Veiculo.Text:= '';
   MaskEdit_Placa.Text:= '';
   MaskEdit_Saram.Text:= '';
end;

//------------------------------------------------------------------------------
// Tratamento de Erro no arquivo de hospedagem
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.Table_CadHospedagemPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
    if (E is EDBEngineError) then
       if (E as EDBEngineError).Errors[0].ErrorCode = 9729 then
       begin
          MessageDlg('O hóspede '+MaskEdit_Nome.Text+#13+' já esta hospedado, '+#13+
                     'Verifique na lista de hóspede ou contate o gerente...'+#13+#13+
                     'OBS: Este erro ocorre quando se tenta cadastrar um hóspede que já esta hospedado',mtWarning, [mbOK], 0);
          Abort;
          MaskEdit_Nome.SetFocus;
       end;
end;

//------------------------------------------------------------------------------
// Tratamento de Erro no arquivo de historico
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.Table_HistoricoPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
    if (E is EDBEngineError) then
       if (E as EDBEngineError).Errors[0].ErrorCode = 9729 then
       begin
          MessageDlg('O hóspede '+MaskEdit_Nome.Text+#13+' com a Ficha '+
          MaskEdit_Ficha.Text+' já foi hospedado, e sua conta já foi fechada e'+#13+
          'encontra-se no historico de hospedagem...'+#13+#13+
          'Contate o gerente para solucionar o problema'+#13+#13+
          'OBS: Este erro ocorre quando o hóspede já foi cadastrado e sua conta foi encerrada,'+#13+
          'os casos mais frequentes são aqueles que saem do hotel no final de semana e não fecha a conta,'+#13+
          'e o cassineiro desavisado fecha a conta do mesmo, para maior esclarecimento entrar em contado'+#13+
          'com o gerente ou o responsável.',
          mtWarning, [mbOK], 0);
          Abort;
          MaskEdit_Nome.SetFocus;
       end;
end;

//------------------------------------------------------------------------------
// Tratamento de Erro no arquivo de hospede
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.Table_CadHospedePostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
   if (E is EDBEngineError) then
      if (E as EDBEngineError).Errors[0].ErrorCode = 9729 then
      begin
         MessageDlg('O hóspede '+MaskEdit_Nome.Text+#13+' já encontra-se na lista de Hóspede...'+#13+#13+
                    'Contate o gerente',mtWarning, [mbOK], 0);
         Limpar_Caixas_de_Entrada;
         Abort;
         MaskEdit_Nome.SetFocus;
      end;
end;

//------------------------------------------------------------------------------
// Verifica se o hospede possui desconto por ser do DECEA
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.ComboBox_OM_OrigemExit(Sender: TObject);
var
   VS_Comando: String;
begin
   if ((RadioGroup_Desconto.ItemIndex = 1) and (VS_Opcao = 'Hospedar')) then
   begin
      VS_Comando:= 'Select * from Tabela_Decea where Localidade = '+#39+trim(ComboBox_OM_Origem.Text)+#39;
      if Funcoes.Procura(VS_Comando) = True then
         RadioGroup_Desconto.ItemIndex:= 0;
   end;
end;

//------------------------------------------------------------------------------
// Monta o comboBox de tratamento de Posto Graduacao, Dependente de e Apto
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.Monta_Posto_Predio;
begin
   Query_Busca_Predio.Close;
   Query_Busca_Predio.SQL.Clear;
   Query_Busca_Predio.SQL.ADD('select distinct PostoGraduação from REGRASDEDIARIAS where predio = '+#39+Edit_Predio.Text+#39);
   Query_Busca_Predio.Open;

   ComboBox_Posto_Graduacao.Items.Clear;   // Limpa os postos do combo Posto Graduacao
   ComboBox_Dependente_de.Items.Clear;   // Limpa os postos do Combo Dependente de
   Query_Busca_Predio.First;
   While not Query_Busca_Predio.Eof do
   begin
      ComboBox_Posto_Graduacao.Items.Add(Query_Busca_Predio.FieldByName('POSTOGRADUAÇÃO').AsString);
      ComboBox_Dependente_de.Items.Add(Query_Busca_Predio.FieldByName('POSTOGRADUAÇÃO').AsString);
      Query_Busca_Predio.Next;
   end;
end;

//------------------------------------------------------------------------------
// Procedure com a finalidade de fechar as tabelas abertas
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.FecharTabelas;
begin
   Query_Busca_Hospede.Close;

   Table_Hospede.Close;
   Table_Hospedagem.Close;
   Table_CadHospede.Close;
   Table_CadHospedagem.Close;
   Table_Historico.Close;

   Close;
end;


//------------------------------------------------------------------------------
//
// Modulos para tratamento do Mapa de Ocupacao
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Monta o mapa de ocupacao
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.Monta_Mapa(Situacao: integer);
var
   VS_Comando: String;
   VI_Codigo: Integer;
   VS_Predio, VS_Apto, VS_Privilegio, VS_Situacao: String;
begin
   statusbar.Panels[0].text := ' '+ TimeToStr(Time);

   //---
   // Monta o Mapa

   MaskEdit_Nome_Guerra.Text:= '';
   MaskEdit_Ramal.Text:= '';
   MaskEdit_Busca_Nome_Completo.Text:= '';

     //---
    //--- Limpa a tabela de mapa

    VS_Privilegio:= Funcoes.GetPrivilegio;
    VI_Codigo:= 0;
    LimpaMapa;

     //---
    //--- Montagem do Mapa de Ocupacao  - Hospedagem / Reserva / Dependente


    if ComboBox_Predio.Text = 'Todos' then
       VS_Comando:= 'select ap.predio, ap.apto, ap.ramal, ap.tv1, ap.tv2, ap.virtual, ac.cama, ac.aptcodigo, ac.nome '+
                    'from apartamento ap, aptocama ac '+
                    'where (ap.predio = ac.predio and ap.apto = ac.apto) '+
                    ' and ap.visivel = '+#39+'S'+#39
    else       // selecao por apto
       VS_Comando:= 'select ap.predio, ap.apto, ap.ramal, ap.tv1, ap.tv2, ap.virtual, ac.cama, ac.aptcodigo, ac.nome '+
                    'from apartamento ap, aptocama ac '+
                    'where (ap.predio = ac.predio and ap.apto = ac.apto) '+
                    ' and ap.visivel = '+#39+'S'+#39+
                    ' and ap.predio = '+#39+ComboBox_Predio.Text+#39;

    if ((VS_Privilegio <> 'G') and (VS_Privilegio <> 'U')) then
       VS_Comando:= VS_Comando+' and ap.virtual = '+#39+'N'+#39;

    VS_Comando:= VS_Comando+' order by ap.predio, ap.apto, ac.cama';

    Executa_Query_Monta_Mapa(Query_Monta_Mapa, VS_Comando);
    ProgressBar1.Max:= Query_Monta_Mapa.RecordCount;

    VS_Predio:= '';
    VS_Apto:= '';

    While not Query_Monta_Mapa.Eof do
    begin
       ProgressBar1.StepBy(1);
       Update;

       //---
       //--- Monta o cabecalho

       if (( VS_Predio <> Query_Monta_Mapa.FieldByName('PREDIO').AsString) or
           ( VS_Apto <> Query_Monta_Mapa.FieldByName('apto').AsString)) then
       begin
          VS_Predio:=Query_Monta_Mapa.FieldByName('PREDIO').AsString;
          VS_Apto:=  Query_Monta_Mapa.FieldByName('apto').AsString;
          VI_Codigo:= VI_Codigo + 1;

          Grava_Mapa(VI_Codigo,
                     Query_Monta_Mapa.FieldByName('virtual').AsString,
                     ' ',
                     Query_Monta_Mapa.FieldByName('PREDIO').AsString,
                     Query_Monta_Mapa.FieldByName('APTO').AsString,
                     '0',
                     Query_Monta_Mapa.FieldByName('RAMAL').AsString,
                     ' ',
                     ' ',
                     CABECALHO,
                     Query_Monta_Mapa.FieldByName('PREDIO').AsString+'    '+
                        Query_Monta_Mapa.FieldByName('APTO').AsString+'    R. '+
                        Query_Monta_Mapa.FieldByName('RAMAL').AsString+'    -    '+
                        Query_Monta_Mapa.FieldByName('TV1').AsString+'  '+
                        Query_Monta_Mapa.FieldByName('TV2').AsString,
                     ' ',
                     ' ',
                     ' ',
                     ' '
                    );
       end;

       if Table_Reserva.RecordCount > 0 then
       begin
          VI_Codigo:= VI_Codigo + 1;

          if Table_Reserva.FieldByName('nome_guerra').AsString = '' then
             VS_Situacao:= Query_Monta_Mapa.FieldByName('cama').AsString+' - '+
                           trim(Table_Reserva.FieldByName('Posto').AsString)+' '+
                           copy(Table_Reserva.FieldByName('nome').AsString,1,15)
          else
             VS_Situacao:= Query_Monta_Mapa.FieldByName('cama').AsString+' - '+
                           trim(Table_Reserva.FieldByName('Posto').AsString)+' '+
                           Table_Reserva.FieldByName('nome_guerra').AsString;

          Grava_Mapa( VI_Codigo,
                      Query_Monta_Mapa.FieldByName('virtual').AsString,
                      Table_Reserva.FieldByName('Identidade').AsString,
                      Query_Monta_Mapa.FieldByName('PREDIO').AsString,
                      Query_Monta_Mapa.FieldByName('apto').AsString,
                      Query_Monta_Mapa.FieldByName('cama').AsString,
                      Query_Monta_Mapa.FieldByName('Ramal').AsString,
                      ' ',
                      ' ',
                      RESERVA,
                      VS_Situacao,
                      Table_Reserva.FieldByName('situacao_curso').AsString,
                      Table_Reserva.FieldByName('nome').AsString,
                      Table_Reserva.FieldByName('dataentrada').AsString,
                      Table_Reserva.FieldByName('datasaida').AsString
                    );
       end;

        //---
       //--- Tratamento quando tiver hospode

       if Trim(AnsiUpperCase(Query_Monta_Mapa.FieldByName('APTCODIGO').AsString)) = 'OCUPADO' then
       begin
          Table_Hospedagem.First;
          While not Table_Hospedagem.Eof do
          begin
             VI_Codigo:= VI_Codigo + 1;
             if Table_Hospede.RecordCount = 0 then
             begin
                Grava_Mapa(VI_Codigo,
                            Query_Monta_Mapa.FieldByName('virtual').AsString,
                            Table_Hospede.FieldByName('Identidade').AsString,
                            Query_Monta_Mapa.FieldByName('PREDIO').AsString,
                            Query_Monta_Mapa.FieldByName('apto').AsString,
                            Query_Monta_Mapa.FieldByName('cama').AsString,
                            Query_Monta_Mapa.FieldByName('Ramal').AsString,
                            ' ',
                            ' ',
                            OCUPADO,
                            Query_Monta_Mapa.FieldByName('cama').AsString+' - '+Trim(Query_Monta_Mapa.FieldByName('Nome').AsString),
                            'OCUPADO',
                            Query_Monta_Mapa.FieldByName('NOME').AsString,
                            ' ',
                            ' '
                           );
             end
             else
             begin
                Grava_Mapa(VI_Codigo,
                            Query_Monta_Mapa.FieldByName('virtual').AsString,
                            Table_Hospede.FieldByName('Identidade').AsString,
                            Query_Monta_Mapa.FieldByName('PREDIO').AsString,
                            Query_Monta_Mapa.FieldByName('apto').AsString,
                            Query_Monta_Mapa.FieldByName('cama').AsString,
                            Query_Monta_Mapa.FieldByName('Ramal').AsString,
                            ' ',
                            ' ',
                            OCUPADO,
                            Query_Monta_Mapa.FieldByName('Cama').AsString+' - '+
                               trim(Table_Hospede.FieldByName('Posto').AsString)+' '+
                               Table_Hospede.FieldByName('NOME_GUERRA').AsString,
                            Table_Hospede.FieldByName('situacao_curso').AsString,
                            Table_Hospede.FieldByName('nome').AsString,
                            Table_Hospedagem.FieldByName('DataEntrada').AsString,
                            Table_Hospedagem.FieldByName('DataSaida').AsString
                           );
             end;
             Table_Hospedagem.Next;
             if VS_Privilegio = 'C' then
                 Break;
          end;
       end
       else
       begin
           //---
          //--- DEPENDENTE DE HOSPEDE

          if Trim(Query_Monta_Mapa.FieldByName('APTCODIGO').AsString) = 'DEP' then
          begin
             VI_Codigo:= VI_Codigo + 1;
             Grava_Mapa(VI_Codigo,
                        Query_Monta_Mapa.FieldByName('virtual').AsString,
                        ' ',
                        Query_Monta_Mapa.FieldByName('PREDIO').AsString,
                        Query_Monta_Mapa.FieldByName('apto').AsString,
                        Query_Monta_Mapa.FieldByName('cama').AsString,
                        Query_Monta_Mapa.FieldByName('Ramal').AsString,
                        ' ',
                        ' ',
                        OCUPADO,
                        Query_Monta_Mapa.FieldByName('cama').AsString+' - DEP - '+Table_Mapa_Dep.FieldByName('Nome').AsString,
                        'DEPENDENTE',
                        'DEP - '+Table_Mapa_Dep.FieldByName('Nome').AsString,
                        ' ',
                        ' '
                        );
          end
          else
          begin     //--- DESOCUPADO
             if Trim(Query_Monta_Mapa.FieldByName('APTCODIGO').AsString) = 'DESOCUPADO' then
             begin
                VI_Codigo:= VI_Codigo + 1;
                Grava_Mapa(VI_Codigo,
                           Query_Monta_Mapa.FieldByName('virtual').AsString,
                           ' ',
                           Query_Monta_Mapa.FieldByName('PREDIO').AsString,
                           Query_Monta_Mapa.FieldByName('apto').AsString,
                           Query_Monta_Mapa.FieldByName('cama').AsString,
                           Query_Monta_Mapa.FieldByName('Ramal').AsString,
                           ' ',
                           ' ',
                           DESOCUPADO,
                           Query_Monta_Mapa.FieldByName('cama').AsString+' - DESOCUPADO',
                           ' ',
                           ' ',
                           ' ',
                           ' '
                          );
             end
             else
             begin
               if Query_Monta_Mapa.FieldByName('NOME').AsString = 'NÃO DESOCUPADO' then
               begin
                  VI_Codigo:= VI_Codigo + 1;
                  Grava_Mapa(VI_Codigo,
                             Query_Monta_Mapa.FieldByName('virtual').AsString,
                             ' ',
                             Query_Monta_Mapa.FieldByName('PREDIO').AsString,
                             Query_Monta_Mapa.FieldByName('apto').AsString,
                             Query_Monta_Mapa.FieldByName('cama').AsString,
                             Query_Monta_Mapa.FieldByName('Ramal').AsString,
                             ' ',
                             ' ',
                             NAODESOCUPADO,
                             Query_Monta_Mapa.FieldByName('cama').AsString+' - '+Trim(Table_Hospede01.FieldByName('Posto').AsString)+' - '+Trim(Table_Hospede01.FieldByName('Nome_Guerra').AsString),
                             Table_Hospede01.FieldByName('SITUACAO_CURSO').AsString,
                             Table_Hospede01.FieldByName('NOME').AsString,
                             ' ',
                             ' '
                           );
               end
               else
               begin
                  if Query_Monta_Mapa.FieldByName('APTCODIGO').AsString = 'NÃO OCUPAR' then
                  begin
                     VI_Codigo:= VI_Codigo + 1;
                     Grava_Mapa(VI_Codigo,
                                Query_Monta_Mapa.FieldByName('virtual').AsString,
                                ' ',
                                Query_Monta_Mapa.FieldByName('PREDIO').AsString,
                                Query_Monta_Mapa.FieldByName('apto').AsString,
                                Query_Monta_Mapa.FieldByName('cama').AsString,
                                Query_Monta_Mapa.FieldByName('Ramal').AsString,
                                ' ',
                                ' ',
                                NAOOCUPAR,
                                Query_Monta_Mapa.FieldByName('cama').AsString+' - '+Trim(Query_Monta_Mapa.FieldByName('Nome').AsString),
                                'NÃO OCUPAR',
                                Query_Monta_Mapa.FieldByName('NOME').AsString,
                                ' ',
                                ' '
                                );
                  end;
               end;
             end;
          end;
       end;
       Query_Monta_Mapa.Next;
    end;

    DM.IBTransaction_HotelLocal.Commit;

    Executa_Query_Mapa('', 0);
    ProgressBar1.Position:= 0;
    statusbar.Panels[1].text := ' '+ TimeToStr(Time);
    statusbar.Panels[2].text:= 'Selecione o Prédio';
    DBGrid_Mapa.SetFocus;
end;



//------------------------------------------------------------------------------
// Monta query de consulta para montagem do mapa
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.Executa_Query_Monta_Mapa(Query_Monta_Mapa: TQuery;VS_Comando: String);
begin
   Query_Monta_Mapa.Close;
   Query_Monta_Mapa.Sql.Clear;
   Query_Monta_Mapa.Sql.Add(VS_Comando);
   Query_Monta_Mapa.Open;
end;

//------------------------------------------------------------------------------
// Atualizacao do mapa quando for trocado o predio
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.ComboBox_PredioChange(Sender: TObject);
begin
   Monta_Mapa(1);
end;

//------------------------------------------------------------------------------
// Procedure de tratamento de cor para cada situacao
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.DBGrid_MapaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if IBQuery_Mapa.FieldByName('Tipo').AsString = '3' then     // Desocupado
   begin
      DBGrid_Mapa.Canvas.Brush.Color:= clInfoBk;
      DBGrid_Mapa.Canvas.Font.Color:= clBlack;
   end
   else
   begin
      if (IBQuery_Mapa.FieldByName('Tipo').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Mapa.Canvas.Brush.Color:= clSilver;
         DBGrid_Mapa.Canvas.Font.Color:= clBlack;
      end
      else
      begin
         if (IBQuery_Mapa.FieldByName('Tipo').AsString = '1') then   // Ocupado
         begin
            if (IBQuery_Mapa.FieldByName('Data_Saida').AsString = '' ) then
            begin
               DBGrid_Mapa.Canvas.Brush.Color:= clTeal;
               DBGrid_Mapa.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if (StrToDate(IBQuery_Mapa.FieldByName('Data_Saida').AsString) < date ) then
               begin
                  DBGrid_Mapa.Canvas.Brush.Color:= clAqua;
                  DBGrid_Mapa.Canvas.Font.Color:= clBlack;
               end
               else
               begin
                  DBGrid_Mapa.Canvas.Brush.Color:= clTeal;
                  DBGrid_Mapa.Canvas.Font.Color:= clWhite;
               end;
            end;
         end
         else
         begin
            if IBQuery_Mapa.FieldByName('Tipo').AsString = '2' then   // Reserva
            begin
               DBGrid_Mapa.Canvas.Brush.Color:= clRed;
               DBGrid_Mapa.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Mapa.FieldByName('Tipo').AsString = '4' then  // Não Desocupado
               begin
                  DBGrid_Mapa.Canvas.Brush.Color:= clBlue;
                  DBGrid_Mapa.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Mapa.FieldByName('Tipo').AsString = '5' then   // NAO OCUPAR
                  begin
                     DBGrid_Mapa.Canvas.Brush.Color:= clYellow;
                     DBGrid_Mapa.Canvas.Font.Color:= clBlack;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Mapa.Canvas.FillRect(Rect);
      DBGrid_Mapa.Canvas.TextOut(Rect.Left+2,Rect.Top,Column.Field.AsString);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento de selecao do opcao de procura de hospede
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.Executa_Query_Mapa(VS_Busca: String; VI_Opc: Integer);
var
   VS_Comando: String;
begin
   VS_Comando:= 'select Identidade, codigo, predio, apto, cama, ramal, nome, tipo, situacao, situacao_curso, data_entrada, Data_Saida from mapa';
   if trim(VS_Busca) <> '' then
   begin
      case VI_Opc of
         1: begin
               VS_Comando:= VS_Comando+' where ramal like '+#39+'%'+VS_Busca+'%'+#39;
            end;
         2: begin
               VS_Comando:= VS_Comando+' where situacao like '+#39+'%'+VS_Busca+'%'+#39;
            end;
         3: begin
               VS_Comando:= VS_Comando+' where nome like '+#39+'%'+VS_Busca+'%'+#39;
            end;
         4: begin
               VS_Comando:= VS_Comando+' where apto = '+VS_Busca;
            end;
      end;
   end;
   VS_Comando:= VS_Comando+' order by predio, apto, cama ';

   IBQuery_Mapa.Close;
   IBQuery_Mapa.Sql.Clear;
   IBQuery_Mapa.Sql.Add(VS_Comando);
   IBQuery_Mapa.Open;
end;

//------------------------------------------------------------------------------
// Atualizacao do mapa quando for trocado o predio
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.ComboBox_Busca_PredioChange(Sender: TObject);
begin
   Monta_Mapa(1);
end;

procedure TForm_Cad_Hospede.ComboBox_PredioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (chr(Key) in ['L', 'l']) then
    MASKEDIT_NOME.SetFocus;
end;

//------------------------------------------------------------------------------
// Procedure para procurar Hospede por Predio
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.MaskEdit_AptoChange(Sender: TObject);
begin
   MaskEdit_Ramal.Text:= '';
   MaskEdit_Nome_Guerra.Text:= '';
   MaskEdit_Busca_Nome_Completo.Text:= '';
   Executa_Query_Mapa(MaskEdit_Apto.Text, 4);
end;

//------------------------------------------------------------------------------
// Procedure para procurar Hospede por nome Completo
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.MaskEdit_Busca_Nome_CompletoChange(Sender: TObject);
begin
   MaskEdit_Nome_Guerra.Text:= '';
   MaskEdit_Ramal.Text:= '';
   MaskEdit_Apto.Text:= '';
   Executa_Query_Mapa(MaskEdit_Busca_Nome_Completo.Text, 3);
end;

//------------------------------------------------------------------------------
// Procedure para procurar Hospede por nome de Guerra
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.MaskEdit_Nome_GuerraChange(Sender: TObject);
begin
   MaskEdit_Busca_Nome_Completo.Text:= '';
   MaskEdit_Ramal.Text:= '';
   MaskEdit_Apto.Text:= '';
   Executa_Query_Mapa(MaskEdit_Nome_Guerra.Text, 2 );
end;

//------------------------------------------------------------------------------
// Procedure para procurar Hospede por Ramal
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.MaskEdit_RamalChange(Sender: TObject);
begin
   MaskEdit_Nome_Guerra.Text:= '';
   MaskEdit_Busca_Nome_Completo.Text:= '';
   MaskEdit_Apto.Text:= '';
   Executa_Query_Mapa(MaskEdit_ramal.Text, 1);
end;

//------------------------------------------------------------------------------
// Tratamento do botao Atualizacao do Mapa
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.SpeedButton_Atualiza_MapaClick(Sender: TObject);
begin
   Monta_Mapa(1);
end;

//------------------------------------------------------------------------------
// Tratamento quando muda de hospede
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.Table_CadHospedagemAfterScroll( DataSet: TDataSet);
begin
   if Funcoes.GetCad_Hospede = True then
      TrataBotoes_Hospede;
end;

//------------------------------------------------------------------------------
// Procedure para tratar dos botoes de reserva e cancelamento habilitando e
// desabilitando quando necessario
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.TrataBotoes_Hospede;
begin
   if VS_Opcao = 'Inicio' then
   begin
      ToolButton_Hospedar.Enabled:= False;
      ToolButton_Alterar.Enabled:= False;
      ToolButton_Fechar_Conta.Enabled:= False;
      ToolButton_Voucher.Enabled:= False;
      ToolButton_Desocupar.Enabled:= False;
      SpeedButton_Identidade.Enabled:= False;
      SpeedButton_Dependente.Enabled:= False;
      SpeedButton_Predio.Enabled:= False;
      ToolButton_Gravar.Enabled:= False;
      ToolButton_Cancelar.Enabled:= False;
      ToolButton_Tabela_Preco.Enabled:= True;
      ToolButton_Retornar.Enabled:= True;
      ToolButton_Windows.Enabled:= True;

      Limpar_Caixas_de_Entrada;

      if IBQuery_Mapa.RecordCount > 0 then
      begin
         if (IBQuery_Mapa.FieldByName('TIPO').AsInteger = 1) then
         begin
            if IBQuery_Mapa.FieldByName('situacao_curso').AsString <> 'DEPENDENTE' then
            begin
               ToolButton_Alterar.Enabled:= True;
               ToolButton_Fechar_Conta.Enabled:= True;
               ToolButton_Voucher.Enabled:= True;
               Mostra_Hospede;
            end;
         end
         else
         begin
            if (IBQuery_Mapa.FieldByName('TIPO').AsInteger = 4) then
            begin
               ToolButton_Desocupar.Enabled:= True;
            end
            else
            begin
               if IBQuery_Mapa.FieldByName('TIPO').AsInteger = 2 then   // Reserva
               begin
                  MaskEdit_Identidade.Text:= '';
                  ToolButton_Hospedar.Enabled:= True;
                  Mostra_Reserva;
               end
               else
               begin
                  if IBQuery_Mapa.FieldByName('TIPO').AsInteger = 3 then   // Desocupado
                  begin
                     MaskEdit_Identidade.Text:= '';
                     ToolButton_Hospedar.Enabled:= True;
                  end;
               end;
            end;
         end;
      end;
   end;
end;

procedure TForm_Cad_Hospede.DBGrid_MapaKeyDown(Sender: TObject;var Key: Word; Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (chr(Key) in ['L', 'l']) then
    MASKEDIT_NOME.SetFocus;
end;

procedure TForm_Cad_Hospede.ToolButton_Fechar_ContaClick(Sender: TObject);
begin
   Form_Fecha_Conta.ShowModal;
   DBGrid_Mapa.SetFocus;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da desocupacao
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.ToolButton_DesocuparClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao('Desocupação do Prédio '+Table_Apto_Ocupado.FieldByName('Predio').AsString+' Apto '+Table_Apto_Ocupado.FieldByName('Apt').AsString+' Cama '+Table_Apto_Ocupado.FieldByName('Cama').AsString);
   Table_Apto_Ocupado.Open;
   Table_Apto_Ocupado.Edit;
   Table_Apto_Ocupado.FieldByName('AptCodigo').AsString:= 'DESOCUPADO';;
   Table_Apto_Ocupado.Post;
   Funcoes.Log_Recepcao('Cadastro de Hospede - Descupar Predio = '+VS_Predio);
   Monta_Mapa(1);
end;

//------------------------------------------------------------------------------
// Tratamento quendo for pressionado o botao de selecao do predio
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.SpeedButton_PredioClick(Sender: TObject);
begin
   Funcoes.SetPredio(IBQuery_Mapa.FieldByName('Predio').AsString);
   Funcoes.SetApto(IBQuery_Mapa.FieldByName('Apto').AsString);
   Funcoes.SetCama(IBQuery_Mapa.FieldByName('Cama').AsString);

   Form_Sel_Predio.ShowModal;

   Edit_Predio.Text:= Funcoes.GetPredio;
   Edit_Apto.Text:= Funcoes.GetApto;
   VS_Cama:= Funcoes.GetCama;
   Monta_Posto_Predio
end;

//------------------------------------------------------------------------------
// Tratamento para permitir que seja digitado somente n. na caixa de edicao da ficha
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.MaskEdit_FichaKeyPress(Sender: TObject;var Key: Char);
begin
   if not (Key in['0'..'9',Chr(8)]) then Key:= #0;
end;

//------------------------------------------------------------------------------
// Verifica se o arquivo para montar o mapa existe
//------------------------------------------------------------------------------

Procedure TForm_Cad_Hospede.LimpaMapa;
begin
    if FileExists('C:\DataBase_ICEA\DB_HotelMapa\HOTELMAPA.GDB') = True then
    begin
       IBQuery_Delete_Mapa.ExecSQL;
       DM.IBTransaction_HotelLocal.Commit;
       IBTable_Hotel.Close;
       IBTable_Hotel.Open;
    end
    else
    begin
        MessageDlg('O Arquivo C:\DataBase_ICEA\DB_HotelMapa\HOTELMAPA.GDB, foi apagado, '+#13+'favor entrar em contato como o administrador ...',mtError, [mbOk],0);
        Application.Terminate;
    end;
end;

//------------------------------------------------------------------------------
// Grava os dados do Mapa
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.Grava_Mapa(VI_Codigo: Integer; VS_Virtual: String; VS_Identidade: String; VS_Predio: String; VS_Apto: String; VS_Cama: String;
                           VS_Ramal: String; VS_TV1: String; VS_TV2: String;
                           VS_CABECALHO: String; VS_Situacao: String;
                           VS_Situacao_Curso: String; VS_Nome: String;
                           VS_DataEntrada: String; VS_DataSaida: String);
begin
   IBTable_Hotel.Append;
   IBTable_Hotel.FieldByName('Codigo').AsInteger:= VI_Codigo;
   IBTable_Hotel.FieldByName('Identidade').AsString:= VS_Identidade;
   IBTable_Hotel.FieldByName('predio').AsString:= VS_Predio;
   IBTable_Hotel.FieldByName('apto').AsString:= VS_Apto;
   IBTable_Hotel.FieldByName('cama').AsString:= VS_Cama;
   IBTable_Hotel.FieldByName('ramal').AsString:= VS_Ramal;
   IBTable_Hotel.FieldByName('tv1').AsString:= VS_TV1;
   IBTable_Hotel.FieldByName('tv2').AsString:= VS_TV2;
   IBTable_Hotel.FieldByName('tipo').AsString:= VS_CABECALHO;
   IBTable_Hotel.FieldByName('situacao').AsString:= VS_Situacao;
   IBTable_Hotel.FieldByName('situacao_curso').AsString:= VS_Situacao_Curso;
   IBTable_Hotel.FieldByName('nome').AsString:= VS_Nome;
   if trim(VS_DataEntrada) <> '' then
      IBTable_Hotel.FieldByName('data_entrada').AsString:= VS_DataEntrada;
   if trim(VS_DataSaida) <> '' then
      IBTable_Hotel.FieldByName('data_saida').AsString:= VS_DataSaida;
   IBTable_Hotel.Post;
end;

//------------------------------------------------------------------------------
// Mostra a Ficha do Hospede
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.ToolButton_MostraFichaClick(Sender: TObject);
begin
   Panel_FichaHospede.Visible:= True;
   ToolButton_MostraFicha.Visible:= False;
   ToolButton_AmpliaMapa.Visible:= True;
end;

//------------------------------------------------------------------------------
// Amplia o Mapa de Hospede
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.ToolButton_AmpliaMapaClick(Sender: TObject);
begin
   Panel_FichaHospede.Visible:= False;
   ToolButton_MostraFicha.Visible:= True;
   ToolButton_AmpliaMapa.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento da saida da entrada do Nome
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.MaskEdit_NomeExit(Sender: TObject);
begin
   MaskEdit_Nome_de_Guerra.SetFocus;
end;

procedure TForm_Cad_Hospede.ToolButton_VoucherClick(Sender: TObject);
begin
    Form_Cad_Voucher.ShowModal;
end;

procedure TForm_Cad_Hospede.Edit_PredioChange(Sender: TObject);
begin
   Monta_Posto_Predio;
end;

procedure TForm_Cad_Hospede.SpeedButton_PreviaClick(Sender: TObject);
begin
   Form_Previsao_Diaria.ShowModal;
end;

procedure TForm_Cad_Hospede.MaskEdit_AptoEnter(Sender: TObject);
begin
   MaskEdit_Apto.SelectAll;
end;

//------------------------------------------------------------------------------
// Procedure com a finalidade de procurar a reserva desejada
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.BuscaReserva(Sender: TObject);
Var
   VS_Where, VS_Comando: String;
begin
   VS_Where:= '';
   VS_Comando:= 'Select * from reserva';

   if trim(MaskEdit_Nome.Text) <> '' then
      VS_Where:= ' Where nome like '+#39+'%'+MaskEdit_Nome.Text+'%'+#39;

   if trim(MaskEdit_Predio.Text) <> '' then
   begin
     if VS_Where = '' then
        VS_Where:= ' Where predio like '+#39+'%'+MaskEdit_Predio.Text+'%'+#39
     else
        VS_Where:= ' and predio like '+#39+'%'+MaskEdit_Predio.Text+'%'+#39;
   end;

   if trim(MaskEdit_Apto.Text) <> '' then
   begin
     if VS_Where = '' then
        VS_Where:= ' Where apto like '+#39+'%'+MaskEdit_Apto.Text+'%'+#39
     else
        VS_Where:= ' and apto like '+#39+'%'+MaskEdit_Apto.Text+'%'+#39

   end;

   VS_Comando:= VS_Comando+VS_Where+VS_OrderBy;

   Query_Reserva.Close;
   Query_Reserva.SQL.Clear;
   Query_Reserva.SQL.ADD(VS_Comando);
   Query_Reserva.Open;
end;

procedure TForm_Cad_Hospede.DBGrid_ReservaTitleClick(Column: TColumn);
var
   Sender: TObject;
begin
   VS_OrderBy:= ' ';

   if (column.Title.Caption = 'PREDIO' ) then
       VS_OrderBy:= ' order By Predio, Apto '
   else
     if trim(column.Title.Caption) = 'APTO' then
         VS_OrderBy:= ' order by Apto'
     else
        if trim(column.Title.Caption) = 'N O M E' then
            VS_OrderBy:= ' order by Nome, Predio, Apto '
        else
           if trim(column.Title.Caption) = 'ENTRADA' then
              VS_OrderBy:= ' order by DataEntrada, Predio, Apto ';

   BuscaReserva(Sender);
end;

end.

