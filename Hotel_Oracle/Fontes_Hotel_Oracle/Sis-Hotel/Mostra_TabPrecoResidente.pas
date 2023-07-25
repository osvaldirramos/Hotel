unit Mostra_TabPrecoResidente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, jpeg, ExtCtrls, StdCtrls, Mask,
  ComCtrls, ToolWin, Grids, DBGrids, Rotinas, DBTables;

type
  TForm_MostraTabPrecoResidente = class(TForm)
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
    DBGrid_TabelaPreco: TDBGrid;
    Query_Tabela_Preco: TQuery;
    Query_Tabela_PrecoPOSTO: TStringField;
    Query_Tabela_PrecoVALOR: TFloatField;

    procedure Busca_Tabela;
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure DBGrid_TabelaPrecoTitleClick(Column: TColumn);
    procedure MASKEDIT_PostoChange(Sender: TObject);
    procedure DBGrid_TabelaPrecoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private    { Private declarations }
  public    { Public declarations }
     VS_OrderBy: String;
  end;

var
  Form_MostraTabPrecoResidente: TForm_MostraTabPrecoResidente;

implementation

{$R *.dfm}

//------------------------------------------------------------------------------
// Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_MostraTabPrecoResidente.ToolButton_RetornarClick(Sender: TObject);
begin
   Query_Tabela_Preco.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_MostraTabPrecoResidente.FormActivate(Sender: TObject);
begin
   if ((Funcoes.GetPrivilegio = 'G') or (Funcoes.GetPrivilegio = 'U')) then
      ToolButton_Ajuda.Visible:= True
   else
      ToolButton_Ajuda.Visible:= False;

   MASKEDIT_Posto.Text:= '';
   VS_OrderBy:= 'posto';
   Busca_Tabela;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_MostraTabPrecoResidente.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Consulta pela posto/graduacao
//------------------------------------------------------------------------------

procedure TForm_MostraTabPrecoResidente.Busca_Tabela;
var
   VS_Comando: String;
begin
   VS_Comando:= ' Select Posto, valor from residente ';

   if trim(MASKEDIT_Posto.Text) <> '' then
      VS_Comando:= VS_Comando +'Where posto like '+#39+MASKEDIT_Posto.text+'%'+#39+' ';

   VS_Comando:= VS_Comando +'Order By '+VS_OrderBy;

   Query_Tabela_Preco.Close;
   Query_Tabela_Preco.SQL.Clear;
   Query_Tabela_Preco.Sql.Add(VS_Comando);
   Query_Tabela_Preco.Open;
end;

procedure TForm_MostraTabPrecoResidente.DBGrid_TabelaPrecoTitleClick( Column: TColumn);
begin
   if trim(column.Title.Caption) = 'POSTO' then
       VS_OrderBy:= 'Posto '
   else
      if column.Title.Caption = 'VALOR' then
         VS_OrderBy:= 'valor ';

   Busca_Tabela;
end;

procedure TForm_MostraTabPrecoResidente.MASKEDIT_PostoChange(Sender: TObject);
begin
   Busca_Tabela;
end;

procedure TForm_MostraTabPrecoResidente.DBGrid_TabelaPrecoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not odd(Query_Tabela_Preco.RecNo) then                                //verifica se a linha não é impar
    if not(gdSelected in State) then                                        //verifica se a célula não está selecionada
    begin
      TDBGrid(Sender).Canvas.Brush.Color:=clMoneyGreen;                       //define a cor que a linha vai ser pintada
      TDBGrid(Sender).Canvas.FillRect(Rect);                                 //pinta cada retângulo (célula) da linha a ser pintada
      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);  //retorna com o desenho padrão do DBGrid
    end
    else
       DBGrid_TabelaPreco.Canvas.Brush.Color := clSkyBlue;
end;

procedure TForm_MostraTabPrecoResidente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.
