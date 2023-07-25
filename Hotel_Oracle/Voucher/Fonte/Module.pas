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
    Query_Usuario: TQuery;
    Query_Executa: TQuery;
    Query_ExecutaQuery: TQuery;
    ImageList_Principal: TImageList;
    IBQuery_Executa: TIBQuery;
    procedure Sobre1Click(Sender: TObject);
    procedure ManualOnLine1Click(Sender: TObject);
    procedure Oquefaz1Click(Sender: TObject);
    procedure Patentes1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DM: TDM;

implementation

//uses Sobre, Manual_OnLine, Dicas_Utilizacao, Divisas, Tabela_Preco;

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure para chamar o Sobre
//------------------------------------------------------------------------------

procedure TDM.Sobre1Click(Sender: TObject);
begin
//   Application.CreateForm(TForm_Sobre, Form_Sobre);
//   Form_Sobre.ShowModal;


end;

procedure TDM.ManualOnLine1Click(Sender: TObject);
begin
//   Form_ManualOnLine.ShowModal;
end;

procedure TDM.Oquefaz1Click(Sender: TObject);
begin
//   Form_Dicas_Utilizacao.ShowModal;
end;

procedure TDM.Patentes1Click(Sender: TObject);
begin
//   Form_Divisas.ShowModal;
end;

procedure TDM.MenuItem1Click(Sender: TObject);
begin
//   Form_Tabela_Preco.Show;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
//   IBDatabase_HotelLocal.Connected:= True;
//   IBTransaction_HotelLocal.Active:= true;
end;

end.
