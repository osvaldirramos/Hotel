//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Recepcao.PAS                                   //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de montar o menu    //
//                             que sera utilizado pelo pessoal da recepcao.   //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 12/03/2008                                     //
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

unit Recepcao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBTable, ExtCtrls, Grids, DBGrids, IBQuery,
  StdCtrls, DBCtrls, ComCtrls, Mask, Buttons, JvGradient, JvComponent,
  JvxClock, jpeg, ToolWin, DBTables;

type
  TForm_MenuRecepcao = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar2: TToolBar;
    ToolButton_Windows: TToolButton;
    JvxClock1: TJvxClock;
    GroupBox_Principal: TGroupBox;
    SpeedButton_Atualiza_Mapa: TSpeedButton;
    Label1: TLabel;
    Label4: TLabel;
    MaskEdit1: TMaskEdit;
    ComboBox1: TComboBox;
    DBGrid_Mapa: TDBGrid;
    IBQuery_Mapa: TIBQuery;
    DSQ_Mapa: TDataSource;
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

    procedure FormActivate(Sender: TObject);
    procedure SpeedButton_Atualiza_MapaClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
  private    { Private declarations }
      Ma_Dia: array[1..31] of String ;
      Ma_Tipo: array[1..31] of String ;
      VI_Codigo, VI_Tentativas, VI_Opcao: integer;

      VI_AnoSelecionado, VI_MesSelecionado: Integer;
  public    { Public declarations }
  end;

var
  Form_MenuRecepcao: TForm_MenuRecepcao;

implementation


{$R *.dfm}

procedure TForm_MenuRecepcao.FormActivate(Sender: TObject);
begin
//   SpeedButton_Atualiza_MapaClick(Sender);
end;


//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_MenuRecepcao.ToolButton_WindowsClick(Sender: TObject);
begin
   Close;
end;


procedure TForm_MenuRecepcao.SpeedButton_Atualiza_MapaClick(Sender: TObject);
var
   VS_Comando: String;
   VB_Where: Boolean;
begin
   VB_Where:= False;
   VS_Comando:= 'select * from mapa ';

   if ComboBox1.Text <> 'Todos' then
   begin
      if VB_Where = False then
         VS_Comando:= VS_Comando+' where Predio = '+#39+ComboBox1.Text+#39
      else
         VS_Comando:= VS_Comando+' and Predio = '+#39+ComboBox1.Text+#39;
      VB_Where:= True;
   end;

   if trim(MaskEdit1.Text) <> '' then
   begin
      if VB_Where = False then
         VS_Comando:= VS_Comando+' where nome like '+#39+MaskEdit1.Text+'%'+#39
      else
         VS_Comando:= VS_Comando+' and nome like '+#39+'%'+MaskEdit1.Text+'%'+#39;
      VB_Where:= True;
   end;
   VS_Comando:= VS_Comando+' Order By Predio, apto, cama';

   IBQuery_Mapa.Close;
   IBQuery_Mapa.Sql.Clear;
   IBQuery_Mapa.Sql.Add(VS_Comando);
   IBQuery_Mapa.Open;
end;

end.

