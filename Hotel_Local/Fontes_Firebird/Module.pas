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
//    5 = 'UNIFA'
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
    IBTable_LogHotel: TIBTable;
    IBTable_Verifica: TIBTable;
    IBTable_VerificaVUSUARIO: TIBStringField;
    IBTable_VerificaVDATA: TDateTimeField;
    IBTable_VerificaVHORAENTRADA: TIBStringField;
    IBTable_VerificaVHORASAIDA: TIBStringField;
    PopupMenu_Ajuda: TPopupMenu;
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
    ImageList_Principal: TImageList;
    IBDatabase_Hotel: TIBDatabase;
    IBTransaction_Hotel: TIBTransaction;

    procedure SetaServidor(P_Endereco: String);
    procedure DataModuleCreate(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure Patentes1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
  private    { Private declarations }
     arq: TextFile;
     VS_Secao, VS_Linha: String;
  public    { public declarations }
     Habilitado_Para: String;
  end;

var
  DM: TDM;

implementation

uses Sobre, Divisas, Mostra_TabPreco,
  Mostra_TabPrecoResidenteBaseAreaManaus, Mostra_TabPrecoResidente;

{$R *.DFM}


//------------------------------------------------------------------------------
// Tratamento quando o DataModule esta sendo criado
//------------------------------------------------------------------------------

procedure TDM.DataModuleCreate(Sender: TObject);
begin
   if FileExists('C:\DataBase_ICEA\DBHotel\servidor.cnf') = True then
   begin
      SetaServidor('C:\DataBase_ICEA\DBHotel\servidor.cnf');
   end
   else
   begin
      if FileExists('servidor.cnf') = True then
      begin
         SetaServidor('servidor.cnf');
      end
      else
      begin
         MessageDlg('O arquivo "Servidor.cnf" não foi encontrado na pasta "C:\DataBase_ICEA\DBHotel" '+#13+'Este arquivo contém o endereço do Banco de Dados'+#13+#13+'Favor entrar em contato com o responsável',mtError, [mbOk],0);
         Application.terminate;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Tratamento para setar o Servidor
//------------------------------------------------------------------------------

procedure TDM.SetaServidor(P_Endereco: String);
var
   VS_EndServidor, VS_ServidorBC: String;
begin
    VS_ServidorBC:= '';
    AssignFile ( arq, P_Endereco );
    Reset ( arq );
    ReadLn ( arq, VS_Linha );
    ReadLn ( arq, VS_Secao );
    CloseFile ( arq );

    VS_EndServidor:= VS_Linha;
//    Funcoes.
    IBDatabase_Hotel.Connected:= False;
    IBDatabase_Hotel.DatabaseName:= VS_EndServidor+VS_ServidorBC;
    IBDatabase_Hotel.Connected:= True;

    if VS_Secao  = '1' then
       Habilitado_Para:= 'HOTEL CTA'
    else
       if VS_Secao  = '2' then
           Habilitado_Para:= 'BASE AREA MANAUS'
       else
          if VS_Secao  = '3' then
              Habilitado_Para:= 'NATAL'
          else
             if VS_Secao  = '4' then
                Habilitado_Para:= 'CIAAR'
             else
                if VS_Secao  = '5' then
                   Habilitado_Para:= 'UNIFA';
end;

//------------------------------------------------------------------------------
// Chamada para modulo que mostra a versão do sistema
//------------------------------------------------------------------------------

procedure TDM.Sobre1Click(Sender: TObject);
begin
   Application.CreateForm(TForm_Sobre, Form_Sobre);
   Form_Sobre.ShowModal;
end;

//------------------------------------------------------------------------------
// Chamada para modulo dque mostra as patentes das forcas
//------------------------------------------------------------------------------

procedure TDM.Patentes1Click(Sender: TObject);
begin
   Application.CreateForm(TForm_Divisas, Form_Divisas);
   Form_Divisas.ShowModal;
end;

//------------------------------------------------------------------------------
// Tratamento Janela que mostra Tabela de Preco para hospede em transito
//------------------------------------------------------------------------------

procedure TDM.MenuItem1Click(Sender: TObject);
begin
   Application.CreateForm(TForm_MostraTabPreco, Form_MostraTabPreco);
   Form_MostraTabPreco.Show;
end;

//------------------------------------------------------------------------------
// Tratamento Janela que mostra Tabela de Preco para residente
//------------------------------------------------------------------------------

procedure TDM.MenuItem2Click(Sender: TObject);
begin
   if Habilitado_Para = 'BASE AREA MANAUS' then
   begin
      Application.CreateForm(TForm_MostraTabPrecoResidenteBaseAereaManaus, Form_MostraTabPrecoResidenteBaseAereaManaus);
      Form_MostraTabPrecoResidenteBaseAereaManaus.Show;
   end
   else
   begin
      Application.CreateForm(TForm_MostraTabPrecoResidente, Form_MostraTabPrecoResidente);
      Form_MostraTabPrecoResidente.Show
   end;
end;

end.
