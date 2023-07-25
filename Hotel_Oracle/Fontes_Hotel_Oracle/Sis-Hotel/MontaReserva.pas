//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Cad_Reserva.PAS                                //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de tratar do Mapa   //
//                             de Reserva e do cadastro das Reservas.         //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 11/11/1999                                     //
//                                                                            //
// ATUALIZADO                : 11/11/2003                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      : 29/09/2020                                     //
// AUTOR                     : Osvaldir                                       //
// MOTIVO                    : Inserção do modulo de Cadastro de Reserva, uni-//
//                             ficando o Mapa e o cadastro de Reserva.        //   
//----------------------------------------------------------------------------//

unit MontaReserva;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBTable, ExtCtrls, Grids, DBGrids, IBQuery,
  StdCtrls, DBCtrls, ComCtrls, Mask, Buttons, JvGradient, JvComponent,
  JvxClock, jpeg, ToolWin, DBTables, Rotinas, JvCaptionPanel, PsyRichEdit,
  RichPrint, JvGradientCaption, JvTransBtn, JvLookOut, JvShape;

type
  TForm_MontaReserva = class(TForm)
    IBQuery_Delete_Mapa: TIBQuery;
    IBQuery_Mapa: TIBQuery;
    IBTable_Hotel: TIBTable;
    DSQ_Mapa: TDataSource;
    StatusBar: TStatusBar;
    IBQuery_Delete_Visao: TIBQuery;
    IBQuery_Visao: TIBQuery;
    DSQ_Visao: TDataSource;
    IBTable_Mostrar: TIBTable;
    DST_Mostrar: TDataSource;
    DST_Visao: TDataSource;
    IBTable_Visao: TIBTable;
    IBTable_VisaoCODIGO: TIBStringField;
    IBTable_VisaoPREDIO: TIBStringField;
    IBTable_VisaoAPTO: TIntegerField;
    IBTable_VisaoDIA01: TIBStringField;
    IBTable_VisaoTIPO01: TIBStringField;
    IBTable_VisaoDIA02: TIBStringField;
    IBTable_VisaoTIPO02: TIBStringField;
    IBTable_VisaoDIA03: TIBStringField;
    IBTable_VisaoTIPO03: TIBStringField;
    IBTable_VisaoDIA04: TIBStringField;
    IBTable_VisaoTIPO04: TIBStringField;
    IBTable_VisaoDIA05: TIBStringField;
    IBTable_VisaoTIPO05: TIBStringField;
    IBTable_VisaoDIA06: TIBStringField;
    IBTable_VisaoTIPO06: TIBStringField;
    IBTable_VisaoDIA07: TIBStringField;
    IBTable_VisaoTIPO07: TIBStringField;
    IBTable_VisaoDIA08: TIBStringField;
    IBTable_VisaoTIPO08: TIBStringField;
    IBTable_VisaoDIA09: TIBStringField;
    IBTable_VisaoTIPO09: TIBStringField;
    IBTable_VisaoDIA10: TIBStringField;
    IBTable_VisaoTIPO10: TIBStringField;
    IBTable_VisaoDIA11: TIBStringField;
    IBTable_VisaoTIPO11: TIBStringField;
    IBTable_VisaoDIA12: TIBStringField;
    IBTable_VisaoTIPO12: TIBStringField;
    IBTable_VisaoDIA13: TIBStringField;
    IBTable_VisaoTIPO13: TIBStringField;
    IBTable_VisaoDIA14: TIBStringField;
    IBTable_VisaoTIPO14: TIBStringField;
    IBTable_VisaoDIA15: TIBStringField;
    IBTable_VisaoTIPO15: TIBStringField;
    IBTable_VisaoDIA16: TIBStringField;
    IBTable_VisaoTIPO16: TIBStringField;
    IBTable_VisaoDIA17: TIBStringField;
    IBTable_VisaoTIPO17: TIBStringField;
    IBTable_VisaoDIA18: TIBStringField;
    IBTable_VisaoTIPO18: TIBStringField;
    IBTable_VisaoDIA19: TIBStringField;
    IBTable_VisaoTIPO19: TIBStringField;
    IBTable_VisaoDIA20: TIBStringField;
    IBTable_VisaoTIPO20: TIBStringField;
    IBTable_VisaoDIA21: TIBStringField;
    IBTable_VisaoTIPO21: TIBStringField;
    IBTable_VisaoDIA22: TIBStringField;
    IBTable_VisaoTIPO22: TIBStringField;
    IBTable_VisaoDIA23: TIBStringField;
    IBTable_VisaoTIPO23: TIBStringField;
    IBTable_VisaoDIA24: TIBStringField;
    IBTable_VisaoTIPO24: TIBStringField;
    IBTable_VisaoDIA25: TIBStringField;
    IBTable_VisaoTIPO25: TIBStringField;
    IBTable_VisaoDIA26: TIBStringField;
    IBTable_VisaoTIPO26: TIBStringField;
    IBTable_VisaoDIA27: TIBStringField;
    IBTable_VisaoTIPO27: TIBStringField;
    IBTable_VisaoDIA28: TIBStringField;
    IBTable_VisaoTIPO28: TIBStringField;
    IBTable_VisaoDIA29: TIBStringField;
    IBTable_VisaoTIPO29: TIBStringField;
    IBTable_VisaoDIA30: TIBStringField;
    IBTable_VisaoTIPO30: TIBStringField;
    IBTable_VisaoDIA31: TIBStringField;
    IBTable_VisaoTIPO31: TIBStringField;
    IBQuery_Busca: TIBQuery;
    DSQ_Busca: TDataSource;
    Panel_TrataReserva: TPanel;
    GroupBox8: TGroupBox;
    GroupBox1: TGroupBox;
    IBQuery_VisaoCODIGO: TIBStringField;
    IBQuery_VisaoPREDIO: TIBStringField;
    IBQuery_VisaoAPTO: TIntegerField;
    IBQuery_VisaoDIA01: TIBStringField;
    IBQuery_VisaoTIPO01: TIBStringField;
    IBQuery_VisaoDIA02: TIBStringField;
    IBQuery_VisaoTIPO02: TIBStringField;
    IBQuery_VisaoDIA03: TIBStringField;
    IBQuery_VisaoTIPO03: TIBStringField;
    IBQuery_VisaoDIA04: TIBStringField;
    IBQuery_VisaoTIPO04: TIBStringField;
    IBQuery_VisaoDIA05: TIBStringField;
    IBQuery_VisaoTIPO05: TIBStringField;
    IBQuery_VisaoDIA06: TIBStringField;
    IBQuery_VisaoTIPO06: TIBStringField;
    IBQuery_VisaoDIA07: TIBStringField;
    IBQuery_VisaoTIPO07: TIBStringField;
    IBQuery_VisaoDIA08: TIBStringField;
    IBQuery_VisaoTIPO08: TIBStringField;
    IBQuery_VisaoDIA09: TIBStringField;
    IBQuery_VisaoTIPO09: TIBStringField;
    IBQuery_VisaoDIA10: TIBStringField;
    IBQuery_VisaoTIPO10: TIBStringField;
    IBQuery_VisaoDIA11: TIBStringField;
    IBQuery_VisaoTIPO11: TIBStringField;
    IBQuery_VisaoDIA12: TIBStringField;
    IBQuery_VisaoTIPO12: TIBStringField;
    IBQuery_VisaoDIA13: TIBStringField;
    IBQuery_VisaoTIPO13: TIBStringField;
    IBQuery_VisaoDIA14: TIBStringField;
    IBQuery_VisaoTIPO14: TIBStringField;
    IBQuery_VisaoDIA15: TIBStringField;
    IBQuery_VisaoTIPO15: TIBStringField;
    IBQuery_VisaoDIA16: TIBStringField;
    IBQuery_VisaoTIPO16: TIBStringField;
    IBQuery_VisaoDIA17: TIBStringField;
    IBQuery_VisaoTIPO17: TIBStringField;
    IBQuery_VisaoDIA18: TIBStringField;
    IBQuery_VisaoTIPO18: TIBStringField;
    IBQuery_VisaoDIA19: TIBStringField;
    IBQuery_VisaoTIPO19: TIBStringField;
    IBQuery_VisaoDIA20: TIBStringField;
    IBQuery_VisaoTIPO20: TIBStringField;
    IBQuery_VisaoDIA21: TIBStringField;
    IBQuery_VisaoTIPO21: TIBStringField;
    IBQuery_VisaoDIA22: TIBStringField;
    IBQuery_VisaoTIPO22: TIBStringField;
    IBQuery_VisaoDIA23: TIBStringField;
    IBQuery_VisaoTIPO23: TIBStringField;
    IBQuery_VisaoDIA24: TIBStringField;
    IBQuery_VisaoTIPO24: TIBStringField;
    IBQuery_VisaoDIA25: TIBStringField;
    IBQuery_VisaoTIPO25: TIBStringField;
    IBQuery_VisaoDIA26: TIBStringField;
    IBQuery_VisaoTIPO26: TIBStringField;
    IBQuery_VisaoDIA27: TIBStringField;
    IBQuery_VisaoTIPO27: TIBStringField;
    IBQuery_VisaoDIA28: TIBStringField;
    IBQuery_VisaoTIPO28: TIBStringField;
    IBQuery_VisaoDIA29: TIBStringField;
    IBQuery_VisaoTIPO29: TIBStringField;
    IBQuery_VisaoDIA30: TIBStringField;
    IBQuery_VisaoTIPO30: TIBStringField;
    IBQuery_VisaoDIA31: TIBStringField;
    IBQuery_VisaoTIPO31: TIBStringField;
    Panel_Legenda: TPanel;
    Label7: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel12: TPanel;
    Panel15: TPanel;
    IBQuery_VisaoCAMA: TIBStringField;
    IBTable_VisaoCAMA: TIBStringField;
    Query_Monta_Mapa: TQuery;
    DSQ_Monta_Mapa: TDataSource;
    Table_Mapa_Dep: TTable;
    Table_Hospedagem: TTable;
    Table_Reserva_Mapa: TTable;
    Table_Hospede01: TTable;
    DST_Hospedagem: TDataSource;
    DST_MapaDep: TDataSource;
    Table_Hospede: TTable;
    Table_Responsavel: TTable;
    DST_Hospede: TDataSource;
    DST_Responsavel: TDataSource;
    Query_Procura: TQuery;
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
    DSQ_Busca_Hospede: TDataSource;
    Query_Busca_Hospede: TQuery;
    DSQ_MostrarReservas: TDataSource;
    Query_MostrarReserva: TQuery;
    Query_MostrarReservaDATAENTRADA: TDateTimeField;
    Query_MostrarReservaNOME: TStringField;
    Query_MostrarReservaPOSTO: TStringField;
    Query_MostrarReservaDEPENDENTE_DE: TStringField;
    Query_MostrarReservaTELEFONE_FUNCIONAL: TStringField;
    Query_MostrarReservaSITUACAO_CURSO: TStringField;
    Query_MostrarReservaOM_ORIGEM: TStringField;
    Query_MostrarReservaDEPENDENTE: TFloatField;
    Query_MostrarReservaDATASAIDA: TDateTimeField;
    Query_MostrarReservaPREDIO: TStringField;
    Query_MostrarReservaAPTO: TFloatField;
    Query_MostrarReservaCAMA: TFloatField;
    IBTable_MostrarPREDIO: TIBStringField;
    IBTable_MostrarAPTO: TIntegerField;
    IBTable_MostrarCAMA: TIntegerField;
    IBTable_MostrarCODIGO: TIBStringField;
    IBTable_MostrarRAMAL: TIBStringField;
    IBTable_MostrarTV1: TIBStringField;
    IBTable_MostrarTV2: TIBStringField;
    IBTable_MostrarTIPO: TIBStringField;
    IBTable_MostrarSITUACAO: TIBStringField;
    IBTable_MostrarSITUACAO_CURSO: TIBStringField;
    IBTable_MostrarNOME: TIBStringField;
    IBTable_MostrarDATA_ENTRADA: TIBStringField;
    IBTable_MostrarDATA_SAIDA: TIBStringField;
    IBTable_MostrarIDENTIDADE: TIBStringField;
    Table_Reserva_MapaIDENTIDADE: TStringField;
    Table_Reserva_MapaDATAENTRADA: TDateTimeField;
    Table_Reserva_MapaNOME: TStringField;
    Table_Reserva_MapaNOME_GUERRA: TStringField;
    Table_Reserva_MapaPOSTO: TStringField;
    Table_Reserva_MapaDEPENDENTE_DE: TStringField;
    Table_Reserva_MapaTELEFONE_FUNCIONAL: TStringField;
    Table_Reserva_MapaSITUACAO_CURSO: TStringField;
    Table_Reserva_MapaOM_ORIGEM: TStringField;
    Table_Reserva_MapaDEPENDENTE: TFloatField;
    Table_Reserva_MapaHORAENTRADA: TStringField;
    Table_Reserva_MapaDATASAIDA: TDateTimeField;
    Table_Reserva_MapaPREDIO: TStringField;
    Table_Reserva_MapaAPTO: TFloatField;
    Table_Reserva_MapaCAMA: TFloatField;
    Table_Reserva_MapaRECEBE: TStringField;
    Table_Reserva_MapaUSUARIO: TStringField;
    Table_Reserva_MapaCPF: TStringField;
    Table_Reserva_MapaSISCEAB: TStringField;
    Table_CadReservaCPF: TStringField;
    Table_CadReservaSISCEAB: TStringField;
    Query_Reserva: TQuery;
    Query_ReservaIDENTIDADE: TStringField;
    Query_ReservaDATAENTRADA: TDateTimeField;
    Query_ReservaNOME: TStringField;
    Query_ReservaNOME_GUERRA: TStringField;
    Query_ReservaPOSTO: TStringField;
    Query_ReservaDEPENDENTE_DE: TStringField;
    Query_ReservaTELEFONE_FUNCIONAL: TStringField;
    Query_ReservaSITUACAO_CURSO: TStringField;
    Query_ReservaOM_ORIGEM: TStringField;
    Query_ReservaDEPENDENTE: TFloatField;
    Query_ReservaHORAENTRADA: TStringField;
    Query_ReservaDATASAIDA: TDateTimeField;
    Query_ReservaPREDIO: TStringField;
    Query_ReservaAPTO: TFloatField;
    Query_ReservaCAMA: TFloatField;
    Query_ReservaRECEBE: TStringField;
    Query_ReservaUSUARIO: TStringField;
    Table_Reserva: TTable;
    StringField1: TStringField;
    DateTimeField1: TDateTimeField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    FloatField1: TFloatField;
    StringField8: TStringField;
    DateTimeField2: TDateTimeField;
    StringField9: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    DSQ_Reserva: TDataSource;
    DST_Reserva: TDataSource;
    Query_Predio: TQuery;
    DSQ_Predio: TDataSource;
    Table_Apto: TTable;
    Table_AptoPREDIO: TStringField;
    Table_AptoAPTO: TFloatField;
    DST_Apto: TDataSource;
    DSQ_Tabela_Posto: TDataSource;
    Query2: TQuery;
    Query3: TQuery;
    Query_Decea: TQuery;
    Table_Busca_Cama: TTable;
    StringField15: TStringField;
    Table_Busca_CamaAPTO: TFloatField;
    Table_Busca_CamaCAMA: TFloatField;
    StringField16: TStringField;
    DST_Busca_Cama: TDataSource;
    Query_Tabela_Posto: TQuery;
    StringField17: TStringField;
    ScrollBox1: TScrollBox;
    DBGrid_Visao: TDBGrid;
    DBGrid_Mapa: TDBGrid;
    Panel3: TPanel;
    JvGradient3: TJvGradient;
    Label16: TLabel;
    Label6: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label_Nome_Guerra: TLabel;
    Label23: TLabel;
    Label_Situacao_Curso: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label8: TLabel;
    Label_Usuario: TLabel;
    Label10: TLabel;
    DBText1: TDBText;
    Label11: TLabel;
    Label12: TLabel;
    Label_Sel_Predio: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ToolBar3: TToolBar;
    ToolButton9: TToolButton;
    ToolButton4: TToolButton;
    ToolButton_Inserir: TToolButton;
    ToolButton_Alterar: TToolButton;
    ToolButton_Excluir: TToolButton;
    ToolButton_Gravar: TToolButton;
    ToolButton_Cancelar: TToolButton;
    ToolButton5: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    ToolButton_PreviaPreco: TToolButton;
    JvCaptionPanel3: TJvCaptionPanel;
    JvShape5: TJvShape;
    DBNavigator3: TDBNavigator;
    Panel1: TPanel;
    MaskEdit_Nome: TMaskEdit;
    MaskEdit_Predio: TMaskEdit;
    MaskEdit_Apto: TMaskEdit;
    DBGrid_Reserva: TDBGrid;
    DBEdit_Nome: TDBEdit;
    DBEdit_Nome_Guerra: TDBEdit;
    DBEdit_Telefone_Funcional: TDBEdit;
    DBEdit_Data_Entrada: TDBEdit;
    DBEdit_Hora_Entrada: TDBEdit;
    DBEdit_Data_Saida: TDBEdit;
    MaskEdit_Identidade: TMaskEdit;
    DBEdit_Dependente: TDBEdit;
    DBComboBox_OM_Origem: TDBComboBox;
    DBComboBox_Posto_Graduacao: TDBComboBox;
    DBComboBox_Dependente_de: TDBComboBox;
    DBComboBox_Situacao_Curso: TDBComboBox;
    DBEdit_CPF: TDBEdit;
    DBComboBox_SISCEAB: TDBComboBox;
    Panel2: TPanel;
    Label19: TLabel;
    ProgressBar1: TProgressBar;
    MaskEdit_Busca_Nome_Completo: TMaskEdit;
    ToolBar1: TToolBar;
    ToolButton_AmpliaMapa: TToolButton;
    ToolButton_ReduzMapa: TToolButton;
    ToolButton_MostrarReservas: TToolButton;
    ToolButton2: TToolButton;
    DBNavigator_Visao: TDBNavigator;
    vv: TJvGradient;
    Label18: TLabel;
    Label5: TLabel;
    Label20: TLabel;
    Label1: TLabel;
    Label_Predio: TLabel;
    SpeedButton_Atualizar: TSpeedButton;
    MaskEdit_Nome_Guerra: TMaskEdit;
    MaskEdit_Ramal: TMaskEdit;
    ComboBox_Ano: TComboBox;
    ComboBox_Mes: TComboBox;
    ComboBox_Predio: TComboBox;
    RichPrinter1: TRichPrinter;
    PrintDialog1: TPrintDialog;
    JvCaptionPanel_MostrarReservas: TJvCaptionPanel;
    ToolBar5: TToolBar;
    ToolButton_EmissaoRelBoletimEscolar: TToolButton;
    ToolButton8: TToolButton;
    ToolButton_selecionaReserva: TToolButton;
    ToolButton1: TToolButton;
    ToolButton_FinalizaRelatorio: TToolButton;
    GroupBox_Descricao: TGroupBox;
    DBGrid_MostrarReservas: TDBGrid;
    StatusBar2: TStatusBar;
    JvCaptionPanel_Resumo: TJvCaptionPanel;
    ToolBar2: TToolBar;
    ToolButton_RelResumoOcupacao: TToolButton;
    ToolButton3: TToolButton;
    ToolButton_FecharResumo: TToolButton;
    StatusBar3: TStatusBar;
    Text1: TPsyRichEdit;
    JvCaptionPanel_relacao: TJvCaptionPanel;
    StatusBar4: TStatusBar;
    DBGrid_Busca_Hospede: TDBGrid;
    MaskEdit_Identidade_Mapa: TMaskEdit;
    MaskEdit_Nome_Hospede: TMaskEdit;
    Panel10: TPanel;
    ComboBox_Posto_Graduacao: TComboBox;
    MaskEdit_Nome_Guerra_hospede: TMaskEdit;
    DBComboBox1: TDBComboBox;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    JvTransparentButton_FecharRelatorios: TJvTransparentButton;
    ComboBox_SelTurma: TComboBox;

    Function Procura(VS_Comando: String): Boolean;
