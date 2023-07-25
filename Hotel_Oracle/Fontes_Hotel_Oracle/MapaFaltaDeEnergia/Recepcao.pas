//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Recepcao.PAS                                   //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de montar o menu    //
//                             que sera utilizado pelo pessoal da recepcao.   //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 12/03/2008                                     //
//                                                                            //
// ATUALIZADO                :                                                //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Recepcao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBTable, ExtCtrls, Grids, DBGrids, IBQuery,
  StdCtrls, DBCtrls, ComCtrls, Mask, Buttons, JvGradient, JvComponent,
  JvxClock, jpeg, ToolWin, DBTables, Rotinas;

type
  TForm_MenuRecepcao = class(TForm)
    IBQuery_Delete_Mapa: TIBQuery;
    IBQuery_Mapa: TIBQuery;
    IBTable_Hotel: TIBTable;
    DSQ_Mapa: TDataSource;
    IBQuery_MapaIDENTIDADE: TIBStringField;
    IBQuery_MapaPREDIO: TIBStringField;
    IBQuery_MapaAPTO: TIntegerField;
    IBQuery_MapaCAMA: TIntegerField;
    IBQuery_MapaRAMAL: TIBStringField;
    IBQuery_MapaNOME: TIBStringField;
    IBQuery_MapaTIPO: TIBStringField;
    IBQuery_MapaSITUACAO: TIBStringField;
    IBQuery_MapaSITUACAO_CURSO: TIBStringField;
    IBQuery_MapaDATA_ENTRADA: TIBStringField;
    IBQuery_MapaDATA_SAIDA: TIBStringField;
    Panel_Tela01: TPanel;
    Panel_Brasao: TPanel;
    Image_Hotel: TImage;
    Panel4: TPanel;
    vv: TJvGradient;
    Bevel2: TBevel;
    SpeedButton_Atualizar: TSpeedButton;
    Label18: TLabel;
    Label19: TLabel;
    Label_Predio: TLabel;
    Label5: TLabel;
    MaskEdit_Ramal: TMaskEdit;
    MaskEdit_Busca_Nome_Completo: TMaskEdit;
    MaskEdit_Nome_Guerra: TMaskEdit;
    ComboBox_Predio: TComboBox;
    IBQuery_MapaCODIGO: TIBStringField;
    Panel25: TPanel;
    DBGrid_Visao: TDBGrid;
    DBGrid_Mapa: TDBGrid;
    Panel3: TPanel;
    Panel_Legenda: TPanel;
    Label8: TLabel;
    Panel_LegVerde: TPanel;
    Panel13: TPanel;
    Panel18: TPanel;
    Panel21: TPanel;
    Panel45: TPanel;
    Panel47: TPanel;
    Panel14: TPanel;
    Panel16: TPanel;
    Panel48: TPanel;
    Panel50: TPanel;
    ProgressBar1: TProgressBar;
    StatusBar1: TStatusBar;
    Label9: TLabel;
    DBText3: TDBText;
    IBQuery_Delete_Visao: TIBQuery;
    IBQuery_Visao: TIBQuery;
    DSQ_Visao: TDataSource;
    IBTable_Mostrar: TIBTable;
    DST_Mostrar: TDataSource;
    DST_Visao: TDataSource;
    IBTable_Visao: TIBTable;
    IBTable_VisaoCODIGO: TIBStringField;
    IBTable_VisaoPREDIO: TIBStringField;
    IBTable_VisaoAPTO: TIntegerField;
    IBTable_VisaoDIA01: TIBStringField;
    IBTable_VisaoTIPO01: TIBStringField;
    IBTable_VisaoDIA02: TIBStringField;
    IBTable_VisaoTIPO02: TIBStringField;
    IBTable_VisaoDIA03: TIBStringField;
    IBTable_VisaoTIPO03: TIBStringField;
    IBTable_VisaoDIA04: TIBStringField;
    IBTable_VisaoTIPO04: TIBStringField;
    IBTable_VisaoDIA05: TIBStringField;
    IBTable_VisaoTIPO05: TIBStringField;
    IBTable_VisaoDIA06: TIBStringField;
    IBTable_VisaoTIPO06: TIBStringField;
    IBTable_VisaoDIA07: TIBStringField;
    IBTable_VisaoTIPO07: TIBStringField;
    IBTable_VisaoDIA08: TIBStringField;
    IBTable_VisaoTIPO08: TIBStringField;
    IBTable_VisaoDIA09: TIBStringField;
    IBTable_VisaoTIPO09: TIBStringField;
    IBTable_VisaoDIA10: TIBStringField;
    IBTable_VisaoTIPO10: TIBStringField;
    IBTable_VisaoDIA11: TIBStringField;
    IBTable_VisaoTIPO11: TIBStringField;
    IBTable_VisaoDIA12: TIBStringField;
    IBTable_VisaoTIPO12: TIBStringField;
    IBTable_VisaoDIA13: TIBStringField;
    IBTable_VisaoTIPO13: TIBStringField;
    IBTable_VisaoDIA14: TIBStringField;
    IBTable_VisaoTIPO14: TIBStringField;
    IBTable_VisaoDIA15: TIBStringField;
    IBTable_VisaoTIPO15: TIBStringField;
    IBTable_VisaoDIA16: TIBStringField;
    IBTable_VisaoTIPO16: TIBStringField;
    IBTable_VisaoDIA17: TIBStringField;
    IBTable_VisaoTIPO17: TIBStringField;
    IBTable_VisaoDIA18: TIBStringField;
    IBTable_VisaoTIPO18: TIBStringField;
    IBTable_VisaoDIA19: TIBStringField;
    IBTable_VisaoTIPO19: TIBStringField;
    IBTable_VisaoDIA20: TIBStringField;
    IBTable_VisaoTIPO20: TIBStringField;
    IBTable_VisaoDIA21: TIBStringField;
    IBTable_VisaoTIPO21: TIBStringField;
    IBTable_VisaoDIA22: TIBStringField;
    IBTable_VisaoTIPO22: TIBStringField;
    IBTable_VisaoDIA23: TIBStringField;
    IBTable_VisaoTIPO23: TIBStringField;
    IBTable_VisaoDIA24: TIBStringField;
    IBTable_VisaoTIPO24: TIBStringField;
    IBTable_VisaoDIA25: TIBStringField;
    IBTable_VisaoTIPO25: TIBStringField;
    IBTable_VisaoDIA26: TIBStringField;
    IBTable_VisaoTIPO26: TIBStringField;
    IBTable_VisaoDIA27: TIBStringField;
    IBTable_VisaoTIPO27: TIBStringField;
    IBTable_VisaoDIA28: TIBStringField;
    IBTable_VisaoTIPO28: TIBStringField;
    IBTable_VisaoDIA29: TIBStringField;
    IBTable_VisaoTIPO29: TIBStringField;
    IBTable_VisaoDIA30: TIBStringField;
    IBTable_VisaoTIPO30: TIBStringField;
    IBTable_VisaoDIA31: TIBStringField;
    IBTable_VisaoTIPO31: TIBStringField;
    IBQuery_Busca: TIBQuery;
    DSQ_Busca: TDataSource;
    ToolBar2: TToolBar;
    ToolButton_RelMapa: TToolButton;
    ToolButton_Windows: TToolButton;
    DBNavigator_Visao: TDBNavigator;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    Label25: TLabel;
    DBText14: TDBText;
    Label26: TLabel;
    DBText15: TDBText;
    DBText16: TDBText;
    Label27: TLabel;
    DBText17: TDBText;
    DBText18: TDBText;
    DBText19: TDBText;
    Label28: TLabel;
    DBText20: TDBText;
    Label29: TLabel;
    DBText21: TDBText;
    IBTable_VisaoCAMA: TIBStringField;
    JvxClock1: TJvxClock;
    ComboBox_Ano: TComboBox;
    Label20: TLabel;
    ComboBox_Mes: TComboBox;
    Label2: TLabel;
    ToolButton_Disponivel: TToolButton;

    procedure Executa_Query_Mapa(VS_Busca: String; VI_Opc: Integer);

    procedure FormActivate(Sender: TObject);
    procedure DBGrid_VisaoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid_MapaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure MaskEdit_Busca_Nome_CompletoChange(Sender: TObject);
    procedure MaskEdit_Nome_GuerraChange(Sender: TObject);
    procedure MaskEdit_RamalChange(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure DBGrid_VisaoCellClick(Column: TColumn);
    procedure ToolButton_MovimentoClick(Sender: TObject);
    procedure ToolButton_RelMapaClick(Sender: TObject);
    procedure ToolButton_FacilidadeClick(Sender: TObject);
    procedure ToolButton_HospedeClick(Sender: TObject);
    procedure Edit_UsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit_UsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_SenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit_SenhaKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_UsuarioChange(Sender: TObject);
    procedure ToolButton_DisponivelClick(Sender: TObject);
    procedure ToolButton_TabPrecoClick(Sender: TObject);
  private    { Private declarations }
      Ma_Dia: array[1..31] of String ;
      Ma_Tipo: array[1..31] of String ;
      VI_Codigo, VI_Tentativas, VI_Opcao: integer;

      VI_AnoSelecionado, VI_MesSelecionado: Integer;
  public    { Public declarations }
  end;

var
  Form_MenuRecepcao: TForm_MenuRecepcao;

implementation

uses Rel_MapaOcupacao, Rel_Mapa_Ocupacao_R;

{$R *.dfm}

procedure TForm_MenuRecepcao.FormActivate(Sender: TObject);
Var
   dia, mes, ano: Word;
begin
   if Funcoes.GetMenuSoldado = False then
   begin
      ToolButton_Disponivel.Enabled:= False;
      Label_Predio.Caption:= PredioAndar+':';

      Funcoes.SetMenuSoldado(True);
      Funcoes.AlimentaComboBox(ComboBox_Predio, 0, 'Todos', 'Predio.cnf');

      DecodeDate( Date, ano, mes, dia);
      ComboBox_Mes.Text:= FormatFloat('00', Mes);
      ComboBox_Ano.Text:= IntToStr(ano);

      IBQuery_Visao.Open;
      IBTable_Visao.Open;
      IBTable_Mostrar.Open;

      IBQuery_Mapa.Close;

      ComboBox_Predio.Text:= '';
   end;
end;

//------------------------------------------------------------------------------
// Tratamento Quando for pressionado a tecla <ENTER> no edit do senha
//------------------------------------------------------------------------------

procedure TForm_MenuRecepcao.Executa_Query_Mapa(VS_Busca: String; VI_Opc: Integer);
var
   VS_Comando: String;
begin
   VS_Comando:= 'select Identidade, codigo, predio, apto, cama, ramal, nome, tipo, situacao, situacao_curso, data_entrada, Data_Saida from mapa';
   if trim(VS_Busca) <> '' then
   begin
      case VI_Opc of
         1: VS_Comando:= VS_Comando+' where ramal like '+#39+'%'+VS_Busca+'%'+#39;
         2: VS_Comando:= VS_Comando+' where situacao like '+#39+'%'+VS_Busca+'%'+#39;
         3: VS_Comando:= VS_Comando+' where nome like '+#39+'%'+VS_Busca+'%'+#39;
      end;
   end;
   VS_Comando:= VS_Comando+' order by predio, apto, cama ';

   IBQuery_Mapa.Close;
   IBQuery_Mapa.Sql.Clear;
   IBQuery_Mapa.Sql.Add(VS_Comando);
   IBQuery_Mapa.Open;
   IBQuery_Visao.Locate('Codigo',IBQuery_Mapa.FieldByName('Codigo').AsString,[loPartialKey]);
end;

//------------------------------------------------------------------------------
// Tratamento da definicao de cores de acordo com tipo
//------------------------------------------------------------------------------

procedure TForm_MenuRecepcao.DBGrid_VisaoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if (Column.Field.FieldName = 'DIA01') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo01').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo01').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo01').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo01').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo01').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo01').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA02') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo02').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo02').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo02').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo02').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo02').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo02').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA03') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo03').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo03').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo03').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo03').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo03').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo03').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA04') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo04').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo04').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo04').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo04').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo04').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo04').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA05') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo05').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo05').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo05').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo05').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo05').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo05').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA06') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo06').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo06').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo06').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo06').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo06').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo06').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA07') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo07').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo07').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo07').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo07').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo07').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo07').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA08') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo08').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo08').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo08').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo08').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo08').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo08').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA09') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo09').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo09').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo09').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo09').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo09').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo09').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA10') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo10').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo10').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo10').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo10').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo10').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo10').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA11') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo11').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo11').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo11').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo11').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo11').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo11').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA12') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo12').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo12').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo12').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo12').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo12').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo12').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA13') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo13').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo13').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo13').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo13').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo13').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo13').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA14') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo14').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo14').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo14').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo14').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo14').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo14').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA15') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo15').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo15').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo15').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo15').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo15').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo15').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA16') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo16').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo16').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo16').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo16').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo16').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo16').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA17') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo17').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo17').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo17').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo17').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo17').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo17').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA18') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo18').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo18').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo18').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo18').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo18').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo18').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA19') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo19').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo19').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo19').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo19').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo19').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo19').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA20') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo20').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo20').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo20').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo20').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo20').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo20').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA21') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo21').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo21').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo21').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo21').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo21').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo21').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA22') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo22').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo22').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo22').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo22').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo22').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo22').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA23') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo23').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo23').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo23').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo23').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo23').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo23').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA24') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo24').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo24').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo24').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo24').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo24').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo24').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA25') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo25').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo25').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo25').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo25').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo25').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo25').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA26') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo26').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo26').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo26').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo26').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo26').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo26').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA27') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo27').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo27').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo27').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo27').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo27').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo27').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA28') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo28').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo28').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo28').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo28').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo28').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo28').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA29') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo29').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo29').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo29').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo29').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo29').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo29').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end
                     else
                     begin
                        if IBQuery_Visao.FieldByName('Tipo29').AsString = '9' then   // NAO OCUPAR
                        begin
                           DBGrid_Visao.Canvas.Brush.Color:= clMoneyGreen;
                           DBGrid_Visao.Canvas.Font.Color:= clMoneyGreen;
                        end;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA30') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo30').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo30').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo30').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo30').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo30').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo30').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end
                     else
                     begin
                        if IBQuery_Visao.FieldByName('Tipo30').AsString = '9' then   // NAO OCUPAR
                        begin
                           DBGrid_Visao.Canvas.Brush.Color:= clMoneyGreen;
                           DBGrid_Visao.Canvas.Font.Color:= clMoneyGreen;
                        end;
                     end;
                  end;
               end;
            end;
         end;
      end;
      DBGrid_Visao.Canvas.FillRect(Rect);
      DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

   if (Column.Field.FieldName = 'DIA31') then
   begin
     if (IBQuery_Visao.FieldByName('Tipo31').AsString = '0') then  // Cabecalho
      begin
         DBGrid_Visao.Canvas.Brush.Color:= clSilver;
         DBGrid_Visao.Canvas.Font.Color:= clBlack;
     end
      else
      begin
         if IBQuery_Visao.FieldByName('Tipo31').AsString = '3' then     // Desocupado
         begin
            DBGrid_Visao.Canvas.Brush.Color:= clInfoBk;
            DBGrid_Visao.Canvas.Font.Color:= clBlack;
         end
         else
         begin
            if (IBQuery_Visao.FieldByName('Tipo31').AsString = '1') then   // Ocupado
            begin
               DBGrid_Visao.Canvas.Brush.Color:= clTeal;
               DBGrid_Visao.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBQuery_Visao.FieldByName('Tipo31').AsString = '2' then   // Reserva
               begin
                  DBGrid_Visao.Canvas.Brush.Color:= clRed;
                  DBGrid_Visao.Canvas.Font.Color:= clWhite;
               end
               else
               begin
                  if IBQuery_Visao.FieldByName('Tipo31').AsString = '4' then  // Não Desocupado
                  begin
                     DBGrid_Visao.Canvas.Brush.Color:= clBlue;
                     DBGrid_Visao.Canvas.Font.Color:= clWhite;
                  end
                  else
                  begin
                     if IBQuery_Visao.FieldByName('Tipo31').AsString = '5' then   // NAO OCUPAR
                     begin
                        DBGrid_Visao.Canvas.Brush.Color:= clYellow;
                        DBGrid_Visao.Canvas.Font.Color:= clBlack;
                     end
                     else
                     begin
                        if IBQuery_Visao.FieldByName('Tipo31').AsString = '9' then   // NAO OCUPAR
                        begin
                           DBGrid_Visao.Canvas.Brush.Color:= clMoneyGreen;
                           DBGrid_Visao.Canvas.Font.Color:= clMoneyGreen;
                        end;
                     end;
                  end;
               end;
            end;
         end;
      end;
   end;
   DBGrid_Visao.Canvas.FillRect(Rect);
   DBGrid_Visao.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm_MenuRecepcao.DBGrid_MapaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if IBTable_Mostrar.FieldByName('Tipo').AsString = '3' then     // Desocupado
   begin
       DBGrid_Mapa.Canvas.Brush.Color:= clInfoBk;
       DBGrid_Mapa.Canvas.Font.Color:= clBlack;
   end
   else
   begin
      if (IBTable_Mostrar.FieldByName('Tipo').AsString = '1') then   // Ocupado
      begin
         DBGrid_Mapa.Canvas.Brush.Color:= clTeal;
         DBGrid_Mapa.Canvas.Font.Color:= clWhite;
      end
      else
      begin
         if IBTable_Mostrar.FieldByName('Tipo').AsString = '2' then   // Reserva
         begin
            DBGrid_Mapa.Canvas.Brush.Color:= clRed;
            DBGrid_Mapa.Canvas.Font.Color:= clWhite;
         end
         else
         begin
            if IBTable_Mostrar.FieldByName('Tipo').AsString = '4' then  // Não Desocupado
            begin
               DBGrid_Mapa.Canvas.Brush.Color:= clBlue;
               DBGrid_Mapa.Canvas.Font.Color:= clWhite;
            end
            else
            begin
               if IBTable_Mostrar.FieldByName('Tipo').AsString = '5' then   // NAO OCUPAR
               begin
                  DBGrid_Mapa.Canvas.Brush.Color:= clYellow;
                  DBGrid_Mapa.Canvas.Font.Color:= clBlack;
               end;
            end;
         end;
      end;
   end;
   DBGrid_Mapa.Canvas.FillRect(Rect);
   DBGrid_Mapa.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

