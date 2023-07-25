unit MontaReserva;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBTable, ExtCtrls, Grids, DBGrids, IBQuery,
  StdCtrls, DBCtrls, ComCtrls, Mask, Buttons, JvGradient, JvComponent,
  JvxClock, jpeg, ToolWin, DBTables, Rotinas, JvCaptionPanel, RichPrint,
  PsyRichEdit;

type
  TForm_MontaReserva = class(TForm)
    IBQuery_Mapa: TIBQuery;
    IBTable_Hotel: TIBTable;
    DSQ_Mapa: TDataSource;
    IBQuery_MapaIDENTIDADE: TIBStringField;
    IBQuery_MapaPREDIO: TIBStringField;
    IBQuery_MapaAPTO: TIntegerField;
    IBQuery_MapaCAMA: TIntegerField;
    IBQuery_MapaRAMAL: TIBStringField;
    IBQuery_MapaNOME: TIBStringField;
    IBQuery_MapaTIPO: TIBStringField;
    IBQuery_MapaSITUACAO: TIBStringField;
    IBQuery_MapaSITUACAO_CURSO: TIBStringField;
    IBQuery_MapaDATA_ENTRADA: TIBStringField;
    IBQuery_MapaDATA_SAIDA: TIBStringField;
    IBQuery_MapaCODIGO: TIBStringField;
    StatusBar1: TStatusBar;
    Label9: TLabel;
    DBText3: TDBText;
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
    IBQuery_Monta_Mapa: TIBQuery;
    DSQ_MontaMapa: TDataSource;
    IBTable_Mapa_Dep: TIBTable;
    IBTable_Hospedagem: TIBTable;
    IBTable_Reserva: TIBTable;
    IBTable_Hospede01: TIBTable;
    DataSource2: TDataSource;
    IBTable_Hospede: TIBTable;
    DataSource3: TDataSource;
    DST_MapaDep: TDataSource;
    IBQuery_Busca: TIBQuery;
    DSQ_Busca: TDataSource;
    Panel_TrataReserva: TPanel;
    GroupBox8: TGroupBox;
    ScrollBox1: TScrollBox;
    GroupBox_DataEntrada: TGroupBox;
    DateTimePicker_Entrada: TDateTimePicker;
    GroupBox_DataSaida: TGroupBox;
    DateTimePicker_Saida: TDateTimePicker;
    GroupBox_Hora: TGroupBox;
    MaskEdit_Hora: TMaskEdit;
    GroupBox_Situacao: TGroupBox;
    ComboBox_Situacao_Curso: TComboBox;
    GroupBox_Dependente: TGroupBox;
    MaskEdit_Dependente: TMaskEdit;
    GroupBox_Posto_Graduacao: TGroupBox;
    ComboBox_Posto_Graduacao: TComboBox;
    GroupBox_NomeGuerra: TGroupBox;
    MaskEdit_Nome_Guerra_hospede: TMaskEdit;
    GroupBox_NomeCompleto: TGroupBox;
    MaskEdit_Nome_Hospede: TMaskEdit;
    GroupBox_Identidade: TGroupBox;
    MaskEdit_Identidade: TMaskEdit;
    ToolBar4: TToolBar;
    ToolButton_Reserva: TToolButton;
    ToolButton_Cancela_Reserva: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    ToolButton_Ajuda: TToolButton;
    GroupBox1: TGroupBox;
    vv: TJvGradient;
    ProgressBar1: TProgressBar;
    MaskEdit_Busca_Nome_Completo: TMaskEdit;
    Label19: TLabel;
    MaskEdit_Nome_Guerra: TMaskEdit;
    Label18: TLabel;
    MaskEdit_Ramal: TMaskEdit;
    Label5: TLabel;
    ComboBox_Ano: TComboBox;
    Label20: TLabel;
    ComboBox_Mes: TComboBox;
    Label1: TLabel;
    Label_Predio: TLabel;
    ComboBox_Predio: TComboBox;
    SpeedButton_Atualizar: TSpeedButton;
    IBTable_Busca_Posto: TIBTable;
    IBTable_Busca_PostoCODIGO: TIBStringField;
    IBTable_Busca_PostoCODTABELA: TIBStringField;
    IBTable_Busca_PostoPOSTO: TIBStringField;
    DST_Busca_Posto: TDataSource;
    DST_Busca_Tabela_Preco: TDataSource;
    IBQuery_Tabela_Posto: TIBQuery;
    IBQuery_Tabela_PostoPREDIO: TIBStringField;
    IBQuery_Tabela_PostoVALOR: TIBBCDField;
    IBQuery_Tabela_PostoPOSTO: TIBStringField;
    IBQuery_Tabela_PostoCODIGO: TIBStringField;
    IBTable_Busca_Tabela_Preco: TIBTable;
    IBTable_Busca_Tabela_PrecoPREDIO: TIBStringField;
    IBTable_Busca_Tabela_PrecoCODIGO: TIBStringField;
    IBTable_CadReserva: TIBTable;
    IBTable_CadReservaIDENTIDADE: TIBStringField;
    IBTable_CadReservaDATAENTRADA: TDateTimeField;
    IBTable_CadReservaNOME: TIBStringField;
    IBTable_CadReservaNOME_GUERRA: TIBStringField;
    IBTable_CadReservaPOSTO: TIBStringField;
    IBTable_CadReservaDEPENDENTE_DE: TIBStringField;
    IBTable_CadReservaTELEFONE_FUNCIONAL: TIBStringField;
    IBTable_CadReservaSITUACAO_CURSO: TIBStringField;
    IBTable_CadReservaOM_ORIGEM: TIBStringField;
    IBTable_CadReservaDEPENDENTE: TSmallintField;
    IBTable_CadReservaHORAENTRADA: TIBStringField;
    IBTable_CadReservaDATASAIDA: TDateTimeField;
    IBTable_CadReservaPREDIO: TIBStringField;
    IBTable_CadReservaAPTO: TSmallintField;
    IBTable_CadReservaCAMA: TSmallintField;
    IBTable_CadReservaRECEBE: TIBStringField;
    IBTable_CadReservaUSUARIO: TIBStringField;
    IBQuery_Busca_Hospede: TIBQuery;
    DSQ_Busca_Hospede: TDataSource;
    DBGrid_Busca_Hospede: TDBGrid;
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
    Panel2: TPanel;
    Label7: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel12: TPanel;
    Panel15: TPanel;
    Panel_ApresentaMapa: TPanel;
    Panel_Mapa: TPanel;
    Panel3: TPanel;
    Label17: TLabel;
    GroupBox_SituacaoAtual: TGroupBox;
    ToolBar1: TToolBar;
    ToolButton_ReduzMapa: TToolButton;
    ToolButton_AmpliaMapa: TToolButton;
    DBNavigator_Visao: TDBNavigator;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    Label25: TLabel;
    DBText14: TDBText;
    Label26: TLabel;
    DBText15: TDBText;
    DBText16: TDBText;
    Label27: TLabel;
    DBText17: TDBText;
    DBText18: TDBText;
    DBText19: TDBText;
    Label28: TLabel;
    DBText20: TDBText;
    Label29: TLabel;
    DBText21: TDBText;
    Label_Indiponiveis: TLabel;
    Label_Reservas: TLabel;
    Label_Hospedagens: TLabel;
    Label_TotalVagas: TLabel;
    DBGrid_Mapa: TDBGrid;
    DBGrid_Visao: TDBGrid;
    IBQuery_VisaoCAMA: TIBStringField;
    IBTable_VisaoCAMA: TIBStringField;
    DST_CadReserva: TDataSource;
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
    DSQ_MostrarReservas: TDataSource;
    IBQuery_MostraReserva: TIBQuery;
    ToolButton_MostrarReservas: TToolButton;
    JvCaptionPanel_Resumo: TJvCaptionPanel;
    ToolBar2: TToolBar;
    ToolButton_RelResumoOcupacao: TToolButton;
    ToolButton3: TToolButton;
    ToolButton_FecharResumo: TToolButton;
    StatusBar3: TStatusBar;
    RichPrinter1: TRichPrinter;
    PrintDialog1: TPrintDialog;
    SpeedButton_MostraResumo: TSpeedButton;
    Text1: TPsyRichEdit;
    GroupBox_Telefone: TGroupBox;
    MaskEdit_Telefone: TMaskEdit;
    IBTable_Historico: TIBTable;
    IBTable_HistoricoIDENTIDADE: TIBStringField;
    IBTable_HistoricoFICHA: TIBStringField;
    IBTable_HistoricoANO: TSmallintField;
    IBTable_HistoricoPREDIO: TIBStringField;
    IBTable_HistoricoAPTO: TSmallintField;
    IBTable_HistoricoDATAENTRADA: TDateTimeField;
    IBTable_HistoricoDATAPAGAMENTO: TDateTimeField;
    Panel14: TPanel;
    Panel16: TPanel;
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
    IBTable_Resp: TIBTable;
    DST_Resp: TDataSource;
    IBTable_Responsavel: TIBTable;
    DST_Responsavel: TDataSource;

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
    procedure ToolButton_ReservaClick(Sender: TObject);
    procedure ToolButton_Cancela_ReservaClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure DBGrid_Busca_HospedeDblClick(Sender: TObject);
    procedure ToolButton_ReduzMapaClick(Sender: TObject);
    procedure ToolButton_AmpliaMapaClick(Sender: TObject);
    procedure ComboBox_Posto_GraduacaoEnter(Sender: TObject);
    procedure ToolButton_EmissaoRelBoletimEscolarClick(Sender: TObject);
    procedure ToolButton_FinalizaRelatorioClick(Sender: TObject);
    procedure ToolButton_MostrarReservasClick(Sender: TObject);
    procedure DBGrid_VisaoExit(Sender: TObject);
    procedure ToolButton_RelResumoOcupacaoClick(Sender: TObject);
    procedure ToolButton_FecharResumoClick(Sender: TObject);
    procedure SpeedButton_MostraResumoClick(Sender: TObject);
  private    { Private declarations }
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