//    procedure TrataInsercao;

    procedure Botao(Status: Boolean);
    procedure TrataCampos(Status: Boolean);
    procedure Atualiza;

    procedure BuscaReserva(Sender: TObject);
    Function VerificaRestricao(VS_Comando: String): boolean;
    procedure SelecionarHospede(Sender: TObject);
    procedure ResumoDoMapa;
    procedure Executa_Query_hospede(VS_Comando: String);
    procedure Mostra_Todas_Reservas;

    procedure SetarDiaTipo(PI_Dia: Integer; VS_Codigo, VS_Tipo: String);
    Procedure GravaVisao(VS_Codigo, VS_Predio, VS_Apto, VS_Cama: String);

    Function MontaVisao( VS_Codigo, VS_Tipo, VS_Situacao, VS_dataEntrada, VS_DataSaida: String): Boolean;
    procedure Monta_Mapa(Situacao: integer);
    Procedure LimpaMapa;
    procedure Executa_Query_Monta_Mapa(VS_Comando: String);
    procedure Executa_Query_Mapa(VS_Busca: String; VI_Opc: Integer);

    procedure Grava_Mapa(VI_Codigo: Integer; VS_Virtual: String; VS_Identidade: String; VS_Predio: String; VS_Apto: String; VS_Cama: String;
                           VS_Ramal: String; VS_TV1: String; VS_TV2: String;
                           VS_CABECALHO: String; VS_Situacao: String;
                           VS_Situacao_Curso: String; VS_Nome: String;
                           VS_DataEntrada: String; VS_DataSaida: String);

    procedure SpeedButton_AtualizarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid_VisaoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid_MapaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure MaskEdit_Busca_Nome_CompletoChange(Sender: TObject);
    procedure MaskEdit_Nome_GuerraChange(Sender: TObject);
    procedure MaskEdit_RamalChange(Sender: TObject);
    procedure DBGrid_VisaoCellClick(Column: TColumn);
    procedure DBGrid_Busca_HospedeDblClick(Sender: TObject);
    procedure ToolButton_ReduzMapaClick(Sender: TObject);
    procedure ToolButton_AmpliaMapaClick(Sender: TObject);
    procedure ComboBox_Posto_GraduacaoEnter(Sender: TObject);
    procedure ToolButton_FinalizaRelatorioClick(Sender: TObject);
    procedure ToolButton_MostrarReservasClick(Sender: TObject);
    procedure ToolButton_EmissaoRelBoletimEscolarClick(Sender: TObject);
    procedure ToolButton_selecionaReservaClick(Sender: TObject);
    procedure DBGrid_VisaoExit(Sender: TObject);
    procedure ToolButton_RelResumoOcupacaoClick(Sender: TObject);
    procedure ToolButton_FecharResumoClick(Sender: TObject);
    procedure ComboBox_PredioKeyPress(Sender: TObject; var Key: Char);
//    procedure JvTransparentButton_EfetuaReservaClick(Sender: TObject);
//    procedure JvTransparentButton_CancelaReservaClick(Sender: TObject);
//    procedure JvTransparentButton_RetornarClick(Sender: TObject);
//    procedure JvTransparentButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_PreviaPrecoClick(Sender: TObject);
    procedure ToolButton_InserirClick(Sender: TObject);
    procedure ToolButton_AlterarClick(Sender: TObject);
    procedure ToolButton_ExcluirClick(Sender: TObject);
    procedure ToolButton_GravarClick(Sender: TObject);
    procedure ToolButton_CancelarClick(Sender: TObject);
    procedure Query_ReservaAfterScroll(DataSet: TDataSet);
    procedure Table_ReservaPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure DBGrid_ReservaTitleClick(Column: TColumn);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure JvTransparentButton_FecharRelatoriosClick(Sender: TObject);
  private    { Private declarations }
     VI_Codigo: integer;
     VB_ModuloInsercao, VB_Nao_Busca_Identidade, VB_Achou: Boolean;
     VS_OrderBy, VS_Opcao, VS_Identidade, VS_DataEntrada: String;

     VI_Close: integer;
     Duplo_Click: Boolean;
     VI_AnoSelecionado, VI_MesSelecionado: Integer;

     Ma_Dia: array[1..31] of String ;
     Ma_Tipo: array[1..31] of String ;

     Ma_Vagas: array[1..31] of Integer ;
     Ma_Hospedagem: array[1..31] of Integer ;
     Ma_Reservas: array[1..31] of Integer ;
     Ma_Indisponivel: array[1..31] of Integer ;
  public    { Public declarations }
  end;

var
  Form_MontaReserva: TForm_MontaReserva;

implementation

uses Module, Rel_Rela_Reserva, Selecao_Reserva, Previsao_Diaria;

{$R *.dfm}

procedure TForm_MontaReserva.FormActivate(Sender: TObject);
Var
   dia, mes, ano: Word;
