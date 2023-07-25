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

unit Sel_Apto;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, Buttons, Mask, ExtCtrls, ComCtrls,
  Grids, DBGrids, Rotinas, ToolWin, IBTable, IBCustomDataSet, IBQuery,
  DBTables;

type
  TForm_Sel_Predio = class(TForm)
    StatusBar: TStatusBar;
    Query_Exclui_Reserva: TQuery;
    Panel2: TPanel;
    Panel27: TPanel;
    GroupBox1: TGroupBox;
    Panel6: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel21: TPanel;
    Panel12: TPanel;
    Panel16: TPanel;
    Panel20: TPanel;
    Panel22: TPanel;
    DST_Mapa_Hospede: TDataSource;
    DST_Mapa_Hospedagem: TDataSource;
    DST_Mapa_Historico: TDataSource;
    DST_Mapa_Hospede_Historico: TDataSource;
    DSQ_Mapa: TDataSource;
    DSQ_NaoDesocupar: TDataSource;
    DST_Table_Tabela_Posto: TDataSource;
    Query_Tabela_Posto: TQuery;
    Query1: TQuery;
    DST_Reserva: TDataSource;
    Panel1: TPanel;
    DBGrid_Mapa: TDBGrid;
    IBQuery_Delete_Mapa: TIBQuery;
    IBQuery_Mapa: TIBQuery;
    IBTable_Hotel: TIBTable;
    IBQuery_Verifica_Mapa: TIBQuery;
    IBQuery_Mapa_Cabecalho: TIBQuery;
    IBQuery_Monta_Mapa: TIBQuery;
    IBQuery_NaoDesocupar: TIBQuery;
    IBTable_Mapa_Historico: TIBTable;
    IBTable_Mapa_HistoricoIDENTIDADE: TIBStringField;
    IBTable_Mapa_HistoricoFICHA: TIBStringField;
    IBTable_Mapa_HistoricoPREDIO: TIBStringField;
    IBTable_Mapa_HistoricoAPTO: TSmallintField;
    IBTable_Mapa_HistoricoHORAENTRADA: TIBStringField;
    IBTable_Mapa_Hospedagem: TIBTable;
    IBTable_Mapa_HospedagemIDENTIDADE: TIBStringField;
    IBTable_Mapa_HospedagemFICHA: TIBStringField;
    IBTable_Mapa_HospedagemPREDIO: TIBStringField;
    IBTable_Mapa_HospedagemAPTO: TSmallintField;
    IBTable_Mapa_HospedagemCAMA: TSmallintField;
    IBTable_Mapa_HospedagemDATAENTRADA: TIBStringField;
    IBTable_Mapa_HospedagemHORAENTRADA: TIBStringField;
    IBTable_Mapa_HospedagemDATASAIDA: TIBStringField;
    IBTable_Mapa_HospedagemSITUACAO_HOSPEDAGEM: TIBStringField;
    IBTable_Mapa_Hospede_Historico: TIBTable;
    IBTable_Mapa_Hospede_HistoricoIDENTIDADE: TIBStringField;
    IBTable_Mapa_Hospede_HistoricoNOME: TIBStringField;
    IBTable_Mapa_Hospede_HistoricoNOME_GUERRA: TIBStringField;
    IBTable_Mapa_Hospede_HistoricoPOSTO: TIBStringField;
    IBTable_Mapa_Hospede_HistoricoSITUACAO_CURSO: TIBStringField;
    IBTable_Mapa_Hospede_HistoricoOM_ORIGEM: TIBStringField;
    IBTable_Mapa_Hospede: TIBTable;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    IBTable_Reserva: TIBTable;
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
    IBTable_Apto_Ocupado: TIBTable;
    SpeedButton_Atualiza_Mapa: TSpeedButton;
    ProgressBar1: TProgressBar;
    GroupBox2: TGroupBox;
    MaskEdit_Apto: TMaskEdit;
    GroupBox3: TGroupBox;
    ComboBox_Predio: TComboBox;
    Panel23: TPanel;
    DBText_Nome: TDBText;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Panel3: TPanel;
    Panel4: TPanel;
    ToolBar3: TToolBar;
    ToolButton_Retornar: TToolButton;
    ToolButton_Cancelar: TToolButton;
    IBTable_Mapa_HistoricoDATAENTRADA: TDateTimeField;
    IBTable_Mapa_HistoricoDATASAIDA: TDateTimeField;
    procedure FormCreate(Sender: TObject);

    procedure Monta_Mapa;

    procedure DBGrid_MapaDrawColumnCell(Sender: TObject;
     const Rect: TRect; DataCol: Integer; Column: TColumn;
     State: TGridDrawState);

    procedure ComboBox_PredioChange(Sender: TObject);
    procedure Grava_Mapa( VI_Codigo: Integer; VS_Predio: String; VS_Apto: String; VS_Cama: String;
                        VS_Ramal: String; VS_TV1: String; VS_TV2: String;
                        VS_CABECALHO: String; VS_Situacao: String;
                        VS_Situacao_Curso: String; VS_Nome: String;
                        VS_DataEntrada: String; VS_DataSaida: String);
    procedure Executa_Query_Monta_Mapa(Query_Monta_Mapa: TIBQuery;VS_Comando: String);
    procedure Executa_Query_Mapa;
    procedure ComboBox_Busca_PredioChange(Sender: TObject);
    procedure SpeedButton_Atualiza_MapaClick(Sender: TObject);
    procedure MaskEdit_AptoChange(Sender: TObject);
    procedure DBGrid_MapaDblClick(Sender: TObject);
    procedure IBQuery_MapaAfterScroll(DataSet: TDataSet);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_CancelarClick(Sender: TObject);

  private
    { private declarations }
  public    { public declarations }
     VB_DuploClick: Boolean;
     VI_Codigo_Mapa: integer;
  end;

