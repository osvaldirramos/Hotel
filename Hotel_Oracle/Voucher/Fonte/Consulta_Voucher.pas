unit Consulta_Voucher;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ComCtrls, ToolWin, StdCtrls, JvEdit, Buttons, ComObj,
  Grids, DBGrids, ExtCtrls, Mask, DBCtrls, JvGradient, JvGradientCaption,
  JvComponent, JvCaptionPanel, JvToolEdit;

type
  TForm_Con_Voucher = class(TForm)
    Panel2: TPanel;
    DBGrid_Hospede: TDBGrid;
    Panel6: TPanel;
    MaskEdit_Nome: TJvEdit;
    MaskEdit_Controle: TJvEdit;
    MaskEdit_PostoGrad: TJvEdit;
    ComboBox_Ano: TComboBox;
    MaskEdit_Ficha: TJvEdit;
    ToolBar2: TToolBar;
    ToolButton_Hospedar: TToolButton;
    ToolButton3: TToolButton;
    ToolButton_Windows: TToolButton;
    ToolButton1: TToolButton;
    Query_Voucher: TQuery;
    DSQ_Voucher: TDataSource;
    ComboBox_Tipo: TComboBox;
    Label_NReg: TLabel;
    Table_hospede: TTable;
    Table_hospedeIDENTIDADE: TStringField;
    Table_hospedeNOME: TStringField;
    Table_hospedeNOME_GUERRA: TStringField;
    Table_hospedePOSTO: TStringField;
    Table_hospedeTELEFONE_RESIDENCIAL: TStringField;
    Table_hospedeTELEFONE_FUNCIONAL: TStringField;
    Table_hospedeRESIDENCIA: TStringField;
    Table_hospedeNUMERO: TStringField;
    Table_hospedeCIDADE: TStringField;
    Table_hospedeBAIRRO: TStringField;
    Table_hospedeESTADO: TStringField;
    Table_hospedeOM_ORIGEM: TStringField;
    Table_hospedeTELEFONE_CELULAR: TStringField;
    Table_hospedeEMAIL: TStringField;
    Table_hospedeCPF: TStringField;
    DST_Hospede: TDataSource;
    JvCaptionPanel_FichaHospede: TJvCaptionPanel;
    Panel1: TPanel;
    JvGradientCaption1: TJvGradientCaption;
    JvGradient1: TJvGradient;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    SpeedButton_fechar_Consulta_Hospede: TSpeedButton;
    ToolButton2: TToolButton;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    DBText12: TDBText;
    DBText13: TDBText;
    DBText14: TDBText;
    ComboBox_Termo: TComboBox;
    JvDateEdit_Termino: TJvDateEdit;
    JvDateEdit_inicio: TJvDateEdit;
    ComboBox_Usuario: TComboBox;
    Query_Executa: TQuery;
    ComboBox_expirou: TComboBox;

    procedure Busca_Voucher(Sender: TObject);
    procedure DBGrid_HospedeTitleClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton_HospedarClick(Sender: TObject);
    procedure SpeedButton_fechar_Consulta_HospedeClick(Sender: TObject);
  private    { Private declarations }
     VS_OrderBy: String;
  public
    { Public declarations }
  end;

var
  Form_Con_Voucher: TForm_Con_Voucher;

implementation

uses Module;

{$R *.dfm}

