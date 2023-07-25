unit AuxilioAdministracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBTable, ExtCtrls, Grids, DBGrids, IBQuery,
  StdCtrls, DBCtrls, ComCtrls, Mask, Buttons, JvGradient, JvComponent,
  JvxClock, jpeg, ToolWin, DBTables, Rotinas, JvCaptionPanel, RichPrint,
  PsyRichEdit, TeEngine, Series, TeeProcs, Chart;

type
  TForm_AuxilioAdminstracao = class(TForm)
    IBQuery_Delete_Mapa: TIBQuery;
    StatusBar1: TStatusBar;
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
    IBQuery_Tabela_Posto: TIBQuery;
    IBQuery_Tabela_PostoPREDIO: TIBStringField;
    IBQuery_Tabela_PostoVALOR: TIBBCDField;
    IBQuery_Tabela_PostoPOSTO: TIBStringField;
    IBQuery_Tabela_PostoCODIGO: TIBStringField;
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
    Panel_ApresentaMapa: TPanel;
    Panel_Mapa: TPanel;
    Panel3: TPanel;
    ToolBar1: TToolBar;
    ToolButton_ReduzMapa: TToolButton;
    ToolButton_AmpliaMapa: TToolButton;
    DBGrid_Mapa: TDBGrid;
    DBGrid_Visao: TDBGrid;
    IBQuery_VisaoCAMA: TIBStringField;
    IBTable_VisaoCAMA: TIBStringField;
    ToolButton_MostrarReservas: TToolButton;
    ComboBox_Predio: TComboBox;
    ToolButton_AtualizaMapa: TToolButton;
    Panel_Ocupacao: TPanel;
    Chart1: TChart;
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Series4: TBarSeries;
    Series5: TBarSeries;
    JvCaptionPanel_MostrarReservas: TJvCaptionPanel;
    ToolBar5: TToolBar;
    ToolButton_EmissaoRelBoletimEscolar: TToolButton;
    ToolButton8: TToolButton;
    ToolButton1: TToolButton;
    ToolButton_FinalizaRelatorio: TToolButton;
    GroupBox_Descricao: TGroupBox;
    DBGrid_MostrarReservas: TDBGrid;
    StatusBar2: TStatusBar;
    Label2: TLabel;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    ToolButton3: TToolButton;
    DST_Responsavel: TDataSource;
    DST_Hospede: TDataSource;
    Table_Responsavel: TTable;
    Table_Hospede: TTable;
    DST_MapaDep: TDataSource;
    DST_Hospedagem: TDataSource;
    Table_Mapa_Dep: TTable;
    Table_Hospedagem: TTable;
    Table_Reserva: TTable;
    Table_Hospede01: TTable;
    DSQ_Monta_Mapa: TDataSource;
    Query_Monta_Mapa: TQuery;
    ToolButton_SituacaoHospedagem: TToolButton;
    ToolButton5: TToolButton;
    IBTable_Hotel: TIBTable;
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    Panel2: TPanel;
    Panel_TotalVagas: TPanel;
    Panel_Desocupados: TPanel;
    Panel_Hospedes: TPanel;
    Panel_Reservas: TPanel;
    Panel_Indisponivel: TPanel;

    procedure MontarCabecalho;

    procedure ResumoDoMapa;

    procedure SetarDiaTipo(PI_Dia: Integer; VS_Codigo, VS_Tipo: String);
    Procedure GravaVisao(VS_Codigo, VS_Predio, VS_Apto, VS_Cama: String);

    Function MontaVisao( VS_Codigo, VS_Tipo, VS_Situacao, VS_dataEntrada, VS_DataSaida: String): Boolean;
    procedure Monta_Mapa(Situacao: integer);
    Procedure LimpaMapa;
    procedure Executa_Query_Monta_Mapa(VS_Comando: String);

    procedure Grava_Mapa(VI_Codigo: Integer; VS_Virtual: String; VS_Identidade: String; VS_Predio: String; VS_Apto: String; VS_Cama: String;
                           VS_Ramal: String; VS_TV1: String; VS_TV2: String;
                           VS_CABECALHO: String; VS_Situacao: String;
                           VS_Situacao_Curso: String; VS_Nome: String;
                           VS_DataEntrada: String; VS_DataSaida: String);

    procedure FormActivate(Sender: TObject);
    procedure DBGrid_VisaoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid_MapaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ToolButton_ReduzMapaClick(Sender: TObject);
    procedure ToolButton_AmpliaMapaClick(Sender: TObject);
    procedure ToolButton_EmissaoRelBoletimEscolarClick(Sender: TObject);
    procedure ToolButton_FinalizaRelatorioClick(Sender: TObject);
    procedure ToolButton_MostrarReservasClick(Sender: TObject);
    procedure ToolButton_AtualizaMapaClick(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure ToolButton_SituacaoHospedagemClick(Sender: TObject);
  private    { Private declarations }
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
  Form_AuxilioAdminstracao: TForm_AuxilioAdminstracao;

implementation

uses Module, Rel_Rela_Reserva, Selecao_Reserva;

{$R *.dfm}

procedure TForm_AuxilioAdminstracao.FormActivate(Sender: TObject);
Var
   dia, mes, ano: Word;
begin
   MontarCabecalho;

   JvCaptionPanel_MostrarReservas.Visible:= False;
   JvCaptionPanel_MostrarReservas.Left:= 3;
   JvCaptionPanel_MostrarReservas.Top:= 2;
   JvCaptionPanel_MostrarReservas.Width:= 1006;
   JvCaptionPanel_MostrarReservas.Height:= 631;

   DecodeDate( Date, ano, mes, dia);
   VI_AnoSelecionado:= ano;
   VI_MesSelecionado:= mes;

   Funcoes.AlimentaComboBox(ComboBox_Predio, 0, 'Todos', 'Predio.cnf');
   ToolButton_ReduzMapaClick(Sender);

   LimpaMapa;

   IBQuery_Visao.Open;
   IBTable_Visao.Open;
   IBTable_Mostrar.Open;

   Table_Hospede.Open;
   Table_Hospedagem.Open;
   Table_Reserva.Open;
   Table_Mapa_Dep.Open;
   Table_Hospede01.Open;
   Table_Responsavel.Open;

    //---
   //--- Preenche o campo Situacao/Curso

   ComboBox_Predio.Text:= '';
end;

procedure TForm_AuxilioAdminstracao.ToolButton_AtualizaMapaClick(Sender: TObject);
begin
   Panel_TotalVagas.Caption:=   '';
   Panel_Desocupados.Caption:=  '';
   Panel_Hospedes.Caption:=     '';
   Panel_Reservas.Caption:=     '';
   Panel_Indisponivel.Caption:= '';

   Monta_Mapa(1);
   ResumoDoMapa;
end;

//------------------------------------------------------------------------------
// Limpa as tabela de montagem do Mapa
//------------------------------------------------------------------------------

Procedure TForm_AuxilioAdminstracao.LimpaMapa;
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

procedure TForm_AuxilioAdminstracao.Monta_Mapa(Situacao: integer);
var
   VS_Comando: String;
   diaTermino, I, VI_Codigo: Integer;
   VS_Inicio, VS_Termino, VS_Predio, VS_Apto, VS_Privilegio: String;
   VB_Retorno: Boolean;
begin
    //---
   // Limpa Matriz

    for i:= 1 to 31 do
    begin
       Ma_Vagas[i]:= 0;
       Ma_Hospedagem[i]:= 0;
       Ma_Reservas[i]:= 0;
       Ma_Indisponivel[i]:= 0;
    end;

    //----
   // Inicia a montagem do Mapa

//    Funcoes.Log_Recepcao('R-Mapa');

    LimpaMapa;        //--- Limpa a tabela de mapa

    // Seta as variaveis iniciais

    diaTermino:= Funcoes.DiasNoMes(VI_AnoSelecionado, VI_MesSelecionado);
    diaTermino:= diaTermino+1;

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

    While not Query_Monta_Mapa.Eof do
    begin
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

       for i:= 1 to 31 do
          SetarDiaTipo( I, '   ', DESOCUPADO );

       for i:= diaTermino to 31 do
          SetarDiaTipo( I, '   ', '9' );

       //--- RESERVA

       if Table_Reserva.RecordCount > 0 then
       begin
          Table_Reserva.First;
          While not Table_Reserva.Eof do
          begin
             VI_Codigo:= VI_Codigo + 1;
             VB_Retorno:= MontaVisao( FormatFloat('000', VI_Codigo),
                                            RESERVA,   // VS_Tipo
                                            ' ',       // VS_Situacao
                                            Table_Reserva.FieldByName('dataentrada').AsString,
                                            Table_Reserva.FieldByName('datasaida').AsString
                                           );

             if VB_Retorno = True then
             begin

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
                            FormatFloat('000', VI_Codigo)+' - '+Trim(Table_Reserva.FieldByName('Posto').AsString)+' '+
                               Table_Reserva.FieldByName('nome_guerra').AsString,
                            Table_Reserva.FieldByName('situacao_curso').AsString,
                            Table_Reserva.FieldByName('nome').AsString,
                            Table_Reserva.FieldByName('dataentrada').AsString,
                            Table_Reserva.FieldByName('datasaida').AsString
                          );
             end
             else
             begin
                VI_Codigo:= VI_Codigo - 1;
             end;
             Table_Reserva.Next;
          end;
       end;

       //--- Tratamento quando tiver hospode
       if Trim(Query_Monta_Mapa.FieldByName('APTCODIGO').AsString) = 'OCUPADO' then
       begin
          VI_Codigo:= VI_Codigo + 1;
          VB_Retorno:= MontaVisao( FormatFloat('000', VI_Codigo),
                                   OCUPADO,   // VS_Tipo
                                   ' ',       // VS_Situacao
                                   Table_Hospedagem.FieldByName('DataEntrada').AsString,
                                   Table_Hospedagem.FieldByName('DataSaida').AsString
                                  );

          if VB_Retorno = True then
          begin
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
                VS_Inicio:= Table_Hospedagem.FieldByName('DataEntrada').AsString;
                VS_Termino:= Table_Hospedagem.FieldByName('DataSaida').AsString;
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
                if Table_Responsavel.FieldByName('DataEntrada').AsString = '' then
                begin
                   VI_Codigo:= VI_Codigo + 1;

                   VB_Retorno:= MontaVisao( FormatFloat('000', VI_Codigo),
                                            OCUPADO,   // VS_Tipo
                                            ' ',       // VS_Situacao
                                            VS_Inicio,
                                            VS_Termino
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
                               VS_Inicio,
                               VS_Termino
                              );
                end
                else
                begin
                   VI_Codigo:= VI_Codigo + 1;

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
                end;
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
                     if copy(Trim(Query_Monta_Mapa.FieldByName('Nome').AsString),1,5) = 'ARRUM' then
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
                        VI_Codigo:= VI_Codigo + 1;
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
       GravaVisao(FormatFloat('000', VI_Codigo), Query_Monta_Mapa.FieldByName('PREDIO').AsString, Query_Monta_Mapa.FieldByName('apto').AsString,  Query_Monta_Mapa.FieldByName('Cama').AsString);
       Query_Monta_Mapa.Next;
    end;
    DM.IBTransaction_HotelLocal.Commit;

    ResumoDoMapa;

    IBQuery_Visao.Close;
    IBQuery_Visao.Open;
    IBQuery_Visao.First;

    IBTable_Mostrar.Open;
    DBGrid_Mapa.SetFocus;
