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
  StdCtrls, Forms, DBCtrls, DB, Buttons, Mask, ExtCtrls, ComCtrls,
  Grids, DBGrids, Rotinas, ToolWin, IBTable, IBCustomDataSet, IBQuery,
  JvLabel, JvBlinkingLabel, JvGradient, DBTables;

type
  TForm_Cad_Hospede = class(TForm)
    Panel2: TPanel;
    DST_CadHospede: TDataSource;
    DST_CadHospedagem: TDataSource;
    DST_Busca_Tabela_Preco: TDataSource;
    DST_Busca_Posto: TDataSource;
    DSQ_Busca_Hospede: TDataSource;
    DSQ_Cama: TDataSource;
    DSQ_Atualiza_Cama: TDataSource;
    Panel1: TPanel;
    DSQ_Busca_Predio: TDataSource;
    GroupBox_Principal: TGroupBox;
    DBGrid_Mapa: TDBGrid;
    DSQ_Sel_Dep: TDataSource;
    DST_Dependente: TDataSource;
    StatusBar: TStatusBar;
    Panel15: TPanel;
    JvGradient3: TJvGradient;
    SpeedButton_AmpliaMapa: TSpeedButton;
    SpeedButton_MostraFicha: TSpeedButton;
    DSQ_Monta_Mapa: TDataSource;
    DST_Hospedagem: TDataSource;
    DST_Hospede: TDataSource;
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
    IBQuery_Busca_Predio: TIBQuery;
    IBTable_CadHospedagem: TIBTable;
    IBTable_CadHospedagemIDENTIDADE: TIBStringField;
    IBTable_CadHospedagemFICHA: TIBStringField;
    IBTable_CadHospedagemANO: TSmallintField;
    IBTable_CadHospedagemPREDIO: TIBStringField;
    IBTable_CadHospedagemAPTO: TSmallintField;
    IBTable_CadHospedagemCAMA: TSmallintField;
    IBTable_CadHospedagemDATAENTRADA: TIBStringField;
    IBTable_CadHospedagemHORAENTRADA: TIBStringField;
    IBTable_CadHospedagemDATASAIDA: TIBStringField;
    IBTable_CadHospedagemDEPENDENTE: TSmallintField;
    IBTable_CadHospedagemSITUACAO_HOSPEDAGEM: TIBStringField;
    IBTable_CadHospedagemRECEBE: TIBStringField;
    IBTable_CadHospedagemDESCONTO: TIBStringField;
    IBTable_CadHospede: TIBTable;
    IBTable_CadHospedeIDENTIDADE: TIBStringField;
    IBTable_CadHospedeNOME: TIBStringField;
    IBTable_CadHospedeNOME_GUERRA: TIBStringField;
    IBTable_CadHospedePOSTO: TIBStringField;
    IBTable_CadHospedeDEPENDENTE_DE: TIBStringField;
    IBTable_CadHospedeNACIONALIDADE: TIBStringField;
    IBTable_CadHospedeTELEFONE_RESIDENCIAL: TIBStringField;
    IBTable_CadHospedeTELEFONE_FUNCIONAL: TIBStringField;
    IBTable_CadHospedeSITUACAO_CURSO: TIBStringField;
    IBTable_CadHospedeRESIDENCIA: TIBStringField;
    IBTable_CadHospedeNUMERO: TIBStringField;
    IBTable_CadHospedeCIDADE: TIBStringField;
    IBTable_CadHospedeBAIRRO: TIBStringField;
    IBTable_CadHospedeESTADO: TIBStringField;
    IBTable_CadHospedeOM_ORIGEM: TIBStringField;
    IBQuery_Busca_Hospede: TIBQuery;
    IBQuery_Atualiza_Cama: TIBQuery;
    IBQuery_Decea: TIBQuery;
    IBQuery_DeceaLOCALIDADE: TIBStringField;
    IBQuery_Tabela_Posto: TIBQuery;
    IBQuery_Exclui_Reserva: TIBQuery;
    IBQuery_Sel_Dep: TIBQuery;
    IBQuery_Cama: TIBQuery;
    IBQuery_Monta_Mapa: TIBQuery;
    IBTable_Busca_Posto: TIBTable;
    IBTable_Busca_PostoCODIGO: TIBStringField;
    IBTable_Busca_PostoCODTABELA: TIBStringField;
    IBTable_Busca_PostoPOSTO: TIBStringField;
    IBTable_Busca_Tabela_Preco: TIBTable;
    IBTable_Busca_Tabela_PrecoPREDIO: TIBStringField;
    IBTable_Busca_Tabela_PrecoCODIGO: TIBStringField;
    IBTable_CadReserva: TIBTable;
    IBTable_Ficha: TIBTable;
    IBTable_FichaFICHA: TIBStringField;
    IBTable_Atualiza_Cama: TIBTable;
    IBTable_Atualiza_CamaPREDIO: TIBStringField;
    IBTable_Atualiza_CamaAPTO: TSmallintField;
    IBTable_Atualiza_CamaCAMA: TSmallintField;
    IBTable_Atualiza_CamaAPTCODIGO: TIBStringField;
    IBTable_Atualiza_CamaNOME: TIBStringField;
    IBTable_Historico: TIBTable;
    IBTable_Dependente: TIBTable;
    IBTable_DependenteIDENTIDADE: TIBStringField;
    IBTable_DependenteFICHA: TIBStringField;
    IBTable_DependenteANO: TSmallintField;
    IBTable_DependentePREDIO: TIBStringField;
    IBTable_DependenteAPTO: TSmallintField;
    IBTable_DependenteCAMA: TSmallintField;
    IBTable_Hospedagem: TIBTable;
    IBTable_Hospede: TIBTable;
    IBTable_Reserva: TIBTable;
    IBTable_Hospede01: TIBTable;
    Panel4: TPanel;
    Panel42: TPanel;
    Panel10: TPanel;
    Panel13: TPanel;
    Panel18: TPanel;
    Panel21: TPanel;
    Panel7: TPanel;
    Panel12: TPanel;
    Panel43: TPanel;
    Panel44: TPanel;
    Panel45: TPanel;
    Panel48: TPanel;
    Panel50: TPanel;
    Panel5: TPanel;
    Panel14: TPanel;
    IBQuery_Curso: TIBQuery;
    IBQuery_Atualiza_CamaPREDIO: TIBStringField;
    IBQuery_Atualiza_CamaAPTO: TSmallintField;
    IBQuery_Atualiza_CamaCAMA: TSmallintField;
    IBQuery_Atualiza_CamaAPTCODIGO: TIBStringField;
    IBQuery_Atualiza_CamaNOME: TIBStringField;
    IBQuery_CursoCURSO: TIBStringField;
    Panel47: TPanel;
    Panel8: TPanel;
    SpeedButton_Atualiza_Mapa: TSpeedButton;
    Label2: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label_SelApto: TLabel;
    Label5: TLabel;
    Panel_MostraHospede: TPanel;
    JvGradient2: TJvGradient;
    DBText_Nome: TDBText;
    DBText3: TDBText;
    DBText2: TDBText;
    DBText1: TDBText;
    Label1: TLabel;
    Label4: TLabel;
    ProgressBar1: TProgressBar;
    MaskEdit_Busca_Nome_Completo: TMaskEdit;
    MaskEdit_Nome_Guerra: TMaskEdit;
    ComboBox_Predio: TComboBox;
    MaskEdit_Apto: TMaskEdit;
    MaskEdit_Ramal: TMaskEdit;
    Panel_FichaHospede: TPanel;
    Label_mome: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label_Telefone_Residencial: TLabel;
    Label13: TLabel;
    Label_Nome_Guerra: TLabel;
    Label10: TLabel;
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
    MaskEdit_Ficha: TMaskEdit;
    MaskEdit_Nome: TMaskEdit;
    MaskEdit_Nome_de_Guerra: TMaskEdit;
    ComboBox_Posto_Graduacao: TComboBox;
    MaskEdit_Nacionalidade: TMaskEdit;
    MaskEdit_Identidade: TMaskEdit;
    MaskEdit_Telefone_Residencial: TMaskEdit;
    MaskEdit_Telefone_Funcional: TMaskEdit;
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
    _Patente: TToolBar;
    ToolButton_Patentes: TToolButton;
    Label20: TLabel;
    ComboBox_OM_Destino: TComboBox;
    IBTable_DependenteNOME: TIBStringField;
    IBTable_DependenteIDADE: TSmallintField;
    IBTable_HistoricoIDENTIDADE: TIBStringField;
    IBTable_HistoricoFICHA: TIBStringField;
    IBTable_HistoricoANO: TSmallintField;
    IBTable_HistoricoPREDIO: TIBStringField;
    IBTable_HistoricoAPTO: TSmallintField;
    IBTable_HistoricoDATAENTRADA: TDateTimeField;
    IBTable_HistoricoHORAENTRADA: TIBStringField;
    IBTable_HistoricoDATASAIDA: TDateTimeField;
    IBTable_HistoricoDATAPAGAMENTO: TDateTimeField;
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
    DST_Reserva: TDataSource;
    DST_CadReserva: TDataSource;
    IBTable_ReservaIDENTIDADE: TIBStringField;
    IBTable_ReservaDATAENTRADA: TDateTimeField;
    IBTable_ReservaNOME: TIBStringField;
    IBTable_ReservaNOME_GUERRA: TIBStringField;
    IBTable_ReservaPOSTO: TIBStringField;
    IBTable_ReservaDEPENDENTE_DE: TIBStringField;
    IBTable_ReservaTELEFONE_FUNCIONAL: TIBStringField;
    IBTable_ReservaSITUACAO_CURSO: TIBStringField;
    IBTable_ReservaOM_ORIGEM: TIBStringField;
    IBTable_ReservaDEPENDENTE: TSmallintField;
    IBTable_ReservaHORAENTRADA: TIBStringField;
    IBTable_ReservaDATASAIDA: TDateTimeField;
    IBTable_ReservaPREDIO: TIBStringField;
    IBTable_ReservaAPTO: TSmallintField;
    IBTable_ReservaCAMA: TSmallintField;
    IBTable_ReservaRECEBE: TIBStringField;
    IBTable_ReservaUSUARIO: TIBStringField;
    IBTable_Mapa_Dep: TIBTable;
    DST_MapaDep: TDataSource;
    IBTable_Resp: TIBTable;
    DST_Resp: TDataSource;

    procedure Mostra_Hospede;
    procedure Mostra_Reserva;

    procedure FormCreate(Sender: TObject);

    procedure Busca_Apto;
    procedure Botao(Status: Boolean);
    procedure TrataCampos(Status: Boolean);
    procedure Limpar_Caixas_de_Entrada;
    procedure Monta_Posto_Predio;
    procedure FecharTabelas;
    procedure SelecionarDependente;
    procedure Busca_Predio(VS_Comando: String);

    procedure ComboBox_AptoExit(Sender: TObject);
    procedure MaskEdit_IdentidadeExit(Sender: TObject);
    procedure ComboBox_OM_OrigemExit(Sender: TObject);
    Procedure BuscaHospede;

    procedure Monta_Mapa(Situacao: integer);

    procedure DBGrid_MapaDrawColumnCell(Sender: TObject;
     const Rect: TRect; DataCol: Integer; Column: TColumn;State: TGridDrawState);

   procedure ComboBox_PredioChange(Sender: TObject);
   procedure Executa_Query_Monta_Mapa(Query_Monta_Mapa: TIBQuery;VS_Comando: String);
   procedure Executa_Query_Mapa(VS_Busca: String; VI_Opc: Integer);
   procedure ComboBox_Busca_PredioChange(Sender: TObject);
   procedure ComboBox_PredioKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
   procedure MaskEdit_Busca_Nome_CompletoChange(Sender: TObject);
   procedure MaskEdit_Nome_GuerraChange(Sender: TObject);
   procedure MaskEdit_RamalChange(Sender: TObject);
   procedure SpeedButton_Atualiza_MapaClick(Sender: TObject);
   procedure TrataBotoes_Hospede;
   procedure DBGrid_MapaKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
   procedure SpeedButton_PredioClick(Sender: TObject);
   procedure Hospedar_Dep(VS_Predio: String; VS_Cama: String; VI_Dep: integer);
   procedure MaskEdit_AptoChange(Sender: TObject);
   procedure SpeedButton_IdentidadeClick(Sender: TObject);
   procedure Cancela_Hospedagem;
   procedure SpeedButton_DependenteClick(Sender: TObject);
   procedure MaskEdit_FichaKeyPress(Sender: TObject; var Key: Char);

    procedure SpeedButton_MostraFichaClick(Sender: TObject);
    procedure SpeedButton_AmpliaMapaClick(Sender: TObject);
    procedure ToolButton_HospedarClick(Sender: TObject);
    procedure ToolButton_AlterarClick(Sender: TObject);
    procedure ToolButton_GravarClick(Sender: TObject);
    procedure ToolButton_CancelarClick(Sender: TObject);
    procedure ToolButton_Fechar_ContaClick(Sender: TObject);
    procedure ToolButton_DesocuparClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure IBTable_CadHospedePostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IBTable_CadHospedagemPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IBTable_HistoricoPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IBTable_CadHospedagemAfterScroll(DataSet: TDataSet);
    procedure ToolButton_PatentesClick(Sender: TObject);
    procedure MaskEdit_NomeExit(Sender: TObject);
  private
    { private declarations }
  public    { public declarations }
    VB_Tipo_Reserva, VB_Alerta, VB_Achou: Boolean;
    VS_Ant_Depedente, VS_Ant_Cama, VS_Ant_Apto, VS_Ant_Predio: String;
    VS_Nome_Reserva, VS_Predio_Reserva, VS_Apto_Reserva, VS_Cama_Reserva, VS_DataEntrada_Reserva, VS_DataSaida_Reserva, VS_Opcao : String;
    VI_Ficha, VI_Codigo: Integer;
  end;