//------------------------------------------------------------------------------
// Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_Con_Voucher.FormActivate(Sender: TObject);
begin
   Table_hospede.Close;
   JvCaptionPanel_FichaHospede.Visible:= False;

   Query_Executa.Close;
   Query_Executa.SQL.Clear;
   Query_Executa.Sql.Add('select Distinct UsuarioCadastro From Voucher vo');
   Query_Executa.Open;

   ComboBox_Usuario.Items.Clear;
   ComboBox_Usuario.Items.Add('');
   Query_Executa.first;
   While not Query_Executa.Eof do
   begin
      ComboBox_Usuario.Items.Add(Query_Executa.FieldByName('UsuarioCadastro').AsString);
      Query_Executa.Next;
   end;

   VS_OrderBy:= 'vv.nome';
   Busca_Voucher(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do Botao de Fechamento da janela
//------------------------------------------------------------------------------

procedure TForm_Con_Voucher.ToolButton_WindowsClick(Sender: TObject);
begin
   Application.Terminate;
end;

//------------------------------------------------------------------------------
// Tratamento da Query de Consulta
//------------------------------------------------------------------------------

procedure TForm_Con_Voucher.Busca_Voucher(Sender: TObject);
var
  VS_Comando: String;
begin
   VS_Comando:= 'select vo.FICHA, vo.ANO, vo.TIPO, vo.CONTROLE, vo.TERMO, vo.DATACADASTRO, vo.USUARIOCADASTRO, vo.EXPIROU, '+
                '       vo.DATAEXPIRACAO, vo.USUARIOEXPIRACAO, vo.EXTRAVIO, vo.DATAEXTRAVIO, vo.DATACANCELAMENTOSI, vo.USUARIOEXTRAVIO, '+
                '       vv.Posto, vv.nome '+
                ' From Voucher vo, Voucher_View vv '+
                ' Where vo.FICHA = vv.FICHA '+
                ' and   vo.ANO = vv.ANO ';

   if trim(MaskEdit_Ficha.Text) <> '' then
      VS_Comando:= VS_Comando+' and vo.FICHA like '+#39+trim(MaskEdit_Ficha.Text)+'%'+#39;

   if trim(ComboBox_Ano.Text) <> '' then
      VS_Comando:= VS_Comando+' and vo.ANO = '+#39+trim(ComboBox_Ano.Text)+#39;

   if trim(MaskEdit_PostoGrad.Text) <> '' then
      VS_Comando:= VS_Comando+' and vv.Posto like '+#39+trim(MaskEdit_PostoGrad.Text)+'%'+#39;

   if trim(MaskEdit_Nome.Text) <> '' then
      VS_Comando:= VS_Comando+' and vv.nome like '+#39+trim(MaskEdit_Nome.Text)+'%'+#39;

   if trim(ComboBox_Tipo.Text) <> '' then
      VS_Comando:= VS_Comando+' and vo.TIPO = '+#39+trim(ComboBox_Tipo.Text)+#39;

   if trim(MaskEdit_Controle.Text) <> '' then
      VS_Comando:= VS_Comando+' and vo.CONTROLE like '+#39+trim(MaskEdit_Controle.Text)+'%'+#39;

   if trim(ComboBox_Termo.Text) <> '' then
      VS_Comando:= VS_Comando+' and vo.TERMO = '+#39+trim(ComboBox_Termo.Text)+#39;

   if trim(JvDateEdit_inicio.Text) <> '/  /' then
   begin
      if (trim(JvDateEdit_Termino.Text) <> '/  /') then
         VS_Comando:= VS_Comando+' and vo.DATACADASTRO >= '+#39+trim(JvDateEdit_inicio.Text)+#39+
                                 ' and vo.DATACADASTRO <= '+#39+trim(JvDateEdit_Termino.Text)+#39
      else
         VS_Comando:= VS_Comando+' and vo.DATACADASTRO = '+#39+trim(JvDateEdit_inicio.Text)+#39;
   end;

   if trim(ComboBox_Usuario.Text) <> '' then
      VS_Comando:= VS_Comando+' and vo.USUARIOCADASTRO = '+#39+trim(ComboBox_Usuario.Text)+#39;

   if trim(ComboBox_expirou.Text) <> '' then
      VS_Comando:= VS_Comando+' and vo.EXPIROU = '+#39+trim(ComboBox_expirou.Text)+#39;

   VS_Comando:= VS_Comando+' order by '+VS_OrderBy;

   Query_Voucher.Close;
   Query_Voucher.SQL.Clear;
   Query_Voucher.SQL.ADD(VS_Comando);
   Query_Voucher.Open;

   Label_NReg.Caption:= 'Qtd. Hospede: '+IntToStr(Query_Voucher.RecordCount);
   
end;

//------------------------------------------------------------------------------
// Tratamento da Classificacao atraves do click do cabecalho
//------------------------------------------------------------------------------

procedure TForm_Con_Voucher.DBGrid_HospedeTitleClick(Column: TColumn);
var
   Sender: TObject;
begin
   if column.Title.Caption = 'Ficha' then
       VS_OrderBy:= 'vo.FICHA'
   else
      if column.Title.Caption = 'Ano' then
       VS_OrderBy:='vo.ANO'
      else
         if column.Title.Caption = 'Posto/Grad.' then
            VS_OrderBy:='vv.Posto'
         else
            if column.Title.Caption = 'Nome Completo' then
                VS_OrderBy:='vv.nome'
            else
                if column.Title.Caption = 'Tipo' then
                   VS_OrderBy:='vo.TIPO'
                else
                   if column.Title.Caption = 'Controle' then
                      VS_OrderBy:='vo.CONTROLE'
                   else
                      if column.Title.Caption = 'Termo' then
                          VS_OrderBy:='vo.TERMO'
                      else
                         if column.Title.Caption = 'Data Cadastro' then
                             VS_OrderBy:='vo.DATACADASTRO'
                         else
                             if column.Title.Caption = 'Usuário Cadastro' then
                                 VS_OrderBy:='vo.USUARIOCADASTRO'
                             else
                                 if column.Title.Caption = 'Expirou' then
                                    VS_OrderBy:='vo.EXPIROU'
                                 else
                                    if column.Title.Caption = 'Data Expiração' then
                                        VS_OrderBy:='vo.DATAEXPIRACAO'
                                    else
                                       if column.Title.Caption = 'Usuário Expiração' then
                                           VS_OrderBy:= 'vo.USUARIOEXPIRACAO'
                                       else
                                          if column.Title.Caption = 'Extravio' then
                                              VS_OrderBy:= 'vo.EXTRAVIO'
                                          else
                                             if column.Title.Caption = 'Data Extravio' then
                                                 VS_OrderBy:= 'vo.DATAEXTRAVIO'
                                             else
                                                if column.Title.Caption = 'Data Cancelamento' then
                                                    VS_OrderBy:= 'vo.DATACANCELAMENTOSI'
                                                else
                                                   if column.Title.Caption = 'Usuário Extravio' then
                                                       VS_OrderBy:= 'vo.USUARIOEXTRAVIO';
   Busca_Voucher(Sender);
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Excel
//------------------------------------------------------------------------------

procedure TForm_Con_Voucher.ToolButton1Click(Sender: TObject);
var
   objExcel,Sheet : Variant;
   cTitulo : string;
   i : integer;
begin
   if Query_Voucher.RecordCount = 0 then
      ShowMessage('Excel'+#13+#13+'Lista selecionada não possuí voucher Cadastrado...')
   else
   begin
      // Cria uma instancia para utilizar o Excel

      cTitulo := 'Cadastro de Vouchers';
      objExcel := CreateOleObject('Excel.Application');
      objExcel.Visible := True;
      objExcel.Caption := cTitulo;

      // Adiciona planilha(sheet)
      objExcel.Workbooks.Add;
      objExcel.Workbooks[1].Sheets.Add;
      objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;
      Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

      // Preenchendo as Colunas
      Sheet.Range['A1'] := 'Ficha';
      Sheet.Range['B1'] := 'Ano';
      Sheet.Range['C1'] := 'Posto/Grad.';
      Sheet.Range['D1'] := 'Nome Completo';
      Sheet.Range['E1'] := 'Tipo';
      Sheet.Range['F1'] := 'Controle';
      Sheet.Range['G1'] := 'Termo';
      Sheet.Range['H1'] := 'Data Cadastro';
      Sheet.Range['I1'] := 'Usuário Cadastro';
      Sheet.Range['J1'] := 'Expirou';
      Sheet.Range['K1'] := 'Data Expiração';
      Sheet.Range['L1'] := 'Usuário Expiração';
      Sheet.Range['M1'] := 'Extravio';
      Sheet.Range['N1'] := 'Data Extravio';
      Sheet.Range['O1'] := 'Data Cancelamento';
      Sheet.Range['P1'] := 'Usuário Extravio';

      // por aqui tu limparias a planilha

      i:= 2;
      Query_Voucher.First;
      while not Query_Voucher.eof do
      begin
         Sheet.Cells[i,1] := Query_Voucher.FieldByName('FICHA').AsString;
         Sheet.Cells[i,2] := Query_Voucher.FieldByName('ANO').AsString;
         Sheet.Cells[i,3] := Query_Voucher.FieldByName('Posto').AsString;
         Sheet.Cells[i,4] := Query_Voucher.FieldByName('nome').AsString;
         Sheet.Cells[i,5] := Query_Voucher.FieldByName('TIPO').AsString;
         Sheet.Cells[i,6] := Query_Voucher.FieldByName('CONTROLE').AsString;
         Sheet.Cells[i,7] := Query_Voucher.FieldByName('TERMO').AsString;
         Sheet.Cells[i,8] := Query_Voucher.FieldByName('DATACADASTRO').AsString;
         Sheet.Cells[i,9] := Query_Voucher.FieldByName('USUARIOCADASTRO').AsString;
         Sheet.Cells[i,10] := Query_Voucher.FieldByName('EXPIROU').AsString;
         Sheet.Cells[i,11] := Query_Voucher.FieldByName('DATAEXPIRACAO').AsString;
         Sheet.Cells[i,12] := Query_Voucher.FieldByName('USUARIOEXPIRACAO').AsString;
         Sheet.Cells[i,13] := Query_Voucher.FieldByName('EXTRAVIO').AsString;
         Sheet.Cells[i,14] := Query_Voucher.FieldByName('DATAEXTRAVIO').AsString;
         Sheet.Cells[i,15] := Query_Voucher.FieldByName('DATACANCELAMENTOSI').AsString;
         Sheet.Cells[i,16] := Query_Voucher.FieldByName('USUARIOEXTRAVIO').AsString;
         i:= i+1;
         Query_Voucher.Next;
      end;
   end;
end;

procedure TForm_Con_Voucher.ToolButton_HospedarClick(Sender: TObject);
begin
   Table_hospede.Open;
   JvCaptionPanel_FichaHospede.Visible:= True;
end;

procedure TForm_Con_Voucher.SpeedButton_fechar_Consulta_HospedeClick(Sender: TObject);
begin
   Table_hospede.Close;
   JvCaptionPanel_FichaHospede.Visible:= False;
end;

end.