var
  Form_Sel_Predio: TForm_Sel_Predio;

implementation

uses Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_Sel_Predio.FormCreate(Sender: TObject);
begin
   IBTable_Mapa_Historico.Open;
   IBTable_Mapa_Hospedagem.Open;
   IBTable_Mapa_Hospede_Historico.Open;
   IBTable_Mapa_Hospede.Open;
   IBTable_Reserva.Open;

   IBQuery_Mapa.Open;
   IBTable_Hotel.Open;
   ComboBox_Predio.Text:= 'TODOS';
   Monta_Mapa;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior selecionando o apto
//------------------------------------------------------------------------------

procedure TForm_Sel_Predio.ToolButton_RetornarClick(Sender: TObject);
begin
   Funcoes.SetPredio(IBQuery_Mapa.FieldByName('Predio').AsString);
   Funcoes.SetApto(IBQuery_Mapa.FieldByName('Apto').AsString);
   Funcoes.SetCama(IBQuery_Mapa.FieldByName('Cama').AsString);
   close;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior selecionando o apto
//------------------------------------------------------------------------------

procedure TForm_Sel_Predio.ToolButton_CancelarClick(Sender: TObject);
begin
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

procedure TForm_Sel_Predio.Monta_Mapa;
var
   VS_Comando: String;
   VI_Codigo: Integer;
