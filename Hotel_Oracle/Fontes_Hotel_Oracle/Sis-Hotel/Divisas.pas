unit Divisas;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Rotinas,
  StdCtrls, Forms, DBCtrls, DB, Buttons, ExtCtrls, jpeg, ComCtrls, ToolWin;

type
  TForm_Divisas = class(TForm)
    Image1: TImage;
    ToolBar2: TToolBar;
    ToolButton_Retornar: TToolButton;
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form_Divisas: TForm_Divisas;

implementation

{$R *.DFM}

procedure TForm_Divisas.ToolButton_RetornarClick(Sender: TObject);
begin
   Close
end;


procedure TForm_Divisas.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

end.