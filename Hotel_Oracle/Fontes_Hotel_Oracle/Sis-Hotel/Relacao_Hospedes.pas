unit Relacao_Hospedes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, JvEdit, StdCtrls, ExtCtrls, ComCtrls, ToolWin, DB, Rotinas,
  DBTables;

type
  TForm_RelacaoHospedes = class(TForm)
    RichEdit_relacao: TRichEdit;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    ComboBox_Predio: TComboBox;
    MaskEdit_Ano: TJvEdit;
    Label2: TLabel;
    ToolButton1: TToolButton;
    SpeedButton1: TSpeedButton;
    Query_Historico: TQuery;
    DSQ_Historico: TDataSource;
    SpeedButton2: TSpeedButton;
    PrintDialog1: TPrintDialog;
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_RelacaoHospedes: TForm_RelacaoHospedes;

implementation

{$R *.dfm}

procedure TForm_RelacaoHospedes.FormActivate(Sender: TObject);
begin
   Query_Historico.Open;
   MaskEdit_Ano.Text:= Funcoes.AnoAtual;
   RichEdit_relacao.Lines.Clear;
end;

procedure TForm_RelacaoHospedes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Query_Historico.Close;
   Action:= caFree;
end;

procedure TForm_RelacaoHospedes.ToolButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

procedure TForm_RelacaoHospedes.SpeedButton1Click(Sender: TObject);
var
   VS_resumo, VS_Predio, VS_Linha, VS_Comando: String;
   VI_Cont, VI_Predio: Integer;
begin

   RichEdit_relacao.Lines.Clear;
   VI_Cont:= 0;
   VI_Predio:= 0;
   VS_Comando:= ' select h.ano, h.ficha, h.predio, h.apto, h.dataentrada, h.datasaida, p.identidade, p.nome, p.Om_origem ' +
                ' From Historico h, hospede p '+
                ' where h.identidade = p.identidade '+
                ' and h.TIPO_FECHAMENTO = '+#39+'H'+#39;

   if MaskEdit_Ano.Text <> '' then
      VS_Comando:= VS_Comando+' and  h.ano = '+MaskEdit_Ano.Text;

   if ComboBox_Predio.Text <> '' then
      VS_Comando:= VS_Comando+' and  h.predio = '+#39+ComboBox_Predio.Text+#39;

   VS_Comando:= VS_Comando+' Order by h.predio, h.apto ' ;

   Query_Historico.Close;
   Query_Historico.Sql.Clear;
   Query_Historico.Sql.Add(VS_Comando);
   Query_Historico.Open;
   Query_Historico.First;

   VS_Resumo:= '';
   VS_Predio:= Query_Historico.FieldByName('predio').AsString;
   RichEdit_relacao.Lines.Add('RELAÇÃO DE HOSPEDES NO HISTORICO - '+DateToStr(Date));
   RichEdit_relacao.Lines.Add('');
   While not Query_Historico.eof do
   begin
      VS_Linha:= Query_Historico.FieldByName('ano').AsString+' - '+
                 Query_Historico.FieldByName('ficha').AsString+' - '+
                 Query_Historico.FieldByName('predio').AsString+' - '+
                 Query_Historico.FieldByName('apto').AsString+' - '+
                 Query_Historico.FieldByName('dataentrada').AsString+' - '+
                 Query_Historico.FieldByName('datasaida').AsString+' - '+
                 Query_Historico.FieldByName('identidade').AsString+' - '+
                 Query_Historico.FieldByName('nome').AsString+' - '+
                 Query_Historico.FieldByName('Om_origem').AsString;


     RichEdit_relacao.Lines.Add(VS_Linha);
     VI_Predio:= VI_Predio+1;
     Query_Historico.Next;
     if VS_Predio <> Query_Historico.FieldByName('predio').AsString then
     begin
        if VS_Resumo = '' then
           VS_resumo:= 'Numero de Hospedes por Predio: ';
        VS_Resumo:= VS_resumo+#13+'Predio '+VS_Predio+' Qtd Hospede '+IntToStr(VI_Predio);
        VS_Predio:= Query_Historico.FieldByName('predio').AsString;
        VI_Predio:= 0;
     end;
     VI_Cont:= VI_Cont+1;
   end;
   RichEdit_relacao.Lines.Add('');

   if VS_resumo <> '' then
   begin
      VS_Resumo:= VS_resumo+#13+'Predio '+VS_Predio+' Qtd Hospede '+IntToStr(VI_Predio);
      RichEdit_relacao.Lines.Add(VS_Resumo);
   end;
   RichEdit_relacao.Lines.Add('Numero Total de Hospedes: '+IntToStr(VI_Cont));