begin
   //---
   // Monta o Mapa

   IBTable_Hotel.Open;
   VI_Codigo_Mapa:= 0;

    //----
   // Inicia a montagem do Mapa

    Funcoes.Log_Recepcao('R-Mapa');

     //---
    //--- Limpa a tabela de mapa

    IBQuery_Delete_Mapa.ExecSQL;
    DM.IBTransaction_Hotel.CommitRetaining;
    ProgressBar1.Max:= 400;
    VI_Codigo:= 0;

     //---
    //--- Monta o cabecalho

    if ComboBox_Predio.Text = 'TODOS' then
       VS_Comando:= 'select distinct ap.predio, ap.apto, ap.ramal, ap.tv1, ap.tv2 from apartamento ap, aptocama ac '+
                    ' where ap.predio = ac.predio and ap.apto = ac.apto and ac.aptcodigo <> '+#39+'NÃO OCUPAR'+#39
    else       // selecao por apto
    begin
       VS_Comando:= 'select distinct ap.predio, ap.apto, ap.ramal, ap.tv1, ap.tv2 from apartamento ap, aptocama ac '+
                    ' where ap.predio = ac.predio and ap.apto = ac.apto and ac.aptcodigo <> '+#39+'NÃO OCUPAR'+#39+
                    ' and ap.predio = '+#39+ComboBox_Predio.Text+#39;
    end;

    Executa_Query_Monta_Mapa(IBQuery_Mapa_Cabecalho, VS_Comando);
    While not IBQuery_Mapa_Cabecalho.Eof do
    begin
       ProgressBar1.StepBy(1);
       Update;

       VI_Codigo:= VI_Codigo + 1;
       Grava_Mapa(VI_Codigo,
                  IBQuery_Mapa_Cabecalho.FieldByName('PREDIO').AsString,
                  IBQuery_Mapa_Cabecalho.FieldByName('APTO').AsString,
                  '0',
                  IBQuery_Mapa_Cabecalho.FieldByName('RAMAL').AsString,
                  ' ',
                  ' ',
                  CABECALHO,
                  IBQuery_Mapa_Cabecalho.FieldByName('PREDIO').AsString+'    '+
                     IBQuery_Mapa_Cabecalho.FieldByName('APTO').AsString+'    R. '+
                     IBQuery_Mapa_Cabecalho.FieldByName('RAMAL').AsString+'    -    '+
                     IBQuery_Mapa_Cabecalho.FieldByName('TV1').AsString+'  '+
                     IBQuery_Mapa_Cabecalho.FieldByName('TV2').AsString,
                  ' ',
                  ' ',
                  ' ',
                  ' '
                 );

       IBQuery_Mapa_Cabecalho.Next;
    end;

     //---
   //--- Monta a Reserva

    if ComboBox_Predio.Text = 'TODOS' then
    begin
       VS_Comando:= 'select distinct re.predio, re.apto, re.cama, pr.ramal, re.posto, re.nome_guerra, re.nome, re.situacao_curso, re.dataentrada, re.datasaida , '+#39+'RESERVA'+#39+' '+
                    'from reserva re, aptocama ac, apartamento pr '+
                    'where (re.predio = ac.predio and re.apto = ac.apto) '+
                    'and   (re.predio = pr.predio and re.apto = pr.apto) '+
                    'order by predio, apto, cama'
    end
    else       // selecao por apto
    begin
       VS_Comando:= 'select distinct re.predio, re.apto, re.cama, pr.ramal, re.posto, re.nome_guerra, re.nome, re.situacao_curso, re.dataentrada, re.datasaida , '+#39+'RESERVA'+#39+' '+
                    'from reserva re, aptocama ac, apartamento pr '+
                    'where ac.predio = '+#39+ComboBox_Predio.Text+#39+' '+
                    'and re.predio = ac.predio and re.apto = ac.apto '+
                    'and (re.predio = pr.predio and re.apto = pr.apto) '+
                    'order by predio, apto, cama';
    end;

    Executa_Query_Monta_Mapa(IBQuery_Monta_Mapa, VS_Comando);

    While not IBQuery_Monta_Mapa.Eof do
    begin

       ProgressBar1.StepBy(1);
       Update;

       //--- RESERVA

       if Trim(IBQuery_Monta_Mapa.fields[10].AsString ) = 'RESERVA' then
       begin
           VI_Codigo:= VI_Codigo + 1;
           Grava_Mapa(VI_Codigo,
                      IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString,
                      IBQuery_Monta_Mapa.FieldByName('apto').AsString,
                      IBQuery_Monta_Mapa.FieldByName('cama').AsString,
                      IBQuery_Monta_Mapa.FieldByName('Ramal').AsString,
                      ' ',
                      ' ',
                      RESERVA,
                      IBQuery_Monta_Mapa.FieldByName('cama').AsString+' - '+
                         trim(IBQuery_Monta_Mapa.FieldByName('Posto').AsString)+' '+
                         IBQuery_Monta_Mapa.FieldByName('nome_guerra').AsString,
                      IBQuery_Monta_Mapa.FieldByName('situacao_curso').AsString,
                      IBQuery_Monta_Mapa.FieldByName('nome').AsString,
                      IBQuery_Monta_Mapa.FieldByName('dataentrada').AsString,
                      IBQuery_Monta_Mapa.FieldByName('datasaida').AsString
                    );
       end;
       IBQuery_Monta_Mapa.Next;
    end;

     //---
    //--- Monta o hospede

    if ComboBox_Predio.Text = 'TODOS' then
    begin
       VS_Comando:=
       'select distinct ho.predio, ho.apto, ho.cama, pr.ramal, hp.posto, hp.nome_guerra, hp.nome, hp.situacao_curso, ho.dataentrada, ho.datasaida, ac.aptcodigo '+
       'from hospedagem ho, hospede hp , aptocama ac, apartamento pr '+
       'where (ho.identidade = hp.identidade) '+
       'and ( ho.predio = ac.predio and ho.apto = ac.apto and ho.cama = ac.cama) '+
       'and (ac.predio = pr.predio and ac.apto = pr.apto) '+
       'union '+
             'select ac.predio, ac.apto, ac.cama, pr.ramal,'+#39+' '+#39+', '+#39+' '+#39+','+#39+' '+#39+', '+#39+' '+#39+', '+#39+' '+#39+', '+#39+' '+#39+', ac.aptcodigo '+
             'from aptocama ac , apartamento pr '+
             'where ac.aptcodigo = '+#39+'DESOCUPADO'+#39+' '+
             'and (ac.predio = pr.predio and ac.apto = pr.apto) '+
             'union '+
                 'select ac.predio, ac.apto, ac.cama, pr.ramal,'+#39+' '+#39+',  '+#39+' '+#39+', ac.nome,  '+#39+' '+#39+',  '+#39+' '+#39+',  '+#39+' '+#39+', ac.aptcodigo '+
                 'from aptocama ac , apartamento pr '+
                 'where ac.aptcodigo = '+#39+'NÃO OCUPAR'+#39+' '+
                 'and (ac.predio = pr.predio and ac.apto = pr.apto) '+
                 'union '+
                    'select ac.predio, ac.apto, ac.cama, pr.ramal,'+#39+' '+#39+', '+#39+' '+#39+', ac.nome, '+#39+' '+#39+', '+#39+' '+#39+', '+#39+' '+#39+', ac.aptcodigo '+
                    'from aptocama ac, apartamento pr '+
                    'where (ac.aptcodigo = '+#39+'DEP'+#39+') '+
                    'and (ac.predio = pr.predio and ac.apto = pr.apto) '+
                    'order by predio, apto, cama'
    end
    else       // selecao por apto
    begin
       VS_Comando:=
       'select distinct ho.predio, ho.apto, ho.cama, pr.ramal, hp.posto, hp.nome_guerra, hp.nome, hp.situacao_curso, ho.dataentrada, ho.datasaida, ac.aptcodigo '+
       'from hospedagem ho, hospede hp , aptocama ac, apartamento pr '+
       'where (ac.predio = '+#39+ComboBox_Predio.Text+#39+') '+
       'and (ho.identidade = hp.identidade) '+
       'and ( ho.predio = ac.predio and ho.apto = ac.apto and ho.cama = ac.cama) '+
       'and (ac.predio = pr.predio and ac.apto = pr.apto) '+
       'union '+
             'select ac.predio, ac.apto, ac.cama, pr.ramal, '+#39+' '+#39+', '+#39+' '+#39+','+#39+' '+#39+', '+#39+' '+#39+', '+#39+' '+#39+', '+#39+' '+#39+', ac.aptcodigo '+
             'from aptocama ac, apartamento pr '+
             'where ac.predio = '+#39+ComboBox_Predio.Text+#39+' and ac.aptcodigo = '+#39+'DESOCUPADO'+#39+' '+
             'and (ac.predio = pr.predio and ac.apto = pr.apto) '+
             'union '+
                 'select ac.predio, ac.apto, ac.cama, pr.ramal, '+#39+' '+#39+',  '+#39+' '+#39+', ac.nome,  '+#39+' '+#39+',  '+#39+' '+#39+',  '+#39+' '+#39+', ac.aptcodigo '+
                 'from aptocama ac, apartamento pr '+
                 'where (ac.predio = '+#39+ComboBox_Predio.Text+#39+') '+
                 'and ac.aptcodigo = '+#39+'NÃO OCUPAR'+#39+' '+
                 'and (ac.predio = pr.predio and ac.apto = pr.apto) '+
                 'union '+
                    'select ac.predio, ac.apto, ac.cama, pr.ramal, '+#39+' '+#39+', '+#39+' '+#39+', ac.nome, '+#39+' '+#39+', '+#39+' '+#39+', '+#39+' '+#39+', ac.aptcodigo '+
                    'from aptocama ac, apartamento pr '+
                    'where ac.predio = '+#39+ComboBox_Predio.Text+#39+' and ac.aptcodigo = '+#39+'DEP'+#39+' '+
                    'and (ac.predio = pr.predio and ac.apto = pr.apto) '+
                    'order by predio, apto, cama';
    end;

    Executa_Query_Monta_Mapa(IBQuery_Monta_Mapa, VS_Comando);

    While not IBQuery_Monta_Mapa.Eof do
    begin

       ProgressBar1.StepBy(1);
       Update;

       if Trim(IBQuery_Monta_Mapa.FieldByName('APTCODIGO').AsString) = 'OCUPADO' then
       begin
          VI_Codigo:= VI_Codigo + 1;
          Grava_Mapa(VI_Codigo,
                     IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString,
                     IBQuery_Monta_Mapa.FieldByName('apto').AsString,
                     IBQuery_Monta_Mapa.FieldByName('cama').AsString,
                     IBQuery_Monta_Mapa.FieldByName('Ramal').AsString,
                     ' ',
                     ' ',
                     OCUPADO,
                     IBQuery_Monta_Mapa.FieldByName('Cama').AsString+' - '+
                        trim(IBQuery_Monta_Mapa.FieldByName('Posto').AsString)+' '+
                        IBQuery_Monta_Mapa.FieldByName('NOME_GUERRA').AsString,
                     IBQuery_Monta_Mapa.FieldByName('situacao_curso').AsString,
                     IBQuery_Monta_Mapa.FieldByName('nome').AsString,
                     IBQuery_Monta_Mapa.FieldByName('DataEntrada').AsString,
                     IBQuery_Monta_Mapa.FieldByName('DataSaida').AsString
                    );
       end
       else
       begin    //--- DEPENDENTE DE HOSPEDE
          if Trim(IBQuery_Monta_Mapa.FieldByName('APTCODIGO').AsString) = 'DEP' then
          begin
             VI_Codigo:= VI_Codigo + 1;
             Grava_Mapa(VI_Codigo,
                        IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString,
                        IBQuery_Monta_Mapa.FieldByName('apto').AsString,
                        IBQuery_Monta_Mapa.FieldByName('cama').AsString,
                        IBQuery_Monta_Mapa.FieldByName('Ramal').AsString,
                        ' ',
                        ' ',
                        OCUPADO,
                        IBQuery_Monta_Mapa.FieldByName('cama').AsString+' - DEPENDENTE',
                        ' ',
                        ' ',
                        ' ',
                        ' '
                       );
          end
          else
          begin     //--- DESOCUPADO
             if Trim(IBQuery_Monta_Mapa.FieldByName('APTCODIGO').AsString) = 'DESOCUPADO' then
             begin
                IBQuery_Verifica_Mapa.Close;
                IBQuery_Verifica_Mapa.SQL.Clear;
                IBQuery_Verifica_Mapa.SQL.Add('Select distinct predio, apto, cama from Sel_Predio '+
                                            'where predio = '+#39+IBQuery_Monta_Mapa.FieldByName('PREDIO').AsString+#39+' '+
                                            'and apto = '+#39+IBQuery_Monta_Mapa.FieldByName('Apto').AsString+#39+' '+
                                            'and cama = '+#39+IBQuery_Monta_Mapa.FieldByName('Cama').AsString+#39);
                IBQuery_Verifica_Mapa.Open;

                if IBQuery_Verifica_Mapa.RecordCount = 0 then
                begin
                   VI_Codigo:= VI_Codigo + 1;
                   Grava_Mapa(VI_Codigo,
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
                end;
             end;
          end;
       end;
       IBQuery_Monta_Mapa.Next;
    end;

     //---
    //--- NÃO DESOCUPAR e OUTROS CASOS

    if ComboBox_Predio.Text = 'TODOS' then
    begin
       VS_Comando:= 'select distinct ac.predio, ac.apto, ac.cama, pr.ramal, ac.nome, ac.aptCodigo '+
                    'from aptocama ac, apartamento pr '+
                    'Where ac.aptcodigo <> '+#39+'OCUPADO'+#39+' and ac.aptcodigo<> '+#39+'DESOCUPADO'+#39+' and ac.aptcodigo<> '+#39+'NÃO OCUPAR'+#39+' and ac.aptcodigo<>'+#39+'DEP'+#39+
                    'and (ac.predio = pr.predio and ac.apto = pr.apto) ';
    end
    else       // selecao por apto
    begin
       VS_Comando:= 'select distinct ac.predio, ac.apto, ac.cama, pr.ramal, ac.nome, ac.aptCodigo '+
                    'from aptocama ac, apartamento pr '+
                    'where (ac.predio = '+#39+ComboBox_Predio.Text+#39+') '+
                    'and (ac.aptcodigo<> '+#39+'OCUPADO'+#39+' and ac.aptcodigo<> '+#39+'DESOCUPADO'+#39+' and ac.aptcodigo<> '+#39+'NÃO OCUPAR'+#39+' and ac.aptcodigo<>'+#39+'DEP'+#39+') '+
                    'and (ac.predio = pr.predio and ac.apto = pr.apto) ';
    end;

    Executa_Query_Monta_Mapa(IBQuery_NaoDesocupar, VS_Comando);

    While not IBQuery_NaoDesocupar.Eof do
    begin
       ProgressBar1.StepBy(1);
       Update;

       if IBQuery_NaoDesocupar.FieldByName('nome').AsString = 'NÃO DESOCUPADO' then
       begin
          VI_Codigo:= VI_Codigo + 1;
          Grava_Mapa( VI_Codigo,
                      IBQuery_NaoDesocupar.FieldByName('PREDIO').AsString,
                      IBQuery_NaoDesocupar.FieldByName('apto').AsString,
                      IBQuery_NaoDesocupar.FieldByName('cama').AsString,
                      IBQuery_Monta_Mapa.FieldByName('Ramal').AsString,
                      ' ',
                      ' ',
                      NAODESOCUPADO,
                      IBQuery_NaoDesocupar.FieldByName('cama').AsString+' - '+Trim(IBTable_Mapa_Hospede_Historico.FieldByName('Posto').AsString)+' - '+Trim(IBTable_Mapa_Hospede_Historico.FieldByName('Nome_Guerra').AsString),
                      IBTable_Mapa_Hospede_Historico.FieldByName('SITUACAO_CURSO').AsString,
                      IBTable_Mapa_Hospede_Historico.FieldByName('NOME').AsString,
                      IBTable_Mapa_Historico.FieldByName('DataEntrada').AsString,
                      IBTable_Mapa_Historico.FieldByName('DataSaida').AsString
                    );
       end
       else
       begin
          VI_Codigo:= VI_Codigo + 1;
          Grava_Mapa( VI_Codigo,
                      IBQuery_NaoDesocupar.FieldByName('PREDIO').AsString,
                      IBQuery_NaoDesocupar.FieldByName('apto').AsString,
                      IBQuery_NaoDesocupar.FieldByName('cama').AsString,
                      IBQuery_Monta_Mapa.FieldByName('Ramal').AsString,
                      ' ',
                      ' ',
                      OCUPADO,
                      IBQuery_NaoDesocupar.FieldByName('cama').AsString+' - '+Trim(IBTable_Mapa_Hospede.FieldByName('Posto').AsString)+' - '+Trim(IBTable_Mapa_Hospede.FieldByName('Nome_Guerra').AsString),
                      IBTable_Mapa_Hospede.FieldByName('SITUACAO_CURSO').AsString,
                      IBTable_Mapa_Hospede.FieldByName('NOME').AsString,
                      IBTable_Mapa_Hospedagem.FieldByName('DataEntrada').AsString,
                      IBTable_Mapa_Hospedagem.FieldByName('DataSaida').AsString
                    );
       end;

       IBQuery_NaoDesocupar.Next;
    end;
    DM.IBTransaction_HotelLocal.Commit;

   Executa_Query_Mapa;
   ProgressBar1.Position:= 0;
end;

//------------------------------------------------------------------------------
// Monta query de consulta para ontagem do mapa
//------------------------------------------------------------------------------

procedure TForm_Sel_Predio.Executa_Query_Monta_Mapa(Query_Monta_Mapa: TIBQuery;VS_Comando: String);
begin
   Query_Monta_Mapa.Close;
   Query_Monta_Mapa.Sql.Clear;
   Query_Monta_Mapa.Sql.Add(VS_Comando);
   Query_Monta_Mapa.Open;
end;

//------------------------------------------------------------------------------
// Grava os dados do Mapa
//------------------------------------------------------------------------------

procedure TForm_Sel_Predio.Grava_Mapa(VI_Codigo: Integer; VS_Predio: String; VS_Apto: String; VS_Cama: String;
                                      VS_Ramal: String; VS_TV1: String; VS_TV2: String;
                                      VS_CABECALHO: String; VS_Situacao: String;
                                      VS_Situacao_Curso: String; VS_Nome: String;
                                      VS_DataEntrada: String; VS_DataSaida: String);
begin
   IBTable_Hotel.Append;
   IBTable_Hotel.FieldByName('Codigo').AsInteger:= VI_Codigo;
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
   IBTable_Hotel.FieldByName('data_entrada').AsString:= VS_DataEntrada;
   IBTable_Hotel.FieldByName('data_saida').AsString:= VS_DataSaida;
   IBTable_Hotel.Post;
   DM.IBTransaction_Hotel.CommitRetaining;
end;

//------------------------------------------------------------------------------
// Atualizacao do mapa quando for trocado o predio
//------------------------------------------------------------------------------

procedure TForm_Sel_Predio.ComboBox_PredioChange(Sender: TObject);
begin
   Monta_Mapa;
end;

//------------------------------------------------------------------------------
// Procedure de tratamento de cor para cada situacao
//------------------------------------------------------------------------------

procedure TForm_Sel_Predio.DBGrid_MapaDrawColumnCell(Sender: TObject;
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
            DBGrid_Mapa.Canvas.Brush.Color:= clTeal;
            DBGrid_Mapa.Canvas.Font.Color:= clWhite;
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
                      DBGrid_Mapa.Canvas.Brush.Color:= clAqua;
                      DBGrid_Mapa.Canvas.Font.Color:= clBlack;
                  end;
               end;
            end;
         end;
      end;
   end;
   DBGrid_Mapa.Canvas.FillRect(Rect);
   DBGrid_Mapa.Canvas.TextOut(Rect.Left+2,Rect.Top,Column.Field.AsString);
end;

//------------------------------------------------------------------------------
// Tratamento Quando for pressionado a tecla <ENTER> no edit do senha
//------------------------------------------------------------------------------

procedure TForm_Sel_Predio.Executa_Query_Mapa;
var
   VS_Comando: String;
begin
   if ComboBox_Predio.Text = 'TODOS' then
   begin
      VS_Comando:= 'select codigo, predio, apto, cama, ramal, nome, tipo, situacao, situacao_curso, data_entrada, Data_Saida from Sel_Predio';
      if trim(MaskEdit_Apto.Text) <> '' then
         VS_Comando:= VS_Comando+' where apto = '+MaskEdit_Apto.Text;

      VS_Comando:= VS_Comando+' order by predio, apto, cama ';
   end
   else
   begin
      VS_Comando:= 'select codigo, predio, apto, cama, ramal, nome, tipo, situacao, situacao_curso, data_entrada, Data_Saida from Sel_Predio'+
                   ' where predio = '+#39+ComboBox_Predio.Text+#39;
      if trim(MaskEdit_Apto.Text) <> '' then
         VS_Comando:= VS_Comando+' and apto = '+MaskEdit_Apto.Text;
      VS_Comando:= VS_Comando+' order by predio, apto, cama ';
   end;
   IBQuery_Mapa.Close;
   IBQuery_Mapa.Sql.Clear;
   IBQuery_Mapa.Sql.Add(VS_Comando);
   IBQuery_Mapa.Open;
end;

//------------------------------------------------------------------------------
// Atualizacao do mapa quando for trocado o predio
//------------------------------------------------------------------------------

procedure TForm_Sel_Predio.ComboBox_Busca_PredioChange(Sender: TObject);
begin
   Monta_Mapa;
end;

//------------------------------------------------------------------------------
// Tratamento do botao Atualizacao do Mapa
//------------------------------------------------------------------------------

procedure TForm_Sel_Predio.SpeedButton_Atualiza_MapaClick(Sender: TObject);
begin
   Monta_Mapa;
end;

//------------------------------------------------------------------------------
// Procedure para tratar dos botoes de reserva e cancelamento habilitando e
// desabilitando quando necessario
//------------------------------------------------------------------------------

procedure TForm_Sel_Predio.IBQuery_MapaAfterScroll(DataSet: TDataSet);
begin
   VB_DuploClick:= False;
   ToolButton_Retornar.Enabled:= False;

   if IBQuery_Mapa.RecordCount > 0 then
      if ((IBQuery_Mapa.FieldByName('TIPO').AsInteger = 2) or (IBQuery_Mapa.FieldByName('TIPO').AsInteger = 3)) then
      begin
         VB_DuploClick:= True;
         ToolButton_Retornar.Enabled:= True;
      end;
end;

//------------------------------------------------------------------------------
// Selecao do predio por apto
//------------------------------------------------------------------------------

procedure TForm_Sel_Predio.MaskEdit_AptoChange(Sender: TObject);
begin
   Executa_Query_Mapa;
end;

procedure TForm_Sel_Predio.DBGrid_MapaDblClick(Sender: TObject);
begin
   if VB_DuploClick = True then
      ToolButton_RetornarClick(Sender);
end;

end.

