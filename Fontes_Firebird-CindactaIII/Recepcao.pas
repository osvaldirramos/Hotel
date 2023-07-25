//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Recepcao.PAS                                   //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de montar o menu    //
//                             que sera utilizado pelo pessoal da recepcao.   //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 12/03/2008                                     //
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

unit Recepcao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBTable, ExtCtrls, Grids, DBGrids, IBQuery,
  StdCtrls, DBCtrls, ComCtrls, Mask, Buttons, JvGradient, JvComponent,
  JvxClock, jpeg, ToolWin, DBTables, Rotinas, JvCaptionPanel;

type
  TForm_MenuRecepcao = class(TForm)
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
    Panel_Tela01: TPanel;
    Panel_Brasao: TPanel;
    Image_Brasao: TImage;
    Panel4: TPanel;
    Grad01: TJvGradient;
    Bevel2: TBevel;
    SpeedButton_Atualizar: TSpeedButton;
    Label18: TLabel;
    Label19: TLabel;
    Label_Predio: TLabel;
    Label5: TLabel;
    MaskEdit_Ramal: TMaskEdit;
    MaskEdit_Busca_Nome_Completo: TMaskEdit;
    MaskEdit_Nome_Guerra: TMaskEdit;
    ComboBox_Predio: TComboBox;
    IBQuery_MapaCODIGO: TIBStringField;
    Panel25: TPanel;
    DBGrid_Mapa: TDBGrid;
    Panel3: TPanel;
    Panel_Legenda: TPanel;
    Label8: TLabel;
    Panel_LegVerde: TPanel;
    Panel13: TPanel;
    Panel18: TPanel;
    Panel21: TPanel;
    Panel45: TPanel;
    Panel47: TPanel;
    Panel14: TPanel;
    Panel16: TPanel;
    Panel48: TPanel;
    Panel50: TPanel;
    ProgressBar1: TProgressBar;
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
    DST_Hospedagem: TDataSource;
    IBTable_Hospede: TIBTable;
    DST_Hospede: TDataSource;
    DST_Responsavel: TDataSource;
    DST_MapaDep: TDataSource;
    IBTable_Responsavel: TIBTable;
    IBQuery_Busca: TIBQuery;
    DSQ_Busca: TDataSource;
    ToolBar2: TToolBar;
    ToolButton_Hospede: TToolButton;
    ToolButton_Facilidade: TToolButton;
    ToolButton_RelMapa: TToolButton;
    ToolButton_Movimento: TToolButton;
    ToolButton_TabPreco: TToolButton;
    ToolButton_Ajuda: TToolButton;
    ToolButton_Windows: TToolButton;
    DBNavigator_Visao: TDBNavigator;
    Panel_Logar: TPanel;
    Label7: TLabel;
    Label6: TLabel;
    Edit_Usuario: TMaskEdit;
    Edit_Senha: TMaskEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
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
    IBTable_VisaoCAMA: TIBStringField;
    ToolButton_Disponivel: TToolButton;
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
    IBQuery_VisaoCAMA: TIBStringField;
    DBGrid_Visao: TDBGrid;
    IBTable_Historico: TIBTable;
    IBTable_HistoricoIDENTIDADE: TIBStringField;
    IBTable_HistoricoFICHA: TIBStringField;
    IBTable_HistoricoANO: TSmallintField;
    IBTable_HistoricoPREDIO: TIBStringField;
    IBTable_HistoricoAPTO: TSmallintField;
    IBTable_HistoricoDATAENTRADA: TDateTimeField;
    IBTable_HistoricoDATAPAGAMENTO: TDateTimeField;
    ToolButton_CancelarHospedagem: TToolButton;
    IBQuery_BuscaPREDIO: TIBStringField;
    IBQuery_BuscaAPTO: TIntegerField;
    IBQuery_BuscaCAMA: TIntegerField;
    IBQuery_BuscaCODIGO: TIBStringField;
    IBQuery_BuscaRAMAL: TIBStringField;
    IBQuery_BuscaTV1: TIBStringField;
    IBQuery_BuscaTV2: TIBStringField;
    IBQuery_BuscaTIPO: TIBStringField;
    IBQuery_BuscaSITUACAO: TIBStringField;
    IBQuery_BuscaSITUACAO_CURSO: TIBStringField;
    IBQuery_BuscaNOME: TIBStringField;
    IBQuery_BuscaDATA_ENTRADA: TIBStringField;
    IBQuery_BuscaDATA_SAIDA: TIBStringField;
    IBQuery_BuscaIDENTIDADE: TIBStringField;
    IBTable_Resp: TIBTable;
    DST_Resp: TDataSource;
    Bevel1: TBevel;
    Splitter1: TSplitter;
    GroupBox_Descricao: TGroupBox;
    IBQuery_MostraReserva: TIBQuery;
    DSQ_MostrarReservas: TDataSource;
    ComboBox_Mes: TComboBox;
    Label4: TLabel;
    Panel1: TPanel;
    SpeedButton_RelHospedes: TSpeedButton;
    Label2: TLabel;
    SpeedButton_RelReservas: TSpeedButton;
    Label3: TLabel;
    DBGrid2: TDBGrid;
    _Patente: TToolBar;
    ToolButton_Patentes: TToolButton;

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
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure DBGrid_VisaoCellClick(Column: TColumn);
    procedure ToolButton_AjudaClick(Sender: TObject);
    procedure ToolButton_MovimentoClick(Sender: TObject);
    procedure ToolButton_RelMapaClick(Sender: TObject);
    procedure ToolButton_FacilidadeClick(Sender: TObject);
    procedure ToolButton_HospedeClick(Sender: TObject);
    procedure Edit_UsuarioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit_UsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_SenhaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit_SenhaKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_UsuarioChange(Sender: TObject);
    procedure ToolButton_DisponivelClick(Sender: TObject);
    procedure ToolButton_CancelarHospedagemClick(Sender: TObject);
    procedure ToolButton_EmissaoRelBoletimEscolarClick(Sender: TObject);
    procedure SpeedButton_RelHospedesClick(Sender: TObject);
    procedure SpeedButton_RelReservasClick(Sender: TObject);
    procedure ToolButton_PatentesClick(Sender: TObject);
  private    { Private declarations }
      Ma_Dia: array[1..31] of String ;
      Ma_Tipo: array[1..31] of String ;
      VI_Codigo, VI_Tentativas, VI_Opcao: integer;

      VI_AnoSelecionado, VI_MesSelecionado: Integer;
  public    { Public declarations }
  end;

