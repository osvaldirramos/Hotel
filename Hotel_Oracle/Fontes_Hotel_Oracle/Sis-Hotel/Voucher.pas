unit Voucher;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ComCtrls, ToolWin, Rotinas,
  DB, DBTables, JvToolEdit, JvDBCtrl, ExtCtrls;

type
  TForm_Cad_Voucher = class(TForm)
    ToolBar_Principal: TToolBar;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    GroupBox_CadastroVoucher: TGroupBox;
    Label_Predio: TLabel;
    Label_Apto: TLabel;
    Label_Ramal: TLabel;
    ToolBar_Botoes_1: TToolBar;
    ToolButton_Inserir: TToolButton;
    ToolButton_Alterar: TToolButton;
    ToolButton_Excluir: TToolButton;
    ToolButton_Gravar: TToolButton;
    ToolButton_Ignorar: TToolButton;
    DBGrid_Voucher: TDBGrid;
    Table_Volcher: TTable;
    DST_Voucher: TDataSource;
    Table_VolcherFICHA: TStringField;
    Table_VolcherANO: TFloatField;
    Table_VolcherTIPO: TStringField;
    Table_VolcherCONTROLE: TStringField;
    Table_VolcherDATACADASTRO: TDateTimeField;
    Table_VolcherUSUARIOCADASTRO: TStringField;
    Table_VolcherEXPIROU: TStringField;
    Table_VolcherDATAEXPIRACAO: TDateTimeField;
    Table_VolcherUSUARIOEXPIRACAO: TStringField;
    Table_VolcherEXTRAVIO: TStringField;
    Table_VolcherDATAEXTRAVIO: TDateTimeField;
    Table_VolcherDATACANCELAMENTOSI: TDateTimeField;
    Table_VolcherUSUARIOEXTRAVIO: TStringField;
    Label2: TLabel;
    Label12: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    DBComboBox_Tipo: TDBComboBox;
    DBEdit_Controle: TDBEdit;
    DBComboBox_TermoResponsabilidade: TDBComboBox;
    DBComboBox_Expirou: TDBComboBox;
    DBComboBox_Extravio: TDBComboBox;
    JvDBDateEdit_DataExtravio: TJvDBDateEdit;
    JvDBDateEdit_DataCancelamentoSI: TJvDBDateEdit;
    JvDBDateEdit_DataExpiracao: TJvDBDateEdit;
    Table_VolcherTERMO: TStringField;
    Label5: TLabel;
    DBComboBox1: TDBComboBox;
    Table_VolcherQTDDIAS: TFloatField;

    procedure Atualiza;
    procedure Botao(Status: Boolean);
    procedure Campos(Status: Boolean);

    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure DBEdit_ControleKeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton_InserirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_AlterarClick(Sender: TObject);
    procedure ToolButton_ExcluirClick(Sender: TObject);
    procedure ToolButton_GravarClick(Sender: TObject);
    procedure ToolButton_IgnorarClick(Sender: TObject);
    procedure DBComboBox_ExpirouChange(Sender: TObject);
    procedure DBComboBox_ExtravioChange(Sender: TObject);
    procedure DBEdit_ControleChange(Sender: TObject);
  private    { Private declarations }
     Opcao, UltimoReg: String;
  public
    { Public declarations }
  end;

var
  Form_Cad_Voucher: TForm_Cad_Voucher;

implementation

uses Cad_Hospede;

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento da Procedure Principal
//------------------------------------------------------------------------------

procedure TForm_Cad_Voucher.FormActivate(Sender: TObject);
begin
   Opcao:= 'Consulta';
   Table_Volcher.Open;
   Table_Volcher.Last;
   UltimoReg:= Table_Volcher.FieldByName('CONTROLE').AsString ;

   Campos( False );
   Botao(True);
end;

//------------------------------------------------------------------------------
// Tratamento para fechar a form e retornar para o cadastro de Hospedagem
//------------------------------------------------------------------------------

procedure TForm_Cad_Voucher.ToolButton_RetornarClick(Sender: TObject);
begin
   Table_Volcher.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento para sair do Sistema e retornar para o Windows
//------------------------------------------------------------------------------

procedure TForm_Cad_Voucher.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