begin
   JvCaptionPanel_relacao.Visible:= False;

   VS_OrderBy:= ' order By Predio, Apto ';

   Text1.Lines.Clear;
   Label_Predio.Caption:= PredioAndar+':';

   JvCaptionPanel_MostrarReservas.Visible:= False;
   JvCaptionPanel_MostrarReservas.Left:= 3;
   JvCaptionPanel_MostrarReservas.Top:= 2;
   JvCaptionPanel_MostrarReservas.Width:= 1006;
   JvCaptionPanel_MostrarReservas.Height:= 631;

   JvCaptionPanel_Resumo.Visible:= False;
   JvCaptionPanel_Resumo.Left:= 0;
   JvCaptionPanel_Resumo.Top:= 12;
   JvCaptionPanel_Resumo.Width:= 1016;

   DecodeDate( Date, ano, mes, dia);
   ComboBox_Mes.Text:= FormatFloat('00', Mes);
   ComboBox_Ano.Text:= IntToStr(ano);

   IBQuery_mapa.Close;
   ToolButton_ReduzMapaClick(Sender);

   Duplo_Click:= False;
   VI_Close:= 1000;

   LimpaMapa;

   // Alimenta os ComboBox de Trabalho

   Funcoes.AlimentaComboBox(ComboBox_Predio, 0, 'Todos', 'Predio.cnf');
   Funcoes.AlimentaDBComboBox(DBComboBox_Situacao_Curso, 0, '', 'SituacaoCurso.cnf');

   //--- Abre as tabelas de trabalho

   IBQuery_Visao.Open;
   IBTable_Visao.Open;
   IBTable_Mostrar.Open;
   Query_MostrarReserva.Open;

   Table_Hospede.Open;
   Table_Hospedagem.Open;
   Table_Reserva_Mapa.Open;
   Table_Mapa_Dep.Open;
   Table_Hospede01.Open;
   Table_Responsavel.Open;
   IBQuery_Mapa.Close;

   Query_Busca_Hospede.Open;
   Table_CadReserva.Open;

   Mostra_Todas_Reservas;
   ComboBox_Predio.Text:= '';
   VI_Close:= 0;


     //--------- Cadastro Reserva
    //--------
   // Alimenta os ComboBox de Trabalho

   Funcoes.AlimentaDBComboBox(DBComboBox_Situacao_Curso, 0, '', 'SituacaoCurso.cnf');

   //--- Abre as tabelas de trabalho

   Query_Reserva.Close;
   Query_Reserva.Open;
   Table_Reserva.Open;
   Query_Predio.Open;
   Table_Apto.Open;
   Table_Busca_Cama.Open;

    //---
   //--- Verifica o tipo de usuario

   MaskEdit_Identidade.Text:= Table_Reserva.FieldByName('IDENTIDADE').AsString;

   Query_Tabela_Posto.Open;
   Query_Tabela_Posto.First;
   While not Query_Tabela_Posto.eof do
   begin
      DBComboBox_Posto_Graduacao.Items.Add(Query_Tabela_Posto.FieldByName('POSTOGRADUAÇÃO').AsString);
      DBComboBox_Dependente_de.Items.Add(Query_Tabela_Posto.FieldByName('POSTOGRADUAÇÃO').AsString);
      ComboBox_Posto_Graduacao.Items.Add(Query_Tabela_Posto.FieldByName('POSTOGRADUAÇÃO').AsString);
      Query_Tabela_Posto.Next;
   end;

    //---
   //--- Atualiza o combo de selecao da OM origem

   Query_Decea.Open;
   Query_Decea.First;
   While not Query_Decea.eof do
   begin
      DBComboBox_OM_Origem.Items.Add(Query_Decea.FieldByName('Localidade').AsString);
      Query_Decea.Next;
   end;

   Botao(True);

   TrataCampos(True);
   

end;

procedure TForm_MontaReserva.SpeedButton_AtualizarClick(Sender: TObject);
begin
   Monta_Mapa(1);
end;

//------------------------------------------------------------------------------
// Limpa as tabela de montagem do Mapa
//------------------------------------------------------------------------------

Procedure TForm_MontaReserva.LimpaMapa;
begin
    if FileExists('C:\DataBase_ICEA\DB_HotelMapa\HOTELMAPA.GDB') = True then
    begin
       IBQuery_Delete_Visao.ExecSQL;   // Limpa tabela de visao panoramica do mapa

       IBQuery_Delete_Mapa.ExecSQL;   // Limpa Tabela de Tratamento do Mapa
       DM.IBTransaction_HotelLocal.Commit;

       IBTable_Visao.Close;
       IBTable_Visao.Open;

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
// Monta o mapa de ocupacao
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.Monta_Mapa(Situacao: integer);
var
   VS_Comando: String;
   diaTermino, VI_Vagas, VI_Hospedagen, VI_Reservas, VI_Indisponivel, I, VI_Codigo: Integer;
   VS_Predio, VS_Apto, VS_Privilegio: String;
   VB_Retorno: Boolean;
begin
   IBTable_Visao.Open;
    //---
   // Verifica se o mes selecionado eh valido

   if Trim(ComboBox_Mes.Text) = '' then
   begin
      ShowMessage('O mês não pode ser branco, FAVOR SELECIONAR OUTRO MÊS...');
      ComboBox_Mes.SetFocus;
   end;

   if ((StrToInt(ComboBox_Mes.Text) < 0) and (StrToInt(ComboBox_Mes.Text) > 12)) then
   begin
      ShowMessage('Não existe mês '+ComboBox_Mes.Text+', FAVOR SELECIONAR OUTRO MÊS...');
      ComboBox_Mes.SetFocus;
   end;

    //---
   // Limpa Matriz

    for i:= 1 to 31 do
    begin
       Ma_Vagas[i]:= 0;
       Ma_Hospedagem[i]:= 0;
       Ma_Reservas[i]:= 0;
       Ma_Indisponivel[i]:= 0;
    end;

   //---
   // Limpa as caixas de busca

   MaskEdit_Nome_Guerra.Text:= '';
   MaskEdit_Ramal.Text:= '';
   MaskEdit_Busca_Nome_Completo.Text:= '';

    //----
   // Inicia a montagem do Mapa

//    Funcoes.Log_Recepcao('R-Mapa');

    LimpaMapa;        //--- Limpa a tabela de mapa

    // Seta as variaveis iniciais

    VI_MesSelecionado:= StrToInt(ComboBox_Mes.Text);
    VI_AnoSelecionado:= StrToInt(ComboBox_Ano.Text);
    diaTermino:= Funcoes.DiasNoMes(VI_AnoSelecionado, VI_MesSelecionado);
    diaTermino:= diaTermino+1;

    VS_Privilegio:= 'R';
    VI_Codigo:= 0;
    VS_Predio:= '';
    VS_Apto:= '';
    VI_Vagas:= 0;
    VI_Hospedagen:= 0;
    VI_Reservas:= 0;
    VI_Indisponivel:= 0;

     //---
    //--- Montagem do Mapa de Ocupacao  - Hospedagem / Reserva / Dependente

    if ComboBox_Predio.Text = 'Todos' then
       VS_Comando:= 'select ap.predio, ap.apto, ap.ramal, ap.tv1, ap.tv2, ap.virtual, ac.cama, ac.aptcodigo, ac.nome '+
                    'from apartamento ap, aptocama ac '+
                    'where (ap.predio = ac.predio and ap.apto = ac.apto) '
    else       // selecao por apto
       VS_Comando:= 'select ap.predio, ap.apto, ap.ramal, ap.tv1, ap.tv2, ap.virtual, ac.cama, ac.aptcodigo, ac.nome '+
                    'from apartamento ap, aptocama ac '+
                    'where (ap.predio = ac.predio and ap.apto = ac.apto) '+
                    ' and ap.predio = '+#39+ComboBox_Predio.Text+#39;

    if VS_Privilegio <> 'G' then
       VS_Comando:= VS_Comando+' and ap.virtual = '+#39+'N'+#39;

    VS_Comando:= VS_Comando+' order by ap.predio, ap.apto, ac.cama';

    Executa_Query_Monta_Mapa(VS_Comando);
    ProgressBar1.Max:= Query_Monta_Mapa.RecordCount;

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

          VB_Retorno:= MontaVisao( FormatFloat('000', VI_Codigo),
                                   CABECALHO,   // VS_Tipo
                                   Query_Monta_Mapa.FieldByName('PREDIO').AsString+' -'+
                                      Query_Monta_Mapa.FieldByName('APTO').AsString+'- R. '+
                                      Query_Monta_Mapa.FieldByName('RAMAL').AsString+' - '+
                                      Query_Monta_Mapa.FieldByName('TV1').AsString+'  '+
                                      Query_Monta_Mapa.FieldByName('TV2').AsString,
                                   ' ',    // VS_DataEntrada
                                   ' '     //VS_DataSaida
                                  );
          GravaVisao(FormatFloat('000', VI_Codigo), Query_Monta_Mapa.FieldByName('PREDIO').AsString, Query_Monta_Mapa.FieldByName('apto').AsString, ' ');
       end;

       // Setar incialmente como DESOCUPADO

       VI_Vagas:= VI_Vagas+1;
       for i:= 1 to 31 do
          SetarDiaTipo( I, '   ', DESOCUPADO );

       for i:= diaTermino to 31 do
          SetarDiaTipo( I, '   ', '9' );

       //--- RESERVA

       if Table_Reserva_Mapa.RecordCount > 0 then
       begin
          Table_Reserva_Mapa.First;
          While not Table_Reserva_Mapa.Eof do
          begin
             VI_Codigo:= VI_Codigo + 1;
             VB_Retorno:= MontaVisao( FormatFloat('000', VI_Codigo),
                                            RESERVA,   // VS_Tipo
                                            ' ',       // VS_Situacao
                                            Table_Reserva_Mapa.FieldByName('dataentrada').AsString,
                                            Table_Reserva_Mapa.FieldByName('datasaida').AsString
                                    );

             if VB_Retorno = True then
             begin
                VI_Reservas:= VI_Reservas + 1;

                Grava_Mapa( VI_Codigo,
                            Query_Monta_Mapa.FieldByName('virtual').AsString,
                            Table_Reserva_Mapa.FieldByName('Identidade').AsString,
                            Query_Monta_Mapa.FieldByName('PREDIO').AsString,
                            Query_Monta_Mapa.FieldByName('apto').AsString,
                            Query_Monta_Mapa.FieldByName('cama').AsString,
                            Query_Monta_Mapa.FieldByName('Ramal').AsString,
                            ' ',
                            ' ',
                            RESERVA,
                            FormatFloat('000', VI_Codigo)+' - '+Trim(Table_Reserva_Mapa.FieldByName('Posto').AsString)+' '+
                               Table_Reserva_Mapa.FieldByName('nome_guerra').AsString,
                            Table_Reserva_Mapa.FieldByName('situacao_curso').AsString,
                            Table_Reserva_Mapa.FieldByName('nome').AsString,
                            Table_Reserva_Mapa.FieldByName('dataentrada').AsString,
                            Table_Reserva_Mapa.FieldByName('datasaida').AsString
                          );
             end
             else
             begin
                VI_Codigo:= VI_Codigo - 1;
             end;

             Table_Reserva_Mapa.Next;
          end;
       end
