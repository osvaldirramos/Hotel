//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Tabela_Preco.PAS                               //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de montar a tabela  //
//                             de preco para consulta na portaria.            //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 12/11/2003                                     //
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

unit RelacaoVeiculos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, StdCtrls, Mask, DBCtrls, Buttons, Db, Grids, DBGrids, ExtCtrls,
  ComCtrls, Rotinas, jpeg, ToolWin;

type
  TForm_RelacaoVeiculos = class(TForm)
    Panel3: TPanel;
    DBGrid_TabelaPreco: TDBGrid;
    Query_RelVeiculos: TQuery;
    DSQ_RelVeiculos: TDataSource;
    StatusBar: TStatusBar;
    Panel1: TPanel;
    Panel4: TPanel;
    Panel12: TPanel;
    Image_Hotel: TImage;
    ToolBar2: TToolBar;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    ToolButton_Ajuda: TToolButton;
    ToolBar1: TToolBar;
    MASKEDIT_Placa: TMaskEdit;
    MaskEdit_Veiculo: TMaskEdit;
    procedure FormActivate(Sender: TObject);

    procedure MASKEDIT_PlacaChange(Sender: TObject);
    procedure DBGrid_TabelaPrecoTitleClick(Column: TColumn);
    procedure Busca_Tabela;
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public    { Public declarations }
     VS_OrderBy: String;
  end;

var
  Form_RelacaoVeiculos: TForm_RelacaoVeiculos;

implementation

uses Abertura, Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_RelacaoVeiculos.FormActivate(Sender: TObject);
begin
   MaskEdit_Veiculo.Text:= '';
   MASKEDIT_Placa.Text:= '';
   VS_OrderBy:= 'b.veiculo';
   Busca_Tabela;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_RelacaoVeiculos.ToolButton_RetornarClick(Sender: TObject);
begin
   Query_RelVeiculos.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_RelacaoVeiculos.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Consulta pela posto/graduacao
//------------------------------------------------------------------------------

procedure TForm_RelacaoVeiculos.MASKEDIT_PlacaChange(Sender: TObject);
begin
   Busca_Tabela;
end;

//------------------------------------------------------------------------------
// Consulta pela posto/graduacao
//------------------------------------------------------------------------------

procedure TForm_RelacaoVeiculos.Busca_Tabela;
var
   VS_Comando: String;
begin
   VS_Comando:= 'select a.predio, a.apto, b.nome_guerra, b.posto, b.veiculo, b.placa '+
                ' from hospedagem a, hospede b '+
                ' where a.identidade = b.identidade '+
                ' and b.veiculo <> '+#39+#39;

   if trim(MaskEdit_Veiculo.Text) <> '' then
      VS_Comando:= VS_Comando + ' and b.veiculo like '+#39+'%'+MaskEdit_Veiculo.Text+#39+'%';

   if trim(MASKEDIT_Placa.Text) <> '' then
      VS_Comando:= VS_Comando +'and b.placa like '+#39+'%'+MASKEDIT_Placa.text+'%'+#39+' ';

   VS_Comando:= VS_Comando +'Order By '+VS_OrderBy;

   Query_RelVeiculos.Close;
   Query_RelVeiculos.SQL.Clear;
   Query_RelVeiculos.Sql.Add(VS_Comando);
   Query_RelVeiculos.Open;
end;

//------------------------------------------------------------------------------
// Tratamento da selecao do cabecalho
//------------------------------------------------------------------------------

procedure TForm_RelacaoVeiculos.DBGrid_TabelaPrecoTitleClick(Column: TColumn);
begin
   if column.Title.Caption = 'Veiculo' then
       VS_OrderBy:= 'b.veiculo'
   else
      if trim(column.Title.Caption) = 'Placa' then
          VS_OrderBy:= 'b.placa'
      else
         if column.Title.Caption = 'Prédio' then
            VS_OrderBy:= 'a.predio, a.apto '
         else
            if column.Title.Caption = 'Apto' then
               VS_OrderBy:= 'a.predio, a.apto '
            else
               if column.Title.Caption = 'Posto Grad.' then
                   VS_OrderBy:= 'b.posto'
               else
                   if column.Title.Caption = 'Nome Guerra' then
                        VS_OrderBy:= 'b.nome_guerra';

   Busca_Tabela;
end;

procedure TForm_RelacaoVeiculos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.
