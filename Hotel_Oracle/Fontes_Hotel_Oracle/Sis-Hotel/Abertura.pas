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
  ExtCtrls, StdCtrls, Buttons, ComCtrls, Db, DBTables, Menus, Rotinas,
  Grids, DBGrids, Mask, JvComponent, JvxCtrls, ToolWin, ImgList, JvGradient,
  jpeg;

type
  TForm_Abertura = class(TForm)
    StatusBar_Abertura: TStatusBar;
    Table_Exclui_Reserva: TTable;
    JvGradient1: TJvGradient;
    JvxLabel1: TJvxLabel;
    JvxLabel2: TJvxLabel;
    Image_Hotel: TImage;
    ToolBar_BotoesIniciais: TToolBar;
    ToolButton_MenuPrincipal: TToolButton;
    ToolButton2: TToolButton;
    ToolButton_Windows: TToolButton;
    Label1: TLabel;
    Edit_Usuario: TMaskEdit;
    Label2: TLabel;
    Edit_Senha: TMaskEdit;
    procedure FormActivate(Sender: TObject);
    procedure Edit_UsuarioChange(Sender: TObject);
    procedure Edit_UsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_SenhaKeyPress(Sender: TObject; var Key: Char);

    procedure Limpa_Reserva;
    procedure Usuario_Nao_Encontrado;
    procedure FormCreate(Sender: TObject);
    procedure ToolButton_MenuPrincipalClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
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
   Form_Abertura.Caption:= 'Sistema do Hotel - ICEA - Versão '+Versao;
end;

//------------------------------------------------------------------------------
// Modulo Principal
//------------------------------------------------------------------------------

procedure TForm_Abertura.FormActivate(Sender: TObject);
var
   arq: TextFile;
   VS_Versao: String;
begin
   VI_Tentativas:= 1;

   if FileExists('C:\DataBase_ICEA\DB_HotelMapa\Versao.cnf') = True then
   begin
      AssignFile ( arq, 'C:\DataBase_ICEA\DB_HotelMapa\Versao.cnf' );
      Reset ( arq );
      ReadLn ( arq, VS_Versao );
      CloseFile ( arq );

      if VS_Versao = 'RECEPÇÃO' then
      begin
         Funcoes.SetMenuSoldado(False);
         Form_Abertura.Enabled:= False;
         Limpa_Reserva;
         Funcoes.SetUsuario('HOTEL');
         Form_MenuRecepcao.ShowModal;
      end;
   end
   else
   begin
      MessageDlg('O arquivo Versao.cnf não foi encontrado na pasta "C:\DataBase_ICEA\DB_HotelMapa" '+#13+'Este arquivo contém o endereço do Banco de Dados'+#13+#13+'Favor entrar em contato com o responsável',mtError, [mbOk],0);
      Application.terminate;
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
         Funcoes.SetPrivilegio(DM.Query_Usuario.FieldByName('privilegio').AsString);
         if ((Funcoes.GetPrivilegio = 'G') or (Funcoes.GetPrivilegio = 'U') or (Funcoes.GetPrivilegio = 'N')) then
         begin
            Form_Abertura.Enabled:= False;
            Limpa_Reserva;
            Funcoes.SetLogHotel('OUTROS');   // Seta a utilizacao do Log
            Funcoes.Log_Recepcao('Logou no Sistema');
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
// Retorna para o WINDOWS
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
begin
   Table_Exclui_Reserva.Open;
   Table_Exclui_Reserva.Filter:= 'DataEntrada <= '+#39+DateToStr(Date-2)+#39;
   Table_Exclui_Reserva.First;

   While not Table_Exclui_Reserva.eof do
      Table_Exclui_Reserva.Delete;
   Table_Exclui_Reserva.Close;
end;
end.