else
begin
       //--- Tratamento quando tiver hospode
       if Trim(AnsiUpperCase(Query_Monta_Mapa.FieldByName('APTCODIGO').AsString)) = 'OCUPADO' then
       begin
       if Query_Monta_Mapa.FieldByName('apto').AsString = '12' then
          VI_Codigo:= VI_Codigo;

          VI_Codigo:= VI_Codigo + 1;
          VB_Retorno:= MontaVisao( FormatFloat('000', VI_Codigo),
                                   OCUPADO,   // VS_Tipo
                                   ' ',       // VS_Situacao
                                   Table_Hospedagem.FieldByName('DataEntrada').AsString,
                                   Table_Hospedagem.FieldByName('DataSaida').AsString
                                  );

          if VB_Retorno = True then
          begin
             VI_Hospedagen:= VI_Hospedagen+1;
             if Table_Hospede.RecordCount = 0 then
             begin
                Grava_Mapa( VI_Codigo,
                            Query_Monta_Mapa.FieldByName('virtual').AsString,
                            Table_Hospede.FieldByName('Identidade').AsString,
                            Query_Monta_Mapa.FieldByName('PREDIO').AsString,
                            Query_Monta_Mapa.FieldByName('apto').AsString,
                            Query_Monta_Mapa.FieldByName('cama').AsString,
                            Query_Monta_Mapa.FieldByName('Ramal').AsString,
                            ' ',
                            ' ',
                            OCUPADO,
                            FormatFloat('000', VI_Codigo)+' - '+Trim(Query_Monta_Mapa.FieldByName('Nome').AsString),
                            'OCUPADO',
                            Query_Monta_Mapa.FieldByName('NOME').AsString,
                            ' ',
                            ' '
                           );
             end
             else
             begin
                VI_Hospedagen:= VI_Hospedagen+1;
                Grava_Mapa( VI_Codigo,
                            Query_Monta_Mapa.FieldByName('virtual').AsString,
                            Table_Hospede.FieldByName('Identidade').AsString,
                            Query_Monta_Mapa.FieldByName('PREDIO').AsString,
                            Query_Monta_Mapa.FieldByName('apto').AsString,
                            Query_Monta_Mapa.FieldByName('cama').AsString,
                            Query_Monta_Mapa.FieldByName('Ramal').AsString,
                            ' ',
                            ' ',
                            OCUPADO,
                            FormatFloat('000', VI_Codigo)+' - '+Trim(Table_Hospede.FieldByName('Posto').AsString)+' '+
                                  Table_Hospede.FieldByName('NOME_GUERRA').AsString,
                            Table_Hospede.FieldByName('situacao_curso').AsString,
                            Table_Hospede.FieldByName('nome').AsString,
                            Table_Hospedagem.FieldByName('DataEntrada').AsString,
                            Table_Hospedagem.FieldByName('DataSaida').AsString
                           );
             end;
             end;
          end
          else
          begin          //--- DEPENDENTE DE HOSPEDE
             if Trim(Query_Monta_Mapa.FieldByName('APTCODIGO').AsString) = 'DEP' then
             begin
                VI_Codigo:= VI_Codigo + 1;
                VI_Hospedagen:= VI_Hospedagen+1;

                VB_Retorno:= MontaVisao( FormatFloat('000', VI_Codigo),
                                         OCUPADO,   // VS_Tipo
                                         ' ',       // VS_Situacao
                                         Table_Responsavel.FieldByName('DataEntrada').AsString,
                                         Table_Responsavel.FieldByName('DataSaida').AsString
                                        );

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
                           FormatFloat('000', VI_Codigo)+' - '+'DEP - '+Table_Mapa_Dep.FieldByName('Nome').AsString,
                           'DEPENDENTE',
                           'DEP - '+Table_Mapa_Dep.FieldByName('Nome').AsString,
                            Table_Responsavel.FieldByName('DataEntrada').AsString,
                            Table_Responsavel.FieldByName('DataSaida').AsString
                           );
             end
             else
             begin     //--- DESOCUPADO
                if Trim(Query_Monta_Mapa.FieldByName('APTCODIGO').AsString) = 'DESOCUPADO' then
                begin
                   VI_Codigo:= VI_Codigo + 1;
                   VB_Retorno:= MontaVisao( FormatFloat('000', VI_Codigo),
                                            DESOCUPADO,   // VS_Tipo
                                            ' ',       // VS_Situacao
                                            ' ',       // VS_DataEntrada
                                            ' '        // VS_DataSaida
                                          );
            end
            else
            begin
               if Query_Monta_Mapa.FieldByName('NOME').AsString = 'NÃO DESOCUPADO' then
               begin
                  VI_Codigo:= VI_Codigo + 1;

                  VB_Retorno:= MontaVisao( FormatFloat('000', VI_Codigo),
                                           NAODESOCUPADO,   // VS_Tipo
                                           ' ',       // VS_Situacao
                                           ' ',       // VS_DataEntrada
                                           ' '        // VS_DataSaida
                                          );

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
                             FormatFloat('000', VI_Codigo)+' - '+Trim(Table_Hospede01.FieldByName('Posto').AsString)+' - '+Trim(Table_Hospede01.FieldByName('Nome_Guerra').AsString),
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
                     VI_Indisponivel:= VI_Indisponivel + 1;
                     VI_Codigo:= VI_Codigo + 1;
                     if Trim(Query_Monta_Mapa.FieldByName('Nome').AsString) = 'ARRUMAR' then
                     begin
                        VB_Retorno:= MontaVisao( FormatFloat('000', VI_Codigo),
                                                 DESOCUPADO,   // VS_Tipo
                                                 ' ',       // VS_Situacao
                                                 ' ',       // VS_DataEntrada
                                                 ' '        // VS_DataSaida
                                               );
                     end
                     else
                     begin
                        VB_Retorno:= MontaVisao( FormatFloat('000', VI_Codigo),
                                                 NAOOCUPAR,   // VS_Tipo
                                                 Trim(Query_Monta_Mapa.FieldByName('Nome').AsString),       // VS_Situacao
                                                 ' ',       // VS_DataEntrada
                                                 ' '        // VS_DataSaida
                                                );
                     end;
                  end;
               end;
             end;
          end;
       end;                  // Grava Visao
end;
       GravaVisao(FormatFloat('000', VI_Codigo), Query_Monta_Mapa.FieldByName('PREDIO').AsString, Query_Monta_Mapa.FieldByName('apto').AsString, Query_Monta_Mapa.FieldByName('Cama').AsString);
       Query_Monta_Mapa.Next;
    end;
    DM.IBTransaction_HotelLocal.Commit;
    ResumoDoMapa;

    IBTable_Mostrar.Open;

    IBQuery_Visao.Close;
    IBQuery_Visao.Open;
    IBQuery_Visao.First;

    ProgressBar1.Position:= 0;
    DBGrid_Mapa.SetFocus;
end;

//------------------------------------------------------------------------------
// Monta Resumo de do Mapa de Ocupacao
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.ResumoDoMapa;
var
   VS_Des, VS_Vagas, VS_Res, VS_Hosp, VS_Ind : String;
   VI_Cont: Integer;
begin
   VS_Vagas:= 'Total Vagas..:';
   VS_Des:=   'Desocupados..:';
   VS_Res:=   'Hospedes.....:';
   VS_Hosp:=  'Reservas.....:';
   VS_Ind:=   'Indisponível.:';

   for VI_Cont:= 1 to 31 do
   begin
      VS_Vagas:= VS_Vagas+' '+FormatFloat('000', Ma_Vagas[VI_Cont]+Ma_Hospedagem[VI_Cont]+Ma_Reservas[VI_Cont]-Ma_Indisponivel[VI_Cont]);
      VS_Des:= VS_Des+' '+FormatFloat('000', Ma_Vagas[VI_Cont]-Ma_Indisponivel[VI_Cont]);
      VS_Res:= VS_Res+' '+FormatFloat('000', Ma_Hospedagem[VI_Cont]);
      VS_Hosp:= VS_Hosp+' '+FormatFloat('000', Ma_Reservas[VI_Cont]);
      VS_Ind:= VS_Ind+' '+FormatFloat('000', Ma_Indisponivel[VI_Cont]);
   end;

   Text1.Lines.Clear;
   Text1.Lines.Add('Resumo feito em.: '+DateToStr(Date));
   Text1.Lines.Add('Prédio..........: '+ComboBox_Predio.Text);
   Text1.Lines.Add('Situação do mês.: '+ComboBox_Mes.Text+'/'+ComboBox_Ano.Text);
   Text1.Lines.Add('');

   Text1.Lines.Add('Dia..........:  01  02  03  04  05  06  07  08  09  10  11  12  13  14  15  16  17  18  19  20  21  22  23  24  25  26  27  28  29  30  31');
   Text1.Lines.Add('');
   Text1.Lines.Add(VS_Vagas);
   Text1.Lines.Add('');
   Text1.Lines.Add(VS_Des);
   Text1.Lines.Add('');
   Text1.Lines.Add(VS_Res );
   Text1.Lines.Add('');
   Text1.Lines.Add(VS_Hosp );
   Text1.Lines.Add('');
   Text1.Lines.Add(VS_Ind );
end;

//------------------------------------------------------------------------------
// Monta query de consulta para ontagem do mapa
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.Executa_Query_Monta_Mapa(VS_Comando: String);
begin
   Query_Monta_Mapa.Close;
   Query_Monta_Mapa.Sql.Clear;
   Query_Monta_Mapa.Sql.Add(VS_Comando);
   Query_Monta_Mapa.Open;
end;

//------------------------------------------------------------------------------
// Grava os dados do Mapa
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.Grava_Mapa(VI_Codigo: Integer; VS_Virtual: String; VS_Identidade: String; VS_Predio: String; VS_Apto: String; VS_Cama: String;
                           VS_Ramal: String; VS_TV1: String; VS_TV2: String;
                           VS_CABECALHO: String; VS_Situacao: String;
                           VS_Situacao_Curso: String; VS_Nome: String;
                           VS_DataEntrada: String; VS_DataSaida: String);
begin
   if VS_Virtual <> 'S' Then
   begin
      IBTable_Hotel.Append;
      IBTable_Hotel.FieldByName('Codigo').AsString:= FormatFloat('000',VI_Codigo);
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
end;

//------------------------------------------------------------------------------
// Tratamento Quando for pressionado a tecla <ENTER> no edit do senha
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.Executa_Query_Mapa(VS_Busca: String; VI_Opc: Integer);
var
   VS_Comando: String;
begin
   VS_Comando:= 'select codigo from mapa';
   if trim(VS_Busca) <> '' then
   begin
      case VI_Opc of
         1: VS_Comando:= VS_Comando+' where ramal = '+#39+VS_Busca+#39;
         2: VS_Comando:= VS_Comando+' where situacao like '+#39+'%'+VS_Busca+'%'+#39;
         3: VS_Comando:= VS_Comando+' where nome like '+#39+'%'+VS_Busca+'%'+#39;
      end;
   end;

   IBQuery_Mapa.Close;
   IBQuery_Mapa.Sql.Clear;
   IBQuery_Mapa.Sql.Add(VS_Comando);
   IBQuery_Mapa.Open;

   if IBQuery_Mapa.RecordCount > 0 then
   begin
      IBQuery_Visao.First;
      IBQuery_Visao.LocateNext('Codigo',IBQuery_Mapa.FieldByName('Codigo').AsString,[loCaseInsensitive]);
   end;
end;

//------------------------------------------------------------------------------
// Grava os dados do mapa panoramico
//------------------------------------------------------------------------------

Function TForm_MontaReserva.MontaVisao( VS_Codigo, VS_Tipo, VS_Situacao, VS_dataEntrada, VS_DataSaida: String): Boolean;
Var
   VS_Data: String;
   diaInicio, mesInicio, anoInicio: Word;
   diaTermino, mesTermino, anoTermino: Word;
   VI_Pos, I, VI_Dia: Integer;
   VB_retorno: Boolean;
begin
   VB_Retorno:= True;
   if ((StrToInt(VS_Tipo) = 1) or (StrToInt(VS_Tipo) = 2) or (StrToInt(VS_Tipo) = 4)) then
   begin
      if  trim(VS_dataEntrada) = '' then
      begin
