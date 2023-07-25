//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Splash.PAS                                      //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade mostrar a abertura  //
//                             do sistema                                     //
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

unit Splash;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Rotinas,
  Forms, Dialogs, StdCtrls, ExtCtrls, ComCtrls, jpeg, JvGradient;

type
  TSplashForm = class(TForm)
    JvGradient1: TJvGradient;
    Label_Versao: TLabel;
    Label_UltimaAtualizacao: TLabel;
    Label3: TLabel;
    Label_DescInstituto: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Image_Hotel: TImage;
    Label_MSG: TStaticText;
    ProgressBar1: TProgressBar;
    procedure FormActivate(Sender: TObject);
  end;

var
  SplashForm: TSplashForm;

implementation

{$R *.DFM}

//----------------------------------------------------------------------------//
// Procedure principal
//----------------------------------------------------------------------------//

procedure TSplashForm.FormActivate(Sender: TObject);
begin
   Label_UltimaAtualizacao.Caption:= 'Data da última atualização: '+Ultima_Atualizacao;
   Label_Versao.Caption:= 'Versão: '+Versao;
end;

end.
