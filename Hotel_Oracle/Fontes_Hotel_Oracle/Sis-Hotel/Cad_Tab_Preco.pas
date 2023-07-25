unit Cad_Tab_Preco;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, Buttons, DBTables, Grids, ExtCtrls,
  ComCtrls, Rotinas, Mask, ToolWin, JvGradient;

Const
   ASPAS= '''';

type
  TForm_Tab_Preco = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar: TStatusBar;
    DS_Tab_Preco: TDataSource;
    DBGrid_Tab: TDBGrid;
    Table_Tab_Preco: TTable;
    GroupBox_Preco: TGroupBox;
    Table_Tab_PrecoPREDIO: TStringField;
    Table_Tab_PrecoCODIGO: TStringField;
    Table_Tab_PrecoPOSTO: TStringField;
    Table_Tab_PrecoVALOR: TFloatField;
    Label_Predio: TLabel;
    Label_Apto: TLabel;
    Label_Ramal: TLabel;
    ComboBox_Predio: TComboBox;
    DBEdit_Valor: TDBEdit;
    Label1: TLabel;
    DBEdit_Codigo: TDBEdit;
    Panel3: TPanel;
    DBNavigator_Apartamento: TDBNavigator;
    ToolBar4: TToolBar;
    ToolButton_Inserir: TToolButton;
    ToolButton_Alterar: TToolButton;
    ToolButton_Excluir: TToolButton;
    ToolButton_Gravar: TToolButton;
    ToolButton_Ignorar: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    DBComboBox_Posto_Graduacao: TDBComboBox;
    _Patente: TToolBar;
    ToolButton_Patentes: TToolButton;
    Gradient: TJvGradient;
    procedure FormCreate(Sender: TObject);

    procedure Atualiza;
    procedure Botao(Status: Boolean);
    procedure Habilita_Campos(Status: Boolean);
    procedure ComboBox_PredioChange(Sender: TObject);
    procedure ToolButton_InserirClick(Sender: TObject);
    procedure ToolButton_AlterarClick(Sender: TObject);
    procedure ToolButton_ExcluirClick(Sender: TObject);
    procedure ToolButton_GravarClick(Sender: TObject);
    procedure ToolButton_IgnorarClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure DBComboBox_Posto_GraduacaoExit(Sender: TObject);
    procedure Table_Tab_PrecoPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure ToolButton_PatentesClick(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form_Tab_Preco: TForm_Tab_Preco;

implementation

uses Abertura, Divisas;

{$R *.DFM}

//------------------------------------------------------------------------------
// Modulo Principal
//------------------------------------------------------------------------------

procedure TForm_Tab_Preco.FormCreate(Sender: TObject);
begin
   Table_Tab_Preco.Open;
   Table_Tab_Preco.Filtered:= FALSE;
   Table_Tab_Preco.Filter:= 'PREDIO = '+Aspas+ComboBox_Predio.Text+Aspas;
   Table_Tab_Preco.Filtered:= TRUE;
   Atualiza;
   Botao(True);
   Habilita_Campos(False);
end;

//------------------------------------------------------------------------------
// Modulo de Inserção de Dados
//------------------------------------------------------------------------------

procedure TForm_Tab_Preco.ToolButton_InserirClick(Sender: TObject);
begin
   Try
     Botao(False);
     Habilita_Campos(True);

     Table_Tab_Preco.Append;
     Table_Tab_Preco.FieldByName('PREDIO').AsString:= ComboBox_Predio.Text;
     StatusBar.SimpleText:= 'Forneça os Dados da Tabela de Preço';
     DBComboBox_Posto_Graduacao.SetFocus;
   Except
     MessageDlg('Erro na inserção.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Alteração de Dados
//------------------------------------------------------------------------------

procedure TForm_Tab_Preco.ToolButton_AlterarClick(Sender: TObject);
begin
   Try
     Botao(False);
     Habilita_Campos(True);
     Table_Tab_Preco.Edit;
     DBEdit_Codigo.SetFocus;
   Except
     MessageDlg('Erro na Alteração.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Exclusão de Dados
//------------------------------------------------------------------------------

procedure TForm_Tab_Preco.ToolButton_ExcluirClick(Sender: TObject);
begin
   Botao(False);
   ToolButton_Gravar.Enabled:= False;
   ToolButton_Ignorar.Enabled:= False;
   if MessageDlg('Confirma a exclusão ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Table_Tab_Preco.Delete;
      Atualiza;
   end;
   Botao(True);
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_Tab_Preco.ToolButton_GravarClick(Sender: TObject);
begin
   Table_Tab_Preco.Post;
   Botao(True);
   Habilita_Campos(False);
   Atualiza;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_Tab_Preco.ToolButton_IgnorarClick(Sender: TObject);
begin
   Try
      Table_Tab_Preco.Cancel;
      Botao(True);
      Habilita_Campos(False);
      Atualiza;
   Except
      MessageDlg('Erro na Cancelamento.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_Tab_Preco.ToolButton_RetornarClick(Sender: TObject);
begin
   Table_Tab_Preco.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Procedure de Redresh da Query
//------------------------------------------------------------------------------

procedure TForm_Tab_Preco.Atualiza;
begin
   Table_Tab_Preco.Active:= False;
   Table_Tab_Preco.Active:= true;
end;

//------------------------------------------------------------------------------
// Habilita o acesso aos campos de tratamento do Apto
//------------------------------------------------------------------------------

procedure TForm_Tab_Preco.Habilita_Campos(Status: Boolean);
begin
   if Status = True then
   begin
      ComboBox_Predio.Enabled:= False;
      DBEdit_Codigo.ReadOnly:= False;
      DBComboBox_Posto_Graduacao.ReadOnly:= False;
      DBEdit_Valor.ReadOnly:= False;
   end
   else
   begin
      ComboBox_Predio.Enabled:= True;
      DBEdit_Codigo.ReadOnly:= True;
      DBComboBox_Posto_Graduacao.ReadOnly:= True;
      DBEdit_Valor.ReadOnly:= True;
   end;
end;


//------------------------------------------------------------------------------
// Desabilita Botoes
//------------------------------------------------------------------------------

procedure TForm_Tab_Preco.Botao(Status: Boolean);
begin
   DBNavigator_Apartamento.Enabled:= Status;
   ToolButton_Inserir.Enabled:= Status;
   ToolButton_Alterar.Enabled:= Status;
   ToolButton_Excluir.Enabled:= Status;
   ToolButton_Retornar.Enabled:= Status;
   ToolButton_Windows.Enabled:= Status;
   ToolButton_Patentes.Enabled:= Status;

   if Status = True then
   begin
      ToolButton_Ignorar.Enabled:= False;
      ToolButton_Gravar.Enabled:= False;
   end
   else
   begin
      ToolButton_Ignorar.Enabled:= True;
      ToolButton_Gravar.Enabled:= True;
   end;
end;

//------------------------------------------------------------------------------
// Seleção do Predio
//------------------------------------------------------------------------------

procedure TForm_Tab_Preco.ComboBox_PredioChange(Sender: TObject);
begin
   Table_Tab_Preco.Filtered:= FALSE;
   Table_Tab_Preco.Filter:= 'PREDIO = '+ASPAS+ComboBox_Predio.Text+ASPAS;
   Table_Tab_Preco.Filtered:= TRUE;
end;

//------------------------------------------------------------------------------
// Mostra as patentes existentes
//------------------------------------------------------------------------------

procedure TForm_Tab_Preco.ToolButton_PatentesClick(Sender: TObject);
begin
   Form_Divisas.ShowModal;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Tab_Preco.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// tratamento para posto graduacao

procedure TForm_Tab_Preco.DBComboBox_Posto_GraduacaoExit(Sender: TObject);
begin
  if Trim(DBComboBox_Posto_Graduacao.Text) = 'OFICIAL GENERAL' then
  begin
     Table_Tab_Preco.FieldByName('Codigo').AsString:= '01';
     DBEdit_Valor.SetFocus;
  end
  else
     if Trim(DBComboBox_Posto_Graduacao.Text) = 'OFICIAL SUPERIOR' then
     begin
        Table_Tab_Preco.FieldByName('Codigo').AsString:= '02';
        DBEdit_Valor.SetFocus;
     end
     else
        if Trim(DBComboBox_Posto_Graduacao.Text) = 'OFICIAL INTERMEDIÁRIO' then
        begin
           Table_Tab_Preco.FieldByName('Codigo').AsString:= '03';
           DBEdit_Valor.SetFocus;
        end
        else
           if Trim(DBComboBox_Posto_Graduacao.Text) = 'OFICIAL SUBALTERNO' then
           begin
              Table_Tab_Preco.FieldByName('Codigo').AsString:= '04';
              DBEdit_Valor.SetFocus;
           end
           else
              if Trim(DBComboBox_Posto_Graduacao.Text) = 'ASPIRANTE OU GUARDA MARINHA' then
              begin
                 Table_Tab_Preco.FieldByName('Codigo').AsString:= '05';
                 DBEdit_Valor.SetFocus;
             end
              else
                 if Trim(DBComboBox_Posto_Graduacao.Text) = 'CV NS C/ VÍNCULO' then
                 begin
                    Table_Tab_Preco.FieldByName('Codigo').AsString:= '06';
                    DBEdit_Valor.SetFocus;
                end
                 else
                    if Trim(DBComboBox_Posto_Graduacao.Text) = 'CV NS S/ VÍNCULO' then
                    begin
                       Table_Tab_Preco.FieldByName('Codigo').AsString:= '07';
                       DBEdit_Valor.SetFocus;
                    end
                    else
                       if Trim(DBComboBox_Posto_Graduacao.Text) = 'GRADUADOS' then
                       begin
                          Table_Tab_Preco.FieldByName('Codigo').AsString:= '08';
                          DBEdit_Valor.SetFocus;
                      end
                       else
                          if Trim(DBComboBox_Posto_Graduacao.Text) = 'CV NM C/ VÍNCULO' then
                          begin
                             Table_Tab_Preco.FieldByName('Codigo').AsString:= '09';
                             DBEdit_Valor.SetFocus;
                          end
                          else
                             if Trim(DBComboBox_Posto_Graduacao.Text) = 'CV NM S/ VÍNCULO' then
                             begin
                                Table_Tab_Preco.FieldByName('Codigo').AsString:= '10';
                                DBEdit_Valor.SetFocus;
                             end
                             else
                                if Trim(DBComboBox_Posto_Graduacao.Text) = 'CABO' then
                                begin
                                   Table_Tab_Preco.FieldByName('Codigo').AsString:= '11';
                                   DBEdit_Valor.SetFocus;
                                end
                                else
                                   if Trim(DBComboBox_Posto_Graduacao.Text) = 'CADETE' then
                                   begin
                                      Table_Tab_Preco.FieldByName('Codigo').AsString:= '12';
                                      DBEdit_Valor.SetFocus;
                                   end
                                   else
                                      if Trim(DBComboBox_Posto_Graduacao.Text) = 'SOLDADO' then
                                      begin
                                         Table_Tab_Preco.FieldByName('Codigo').AsString:= '13';
                                         DBEdit_Valor.SetFocus;
                                      end
                                      else
                                         if Trim(DBComboBox_Posto_Graduacao.Text) = 'TAIFEIRO' then
                                         begin
                                            Table_Tab_Preco.FieldByName('Codigo').AsString:= '14';
                                            DBEdit_Valor.SetFocus;
                                         end
                                         else
                                            if Trim(DBComboBox_Posto_Graduacao.Text) = 'CV SUP INFRAERO' then
                                            begin
                                               Table_Tab_Preco.FieldByName('Codigo').AsString:= '15';
                                               DBEdit_Valor.SetFocus;
                                            end
                                            else
                                               if Trim(DBComboBox_Posto_Graduacao.Text) = 'CV NM INFRAERO' then
                                               begin
                                                  Table_Tab_Preco.FieldByName('Codigo').AsString:= '16';
                                                  DBEdit_Valor.SetFocus;
                                               end
                                               else
                                                  if Trim(DBComboBox_Posto_Graduacao.Text) = 'CIVIL' then
                                                  begin
                                                     Table_Tab_Preco.FieldByName('Codigo').AsString:= '16';
                                                     DBEdit_Valor.SetFocus;
                                                  end
                                                  else
                                                     DBEdit_Codigo.SetFocus;
end;

procedure TForm_Tab_Preco.Table_Tab_PrecoPostError(DataSet: TDataSet;E: EDatabaseError; var Action: TDataAction);
begin
   if (E is EDBEngineError) then
      if (E as EDBEngineError).Errors[0].ErrorCode = 9729 then
      begin
         MessageDlg('Este posto já foi cadastrado...',mtWarning, [mbOK], 0);
         Abort;
         DBComboBox_Posto_Graduacao.SetFocus;
      end;

end;


end.