uses Module, Rel_Rela_Reserva;

{$R *.dfm}

procedure TForm_MontaReserva.FormActivate(Sender: TObject);
Var
   dia, mes, ano: Word;
begin
   DateTimePicker_Entrada.Date:= Date;
   DateTimePicker_Saida.Date:= Date;
   
   Text1.Lines.Clear;
   Label_Predio.Caption:= PredioAndar+':';

   ComboBox_Situacao_Curso.Items.Clear;
   ComboBox_Situacao_Curso.Items.Add('TRANSITO');
   ComboBox_Situacao_Curso.Items.Add('RESIDENTE');

   if DM.Habilitado_Para = 'HOTEL CTA' then
   begin
      ComboBox_Situacao_Curso.Items.Add('TRANSITO');
      ComboBox_Situacao_Curso.Items.Add('RESIDENTE');
      ComboBox_Situacao_Curso.Items.Add('CURSO<30D');
      ComboBox_Situacao_Curso.Items.Add('CURSO>30D');
      ComboBox_Situacao_Curso.Items.Add('CURSO PNR');
      ComboBox_Situacao_Curso.Items.Add('VISITA ESP');
   end;

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

   Funcoes.AlimentaComboBox(ComboBox_Predio, 0, 'Todos');
   IBQuery_mapa.Close;
   ToolButton_Reserva.Enabled:= False;
   ToolButton_Cancela_Reserva.Enabled:= False;
   ToolButton_ReduzMapaClick(Sender);

   Label_TotalVagas.Caption:= '';
   Label_Hospedagens.Caption:= '';
   Label_Reservas.Caption:= '';
   Label_Indiponiveis.Caption:= '';

   Duplo_Click:= False;
   VI_Close:= 1000;

   LimpaMapa;

   IBQuery_Visao.Open;
   IBTable_Visao.Open;
   IBTable_Mostrar.Open;

   IBTable_Historico.Open;
   IBTable_Hospede.Open;
   IBTable_Hospedagem.Open;
   IBTable_Reserva.Open;
   IBTable_Mapa_Dep.Open;
   IBTable_Hospede01.Open;
   IBTable_Responsavel.Open;
   IBQuery_Mapa.Close;

   IBQuery_Busca_Hospede.Open;
   IBTable_CadReserva.Open;

   Mostra_Todas_Reservas;
   ComboBox_Predio.Text:= '';
   VI_Close:= 0;
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
       Funcoes.ExecSql_Local('Delete from visao');
       Funcoes.ExecSql_Local('Delete from mapa');
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
   VB_Grava, VB_Retorno: Boolean;
