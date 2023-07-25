unit Seleciona_BD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TForm_Seleciona_Banco = class(TForm)
    RadioGroup_BD: TRadioGroup;
    BitBtn_Retornar: TBitBtn;
    StatusBar_Abertura: TStatusBar;
    procedure BitBtn_RetornarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public    { Public declarations }
     Opcao_Anterior: Integer;
  end;

var
  Form_Seleciona_Banco: TForm_Seleciona_Banco;

implementation

uses Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Modulo Principal
//------------------------------------------------------------------------------

procedure TForm_Seleciona_Banco.FormActivate(Sender: TObject);
begin
   Opcao_Anterior:= RadioGroup_BD.ItemIndex;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Seleciona_Banco.BitBtn_RetornarClick(Sender: TObject);
begin
   if Opcao_anterior <> RadioGroup_BD.ItemIndex then
   begin
      if RadioGroup_BD.ItemIndex = 0 then
      begin
         dm.Database_HTL.Connected:= False;

         with dm.Database_HTL do
         begin
            AliasName := 'Hotel';
            Params.Values['USER'] := 'hotel';
            Params.Values['PASSWORD'] := 'ipvhtl';
         end;
         dm.Database_HTL.Connected:= False;
      end
      else
      begin
         dm.Database_HTL.Connected:= False;

         with dm.Database_HTL do
         begin
            AliasName := 'Hotel_Prod';
            Params.Values['USER'] := 'xhotel';
            Params.Values['PASSWORD'] := 'ipvhtl';
         end;
         dm.Database_HTL.Connected:= False;
      end;
   end;
   close;
end;
end.
