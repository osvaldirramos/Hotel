//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Abertura.PAS                                   //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade montar a Tela de    //
//                             Abertura do Sistema pedindo o Nome do Usua-    //
//                             rio e a senha.                                 //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 11/02/1999                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Abertura;

//----------------------------------------------------------------------------//
// Definição dos prototypes                                                   //
//----------------------------------------------------------------------------//

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, ComCtrls, Db, Menus, Rotinas,
  Grids, DBGrids, Mask, JvComponent, JvxCtrls, ToolWin, ImgList, JvGradient,
  jpeg, IBCustomDataSet, IBTable;

type
  TForm_Abertura = class(TForm)
    StatusBar_Abertura: TStatusBar;
    JvGradient1: TJvGradient;
    JvxLabel1: TJvxLabel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit_Usuario: TMaskEdit;
    Edit_Senha: TMaskEdit;
    Panel1: TPanel;
    JvxLabel2: TJvxLabel;
    Image_Brasao: TImage;
    Image_Hotel: TImage;
    IBTable_Exclui_Reserva: TIBTable;
    ToolBar_BotoesIniciais: TToolBar;
    ToolButton_MenuPrincipal: TToolButton;
    ToolButton2: TToolButton;
    ToolButton_Windows: TToolButton;
    procedure FormActivate(Sender: TObject);
    procedure Edit_UsuarioChange(Sender: TObject);
    procedure Edit_UsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_SenhaKeyPress(Sender: TObject; var Key: Char);

    procedure Limpa_Reserva;
    procedure Usuario_Nao_Encontrado;
    procedure FormCreate(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton_MenuPrincipalClick(Sender: TObject);
  private    { Private declarations }
  public    { Public declarations }
     VS_Quem_Chamou: string;
     VI_Tentativas, VI_Opcao: integer;
  end;

var
  Form_Abertura: TForm_Abertura;

implementation

uses Recepcao, Module, Menu_Principal;

{$R *.DFM}

//------------------------------------------------------------------------------
// Modulo Principal
//------------------------------------------------------------------------------


procedure TForm_Abertura.FormCreate(Sender: TObject);
begin
//   Funcoes.SetManualAjuda('C:\DataBase_ICEA\Ensino\Manual_Usuario.htM');
   Form_Abertura.Caption:= 'Sistema do Hotel - ICEA - Versão '+Versao;
end;

//------------------------------------------------------------------------------
// Modulo Principal
//------------------------------------------------------------------------------

procedure TForm_Abertura.FormActivate(Sender: TObject);
var
   DataAtual, InicioT, TerminoT, InicioA, TerminoA: TDate;
   Ano, Mes, Dia : word;
begin
   Image_Brasao.Picture.LoadFromFile('C:\DataBase_ICEA\DBHotel\Brasao.jpg');
   VI_Tentativas:= 1;

   if DM.Habilitado_Para = 'NATAL' then
   begin
      DataAtual:= date;
      DecodeDate (DataAtual, Ano, Mes, Dia);

      InicioT:= StrToDate('01/12/'+FormatFloat('00', Ano));
      TerminoT:= StrToDate('01/03/'+FormatFloat('00', Ano));
//      if (mes = 1) or(mes = 2) then
//         TerminoT:= StrToDate('28/02/'+FormatFloat('00', Ano))
//      else
//         TerminoT:= StrToDate('28/02/'+FormatFloat('00', Ano+1));
//      DecodeDate (TerminoT, Ano, Mes, Dia);
//      TerminoT := EnCodeDate (Ano, Mes, Dia);

      InicioA:= InicioT - 3;
      TerminoA:= TerminoT - 3;

      if ((DataAtual >= InicioA) and (DataAtual <= InicioT)) then
         ShowMessage(' Ajustar a Tabela de preço para Alta Temporada, apartir do dia '+DateToStr(InicioT))
      else
         if ((DataAtual >= TerminoA) and (DataAtual <= TerminoT)) then
            ShowMessage(' Ajustar a Tabela de preço para Baixa Temporada, apartir do dia '+DateToStr(TerminoT));
   end;
end;

//------------------------------------------------------------------------------
// Verifica se o Usuario existe, Caso usuario existir chama o Menu Principal
//------------------------------------------------------------------------------

procedure TForm_Abertura.ToolButton_MenuPrincipalClick(Sender: TObject);
var
   Status: Boolean;
begin
   if ((Edit_Usuario.Text = 'HOTEL') and (Edit_Senha.Text = 'HOTEL')) then
   begin
      Funcoes.SetMenuSoldado(False);
      Form_Abertura.Enabled:= False;
      Limpa_Reserva;
      Funcoes.SetUsuario('HOTEL');
      Funcoes.Log_Recepcao('R-Inicio');
      Form_MenuRecepcao.ShowModal;
   end
   else
   begin
      Status:= Funcoes.Busca_Usuario(Edit_Usuario.Text, Edit_Senha.Text);

      if Status = False then
      begin
         Usuario_Nao_Encontrado;
      end
      else
      begin
         Funcoes.SetUsuario(Edit_Usuario.Text);
         Funcoes.SetPrivilegio(DM.IBQuery_Usuario.FieldByName('privilegio').AsString);
         if ((Funcoes.GetPrivilegio = 'G') or (Funcoes.GetPrivilegio = 'U')) then
         begin
            Form_Abertura.Enabled:= False;
            Limpa_Reserva;
            Funcoes.SetLogHotel('OUTROS');   // Seta a utilizacao do Log
            Funcoes.Log_Recepcao('G-Iniciar');
            VS_Entrada:= TimeToStr(Time);

            Form_Menu_Pri_G.ShowModal;
         end
         else
         begin
            MessageDlg('Este usuário não possui permissão para acessar o Sis-Hotel...',mtError, [mbOk],0);
            Usuario_Nao_Encontrado;
         end;
      end;
   end;
end;

//------------------------------------------------------------------------------
// Retorna para o WINDOWS 95
//------------------------------------------------------------------------------

procedure TForm_Abertura.ToolButton_WindowsClick(Sender: TObject);
begin
   Application.Terminate;
end;

//------------------------------------------------------------------------------
// Trata da entrada do usuario habilitando a senha
//------------------------------------------------------------------------------

procedure TForm_Abertura.Edit_UsuarioChange(Sender: TObject);
begin
    Edit_Senha.Enabled:= true;
end;

//------------------------------------------------------------------------------
// Verifica se a tecla <ENTER>, na entrada do usuário
//------------------------------------------------------------------------------

procedure TForm_Abertura.Edit_UsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 then
       Edit_Senha.SetFocus;
end;

//------------------------------------------------------------------------------
// Verifica se a tecla <ENTER>, na entrada da senha
//------------------------------------------------------------------------------

procedure TForm_Abertura.Edit_SenhaKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 then
      ToolButton_MenuPrincipalClick(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento quando o usuario não foi encontrado
//------------------------------------------------------------------------------

procedure TForm_Abertura.Usuario_Nao_Encontrado;
begin
   Edit_Usuario.Text:= '';
   Edit_Senha.Text:= '';
   VI_Tentativas:= VI_Tentativas + 1;
   if VI_Tentativas > 3 then
      Application.Terminate
   else
      Edit_Usuario.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento para eliminar as reservas passadas
//------------------------------------------------------------------------------

procedure TForm_Abertura.Limpa_Reserva;
var
   VS_Data: String;
begin
   DM.IBQuery_Executa.Close;
   DM.IBQuery_Executa.Sql.Clear;
   DM.IBQuery_Executa.Sql.Add('select Cast('+#39+'now'+#39+' as timestamp) as AGORA from rdb$database ');
   DM.IBQuery_Executa.Open;

   VS_Data:= Copy(DM.IBQuery_Executa.FieldByName('Agora').AsString,1,10);
   VS_Data:= Funcoes.DePara(DateToStr(StrToDate(VS_Data)-2), '/', '.');
   VS_Data:= VS_Data+' 00:00';

   IBTable_Exclui_Reserva.Open;
   IBTable_Exclui_Reserva.Filter:= 'DataEntrada <= '+#39+VS_Data+#39;
   IBTable_Exclui_Reserva.First;

   While not IBTable_Exclui_Reserva.eof do
      IBTable_Exclui_Reserva.Delete;
   DM.IBTransaction_Hotel.CommitRetaining;
   IBTable_Exclui_Reserva.Close;
end;
end.
