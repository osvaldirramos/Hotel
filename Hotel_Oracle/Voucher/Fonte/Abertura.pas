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
  ExtCtrls, StdCtrls, Buttons, ComCtrls, Db, DBTables, Menus,
  Grids, DBGrids, Mask, JvComponent, JvxCtrls, ToolWin, ImgList, JvGradient,
  jpeg;

type
  TForm_Abertura = class(TForm)
    StatusBar_Abertura: TStatusBar;
    Table_Exclui_Reserva: TTable;
    JvGradient1: TJvGradient;
    JvxLabel1: TJvxLabel;
    Panel3: TPanel;
    Edit_Usuario: TMaskEdit;
    Edit_Senha: TMaskEdit;
    Panel1: TPanel;
    JvxLabel2: TJvxLabel;
    Image_Hotel: TImage;
    ToolBar_BotoesIniciais: TToolBar;
    ToolButton_MenuPrincipal: TToolButton;
    ToolButton2: TToolButton;
    ToolButton_Windows: TToolButton;
    JvGradient2: TJvGradient;
    Label2: TLabel;
    Label1: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure Edit_UsuarioChange(Sender: TObject);
    procedure Edit_UsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_SenhaKeyPress(Sender: TObject; var Key: Char);

    Function Busca_Usuario(VS_Usuario, VS_Senha: String): Boolean;
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

uses Module, Consulta_Voucher;

{$R *.DFM}

//------------------------------------------------------------------------------
// Modulo Principal
//------------------------------------------------------------------------------


procedure TForm_Abertura.FormCreate(Sender: TObject);
begin
   Form_Abertura.Caption:= 'Sistema do Hotel (Voucher) - ICEA - Versão 1.00';;
end;

//------------------------------------------------------------------------------
// Modulo Principal
//------------------------------------------------------------------------------

procedure TForm_Abertura.FormActivate(Sender: TObject);
begin
   VI_Tentativas:= 1;
end;

//------------------------------------------------------------------------------
// Verifica se o Usuario existe, Caso usuario existir chama o Menu Principal
//------------------------------------------------------------------------------

procedure TForm_Abertura.ToolButton_MenuPrincipalClick(Sender: TObject);
var
   Status: Boolean;
begin
   Status:= Busca_Usuario(Edit_Usuario.Text, Edit_Senha.Text);

   if Status = False then
   begin
      Usuario_Nao_Encontrado;
   end
   else
   begin
      if ((DM.Query_Usuario.FieldByName('privilegio').AsString = 'G') or (DM.Query_Usuario.FieldByName('privilegio').AsString = 'V')) then
      begin
         Form_Abertura.Enabled:= False;
         Form_Con_Voucher.ShowModal;
      end
      else
      begin
         MessageDlg('Este usuário não possui permissão para acessar o Sis-Hotel...',mtError, [mbOk],0);
         Usuario_Nao_Encontrado;
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
   Table_Exclui_Reserva.Filter:= 'DataEntrada <= '+#39+DateToStr(Date-5)+#39;
   Table_Exclui_Reserva.First;

   While not Table_Exclui_Reserva.eof do
      Table_Exclui_Reserva.Delete;
   Table_Exclui_Reserva.Close;
end;
//------------------------------------------------------------------------------
// Esta funcao tem a finalidade de extrair um periodo entre duas datas
//------------------------------------------------------------------------------

Function TForm_Abertura.Busca_Usuario(VS_Usuario, VS_Senha: String): Boolean;
Var
   VS_Comando: String;
   Status: Boolean;
begin
   Status:= False;
   if Trim(VS_Usuario) = '' then
      MessageDlg('O nome do usuário não pode ser branco...',mtError, [mbOk],0)
   else
   begin
      if Trim(VS_Senha) = '' then
         MessageDlg('A senha do usuário não pode ser branco...',mtError, [mbOk],0)
      else
      begin
         VS_Comando:= 'Select * from Hotel_Usuario where Usuario = '+#39+VS_Usuario+#39+' and senha = '+#39+VS_Senha+#39;

         DM.Query_Usuario.Close;
         DM.Query_Usuario.Sql.Clear;
         DM.Query_Usuario.Sql.Add(VS_Comando);
         DM.Query_Usuario.Open;

         if DM.Query_Usuario.RecordCount = 0 then
             MessageDlg('Usuário não foi Cadastrado...',mtError, [mbOk],0)
         else
            Status:= True;
      end;
   end;

   Busca_Usuario:= Status;
end;
end.