var
  Form_MenuRecepcao: TForm_MenuRecepcao;

implementation

uses Module, Rel_MapaOcupacao, Rel_Mapa_Ocupacao_R, Cad_Facilidades,
  Selecao_Data, Manual_OnLine, MontaReserva, CancelamentoDeHospedagem,
  Rel_Rela_Reserva, Relacao_Hospede, Abertura, Cad_Hospede, Divisas;

{$R *.dfm}

procedure TForm_MenuRecepcao.FormActivate(Sender: TObject);
Var
   dia, mes, ano: Word;
begin
   IBQuery_MostraReserva.Close;
   IBQuery_MostraReserva.Open;
   Funcoes.SetManualAjuda('C:\DataBase_ICEA\DB_HotelMapa\MANUAL_Hotel_R.htM');
   if Funcoes.GetMenuSoldado = False then
   begin
      Image_Brasao.Picture.LoadFromFile('C:\DataBase_ICEA\DBHotel\Brasao.jpg');

      ToolButton_Disponivel.Enabled:= False;
      ToolButton_CancelarHospedagem.Enabled:= False;
      Label_Predio.Caption:= PredioAndar+':';

      Funcoes.SetMenuSoldado(True);
      Funcoes.AlimentaComboBox(ComboBox_Predio, 0, '1');

      DecodeDate( Date, ano, mes, dia);
      ComboBox_Mes.Text:= FormatFloat('00', Mes);

      VI_MesSelecionado:= mes;
      VI_AnoSelecionado:= ano;

      LimpaMapa;

      IBQuery_Visao.Open;
      IBTable_Visao.Open;
      IBTable_Mostrar.Open;
      IBTable_Resp.Open;

      IBTable_Historico.Open;
      IBTable_Hospede.Open;
      IBTable_Hospedagem.Open;
      IBTable_Reserva.Open;
      IBTable_Mapa_Dep.Open;
      IBTable_Hospede01.Open;
      IBTable_Responsavel.Open;
      IBQuery_Mapa.Close;

      Edit_Senha.Enabled:= False;
      VI_Tentativas:= 1;
      if DM.Habilitado_Para = 'CINDACTA III' then
      begin
         Monta_Mapa(1);
         ToolButton_CancelarHospedagem.Caption:= 'Reserva';
         ToolButton_CancelarHospedagem.Hint:= 'Faz tratamento ao cadastro da reserva';
      end
      else
      begin
         ComboBox_Predio.Text:= '';
         ToolButton_CancelarHospedagem.Caption:= 'Cancelar Hospe.';
         ToolButton_CancelarHospedagem.Hint:= 'Cancelar a Hospedagem';
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Atualizacao do Mapa
//------------------------------------------------------------------------------