procedure TForm_Cad_Voucher.DBEdit_ControleKeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in ['0'..'9' , #8]) then Key := #0;
end;

//------------------------------------------------------------------------------
// Tratamento dos Campos
//------------------------------------------------------------------------------

procedure TForm_Cad_Voucher.Campos(Status: Boolean);
begin
   DBComboBox_Tipo.Enabled:= Status;
   DBEdit_Controle.Enabled:= Status;
   DBComboBox_TermoResponsabilidade.Enabled:= Status;
   DBComboBox_Expirou.Enabled:= Status;
   DBComboBox_Extravio.Enabled:= Status;
   JvDBDateEdit_DataExtravio.Enabled:= Status;
   JvDBDateEdit_DataExpiracao.Enabled:= Status;
   JvDBDateEdit_DataCancelamentoSI.Enabled:= Status;

   if Status = True then
      Status:= False
   else
      Status:= True;

   DBGrid_Voucher.Enabled:= Status;
   ToolBar_Principal.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Inserir
//------------------------------------------------------------------------------

procedure TForm_Cad_Voucher.ToolButton_InserirClick(Sender: TObject);
begin
   Botao( False );
   Campos( True);
   Opcao:= 'Inserir';

   Table_Volcher.Append;
   Table_Volcher.FieldByName('DATACADASTRO').AsString:= DateToStr(Date);
   Table_Volcher.FieldByName('USUARIOCADASTRO').AsString:= Funcoes.GetUsuario;
   Table_Volcher.FieldByName('TERMO').AsString:= 'N';
   Table_Volcher.FieldByName('EXPIROU').AsString:= 'N';
   Table_Volcher.FieldByName('EXTRAVIO').AsString:= 'N';

   DBComboBox_Tipo.SetFocus;
end;

//------------------------------------------------------------------------------
// Tratamento do Botao Inserir
//------------------------------------------------------------------------------

procedure TForm_Cad_Voucher.ToolButton_AlterarClick(Sender: TObject);
begin
   Botao( False );
   Campos( True);
   Opcao:= 'Alterar';
   Table_Volcher.Edit;
   DBComboBox_Tipo.SetFocus;
end;


procedure TForm_Cad_Voucher.ToolButton_ExcluirClick(Sender: TObject);
begin
   if MessageDlg('Confirma a exclusão ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Table_Volcher.Delete;
      Atualiza;
   end;
end;


procedure TForm_Cad_Voucher.ToolButton_GravarClick(Sender: TObject);
begin
   if Table_Volcher.FieldByName('EXPIROU').AsString = 'S' then
   begin
      Table_Volcher.FieldByName('DATAEXPIRACAO').AsString:= DateToStr(Date);
      Table_Volcher.FieldByName('USUARIOEXPIRACAO').AsString:= Funcoes.GetUsuario;
   end
   else
   begin
      if Table_Volcher.FieldByName('EXTRAVIO').AsString = 'S' then
      begin
         Table_Volcher.FieldByName('DATAEXTRAVIO').AsString:= DateToStr(Date);
         Table_Volcher.FieldByName('USUARIOEXTRAVIO').AsString:= Funcoes.GetUsuario;
      end;
   end;

   if  Opcao = 'Inserir' then
      UltimoReg:= Table_Volcher.FieldByName('CONTROLE').AsString ;

   Table_Volcher.Post;
   Opcao:= 'Consulta';
   Botao(True);
   Atualiza;
   Campos( False );
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_Cad_Voucher.ToolButton_IgnorarClick(Sender: TObject);
begin
   Try
      Table_Volcher.Cancel;
      Opcao:= 'Consulta';
      Botao(True);
      Atualiza;
      Campos( False );
   Except
      MessageDlg('Erro na Cancelamento.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Procedure de Redresh da Query
//------------------------------------------------------------------------------

procedure TForm_Cad_Voucher.Atualiza;
begin
   Table_Volcher.Close;
   Table_Volcher.Open;
end;

//------------------------------------------------------------------------------
// Trata dos Botoes
//------------------------------------------------------------------------------

procedure TForm_Cad_Voucher.Botao(Status: Boolean);
begin
   if Opcao = 'Consulta' then
   begin
      ToolButton_Inserir.Enabled:= Status;
      ToolButton_Alterar.Enabled:= Status;
      ToolButton_Excluir.Enabled:= Status;
      ToolButton_Retornar.Enabled:= Status;
      ToolButton_Windows.Enabled:= Status;

      if Status = False then
         Status:= True
      else
         Status:= False;

      ToolButton_Gravar.Enabled:= Status;
      ToolButton_Ignorar.Enabled:= Status;

      if (( Table_Volcher.FieldByName('TIPO').AsString = '' ) or
          ( DBComboBox_Expirou.Text = 'S' ) or
          ( DBComboBox_Extravio.Text = 'S' )) then
      begin
         if ((Table_Volcher.FieldByName('CONTROLE').AsString <>  UltimoReg) and
              (DBComboBox_Expirou.Text <> 'S' )) then
            ToolButton_Inserir.Enabled:= False
         else
            if Table_Volcher.FieldByName('CONTROLE').AsString = '' then
            begin
               ToolButton_Inserir.Enabled:= True;
               ToolButton_Alterar.Enabled:= False;
            end
            else
               ToolButton_Inserir.Enabled:= True;

         //--- Tratamento do Botao Alterar

         if ( DBComboBox_Expirou.Text = 'S' ) then
            ToolButton_Alterar.Enabled:= False
         else
            if Table_Volcher.FieldByName('DataCancelamentoSI').AsString <>  '' then
               ToolButton_Alterar.Enabled:= False;

         ToolButton_Excluir.Enabled:= False;
      end;

      if ((DBComboBox_Expirou.Text = 'N') and (DBComboBox_Extravio.Text = 'N')) then
         ToolButton_Inserir.Enabled:= False
   end;
end;

procedure TForm_Cad_Voucher.DBComboBox_ExpirouChange(Sender: TObject);
begin
   if DBComboBox_Expirou.Text = 'S' then
     JvDBDateEdit_DataExtravio.Enabled:= True
   else
      JvDBDateEdit_DataExtravio.Enabled:= False;
end;

procedure TForm_Cad_Voucher.DBComboBox_ExtravioChange(Sender: TObject);
begin
   if DBComboBox_Expirou.Text = 'S' then
   if DBComboBox_Expirou.Text = 'S' then
   begin
      JvDBDateEdit_DataExpiracao.Enabled:= True;
      JvDBDateEdit_DataCancelamentoSI.Enabled:= True;
   end
   else
   begin
      JvDBDateEdit_DataExpiracao.Enabled:= False;
      JvDBDateEdit_DataCancelamentoSI.Enabled:= False;
   end
end;


procedure TForm_Cad_Voucher.DBEdit_ControleChange(Sender: TObject);
begin
      Botao(True);
end;

end.
