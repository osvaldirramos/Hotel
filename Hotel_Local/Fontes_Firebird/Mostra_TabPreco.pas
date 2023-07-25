unit Mostra_TabPreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, jpeg, ExtCtrls, StdCtrls, Mask,
  ComCtrls, ToolWin, Grids, DBGrids, Rotinas;

type
  TForm_MostraTabPreco = class(TForm)
    Panel3: TPanel;
    StatusBar: TStatusBar;
    Panel1: TPanel;
    Panel4: TPanel;
    ToolBar2: TToolBar;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    ToolButton_Ajuda: TToolButton;
    Panel12: TPanel;
    Image_Hotel: TImage;
    DSQ_TabelaPreco: TDataSource;
    IBQuery_Tabela_Preco: TIBQuery;
    ComboBox_Predio: TComboBox;
    MASKEDIT_Posto: TMaskEdit;
    IBQuery_Tabela_PrecoPOSTOGRADUACAO: TIBStringField;
    IBQuery_Tabela_PrecoPREDIO: TIBStringField;
    IBQuery_Tabela_PrecoINICIO: TSmallintField;
    IBQuery_Tabela_PrecoTERMINO: TSmallintField;
    IBQuery_Tabela_PrecoVALOR: TIBBCDField;
    DBGrid_TabelaPreco: TDBGrid;

    procedure Busca_Tabela(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure DBGrid_TabelaPrecoTitleClick(Column: TColumn);
    procedure DBGrid_TabelaPrecoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

   Funcoes.AlimentaComboBox(ComboBox_Predio, 0, 'TODOS');
   MASKEDIT_Posto.Text:= '';
   VS_OrderBy:= 'Predio, PostoGraduacao, inicio';
   Busca_Tabela(Sender);
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

procedure TForm_MostraTabPreco.Busca_Tabela(Sender: TObject);
var
   VS_Where, VS_Comando: String;
begin
   VS_Where:= '';
   VS_Comando:= 'select * from REGRASDEDIARIAS ';

   if trim(ComboBox_Predio.Text) <> 'TODOS' then
   begin
      VS_Comando:= VS_Comando + ' Where Predio = '+#39+ComboBox_Predio.Text+#39;
      VS_Where:= 'S';
   end;

   if trim(MASKEDIT_Posto.Text) <> 'TODOS' then
   begin
      if VS_Where = '' then
         VS_Comando:= VS_Comando +' Where postoGraduacao like '+#39+MASKEDIT_Posto.text+'%'+#39+' '
      else
         VS_Comando:= VS_Comando +'and postoGraduacao like '+#39+MASKEDIT_Posto.text+'%'+#39+' ';
   end;

   VS_Comando:= VS_Comando +'Order By '+VS_OrderBy;

   IBQuery_Tabela_Preco.Close;
   IBQuery_Tabela_Preco.SQL.Clear;
   IBQuery_Tabela_Preco.Sql.Add(VS_Comando);
   IBQuery_Tabela_Preco.Open;
end;

procedure TForm_MostraTabPreco.DBGrid_TabelaPrecoTitleClick( Column: TColumn);
var
   Sender: TObject;
begin
   if column.Title.Caption = 'PRÉDIO' then
       VS_OrderBy:= 'Predio, PostoGraduacao, Inicio'
   else
      if trim(column.Title.Caption) = 'POSTO' then
          VS_OrderBy:= 'PostoGraduacao, Inicio'
      else
         if column.Title.Caption = 'VALOR' then
            VS_OrderBy:= 'valor, Predio, Inicio';

   Busca_Tabela(Sender);
end;

procedure TForm_MostraTabPreco.DBGrid_TabelaPrecoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not odd(IBQuery_Tabela_Preco.RecNo) then                                //verifica se a linha não é impar
    if not(gdSelected in State) then                                        //verifica se a célula não está selecionada
    begin
      TDBGrid(Sender).Canvas.Brush.Color:=clMoneyGreen;                       //define a cor que a linha vai ser pintada
      TDBGrid(Sender).Canvas.FillRect(Rect);                                 //pinta cada retângulo (célula) da linha a ser pintada
      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);  //retorna com o desenho padrão do DBGrid
    end
    else
       DBGrid_TabelaPreco.Canvas.Brush.Color := clSkyBlue;
end;

procedure TForm_MostraTabPreco.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.
