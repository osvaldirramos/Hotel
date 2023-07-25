//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Utilizacao_Sistema.PAS                         //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de mostrar consulta //
//                             dos acessos realizados pela senha HOTEL.       //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 04/11/2003                                     //
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

unit Utilizacao_Log_Hotel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ComCtrls, Grids, DBGrids, Buttons, StdCtrls, Mask, ExtCtrls,
  Rotinas, DBCtrls, ToolWin;

type
  TForm_Utilizacao_Log_Hotel = class(TForm)
    Panel2: TPanel;
    DBGrid_Mapa: TDBGrid;
    StatusBar: TStatusBar;
    Query_Verfica: TQuery;
    DSQ_Apto: TDataSource;
    Query_VerficaUSUARIO: TStringField;
    Query_VerficaNATIVIDADE: TFloatField;
    Query_VerficaATIVIDADE: TStringField;
    Query_VerficaDATA: TDateTimeField;
    Query_VerficaHORAENTRADA: TStringField;
    Panel5: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Panel6: TPanel;
    DBNavigator_Residente: TDBNavigator;
    ToolBar4: TToolBar;
    ToolButton_Relatorio: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    Label_Periodo_Inicial: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    SpeedButton_DataEntrada: TSpeedButton;
    SpeedButton_Data_Saida: TSpeedButton;
    SpeedButton_Tipo: TSpeedButton;
    DateTimePicker_Saida: TDateTimePicker;
    DateTimePicker_Entrada: TDateTimePicker;
    ComboBox_Tipo: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure Busca_Utilizacao;
    procedure SpeedButton_DataEntradaClick(Sender: TObject);
    procedure SpeedButton_Data_SaidaClick(Sender: TObject);
    procedure SpeedButton_TipoClick(Sender: TObject);
    procedure ToolButton_RelatorioClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Utilizacao_Log_Hotel: TForm_Utilizacao_Log_Hotel;

implementation

uses Rel_Utilizacao_Sistema, Rel_Log_Sistema;

{$R *.DFM}

//------------------------------------------------------------------------------
// Modulo principal
//------------------------------------------------------------------------------

procedure TForm_Utilizacao_Log_Hotel.FormActivate(Sender: TObject);
begin
   DateTimePicker_Entrada.Date:= Date;
   DateTimePicker_Saida.Date:= Date;
   Busca_Utilizacao;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_Utilizacao_Log_Hotel.ToolButton_RetornarClick(Sender: TObject);
begin
   Query_Verfica.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Utilizacao_Log_Hotel.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Mostra a utlizacao do sistema no periodo selecionado
//------------------------------------------------------------------------------

procedure TForm_Utilizacao_Log_Hotel.Busca_Utilizacao;
var
   Filtro, VS_Comando: String;

begin
   Filtro:= 'DATA >= '+Aspas+DateToStr(DateTimePicker_Entrada.Date)+Aspas+
            ' and DATA <= '+Aspas+DateToStr(DateTimePicker_Saida.Date)+Aspas;
   Query_Verfica.Filter:= Filtro;

   if Trim(ComboBox_Tipo.Text) = 'Todas' then
      VS_Comando:= 'Select * from HOTEL_LOGS order by usuario,Data, natividade'
   else
      VS_Comando:= 'Select * from HOTEL_LOGS where atividade like '+Aspas+'%'+
                    Copy(Trim(ComboBox_Tipo.Text),1,1)+'%'+Aspas+
                    ' order by usuario,Data, natividade';

   Query_Verfica.Close;
   Query_Verfica.SQL.Clear;
   Query_Verfica.SQL.ADD(VS_Comando);
   Query_Verfica.Open;
end;

//------------------------------------------------------------------------------
// chamada para relatorio
//------------------------------------------------------------------------------

procedure TForm_Utilizacao_Log_Hotel.ToolButton_RelatorioClick(Sender: TObject);
begin
   QRMDForm_Log_Sistema.Preview;
end;

//------------------------------------------------------------------------------
// Selecao dos logs por data de entrada
//------------------------------------------------------------------------------

procedure TForm_Utilizacao_Log_Hotel.SpeedButton_DataEntradaClick(Sender: TObject);
begin
   Busca_Utilizacao;
end;

//------------------------------------------------------------------------------
// Selecao dos logs por data de saida
//------------------------------------------------------------------------------

procedure TForm_Utilizacao_Log_Hotel.SpeedButton_Data_SaidaClick(Sender: TObject);
begin
   Busca_Utilizacao;
end;

//------------------------------------------------------------------------------
// Selecao dos logs por tipo
//------------------------------------------------------------------------------

procedure TForm_Utilizacao_Log_Hotel.SpeedButton_TipoClick(Sender: TObject);
begin
   Busca_Utilizacao;
end;

end.