//         showmessage('Problema na data de entrada no Predio '+Query_Monta_Mapa.FieldByName('PREDIO').AsString+
//                     #13+' Apto '+Query_Monta_Mapa.FieldByName('apto').AsString+
//                     #13+' Cama '+Query_Monta_Mapa.FieldByName('cama').AsString);
         VB_Retorno:= False;
      end
      else
      begin
         if  trim(VS_dataEntrada) = '' then
         begin
            showmessage('Problema na data de saída no Predio '+Query_Monta_Mapa.FieldByName('PREDIO').AsString+
                        #13+' Apto '+Query_Monta_Mapa.FieldByName('apto').AsString+
                        #13+' Cama '+Query_Monta_Mapa.FieldByName('cama').AsString);
            VB_Retorno:= False;
         end;
      end;
      end;

      if VB_Retorno = True then
      begin
         if ((StrToInt(VS_Tipo) = 0) or (StrToInt(VS_Tipo) = 5)) then
         begin
            VI_Pos:= 1;
            for i:= 1 to 17 do
            begin
               SetarDiaTipo( I, Copy(VS_Situacao,VI_Pos,3), VS_Tipo );
               VI_Pos:= VI_Pos+3;
            end;
            for i:= 17 to 31 do
               SetarDiaTipo( I, '   ', VS_Tipo );
         end
         else
         begin
            if ((StrToInt(VS_Tipo) = 1) or (StrToInt(VS_Tipo) = 2) or (StrToInt(VS_Tipo) = 4)) then
            begin
               VS_Data:= '01/'+FormatFloat('00',VI_MesSelecionado)+'/'+FormatFloat('00',VI_AnoSelecionado);
               if ((StrToDate(VS_dataEntrada) < StrToDate(VS_Data)) and (StrToDate(VS_dataSaida) < StrToDate(VS_Data))) then
               begin
                  VB_Retorno:= False;            // Desocupado
               end
               else
               begin
                  DecodeDate( StrToDate(VS_dataEntrada), anoInicio, mesInicio, diaInicio);
                  DecodeDate( StrToDate(VS_dataSaida), anoTermino, mesTermino, diaTermino);

                  If ((mesInicio > VI_MesSelecionado) and (AnoInicio = VI_AnoSelecionado)) then
                  begin
                     VB_Retorno:= False;            // Desocupado
                  end
                  else
                  begin
                     if ((AnoInicio <> VI_AnoSelecionado) and (anoTermino <> VI_AnoSelecionado)) then
                     begin
                         VB_Retorno:= False;            // Desocupado
                     end
                     else
                     begin
                        if ((mesInicio < VI_MesSelecionado) and (mesTermino < VI_MesSelecionado)) then
                        begin
                           VB_Retorno:= False;            // Desocupado
                        end
                        else
                        begin
                           if ((mesInicio <> mesTermino) and (MesTermino <> VI_MesSelecionado)) then    // Tratamento quando passar para mes seguinte
                              diaTermino:= Funcoes.DiasNoMes(anoInicio, VI_MesSelecionado);

                           if VI_MesSelecionado = 1 then
                           begin
                              if MesInicio <> VI_MesSelecionado then
                                 DiaInicio:= 1;
                              MesInicio:= VI_MesSelecionado;
                              mesTermino:= MesInicio + 1;
                           end
                           else
                           begin
                              if mesTermino > mesInicio then
                              begin
                                 if MesInicio <> VI_MesSelecionado then
                                    DiaInicio:= 1;
                                 MesInicio:= VI_MesSelecionado;
                                 mesTermino:= MesInicio + 1;
                              end;
                           end;

                           VI_dia:= diaInicio;

                           While VI_Dia <> 0 do
                           begin
                              if (( VI_Dia <= 31 ) and ( VI_Dia <= diaTermino)) then
                              begin
                                 SetarDiaTipo( VI_Dia, VS_Codigo, VS_Tipo );
                                 VI_Dia:= VI_Dia +1;
                              end
                              else
                              begin
                                 VI_Dia:= 0;
                              end;
                           end;
                       end;
                    end;
                 end;
               end;
            end;
         end;
   end;
   MontaVisao:= VB_Retorno;
end;


//------------------------------------------------------------------------------
// Grava os dados do mapa panoramico
//------------------------------------------------------------------------------

Procedure TForm_MontaReserva.GravaVisao(VS_Codigo, VS_Predio, VS_Apto, VS_Cama: String);
var
   VI_Cont: Integer;
begin
   for VI_Cont:= 1 to 31 do
   begin
      case StrToInt(Ma_Tipo[VI_Cont]) of
         1: Ma_Hospedagem[VI_Cont]:= Ma_Hospedagem[VI_Cont]+1;        // OCUPADO
         2: Ma_Reservas[VI_Cont]:= Ma_Reservas[VI_Cont]+1;            // RESERVA
         3: Ma_Vagas[VI_Cont]:= Ma_Vagas[VI_Cont]+1;                  // DESOCUPADO
         4: Ma_Hospedagem[VI_Cont]:= Ma_Hospedagem[VI_Cont]+1;        // NAODESOCUPADO
         5: Ma_Indisponivel[VI_Cont]:= Ma_Indisponivel[VI_Cont]+1;    // NAOOCUPAR      = '5';
      end;
   end;

   IBTable_Visao.Append;
   IBTable_Visao.FieldByName('Codigo').AsString:= VS_Codigo;
   IBTable_Visao.FieldByName('predio').AsString:= VS_Predio;
   IBTable_Visao.FieldByName('apto').AsString:= VS_Apto;
   IBTable_Visao.FieldByName('Cama').AsString:= VS_Cama;
   IBTable_Visao.FieldByName('Dia01').AsString:= Ma_Dia[1];
   IBTable_Visao.FieldByName('Tipo01').AsString:= Ma_Tipo[1];
   IBTable_Visao.FieldByName('Dia02').AsString:= Ma_Dia[2];
   IBTable_Visao.FieldByName('Tipo02').AsString:= Ma_Tipo[2];
   IBTable_Visao.FieldByName('Dia03').AsString:= Ma_Dia[3];
   IBTable_Visao.FieldByName('Tipo03').AsString:= Ma_Tipo[3];
   IBTable_Visao.FieldByName('Dia04').AsString:= Ma_Dia[4];
   IBTable_Visao.FieldByName('Tipo04').AsString:= Ma_Tipo[4];
   IBTable_Visao.FieldByName('Dia05').AsString:= Ma_Dia[5];
   IBTable_Visao.FieldByName('Tipo05').AsString:= Ma_Tipo[5];
   IBTable_Visao.FieldByName('Dia06').AsString:= Ma_Dia[6];
   IBTable_Visao.FieldByName('Tipo06').AsString:= Ma_Tipo[6];
   IBTable_Visao.FieldByName('Dia07').AsString:= Ma_Dia[7];
   IBTable_Visao.FieldByName('Tipo07').AsString:= Ma_Tipo[7];
   IBTable_Visao.FieldByName('Dia08').AsString:= Ma_Dia[8];
   IBTable_Visao.FieldByName('Tipo08').AsString:= Ma_Tipo[8];
   IBTable_Visao.FieldByName('Dia09').AsString:= Ma_Dia[9];
   IBTable_Visao.FieldByName('Tipo09').AsString:= Ma_Tipo[9];
   IBTable_Visao.FieldByName('Dia10').AsString:= Ma_Dia[10];
   IBTable_Visao.FieldByName('Tipo10').AsString:= Ma_Tipo[10];
   IBTable_Visao.FieldByName('Dia11').AsString:= Ma_Dia[11];
   IBTable_Visao.FieldByName('Tipo11').AsString:= Ma_Tipo[11];
   IBTable_Visao.FieldByName('Dia12').AsString:= Ma_Dia[12];
   IBTable_Visao.FieldByName('Tipo12').AsString:= Ma_Tipo[12];
   IBTable_Visao.FieldByName('Dia13').AsString:= Ma_Dia[13];
   IBTable_Visao.FieldByName('Tipo13').AsString:= Ma_Tipo[13];
   IBTable_Visao.FieldByName('Dia14').AsString:= Ma_Dia[14];
   IBTable_Visao.FieldByName('Tipo14').AsString:= Ma_Tipo[14];
   IBTable_Visao.FieldByName('Dia15').AsString:= Ma_Dia[15];;
   IBTable_Visao.FieldByName('Tipo15').AsString:= Ma_Tipo[15];
   IBTable_Visao.FieldByName('Dia16').AsString:= Ma_Dia[16];;
   IBTable_Visao.FieldByName('Tipo16').AsString:= Ma_Tipo[16];
   IBTable_Visao.FieldByName('Dia17').AsString:= Ma_Dia[17];;
   IBTable_Visao.FieldByName('Tipo17').AsString:= Ma_Tipo[17];
   IBTable_Visao.FieldByName('Dia18').AsString:= Ma_Dia[18];
   IBTable_Visao.FieldByName('Tipo18').AsString:= Ma_Tipo[18];
   IBTable_Visao.FieldByName('Dia19').AsString:= Ma_Dia[19];
   IBTable_Visao.FieldByName('Tipo19').AsString:= Ma_Tipo[19];
   IBTable_Visao.FieldByName('Dia20').AsString:= Ma_Dia[20];
   IBTable_Visao.FieldByName('Tipo20').AsString:= Ma_Tipo[20];
   IBTable_Visao.FieldByName('Dia21').AsString:= Ma_Dia[21];
   IBTable_Visao.FieldByName('Tipo21').AsString:= Ma_Tipo[21];
   IBTable_Visao.FieldByName('Dia22').AsString:= Ma_Dia[22];
   IBTable_Visao.FieldByName('Tipo22').AsString:= Ma_Tipo[22];
   IBTable_Visao.FieldByName('Dia23').AsString:= Ma_Dia[23];
   IBTable_Visao.FieldByName('Tipo23').AsString:= Ma_Tipo[23];
   IBTable_Visao.FieldByName('Dia24').AsString:= Ma_Dia[24];
   IBTable_Visao.FieldByName('Tipo24').AsString:= Ma_Tipo[24];
   IBTable_Visao.FieldByName('Dia25').AsString:= Ma_Dia[25];
   IBTable_Visao.FieldByName('Tipo25').AsString:= Ma_Tipo[25];
   IBTable_Visao.FieldByName('Dia26').AsString:= Ma_Dia[26];
   IBTable_Visao.FieldByName('Tipo26').AsString:= Ma_Tipo[26];
   IBTable_Visao.FieldByName('Dia27').AsString:= Ma_Dia[27];
   IBTable_Visao.FieldByName('Tipo27').AsString:= Ma_Tipo[27];
   IBTable_Visao.FieldByName('Dia28').AsString:= Ma_Dia[28];
   IBTable_Visao.FieldByName('Tipo28').AsString:= Ma_Tipo[28];
   IBTable_Visao.FieldByName('Dia29').AsString:= Ma_Dia[29];
   IBTable_Visao.FieldByName('Tipo29').AsString:= Ma_Tipo[29];
   IBTable_Visao.FieldByName('Dia30').AsString:= Ma_Dia[30];
   IBTable_Visao.FieldByName('Tipo30').AsString:= Ma_Tipo[30];
   IBTable_Visao.FieldByName('Dia31').AsString:= Ma_Dia[31];
   IBTable_Visao.FieldByName('Tipo31').AsString:= Ma_Tipo[31];
   IBTable_Visao.Post;
//    DM.IBTransaction_HotelLocal.Commit;
//   IBTable_Visao.Open;
end;

//------------------------------------------------------------------------------
// Tratamento para setar Dia e Tipos em Branco
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.SetarDiaTipo(PI_Dia: Integer; VS_Codigo, VS_Tipo: String);
Begin
   Ma_Dia[PI_Dia]:= VS_Codigo;
   Ma_Tipo[PI_Dia]:= VS_Tipo;
end;

//------------------------------------------------------------------------------
// Tratamento da definicao de cores de acordo com tipo
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.DBGrid_VisaoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if (Column.Field.FieldName = 'DIA01') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo01').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo01').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo01').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo01').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo01').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo01').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA02') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo02').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo02').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo02').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo02').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo02').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo02').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA03') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo03').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo03').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo03').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo03').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo03').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo03').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA04') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo04').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo04').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo04').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo04').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo04').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo04').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA05') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo05').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo05').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo05').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo05').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo05').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo05').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA06') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo06').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo06').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo06').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo06').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo06').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo06').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA07') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo07').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo07').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo07').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo07').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo07').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo07').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA08') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo08').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo08').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo08').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo08').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo08').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo08').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA09') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo09').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo09').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo09').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo09').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo09').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo09').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA10') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo10').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo10').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo10').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo10').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo10').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo10').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA11') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo11').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo11').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo11').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo11').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo11').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo11').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA12') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo12').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo12').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo12').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo12').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo12').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo12').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA13') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo13').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo13').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo13').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo13').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo13').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo13').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA14') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo14').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo14').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo14').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo14').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo14').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo14').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA15') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo15').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo15').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo15').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo15').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo15').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo15').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA16') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo16').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo16').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo16').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo16').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo16').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo16').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA17') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo17').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo17').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo17').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo17').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo17').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo17').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA18') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo18').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo18').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo18').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo18').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo18').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo18').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA19') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo19').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo19').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo19').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo19').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo19').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo19').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA20') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo20').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo20').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo20').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo20').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo20').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo20').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA21') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo21').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo21').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo21').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo21').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo21').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo21').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA22') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo22').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo22').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo22').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo22').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo22').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo22').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA23') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo23').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo23').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo23').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo23').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo23').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo23').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA24') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo24').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo24').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo24').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo24').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo24').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo24').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA25') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo25').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo25').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo25').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo25').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo25').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo25').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA26') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo26').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo26').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo26').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo26').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo26').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo26').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA27') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo27').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo27').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo27').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo27').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo27').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo27').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA28') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo28').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo28').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo28').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo28').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo28').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo28').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA29') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo29').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo29').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo29').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo29').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo29').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo29').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end
                     else
                     begin
                        if IBQuery_Visao.FieldByName('Tipo29').AsString = '9' then   // NAO OCUPAR
                        begin
                           DBGrid_Visao.Canvas.Brush.Color:= clMoneyGreen;
                           DBGrid_Visao.Canvas.Font.Color:= clMoneyGreen;
                        end;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA30') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo30').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo30').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo30').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo30').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo30').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo30').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end
                     else
                     begin
                        if IBQuery_Visao.FieldByName('Tipo30').AsString = '9' then   // NAO OCUPAR
                        begin
                           DBGrid_Visao.Canvas.Brush.Color:= clMoneyGreen;
                           DBGrid_Visao.Canvas.Font.Color:= clMoneyGreen;
                        end;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA31') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo31').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo31').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo31').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo31').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo31').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo31').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end
                     else
                     begin
                        if IBQuery_Visao.FieldByName('Tipo31').AsString = '9' then   // NAO OCUPAR
                        begin
                           DBGrid_Visao.Canvas.Brush.Color:= clMoneyGreen;
                           DBGrid_Visao.Canvas.Font.Color:= clMoneyGreen;
                        end;
                     end;
                  end;
               end;
            end;
         end;
      end;
   end;
   DBGrid_Visao.Canvas.FillRect(Rect);
   DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm_MontaReserva.DBGrid_MapaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if IBTable_Mostrar.FieldByName('Tipo').AsString = '3' then     // Desocupado
   begin
       DBGrid_Mapa.Canvas.Brush.Color:= clInfoBk;
       DBGrid_Mapa.Canvas.Font.Color:= clBlack;
   end
   else
   begin
      if (IBTable_Mostrar.FieldByName('Tipo').AsString = '1') then   // Ocupado
      begin
         DBGrid_Mapa.Canvas.Brush.Color:= clTeal;
         DBGrid_Mapa.Canvas.Font.Color:= clWhite;
      end
      else
      begin
         if IBTable_Mostrar.FieldByName('Tipo').AsString = '2' then   // Reserva
         begin
            DBGrid_Mapa.Canvas.Brush.Color:= clRed;
            DBGrid_Mapa.Canvas.Font.Color:= clWhite;
         end
         else
         begin
            if IBTable_Mostrar.FieldByName('Tipo').AsString = '4' then  // Não Desocupado
            begin
               DBGrid_Mapa.Canvas.Brush.Color:= clBlue;
               DBGrid_Mapa.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBTable_Mostrar.FieldByName('Tipo').AsString = '5' then   // NAO OCUPAR
               begin
                  DBGrid_Mapa.Canvas.Brush.Color:= clYellow;
                  DBGrid_Mapa.Canvas.Font.Color:= clBlack;
               end;
            end;
         end;
      end;
   end;
   DBGrid_Mapa.Canvas.FillRect(Rect);
   DBGrid_Mapa.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

