//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : ASEA 2005                                      //
//                                                                            //
// PROGRAMA                  : Avaliacao.PAS                                  //
//                                                                            //
// DESCRICAO                 : Este modulo tem a funcao de tratar do cadastro //
//                             da avaliacao.                                  //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Maj Sônia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 20/02/2006                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Manual_OnLine;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, Menus, StdCtrls, ComCtrls, ToolWin, ExtCtrls, ClipBrd,
  ValEdit, Buttons, Grids, DBCtrls, JvRichEd, JvComponent, JvxClock,
  JvColorCombo, JvCombobox, JvBaseThumbnail, JvThumbImage, Rotinas, JvDlg,
  JvBalloonHint, JvEnterTab, JvGrdCpt, DB, IBCustomDataSet,
  JvClock, DBGrids, JvDBRichEd, Mask, JvGradient, HTTPApp, HTTPProd,
  OleCtrls, SHDocVw;

type
  TForm_ManualOnLine = class(TForm)
    PrintDialog1: TPrintDialog;
    ToolBar_BotoesIniciais: TToolBar;
    ToolButton_Separator1: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    Panel4: TPanel;
    WebBrowser_Fig: TWebBrowser;
    PageProducer_Fig: TPageProducer;
    ToolButton_Relatorio: TToolButton;
    ToolButton1: TToolButton;

    procedure FormActivate(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure WBPrintPageSetup(WB: TWebBrowser) ;
    procedure WBPrintPreview(WB: TWebBrowser) ;
    procedure WBPrintWithDialog(WB: TWebBrowser) ;
    procedure WBPrintNoDialog(WB: TWebBrowser) ;
    procedure ToolButton_RelatorioClick(Sender: TObject);
  private    { Private declarations }
  public    { Public declarations }
  end;
var
  Form_ManualOnLine: TForm_ManualOnLine;

implementation

uses Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_ManualOnLine.FormActivate(Sender: TObject);
begin
   try
     // Monta o Indice, para isso Le o arquivo de Indice

     if FileExists(Funcoes.GetManualAjuda) then
     begin
        PageProducer_Fig.htmlFile:= Funcoes.GetManualAjuda;
        WebBrowser_Fig.Navigate(PageProducer_Fig.htmlFile);     end
     else
     begin
        Showmessage('Não foi possível montar o ajuda'+#13+'não foi encontrato o arquivo '+Funcoes.GetManualAjuda);
        Close;
     end;

   except
     Showmessage('Problema ao abrir o Manual On-Line '+Funcoes.GetManualAjuda);
     Close;
   end;
end;


//------------------------------------------------------------------------------
// Retorna para tela anterior
//------------------------------------------------------------------------------

procedure TForm_ManualOnLine.ToolButton_RetornarClick(Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Retorna para Windows
//------------------------------------------------------------------------------

procedure TForm_ManualOnLine.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

{ Imprime diretamente, sem a tela de impressão }

procedure TForm_ManualOnLine.WBPrintNoDialog(WB: TWebBrowser) ;
var
  vIn, vOut: OleVariant;
begin
  WB.ControlInterface.ExecWB(OLECMDID_PRINT,
    OLECMDEXECOPT_DONTPROMPTUSER, vIn, vOut);
end;


{ Abre a tela de impressão }

procedure TForm_ManualOnLine.WBPrintWithDialog(WB: TWebBrowser) ;
var
  vIn, vOut: OleVariant;
begin
  WB.ControlInterface.ExecWB(OLECMDID_PRINT,
    OLECMDEXECOPT_PROMPTUSER, vIn, vOut) ;
end;

{ Pré-visualização da impressão }

procedure TForm_ManualOnLine.WBPrintPreview(WB: TWebBrowser) ;
var
  vIn, vOut: OleVariant;
begin
  WB.ControlInterface.ExecWB(OLECMDID_PRINTPREVIEW,
    OLECMDEXECOPT_DONTPROMPTUSER, vIn, vOut) ;
end;

{ Abre a tela de configuração da página }

procedure TForm_ManualOnLine.WBPrintPageSetup(WB: TWebBrowser) ;
var
  vIn, vOut: OleVariant;
begin
  WB.ControlInterface.ExecWB(OLECMDID_PAGESETUP,
    OLECMDEXECOPT_PROMPTUSER, vIn, vOut) ;
end;

procedure TForm_ManualOnLine.ToolButton_RelatorioClick(Sender: TObject);
begin
   WBPrintPreview(WebBrowser_Fig);
end;

end.
