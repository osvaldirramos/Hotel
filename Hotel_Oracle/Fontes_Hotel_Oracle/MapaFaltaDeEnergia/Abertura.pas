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
  Grids, DBGrids;

type
  TForm_Abertura = class(TForm)
    Edit_Usuario: TEdit;
    Edit_Senha: TEdit;
    BitBtn_Retornar: TBitBtn;
    StatusBar_Abertura: TStatusBar;
    Label3: TLabel;
    Label4: TLabel;
    Table_Exclui_Reserva: TTable;
    BitBtn_Continuar: TBitBtn;
    Image_Hotel: TImage;
    procedure FormActivate(Sender: TObject);
    procedure Edit_UsuarioChange(Sender: TObject);
    procedure BitBtn_ContinuarClick(Sender: TObject);
    procedure BitBtn_RetornarClick(Sender: TObject);
    procedure Edit_UsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_SenhaKeyPress(Sender: TObject; var Key: Char);

    procedure Usuario_Nao_Encontrado;
  private    { Private declarations }
  public    { Public declarations }
     VS_Quem_Chamou: string;
     VI_Tentativas, VI_Opcao: integer;
  end;

var
  Form_Abertura: TForm_Abertura;

implementation

uses Recepcao;

{$R *.DFM}

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

procedure TForm_Abertura.BitBtn_ContinuarClick(Sender: TObject);
begin

   if ((Edit_Usuario.Text = 'HOTEL') and (Edit_Senha.Text = 'HOTEL')) then
   begin
      Form_Abertura.Enabled:= False;
      Form_MenuRecepcao.Show;
   end
   else
   begin
      MessageDlg('Este usuário não possui permissão para acessar o Sis-Hotel...',mtError, [mbOk],0);
      Usuario_Nao_Encontrado;
   end;
end;

//------------------------------------------------------------------------------
// Retorna para o WINDOWS 95
//------------------------------------------------------------------------------

procedure TForm_Abertura.BitBtn_RetornarClick(Sender: TObject);
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

procedure TForm_Abertura.Edit_SenhaKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 then
       BitBtn_Continuar.SetFocus;
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

end.
