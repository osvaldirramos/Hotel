unit Selecao_Reserva;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Rotinas,
  Dialogs, StdCtrls, Mask, JvToolEdit, ExtCtrls, ComCtrls, ToolWin, DB,
  Grids, DBGrids, DBTables;

type
  TForm_SelecaoReserva = class(TForm)
    ToolBar2: TToolBar;
    ToolButton_Imprimir: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    Panel1: TPanel;
    Label_Inicio: TLabel;
    Label_Final: TLabel;
    JvDateEdit_Inicio: TJvDateEdit;
    JvDateEdit_DataTermino: TJvDateEdit;
    Query_Reserva: TQuery;
    Query_ReservaDATAENTRADA: TDateTimeField;
    Query_ReservaNOME: TStringField;
    Query_ReservaNOME_GUERRA: TStringField;
    Query_ReservaPOSTO: TStringField;
    Query_ReservaDEPENDENTE_DE: TStringField;
    Query_ReservaTELEFONE_FUNCIONAL: TStringField;
    Query_ReservaSITUACAO_CURSO: TStringField;
    Query_ReservaOM_ORIGEM: TStringField;
    Query_ReservaDEPENDENTE: TFloatField;
    Query_ReservaDATASAIDA: TDateTimeField;
    Query_ReservaPREDIO: TStringField;
    Query_ReservaAPTO: TFloatField;
    DSQ_Reserva: TDataSource;
    CheckBox_Predio: TCheckBox;
    CheckBox_Nome: TCheckBox;
    CheckBox_Data: TCheckBox;
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_ImprimirClick(Sender: TObject);
    procedure CheckBox_PredioClick(Sender: TObject);
    procedure CheckBox_NomeClick(Sender: TObject);
    procedure CheckBox_DataClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_SelecaoReserva: TForm_SelecaoReserva;

implementation

uses Rel_Rela_Reserva;

{$R *.dfm}

procedure TForm_SelecaoReserva.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

procedure TForm_SelecaoReserva.ToolButton_RetornarClick(Sender: TObject);
begin
   Query_Reserva.Close;
   Close;
end;

procedure TForm_SelecaoReserva.ToolButton_ImprimirClick(Sender: TObject);
var
   VS_Comando, VS_OrderBy: String;
begin
   VS_OrderBy:= '';

   if ((JvDateEdit_Inicio.Text = '  /  /    ') and (JvDateEdit_DataTermino.Text = '  /  /    ')) Then
   begin
      VS_Comando:= 'Select * From reserva ';
   end
   else
   begin
      VS_Comando:= 'Select * '+
                   ' From reserva '+
                   ' where DataEntrada >= To_date('+#39+JvDateEdit_Inicio.Text+#39+', '+#39+'DD/MM/YYYY'+#39+')'+
                   ' and DataEntrada <= To_date('+#39+JvDateEdit_DataTermino.Text+#39+', '+#39+'DD/MM/YYYY'+#39+')';
   end;

   if CheckBox_Predio.Checked = True then
      VS_OrderBy:= 'order by Predio, Apto ';

   if CheckBox_Nome.Checked = True then
      VS_OrderBy:= 'order by nome ';

   if CheckBox_Data.Checked = True then
      VS_OrderBy:= 'order by To_date(DataEntrada) ';

   Query_Reserva.Close;
   Query_Reserva.Sql.Clear;
   Query_Reserva.Sql.Add(VS_Comando+VS_OrderBy);
   Query_Reserva.Open;

   QRListForm_Rel_Reserva.Preview;
end;

procedure TForm_SelecaoReserva.CheckBox_PredioClick(Sender: TObject);
begin
   if CheckBox_Predio.Checked = True then
   begin
      CheckBox_Nome.Checked:= False;
      CheckBox_Data.Checked:= False;
   end;
end;

procedure TForm_SelecaoReserva.CheckBox_NomeClick(Sender: TObject);
begin
   if CheckBox_Nome.Checked = True then
   begin
      CheckBox_Predio.Checked:= False;
      CheckBox_Data.Checked:= False;
   end;
end;

procedure TForm_SelecaoReserva.CheckBox_DataClick(Sender: TObject);
begin
   if CheckBox_Data.Checked = True then
   begin
      CheckBox_Predio.Checked:= False;
      CheckBox_Nome.Checked:= False;
   end;
end;

end.
