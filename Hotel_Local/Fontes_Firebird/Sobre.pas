//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : BDE2005                                        //
//                                                                            //
// PROGRAMA                  : Sobre.PAS                                      //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de mostrar a versão //
//                             do sistema.                                    //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 18/07/2005                                     //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Sobre;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Rotinas, JvGradient, jpeg;

type
  TForm_Sobre = class(TForm)
    JvGradient1: TJvGradient;
    Version: TLabel;
    Label_Versao: TLabel;
    Label2: TLabel;
    Label_Data: TLabel;
    Copyright: TLabel;
    Label3: TLabel;
    Label_DescInstituto: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton_Retornar: TSpeedButton;
    Image2: TImage;
    Image_Hotel: TImage;
    Label1: TLabel;
    Label_Unidade: TLabel;
    procedure SpeedButton_RetornarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form_Sobre: TForm_Sobre;

implementation

uses Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure principal
//------------------------------------------------------------------------------

procedure TForm_Sobre.FormActivate(Sender: TObject);
begin
   if DM.Habilitado_Para = 'HOTEL CTA' then
      Label_Unidade.Caption:= 'Esta versão visa atender ao Hotel de Trânsito dos Oficiais do CTA '
   else
      if DM.Habilitado_Para = 'BASE AREA MANAUS' then
         Label_Unidade.Caption:= 'Esta versão visa atender ao Hotel de Trânsito da Base Aérea de Manaus '
      else
         if DM.Habilitado_Para = 'BASE AREA MANAUS' then
            Label_Unidade.Caption:= 'Esta versão visa atender ao Hotel de Trânsito do CLBI ';

   if FileExists('C:\DataBase_ICEA\Ensino\Brasao_Ensino.jpg') = True then
      Image2.Picture.LoadFromFile('C:\DataBase_ICEA\DBHotel\Brasao.jpg');

   label_Data.Caption:= Ultima_Atualizacao;
   Label_Versao.Caption:= Versao;
end;

//------------------------------------------------------------------------------
// Retorna para o Menu Principal
//------------------------------------------------------------------------------

procedure TForm_Sobre.SpeedButton_RetornarClick(Sender: TObject);
begin
   Close;
end;
procedure TForm_Sobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

end.