var
  Form_Cad_Hospede: TForm_Cad_Hospede;

implementation

uses Module, Cad_Dependente, Divisas, Sel_Hospede, Sel_Recibo, Sel_Apto;

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.FormCreate(Sender: TObject);
begin
   if Funcoes.GetCad_Hospede = False then
   begin
      Funcoes.AlimentaComboBox(ComboBox_Predio, 0, 'Todos');

      ComboBox_Situacao_Curso.Items.Clear;
      ComboBox_Situacao_Curso.Items.Add('TRANSITO');
      ComboBox_Situacao_Curso.Items.Add('RESIDENTE');

      if DM.Habilitado_Para = 'HOTEL CTA' then
      begin
//         ComboBox_Situacao_Curso.Items.Add('TRANSITO');
//         ComboBox_Situacao_Curso.Items.Add('RESIDENTE');
         ComboBox_Situacao_Curso.Items.Add('CURSO<30D');
         ComboBox_Situacao_Curso.Items.Add('CURSO>30D');
         ComboBox_Situacao_Curso.Items.Add('CURSO PNR');
//         ComboBox_Situacao_Curso.Items.Add('VISITA ESP');
      end;

      Panel_Aviso.Visible:= False;

      VS_Opcao:= 'Inicio';

      IBTable_CadHospedagem.Open;
      IBTable_CadHospede.Open;
      IBTable_CadReserva.Open;
      IBTable_Busca_Tabela_Preco.Open;
      IBTable_Busca_Posto.Open;
      IBTable_Historico.Open;
      IBTable_Dependente.Open;
      IBTable_Ficha.Open;
      IBTable_Mapa_Dep.Open;
      DM.IBTable_Apto_Ocupado.Open;

      IBTable_Hospedagem.Open;
      IBTable_Hospede.Open;
      IBTable_Reserva.Open;
      IBTable_Mapa_Dep.Open;
      IBTable_Hospede01.Open;

       //---
      //--- Preenche o campo OM de origem

      IBQuery_Decea.Open;
      IBQuery_Decea.First;
      ComboBox_OM_Origem.Items.Clear;
      ComboBox_OM_Destino.Items.Clear;
      While not IBQuery_Decea.eof do
      begin
         ComboBox_OM_Origem.Items.Add(IBQuery_Decea.FieldByName('Localidade').AsString);
         ComboBox_OM_Destino.Items.Add(IBQuery_Decea.FieldByName('Localidade').AsString);
         IBQuery_Decea.Next;
      end;
      IBQuery_Decea.Close;

       //---
      //--- Verifica o tipo de usuario

      if Funcoes.GetPrivilegio = 'G' then
      begin
         RadioGroup_Desconto.Visible:= True;
         Label_Recebimento.Visible:= True;
         ComboBox_Recebimento.Visible:= True;
         Label_Local_Recebimento.Visible:= True;
         ToolButton_Alterar.Visible:= True;
      end
      else
      begin
         RadioGroup_Desconto.Visible:= False;
         Label_Recebimento.Visible:= False;
         ComboBox_Recebimento.Visible:= False;
         Label_Local_Recebimento.Visible:= False;
         ToolButton_Alterar.Visible:= False;
      end;

      Funcoes.SetCad_Hospede(True);
      TrataBotoes_Hospede;
      SpeedButton_Predio.Enabled:= False;
      TrataCampos(True);

      SpeedButton_MostraFichaClick(Sender);
      statusbar.Panels[1].text:= '  Selecione o '+PredioAndar;
      Funcoes.LimpaMapa;
      Executa_Query_Mapa('', 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Inserção de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.ToolButton_HospedarClick(Sender: TObject);
begin
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
   VS_Opcao:= 'Inserir';
   VS_Cama:= DM.IBQuery_Mapa.FieldByName('Cama').AsString;
   Botao( False );
   statusbar.Panels[1].text:= ' Forneça a Identidade do Hospede';

    //---
   //--- Tratamento do cadastro do hospede quando for reserva

   if (DM.IBQuery_Mapa.FieldByName('TIPO').AsInteger = 2) then
   begin
     TrataCampos(False);

     VS_Nome_Reserva:= IBTable_CadReserva.FieldByName('NOME').AsString;
     VS_Predio_Reserva:= IBTable_CadReserva.FieldByName('Predio').AsString;
     VS_Apto_Reserva:= IBTable_CadReserva.FieldByName('Apto').AsString;
     VS_Cama_Reserva:= IBTable_CadReserva.FieldByName('Cama').AsString;;
     VS_DataEntrada_Reserva:= Funcoes.DePara(IBTable_CadReserva.FieldByName('DataEntrada').AsString, '/', '.');
     VS_DataEntrada_Reserva:= VS_DataEntrada_Reserva+' 00:00';

     VS_DataSaida_Reserva:= Funcoes.DePara(IBTable_CadReserva.FieldByName('DataSaida').AsString, '/', '.');
     VS_DataSaida_Reserva:= VS_DataSaida_Reserva+' 00:00';

     MaskEdit_Nome.text:= IBTable_CadReserva.FieldByName('NOME').AsString;
     MaskEdit_Nome_de_Guerra.text:= IBTable_CadReserva.FieldByName('NOME_Guerra').AsString;
     DateTimePicker_Entrada.Date:= StrtoDate(IBTable_CadReserva.FieldByName('DataEntrada').AsString);
     DateTimePicker_Saida.Date:= StrtoDate(IBTable_CadReserva.FieldByName('DataSaida').AsString);
     
     VB_Tipo_Reserva:= True;
   end
   else
   begin
      MaskEdit_Identidade.Clear;
      Limpar_Caixas_de_Entrada;
      Edit_Predio.Text:= DM.IBQuery_Mapa.FieldByName('Predio').AsString;
      Edit_Apto.Text:= DM.IBQuery_Mapa.FieldByName('Apto').AsString;
   end;
   RadioGroup_Desconto.ItemIndex:= 1;
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

       if MaskEdit_Dependente.Text = '' then
          SpeedButton_Dependente.Enabled:= False
       else
          if StrToInt(MaskEdit_Dependente.Text) = 0 then
             SpeedButton_Dependente.Enabled:= False
          else
             SpeedButton_Dependente.Enabled:= True;


   MaskEdit_Identidade.Enabled:= False;
   MaskEdit_Ficha.Enabled:= False;
   SpeedButton_Identidade.Enabled:= False;
   DBGrid_Mapa.Enabled:= False;
   GroupBox_Principal.Enabled:= False;

   // Guarda os dados anteriores do apto

   VS_Predio:= IBTable_CadHospedagem.FieldByName('PREDIO').AsString;
   VS_Apto:= IBTable_CadHospedagem.FieldByName('APTO').AsString;
   VS_Cama:= IBTable_CadHospedagem.FieldByName('CAMA').AsString;

   VS_Ant_Predio:= IBTable_CadHospedagem.FieldByName('PREDIO').AsString;
   VS_Ant_Apto:= IBTable_CadHospedagem.FieldByName('APTO').AsString;
   VS_Ant_Cama:= IBTable_CadHospedagem.FieldByName('CAMA').AsString;
   VS_Ant_Depedente:= IBTable_CadHospedagem.FieldByName('DEPENDENTE').AsString;
   VS_Cama:= IBTable_CadHospedagem.FieldByName('CAMA').AsString;
   statusbar.Panels[1].text:= ' Entre com a alteração necessária.';

   MaskEdit_Nome.SetFocus;
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.ToolButton_GravarClick(Sender: TObject);
var
   Qtd_Cama, QtdHospedagem: Integer;
   VS_SQL_Cama, VS_Comando: String;
   VB_Retorno_Cama, VB_Retorno, VB_Grava: Boolean;
begin
   VB_Alerta:= True;

   if VS_Opcao = 'Alterar' then
      VB_Alerta:= True;

   if VB_Alerta = False then
   begin
      MessageDlg('Favor verificar se o número da Ficha e as informações digitadas estão corretos ?'+#13+
                 'Para continuar clique novamente no botão gravar.', mtInformation,[mbOk], 0);
      VB_Alerta:= True;
   end
   else
   begin
      VB_Grava:= True;

      if ComboBox_Situacao_Curso.Text = 'VISITA ESP' then
      begin
         if (trim(ComboBox_Dependente_de.Text) = '')   then
         begin
            MessageDlg('A Situação de Hospedagem VISITA ESP, deve ser apenas para DEPENDENTE DE...', mtInformation,[mbOk], 0);
            VB_Grava:= False;
            ComboBox_Situacao_Curso.SetFocus;
         end;
      end;

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
            if VS_Opcao = 'Inserir' then
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
                     MessageDlg('Já existe hospedagem com a Ficha ('+MaskEdit_Ficha.Text+').', mtInformation,[mbOk], 0);
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

      if ((trim(ComboBox_Posto_Graduacao.Text) <> '') and (VB_Grava = True))  then
      begin
          VS_Comando:= 'Select * from TABELA_POSTO where posto = '+#39+trim(ComboBox_Posto_Graduacao.Text)+#39;
          if Funcoes.Procura(VS_Comando) = False then
          begin
             MessageDlg('O posto deve ser escolhida na lista...', mtInformation,[mbOk], 0);
             VB_Grava:= False;
          end;
      end;

       //---
      //--- Analisa Dependente de

      if ((trim(ComboBox_Dependente_de.Text) <> '') and (trim(ComboBox_Posto_Graduacao.Text) <> '') and (VB_Grava = True))  then
      begin
         MessageDlg('O Posto/Graduação deve ser do próprio ou dependente'+#13+'não pode estar preenchido para o próprio e dependente ao mesmo tempo...', mtInformation,[mbOk], 0);
         VB_Grava:= False;
      end;

       //---
      //--- Analisa Dependente de

      if ((trim(ComboBox_Dependente_de.Text) = '') and (trim(ComboBox_Posto_Graduacao.Text) = '') and (VB_Grava = True))  then
      begin
         MessageDlg('Não foi escolhido o posto...', mtInformation,[mbOk], 0);
         VB_Grava:= False;
      end
      else
      begin
         if ((trim(ComboBox_Dependente_de.Text) <> '') and (trim(ComboBox_Posto_Graduacao.Text) = '') and (VB_Grava = True))  then
         begin
            VS_Comando:= 'Select * from TABELA_POSTO where posto = '+#39+trim(ComboBox_Dependente_de.Text)+#39;
            if Funcoes.Procura(VS_Comando) = False then
            begin
               MessageDlg('O posto do dependente deve ser escolhida na lista...', mtInformation,[mbOk], 0);
               VB_Grava:= False;
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

        //---
      //--- Verifica se o posto esta cadastrado para o predio selecionado

      if (VB_Grava = True)  then
      begin
         if (trim(ComboBox_Dependente_de.Text) = '') then
         begin
            VS_Comando:= 'select tpr.predio, tpr.valor, tpo.posto '+
                         'from tabela_preco tpr, tabela_posto tpo '+
                         'where (tpr.codigo = tpo.codigo) '+
                         'and (tpo.posto = '+#39+trim(ComboBox_Posto_Graduacao.Text)+#39+' '+
                         'and  tpr.predio = '+#39+trim(Edit_Predio.Text)+#39+')';
         end
         else
         begin
            VS_Comando:= 'select tpr.predio, tpr.valor, tpo.posto '+
                         'from tabela_preco tpr, tabela_posto tpo '+
                         'where (tpr.codigo = tpo.codigo) '+
                         'and (tpo.posto = '+#39+trim(ComboBox_Dependente_de.Text)+#39+' '+
                         'and  tpr.predio = '+#39+trim(Edit_Predio.Text)+#39+')';
         end;

         VB_Retorno:= Funcoes.Procura(VS_Comando);

         if  VB_Retorno = False then
         begin
            MessageDlg('O Posto/Graduação '+trim(ComboBox_Posto_Graduacao.Text)+' não foi encontrado na tabela de preço do '+PredioAndar+trim(Edit_Predio.Text)+' .'+#13+
                       'Verifique no cadastro do hóspede se o posto esta correto,', mtError,[mbOk], 0);

            VB_Grava:= False;
         end;
      end;

       //---
      //--- Verifica se o posto pode ser hospedado no apto selecionado

      if ((trim(ComboBox_Posto_Graduacao.Text) <> '') and (VB_Grava = True))  then
      begin
         VS_Comando:= 'select tpr.predio, tpr.valor, tpo.posto, tpo.codigo '+
                      'from tabela_preco tpr, tabela_posto tpo '+
                      'where (tpr.codigo = tpo.codigo) '+
                      'and (tpo.posto = '+#39+trim(ComboBox_Posto_Graduacao.Text)+#39+' '+
                      'and  tpr.predio = '+#39+trim(Edit_Predio.Text)+#39+')';

//                      'and  tpr.predio = '+#39+trim(IBQuery_Mapa.FieldByName('Predio').AsString)+#39+')';

         IBQuery_Tabela_Posto.Close;
         IBQuery_Tabela_Posto.SQL.Clear;
         IBQuery_Tabela_Posto.SQL.Add(VS_Comando);
         IBQuery_Tabela_Posto.Open;

         if IBQuery_Tabela_Posto.RecordCount = 0 then
         begin
            MessageDlg('O Posto/Graduação de '+trim(ComboBox_Posto_Graduacao.Text)+' não ser hospedado no '+PredioAndar+trim(IBTable_CadHospedagem.FieldByName('Predio').AsString)+' .'+#13+
                       'Verifique se o posto esta correto,'+#13, mtError,[mbOk], 0);
            VB_Grava:= False;
         end;
      end;

      VB_Retorno_Cama:= True;

       //----------------
      //--- Verifica se existe cama disponivel

      if ((VS_Ant_Predio <> VS_Predio) or (VS_Ant_Apto <> VS_Apto) or (VS_Cama <> VS_Ant_Cama)) then
      begin
          //----------------
         //--- Verifica se existe vaga disponivel

         QtdHospedagem:= 1+StrToInt(MaskEdit_Dependente.Text);   // Soma o numero de hospedagem

         VS_Comando:= 'Select Count(*) as QtdReg from AptoCama '+
                      ' Where predio = '+#39+Edit_Predio.Text+#39+
                      ' and Apto = '+#39+Edit_Apto.Text+#39+
                      ' and AptCodigo = '+#39+'DESOCUPADO'+#39;

         Qtd_Cama:= Funcoes.QtdRegistro(VS_Comando);

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

            IBQuery_Cama.Close;
            IBQuery_Cama.Sql.Clear;
            IBQuery_Cama.Sql.Add(VS_Comando);
            IBQuery_Cama.Open;

            if ((IBQuery_Cama.fieldByName('AptCodigo').AsString = 'OCUPADO') or
                (IBQuery_Cama.fieldByName('AptCodigo').AsString = 'DEP' )) then
            begin
               //-- Tratamento quando a cama estiver ocupada
               VS_Comando:= 'Select * from AptoCama Where (predio = '+#39+Edit_Predio.Text+#39+
                            ' and Apto = '+#39+Edit_Apto.Text+#39+') and Cama <> '+#39+VS_Cama+#39;

               IBQuery_Cama.Close;
               IBQuery_Cama.Sql.Clear;
               IBQuery_Cama.Sql.Add(VS_Comando);
               IBQuery_Cama.Open;

               VS_Cama:= '0';
               VB_Retorno_Cama:= False;
               While ((not IBQuery_Cama.eof) and (VS_Cama = '0'))do
               begin
                  if IBQuery_Cama.fieldByName('AptCodigo').AsString = 'DESOCUPADO' then
                  begin
                     VS_Cama:= IBQuery_Cama.fieldByName('Cama').AsString;
                     VB_Retorno_Cama:= True;
                  end;
                  IBQuery_Cama.Next;
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

         Panel_Aviso.Visible:= False;
         if VS_Opcao = 'Inserir' then
         begin
            if VB_Achou = True then
            begin
               IBTable_CadHospede.MasterSource:= DSQ_Busca_Hospede;
               IBTable_CadHospede.Edit;
            end
            else
               IBTable_CadHospede.Insert;
         end
         else
            IBTable_CadHospede.Edit;

         IBTable_CadHospede.FieldByName('NOME').AsString:= MaskEdit_Nome.Text;
         IBTable_CadHospede.FieldByName('NOME_GUERRA').AsString:= MaskEdit_Nome_de_Guerra.Text;
         IBTable_CadHospede.FieldByName('POSTO').AsString := UpperCase(ComboBox_Posto_Graduacao.Text);
         IBTable_CadHospede.FieldByName('DEPENDENTE_DE').AsString := UpperCase(ComboBox_Dependente_de.Text);
         IBTable_CadHospede.FieldByName('NACIONALIDADE').AsString:= MaskEdit_Nacionalidade.Text;
         IBTable_CadHospede.FieldByName('IDENTIDADE').AsString:= MaskEdit_Identidade.Text;
         IBTable_CadHospede.FieldByName('TELEFONE_RESIDENCIAL').AsString:= MaskEdit_Telefone_Residencial.Text;
         IBTable_CadHospede.FieldByName('TELEFONE_FUNCIONAL').AsString:= MaskEdit_Telefone_Funcional.Text;
         IBTable_CadHospede.FieldByName('RESIDENCIA').AsString:= UpperCase(ComboBox_OM_Destino.Text);
         IBTable_CadHospede.FieldByName('OM_ORIGEM').AsString:= UpperCase(ComboBox_OM_Origem.Text);
         IBTable_CadHospede.FieldByName('SITUACAO_CURSO').AsString:= UpperCase(ComboBox_Situacao_Curso.Text);
         IBTable_CadHospede.Post;
         DM.IBTransaction_Hotel.CommitRetaining;

          //---
         //--- Gravacao dos dados do Historico

         if VS_Opcao = 'Inserir' then
         begin
            IBTable_Historico.Insert;
            IBTable_Historico.FieldByName('USUARIO_ENTRADA').AsString:= Funcoes.GetUsuario;
            IBTable_Historico.FieldByName('IDENTIDADE').AsString:= Trim(MaskEdit_Identidade.Text);
            IBTable_Historico.FieldByName('FICHA').AsString:= Funcoes.NFicha(Trim(MaskEdit_Ficha.Text));
            IBTable_Historico.FieldByName('Ano').AsString:= Funcoes.AnoAtual;
         end
         else
         begin
            IBTable_Historico.Edit;
         end;

          //---
         //--- Grava os dados inciais para o historico

         IBTable_Historico.FieldByName('PREDIO').AsString := UpperCase(Edit_Predio.Text);
         IBTable_Historico.FieldByName('APTO').AsString := UpperCase(Edit_Apto.Text);
         IBTable_Historico.FieldByName('DATAENTRADA').AsString:= DateToStr(DateTimePicker_Entrada.Date);
         IBTable_Historico.FieldByName('HORAENTRADA').AsString:= MaskEdit_Hora_Entrada.Text;
         IBTable_Historico.FieldByName('DATASAIDA').AsString:= DateToStr(DateTimePicker_Saida.Date);
         IBTable_Historico.FieldByName('TIPO_FECHAMENTO').AsString:= 'H';
         IBTable_Historico.Post;
         DM.IBTransaction_Hotel.CommitRetaining;

          //---
         //--- Gravacao dos dados da Hospedagem

         if VS_Opcao = 'Inserir' then
         begin
            IBTable_CadHospedagem.Insert;
            IBTable_CadHospedagem.FieldByName('Ano').AsString:= Funcoes.AnoAtual;
            IBTable_CadHospedagem.FieldByName('FICHA').AsString:= Funcoes.NFicha(Trim(MaskEdit_Ficha.Text));
            IBTable_CadHospedagem.FieldByName('IDENTIDADE').AsString:= Trim(MaskEdit_Identidade.Text);
         end
         else
            IBTable_CadHospedagem.Edit;

         IBTable_CadHospedagem.FieldByName('PREDIO').AsString := UpperCase(Edit_Predio.Text);
         IBTable_CadHospedagem.FieldByName('APTO').AsString := UpperCase(Edit_Apto.Text);
         IBTable_CadHospedagem.FieldByName('CAMA').AsString:= VS_Cama;

         IBTable_CadHospedagem.FieldByName('DATAENTRADA').AsString:= DateToStr(DateTimePicker_Entrada.Date);
         IBTable_CadHospedagem.FieldByName('HORAENTRADA').AsString:= MaskEdit_Hora_Entrada.Text;
         IBTable_CadHospedagem.FieldByName('DATASAIDA').AsString:= DateToStr(DateTimePicker_Saida.Date);
         IBTable_CadHospedagem.FieldByName('RECEBE').AsString:= UpperCase(ComboBox_Recebimento.Text);
         IBTable_CadHospedagem.FieldByName('Dependente').AsString:= MaskEdit_Dependente.Text;
         IBTable_CadHospedagem.FieldByName('Desconto').AsInteger:= RadioGroup_Desconto.ItemIndex;
         IBTable_CadHospedagem.Post;
         DM.IBTransaction_Hotel.CommitRetaining;

         // Tratamento da ocupacao da cama pelo hospede

         VS_Predio:= Edit_Predio.Text;
         VS_Apto:= Edit_Apto.Text;

         if VS_Opcao = 'Inserir' then
         begin
            VS_SQL_Cama:= 'Update APTOCAMA set AptCodigo = '+#39+'OCUPADO'+#39+
                          ' Where predio = '+#39+VS_Predio+#39+
                          ' and Apto = '+#39+VS_Apto+#39+
                          ' and Cama = '+#39+VS_Cama+#39;
            Funcoes.ExecSql_Servidor(VS_SQL_Cama);

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
               Funcoes.ExecSql_Servidor(VS_SQL_Cama);

               //--- Grava o hospede no novo apto

               VS_SQL_Cama:= 'Update APTOCAMA set AptCodigo = '+#39+'OCUPADO'+#39+
                             ' Where predio = '+#39+VS_Predio+#39+
                             ' and Apto = '+#39+VS_Apto+#39+
                             ' and Cama = '+#39+VS_Cama+#39;
               Funcoes.ExecSql_Servidor(VS_SQL_Cama);
            end;

            //--- Limpa os dependentes anterior, se tiver

               if StrToInt(VS_Ant_Depedente) > 0 then
               begin
                  VS_SQL_Cama:= 'Update APTOCAMA set AptCodigo = '+#39+'DESOCUPADO'+#39+
                                ' Where predio = '+#39+VS_Ant_Predio+#39+
                                ' and Apto = '+#39+VS_Ant_Apto+#39+
                                ' and AptCodigo = '+#39+'DEP'+#39;
                  Funcoes.ExecSql_Servidor(VS_SQL_Cama);
               end;

               //--- Grava dependente

               if StrToInt(MaskEdit_Dependente.Text) > 0 then
                  Hospedar_Dep(VS_Predio, VS_Apto, StrToInt(MaskEdit_Dependente.Text));
         end;

         //--- Atualiza o numero da Ficha na tabela de ficha

         if VS_Opcao = 'Inserir' then
         begin
            IBTable_Ficha.First;
            IBTable_Ficha.Edit;
            IBTable_Ficha.FieldByName('Ficha').Asinteger:= VI_Ficha;
            IBTable_Ficha.Post;
            DM.IBTransaction_Hotel.CommitRetaining;
         end;

         //--- Exclui reserva quando efetuada hospedagem

         if (VB_Tipo_Reserva = True) then
         begin
            VS_SQL_Cama:= 'delete from Reserva '+
                          ' Where nome = '+#39+ trim(VS_Nome_Reserva)+#39+
                          ' and predio = '+#39+VS_Predio_Reserva+#39+
                          ' and Apto = '+#39+VS_Apto_Reserva+#39+
                          ' and Cama = '+#39+VS_Cama_Reserva+#39+
                          ' and DataEntrada = '+#39+VS_DataEntrada_Reserva+#39+
                          ' and DataSaida = '+#39+VS_DataSaida_Reserva+#39;
            Funcoes.ExecSql_Servidor(VS_SQL_Cama);
         end;

         if ((VS_Opcao = 'Inserir') and (VB_Achou = True)) then
            IBTable_CadHospede.MasterSource:= DST_CadHospedagem;

         Panel_Aviso.Visible:= False;

         VS_Opcao:= 'Inicio';
         DBGrid_Mapa.Enabled:= True;
         GroupBox_Principal.Enabled:= True;

         TrataBotoes_Hospede;
         TrataCampos(True);
         Monta_Mapa(1);
      end;
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

   if  VS_Opcao = 'Alterar' then
   begin
      VS_Comando:= 'Select * from dependente where ficha = '+#39+Funcoes.NFicha(MaskEdit_Ficha.Text)+#39;
      IBQuery_Sel_Dep.Close;
      IBQuery_Sel_Dep.Sql.Clear;
      IBQuery_Sel_Dep.Sql.Add(VS_Comando);
      IBQuery_Sel_Dep.Open;
      IBQuery_Sel_Dep.First;
   end;

   VI_Cont_Dep:= 1;

   VS_Comando:= 'Select * from aptocama where predio = '+#39+VS_Predio+#39+' and Apto = '+#39+VS_Apto+#39;

   IBQuery_Atualiza_Cama.Close;
   IBQuery_Atualiza_Cama.Sql.Clear;
   IBQuery_Atualiza_Cama.Sql.Add(VS_Comando);
   IBQuery_Atualiza_Cama.Open;
   IBTable_Atualiza_Cama.Open;

  IBQuery_Atualiza_Cama.First;
  While not IBQuery_Atualiza_Cama.Eof do
  begin
     if ((IBTable_Atualiza_Cama.FieldByName('AptCodigo').AsString = 'DESOCUPADO') and
         ( VI_Cont_Dep <= VI_Dep)) then
     begin
        IBTable_Atualiza_Cama.Edit;
        IBTable_Atualiza_Cama.FieldByName('AptCodigo').AsString:= 'DEP';
        IBTable_Atualiza_Cama.Post;
        DM.IBTransaction_Hotel.CommitRetaining;

        if  VS_Opcao = 'Alterar' then
        begin
           IBTable_Dependente.Edit;
           IBTable_Dependente.FieldByName('FICHA').AsString:= UpperCase(MaskEdit_Ficha.Text);
           IBTable_Dependente.FieldByName('ANO').AsString:= Funcoes.AnoAtual;;
           IBTable_Dependente.FieldByName('PREDIO').AsString:= UpperCase(Edit_Predio.Text);
           IBTable_Dependente.FieldByName('APTO').AsString:= UpperCase(Edit_Apto.Text);
           IBTable_Dependente.FieldByName('CAMA').AsString:= IBTable_Atualiza_Cama.FieldByName('Cama').AsString;
           IBTable_Dependente.Post;
           DM.IBTransaction_Hotel.CommitRetaining;
           if VI_Cont_Dep < VI_Dep then
              IBQuery_Sel_Dep.Next;
        end
        else
        begin
           IBTable_Dependente.Append;
           IBTable_Dependente.FieldByName('IDENTIDADE').AsString:= Trim(MaskEdit_Identidade.Text);
           IBTable_Dependente.FieldByName('FICHA').AsString:= Funcoes.NFicha(Trim(MaskEdit_Ficha.Text));
           IBTable_Dependente.FieldByName('ANO').AsString:= Funcoes.AnoAtual;
           IBTable_Dependente.FieldByName('PREDIO').AsString:= UpperCase(Edit_Predio.Text);
           IBTable_Dependente.FieldByName('APTO').AsString:= UpperCase(Edit_Apto.Text);
           IBTable_Dependente.FieldByName('CAMA').AsString:= IBTable_Atualiza_Cama.FieldByName('Cama').AsString;
           IBTable_Dependente.FieldByName('NOME').AsString:= 'DEP';
           IBTable_Dependente.Post;
           DM.IBTransaction_Hotel.CommitRetaining;
        end;
        VI_Cont_Dep:= VI_Cont_Dep + 1;
     end;
     IBQuery_Atualiza_Cama.Next;
  end;
  IBTable_Dependente.Close;
  IBTable_Dependente.Open;

   if VS_Opcao = 'Inserir' then
      SelecionarDependente;
end;

//------------------------------------------------------------------------------
// Chamada para form de tratamento do cadastro de dependente
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.SelecionarDependente;
var
   VS_Comando: String;
begin
   VS_Comando:= 'Select * from dependente where ficha = '+#39+Funcoes.NFicha(MaskEdit_Ficha.Text)+#39;
   IBQuery_Sel_Dep.Close;
   IBQuery_Sel_Dep.Sql.Clear;
   IBQuery_Sel_Dep.Sql.Add(VS_Comando);
   IBQuery_Sel_Dep.Open;
   Form_Cad_Dep_Hospede.ShowModal;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.ToolButton_CancelarClick(Sender: TObject);
begin
   statusbar.Panels[1].text:= 'Selecione o '+PredioAndar;
   Panel_Aviso.Visible:= False;
   MaskEdit_Ficha.Clear;
   Cancela_Hospedagem;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.Cancela_Hospedagem;
begin
   IBTable_CadHospedagem.Close;
   IBTable_CadHospedagem.Open;
   VS_Opcao:= 'Inicio';
   DBGrid_Mapa.Enabled:= True;
   GroupBox_Principal.Enabled:= True;

   TrataBotoes_Hospede;
   TrataCampos(True);
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
    MaskEdit_Telefone_Residencial.ReadOnly:= Status;
    MaskEdit_Telefone_Funcional.ReadOnly:= Status;
    MaskEdit_Hora_Entrada.ReadOnly:= Status;
    MaskEdit_Dependente.ReadOnly:= Status;

   if Status = False then
      Status:= True
   else
      Status:= False;

   MaskEdit_Identidade.Enabled:= Status;
   ComboBox_Posto_Graduacao.Enabled:= Status;
   ComboBox_Dependente_de.Enabled:= Status;
   ComboBox_OM_Origem.Enabled:= Status;
   ComboBox_OM_Destino.Enabled:= Status;
   ComboBox_Situacao_Curso.Enabled:= Status;
   DateTimePicker_Entrada.Enabled:= Status;
   DateTimePicker_Saida.Enabled:= Status;
   ComboBox_Recebimento.Enabled:= Status;
   RadioGroup_Desconto.Enabled:= Status;

   if ((VS_Opcao = 'Alterar') and (Funcoes.GetPrivilegio = 'C'))  then
   begin
//      MaskEdit_Ficha.Enabled:= True;
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
   Form_Divisas.ShowModal;
end;

//------------------------------------------------------------------------------
// Atualiza os dados do hospede
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.Mostra_Hospede;
begin
    if IBTable_CadHospedagem.Recordcount = 0 then
    begin
       Limpar_Caixas_de_Entrada;
    end
    else
    begin
       MaskEdit_Ficha.Text:= IBTable_CadHospedagem.FieldByName('FICHA').AsString;
       MaskEdit_Nome.Text:= IBTable_CadHospede.FieldByName('NOME').AsString;
       Edit_Predio.Text:= IBTable_CadHospedagem.FieldByName('PREDIO').AsString;
       Edit_Apto.Text:= IBTable_CadHospedagem.FieldByName('APTO').AsString;
       MaskEdit_Nome_de_Guerra.Text:= IBTable_CadHospede.FieldByName('NOME_GUERRA').AsString;
       ComboBox_Posto_Graduacao.Text:= IBTable_CadHospede.FieldByName('POSTO').AsString;
       ComboBox_Dependente_de.Text:= IBTable_CadHospede.FieldByName('Dependente_De').AsString;
       MaskEdit_Nacionalidade.Text:= IBTable_CadHospede.FieldByName('NACIONALIDADE').AsString;
       MaskEdit_Identidade.Text:= IBTable_CadHospede.FieldByName('IDENTIDADE').AsString;
       MaskEdit_Telefone_Residencial.Text:= IBTable_CadHospede.FieldByName('TELEFONE_RESIDENCIAL').AsString;
       MaskEdit_Telefone_Funcional.Text:= IBTable_CadHospede.FieldByName('TELEFONE_FUNCIONAL').AsString;
       ComboBox_OM_Origem.Text:= IBTable_CadHospede.FieldByName('RESIDENCIA').AsString;
       ComboBox_OM_Origem.Text:= IBTable_CadHospede.FieldByName('OM_ORIGEM').AsString;
       ComboBox_Situacao_Curso.Text:= IBTable_CadHospede.FieldByName('SITUACAO_CURSO').AsString;
       MaskEdit_Hora_Entrada.Text:= IBTable_CadHospedagem.FieldByName('HORAENTRADA').AsString;
       MaskEdit_Dependente.Text:= IBTable_CadHospedagem.FieldByName('Dependente').AsString;
       ComboBox_Recebimento.Text:= IBTable_CadHospedagem.FieldByName('RECEBE').AsString;
       RadioGroup_Desconto.ItemIndex:= IBTable_CadHospedagem.FieldByName('Desconto').AsInteger;

       if Trim(IBTable_CadHospedagem.FieldByName('DATAENTRADA').AsString) = '' then
          DateTimePicker_Entrada.Date:=  Date
       else
          DateTimePicker_Entrada.Date:= StrToDate(IBTable_CadHospedagem.FieldByName('DATAENTRADA').AsString);

       if Trim(IBTable_CadHospedagem.FieldByName('DATASAIDA').AsString) = '' then
          DateTimePicker_Saida.Date:=  Date
       else
          DateTimePicker_Saida.Date:= StrToDate(IBTable_CadHospedagem.FieldByName('DATASAIDA').AsString);

       if MaskEdit_Dependente.Text = '' then
          SpeedButton_Dependente.Enabled:= False
       else
          if StrToInt(MaskEdit_Dependente.Text) = 0 then
             SpeedButton_Dependente.Enabled:= False
          else
             SpeedButton_Dependente.Enabled:= True;
       Busca_Apto;
    end;
end;

//------------------------------------------------------------------------------
// Atualiza os dados da reserva
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.Mostra_Reserva;
begin
   MaskEdit_Identidade.Text:= IBTable_CadReserva.FieldByName('IDENTIDADE').AsString;
   MaskEdit_Nome.Text:= IBTable_CadReserva.FieldByName('NOME').AsString;
   MaskEdit_Nome_de_Guerra.Text:= IBTable_CadReserva.FieldByName('NOME_GUERRA').AsString;
   ComboBox_Posto_Graduacao.Text:= IBTable_CadReserva.FieldByName('POSTO').AsString;
   ComboBox_Dependente_de.Text:= IBTable_CadReserva.FieldByName('DEPENDENTE_DE').AsString;
   MaskEdit_Telefone_Funcional.Text:= IBTable_CadReserva.FieldByName('TELEFONE_FUNCIONAL').AsString;
   ComboBox_Situacao_Curso.Text:= IBTable_CadReserva.FieldByName('SITUACAO_CURSO').AsString;
   MaskEdit_Dependente.Text:= IBTable_CadReserva.FieldByName('DEPENDENTE').AsString;
   ComboBox_OM_Origem.Text:= IBTable_CadReserva.FieldByName('OM_ORIGEM').AsString;
   MaskEdit_Hora_Entrada.Text:= IBTable_CadReserva.FieldByName('HORAENTRADA').AsString;
   Edit_Predio.Text:= IBTable_CadReserva.FieldByName('PREDIO').AsString;
   Edit_Apto.Text:= IBTable_CadReserva.FieldByName('APTO').AsString;
   ComboBox_Recebimento.Text:= IBTable_CadReserva.FieldByName('Recebe').AsString;

   if Trim(IBTable_CadReserva.FieldByName('DATAENTRADA').AsString) = '' then
      DateTimePicker_Saida.Date:=  Date
   else
      DateTimePicker_Entrada.Date:= StrToDate(IBTable_CadReserva.FieldByName('DATAENTRADA').AsString);

   if Trim(IBTable_Reserva.FieldByName('DATASAIDA').AsString) = '' then
      DateTimePicker_Saida.Date:=  Date
   else
      DateTimePicker_Saida.Date:= StrToDate(IBTable_CadReserva.FieldByName('DATASAIDA').AsString);

   MaskEdit_Ficha.Clear;
   MaskEdit_Nacionalidade.Text:= 'BRA';
   MaskEdit_Telefone_Residencial.Clear;
   ComboBox_OM_Destino.Text:= '';
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
   SelecionarDependente;
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
      IBQuery_Busca_Hospede.Close;
      IBQuery_Busca_Hospede.SQL.Clear;
      IBQuery_Busca_Hospede.SQL.Add(VS_Comando);
      IBQuery_Busca_Hospede.Open;

      if IBQuery_Busca_Hospede.FieldByName('Situacao').AsString = 'I' then
      begin
         MessageDlg('O hóspede '+IBQuery_Busca_Hospede.FieldByName('nome').AsString+' não pode ser hospedado,'+#13+
                    'por ter  '+IBQuery_Busca_Hospede.FieldByName('obs').AsString+#13+#13+
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
         if IBQuery_Busca_Hospede.RecordCount = 1 then
         begin
            //--- Tratamento dos campos quando o hospede existir

            MaskEdit_Identidade.Text:= IBQuery_Busca_Hospede.FieldByName('IDENTIDADE').AsString;
            MaskEdit_Nome.Text:= IBQuery_Busca_Hospede.FieldByName('NOME').AsString;
            MaskEdit_Nome_de_Guerra.Text:= IBQuery_Busca_Hospede.FieldByName('NOME_GUERRA').AsString;
            ComboBox_Posto_Graduacao.Text:= IBQuery_Busca_Hospede.FieldByName('POSTO').AsString;
            ComboBox_Dependente_de.Text:= IBQuery_Busca_Hospede.FieldByName('Dependente_De').AsString;
            MaskEdit_Nacionalidade.Text:= IBQuery_Busca_Hospede.FieldByName('NACIONALIDADE').AsString;
            MaskEdit_Telefone_Residencial.Text:= IBQuery_Busca_Hospede.FieldByName('TELEFONE_RESIDENCIAL').AsString;
            MaskEdit_Telefone_Funcional.Text:= IBQuery_Busca_Hospede.FieldByName('TELEFONE_FUNCIONAL').AsString;
            ComboBox_Situacao_Curso.Text:= '';
            ComboBox_OM_Origem.Text:= IBQuery_Busca_Hospede.FieldByName('OM_ORIGEM').AsString;
            ComboBox_OM_Destino.Text:= IBQuery_Busca_Hospede.FieldByName('RESIDENCIA').AsString;
            VB_Achou:= True;
         end;

         SpeedButton_Predio.Enabled:= True;
         SpeedButton_Identidade.Enabled:= False;
         MaskEdit_Identidade.Enabled:= False;
         TrataCampos(False);
         Monta_Posto_Predio;

         statusbar.Panels[1].text:= 'Forneça os Dados do Hóspede';
         MaskEdit_Identidade.Enabled:= False;

         if Funcoes.GetPrivilegio = 'C' then
         begin
            MaskEdit_Ficha.Enabled:= True;
            MaskEdit_Nome.SetFocus;
         end
         else
         begin
            MaskEdit_Ficha.Enabled:= True;
            MaskEdit_Ficha.SetFocus;
         end;
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

   if VS_Opcao <> 'Inserir' then
       MaskEdit_Ficha.Clear;

   MaskEdit_Nome.Clear;
   MaskEdit_Nome_de_Guerra.Clear;
   ComboBox_Posto_Graduacao.Clear;
   ComboBox_Dependente_de.Clear;
   MaskEdit_Nacionalidade.Text:= 'BRA';
   MaskEdit_Telefone_Residencial.Clear;
   MaskEdit_Telefone_Funcional.Clear;
   ComboBox_OM_Origem.Text:= '';
   ComboBox_OM_Destino.Text:= '';
   ComboBox_Situacao_Curso.Text:= '';
   MaskEdit_Dependente.Text:= '0';

   Edit_Predio.Text:= '';
   Edit_Apto.Text:= '';
   MaskEdit_Hora_Entrada.Clear;
   ComboBox_Recebimento.Text:= 'H';
   DateTimePicker_Entrada.Date:= Date;
   DateTimePicker_Saida.Date:= Date;
   RadioGroup_Desconto.ItemIndex:= 0;
end;

//------------------------------------------------------------------------------
// Tratamento de Erro no arquivo de hospedagem
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.IBTable_CadHospedagemPostError(
  DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
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

procedure TForm_Cad_Hospede.IBTable_HistoricoPostError(DataSet: TDataSet;
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

procedure TForm_Cad_Hospede.IBTable_CadHospedePostError(DataSet: TDataSet;
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
   if ((RadioGroup_Desconto.ItemIndex = 1) and (VS_Opcao = 'Inserir')) then
   begin
      VS_Comando:= 'Select * from Tabela_Decea where Localidade = '+#39+trim(ComboBox_OM_Origem.Text)+#39;
      if Funcoes.Procura(VS_Comando) = True then
         RadioGroup_Desconto.ItemIndex:= 0;
   end;
end;

//------------------------------------------------------------------------------
// Monta o comboBoc de tratamento de Posto Graduacao, Dependente de e Apto
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.Monta_Posto_Predio;
var
   VS_Comando: String;
begin
    VS_Comando:= 'Select * from Apartamento where predio = '+#39+Edit_Predio.Text+#39;
    Busca_Predio(VS_Comando);

     //---
    //--- Tratamento da selecao do posto por predio

    ComboBox_Posto_Graduacao.Items.Clear;   // Limpa os postos do combo Posto Graduacao
    ComboBox_Dependente_de.Items.Clear;   // Limpa os postos do Combo Dependente de
    IBTable_Busca_Tabela_Preco.First;
    While not IBTable_Busca_Tabela_Preco.Eof do
    begin
       IBTable_Busca_Posto.First;
       While not IBTable_Busca_Posto.Eof do
       begin
          ComboBox_Posto_Graduacao.Items.Add(IBTable_Busca_Posto.FieldByName('Posto').AsString);
          ComboBox_Dependente_de.Items.Add(IBTable_Busca_Posto.FieldByName('Posto').AsString);
          IBTable_Busca_Posto.Next;
       end;
       IBTable_Busca_Tabela_Preco.Next;
    end;
end;

//------------------------------------------------------------------------------
// Procedure com a finalidade de fechar as tabelas abertas
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.FecharTabelas;
begin
   IBQuery_Busca_Hospede.Close;

   IBTable_Hospede.Close;
   IBTable_Hospedagem.Close;
   IBTable_CadHospede.Close;
   IBTable_CadHospedagem.Close;
   IBTable_Busca_Tabela_Preco.Close;
   IBTable_Busca_Posto.Close;
   IBTable_Historico.Close;

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
   VS_Predio, VS_Apto, VS_Privilegio: String;
begin
   IBTable_Resp.Close;
   IBTable_Resp.Open;

   //---
   // Monta o Mapa

   MaskEdit_Nome_Guerra.Text:= '';
   MaskEdit_Ramal.Text:= '';
   MaskEdit_Busca_Nome_Completo.Text:= '';

    //----
   // Inicia a montagem do Mapa

    Funcoes.Log_Recepcao('R-Mapa');

     //---
    //--- Limpa a tabela de mapa

    VS_Privilegio:= Funcoes.GetPrivilegio;
    VI_Codigo:= 0;
    Funcoes.LimpaMapa;

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

    Executa_Query_Monta_Mapa(IBQuery_Monta_Mapa, VS_Comando);
    ProgressBar1.Max:= IBQuery_Monta_Mapa.RecordCount;

    VS_Predio:= '';
    VS_Apto:= '';

    While not IBQuery_Monta_Mapa.Eof do
    begin
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

          Funcoes.Grava_Mapa(VI_Codigo,
                     IBQuery_Monta_Mapa.FieldByName('virtual').AsString,
                     ' ',
                     IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString,
                     IBQuery_Monta_Mapa.FieldByName('APTO').AsString,
                     '0',
                     IBQuery_Monta_Mapa.FieldByName('RAMAL').AsString,
                     ' ',
                     ' ',
                     CABECALHO,
                     IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString+'    '+
                        IBQuery_Monta_Mapa.FieldByName('APTO').AsString+'    R. '+
                        IBQuery_Monta_Mapa.FieldByName('RAMAL').AsString+'    -    '+
                        IBQuery_Monta_Mapa.FieldByName('TV1').AsString+'  '+
                        IBQuery_Monta_Mapa.FieldByName('TV2').AsString,
                     ' ',
                     ' ',
                     ' ',
                     ' '
                    );
       end;

//       IBTable_Reserva.Last;
//       if IBTable_Reserva.RecordCount > 0 then
//       begin
          IBTable_Reserva.First;
          While not IBTable_Reserva.Eof do
          begin
             VI_Codigo:= VI_Codigo + 1;
             Funcoes.Grava_Mapa( VI_Codigo,
                         IBQuery_Monta_Mapa.FieldByName('virtual').AsString,
                         IBTable_Reserva.FieldByName('Identidade').AsString,
                         IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString,
                         IBQuery_Monta_Mapa.FieldByName('apto').AsString,
                         IBQuery_Monta_Mapa.FieldByName('cama').AsString,
                         IBQuery_Monta_Mapa.FieldByName('Ramal').AsString,
                         ' ',
                         ' ',
                         RESERVA,
                         IBQuery_Monta_Mapa.FieldByName('cama').AsString+' - '+
                            trim(IBTable_Reserva.FieldByName('Posto').AsString)+' '+
                            IBTable_Reserva.FieldByName('nome_guerra').AsString,
                         IBTable_Reserva.FieldByName('situacao_curso').AsString,
                         IBTable_Reserva.FieldByName('nome').AsString,
                         IBTable_Reserva.FieldByName('dataentrada').AsString,
                         IBTable_Reserva.FieldByName('datasaida').AsString
                       );
             IBTable_Reserva.Next;
          end;
//       end;

        //---
       //--- Tratamento quando tiver hospode

       if Trim(IBQuery_Monta_Mapa.FieldByName('APTCODIGO').AsString) = 'OCUPADO' then
       begin
          IBTable_Hospedagem.First;
          While not IBTable_Hospedagem.Eof do
          begin
             VI_Codigo:= VI_Codigo + 1;
             if IBTable_Hospede.RecordCount = 0 then
             begin
                Funcoes.Grava_Mapa(VI_Codigo,
                            IBQuery_Monta_Mapa.FieldByName('virtual').AsString,
                            IBTable_Hospede.FieldByName('Identidade').AsString,
                            IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString,
                            IBQuery_Monta_Mapa.FieldByName('apto').AsString,
                            IBQuery_Monta_Mapa.FieldByName('cama').AsString,
                            IBQuery_Monta_Mapa.FieldByName('Ramal').AsString,
                            ' ',
                            ' ',
                            OCUPADO,
                            IBQuery_Monta_Mapa.FieldByName('cama').AsString+' - '+Trim(IBQuery_Monta_Mapa.FieldByName('Nome').AsString),
                            'OCUPADO',
                            IBQuery_Monta_Mapa.FieldByName('NOME').AsString,
                            ' ',
                            ' '
                           );
             end
             else
             begin
                Funcoes.Grava_Mapa(VI_Codigo,
                            IBQuery_Monta_Mapa.FieldByName('virtual').AsString,
                            IBTable_Hospede.FieldByName('Identidade').AsString,
                            IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString,
                            IBQuery_Monta_Mapa.FieldByName('apto').AsString,
                            IBQuery_Monta_Mapa.FieldByName('cama').AsString,
                            IBQuery_Monta_Mapa.FieldByName('Ramal').AsString,
                            ' ',
                            ' ',
                            OCUPADO,
                            IBQuery_Monta_Mapa.FieldByName('Cama').AsString+' - '+
                               trim(IBTable_Hospede.FieldByName('Posto').AsString)+' '+
                               IBTable_Hospede.FieldByName('NOME_GUERRA').AsString,
                            IBTable_Hospede.FieldByName('situacao_curso').AsString,
                            IBTable_Hospede.FieldByName('nome').AsString,
                            IBTable_Hospedagem.FieldByName('DataEntrada').AsString,
                            IBTable_Hospedagem.FieldByName('DataSaida').AsString
                           );
             end;
             IBTable_Hospedagem.Next;
             if VS_Privilegio = 'C' then
                 Break;
          end;
       end
       else
       begin
           //---
          //--- DEPENDENTE DE HOSPEDE

          if Trim(IBQuery_Monta_Mapa.FieldByName('APTCODIGO').AsString) = 'DEP' then
          begin
             IBTable_Mapa_Dep.Filter:= 'Cama = '+IBQuery_Monta_Mapa.FieldByName('cama').AsString;

             VI_Codigo:= VI_Codigo + 1;
             Funcoes.Grava_Mapa(VI_Codigo,
                        IBQuery_Monta_Mapa.FieldByName('virtual').AsString,
                        ' ',
                        IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString,
                        IBQuery_Monta_Mapa.FieldByName('apto').AsString,
                        IBQuery_Monta_Mapa.FieldByName('cama').AsString,
                        IBQuery_Monta_Mapa.FieldByName('Ramal').AsString,
                        ' ',
                        ' ',
                        OCUPADO,
                        IBQuery_Monta_Mapa.FieldByName('cama').AsString+' - DEP - '+IBTable_Mapa_Dep.FieldByName('Nome').AsString,
                        'DEPENDENTE',
                        'DEP - '+IBTable_Mapa_Dep.FieldByName('Nome').AsString,
                        ' ',
                        ' '
                        );
          end
          else
          begin     //--- DESOCUPADO
             if Trim(IBQuery_Monta_Mapa.FieldByName('APTCODIGO').AsString) = 'DESOCUPADO' then
             begin
                VI_Codigo:= VI_Codigo + 1;
                Funcoes.Grava_Mapa(VI_Codigo,
                           IBQuery_Monta_Mapa.FieldByName('virtual').AsString,
                           ' ',
                           IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString,
                           IBQuery_Monta_Mapa.FieldByName('apto').AsString,
                           IBQuery_Monta_Mapa.FieldByName('cama').AsString,
                           IBQuery_Monta_Mapa.FieldByName('Ramal').AsString,
                           ' ',
                           ' ',
                           DESOCUPADO,
                           IBQuery_Monta_Mapa.FieldByName('cama').AsString+' - DESOCUPADO',
                           ' ',
                           ' ',
                           ' ',
                           ' '
                          );
             end
             else
             begin
               if IBQuery_Monta_Mapa.FieldByName('NOME').AsString = 'NÃO DESOCUPADO' then
               begin
                  VI_Codigo:= VI_Codigo + 1;
                  Funcoes.Grava_Mapa(VI_Codigo,
                             IBQuery_Monta_Mapa.FieldByName('virtual').AsString,
                             ' ',
                             IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString,
                             IBQuery_Monta_Mapa.FieldByName('apto').AsString,
                             IBQuery_Monta_Mapa.FieldByName('cama').AsString,
                             IBQuery_Monta_Mapa.FieldByName('Ramal').AsString,
                             ' ',
                             ' ',
                             NAODESOCUPADO,
                             IBQuery_Monta_Mapa.FieldByName('cama').AsString+' - '+Trim(IBTable_Hospede01.FieldByName('Posto').AsString)+' - '+Trim(IBTable_Hospede01.FieldByName('Nome_Guerra').AsString),
                             IBTable_Hospede01.FieldByName('SITUACAO_CURSO').AsString,
                             IBTable_Hospede01.FieldByName('NOME').AsString,
                             ' ',
                             ' '
                           );
               end
               else
               begin
                  if IBQuery_Monta_Mapa.FieldByName('APTCODIGO').AsString = 'NÃO OCUPAR' then
                  begin
                     VI_Codigo:= VI_Codigo + 1;
                     Funcoes.Grava_Mapa(VI_Codigo,
                                IBQuery_Monta_Mapa.FieldByName('virtual').AsString,
                                ' ',
                                IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString,
                                IBQuery_Monta_Mapa.FieldByName('apto').AsString,
                                IBQuery_Monta_Mapa.FieldByName('cama').AsString,
                                IBQuery_Monta_Mapa.FieldByName('Ramal').AsString,
                                ' ',
                                ' ',
                                NAOOCUPAR,
                                IBQuery_Monta_Mapa.FieldByName('cama').AsString+' - '+Trim(IBQuery_Monta_Mapa.FieldByName('Nome').AsString),
                                'NÃO OCUPAR',
                                IBQuery_Monta_Mapa.FieldByName('NOME').AsString,
                                ' ',
                                ' '
                                );
                  end;
               end;
             end;
          end;
       end;
       IBQuery_Monta_Mapa.Next;
    end;

    DM.IBTransaction_HotelLocal.Commit;

    Executa_Query_Mapa('', 0);
    ProgressBar1.Position:= 0;
    statusbar.Panels[1].text:= 'Selecione o '+PredioAndar;
    DBGrid_Mapa.SetFocus;
end;

//------------------------------------------------------------------------------
// Monta query de consulta para montagem do mapa
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.Executa_Query_Monta_Mapa(Query_Monta_Mapa: TIBQuery;VS_Comando: String);
begin
   IBQuery_Monta_Mapa.Close;
   IBQuery_Monta_Mapa.Sql.Clear;
   IBQuery_Monta_Mapa.Sql.Add(VS_Comando);
   IBQuery_Monta_Mapa.Open;
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
   if DM.IBQuery_Mapa.FieldByName('Tipo').AsString = '3' then     // Desocupado
   begin
      DBGrid_Mapa.Canvas.Brush.Color:= clInfoBk;
      DBGrid_Mapa.Canvas.Font.Color:= clBlack;
   end
   else
   begin
      if (DM.IBQuery_Mapa.FieldByName('Tipo').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Mapa.Canvas.Brush.Color:= clSilver;
         DBGrid_Mapa.Canvas.Font.Color:= clBlack;
      end
      else
      begin
         if (DM.IBQuery_Mapa.FieldByName('Tipo').AsString = '1') then   // Ocupado
         begin
            if (DM.IBQuery_Mapa.FieldByName('Data_Saida').AsString = '' ) then
            begin
               DBGrid_Mapa.Canvas.Brush.Color:= clTeal;
               DBGrid_Mapa.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if (StrToDate(DM.IBQuery_Mapa.FieldByName('Data_Saida').AsString) < date ) then
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
            if DM.IBQuery_Mapa.FieldByName('Tipo').AsString = '2' then   // Reserva
            begin
               DBGrid_Mapa.Canvas.Brush.Color:= clRed;
               DBGrid_Mapa.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if DM.IBQuery_Mapa.FieldByName('Tipo').AsString = '4' then  // Não Desocupado
               begin
                  DBGrid_Mapa.Canvas.Brush.Color:= clBlue;
                  DBGrid_Mapa.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if DM.IBQuery_Mapa.FieldByName('Tipo').AsString = '5' then   // NAO OCUPAR
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

   DM.IBQuery_Mapa.Close;
   DM.IBQuery_Mapa.Sql.Clear;
   DM.IBQuery_Mapa.Sql.Add(VS_Comando);
   DM.IBQuery_Mapa.Open;
end;

//------------------------------------------------------------------------------
// Atualizacao do mapa quando for trocado o predio
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.ComboBox_Busca_PredioChange(Sender: TObject);
begin
   Monta_Mapa(1);
end;

procedure TForm_Cad_Hospede.ComboBox_PredioKeyDown(Sender: TObject;var Key: Word; Shift: TShiftState);
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

procedure TForm_Cad_Hospede.IBTable_CadHospedagemAfterScroll(DataSet: TDataSet);
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

      if DM.IBQuery_Mapa.RecordCount > 0 then
      begin
         if (DM.IBQuery_Mapa.FieldByName('TIPO').AsInteger = 1) then
         begin
            if DM.IBQuery_Mapa.FieldByName('situacao_curso').AsString <> 'DEPENDENTE' then
            begin
               ToolButton_Alterar.Enabled:= True;
               ToolButton_Fechar_Conta.Enabled:= True;
               Mostra_Hospede;
            end;
         end
         else
         begin
            if (DM.IBQuery_Mapa.FieldByName('TIPO').AsInteger = 4) then
            begin
               ToolButton_Desocupar.Enabled:= True;
            end
            else
            begin
               if DM.IBQuery_Mapa.FieldByName('TIPO').AsInteger = 2 then   // Reserva
               begin
                  MaskEdit_Identidade.Text:= '';
                  ToolButton_Hospedar.Enabled:= True;
                  Mostra_Reserva;
               end
               else
               begin
                  if DM.IBQuery_Mapa.FieldByName('TIPO').AsInteger = 3 then   // Desocupado
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
   DM.IBTable_Apto_Ocupado.Open;
   DM.IBTable_Apto_Ocupado.Edit;
   DM.IBTable_Apto_Ocupado.FieldByName('AptCodigo').AsString:= 'NÃO OCUPAR';
   DM.IBTable_Apto_Ocupado.FieldByName('Nome').AsString:= 'ARRUMAR';
   DM.IBTable_Apto_Ocupado.Post;
   DM.IBTransaction_HotelLocal.CommitRetaining;
   Monta_Mapa(1);
end;

//------------------------------------------------------------------------------
// Tratamento quendo for pressionado o botao de selecao do predio
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.SpeedButton_PredioClick(Sender: TObject);
begin
   Funcoes.SetPredio(DM.IBQuery_Mapa.FieldByName('Predio').AsString);
   Funcoes.SetApto(DM.IBQuery_Mapa.FieldByName('Apto').AsString);
   Funcoes.SetCama(DM.IBQuery_Mapa.FieldByName('Cama').AsString);

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
// Procedure de tratamento da query_Busca_Predio
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.Busca_Predio(VS_Comando: String);
begin
   IBQuery_Busca_Predio.Close;
   IBQuery_Busca_Predio.SQL.Clear;
   IBQuery_Busca_Predio.SQL.ADD(VS_Comando);
   IBQuery_Busca_Predio.Open;
end;

//------------------------------------------------------------------------------
// Tratamento ao sair da selecao do apto
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.ComboBox_AptoExit(Sender: TObject);
begin
    Busca_Apto;
end;

//------------------------------------------------------------------------------
// Posicionamento no predio e no apto selecionado
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.Busca_Apto;
var
   VS_Comando: String;
begin
    VS_Comando:= 'Select * from Apartamento where predio = '+#39+Edit_Predio.Text+#39+
                 ' and apto = '+#39+Edit_Apto.Text+#39;
    Busca_Predio(VS_Comando);
end;

//------------------------------------------------------------------------------
// Mostra a Ficha do Hospede
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.SpeedButton_MostraFichaClick(Sender: TObject);
begin
   Panel_FichaHospede.Visible:= True;
   SpeedButton_MostraFicha.Visible:= False;
   SpeedButton_AmpliaMapa.Visible:= True;
end;

//------------------------------------------------------------------------------
// Amplia o Mapa de Hospede
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.SpeedButton_AmpliaMapaClick(Sender: TObject);
begin
   Panel_FichaHospede.Visible:= False;
   SpeedButton_MostraFicha.Visible:= True;
   SpeedButton_AmpliaMapa.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento da saida da entrada do Nome
//------------------------------------------------------------------------------

procedure TForm_Cad_Hospede.MaskEdit_NomeExit(Sender: TObject);
begin
   MaskEdit_Nome_de_Guerra.SetFocus;
end;
end.