//------------------------------------------------------------------------------
// Procedure para procurar Hospede por nome
//------------------------------------------------------------------------------

procedure TForm_MenuRecepcao.MaskEdit_Busca_Nome_CompletoChange(Sender: TObject);
begin
   Executa_Query_Mapa(MaskEdit_Busca_Nome_Completo.Text, 3);
end;

//------------------------------------------------------------------------------
// Procedure para procurar Hospede por Nome de Guerra
//------------------------------------------------------------------------------

procedure TForm_MenuRecepcao.MaskEdit_Nome_GuerraChange(Sender: TObject);
begin
   Executa_Query_Mapa(MaskEdit_Nome_Guerra.Text, 2 );
end;

//------------------------------------------------------------------------------
// Procedure para procurar Hospede por Ramal
//------------------------------------------------------------------------------

procedure TForm_MenuRecepcao.MaskEdit_RamalChange(Sender: TObject);
begin
   Executa_Query_Mapa(MaskEdit_ramal.Text, 1);
end;

procedure TForm_MenuRecepcao.ToolButton_RelMapaClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao('R-Relatorio Mapa');
   if IBQuery_Visao.Recordcount = 0 then
      MessageDlg('Não foi selecionado '+PredioAndar+'.', mtInformation,[mbOk], 0)
   else
   begin
      QRListForm_MapaOcupacao.QuickRep_Mapa_Ocupacao.Preview;
      IBQuery_Busca.Close;
      IBQuery_Busca.SQL.Clear;
      IBQuery_Busca.SQL.Add('Select * from Mapa Order By Codigo');
      IBQuery_Busca.OPen;
      if IBQuery_Busca.RecordCount > 0 then
         QRListForm_Mapa_Hospedagem_R.QuickRep_Mapa_Ocupacao.Preview;
   end;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_MenuRecepcao.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

