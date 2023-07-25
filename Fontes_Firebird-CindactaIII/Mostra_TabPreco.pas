unit Mostra_TabPreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, jpeg, ExtCtrls, StdCtrls, Mask,
  ComCtrls, ToolWin, Grids, DBGrids, Rotinas;

type
  TForm_MostraTabPreco = class(TForm)
    Panel3: TPanel;
    DBGrid_TabelaPreco: TDBGrid;
    StatusBar: TStatusBar;
    Panel1: TPanel;
    Panel4: TPanel;
    ToolBar2: TToolBar;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    ToolButton_Ajuda: TToolButton;
    ToolBar1: TToolBar;
    MASKEDIT_Posto: TMaskEdit;
    Panel12: TPanel;
    Image_Hotel: TImage;
    DSQ_Facilidades: TDataSource;
    IBQuery_Tabela_Preco: TIBQuery;
    IBQuery_Tabela_PrecoPREDIO: TIBStringField;
    IBQuery_Tabela_PrecoPOSTO: TIBStringField;
    IBQuery_Tabela_PrecoVALOR: TIBBCDField;
    ComboBox_Predio: TComboBox;

    procedure Busca_Tabela;
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure DBGrid_TabelaPrecoTitleClick(Column: TColumn);
    procedure MASKEDIT_PostoChange(Sender: TObject);
    procedure ComboBox_PredioChange(Sender: TObject);
  private    { Private declarations }
  public    { Public declarations }
     VS_OrderBy: String;
  end;

var
  Form_MostraTabPreco: TForm_MostraTabPreco;

implementation

{$R *.dfm}

//------------------------------------------------------------------------------
// Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_MostraTabPreco.ToolButton_RetornarClick(Sender: TObject);
begin
   IBQuery_Tabela_Preco.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_MostraTabPreco.FormActivate(Sender: TObject);
begin
   if ((Funcoes.GetPrivilegio = 'G') or (Funcoes.GetPrivilegio = 'U')) then
      ToolButton_Ajuda.Visible:= True
   else
      ToolButton_Ajuda.Visible:= False;

   Funcoes.AlimentaComboBox(ComboBox_Predio, 1, '');
   MASKEDIT_Posto.Text:= '';
   VS_OrderBy:= 'po.codigo, pr.predio';
   Busca_Tabela;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_MostraTabPreco.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Consulta pela posto/graduacao
//------------------------------------------------------------------------------

procedure TForm_MostraTabPreco.Busca_Tabela;
var
   VS_Comando: String;
begin
   VS_Comando:= 'select pr.predio, po.posto, pr.valor from tabela_posto po, tabela_Preco pr where po.codigo = pr.codigo ';


   if trim(ComboBox_Predio.Text) <> '' then
      VS_Comando:= VS_Comando + ' and pr.Predio = '+#39+ComboBox_Predio.Text+#39;

   if trim(MASKEDIT_Posto.Text) <> '' then
      VS_Comando:= VS_Comando +'and po.posto like '+#39+MASKEDIT_Posto.text+'%'+#39+' ';

   VS_Comando:= VS_Comando +'Order By '+VS_OrderBy;

   IBQuery_Tabela_Preco.Close;
   IBQuery_Tabela_Preco.SQL.Clear;
   IBQuery_Tabela_Preco.Sql.Add(VS_Comando);
   IBQuery_Tabela_Preco.Open;
end;

procedure TForm_MostraTabPreco.DBGrid_TabelaPrecoTitleClick( Column: TColumn);
begin
   if column.Title.Caption = 'PRÉDIO' then
       VS_OrderBy:= 'pr.predio, po.codigo'
   else
      if trim(column.Title.Caption) = 'POSTO' then
          VS_OrderBy:= 'po.codigo, pr.predio'
      else
         if column.Title.Caption = 'VALOR' then
            VS_OrderBy:= 'pr.valor, po.codigo, pr.predio';

   Busca_Tabela;
end;

procedure TForm_MostraTabPreco.MASKEDIT_PostoChange(Sender: TObject);
begin
   Busca_Tabela;
end;

procedure TForm_MostraTabPreco.ComboBox_PredioChange(Sender: TObject);
begin
   Busca_Tabela;
end;

end.
