unit Mostra_TabPrecoResidenteBaseAreaManaus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, jpeg, ExtCtrls, StdCtrls, Mask,
  ComCtrls, ToolWin, Grids, DBGrids, Rotinas;

type
  TForm_MostraTabPrecoResidenteBaseAereaManaus = class(TForm)
    StatusBar: TStatusBar;
    Panel1: TPanel;
    Panel4: TPanel;
    ToolBar2: TToolBar;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    ToolButton_Ajuda: TToolButton;
    ToolBar1: TToolBar;
    MASKEDIT_NDep: TMaskEdit;
    Panel12: TPanel;
    Image_Hotel: TImage;
    DSQ_Facilidades: TDataSource;
    IBQuery_Tabela_Preco: TIBQuery;
    IBQuery_Tabela_PrecoPOSTO: TIBStringField;
    IBQuery_Tabela_PrecoN_DEPENDENTE: TSmallintField;
    IBQuery_Tabela_PrecoVALOR: TIBBCDField;
    MASKEDIT_Posto: TMaskEdit;
    DBGrid_TabelaPreco: TDBGrid;

    procedure Busca_Tabela;
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure DBGrid_TabelaPrecoTitleClick(Column: TColumn);
    procedure MASKEDIT_NDepChange(Sender: TObject);
    procedure DBGrid_TabelaPrecoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private    { Private declarations }
  public    { Public declarations }
     VS_OrderBy: String;
  end;

var
  Form_MostraTabPrecoResidenteBaseAereaManaus: TForm_MostraTabPrecoResidenteBaseAereaManaus;

implementation

{$R *.dfm}

//------------------------------------------------------------------------------
// Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_MostraTabPrecoResidenteBaseAereaManaus.ToolButton_RetornarClick(Sender: TObject);
begin
   IBQuery_Tabela_Preco.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_MostraTabPrecoResidenteBaseAereaManaus.FormActivate(Sender: TObject);
begin
   if ((Funcoes.GetPrivilegio = 'G') or (Funcoes.GetPrivilegio = 'U')) then
      ToolButton_Ajuda.Visible:= True
   else
      ToolButton_Ajuda.Visible:= False;

   MASKEDIT_Posto.Text:= '';
   MASKEDIT_NDep.Text:= '';

   VS_OrderBy:= 'posto';
   Busca_Tabela;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_MostraTabPrecoResidenteBaseAereaManaus.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Consulta pela posto/graduacao
//------------------------------------------------------------------------------

procedure TForm_MostraTabPrecoResidenteBaseAereaManaus.Busca_Tabela;
var
   VS_Comando: String;
   VB_Where: Boolean;
begin
   VB_Where:= False;

   VS_Comando:= 'Select Posto, N_dependente, valor from residente ';

   if trim(MASKEDIT_Posto.Text) <> '' then
   begin
      VB_Where:= true;
      VS_Comando:= VS_Comando +'where posto like '+#39+MASKEDIT_Posto.text+'%'+#39+' ';
   end;

   if trim(MASKEDIT_NDep.Text) <> '' then
      if VB_Where = True then
         VS_Comando:= VS_Comando + ' and N_dependente = '+MASKEDIT_NDep.Text
      else
         VS_Comando:= VS_Comando + ' where N_dependente = '+MASKEDIT_NDep.Text;

   VS_Comando:= VS_Comando +'Order By '+VS_OrderBy;

   IBQuery_Tabela_Preco.Close;
   IBQuery_Tabela_Preco.SQL.Clear;
   IBQuery_Tabela_Preco.Sql.Add(VS_Comando);
   IBQuery_Tabela_Preco.Open;
end;

procedure TForm_MostraTabPrecoResidenteBaseAereaManaus.DBGrid_TabelaPrecoTitleClick( Column: TColumn);
begin
   if trim(column.Title.Caption) = 'POSTO' then
       VS_OrderBy:= 'posto'
   else
     if column.Title.Caption = 'VALOR' then
         VS_OrderBy:= 'valor'
     else
        if column.Title.Caption = 'Nº DEP.' then
            VS_OrderBy:= 'N_dependente';
   Busca_Tabela;
end;

procedure TForm_MostraTabPrecoResidenteBaseAereaManaus.MASKEDIT_NDepChange(Sender: TObject);
begin
   Busca_Tabela;
end;

procedure TForm_MostraTabPrecoResidenteBaseAereaManaus.DBGrid_TabelaPrecoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   If odd(IBQuery_Tabela_Preco.RecNo) then
   begin
     DBGrid_TabelaPreco.Canvas.Font.Color:= clBlack;
     DBGrid_TabelaPreco.Canvas.Brush.Color:= clMoneyGreen;
   end
   else
   begin
      DBGrid_TabelaPreco.Canvas.Font.Color:= clBlack;
      DBGrid_TabelaPreco.Canvas.Brush.Color:= clInfoBk;
   end;
   DBGrid_TabelaPreco.Canvas.FillRect(Rect);
   DBGrid_TabelaPreco.Canvas.TextOut(Rect.Left+2,Rect.Top,Column.Field.AsString);
end;

end.