procedure TForm_MenuRecepcao.DBGrid_VisaoCellClick(Column: TColumn);
var
   VS_Campo: String;
begin
   VS_Campo:= IBQuery_Visao.FieldByName('Dia01').AsString+IBQuery_Visao.FieldByName('Dia02').AsString+IBQuery_Visao.FieldByName('Dia03').AsString;
   if Trim(VS_Campo) = 'ARRUMAR' then
      ToolButton_Disponivel.Enabled:= True
   else
      ToolButton_Disponivel.Enabled:= False;

   VS_Campo:= IBQuery_Visao.FieldByName(Column.FieldName).AsString;
   if VS_Campo <> '' then
   begin
      IBQuery_Busca.Close;
      IBQuery_Busca.SQL.Clear;
      IBQuery_Busca.SQL.Add('Select * from Mapa where Codigo = '+#39+VS_Campo+#39);
      IBQuery_Busca.OPen;
   end;
end;


procedure TForm_MenuRecepcao.ToolButton_DisponivelClick(Sender: TObject);
var
   VS_Comando: String;
begin
   VS_Comando:= 'Update APTOCAMA set AptCodigo = '+#39+'DESOCUPADO'+#39+
                ', Nome = '+#39+' '+#39+
                ' Where predio = '+#39+IBQuery_Visao.FieldByName('Predio').AsString+#39+
                ' and Apto = '+IBQuery_Visao.FieldByName('Apto').AsString+
                ' and Cama = '+IBQuery_Visao.FieldByName('Cama').AsString;
   Funcoes.ExecSql(VS_Comando);

end;

end.

