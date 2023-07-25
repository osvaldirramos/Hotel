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

//----------------------------------------------------------------------------//
// Tabela de Versões
//----------------------------------------------------------------------------//
//    1 = 'HOTEL CTA'
//    2 = 'BASE AREA MANAUS'
//    3 = 'NATAL'
//    4 = 'CIAAR' 
//----------------------------------------------------------------------------//

unit Module;

interface

uses
  SysUtils, Windows, Classes, Graphics, Controls, Forms, Dialogs, DB, DBTables,
  IBDatabase, IBTable, IBCustomDataSet, IBQuery, ImgList, Menus;

type
  TDM = class(TDataModule)
    DST_Verifica: TDataSource;
    DST_LogHotel: TDataSource;
    IBDatabase_HotelLocal: TIBDatabase;
    IBTransaction_HotelLocal: TIBTransaction;
    IBQuery_Mapa: TIBQuery;
    DSQ_Mapa: TDataSource;
    IBTable_Hotel: TIBTable;
    IBQuery_Verifica_Mapa: TIBQuery;
    IBTable_Apto_Ocupado: TIBTable;
    IBDatabase_Hotel: TIBDatabase;
    IBTransaction_Hotel: TIBTransaction;
    IBTable_LogHotel: TIBTable;
    IBTable_Verifica: TIBTable;
    IBTable_VerificaVUSUARIO: TIBStringField;
    IBTable_VerificaVDATA: TDateTimeField;
    IBTable_VerificaVHORAENTRADA: TIBStringField;
    IBTable_VerificaVHORASAIDA: TIBStringField;
    ImageList_Principal: TImageList;
    PopupMenu_Ajuda: TPopupMenu;
    ManualOnLine1: TMenuItem;
    Oquefaz1: TMenuItem;
    N1: TMenuItem;
    Sobre1: TMenuItem;
    IBTable_LogHotelUSUARIO: TIBStringField;
    IBTable_LogHotelDATA: TDateTimeField;
    IBTable_LogHotelHORAENTRADA: TIBStringField;
    IBTable_LogHotelNATIVIDADE: TIntegerField;
    IBTable_LogHotelATIVIDADE: TIBStringField;
    IBQuery_MapaIDENTIDADE: TIBStringField;
    IBQuery_MapaPREDIO: TIBStringField;
    IBQuery_MapaAPTO: TIntegerField;
    IBQuery_MapaCAMA: TIntegerField;
    IBQuery_MapaRAMAL: TIBStringField;
    IBQuery_MapaNOME: TIBStringField;
    IBQuery_MapaTIPO: TIBStringField;
    IBQuery_MapaSITUACAO: TIBStringField;
    IBQuery_MapaSITUACAO_CURSO: TIBStringField;
    IBQuery_MapaDATA_ENTRADA: TIBStringField;
    IBQuery_MapaDATA_SAIDA: TIBStringField;
    IBQuery_Curso: TIBQuery;
    Patentes1: TMenuItem;
    PopupMenu_TabelaHospedagem: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    N2: TMenuItem;
    IBQuery_Usuario: TIBQuery;
    IBQuery_Busca: TIBQuery;
    DSQ_Busca: TDataSource;
    Query_ExecSqlLocal: TIBQuery;
    IBQuery_ExecSqlServidor: TIBQuery;
    IBQuery_Executa: TIBQuery;
    IBTable_Apto_OcupadoPREDIO: TIBStringField;
    IBTable_Apto_OcupadoAPTO: TSmallintField;
    IBTable_Apto_OcupadoCAMA: TSmallintField;
    IBTable_Apto_OcupadoAPTCODIGO: TIBStringField;
    IBTable_Apto_OcupadoNOME: TIBStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure ManualOnLine1Click(Sender: TObject);
    procedure Oquefaz1Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure Patentes1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
  private
    { private declarations }
  public    { public declarations }
     Habilitado_Para: String;
  end;

var
  DM: TDM;

implementation

uses Manual_OnLine, Dicas_Utilizacao, Sobre, Divisas, Mostra_TabPreco,
  Mostra_TabPrecoResidente, Mostra_TabPrecoResidenteBaseAreaManaus;

{$R *.DFM}


procedure TDM.DataModuleCreate(Sender: TObject);
var
   arq: TextFile;
   VS_Versao, VS_Linha: String;
begin
   if FileExists('C:\DataBase_ICEA\DBHotel\servidor.cnf') = True then
   begin
      AssignFile ( arq, 'C:\DataBase_ICEA\DBHotel\servidor.cnf' );
      Reset ( arq );
      ReadLn ( arq, VS_Linha );
      ReadLn ( arq, VS_Versao );
      CloseFile ( arq );

      IBDatabase_Hotel.Connected:= False;
      IBDatabase_Hotel.DatabaseName:= VS_Linha;
      IBDatabase_Hotel.Connected:= True;

      if StrToint(Trim(VS_Versao)) = 1 then
         Habilitado_Para:= 'HOTEL CTA'
      else
         if StrToint(Trim(VS_Versao)) = 2 then
            Habilitado_Para:= 'BASE AREA MANAUS'
         else
            if StrToint(Trim(VS_Versao)) = 3 then
               Habilitado_Para:= 'NATAL'
            else
               if StrToint(Trim(VS_Versao)) = 4 then
                 Habilitado_Para:= 'CIAAR';

   end
   else
   begin
      MessageDlg('O arquivo Servidor.cnf não foi encontrado na pasta "C:\DataBase_ICEA\DBHotel" '+#13+'Este arquivo contém o endereço do Banco de Dados'+#13+#13+'Favor entrar em contato com o responsável',mtError, [mbOk],0);
      Application.terminate;
   end;
end;

//------------------------------------------------------------------------------
// Chamada para manual On-Line
//------------------------------------------------------------------------------

procedure TDM.ManualOnLine1Click(Sender: TObject);
begin
   Form_ManualOnLine.ShowModal;
end;

//------------------------------------------------------------------------------
//Chamada para o que faz o sistema
//------------------------------------------------------------------------------

procedure TDM.Oquefaz1Click(Sender: TObject);
begin
   Form_Dicas_Utilizacao.ShowModal;
end;

//------------------------------------------------------------------------------
// Chamada para modulo que mostra a versão do sistema
//------------------------------------------------------------------------------

procedure TDM.Sobre1Click(Sender: TObject);
begin
   Form_Sobre.ShowModal;
end;

//------------------------------------------------------------------------------
// Chamada para modulo dque mostra as patentes das forcas
//------------------------------------------------------------------------------

procedure TDM.Patentes1Click(Sender: TObject);
begin
   Form_Divisas.ShowModal;
end;

//------------------------------------------------------------------------------
// Tratamento Janela que mostra Tabela de Preco para hospede em transito
//------------------------------------------------------------------------------

procedure TDM.MenuItem1Click(Sender: TObject);
begin
   Form_MostraTabPreco.Show;
end;

//------------------------------------------------------------------------------
// Tratamento Janela que mostra Tabela de Preco para residente
//------------------------------------------------------------------------------

procedure TDM.MenuItem2Click(Sender: TObject);
begin
   if Habilitado_Para = 'HOTEL CTA' then
      Form_MostraTabPrecoResidente.Show
   else
      if Habilitado_Para = 'BASE AREA MANAUS' then
         Form_MostraTabPrecoResidenteBaseAereaManaus.Show
      else
        if Habilitado_Para = 'NATAL' then
            Form_MostraTabPrecoResidente.Show
end;

end.