procedure TForm_MenuRecepcao.SpeedButton_AtualizarClick(Sender: TObject);
begin
   Monta_Mapa(1);
end;

//------------------------------------------------------------------------------
// Limpa as tabela de montagem do Mapa
//------------------------------------------------------------------------------

Procedure TForm_MenuRecepcao.LimpaMapa;
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

procedure TForm_MenuRecepcao.Monta_Mapa(Situacao: integer);
var
   VS_Comando: String;
   diaTermino, I, VI_Codigo: Integer;
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


    ToolButton_Disponivel.Enabled:= False;
    if DM.Habilitado_Para = 'CINDACTA III' then
       ToolButton_CancelarHospedagem.Enabled:= True
    else
       ToolButton_CancelarHospedagem.Enabled:= False;

    VI_MesSelecionado:= StrToInt(ComboBox_Mes.Text);
    diaTermino:= Funcoes.DiasNoMes(VI_AnoSelecionado, VI_MesSelecionado);
    diaTermino:= diaTermino+1;

     //---
    // Limpa as caixas de busca

    MaskEdit_Nome_Guerra.Text:= '';
    MaskEdit_Ramal.Text:= '';
    MaskEdit_Busca_Nome_Completo.Text:= '';

     //----
    // Inicia a montagem do Mapa

    Funcoes.Log_Recepcao('R-Mapa');

     //---
    //--- Limpa a tabela de mapa

    LimpaMapa;

     //---
    // Seta as variaveis iniciais

    VS_Privilegio:= 'R';
    VI_Codigo:= 0;
    VS_Predio:= '';
    VS_Apto:= '';

     //---
    //--- Montagem do Mapa de Ocupacao  - Hospedagem / Reserva / Dependente


    if ComboBox_Predio.Text = 'Todos' then
       VS_Comando:= 'select ap.predio, ap.apto, ap.ramal, ap.tv1, ap.tv2, ap.virtual, ac.cama, ac.aptcodigo, ac.nome '+
                    'from apartamento ap, aptocama ac '+
                    'where (ap.predio = ac.predio and ap.apto = ac.apto) '
//                    ' and ap.visivel = '+#39+'S'+#39
    else       // selecao por apto
       VS_Comando:= 'select ap.predio, ap.apto, ap.ramal, ap.tv1, ap.tv2, ap.virtual, ac.cama, ac.aptcodigo, ac.nome '+
                    'from apartamento ap, aptocama ac '+
                    'where (ap.predio = ac.predio and ap.apto = ac.apto) '+
//                    ' and ap.visivel = '+#39+'S'+#39+
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

       //---
       //--- Monta o cabecalho

       if (( VS_Predio <> IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString) or
           ( VS_Apto <> IBQuery_Monta_Mapa.FieldByName('apto').AsString)) then
       begin
          VS_Predio:=IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString;
          VS_Apto:=  IBQuery_Monta_Mapa.FieldByName('apto').AsString;
          VI_Codigo:= VI_Codigo + 1;

          VB_Retorno:= MontaVisao( FormatFloat('000', VI_Codigo),
                                   CABECALHO,   // VS_Tipo
                                   '         Quarto:'+
                                      FormatFloat('00', IBQuery_Monta_Mapa.FieldByName('APTO').AsInteger)+'- R.  '+
                                      IBQuery_Monta_Mapa.FieldByName('RAMAL').AsString+' - '+
                                      IBQuery_Monta_Mapa.FieldByName('TV1').AsString+'  '+
                                      IBQuery_Monta_Mapa.FieldByName('TV2').AsString,
                                   ' ',    // VS_DataEntrada
                                   ' '     //VS_DataSaida
                                  );


