//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Module.PAS                                     //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de tratar do acesso //
//                             ao Banco de Dados.                             //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 17/03/2003                                     //
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

unit Module;

interface

uses
  SysUtils, Windows, Classes, Graphics, Controls, Forms, Dialogs, DB, DBTables,
  IBDatabase, IBTable, IBCustomDataSet, IBQuery, ImgList, Menus;

type
  TDM = class(TDataModule)
    Database_HTL: TDatabase;
    Table_Verifica: TTable;
    DST_Verifica: TDataSource;
    Table_VerificaVUSUARIO: TStringField;
    Table_VerificaVDATA: TDateTimeField;
    Table_VerificaVHORAENTRADA: TStringField;
    Table_VerificaVHORASAIDA: TStringField;
    Table_LogHotel: TTable;
    DST_LogHotel: TDataSource;
    Table_LogHotelUSUARIO: TStringField;
    Table_LogHotelATIVIDADE: TStringField;
    Table_LogHotelDATA: TDateTimeField;
    Table_LogHotelHORAENTRADA: TStringField;
    Table_LogHotelNATIVIDADE: TFloatField;
    Query_Usuario: TQuery;
    Query_Executa: TQuery;
    IBDatabase_HotelLocal: TIBDatabase;
    IBTransaction_HotelLocal: TIBTransaction;
    Query_ExecutaQuery: TQuery;
    ImageList_Principal: TImageList;
    Query_Limpa_Estatistica: TQuery;
    PopupMenu_Ajuda: TPopupMenu;
    Patentes1: TMenuItem;
    ManualOnLine1: TMenuItem;
    Oquefaz1: TMenuItem;
    N1: TMenuItem;
    Sobre1: TMenuItem;
    IBQuery_Executa: TIBQuery;
    PopupMenu_TabelaHospedagem: TPopupMenu;
    MenuItem1: TMenuItem;
    N2: TMenuItem;
    MenuItem2: TMenuItem;
    procedure Sobre1Click(Sender: TObject);
    procedure Patentes1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DM: TDM;

implementation

uses Sobre, Divisas;

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure para chamar o Sobre
//------------------------------------------------------------------------------

procedure TDM.Sobre1Click(Sender: TObject);
begin
   Form_Sobre.ShowModal;
end;

procedure TDM.Patentes1Click(Sender: TObject);
begin
   Form_Divisas.ShowModal;
end;

end.
