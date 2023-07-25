unit MontaMapa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Grids, DBGrids, IBCustomDataSet, IBQuery,
  IBTable;

type
  TForm_MontaMapa = class(TForm)
    Button1: TButton;
    DST_Apto: TDataSource;
    DBGrid1: TDBGrid;
    IBQuery_Mapa: TIBQuery;
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
    DBGrid2: TDBGrid;
    Table_Apto: TTable;
    Table_AptoPREDIO: TStringField;
    Table_AptoAPTO: TFloatField;
    Table_AptoCAMA: TFloatField;
    Table_AptoAPTCODIGO: TStringField;
    Table_AptoNOME: TStringField;
    Table_Hospedagem: TTable;
    DST_Hospedagem: TDataSource;
    DBGrid3: TDBGrid;
    Table_Reserva: TTable;
    DBGrid4: TDBGrid;
    DST_Reserva: TDataSource;
    IBQuery_Executa: TIBQuery;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    IBStringField8: TIBStringField;
    IBStringField9: TIBStringField;
    Button2: TButton;
    Table_Hospede: TTable;
    IBTable_Mapa: TIBTable;
    DBGrid5: TDBGrid;
    TST_Mapa: TDataSource;
    IBTable_MapaPREDIO: TIBStringField;
    IBTable_MapaAPTO: TIntegerField;
    IBTable_MapaCAMA: TIntegerField;
    IBTable_MapaCODIGO: TIBStringField;
    IBTable_MapaRAMAL: TIBStringField;
    IBTable_MapaTV1: TIBStringField;
    IBTable_MapaTV2: TIBStringField;
    IBTable_MapaTIPO: TIBStringField;
    IBTable_MapaSITUACAO: TIBStringField;
    IBTable_MapaSITUACAO_CURSO: TIBStringField;
    IBTable_MapaNOME: TIBStringField;
    IBTable_MapaDATA_ENTRADA: TIBStringField;
    IBTable_MapaDATA_SAIDA: TIBStringField;
    IBTable_MapaIDENTIDADE: TIBStringField;
    Table_HospedagemIDENTIDADE: TStringField;
    Table_HospedagemFICHA: TStringField;
    Table_HospedagemANO: TFloatField;
    Table_HospedagemPREDIO: TStringField;
    Table_HospedagemAPTO: TFloatField;
    Table_HospedagemCAMA: TFloatField;
    Table_HospedagemDATAENTRADA: TStringField;
    Table_HospedagemHORAENTRADA: TStringField;
    Table_HospedagemDATASAIDA: TStringField;
    Table_HospedagemDEPENDENTE: TFloatField;
    Table_HospedagemSITUACAO_HOSPEDAGEM: TStringField;
    Table_HospedagemRECEBE: TStringField;
    Table_HospedagemDESCONTO: TStringField;

   procedure GravaMapa(Tipo, Situacao, SituacaoCurso, Nome, DataEntrada, DataSaida, Identidade: String);

    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_MontaMapa: TForm_MontaMapa;

implementation

{$R *.dfm}

procedure TForm_MontaMapa.FormActivate(Sender: TObject);
begin
   IBQuery_Mapa.Open;
   Table_Hospedagem.Open;
   Table_Reserva.Open;
   Table_Apto.Open;
   IBTable_Mapa.Open;
   Table_Hospede.Open;
end;


procedure TForm_MontaMapa.Button2Click(Sender: TObject);
begin
   IBQuery_Executa.Close;
   IBQuery_Executa.SQL.Clear;
   IBQuery_Executa.Sql.Add('Delete from Mapa Where tipo = 2');
   IBQuery_Executa.ExecSQL;
end;

procedure TForm_MontaMapa.Button1Click(Sender: TObject);
var
   VS_Comando: String;
begin

   VS_Comando:= 'select Identidade, predio, apto, cama, ramal, nome, tipo, situacao, situacao_curso, data_entrada, Data_Saida '+
                ' From mapa '+
                ' Where Tipo <> 0 and tipo <> 3 ';

   IBQuery_Mapa.Close;
   IBQuery_Mapa.SQL.Clear;
   IBQuery_Mapa.SQL.Add(VS_Comando);
   IBQuery_Mapa.Open;

   IBQuery_Mapa.First;
   While not IBQuery_Mapa.eof do
   begin
      if Table_Apto.FieldByName('AptCodigo').AsString = 'OCUPADO' then
      begin
         if ((IBQuery_Mapa.FieldByName('Nome').AsString <> Table_Hospede.FieldByName('Nome').AsString) and
             (IBQuery_Mapa.FieldByName('Data_Entrada').AsString <> Table_Hospedagem.FieldByName('Data_Entrada').AsString) and
             (IBQuery_Mapa.FieldByName('Data_Saida').AsString <> Table_Hospedagem.FieldByName('Data_Saida').AsString)) then
         begin
             GravaMapa('1',
                       IBQuery_Mapa.FieldByName('Cama').AsString+' - '+Trim(Table_Hospede.FieldByName('Posto').AsString)+' '+Table_Hospede.FieldByName('NOME_GUERRA').AsString,
                       'OCUPADO',
                       Table_Hospede.FieldByName('Nome').AsString,
                       Table_Hospedagem.FieldByName('Data_Entrada').AsString,
                       Table_Hospedagem.FieldByName('Data_Saida').AsString,
                       Table_Hospedagem.FieldByName('Identidade').AsString);
         end;
      end
      else
      begin
         if Table_Apto.FieldByName('AptCodigo').AsString = 'NÃO OCUPAR' then
         begin
             GravaMapa('5',
                       IBQuery_Mapa.FieldByName('Cama').AsString+' - '+Table_Hospede.FieldByName('Nome').AsString,
                       'NÃO OCUPAR',
                       Table_Apto.FieldByName('Nome').AsString,
                       '',
                       '',
                       '');

         end

      end;


      IBQuery_Mapa.Next;
   end;
end;


//------------------------------------------------------------------------------
// Grava Mapa
//------------------------------------------------------------------------------

procedure TForm_MontaMapa.GravaMapa(Tipo, Situacao, SituacaoCurso, Nome, DataEntrada, DataSaida, Identidade: String);
begin
   IBTable_Mapa.Edit;
    IBTable_Mapa.FieldByName('TIPO').AsString:= Tipo;
    IBTable_Mapa.FieldByName('SITUACAO').AsString:= Situacao;
    IBTable_Mapa.FieldByName('SITUACAO_CURSO').AsString:= SituacaoCurso;
    IBTable_Mapa.FieldByName('NOME').AsString:= Nome;
    IBTable_Mapa.FieldByName('DATA_ENTRADA').AsString:= DataEntrada;
    IBTable_Mapa.FieldByName('DATA_SAIDA').AsString:= DataSaida;
    IBTable_Mapa.FieldByName('IDENTIDADE').AsString:= Identidade;
   IBTable_Mapa.Post;
end;

end.
