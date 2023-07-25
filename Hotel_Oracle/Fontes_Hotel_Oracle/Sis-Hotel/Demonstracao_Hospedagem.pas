unit Demonstracao_Hospedagem;

interface

uses
  Windows, Messages, Classes, SysUtils, Graphics, Controls, StdCtrls, Forms,
  Dialogs, DBCtrls, DB, DBGrids, ComCtrls, Buttons, DBTables, ToolWin,
  Grids, ExtCtrls, Rotinas, Mask;

type
  TForm_Demonstra_Hospedagem = class(TForm)
    DSQ_Hospedagem: TDataSource;
    Panel2: TPanel;
    Query_Hospedagem: TQuery;
    Panel3: TPanel;
    StatusBar: TStatusBar;
    Table_Hospedagem: TTable;
    DST_Hospedagem: TDataSource;
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
    Panel4: TPanel;
    Panel6: TPanel;
    Table_Apto: TTable;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField2: TStringField;
    DST_Apto: TDataSource;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Panel7: TPanel;
    DBGrid3: TDBGrid;
    MaskEdit_Ano: TMaskEdit;
    MaskEdit_Ficha: TMaskEdit;
    MaskEdit_Apto: TMaskEdit;
    MaskEdit_Predio: TMaskEdit;
    SpeedButton_Executa: TSpeedButton;
    DBNavigator2: TDBNavigator;
    DBGrid2: TDBGrid;
    Label_Qtd_Reg: TLabel;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    ToolButton_Windows: TToolButton;
    ToolButton_Ajuda: TToolButton;
    Panel1: TPanel;
    ToolBar4: TToolBar;
    ToolButton_Inserir: TToolButton;
    ToolButton_Desocupar: TToolButton;
    ToolButton_Atualizar: TToolButton;
    DBNavigator3: TDBNavigator;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton_ExecutaClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton_InserirClick(Sender: TObject);
    procedure ToolButton_DesocuparClick(Sender: TObject);
    procedure ToolButton_AtualizarClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form_Demonstra_Hospedagem: TForm_Demonstra_Hospedagem;

implementation

{$R *.DFM}

procedure TForm_Demonstra_Hospedagem.FormActivate(Sender: TObject);
begin
  Query_Hospedagem.Open;
  Table_Hospedagem.Open;
  Table_Apto.Open;

  SpeedButton_ExecutaClick(Sender);
end;

procedure TForm_Demonstra_Hospedagem.ToolButton_DesocuparClick(Sender: TObject);
begin
   Table_Apto.Edit;
   Table_Apto.FieldByName('AptCodigo').AsString:= 'DESOCUPADO';
   Table_Apto.Post;

   Query_Hospedagem.Close;
   Query_Hospedagem.Open;
end;

procedure TForm_Demonstra_Hospedagem.ToolButton_InserirClick(Sender: TObject);
begin
   Table_Apto.Edit;
   Table_Apto.FieldByName('AptCodigo').AsString:= 'OCUPADO';
   Table_Apto.Post;

   Query_Hospedagem.Close;
   Query_Hospedagem.Open;
end;

procedure TForm_Demonstra_Hospedagem.ToolButton2Click(Sender: TObject);
begin
   Close;
end;

procedure TForm_Demonstra_Hospedagem.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

procedure TForm_Demonstra_Hospedagem.ToolButton_AtualizarClick(Sender: TObject);
begin
   Query_Hospedagem.Close;
   Query_Hospedagem.Open;
end;


procedure TForm_Demonstra_Hospedagem.SpeedButton_ExecutaClick(Sender: TObject);
var
   VS_Comando: String;
begin
   VS_Comando:= 'Select ho.ano, ho.Ficha, ho.Predio, ho.apto, ho.Identidade, HP.Nome, ho.dataentrada, ho.HoraEntrada, ho.datasaida '+
                ' From hospede hp, historico ho ' +
                ' where ho.identidade = hp.identidade '+
                ' and TIPO_FECHAMENTO = '+#39+'H'+#39;


   if trim(MaskEdit_Ano.Text) <> '' then
      VS_Comando:= VS_Comando+'and ho.ano = '+#39+MaskEdit_Ano.Text+#39;

   if trim(MaskEdit_Ficha.Text) <> '' then
      VS_Comando:= VS_Comando+'and ho.ficha = '+#39+MaskEdit_Ficha.Text+#39;

   if trim(MaskEdit_Apto.Text) <> '' then
      VS_Comando:= VS_Comando+'and ho.apto = '+#39+MaskEdit_Apto.Text+#39;

   if trim(MaskEdit_Predio.Text) <> '' then
      VS_Comando:= VS_Comando+'and ho.predio = '+#39+MaskEdit_Predio.Text+#39;

   VS_Comando:= VS_Comando+' order by ho.predio, ho.apto';

   Query_Hospedagem.Close;
   Query_Hospedagem.SQL.Clear;
   Query_Hospedagem.SQL.Add(VS_Comando);
   Query_Hospedagem.Open;

   Label_Qtd_Reg.Caption:= 'Quantidade de Registros --> '+IntToStr(Query_Hospedagem.RecordCount);
end;

procedure TForm_Demonstra_Hospedagem.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if Table_Hospedagem.RecordCount = 0 then
     DBGrid3.Color:= clYellow
   else
     DBGrid3.Color:= clSilver
end;

end.