//          VB_Retorno:= MontaVisao( FormatFloat('000', VI_Codigo),
//                                   CABECALHO,   // VS_Tipo
//                                   IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString+' -'+
//                                      IBQuery_Monta_Mapa.FieldByName('APTO').AsString+'- R. '+
//                                      IBQuery_Monta_Mapa.FieldByName('RAMAL').AsString+' - '+
//                                      IBQuery_Monta_Mapa.FieldByName('TV1').AsString+'  '+
//                                      IBQuery_Monta_Mapa.FieldByName('TV2').AsString,
//                                   ' ',    // VS_DataEntrada
//                                   ' '     //VS_DataSaida
//                                  );
          GravaVisao(FormatFloat('000', VI_Codigo), IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString, IBQuery_Monta_Mapa.FieldByName('apto').AsString, ' ');
       end;

       // Setar incialmente como DESOCUPADO

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

        //---
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
       begin
           //---
          //--- DEPENDENTE DE HOSPEDE

          if Trim(IBQuery_Monta_Mapa.FieldByName('APTCODIGO').AsString) = 'DEP' then
          begin
             VI_Codigo:= VI_Codigo + 1;

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
                        FormatFloat('000', VI_Codigo)+' - DEP - '+IBTable_Mapa_Dep.FieldByName('Nome').AsString,
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
       end;
       // Grava Visao
       if VB_Grava = True then
          GravaVisao(FormatFloat('000', VI_Codigo), IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString, IBQuery_Monta_Mapa.FieldByName('apto').AsString,  IBQuery_Monta_Mapa.FieldByName('Cama').AsString);

       IBQuery_Monta_Mapa.Next;
    end;
    DM.IBTransaction_HotelLocal.Commit;

    IBQuery_Visao.Close;
    IBQuery_Visao.Open;
    IBTable_Mostrar.Open;

    Executa_Query_Mapa('', 0);
    ProgressBar1.Position:= 0;
    DBGrid_Mapa.SetFocus;
end;

//------------------------------------------------------------------------------
// Monta query de consulta para ontagem do mapa
//------------------------------------------------------------------------------

procedure TForm_MenuRecepcao.Executa_Query_Monta_Mapa(VS_Comando: String);
begin
   IBQuery_Monta_Mapa.Close;
   IBQuery_Monta_Mapa.Sql.Clear;
   IBQuery_Monta_Mapa.Sql.Add(VS_Comando);
   IBQuery_Monta_Mapa.Open;
end;

//------------------------------------------------------------------------------
// Grava os dados do Mapa
//------------------------------------------------------------------------------

