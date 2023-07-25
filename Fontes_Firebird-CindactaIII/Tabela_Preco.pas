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

unit Tabela_Preco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, StdCtrls, Mask, DBCtrls, Buttons, Db, Grids, DBGrids, ExtCtrls,
  ComCtrls, Rotinas, jpeg;

type
  TForm_Tabela_Preco = class(TForm)
    Panel3: TPanel;
    DBGrid_TabelaPreco: TDBGrid;
    Query_Tabela_Preco: TQuery;
    DSQ_Facilidades: TDataSource;
    StatusBar: TStatusBar;
    Query_Tabela_PrecoPREDIO: TStringField;
    Query_Tabela_PrecoPOSTO: TStringField;
    Panel1: TPanel;
    Panel4: TPanel;
    Panel2: TPanel;
    SpeedButton_Windows: TSpeedButton;
    SpeedButton_Retornar: TSpeedButton;
    Panel12: TPanel;
    Image1: TImage;
    GroupBox_Busca_Por_Nome: TGroupBox;
    MASKEDIT_Posto: TMaskEdit;
    Query_Tabela_PrecoVALOR: TIntegerField;
    procedure BitBtn_RetornarClick(Sender: TObject);
    procedure BitBtn_WindowsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

    procedure MASKEDIT_PostoChange(Sender: TObject);
    procedure DBGrid_TabelaPrecoTitleClick(Column: TColumn);
    procedure Busca_Tabela;
  private
    { Private declarations }
  public    { Public declarations }
     VS_OrderBy: String;
  end;

var
  Form_Tabela_Preco: TForm_Tabela_Preco;

implementation

uses Abertura;

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_Tabela_Preco.FormActivate(Sender: TObject);
begin
   MASKEDIT_Posto.Text:= '';
   VS_OrderBy:= 'po.codigo, pr.predio';
   Busca_Tabela;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_Tabela_Preco.BitBtn_RetornarClick(Sender: TObject);
begin
   Query_Tabela_Preco.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Tabela_Preco.BitBtn_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Consulta pela posto/graduacao
//------------------------------------------------------------------------------

procedure TForm_Tabela_Preco.MASKEDIT_PostoChange(Sender: TObject);
begin
   Busca_Tabela;
end;

//------------------------------------------------------------------------------
// Consulta pela posto/graduacao
//------------------------------------------------------------------------------

procedure TForm_Tabela_Preco.Busca_Tabela;
var
   VS_Comando: String;
begin
   if trim(MASKEDIT_Posto.Text) = '' then
      VS_Comando:= 'select pr.predio, po.posto, pr.valor from tabela_posto po, tabela_Preco pr where po.codigo = pr.codigo order by '+VS_OrderBy
   else
      VS_Comando:= 'select pr.predio, po.posto, pr.valor '+
                   'from tabela_posto po, tabela_Preco pr '+
                   'where po.codigo = pr.codigo '+
                   'and po.posto like '+#39+MASKEDIT_Posto.text+'%'+#39+' '+
                   'Order By '+VS_OrderBy;

   Query_Tabela_Preco.Close;
   Query_Tabela_Preco.SQL.Clear;
   Query_Tabela_Preco.Sql.Add(VS_Comando);
   Query_Tabela_Preco.Open;
end;

//------------------------------------------------------------------------------
// Tratamento da selecao do cabecalho
//------------------------------------------------------------------------------

procedure TForm_Tabela_Preco.DBGrid_TabelaPrecoTitleClick(Column: TColumn);
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

end.