end;


procedure TForm_RelacaoHospedes.ToolButton_WindowsClick(Sender: TObject);
begin
  Funcoes.Windows;
end;

procedure TForm_RelacaoHospedes.SpeedButton2Click(Sender: TObject);
var
   VS_resumo, VS_Predio, VS_Linha, VS_Comando: String;
   VI_Cont, VI_Predio: Integer;
begin

   RichEdit_relacao.Lines.Clear;
   VI_Cont:= 0;
   VI_Predio:= 0;
   VS_Comando:= ' select h.ano, h.ficha, h.predio, h.apto, h.dataentrada, h.datasaida, p.identidade, p.nome, p.Om_origem ' +
                ' From Hospedagem h, hospede p '+
                ' where h.identidade = p.identidade ';

   if MaskEdit_Ano.Text <> '' then
      VS_Comando:= VS_Comando+' and  h.ano = '+MaskEdit_Ano.Text;

   if ComboBox_Predio.Text <> '' then
      VS_Comando:= VS_Comando+' and  h.predio = '+#39+ComboBox_Predio.Text+#39;

   VS_Comando:= VS_Comando+' Order by h.predio, h.apto ' ;

   Query_Historico.Close;
   Query_Historico.Sql.Clear;
   Query_Historico.Sql.Add(VS_Comando);
   Query_Historico.Open;
   Query_Historico.First;


   VS_Resumo:= '';
   VS_Predio:= Query_Historico.FieldByName('predio').AsString;
   RichEdit_relacao.Lines.Add('RELAÇÃO DE HOSPEDES - '+DateToStr(Date));
   RichEdit_relacao.Lines.Add('');

   While not Query_Historico.eof do
   begin
      VS_Linha:= Query_Historico.FieldByName('ano').AsString+' - '+
                 Query_Historico.FieldByName('ficha').AsString+' - '+
                 Query_Historico.FieldByName('predio').AsString+' - '+
                 Query_Historico.FieldByName('apto').AsString+' - '+
                 Query_Historico.FieldByName('dataentrada').AsString+' - '+
                 Query_Historico.FieldByName('datasaida').AsString+' - '+
                 Query_Historico.FieldByName('identidade').AsString+' - '+
                 Query_Historico.FieldByName('nome').AsString+' - '+
                 Query_Historico.FieldByName('Om_origem').AsString;

     RichEdit_relacao.Lines.Add(VS_Linha);
     VI_Predio:= VI_Predio+1;
     Query_Historico.Next;
     if VS_Predio <> Query_Historico.FieldByName('predio').AsString then
     begin
        if VS_Resumo = '' then
           VS_resumo:= 'Numero de Hospedes por Predio: ';
        VS_Resumo:= VS_resumo+#13+'Predio '+VS_Predio+' Qtd Hospede '+IntToStr(VI_Predio);
        VS_Predio:= Query_Historico.FieldByName('predio').AsString;
        VI_Predio:= 0;
     end;
     VI_Cont:= VI_Cont+1;
   end;
   RichEdit_relacao.Lines.Add('');

   if VS_resumo <> '' then
   begin
      VS_Resumo:= VS_resumo+#13+'Predio '+VS_Predio+' Qtd Hospede '+IntToStr(VI_Predio);
      RichEdit_relacao.Lines.Add(VS_Resumo);
   end;
   RichEdit_relacao.Lines.Add('Numero Total de Hospedes: '+IntToStr(VI_Cont));
end;

procedure TForm_RelacaoHospedes.ToolButton1Click(Sender: TObject);
var
   N: Integer;
begin
  if PrintDialog1.Execute then
    for N := 1 to PrintDialog1.Copies do
      RichEdit_relacao.Print('');
end;

end.