begin
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
    ProgressBar1.Max:= IBQuery_Monta_Mapa.RecordCount;

    While not IBQuery_Monta_Mapa.Eof do
    begin
       VB_Grava:= True;

       ProgressBar1.StepBy(1);
       Update;

       //--- Monta o cabecalho

       if (( VS_Predio <> IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString) or
           ( VS_Apto <> IBQuery_Monta_Mapa.FieldByName('apto').AsString)) then
       begin
          VS_Predio:=IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString;
          VS_Apto:=  IBQuery_Monta_Mapa.FieldByName('apto').AsString;
          VI_Codigo:= VI_Codigo + 1;

          VB_Retorno:= MontaVisao( FormatFloat('000', VI_Codigo),
                                   CABECALHO,   // VS_Tipo
                                   IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString+' -'+
                                      IBQuery_Monta_Mapa.FieldByName('APTO').AsString+'- R. '+
                                      IBQuery_Monta_Mapa.FieldByName('RAMAL').AsString+' - '+
                                      IBQuery_Monta_Mapa.FieldByName('TV1').AsString+'  '+
                                      IBQuery_Monta_Mapa.FieldByName('TV2').AsString,
                                   ' ',    // VS_DataEntrada
                                   ' '     //VS_DataSaida
                                  );
          GravaVisao(FormatFloat('000', VI_Codigo), IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString, IBQuery_Monta_Mapa.FieldByName('apto').AsString, ' ');
       end;

       // Setar incialmente como DESOCUPADO

       VI_Vagas:= VI_Vagas+1;
       for i:= 1 to 31 do
          SetarDiaTipo( I, '   ', DESOCUPADO );

       for i:= diaTermino to 31 do
          SetarDiaTipo( I, '   ', '9' );

       //--- RESERVA

       if IBTable_Reserva.RecordCount > 0 then
       begin
          IBTable_Reserva.First;
          While not IBTable_Reserva.Eof do
          begin
             VI_Codigo:= VI_Codigo + 1;
             VB_Retorno:= MontaVisao( FormatFloat('000', VI_Codigo),
                                            RESERVA,   // VS_Tipo
                                            ' ',       // VS_Situacao
                                            IBTable_Reserva.FieldByName('dataentrada').AsString,
                                            IBTable_Reserva.FieldByName('datasaida').AsString
                                           );

             if VB_Retorno = True then
             begin
                VI_Reservas:= VI_Reservas + 1;

                Grava_Mapa( VI_Codigo,
                            IBQuery_Monta_Mapa.FieldByName('virtual').AsString,
                            IBTable_Reserva.FieldByName('Identidade').AsString,
                            IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString,
                            IBQuery_Monta_Mapa.FieldByName('apto').AsString,
                            IBQuery_Monta_Mapa.FieldByName('cama').AsString,
                            IBQuery_Monta_Mapa.FieldByName('Ramal').AsString,
                            ' ',
                            ' ',
                            RESERVA,
                            FormatFloat('000', VI_Codigo)+' - '+Trim(IBTable_Reserva.FieldByName('Posto').AsString)+' '+
                               IBTable_Reserva.FieldByName('nome_guerra').AsString,
                            IBTable_Reserva.FieldByName('situacao_curso').AsString,
                            IBTable_Reserva.FieldByName('nome').AsString,
                            IBTable_Reserva.FieldByName('dataentrada').AsString,
                            IBTable_Reserva.FieldByName('datasaida').AsString
                          );
             end
             else
             begin
                VI_Codigo:= VI_Codigo - 1;
             end;
             IBTable_Reserva.Next;
          end;
       end;

       //--- Tratamento quando tiver hospode
       if Trim(IBQuery_Monta_Mapa.FieldByName('APTCODIGO').AsString) = 'OCUPADO' then
       begin
          VI_Codigo:= VI_Codigo + 1;
          VB_Retorno:= MontaVisao( FormatFloat('000', VI_Codigo),
                                   OCUPADO,   // VS_Tipo
                                   ' ',       // VS_Situacao
                                   IBTable_Hospedagem.FieldByName('DataEntrada').AsString,
                                      IBTable_Hospedagem.FieldByName('DataSaida').AsString
                                     );

          if VB_Retorno = True then
          begin
             VI_Hospedagen:= VI_Hospedagen+1;
             if IBTable_Hospede.RecordCount = 0 then
             begin
                Grava_Mapa( VI_Codigo,
                            IBQuery_Monta_Mapa.FieldByName('virtual').AsString,
                            IBTable_Hospede.FieldByName('Identidade').AsString,
                            IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString,
                            IBQuery_Monta_Mapa.FieldByName('apto').AsString,
                            IBQuery_Monta_Mapa.FieldByName('cama').AsString,
                            IBQuery_Monta_Mapa.FieldByName('Ramal').AsString,
                            ' ',
                            ' ',
                            OCUPADO,
                            FormatFloat('000', VI_Codigo)+' - '+Trim(IBQuery_Monta_Mapa.FieldByName('Nome').AsString),
                            'OCUPADO',
                            IBQuery_Monta_Mapa.FieldByName('NOME').AsString,
                            ' ',
                            ' '
                           );
             end
             else
             begin
                VI_Hospedagen:= VI_Hospedagen+1;
                IBTable_Hospede.First;
                While not IBTable_Hospede.eof do
                begin
                   Grava_Mapa( VI_Codigo,
                               IBQuery_Monta_Mapa.FieldByName('virtual').AsString,
                               IBTable_Hospede.FieldByName('Identidade').AsString,
                               IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString,
                               IBQuery_Monta_Mapa.FieldByName('apto').AsString,
                               IBQuery_Monta_Mapa.FieldByName('cama').AsString,
                               IBQuery_Monta_Mapa.FieldByName('Ramal').AsString,
                               ' ',
                               ' ',
                               OCUPADO,
                               FormatFloat('000', VI_Codigo)+' - '+Trim(IBTable_Hospede.FieldByName('Posto').AsString)+' '+
                                     IBTable_Hospede.FieldByName('NOME_GUERRA').AsString,
                               IBTable_Hospede.FieldByName('situacao_curso').AsString,
                               IBTable_Hospede.FieldByName('nome').AsString,
                               IBTable_Hospedagem.FieldByName('DataEntrada').AsString,
                               IBTable_Hospedagem.FieldByName('DataSaida').AsString
                              );
                   IBTable_Hospede.Next;
                end;
             end;
             end;
          end
          else
          begin          //--- DEPENDENTE DE HOSPEDE
             if Trim(IBQuery_Monta_Mapa.FieldByName('APTCODIGO').AsString) = 'DEP' then
             begin
                VI_Codigo:= VI_Codigo + 1;
                VI_Hospedagen:= VI_Hospedagen+1;

                VB_Retorno:= MontaVisao( FormatFloat('000', VI_Codigo),
                                         OCUPADO,   // VS_Tipo
                                         ' ',       // VS_Situacao
                                         IBTable_Responsavel.FieldByName('DataEntrada').AsString,
                                         IBTable_Responsavel.FieldByName('DataSaida').AsString
                                        );

                Grava_Mapa(VI_Codigo,
                           IBQuery_Monta_Mapa.FieldByName('virtual').AsString,
                           ' ',
                           IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString,
                           IBQuery_Monta_Mapa.FieldByName('apto').AsString,
                           IBQuery_Monta_Mapa.FieldByName('cama').AsString,
                           IBQuery_Monta_Mapa.FieldByName('Ramal').AsString,
                           ' ',
                           ' ',
                           OCUPADO,
                           FormatFloat('000', VI_Codigo)+' - '+'DEP - '+IBTable_Mapa_Dep.FieldByName('Nome').AsString,
                           'DEPENDENTE',
                           'DEP - '+IBTable_Mapa_Dep.FieldByName('Nome').AsString,
                            IBTable_Responsavel.FieldByName('DataEntrada').AsString,
                            IBTable_Responsavel.FieldByName('DataSaida').AsString
                           );
             end
             else
             begin     //--- DESOCUPADO
                if Trim(IBQuery_Monta_Mapa.FieldByName('APTCODIGO').AsString) = 'DESOCUPADO' then
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
               if IBQuery_Monta_Mapa.FieldByName('NOME').AsString = 'NÃO DESOCUPADO' then
               begin
                  VI_Codigo:= VI_Codigo + 1;

                  VB_Retorno:= MontaVisao( FormatFloat('000', VI_Codigo),
                                           NAODESOCUPADO,   // VS_Tipo
                                           ' ',       // VS_Situacao
                                           IBTable_Historico.FieldByName('DataEntrada').AsString,       // VS_DataEntrada
                                           IBTable_Historico.FieldByName('DataPagamento').AsString        // VS_DataSaida
                                          );

                  Grava_Mapa(VI_Codigo,
                             IBQuery_Monta_Mapa.FieldByName('virtual').AsString,
                             ' ',
                             IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString,
                             IBQuery_Monta_Mapa.FieldByName('apto').AsString,
                             IBQuery_Monta_Mapa.FieldByName('cama').AsString,
                             IBQuery_Monta_Mapa.FieldByName('Ramal').AsString,
                             ' ',
                             ' ',
                             NAODESOCUPADO,
                             FormatFloat('000', VI_Codigo)+' - '+Trim(IBTable_Hospede01.FieldByName('Posto').AsString)+' - '+Trim(IBTable_Hospede01.FieldByName('Nome_Guerra').AsString),
                             IBTable_Hospede01.FieldByName('SITUACAO_CURSO').AsString,
                             IBTable_Hospede01.FieldByName('NOME').AsString,
                             IBTable_Historico.FieldByName('DataEntrada').AsString,
                             IBTable_Historico.FieldByName('DataPagamento').AsString
                           );
               end
               else
               begin
                  if IBQuery_Monta_Mapa.FieldByName('APTCODIGO').AsString = 'NÃO OCUPAR' then
                  begin
                     VI_Indisponivel:= VI_Indisponivel + 1;
                     VI_Codigo:= VI_Codigo + 1;
                     VB_Retorno:= MontaVisao( FormatFloat('000', VI_Codigo),
                                              NAOOCUPAR,   // VS_Tipo
                                              Trim(IBQuery_Monta_Mapa.FieldByName('Nome').AsString),       // VS_Situacao
                                              ' ',       // VS_DataEntrada
                                              ' '        // VS_DataSaida
                                             );
                  end
                  else
                  begin
                    VB_Grava:= False;
                  end;
               end;
             end;
          end;
       end;                  // Grava Visao
       if VB_Grava = True then
          GravaVisao(FormatFloat('000', VI_Codigo), IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString, IBQuery_Monta_Mapa.FieldByName('apto').AsString,  IBQuery_Monta_Mapa.FieldByName('Cama').AsString);
       IBQuery_Monta_Mapa.Next;
    end;
    DM.IBTransaction_HotelLocal.Commit;

    ResumoDoMapa;
    IBQuery_Visao.Close;
    IBQuery_Visao.Open;
    IBQuery_Visao.First;

    IBTable_Mostrar.Open;

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
   IBQuery_Monta_Mapa.Close;
   IBQuery_Monta_Mapa.Sql.Clear;
   IBQuery_Monta_Mapa.Sql.Add(VS_Comando);
   IBQuery_Monta_Mapa.Open;
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
   VS_Comando:= 'select Identidade, codigo, predio, apto, cama, ramal, nome, tipo, situacao, situacao_curso, data_entrada, Data_Saida from mapa';
   if trim(VS_Busca) <> '' then
   begin
      case VI_Opc of
         1: VS_Comando:= VS_Comando+' where ramal like '+#39+'%'+VS_Busca+'%'+#39;
         2: VS_Comando:= VS_Comando+' where situacao like '+#39+'%'+VS_Busca+'%'+#39;
         3: VS_Comando:= VS_Comando+' where nome like '+#39+'%'+VS_Busca+'%'+#39;
      end;
   end;
   VS_Comando:= VS_Comando+' order by predio, apto, cama ';

   IBQuery_Mapa.Close;
   IBQuery_Mapa.Sql.Clear;
   IBQuery_Mapa.Sql.Add(VS_Comando);
   IBQuery_Mapa.Open;
   IBQuery_Visao.Locate('Codigo',IBQuery_Mapa.FieldByName('Codigo').AsString,[loPartialKey]);
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
      showmessage('Problema na data de entrada no Predio '+IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString+
                  #13+' Apto '+IBQuery_Monta_Mapa.FieldByName('apto').AsString+
                  #13+' Cama '+IBQuery_Monta_Mapa.FieldByName('cama').AsString);
      VB_Retorno:= False;
   end
   else
   begin
      if  trim(VS_dataEntrada) = '' then
      begin
         showmessage('Problema na data de saída no Predio '+IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString+
                     #13+' Apto '+IBQuery_Monta_Mapa.FieldByName('apto').AsString+
                     #13+' Cama '+IBQuery_Monta_Mapa.FieldByName('cama').AsString);
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
// DM.IBTransaction_HotelLocal.Commit;
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

   if VS_Campo <> '' then
   begin
      IBQuery_Busca.Close;
      IBQuery_Busca.SQL.Clear;
      IBQuery_Busca.SQL.Add('Select * from Mapa where Codigo = '+#39+VS_Campo+#39);
      IBQuery_Busca.OPen;
   end;

   if VS_Col <> 'TipoA' then
   begin
      // Tratamento da descricao por dia

      GroupBox_SituacaoAtual.Caption:= '< Situação do dia '+Copy(VS_Coluna,4,2)+'/'+ComboBox_Mes.Text+'/'+ComboBox_Ano.Text+' >';
      VI_Dia:= StrToInt(Copy(VS_Coluna,4,2));

      Label_TotalVagas.Caption:= 'Total de Vagas: '+FormatFloat('#####0', Ma_Vagas[VI_Dia]);
      Label_Hospedagens.Caption:= 'Hospedagens.:  '+FormatFloat('#####0', Ma_Hospedagem[VI_Dia]);
      Label_Reservas.Caption:= 'Reservas..........: '+FormatFloat('#####0', Ma_Reservas[VI_Dia]);
      Label_Indiponiveis.Caption:= 'Indisponível......: '+FormatFloat('#####0', Ma_Indisponivel[VI_Dia]);

      if Trim(IBQuery_Visao.FieldByName(VS_Col).AsString) = '' then
      begin
         ToolButton_Reserva.Enabled:= False;
         ToolButton_Cancela_Reserva.Enabled:= False;
      end
      else
      begin
         VI_Tipo:= IBQuery_Visao.FieldByName(VS_Col).AsInteger;
         if VI_Tipo = 9 then
         begin
            ToolButton_Reserva.Enabled:= False;
            ToolButton_Cancela_Reserva.Enabled:= False;
         end
         else
         begin
            VS_Data:= Copy(VS_Coluna,4,2)+'/'+ComboBox_Mes.Text+'/'+ComboBox_Ano.Text;

            if StrToDate(VS_Data) > Date then
            begin
               if DateTimePicker_Entrada.Date = DateTimePicker_Saida.Date then
                  DateTimePicker_Entrada.Date:= StrToDate(VS_Data)
               else
                  if ((StrToDate(VS_Data) = DateTimePicker_Entrada.Date) and (StrToDate(VS_Data) = DateTimePicker_Saida.Date)) then
                     DateTimePicker_Entrada.Date:= StrToDate(VS_Data)
                  else
                     if StrToDate(VS_Data) > DateTimePicker_Entrada.Date then
                        DateTimePicker_Saida.Date:= StrToDate(VS_Data)
                     else
                        DateTimePicker_Entrada.Date:= StrToDate(VS_Data);
            end;

            case VI_Tipo of
               0: Begin    // CABECALHO
                    ToolButton_Reserva.Enabled:= False;
                    ToolButton_Cancela_Reserva.Enabled:= False;
                  end;
               1: Begin    // OCUPADO
                     if ((trim(MaskEdit_Identidade.text) = '') and (trim(MaskEdit_Nome_Guerra_hospede.text) = '') and
                         (trim(MaskEdit_Nome_Hospede.text) = '') and (IBQuery_Busca_Hospede.RecordCount = 0 )) then
                        ToolButton_Reserva.Enabled:= False
                     else
                        ToolButton_Reserva.Enabled:= False;
                     ToolButton_Cancela_Reserva.Enabled:= False;
                  end;
               2: Begin    // RESERVA
                     ToolButton_Reserva.Enabled:= False;
                     ToolButton_Cancela_Reserva.Enabled:= True;
                  end;
               3: Begin    // DESOCUPADO
                     if ((trim(MaskEdit_Identidade.text) = '') and (trim(MaskEdit_Nome_Guerra_hospede.text) = '') and
                         (trim(MaskEdit_Nome_Hospede.text) = '') and (IBQuery_Busca_Hospede.RecordCount = 0 )) then
                        ToolButton_Reserva.Enabled:= False
                     else
                        ToolButton_Reserva.Enabled:= true;
                     ToolButton_Cancela_Reserva.Enabled:= False;
                  end;
               4: Begin    // NAODESOCUPADO
                     if ((trim(MaskEdit_Identidade.text) = '') and (trim(MaskEdit_Nome_Guerra_hospede.text) = '') and
                         (trim(MaskEdit_Nome_Hospede.text) = '') and (IBQuery_Busca_Hospede.RecordCount = 0 )) then
                        ToolButton_Reserva.Enabled:= False
                     else
                        ToolButton_Reserva.Enabled:= true;
                     ToolButton_Cancela_Reserva.Enabled:= False;
               end;
               5: Begin    // NAOOCUPAR
                    VS_Campo:= IBQuery_Visao.FieldByName('Dia01').AsString+IBQuery_Visao.FieldByName('Dia02').AsString+IBQuery_Visao.FieldByName('Dia03').AsString;
                    if Trim(VS_Campo) = 'ARRUMAR' then
                       ToolButton_Reserva.Enabled:= True
                    else
                       ToolButton_Reserva.Enabled:= False;
                    ToolButton_Cancela_Reserva.Enabled:= False;
                  end;
            end;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do Cadastro de reserva
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
   MaskEdit_Dependente.Text:= '0';
   MaskEdit_Hora.Text:= '';
   MaskEdit_Telefone.Text:= '';
   ComboBox_Situacao_Curso.Text:= '';
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
   IBQuery_Busca_Hospede.Close;
   IBQuery_Busca_Hospede.SQL.Clear;
   IBQuery_Busca_Hospede.SQL.Add(VS_Comando);
   IBQuery_Busca_Hospede.Open;
end;

//------------------------------------------------------------------------------
// Procedure para tratar a reserva do hospede
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.ToolButton_ReservaClick(Sender: TObject);
var
   VS_NomeGuerra, VS_Dependente, VS_Msg, VS_Comando: String;
   VB_Gravar: Boolean;
   VI_NDep, VI_Cama: Integer;
begin
   Duplo_Click:= False;
   VB_Gravar:= True;

   if (trim(MaskEdit_Identidade.Text) = '') then
      MaskEdit_Identidade.Text:= ' ';

   if DateTimePicker_Entrada.Date > DateTimePicker_Saida.Date then
   begin
       ShowMessage('A Data de entrada não pode ser maior que a data de Saída...');
       DateTimePicker_Entrada.SetFocus;
   end
   else
   begin
      if DateTimePicker_Entrada.Date < Date then
      begin
          ShowMessage('A Data de entrada não pode ser menor que a data atual que é '+DateToStr(Date));
          DateTimePicker_Entrada.SetFocus;
      end
      else
      begin     //--- Tratamento para verificar se foi fornecido o numero da identidade
         if ((trim(MaskEdit_Identidade.Text) = '') and (trim(MaskEdit_Nome_Guerra_hospede.Text) = '') and
             (trim(MaskEdit_Nome_Hospede.Text) = '')) then
         begin
            MessageDlg('É obrigatório fornecer o número da identidade ou Nome completo ou Nome de guerra para efetuar a reserva...', mtInformation,[mbOk], 0);
            VB_Gravar:= False;
            MaskEdit_Identidade.SetFocus;
         end
         else
         begin
             //---
            //--- Verifica se existe hospede com a identidade fornecida

            if (trim(MaskEdit_Identidade.Text) <> '') then
            begin
               MaskEdit_Identidade.Text:= Funcoes.NIdentidade(Trim(MaskEdit_Identidade.Text));

               VS_Comando:='Select * from hospede where identidade = '+#39+Trim(MaskEdit_Identidade.Text)+#39;
               Executa_Query_hospede(VS_Comando);

               if IBQuery_Busca_Hospede.RecordCount > 0 then
               begin
                  //--- Verifica se o hospede possuir restricao para ser hospedado

                  if IBQuery_Busca_Hospede.FieldByName('Situacao').AsString = 'I' then
                  begin
                     MessageDlg('O hóspede '+IBQuery_Busca_Hospede.FieldByName('nome').AsString+' não pode ser hospedado,'+#13+
                                 IBQuery_Busca_Hospede.FieldByName('obs').AsString+#13+#13+
                                 'Contate o gerente',mtWarning, [mbOK], 0);
                     VB_Gravar:= False;
                     Mostra_Todas_Reservas;
                  end;
               end;
            end;

             //---
            //--- Verifica se o hospede ja foi hospedado

            if VB_Gravar = True then
            begin
               if ((trim(MaskEdit_Identidade.Text) <> '') and (VB_Gravar = True))  then
                  VS_Comando:= 'Select identidade, Nome, dataEntrada, DataSaida, predio, apto, Telefone_Funcional, OM_Origem from reserva where identidade like '+#39+'%'+MaskEdit_Identidade.Text+#39
               else
                  if (trim(MaskEdit_Nome_Hospede.Text) <> '') then
                     VS_Comando:= 'Select identidade, Nome, dataEntrada, DataSaida, predio, apto, Telefone_Funcional, OM_Origem from Reserva where nome = '+#39+MaskEdit_Nome_Hospede.Text+#39
                  else
                     if (trim(MaskEdit_Nome_Guerra_hospede.Text) <> '') then
                         VS_Comando:= 'Select identidade, Nome, dataEntrada, DataSaida, predio, apto, Telefone_Funcional, OM_Origem from Reserva where Nome_Guerra = '+#39+MaskEdit_Nome_Guerra_hospede.Text+#39;

                  Executa_Query_hospede(VS_Comando);

                  if IBQuery_Busca_Hospede.RecordCount > 0 then
                  begin
                     VS_Msg:='O hospede já possui reserva como mostra a lista abaixo: '+#13;

                     IBQuery_Busca_Hospede.First;
                     While not IBQuery_Busca_Hospede.Eof do
                     begin
                        VS_Msg:= VS_Msg+#13+IBQuery_Busca_Hospede.FieldByName('Identidade').AsString+' '+
                                            IBQuery_Busca_Hospede.FieldByName('Nome').AsString+' ';

                        VS_Msg:= VS_Msg+#13+'Entrada - '+IBQuery_Busca_Hospede.FieldByName('DataEntrada').AsString+' '+
                                            '    Saída - '+IBQuery_Busca_Hospede.FieldByName('DataSaida').AsString+
                                            '    '+PredioAndar+' - '+IBQuery_Busca_Hospede.FieldByName('predio').AsString+
                                            '    Apto - '+IBQuery_Busca_Hospede.FieldByName('apto').AsString;
                        VS_Msg:= VS_Msg+#13;
                        IBQuery_Busca_Hospede.Next;
                     end;

                     if MessageDlg(VS_Msg+#13+#13+'Confirma a reserva ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                        VB_Gravar:= True
                     else
                        VB_Gravar:= False;
                  end;
               end;

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
               //--- Analiza o Posto Graduacao

               if ((trim(ComboBox_Posto_Graduacao.Text) <> '') and (VB_Gravar = True)) then
               begin
                  VS_Comando:= 'Select * from TABELA_POSTO where posto = '+#39+trim(ComboBox_Posto_Graduacao.Text)+#39;
                  if Funcoes.Procura(VS_Comando) = False then
                  begin
                     MessageDlg('O posto deve ser escolhida na lista...', mtInformation,[mbOk], 0);
                     VB_Gravar:= False;
                  end;
               end;

                //---
               //--- Verifica se o posto pode ser hospedado no apto selecionado

               if ((trim(ComboBox_Posto_Graduacao.Text) <> '') and (VB_Gravar = True))  then
               begin
                  VS_Comando:= 'select tpr.predio, tpr.valor, tpo.posto, tpo.codigo '+
                               'from tabela_preco tpr, tabela_posto tpo '+
                               'where (tpr.codigo = tpo.codigo) '+
                               'and (tpo.posto = '+#39+trim(ComboBox_Posto_Graduacao.Text)+#39+' '+
                               'and  tpr.predio = '+#39+trim(IBQuery_Visao.FieldByName('Predio').AsString)+#39+')';

                  IBQuery_Tabela_Posto.Close;
                  IBQuery_Tabela_Posto.SQL.Clear;
                  IBQuery_Tabela_Posto.SQL.Add(VS_Comando);
                  IBQuery_Tabela_Posto.Open;

                  if IBQuery_Tabela_Posto.RecordCount = 0 then
                  begin
                     MessageDlg('O Posto/Graduação de '+trim(ComboBox_Posto_Graduacao.Text)+' não ser hospedado no '+PredioAndar+trim(IBTable_Hospedagem.FieldByName('Predio').AsString)+' .'+#13+
                                'Verifique se o posto esta correto,'+#13, mtError,[mbOk], 0);
                     VB_Gravar:= False;
                  end;
               end;

                //---
               // Tratamento da gravacao da reserva

               if VB_Gravar = True then
               begin
                  //--- Montagem da reserva

                  IBTable_CadReserva.Append;

                  if IBQuery_Busca_Hospede.RecordCount > 0 then
                  begin   //--- Tratamento dos campos quando o hospede existir
                     VS_Dependente:= 'Dep - '+MaskEdit_Nome_Guerra_hospede.Text;
                     VS_NomeGuerra:= MaskEdit_Nome_Guerra_hospede.Text;

                     IBTable_CadReserva.FieldByName('IDENTIDADE').AsString:= MaskEdit_Identidade.Text;
                     IBTable_CadReserva.FieldByName('NOME').AsString:= MaskEdit_Nome_hospede.Text;
                     IBTable_CadReserva.FieldByName('NOME_GUERRA').AsString:= MaskEdit_Nome_Guerra_hospede.Text;
                     IBTable_CadReserva.FieldByName('TELEFONE_FUNCIONAL').AsString:= IBQuery_Busca_Hospede.FieldByName('TELEFONE_FUNCIONAL').AsString;
                     IBTable_CadReserva.FieldByName('OM_ORIGEM').AsString:= IBQuery_Busca_Hospede.FieldByName('OM_ORIGEM').AsString;
                  end
                  else
                  begin
                     IBTable_CadReserva.FieldByName('IDENTIDADE').AsString:= MaskEdit_Identidade.Text;
                     if ((trim(MaskEdit_Nome_Hospede.Text) <> '') and (trim(MaskEdit_Nome_Guerra_hospede.Text) <> '')) then
                     begin
                        VS_Dependente:= 'Dep - '+MaskEdit_Nome_Guerra_hospede.Text;
                        VS_NomeGuerra:= MaskEdit_Nome_Guerra_hospede.Text;
                        IBTable_CadReserva.FieldByName('NOME').AsString:= MaskEdit_Nome_Hospede.Text;
                        IBTable_CadReserva.FieldByName('NOME_GUERRA').AsString:= MaskEdit_Nome_Guerra_hospede.Text;
                     end
                     else
                     begin
                        if ((trim(MaskEdit_Nome_Hospede.Text) = '') and (trim(MaskEdit_Nome_Guerra_hospede.Text) <> '')) then
                        begin
                           VS_Dependente:= 'Dep - '+MaskEdit_Nome_Guerra_hospede.Text;
                           VS_NomeGuerra:= MaskEdit_Nome_Guerra_hospede.Text;
                           IBTable_CadReserva.FieldByName('NOME').AsString:= MaskEdit_Nome_Guerra_hospede.Text;
                           IBTable_CadReserva.FieldByName('NOME_GUERRA').AsString:= MaskEdit_Nome_Guerra_hospede.Text;
                        end
                        else
                        begin
                           if ((trim(MaskEdit_Nome_Hospede.Text) <> '') and (trim(MaskEdit_Nome_Guerra_hospede.Text) = '')) then
                           begin
                              VS_Dependente:= 'Dep - '+MaskEdit_Nome_Hospede.Text;
                              VS_NomeGuerra:= MaskEdit_Nome_Guerra_hospede.Text;
                              IBTable_CadReserva.FieldByName('NOME').AsString:= MaskEdit_Nome_Hospede.Text;
                              IBTable_CadReserva.FieldByName('NOME_GUERRA').AsString:= MaskEdit_Nome_Hospede.Text;
                           end
                           else
                           begin
                              VS_Dependente:= 'Dep - RG - '+MaskEdit_Identidade.Text;
                              VS_NomeGuerra:= 'RG - '+MaskEdit_Identidade.Text;
                              IBTable_CadReserva.FieldByName('NOME').AsString:= 'RG - '+MaskEdit_Identidade.Text;
                              IBTable_CadReserva.FieldByName('NOME_GUERRA').AsString:= 'RG - '+MaskEdit_Identidade.Text;
                           end;
                        end;
                     end;
                  end;

                  IBTable_CadReserva.FieldByName('POSTO').AsString:= ComboBox_Posto_Graduacao.Text;
                  IBTable_CadReserva.FieldByName('HORAENTRADA').AsString:= MaskEdit_Hora.Text;
                  IBTable_CadReserva.FieldByName('SITUACAO_CURSO').AsString:= ComboBox_Situacao_Curso.Text;
                  IBTable_CadReserva.FieldByName('DataEntrada').AsString:= DateToStr(DateTimePicker_Entrada.Date);
                  IBTable_CadReserva.FieldByName('DataSaida').AsString:= DateToStr(DateTimePicker_Saida.Date);
                  IBTable_CadReserva.FieldByName('Dependente').AsString:= MaskEdit_Dependente.Text;
                  IBTable_CadReserva.FieldByName('Telefone_Funcional').AsString:= MaskEdit_Telefone.Text;
                  IBTable_CadReserva.FieldByName('Recebe').AsString:= 'H';
                  IBTable_CadReserva.FieldByName('Usuario').AsString:= Funcoes.GetUsuario;
                  IBTable_CadReserva.FieldByName('PREDIO').AsString:= IBQuery_Visao.FieldByName('Predio').AsString;
                  IBTable_CadReserva.FieldByName('APTO').AsString:= IBQuery_Visao.FieldByName('Apto').AsString;
                  IBTable_CadReserva.FieldByName('CAMA').AsString:= IBQuery_Visao.FieldByName('Cama').AsString;
                  IBTable_CadReserva.post;

                  //--- Verifica se possui dependente

                  if StrToInt(MaskEdit_Dependente.Text) > 0 then
                  begin
                     VI_Cama:= IBQuery_Visao.FieldByName('Cama').AsInteger + 1;
                     VI_NDep:= 1;
                     While VI_NDep <= StrToInt(MaskEdit_Dependente.Text) do
                     begin
                        IBTable_CadReserva.Append;
                        IBTable_CadReserva.FieldByName('IDENTIDADE').AsString:= 'DEPENDENTE';
                        IBTable_CadReserva.FieldByName('NOME').AsString:= VS_Dependente;
                        IBTable_CadReserva.FieldByName('NOME_GUERRA').AsString:= VS_NomeGuerra;
                        IBTable_CadReserva.FieldByName('PREDIO').AsString:= IBQuery_Visao.FieldByName('Predio').AsString;
                        IBTable_CadReserva.FieldByName('APTO').AsString:= IBQuery_Visao.FieldByName('Apto').AsString;
                        IBTable_CadReserva.FieldByName('CAMA').AsInteger:= VI_Cama;
                        IBTable_CadReserva.FieldByName('DEPENDENTE').AsString:= MaskEdit_Dependente.Text;
                        IBTable_CadReserva.FieldByName('Telefone_Funcional').AsString:= MaskEdit_Telefone.Text;
                        IBTable_CadReserva.FieldByName('HORAENTRADA').AsString:= MaskEdit_Hora.Text;
                        IBTable_CadReserva.FieldByName('SITUACAO_CURSO').AsString:= ComboBox_Situacao_Curso.Text;
                        IBTable_CadReserva.FieldByName('DataEntrada').AsString:= DateToStr(DateTimePicker_Entrada.Date);
                        IBTable_CadReserva.FieldByName('DataSaida').AsString:= DateToStr(DateTimePicker_Saida.Date);
                        IBTable_CadReserva.post;
                        VI_NDep:= VI_NDep + 1;
                     end;
                  end;
                  DM.IBTransaction_Hotel.CommitRetaining;

                  //--- Atualiza o mapa

                  Mostra_Todas_Reservas;
                  Monta_Mapa(1);
               end;
            end;
         end;
      end;
end;

//------------------------------------------------------------------------------
// Procedure para tratar do cancelamento da reserva
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.ToolButton_Cancela_ReservaClick(Sender: TObject);
var
   VS_Comando, VS_Predio, VS_Apto, VS_NomeGuerra, VS_Nome, VS_DataEntrada, VS_DataSaida: String;
begin
   if IBTable_CadReserva.FieldByName('IDENTIDADE').AsString = 'DEPENDENTE' then
   begin
      ShowMessage('Para cancelar hospedagem de Dependente, deverá ser cancelado o Titular...');
   end
   else
   begin
      VS_NomeGuerra:= IBTable_CadReserva.FieldByName('NOME_GUERRA').AsString;
      VS_Nome:= IBTable_CadReserva.FieldByName('NOME').AsString;
      VS_Predio:= IBTable_CadReserva.FieldByName('PREDIO').AsString;
      VS_Apto:= IBTable_CadReserva.FieldByName('APTO').AsString;
      VS_DataEntrada:= Funcoes.DePara(IBTable_CadReserva.FieldByName('DataEntrada').AsString, '/', '.');
      VS_DataEntrada:= VS_DataEntrada+' 00:00';
      VS_DataSaida:= Funcoes.DePara(IBTable_CadReserva.FieldByName('DataSaida').AsString, '/', '.');
      VS_DataSaida:= VS_DataSaida+' 00:00';

      if Trim(VS_NomeGuerra) = '' then
         VS_Comando:= 'Delete from Reserva where predio = '+#39+VS_Predio+#39+
                      ' and apto = '+#39+VS_Apto+#39+
                      ' and Nome = '+#39+VS_Nome+#39+
                      ' and DataEntrada = '+#39+VS_DataEntrada+#39+
                      ' and DataSaida = '+#39+VS_DataSaida+#39
      else
         VS_Comando:= 'Delete from Reserva where predio = '+#39+VS_Predio+#39+
                      ' and apto = '+#39+VS_Apto+#39+
                      ' and Nome_Guerra = '+#39+VS_NomeGuerra+#39+
                      ' and DataEntrada = '+#39+VS_DataEntrada+#39+
                      ' and DataSaida = '+#39+VS_DataSaida+#39;

      Funcoes.ExecSql_Servidor(VS_Comando);

      Monta_Mapa(1);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.ToolButton_RetornarClick(Sender: TObject);
begin
   VI_Close:= 1;
   IBQuery_Visao.Close;
   IBTable_Visao.Close;
   IBTable_Mostrar.Close;

   IBTable_Historico.Close;
   IBTable_Hospede.Close;
   IBTable_Hospedagem.Close;
   IBTable_Reserva.Close;
   IBTable_Mapa_Dep.Close;
   IBTable_Hospede01.Close;
   IBTable_Responsavel.Close;
   IBQuery_Mapa.Close;

   IBQuery_Busca_Hospede.Close;
   IBTable_CadReserva.Close;
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
// Tratamento da selecao do hospede atraves da Identidade, nome_guerra ou nome
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.SelecionarHospede(Sender: TObject);
var
   VS_Comando: String;
   VB_Where: Boolean;
begin
   VS_Comando:= 'Select identidade, nome, posto, nome_guerra, Telefone_Funcional, OM_Origem, situacao, obs from hospede ';
   VB_Where:= False;

   if trim(MaskEdit_Identidade.Text) <> '' then
   begin
      VS_Comando:= VS_Comando+' Where Identidade = '+#39+FormatFloat('000000000000', StrToFloat(MaskEdit_Identidade.Text))+#39;
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
end;

//------------------------------------------------------------------------------
// Tratamento da selecao do hospede e pressionado duplo click
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.DBGrid_Busca_HospedeDblClick(Sender: TObject);
begin
   Duplo_Click:= True;
   MaskEdit_Identidade.Text:= IBQuery_Busca_Hospede.FieldByName('IDENTIDADE').AsString;
   MaskEdit_Nome_Guerra_hospede.Text:= IBQuery_Busca_Hospede.FieldByName('NOME_Guerra').AsString;
   MaskEdit_Nome_Hospede.Text:= IBQuery_Busca_Hospede.FieldByName('NOME').AsString;
   ComboBox_Posto_Graduacao.Text:= IBQuery_Busca_Hospede.FieldByName('POSTO').AsString;
end;

//------------------------------------------------------------------------------
// Tratamento da ampliacao do mapa
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.ToolButton_AmpliaMapaClick(Sender: TObject);
begin
   Panel_TrataReserva.Visible:= False;
   ToolButton_AmpliaMapa.Visible:= False;
   ToolButton_ReduzMapa.Visible:= True;
end;

//------------------------------------------------------------------------------
// Tratamento da redução da ampliacao do mapa
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.ToolButton_ReduzMapaClick(Sender: TObject);
begin
   Panel_TrataReserva.Visible:= True;
   ToolButton_AmpliaMapa.Visible:= True;
   ToolButton_ReduzMapa.Visible:= False;
end;

procedure TForm_MontaReserva.ComboBox_Posto_GraduacaoEnter(
  Sender: TObject);
begin
   IBTable_Busca_Posto.Open;
   IBTable_Busca_Tabela_Preco.Open;
   ComboBox_Posto_Graduacao.Items.Clear;   // Limpa os postos do combo Posto Graduacao
   IBTable_Busca_Tabela_Preco.First;
   While not IBTable_Busca_Tabela_Preco.Eof do
   begin
      IBTable_Busca_Posto.First;
      While not IBTable_Busca_Posto.Eof do
      begin
         ComboBox_Posto_Graduacao.Items.Add(IBTable_Busca_Posto.FieldByName('Posto').AsString);
         IBTable_Busca_Posto.Next;
      end;
      IBTable_Busca_Tabela_Preco.Next;
   end;

end;

//------------------------------------------------------------------------------
// Imprime o relatorio de reservas
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.ToolButton_EmissaoRelBoletimEscolarClick(Sender: TObject);
begin
   QRListForm_Rel_Reserva.Preview;
end;

//------------------------------------------------------------------------------
// Fecha a janela de Reservas
//------------------------------------------------------------------------------

procedure TForm_MontaReserva.ToolButton_FinalizaRelatorioClick(Sender: TObject);
begin
   JvCaptionPanel_MostrarReservas.Visible:= False;
end;

procedure TForm_MontaReserva.ToolButton_MostrarReservasClick(Sender: TObject);
begin
   IBQuery_MostraReserva.Close;
   IBQuery_MostraReserva.Open;
   
   JvCaptionPanel_MostrarReservas.Visible:= True;
end;

procedure TForm_MontaReserva.DBGrid_VisaoExit(Sender: TObject);
begin
   ToolButton_Reserva.Enabled:= False;
   ToolButton_Cancela_Reserva.Enabled:= False;
end;

procedure TForm_MontaReserva.ToolButton_RelResumoOcupacaoClick(Sender: TObject);
begin
  if PrintDialog1.Execute then
  begin
    RichPrinter1.PrintRichEdit(Text1,1);
  end;
end;

procedure TForm_MontaReserva.ToolButton_FecharResumoClick(Sender: TObject);
begin
   JvCaptionPanel_Resumo.Visible:= False;
end;

procedure TForm_MontaReserva.SpeedButton_MostraResumoClick(Sender: TObject);
begin
   JvCaptionPanel_Resumo.Visible:= True;
end;

end.

