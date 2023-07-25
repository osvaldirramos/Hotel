unit Tab_Hospedagem;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, ComCtrls, Buttons, DBTables,
  Grids, ExtCtrls, Rotinas;

type
  TForm_Tab_Hospedagem = class(TForm)
    Panel2: TPanel;
    Panel_Principal: TPanel;
    Panel_Botoes: TPanel;
    DBNavigator_aerodromo: TDBNavigator;
    BitBtn_Inserir: TBitBtn;
    BitBtn_Alterar: TBitBtn;
    BitBtn_Excluir: TBitBtn;
    BitBtn_Retornar: TBitBtn;
    BitBtn_Ignorar: TBitBtn;
    BitBtn_Gravar: TBitBtn;
    StatusBar: TStatusBar;
    DST_Tab_Hospedagem: TDataSource;
    DBGrid_Tab: TDBGrid;
    Table_Tab_Hospedagem: TTable;
    Table_Tab_HospedagemCODTABELA: TStringField;
    Table_Tab_HospedagemTABELA: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn_InserirClick(Sender: TObject);
    procedure BitBtn_AlterarClick(Sender: TObject);
    procedure BitBtn_ExcluirClick(Sender: TObject);
    procedure BitBtn_GravarClick(Sender: TObject);
    procedure BitBtn_IgnorarClick(Sender: TObject);
    procedure BitBtn_RetornarClick(Sender: TObject);
    procedure BitBtn_WindowsClick(Sender: TObject);

    procedure Atualiza;
    procedure Desabilita;
    procedure Habilita;
    procedure HabCampos;
    procedure DesabCampos;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form_Tab_Hospedagem: TForm_Tab_Hospedagem;

implementation

uses Menu_Principal, Abertura;

{$R *.DFM}

//------------------------------------------------------------------------------
// Modulo Principal
//------------------------------------------------------------------------------

procedure TForm_Tab_Hospedagem.FormCreate(Sender: TObject);
begin
   Table_Tab_Hospedagem.Open;
   Atualiza;
   Habilita;
   DesabCampos;
end;

//------------------------------------------------------------------------------
// Modulo de Inserção de Dados
//------------------------------------------------------------------------------

procedure TForm_Tab_Hospedagem.BitBtn_InserirClick(Sender: TObject);
begin
   Try
     Desabilita;
     HabCampos;
     Table_Tab_Hospedagem.Append;
     StatusBar.SimpleText:= 'Forneça os Dados da Tabela de Hospedagem';
     DBGrid_Tab.SetFocus;
   Except
     MessageDlg('Erro na inserção.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Alteração de Dados
//------------------------------------------------------------------------------

procedure TForm_Tab_Hospedagem.BitBtn_AlterarClick(Sender: TObject);
begin
   Try
     Desabilita;
     HabCampos;
     Table_Tab_Hospedagem.Edit;
     DBGrid_Tab.SetFocus;
   Except
     MessageDlg('Erro na Alteração.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Exclusão de Dados
//------------------------------------------------------------------------------

procedure TForm_Tab_Hospedagem.BitBtn_ExcluirClick(Sender: TObject);
begin
   Desabilita;
   BitBtn_Gravar.Enabled:= False;
   BitBtn_Ignorar.Enabled:= False;
   if MessageDlg('Confirma a exclusão ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Table_Tab_Hospedagem.Delete;
      Atualiza;
   end;
   Habilita;
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_Tab_Hospedagem.BitBtn_GravarClick(Sender: TObject);
begin
   Table_Tab_Hospedagem.Post;
   Habilita;
   Atualiza;
   DesabCampos;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_Tab_Hospedagem.BitBtn_IgnorarClick(Sender: TObject);
begin
   Try
      Table_Tab_Hospedagem.Cancel;
      Habilita;
      Atualiza;
      DesabCampos;
   Except
      MessageDlg('Erro na Cancelamento.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_Tab_Hospedagem.BitBtn_RetornarClick(Sender: TObject);
begin
   Table_Tab_Hospedagem.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Modulo de Retorno para o Windows
//------------------------------------------------------------------------------

procedure TForm_Tab_Hospedagem.BitBtn_WindowsClick(Sender: TObject);
begin
   Table_Tab_Hospedagem.Close;
   Funcoes.Windows;
   Table_Tab_Hospedagem.Open;
end;

//------------------------------------------------------------------------------
// Procedure de Redresh da Query
//------------------------------------------------------------------------------

procedure TForm_Tab_Hospedagem.Atualiza;
begin
   Table_Tab_Hospedagem.Active:= False;
   Table_Tab_Hospedagem.Active:= true;
end;

//------------------------------------------------------------------------------
// Desabilita o acesso aos campos de tratamento do Aerodromo
//------------------------------------------------------------------------------

procedure TForm_Tab_Hospedagem.DesabCampos;
begin
   DBGrid_Tab.ReadOnly:= True;
end;

//------------------------------------------------------------------------------
// Habilita o acesso aos campos de tratamento do Aerodromo
//------------------------------------------------------------------------------

procedure TForm_Tab_Hospedagem.HabCampos;
begin
   DBGrid_Tab.ReadOnly:= False;
end;

//------------------------------------------------------------------------------
// Habilita Botoes
//------------------------------------------------------------------------------

procedure TForm_Tab_Hospedagem.Habilita;
begin
   DBNavigator_Aerodromo.Enabled:= True;
   BitBtn_Inserir.Enabled:= True;
   BitBtn_Alterar.Enabled:= True;
   BitBtn_Excluir.Enabled:= True;
   BitBtn_Gravar.Enabled:= False;
   BitBtn_Ignorar.Enabled:= False;
   BitBtn_Retornar.Enabled:= True;
end;

//------------------------------------------------------------------------------
// Desabilita Botoes
//------------------------------------------------------------------------------

procedure TForm_Tab_Hospedagem.Desabilita;
begin
   DBNavigator_Aerodromo.Enabled:= False;
   BitBtn_Inserir.Enabled:= False;
   BitBtn_Alterar.Enabled:= False;
   BitBtn_Excluir.Enabled:= False;
   BitBtn_Gravar.Enabled:= True;
   BitBtn_Ignorar.Enabled:= True;
   BitBtn_Retornar.Enabled:= False;
end;
end.