end;

//------------------------------------------------------------------------------
// Monta query de consulta para ontagem do mapa
//------------------------------------------------------------------------------

procedure TForm_AuxilioAdminstracao.Executa_Query_Monta_Mapa(VS_Comando: String);
begin
   Query_Monta_Mapa.Close;
   Query_Monta_Mapa.Sql.Clear;
   Query_Monta_Mapa.Sql.Add(VS_Comando);
   Query_Monta_Mapa.Open;
end;

//------------------------------------------------------------------------------
// Grava os dados do Mapa
//------------------------------------------------------------------------------

procedure TForm_AuxilioAdminstracao.Grava_Mapa(VI_Codigo: Integer; VS_Virtual: String; VS_Identidade: String; VS_Predio: String; VS_Apto: String; VS_Cama: String;
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
// Grava os dados do mapa panoramico
//------------------------------------------------------------------------------

Function TForm_AuxilioAdminstracao.MontaVisao( VS_Codigo, VS_Tipo, VS_Situacao, VS_dataEntrada, VS_DataSaida: String): Boolean;
Var
   VS_Data: String;
   diaInicio, mesInicio, anoInicio: Word;
   diaTermino, mesTermino, anoTermino: Word;
   VI_Pos, I, VI_Dia: Integer;
   VB_retorno: Boolean;
begin
   VB_Retorno:= True;

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
      if ((StrToInt(VS_Tipo) = 1) or (StrToInt(VS_Tipo) = 2)) then
      begin
         VS_Data:= '01/'+FormatFloat('00',VI_MesSelecionado)+'/'+FormatFloat('00',VI_AnoSelecionado);
         if ((StrToDate(VS_dataEntrada) < StrToDate(VS_Data)) and (StrToDate(VS_dataSaida) < StrToDate(VS_Data))) then
            VB_Retorno:= False            // Desocupado
         else
         begin
            DecodeDate( StrToDate(VS_dataEntrada), anoInicio, mesInicio, diaInicio);
            DecodeDate( StrToDate(VS_dataSaida), anoTermino, mesTermino, diaTermino);

            If ((mesInicio > VI_MesSelecionado) and (AnoInicio = VI_AnoSelecionado)) then
               VB_Retorno:= False            // Desocupado
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
   MontaVisao:= VB_Retorno;
end;

//------------------------------------------------------------------------------
// Grava os dados do mapa panoramico
//------------------------------------------------------------------------------

Procedure TForm_AuxilioAdminstracao.GravaVisao(VS_Codigo, VS_Predio, VS_Apto, VS_Cama: String);
var
   diaTermino, VI_Cont: Integer;
   Ano, Mes, Dia : word;
begin
   DecodeDate (Date, Ano, Mes, Dia);
   diaTermino:= Funcoes.DiasNoMes(Ano, Mes);

   for VI_Cont:= 1 to diaTermino do
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
end;

//------------------------------------------------------------------------------
// Tratamento para setar Dia e Tipos em Branco
//------------------------------------------------------------------------------

procedure TForm_AuxilioAdminstracao.SetarDiaTipo(PI_Dia: Integer; VS_Codigo, VS_Tipo: String);
Begin
   Ma_Dia[PI_Dia]:= VS_Codigo;
   Ma_Tipo[PI_Dia]:= VS_Tipo;
end;

//------------------------------------------------------------------------------
// Tratamento da definicao de cores de acordo com tipo
//------------------------------------------------------------------------------

procedure TForm_AuxilioAdminstracao.DBGrid_VisaoDrawColumnCell(Sender: TObject;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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

procedure TForm_AuxilioAdminstracao.DBGrid_MapaDrawColumnCell(Sender: TObject;
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
               DBGrid_Visao.Canvas.Brush.Color:= $00E0E0C2;
               DBGrid_Visao.Canvas.Font.Color:= clBlack;
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
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_AuxilioAdminstracao.ToolButton3Click(Sender: TObject);
begin
   IBQuery_Visao.Close;
   IBTable_Visao.Close;
   IBTable_Mostrar.Close;

   Table_Hospede.Close;
   Table_Hospedagem.Close;
   Table_Reserva.Close;
   Table_Mapa_Dep.Close;
   Table_Hospede01.Close;
   Table_Responsavel.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Sai do Sistema e retorna para Sistema Operacional
//------------------------------------------------------------------------------

procedure TForm_AuxilioAdminstracao.ToolButton4Click(Sender: TObject);
begin
   Funcoes.Windows
end;

//------------------------------------------------------------------------------
// Tratamento da ampliacao do mapa
//------------------------------------------------------------------------------

procedure TForm_AuxilioAdminstracao.ToolButton_AmpliaMapaClick(Sender: TObject);
begin
   Panel_Ocupacao.Visible:= False;
end;

//------------------------------------------------------------------------------
// Tratamento da redução da ampliacao do mapa
//------------------------------------------------------------------------------

procedure TForm_AuxilioAdminstracao.ToolButton_ReduzMapaClick(Sender: TObject);
begin
   Panel_Ocupacao.Visible:= True;
end;

//------------------------------------------------------------------------------
// Imprime o relatorio de reservas
//------------------------------------------------------------------------------

procedure TForm_AuxilioAdminstracao.ToolButton_EmissaoRelBoletimEscolarClick(Sender: TObject);
begin
   Form_SelecaoReserva.ShowModal;
end;

//------------------------------------------------------------------------------
// Fecha a janela de Reservas
//------------------------------------------------------------------------------

procedure TForm_AuxilioAdminstracao.ToolButton_FinalizaRelatorioClick(Sender: TObject);
begin
   JvCaptionPanel_MostrarReservas.Visible:= False;
end;

procedure TForm_AuxilioAdminstracao.ToolButton_MostrarReservasClick(Sender: TObject);
begin
   JvCaptionPanel_MostrarReservas.Visible:= True;
end;

//------------------------------------------------------------------------------
// Monta o Cabecalho
//------------------------------------------------------------------------------

procedure TForm_AuxilioAdminstracao.MontarCabecalho;
var
   I: Integer;
begin
   StringGrid1.Cells[0,0]:= 'Dia...........';
   StringGrid1.Cells[0,1]:= 'Total Vagas';
   StringGrid1.Cells[0,2]:= 'Desocupados';
   StringGrid1.Cells[0,3]:= 'Hospedes';
   StringGrid1.Cells[0,4]:= 'Reservas';
   StringGrid1.Cells[0,5]:= 'Indisponível';

   for I:= 1 to 31 do
      StringGrid1.Cells[I,0]:= FormatFloat('00', I);
end;

//------------------------------------------------------------------------------
// Monta Resumo de do Mapa de Ocupacao
//------------------------------------------------------------------------------

procedure TForm_AuxilioAdminstracao.ResumoDoMapa;
var
   VI_Vagas, VI_Hospedagen, VI_Desocupados, VI_Reservas, VI_Indisponivel,

   diaTermino, VI_Cont, VI_Total_Vagas, VI_TotalIndisponivel: Integer;
begin
   VI_Vagas:= 0;
   VI_Hospedagen:= 0;
   VI_Desocupados:= 0;
   VI_Reservas:= 0;
   VI_Indisponivel:= 0;

   Series1.Clear;
   Series2.Clear;
   Series3.Clear;
   Series4.Clear;
   Series5.Clear;

   diaTermino:= Funcoes.DiasNoMes(VI_AnoSelecionado, VI_MesSelecionado);

   for VI_Cont:= 1 to diaTermino do
   begin
      VI_Total_Vagas:= Ma_Vagas[VI_Cont]+Ma_Hospedagem[VI_Cont]+Ma_Reservas[VI_Cont]+Ma_Indisponivel[VI_Cont];
      VI_TotalIndisponivel:= Ma_Hospedagem[VI_Cont]+Ma_Reservas[VI_Cont]+Ma_Indisponivel[VI_Cont];
      VI_Vagas:= VI_Vagas+VI_Total_Vagas;

      StringGrid1.Cells[VI_Cont,1]:= FormatFloat('00', VI_Total_Vagas);
      Series1.AddY(StrToCurrDef( IntToStr(VI_Total_Vagas),0), '',clLime);

      StringGrid1.Cells[VI_Cont,2]:= FormatFloat('00', VI_Total_Vagas-VI_TotalIndisponivel);
      Series2.AddY(StrToCurrDef( IntToStr(VI_Total_Vagas-VI_TotalIndisponivel), 0), 'Desocupados',clBlue);
      VI_Desocupados:= VI_Desocupados+(VI_Total_Vagas-VI_TotalIndisponivel);

      StringGrid1.Cells[VI_Cont,3]:= FormatFloat('00', Ma_Hospedagem[VI_Cont]);
      Series3.AddY(StrToCurrDef( IntToStr(Ma_Hospedagem[VI_Cont]),0), 'Hospedes',clAqua);
      VI_Hospedagen:= VI_Hospedagen+Ma_Hospedagem[VI_Cont];

      StringGrid1.Cells[VI_Cont,4]:= FormatFloat('00', Ma_Reservas[VI_Cont]);
      Series4.AddY(StrToCurrDef( IntToStr(Ma_Reservas[VI_Cont]), 0), 'Reservas',clRed);
      VI_Reservas:= VI_Reservas+Ma_Reservas[VI_Cont];

      StringGrid1.Cells[VI_Cont,5]:= FormatFloat('00', Ma_Indisponivel[VI_Cont]);
      Series5.AddY(StrToCurrDef( IntToStr(Ma_Indisponivel[VI_Cont]), 0), 'Indisponível',clYellow);
      VI_Indisponivel:= VI_Indisponivel+Ma_Indisponivel[VI_Cont];

   end;

   Panel_TotalVagas.Caption:=   IntToStr(VI_Vagas);
   Panel_Desocupados.Caption:=  IntToStr(VI_Desocupados);
   Panel_Hospedes.Caption:=     IntToStr(VI_Hospedagen);
   Panel_Reservas.Caption:=     IntToStr(VI_Hospedagen);
   Panel_Indisponivel.Caption:= IntToStr(VI_Indisponivel);

end;

//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------

procedure TForm_AuxilioAdminstracao.StringGrid1DrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
    //--- Total Vagas

    if ARow = 1 then
    begin
       if ((StringGrid1.Cells[ACol,1] <> '') and (StringGrid1.Cells[ACol,1] <> '00') and (StringGrid1.Cells[ACol,1] <> '  ') and (StringGrid1.Cells[ACol,1] <> 'Total Vagas')) then
       begin
          StringGrid1.Canvas.Font.Color := clblack;
          StringGrid1.Canvas.Brush.Color := clLime;
          StringGrid1.Canvas.TextRect(Rect, Rect.Left+2,Rect.Top+2,StringGrid1.Cells[ACol, ARow]);
       end
    end;

    //--- Desocupados

    if ARow = 2 then
    begin
       if ((StringGrid1.Cells[ACol,2] <> '') and(StringGrid1.Cells[ACol,2] <> '00') and (StringGrid1.Cells[ACol,2] <> '  ') and (StringGrid1.Cells[ACol,2] <> 'Desocupados')) then
       begin
          StringGrid1.Canvas.Font.Color := clwhite;
          StringGrid1.Canvas.Brush.Color := clBlue;
          StringGrid1.Canvas.TextRect(Rect, Rect.Left+2,Rect.Top+2,StringGrid1.Cells[ACol, ARow]);
       end
    end;

    //--- Hospede

    if ARow = 3 then
    begin
       if ((StringGrid1.Cells[ACol,3] <> '') and(StringGrid1.Cells[ACol,3] <> '00') and (StringGrid1.Cells[ACol,3] <> '  ') and (StringGrid1.Cells[ACol,3] <> 'Hospedes')) then
       begin
          StringGrid1.Canvas.Font.Color := clBlack;
          StringGrid1.Canvas.Brush.Color := clAqua;
          StringGrid1.Canvas.TextRect(Rect, Rect.Left+2,Rect.Top+2,StringGrid1.Cells[ACol, ARow]);
       end
    end;

    //--- Tratamento para reserva

    if ARow = 4 then
    begin
       if ((StringGrid1.Cells[ACol,4] <> '') and (StringGrid1.Cells[ACol,4] <> '00') and (StringGrid1.Cells[ACol,4] <> '  ') and (StringGrid1.Cells[ACol,4] <> 'Reservas')) then
       begin
          StringGrid1.Canvas.Font.Color := clwhite;
          StringGrid1.Canvas.Brush.Color := clRed;
          StringGrid1.Canvas.TextRect(Rect, Rect.Left+2,Rect.Top+2,StringGrid1.Cells[ACol, ARow]);
       end
    end;

    if ARow = 5 then
    begin
       if ((StringGrid1.Cells[ACol,5] <> '') and (StringGrid1.Cells[ACol,5] <> '00') and (StringGrid1.Cells[ACol,5] <> '  ') and (StringGrid1.Cells[ACol,5] <> 'Indisponível')) then
       begin
          StringGrid1.Canvas.Font.Color := clblack;
          StringGrid1.Canvas.Brush.Color := clYellow;
          StringGrid1.Canvas.TextRect(Rect, Rect.Left+2,Rect.Top+2,StringGrid1.Cells[ACol, ARow]);
       end
    end;
end;

procedure TForm_AuxilioAdminstracao.ToolButton_SituacaoHospedagemClick(Sender: TObject);
var
  Result: TBitmap;
begin
   if not DirectoryExists('C:\Situacao_Hospedagem') then
       CreateDir('C:Situacao_Hospedagem');

  Result := TBitmap.Create;
  try
    Result.Width := Self.Panel_Ocupacao.ClientWidth;
    Result.Height := Self.Panel_Ocupacao.ClientHeight;
    Result.Canvas.Brush := Self.Panel_Ocupacao.Brush;
    Result.Canvas.FillRect(Self.Panel_Ocupacao.ClientRect);
    Result.Canvas.Lock;
    Self.Panel_Ocupacao.PaintTo(Result.Canvas.Handle, 0, 0);
    Result.Canvas.Unlock;
    Result.SaveToFile('C:\Situacao_Hospedagem\Mapa_'+ComboBox_Predio.Text+'_'+IntToStr(VI_MesSelecionado)+'_'+IntToStr(VI_AnoSelecionado)+'.bmp');
  finally
    Result.Free;
  end;
end;

end.