//------------------------------------------------------------------------------
// Procedure para procurar Hospede por nome
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.MaskEdit_Busca_Nome_CompletoChange(Sender: TObject);
begin
   Executa_Query_Mapa(MaskEdit_Busca_Nome_Completo.Text, 3);
end;

//------------------------------------------------------------------------------
// Procedure para procurar Hospede por Nome de Guerra
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.MaskEdit_Nome_GuerraChange(Sender: TObject);
begin
   Executa_Query_Mapa(MaskEdit_Nome_Guerra.Text, 2 );
end;

//------------------------------------------------------------------------------
// Procedure para procurar Hospede por Ramal
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.MaskEdit_RamalChange(Sender: TObject);
begin
   Executa_Query_Mapa(MaskEdit_ramal.Text, 1);
end;

//------------------------------------------------------------------------------
// Tratamento dos botoes quando selecionado dia
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.DBGrid_VisaoCellClick(Column: TColumn);
var
   VS_Data, VS_Col, VS_Coluna, VS_Campo: String;
   VI_Dia, VI_Tipo: Integer;
begin
   VS_Coluna:= Column.Field.FieldName;
   VS_Col:= 'Tipo'+Copy(VS_Coluna,4,2);
   VS_Campo:= IBQuery_Visao.FieldByName(Column.FieldName).AsString;

   if VS_Col <> 'TipoA' then
   begin
      case VI_Tipo of
         0: Begin    // CABECALHO
               ToolButton_Gravar.Enabled:= False;
               ToolButton_Cancelar.Enabled:= False;
            end;
         1: Begin    // OCUPADO
               if ((trim(MaskEdit_Identidade_Mapa.text) = '') and (trim(MaskEdit_Nome_Guerra_hospede.text) = '') and
                  (trim(MaskEdit_Nome_Hospede.text) = '') and (Query_Busca_Hospede.RecordCount = 0 )) then
                  ToolButton_Gravar.Enabled:= False
                else
                   ToolButton_Gravar.Enabled:= False;
                   ToolButton_Cancelar.Enabled:= False;
               end;
           2: Begin    // RESERVA
                 ToolButton_Gravar.Enabled:= False;
                 ToolButton_Cancelar.Enabled:= True;
              end;
           3: Begin    // DESOCUPADO
                 if ((trim(MaskEdit_Identidade_Mapa.text) = '') and (trim(MaskEdit_Nome_Guerra_hospede.text) = '') and
                     (trim(MaskEdit_Nome_Hospede.text) = '') and (Query_Busca_Hospede.RecordCount = 0 )) then
                    ToolButton_Gravar.Enabled:= False
                 else
                    ToolButton_Gravar.Enabled:= true;
                 ToolButton_Cancelar.Enabled:= False;
              end;
           4: Begin    // NAODESOCUPADO
                 if ((trim(MaskEdit_Identidade_Mapa.text) = '') and (trim(MaskEdit_Nome_Guerra_hospede.text) = '') and
                     (trim(MaskEdit_Nome_Hospede.text) = '') and (Query_Busca_Hospede.RecordCount = 0 )) then
                    ToolButton_Cancelar.Enabled:= False
                 else
                    ToolButton_Gravar.Enabled:= true;
                 ToolButton_Cancelar.Enabled:= False;
              end;
           5: Begin    // NAOOCUPAR
                if IBQuery_Visao.FieldByName('Dia01').AsString = 'ARR' then
                    ToolButton_Cancelar.Enabled:= True
                else
                    ToolButton_Gravar.Enabled:= False;
                ToolButton_Cancelar.Enabled:= False;
             end;
         end;