procedure TForm_MenuRecepcao.Grava_Mapa(VI_Codigo: Integer; VS_Virtual: String; VS_Identidade: String; VS_Predio: String; VS_Apto: String; VS_Cama: String;
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

procedure TForm_MenuRecepcao.Executa_Query_Mapa(VS_Busca: String; VI_Opc: Integer);
var
   VS_Comando: String;
begin
   VS_Comando:= 'select Identidade, codigo, predio, apto, cama, ramal, nome, tipo, situacao, situacao_curso, data_entrada, Data_Saida from mapa';
   if trim(VS_Busca) <> '' then
   begin
      case VI_Opc of
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

Function TForm_MenuRecepcao.MontaVisao( VS_Codigo, VS_Tipo, VS_Situacao, VS_dataEntrada, VS_DataSaida: String): Boolean;
Var
   VS_Data: String;
   diaInicio, mesInicio, anoInicio: Word;
   diaTermino, mesTermino, anoTermino: Word;
   VI_Pos, VI_UltimoDia, I, mes, VI_Dia: Integer;
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

        for i:= 18 to 31 do
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
                            VI_UltimoDia:= VI_Dia;
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

Procedure TForm_MenuRecepcao.GravaVisao(VS_Codigo, VS_Predio, VS_Apto, VS_Cama: String);
begin
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
end;

//------------------------------------------------------------------------------
// Tratamento para setar Dia e Tipos em Branco
//------------------------------------------------------------------------------

procedure TForm_MenuRecepcao.SetarDiaTipo(PI_Dia: Integer; VS_Codigo, VS_Tipo: String);
Begin
   Ma_Dia[PI_Dia]:= VS_Codigo;
   Ma_Tipo[PI_Dia]:= VS_Tipo;
end;

//------------------------------------------------------------------------------
// Tratamento da definicao de cores de acordo com tipo
//------------------------------------------------------------------------------

procedure TForm_MenuRecepcao.DBGrid_VisaoDrawColumnCell(Sender: TObject;
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

procedure TForm_MenuRecepcao.DBGrid_MapaDrawColumnCell(Sender: TObject;
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

procedure TForm_MenuRecepcao.MaskEdit_Busca_Nome_CompletoChange(Sender: TObject);
begin
   Executa_Query_Mapa(MaskEdit_Busca_Nome_Completo.Text, 3);
end;

//------------------------------------------------------------------------------
// Procedure para procurar Hospede por Nome de Guerra
//------------------------------------------------------------------------------

procedure TForm_MenuRecepcao.MaskEdit_Nome_GuerraChange(Sender: TObject);
begin
   Executa_Query_Mapa(MaskEdit_Nome_Guerra.Text, 2 );
end;

//------------------------------------------------------------------------------
// Procedure para Tratar do Relatorio do Mapa de Ocupação
//------------------------------------------------------------------------------

procedure TForm_MenuRecepcao.ToolButton_RelMapaClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao('R-Relatorio Mapa');
   if IBQuery_Visao.Recordcount = 0 then
      MessageDlg('Não foi selecionado '+PredioAndar+'.', mtInformation,[mbOk], 0)
   else
   begin
      QRListForm_MapaOcupacao.QuickRep_Mapa_Ocupacao.Preview;
      IBQuery_Busca.Close;
      IBQuery_Busca.SQL.Clear;
      IBQuery_Busca.SQL.Add('Select * from Mapa Order By Predio, data_Entrada');
      IBQuery_Busca.OPen;
      if IBQuery_Busca.RecordCount > 0 then
         QRListForm_Mapa_Hospedagem_R.QuickRep_Mapa_Ocupacao.Preview;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Facilidades
//------------------------------------------------------------------------------

procedure TForm_MenuRecepcao.ToolButton_FacilidadeClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao('R-Facilidade');
   Form_Cad_Facilidades.Show;
end;

//------------------------------------------------------------------------------
// Procedure para tratar o botao do Log do usuario
//------------------------------------------------------------------------------

procedure TForm_MenuRecepcao.ToolButton_HospedeClick(Sender: TObject);
Var
   Status: Boolean;
begin
   Status:= Funcoes.Busca_Usuario(Edit_Usuario.Text, Edit_Senha.Text);

   if Status = False then
   begin
      Edit_Usuario.Text:= '';
      Edit_Senha.Text:= '';
      VI_Tentativas:= VI_Tentativas + 1;
      if VI_Tentativas > 3 then
         Application.Terminate
      else
         Edit_Usuario.SetFocus;
   end
   else
   begin
      Funcoes.SetUsuario(UpperCase(Edit_Usuario.Text));
      Funcoes.Log_Recepcao('R-Logar');
      Funcoes.SetPrivilegio(DM.IBQuery_Usuario.FieldByName('privilegio').AsString);
      VS_Entrada:= TimeToStr(Time);
      Edit_Usuario.Text:= '';
      Edit_Senha.Text:= '';

      Funcoes.SetCad_Hospede(False);
      Funcoes.Log_Recepcao('R-Cad. Hospede');
      Form_Abertura.VS_Quem_Chamou:= 'Menu';
      Form_Cad_Hospede.ShowModal;
      IBQuery_MostraReserva.Close;
      IBQuery_MostraReserva.Open;
      Monta_Mapa(1);
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para chamada do relatorio de movimento
//------------------------------------------------------------------------------

procedure TForm_MenuRecepcao.ToolButton_MovimentoClick(Sender: TObject);
Var
   Status: Boolean;
begin
   Status:= Funcoes.Busca_Usuario(Edit_Usuario.Text, Edit_Senha.Text);
   Edit_Usuario.Text:= '';
   Edit_Senha.Text:= '';

   if Status = False then
   begin
      VI_Tentativas:= VI_Tentativas + 1;
      if VI_Tentativas > 3 then
         Application.Terminate
      else
         Edit_Usuario.SetFocus;
   end
   else
   begin
      Funcoes.Log_Recepcao('R-Relatorio Movimento');
      Form_Movimento.ShowModal;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Manual do Usuario
//------------------------------------------------------------------------------

procedure TForm_MenuRecepcao.ToolButton_AjudaClick(Sender: TObject);
begin
   Form_ManualOnLine.ShowModal;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_MenuRecepcao.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

procedure TForm_MenuRecepcao.Edit_UsuarioKeyDown(Sender: TObject;var Key: Word; Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (chr(Key) in ['L', 'l']) then
    MaskEdit_Busca_Nome_Completo.SetFocus;
end;

procedure TForm_MenuRecepcao.DBGrid_VisaoCellClick(Column: TColumn);
var
   VS_Campo: String;
   VI_Tipo: Integer;
begin
   VS_Campo:= IBQuery_Visao.FieldByName('Dia01').AsString+IBQuery_Visao.FieldByName('Dia02').AsString+IBQuery_Visao.FieldByName('Dia03').AsString;
   if Trim(VS_Campo) = 'ARRUMAR' then
      ToolButton_Disponivel.Enabled:= True
   else
      ToolButton_Disponivel.Enabled:= False;

   VS_Campo:= IBQuery_Visao.FieldByName(Column.FieldName).AsString;
   if VS_Campo <> '' then
   begin
      IBQuery_Busca.Close;
      IBQuery_Busca.SQL.Clear;
      IBQuery_Busca.SQL.Add('Select * from Mapa where Codigo = '+#39+VS_Campo+#39);
      IBQuery_Busca.OPen;

   end;
    if DM.Habilitado_Para = 'CINDACTA III' then
       ToolButton_CancelarHospedagem.Enabled:= True
    else
       if (IBQuery_Busca.FieldByName('Tipo').AsString = '1') then   // Ocupado
          ToolButton_CancelarHospedagem.Enabled:= True
       else
          ToolButton_CancelarHospedagem.Enabled:= False;
end;


procedure TForm_MenuRecepcao.Edit_UsuarioKeyPress(Sender: TObject;var Key: Char);
begin
    If Key = #13 then
       Edit_Senha.SetFocus;
end;

procedure TForm_MenuRecepcao.Edit_SenhaKeyDown(Sender: TObject;var Key: Word; Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (chr(Key) in ['L', 'l']) then
    MaskEdit_Busca_Nome_Completo.SetFocus;
end;

procedure TForm_MenuRecepcao.Edit_SenhaKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 then
       ToolButton_HospedeClick(Sender);
end;

procedure TForm_MenuRecepcao.Edit_UsuarioChange(Sender: TObject);
begin
   Edit_Senha.Enabled:= true;
end;

procedure TForm_MenuRecepcao.ToolButton_DisponivelClick(Sender: TObject);
var
   VS_Comando: String;
begin
   VS_Comando:= 'Update APTOCAMA set AptCodigo = '+#39+'DESOCUPADO'+#39+
                ', Nome = '+#39+' '+#39+
                ' Where predio = '+#39+IBQuery_Visao.FieldByName('Predio').AsString+#39+
                ' and Apto = '+IBQuery_Visao.FieldByName('Apto').AsString+
                ' and Cama = '+IBQuery_Visao.FieldByName('Cama').AsString;
   Funcoes.ExecSql_Servidor(VS_Comando);

   Monta_Mapa(1);
end;

procedure TForm_MenuRecepcao.ToolButton_CancelarHospedagemClick(Sender: TObject);
Var
   Status: Boolean;
begin
//   Status:= Funcoes.Busca_Usuario(Edit_Usuario.Text, Edit_Senha.Text);
//   Edit_Usuario.Text:= '';
//   Edit_Senha.Text:= '';

//   if Status = False then
//   begin
//      VI_Tentativas:= VI_Tentativas + 1;
//      if VI_Tentativas > 3 then
//         Application.Terminate
//      else
//         Edit_Usuario.SetFocus;
//   end
//   else
//   begin
      if DM.Habilitado_Para = 'CINDACTA III' then
      begin
         Funcoes.Log_Recepcao('G-Reserva');
         Form_MontaReserva.Show;
      end
      else
      begin
         Funcoes.Log_Recepcao('R-Cancelar Hospedagem');
         Form_CancelamentoDeHospedagem.ShowModal;
         Monta_Mapa(1);
         IBQuery_MostraReserva.Close;
         IBQuery_MostraReserva.Open;
      end;
  // end;
end;

procedure TForm_MenuRecepcao.ToolButton_EmissaoRelBoletimEscolarClick(Sender: TObject);
begin
   QRListForm_Rel_Reserva.Preview;
end;

procedure TForm_MenuRecepcao.SpeedButton_RelHospedesClick(Sender: TObject);
begin
   Form_Rel_Hospede.Preview;
end;

procedure TForm_MenuRecepcao.SpeedButton_RelReservasClick(Sender: TObject);
begin
   QRListForm_Rel_Reserva.Preview;
end;

procedure TForm_MenuRecepcao.ToolButton_PatentesClick(Sender: TObject);
begin
   Form_Divisas.ShowModal;
end;

end.