//      end;

      if VS_Campo <> '' then
      begin
         IBQuery_Busca.Close;
         IBQuery_Busca.SQL.Clear;
         IBQuery_Busca.SQL.Add('Select * from Mapa where Codigo = '+#39+VS_Campo+#39);
         IBQuery_Busca.OPen;
      end;
   end;
end;

//------------------------------------------------------------------------------
//
// Tratamento do Cadastro de reserva
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Procedure para tratar da busca por identidade
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.Mostra_Todas_Reservas;
Var
   VS_Comando: String;
begin
   MaskEdit_Identidade.Text:= '';
   MaskEdit_Nome_Guerra_hospede.Text:= '';
   MaskEdit_Nome_Hospede.Text:= '';
   ComboBox_Posto_Graduacao.Text:= '';

   VS_Comando:= 'Select identidade, nome, posto, nome_guerra, Telefone_Funcional, OM_Origem, situacao, obs from hospede '+
                'Order By Nome';
   Executa_Query_hospede(VS_Comando);
end;

//------------------------------------------------------------------------------
// Procedure para buscar o hospede
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.Executa_Query_hospede(VS_Comando: String);
begin
   Query_Busca_Hospede.Close;
   Query_Busca_Hospede.SQL.Clear;
   Query_Busca_Hospede.SQL.Add(VS_Comando);
   Query_Busca_Hospede.Open;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.ToolButton_RetornarClick(Sender: TObject);
begin
   VI_Close:= 1;
   IBQuery_mapa.Close;
   Table_Hospedagem.Close;
   Table_Hospede.Close;
   Table_CadReserva.Close;
   Query_MostrarReserva.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Sai do Sistema e retorna para Sistema Operacional
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows
end;

//------------------------------------------------------------------------------
// Tratamento da selecao do hospede e pressionado duplo click
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.DBGrid_Busca_HospedeDblClick(Sender: TObject);
begin
   if ComboBox_Predio.Text = ''  then
   begin
      ShowMessage('Não foi selecionado o prédio...');
      ComboBox_Predio.SetFocus;
   end
   else
   begin
      Duplo_Click:= True;
      MaskEdit_Identidade_Mapa.Text:= Query_Busca_Hospede.FieldByName('IDENTIDADE').AsString;
      MaskEdit_Nome_Guerra_hospede.Text:= Query_Busca_Hospede.FieldByName('NOME_Guerra').AsString;
      MaskEdit_Nome_Hospede.Text:= Query_Busca_Hospede.FieldByName('NOME').AsString;
      ComboBox_Posto_Graduacao.Text:= Query_Busca_Hospede.FieldByName('POSTO').AsString;
   end;
end;

procedure TForm_MontaReserva.ToolButton_AmpliaMapaClick(Sender: TObject);
begin
   Panel_TrataReserva.Visible:= False;
   ToolButton_AmpliaMapa.Visible:= False;
   ToolButton_ReduzMapa.Visible:= True;
end;

procedure TForm_MontaReserva.ToolButton_ReduzMapaClick(Sender: TObject);
begin
   Panel_TrataReserva.Visible:= True;
   ToolButton_AmpliaMapa.Visible:= True;
   ToolButton_ReduzMapa.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento para preencher a lista de opcoes de posto graduacao para hospedagem
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Monta o comboBoc de tratamento de Posto Graduacao, Dependente de e Apto
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.ComboBox_Posto_GraduacaoEnter(Sender: TObject);
var
   VS_Comando: String;
begin
   ComboBox_Posto_Graduacao.Items.Clear;   // Limpa os postos do combo Posto Graduacao

   VS_Comando:= 'select distinct PostoGraduação from REGRASDEDIARIAS where predio = '+#39+ComboBox_Predio.Text+#39;
   Query_Tabela_Posto.Close;
   Query_Tabela_Posto.SQL.Clear;
   Query_Tabela_Posto.SQL.ADD(VS_Comando);
   Query_Tabela_Posto.Open;
   Query_Tabela_Posto.First;

   While not Query_Tabela_Posto.Eof do
   begin
      ComboBox_Posto_Graduacao.Items.Add(Query_Tabela_Posto.FieldByName('PostoGraduação').AsString);
      Query_Tabela_Posto.Next;
   end;
end;

//------------------------------------------------------------------------------
// Fecha a janela de Reservas
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.ToolButton_FinalizaRelatorioClick(Sender: TObject);
begin
   JvCaptionPanel_MostrarReservas.Visible:= False;
end;

//------------------------------------------------------------------------------
// Abre a janela de Reservas
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.ToolButton_MostrarReservasClick(Sender: TObject);
begin
   Query_MostrarReserva.Close;
   Query_MostrarReserva.Open;
   JvCaptionPanel_MostrarReservas.Visible:= True;
end;

//------------------------------------------------------------------------------
// Imprime o relatorio de reservas
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.ToolButton_EmissaoRelBoletimEscolarClick(Sender: TObject);
begin
   Form_SelecaoReserva.ShowModal;
end;

//------------------------------------------------------------------------------
// Posiciona na Reserva selecionada
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.ToolButton_selecionaReservaClick(Sender: TObject);
begin
   Executa_Query_Mapa(Query_MostrarReserva.FieldByName('Nome').AsString, 3 );
end;


procedure TForm_MontaReserva.ToolButton_RelResumoOcupacaoClick(Sender: TObject);
begin
  if PrintDialog1.Execute then
     RichPrinter1.PrintRichEdit(Text1,1);
end;

procedure TForm_MontaReserva.ToolButton_FecharResumoClick(Sender: TObject);
begin
   JvCaptionPanel_Resumo.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento da selecao do hospede atraves da Identidade, nome_guerra ou nome
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.SelecionarHospede(Sender: TObject);
var
   VS_Comando: String;
   VB_Where: Boolean;
begin
   VS_Comando:= 'Select identidade, nome, posto, nome_guerra, Telefone_Funcional, OM_Origem, situacao, obs from hospede ';
   VB_Where:= False;

   if trim(MaskEdit_Identidade_Mapa.Text) <> '' then
   begin
      VS_Comando:= VS_Comando+' Where Identidade = '+#39+FormatFloat('000000000000', StrToFloat(MaskEdit_Identidade_Mapa.Text))+#39;
      VB_Where:= true;
   end;

   if trim(MaskEdit_Nome_Guerra_hospede.Text) <> '' then
   begin
      if VB_where = False then
         VS_Comando:= VS_Comando+' Where Nome_Guerra like '+#39+trim(MaskEdit_Nome_Guerra_hospede.Text)+'%'+#39
      else
         VS_Comando:= VS_Comando+' and Nome_Guerra like '+#39+trim(MaskEdit_Nome_Guerra_hospede.Text)+'%'+#39;
      VB_Where:= true;
   end;

   if trim(MaskEdit_Nome_Hospede.Text) <> '' then
   begin
      if VB_where = False then
         VS_Comando:= VS_Comando+' Where Nome like '+#39+'%'+trim(MaskEdit_Nome_Hospede.Text)+'%'+#39
      else
         VS_Comando:= VS_Comando+' and Nome like '+#39+'%'+trim(MaskEdit_Nome_Hospede.Text)+'%'+#39;
      VB_Where:= true;
   end;
   VS_Comando:= VS_Comando+'Order By Nome';

   Executa_Query_hospede(VS_Comando);

   if Query_Busca_Hospede.FieldByName('Situacao').AsString = 'I' then
   begin
      MessageDlg('O hóspede '+Query_Busca_Hospede.FieldByName('nome').AsString+' não pode ser hospedado,'+#13+
                 'Contate o gerente',mtWarning, [mbOK], 0);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para verificar restricao na hora da hospedagem
//------------------------------------------------------------------------------

Function TForm_MontaReserva.VerificaRestricao(VS_Comando: String): boolean;
var
   VB_Gravar: boolean;
begin
   VB_Gravar:= True;
   Executa_Query_hospede(VS_Comando);

   if Query_Busca_Hospede.RecordCount > 0 then
   begin
      //--- Verifica se o hospede possuir restricao para ser hospedado

      if Query_Busca_Hospede.FieldByName('Situacao').AsString = 'I' then
      begin
         MessageDlg('O hóspede '+Query_Busca_Hospede.FieldByName('nome').AsString+' não pode ser hospedado,'+#13+
                    'Contate o gerente',mtWarning, [mbOK], 0);
         VB_Gravar:= False;
         Mostra_Todas_Reservas;
      end;
   end;
   VerificaRestricao:= VB_Gravar;
end;

procedure TForm_MontaReserva.ComboBox_PredioKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      Monta_Mapa(1);
end;

procedure TForm_MontaReserva.JvTransparentButton_PreviaPrecoClick( Sender: TObject);
begin
   Form_Previsao_Diaria.ShowModal;
end;

//------------------------------------------------------------------------------
// Modulo de Inserção de Dados
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.ToolButton_InserirClick(Sender: TObject);
begin
   VS_Opcao:= 'Inserção ';
   VB_ModuloInsercao:= True;


   Botao( False );
   TrataCampos(False);

   StatusBar.SimpleText:= 'Forneça o nº da identidade do hospede e pressione a tecla <ENTER>';

   DBEdit_Nome.Clear;
   DBEdit_Nome_Guerra.Clear;
   DBEdit_Telefone_Funcional.Clear;
   DBComboBox_OM_Origem.Text:= '';
   DBComboBox_Situacao_Curso.Text:= '';
   DBEdit_Dependente.Clear;
   DBEdit_Data_Entrada.Clear;
   DBEdit_Hora_Entrada.Clear;
   DBEdit_Data_Saida.Clear;
   DBComboBox_Posto_Graduacao.Text:= '';
   DBComboBox_Dependente_de.Text:= '';
   DBEdit_Data_Entrada.Clear;
   DBEdit_Data_Saida.Clear;

//   JvCaptionPanel_relacao.Visible;
   MaskEdit_Nome_Hospede.SetFocus;
end;


//------------------------------------------------------------------------------
// Modulo de Alteração de Dados
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.ToolButton_AlterarClick(Sender: TObject);
begin
   Try
     VS_Opcao:= 'Alteração ';
     Botao(False);
     TrataCampos(False);
     MaskEdit_Identidade.Enabled:= False;
     Table_Reserva.Edit;
     DBEdit_Nome.SetFocus;
   Except
     MessageDlg('Erro na Alteração.', mtInformation,[mbOk], 0);
   end;
end;


//------------------------------------------------------------------------------
// Modulo de Exclusão de Dados
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.ToolButton_ExcluirClick(Sender: TObject);
var
   VS_Comando, VS_Predio, VS_Apto, VS_NomeGuerra: String;
begin
   Botao(False);
   ToolButton_Gravar.Enabled:= False;
   ToolButton_Cancelar.Enabled:= False;
   if MessageDlg('Confirma o cancelamento da hospedagem ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      VS_NomeGuerra:= Table_Reserva.FieldByName('NOME_GUERRA').AsString;
      VS_Predio:= Table_Reserva.FieldByName('PREDIO').AsString;
      VS_Apto:= Table_Reserva.FieldByName('APTO').AsString;

      Funcoes.Log_Recepcao('Exclusão Reserva '+VS_NomeGuerra+' do Prédio '+VS_Predio+' Apto '+VS_Apto);
      Table_Reserva.Delete;
       Atualiza;
   end;
   Botao(True);
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.ToolButton_GravarClick(Sender: TObject);
var
   VS_Dependente, VS_Msg, VS_Comando: String;
   VB_Grava: Boolean;

   VI_Cama, VI_NDep: integer;
begin

   VB_Grava:= True;

    //---
   //--- Verifica se o hospede ja foi hospedado

   if VB_Grava = True then
   begin
      if ((trim(MaskEdit_Identidade_Mapa.Text) <> '') and (VB_Grava = True))  then
          VS_Comando:= 'Select identidade, Nome, dataEntrada, DataSaida, predio, apto, Telefone_Funcional, OM_Origem from reserva where identidade like '+#39+'%'+MaskEdit_Identidade_Mapa.Text+#39
      else
          if (trim(MaskEdit_Nome_Hospede.Text) <> '') then
              VS_Comando:= 'Select identidade, Nome, dataEntrada, DataSaida, predio, apto, Telefone_Funcional, OM_Origem from Reserva where nome = '+#39+MaskEdit_Nome_Hospede.Text+#39
          else
              if (trim(MaskEdit_Nome_Guerra_hospede.Text) <> '') then
                   VS_Comando:= 'Select identidade, Nome, dataEntrada, DataSaida, predio, apto, Telefone_Funcional, OM_Origem from Reserva where Nome_Guerra = '+#39+MaskEdit_Nome_Guerra_hospede.Text+#39;

                   Executa_Query_hospede(VS_Comando);
                  if Query_Busca_Hospede.RecordCount > 0 then
                  begin
                     VS_Msg:='O hospede já possui reserva como mostra a lista abaixo: '+#13;

                     Query_Busca_Hospede.First;
                     While not Query_Busca_Hospede.Eof do
                     begin
                        VS_Msg:= VS_Msg+#13+Query_Busca_Hospede.FieldByName('Identidade').AsString+' '+
                                            Query_Busca_Hospede.FieldByName('Nome').AsString+' ';

                        VS_Msg:= VS_Msg+#13+'Entrada - '+Query_Busca_Hospede.FieldByName('DataEntrada').AsString+' '+
                                            '    Saída - '+Query_Busca_Hospede.FieldByName('DataSaida').AsString+
                                            '    '+PredioAndar+' - '+Query_Busca_Hospede.FieldByName('predio').AsString+
                                            '    Apto - '+Query_Busca_Hospede.FieldByName('apto').AsString;
                        VS_Msg:= VS_Msg+#13;
                        Query_Busca_Hospede.Next;
                     end;

                     if MessageDlg(VS_Msg+#13+#13+'Confirma a reserva ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                        VB_Grava:= True
                     else
                        VB_Grava:= False;
                  end;
               end;


    //---
   // Analiza a Hora

   if ((trim(DBEdit_Hora_Entrada.Text) <> '') and (VB_Grava = True)) then
   begin
      if Funcoes.ValidaHora(DBEdit_Hora_Entrada.Text) = 'IIII'  then
      begin
         VB_Grava:= False;
         DBEdit_Hora_Entrada.SetFocus;
      end;
   end;

   //---
   //--- Analiza o Posto Graduacao

   if ((trim(DBComboBox_Posto_Graduacao.Text) <> '') and (VB_Grava = True))  then
   begin
       VS_Comando:= 'Select * from TABELA_POSTO where posto = '+#39+trim(DBComboBox_Posto_Graduacao.Text)+#39;
       if Procura(VS_Comando) = False then
       begin
          MessageDlg('O posto deve ser escolhida na lista...', mtInformation,[mbOk], 0);
          VB_Grava:= False;
       end;
   end;

    //---
   //--- Analisa Dependente de

   if ((trim(DBComboBox_Dependente_de.Text) <> '') and (trim(DBComboBox_Posto_Graduacao.Text) <> '') and (VB_Grava = True))  then
   begin
      MessageDlg('O Hospede não pode ser o próprio e o dependente ao mesmo tempo...', mtInformation,[mbOk], 0);
      VB_Grava:= False;
   end;

    //---
   //--- Analisa Dependente de

   if ((trim(DBComboBox_Dependente_de.Text) = '') and (trim(DBComboBox_Posto_Graduacao.Text) = '') and (VB_Grava = True))  then
   begin
      MessageDlg('Não foi escolhido o posto...', mtInformation,[mbOk], 0);
      VB_Grava:= False;
   end
   else
   begin
      if ((trim(DBComboBox_Dependente_de.Text) <> '') and (trim(DBComboBox_Posto_Graduacao.Text) = '') and (VB_Grava = True))  then
      begin
         VS_Comando:= 'Select * from TABELA_POSTO where posto = '+#39+trim(DBComboBox_Dependente_de.Text)+#39;
         if Procura(VS_Comando) = False then
         begin
            MessageDlg('O posto do dependente deve ser escolhida na lista...', mtInformation,[mbOk], 0);
            VB_Grava:= False;
         end;
      end;
   end;

    //---
   //--- Analisa se a Data de Entrada eh menor que a data de saida

   if ((StrToDate(DBEdit_Data_Entrada.Text) > StrToDate(DBEdit_Data_Saida.Text)) and (VB_Grava = True)) then
   begin
      MessageDlg('A Data de Entrada não pode ser menor que a data de saída...', mtInformation,[mbOk], 0);
      VB_Grava:= False;
   end;

    //---
   //--- Analisa se a Data de Entrada eh menor que a data de saida

   if ((StrToDate(DBEdit_Data_Entrada.Text) < Date) and (VB_Grava = True)) then
   begin
      ShowMessage('A Data de entrada não pode ser menor que a data atual que é '+DateToStr(Date));
      VB_Grava:= False;
      DBEdit_Data_Entrada.SetFocus;
   end;

   if ((trim(MaskEdit_Identidade_Mapa.Text) = '') and (trim(MaskEdit_Nome_Guerra_hospede.Text) = '') and
       (trim(MaskEdit_Nome_Hospede.Text) = '') and (VB_Grava = True)) then
   begin
      MessageDlg('É obrigatório fornecer o número da identidade ou Nome completo ou Nome de guerra para efetuar a reserva...', mtInformation,[mbOk], 0);
      VB_Grava:= False;
      MaskEdit_Identidade_Mapa.SetFocus;
   end;

{    //---
   //--- Verifica se existe hospede com o CPF fornecido

   if ((trim(MaskEdit_CPF.Text) <> '') and (VB_Gravar = True)) then
   begin
      VB_Gravar:= VerificaRestricao('Select * from hospede where cpf = '+#39+Trim(MaskEdit_CPF.Text)+#39);
   end
}
    //---
   //--- Verifica se existe hospede com a identidade fornecido

   if ((trim(MaskEdit_Identidade_Mapa.Text) <> '') and (VB_Grava = True)) then
   begin
      MaskEdit_Identidade_Mapa.Text:= Funcoes.NIdentidade(Trim(MaskEdit_Identidade_Mapa.Text));
      VB_Grava:= VerificaRestricao('Select * from hospede where identidade = '+#39+Trim(MaskEdit_Identidade_Mapa.Text)+#39);
   end;

   //--- Inicia a Gravacao

   if VB_Grava = True then
   begin
      Funcoes.Log_Recepcao(VS_Opcao+' da Reserva Prédio '+Table_Reserva.FieldByName('Predio').AsString+' Apto '+Table_Reserva.FieldByName('Apto').AsString);
      Table_Reserva.FieldByName('Cama').AsString:= Table_Busca_Cama.FieldByName('Cama').AsString;
      Table_Reserva.Post;
      MaskEdit_Identidade.Enabled:= True;
      Atualiza;
      Botao(True);
      TrataCampos(True);


                  //--- Verifica se possui dependente

                  if Table_Reserva.FieldByName('Dependente').AsInteger > 0 then
                  begin
                     VI_Cama:= IBQuery_Visao.FieldByName('Cama').AsInteger;
                     VI_NDep:= 1;
                     VS_Dependente:= 'Dep - '+Table_Reserva.FieldByName('Nome_Guerra').AsString;

                     While VI_NDep <= Table_Reserva.FieldByName('Dependente').AsInteger do
                     begin
                        VI_Cama:= VI_Cama + 1;
                        VI_NDep:= VI_NDep + 1;
                        Table_CadReserva.Append;
                        Table_CadReserva.FieldByName('IDENTIDADE').AsString:= 'DEPENDENTE';
                        Table_CadReserva.FieldByName('NOME').AsString:= VS_Dependente;
                        Table_CadReserva.FieldByName('NOME_GUERRA').AsString:= '';
//                        Table_CadReserva.FieldByName('NOME_GUERRA').AsString:= VS_NomeGuerra;
                        Table_CadReserva.FieldByName('PREDIO').AsString:= IBQuery_Visao.FieldByName('Predio').AsString;
                        Table_CadReserva.FieldByName('APTO').AsString:= IBQuery_Visao.FieldByName('Apto').AsString;
                        Table_CadReserva.FieldByName('CAMA').AsInteger:= VI_Cama;
//                        Table_CadReserva.FieldByName('DEPENDENTE').AsString:= MaskEdit_Dependente.Text;
//                        Table_CadReserva.FieldByName('Telefone_Funcional').AsString:= MaskEdit_Telefone.Text;
//                        Table_CadReserva.FieldByName('HORAENTRADA').AsString:= MaskEdit_Hora.Text;
//                        Table_CadReserva.FieldByName('SITUACAO_CURSO').AsString:= ComboBox_Situacao_Curso_.Text;
//                        Table_CadReserva.FieldByName('SISCEAB').AsString:= ComboBox_SISCEAB.Text;
//                        Table_CadReserva.FieldByName('DataEntrada').AsString:= DateToStr(DateTimePicker_Entrada__.Date);
//                        Table_CadReserva.FieldByName('DataSaida').AsString:= DateToStr(DateTimePicker_Saida.Date);
                        Table_CadReserva.post;
                     end;
                  end;

                  //--- Atualiza o mapa

                  Mostra_Todas_Reservas;
                  Monta_Mapa(1);


   end;

end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.ToolButton_CancelarClick(Sender: TObject);
begin
   Try
      Table_Reserva.Cancel;
      MaskEdit_Identidade.Enabled:= True;
      Botao(True);
      Atualiza;
      TrataCampos(True);
   Except
      MessageDlg('Erro na Cancelamento.', mtInformation,[mbOk], 0);
   end;
end;



//------------------------------------------------------------------------------
// Procedure para atualizar a Identidade ao selecionar a reserva
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.Query_ReservaAfterScroll(DataSet: TDataSet);
begin
   if Query_Reserva.Recordcount = 0 then
   begin
      ToolButton_Alterar.Enabled:= False;
      ToolButton_Excluir.Enabled:= False;
   end;

   MaskEdit_Identidade.Text:= Table_Reserva.FieldByName('IDENTIDADE').AsString;
end;

//------------------------------------------------------------------------------
// Tratamento quando a reserva ja esta cadastrada
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.Table_ReservaPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
   if (E is EDBEngineError) then
      if (E as EDBEngineError).Errors[0].ErrorCode = 9729 then
      begin
         MessageDlg('Já existe uma reserva com esta'+#13+#13+'Identidade e esta Data de Entrada...',mtWarning, [mbOK], 0);
         Abort;
         MaskEdit_Identidade.SetFocus;
      end;
end;

//------------------------------------------------------------------------------
// Procedure de Redresh da Query
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.Atualiza;
begin
   Query_Reserva.Close;
   Query_Reserva.Open;
end;

//------------------------------------------------------------------------------
// Desabilita o acesso aos campos de tratamento do Aerodromo
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.TrataCampos(Status: Boolean);
begin
   VB_Nao_Busca_Identidade:= Status;
   DBGrid_Reserva.Enabled:= Status;
   DBEdit_Nome.ReadOnly:= Status;
   DBEdit_Nome_Guerra.ReadOnly:= Status;
   DBEdit_Telefone_Funcional.ReadOnly:= Status;
   DBComboBox_OM_Origem.ReadOnly:= Status;
   DBComboBox_Situacao_Curso.ReadOnly:= Status;
   DBEdit_Dependente.ReadOnly:= Status;
   DBEdit_Data_Entrada.ReadOnly:= Status;
   DBEdit_Hora_Entrada.ReadOnly:= Status;
   DBEdit_Data_Saida.ReadOnly:= Status;
   DBComboBox_Posto_Graduacao.ReadOnly:= Status;
   DBComboBox_Dependente_de.ReadOnly:= Status;
//   DBLookupComboBox_Predio.ReadOnly:= Status;
//   DBLookupComboBox_Apto.ReadOnly:= Status;
end;

//------------------------------------------------------------------------------
// Trata dos Botoes
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.Botao(Status: Boolean);
begin
   ToolButton_Inserir.Enabled:= Status;
    //---
   //--- Tratamento dos botoes quando não houver reserva

   if Query_Reserva.Recordcount = 0 then
   begin
      ToolButton_Alterar.Enabled:= False;
      ToolButton_Excluir.Enabled:= False;
   end
   else
   begin
      ToolButton_Alterar.Enabled:= Status;

      if Funcoes.GetPrivilegio = 'C' then
         ToolButton_Excluir.Enabled:= False
      else
         ToolButton_Excluir.Enabled:= Status;

   end;
   if Status = False then
      Status:= True
   else
      Status:= False;

   ToolButton_Gravar.Enabled:= Status;
   ToolButton_Cancelar.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Funcao para procurar o select do VS_Comando
//------------------------------------------------------------------------------

Function TForm_MontaReserva.Procura(VS_Comando: String): Boolean;
begin
   Query_Procura.Close;
   Query_Procura.SQL.Clear;
   Query_Procura.SQL.Add(VS_Comando);
   Query_Procura.Open;

   if Query_Procura.RecordCount = 0 then
      Result:= False
   else
      Result:= True;
end;


procedure TForm_MontaReserva.DBGrid_ReservaTitleClick(Column: TColumn);
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

//------------------------------------------------------------------------------
// Procedure com a finalidade de procurar a reserva desejada
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.BuscaReserva(Sender: TObject);
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


//------------------------------------------------------------------------------
// Tratamento quando tira o foco da Grid de seleção
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.DBGrid_VisaoExit(Sender: TObject);
begin
//   JvTransparentButton_EfetuaReserva.Enabled:= False;
//   JvTransparentButton_CancelaReserva.Enabled:= False;
end;


//------------------------------------------------------------------------------
// Tratamento para deixar a janela de selecao do hospede  para reserva invisivel
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.JvTransparentButton_FecharRelatoriosClick(Sender: TObject);
begin
   JvCaptionPanel_relacao.Visible:= False;
end;

end.




{

//------------------------------------------------------------------------------
// Procedure para tratar a reserva do hospede
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.JvTransparentButton_EfetuaReservaClick(Sender: TObject);
var
   VS_NomeGuerra, VS_Dependente, VS_Msg, VS_Comando: String;
   VB_Gravar: Boolean;
   VI_NDep, VI_Cama: Integer;
begin
   Duplo_Click:= False;
   VB_Gravar:= True;

   if DateTimePicker_Entrada__.Date > DateTimePicker_Saida.Date then
   begin
       ShowMessage('A Data de entrada não pode ser maior que a data de Saída...');
       DateTimePicker_Entrada__.SetFocus;
   end
   else
   begin


                //---
               //--- Analiza o Nome da Reserva

               if VB_Gravar = True then
                  if ((trim(MaskEdit_Nome_Hospede.Text) <> '') and (Funcoes.VerificaNome(trim(MaskEdit_Nome_Hospede.Text)) = False)) then
                     VB_Gravar:= False;

                //---
               //--- Analiza o Nome de Guerra da Reserva

               if VB_Gravar = True then
                  if ((trim(MaskEdit_Nome_Guerra_hospede.Text) <> '') and (Funcoes.VerificaNome(trim(MaskEdit_Nome_Guerra_hospede.Text)) = False)) then
                     VB_Gravar:= False;

                   //---
                  //--- Verifica se o posto pode ser hospedado no apto selecionado

               if ((trim(ComboBox_Posto_Graduacao.Text) <> '') and (VB_Gravar = True))  then
               begin
                  VS_Comando:= 'select distinct PostoGraduação from REGRASDEDIARIAS where predio = '+#39+ComboBox_Predio.Text+#39+' and upper(PostoGraduação) = '+#39+trim(ComboBox_Posto_Graduacao.Text)+#39;
                  if Funcoes.Procura(VS_Comando) = False then
                  begin
                     MessageDlg('O Posto/Graduação de '+trim(ComboBox_Posto_Graduacao.Text)+' não ser hospedado no '+PredioAndar+trim(IBQuery_Visao.FieldByName('Predio').AsString)+' .'+#13+
                                'Verifique se o posto esta correto,'+#13, mtError,[mbOk], 0);
                     VB_Gravar:= False;
                  end;
               end;

                //---
               // Tratamento da gravacao da reserva

               if VB_Gravar = True then
               begin
                  //--- Montagem da reserva

                  Table_CadReserva.Append;

                  if Query_Busca_Hospede.RecordCount > 0 then
                  begin     //--- Tratamento dos campos quando o hospede existir
                     VS_Dependente:= 'Dep - '+MaskEdit_Nome_Guerra_hospede.Text;
                     VS_NomeGuerra:= MaskEdit_Nome_Guerra_hospede.Text;
                     Table_CadReserva.FieldByName('IDENTIDADE').AsString:= MaskEdit_Identidade_Mapa.Text;
                     Table_CadReserva.FieldByName('NOME').AsString:= MaskEdit_Nome_hospede.Text;
                     Table_CadReserva.FieldByName('NOME_GUERRA').AsString:= MaskEdit_Nome_Guerra_hospede.Text;
                     Table_CadReserva.FieldByName('TELEFONE_FUNCIONAL').AsString:= Query_Busca_Hospede.FieldByName('TELEFONE_FUNCIONAL').AsString;
                     Table_CadReserva.FieldByName('OM_ORIGEM').AsString:= Query_Busca_Hospede.FieldByName('OM_ORIGEM').AsString;
                  end
                  else
                  begin
                     Table_CadReserva.FieldByName('IDENTIDADE').AsString:= MaskEdit_Identidade_Mapa.Text;
                     if ((trim(MaskEdit_Nome_Hospede.Text) <> '') and (trim(MaskEdit_Nome_Guerra_hospede.Text) <> '')) then
                     begin
                        VS_Dependente:= 'Dep - '+MaskEdit_Nome_Guerra_hospede.Text;
                        VS_NomeGuerra:= MaskEdit_Nome_Guerra_hospede.Text;
                        Table_CadReserva.FieldByName('NOME').AsString:= MaskEdit_Nome_Hospede.Text;
                        Table_CadReserva.FieldByName('NOME_GUERRA').AsString:= MaskEdit_Nome_Guerra_hospede.Text;
                     end
                     else
                     begin
                        if ((trim(MaskEdit_Nome_Hospede.Text) = '') and (trim(MaskEdit_Nome_Guerra_hospede.Text) <> '')) then
                        begin
                           VS_Dependente:= 'Dep - '+MaskEdit_Nome_Guerra_hospede.Text;
                           VS_NomeGuerra:= MaskEdit_Nome_Guerra_hospede.Text;
                           Table_CadReserva.FieldByName('NOME').AsString:= MaskEdit_Nome_Guerra_hospede.Text;
                           Table_CadReserva.FieldByName('NOME_GUERRA').AsString:= MaskEdit_Nome_Guerra_hospede.Text;
                        end
                        else
                        begin
                           if ((trim(MaskEdit_Nome_Hospede.Text) <> '') and (trim(MaskEdit_Nome_Guerra_hospede.Text) = '')) then
                           begin
                              VS_Dependente:= 'Dep - '+MaskEdit_Nome_Hospede.Text;
                              VS_NomeGuerra:= MaskEdit_Nome_Guerra_hospede.Text;
                              Table_CadReserva.FieldByName('NOME').AsString:= MaskEdit_Nome_Hospede.Text;
                              Table_CadReserva.FieldByName('NOME_GUERRA').AsString:= MaskEdit_Nome_Hospede.Text;
                           end
                           else
                           begin
                              VS_Dependente:= 'Dep - RG - '+MaskEdit_Identidade_Mapa.Text;
                              VS_NomeGuerra:= 'RG - '+MaskEdit_Identidade_Mapa.Text;
                              Table_CadReserva.FieldByName('NOME').AsString:= 'RG - '+MaskEdit_Identidade_Mapa.Text;
                              Table_CadReserva.FieldByName('NOME_GUERRA').AsString:= 'RG - '+MaskEdit_Identidade_Mapa.Text;
                           end;
                        end;
                     end;
                  end;

                  Funcoes.Log_Recepcao('Cadastro da Reserva '+VS_NomeGuerra+' do Prédio '+VS_Predio+' Apto '+VS_Apto);
                  Table_CadReserva.FieldByName('POSTO').AsString:= ComboBox_Posto_Graduacao.Text;
                  Table_CadReserva.FieldByName('HORAENTRADA').AsString:= MaskEdit_Hora.Text;
                  Table_CadReserva.FieldByName('SITUACAO_CURSO').AsString:= ComboBox_Situacao_Curso_.Text;
                  Table_CadReserva.FieldByName('SISCEAB').AsString:= ComboBox_SISCEAB.Text;
                  Table_CadReserva.FieldByName('DataEntrada').AsString:= DateToStr(DateTimePicker_Entrada__.Date);
                  Table_CadReserva.FieldByName('DataSaida').AsString:= DateToStr(DateTimePicker_Saida.Date);
                  Table_CadReserva.FieldByName('Dependente').AsString:= MaskEdit_Dependente.Text;
                  Table_CadReserva.FieldByName('Telefone_Funcional').AsString:= MaskEdit_Telefone.Text;
                  Table_CadReserva.FieldByName('Recebe').AsString:= 'H';
                  Table_CadReserva.FieldByName('Usuario').AsString:= Funcoes.GetUsuario;
                  Table_CadReserva.FieldByName('PREDIO').AsString:= IBQuery_Visao.FieldByName('Predio').AsString;
                  Table_CadReserva.FieldByName('APTO').AsString:= IBQuery_Visao.FieldByName('Apto').AsString;
                  Table_CadReserva.FieldByName('CAMA').AsString:= IBQuery_Visao.FieldByName('Cama').AsString;
                  Table_CadReserva.post;

               end;
            end;
         end;
   end;
end;

}


{

//------------------------------------------------------------------------------
// Modulo de tratamento da Inserção de Dados da reserva
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.TrataInsercao;
begin
end;


}
