unit CadRegrasDeDiarias;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, ComCtrls, Buttons, Grids, ExtCtrls,
  Mask, Rotinas, DBTables, ToolWin, IBCustomDataSet, IBTable, IBQuery;

type
  TForm_CadRegrasDeDiarias = class(TForm)
    DST_RegrasDeDesconto: TDataSource;
    ToolBar2: TToolBar;
    ToolButton9: TToolButton;
    ToolButton_Inserir: TToolButton;
    ToolButton_Alterar: TToolButton;
    ToolButton_Excluir: TToolButton;
    ToolButton_Gravar: TToolButton;
    ToolButton_Cancelar: TToolButton;
    ToolButton2: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    Panel_ListaDeRegras: TPanel;
    StatusBar: TStatusBar;
    Panel_Campos: TPanel;
    Label_Situacao_Curso: TLabel;
    Label_Dias: TLabel;
    Label_ValorDiaria: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBComboBox_SituacaoCurso: TDBComboBox;
    DBComboBox_Predio: TDBComboBox;
    DBEdit_Do: TDBEdit;
    DBEdit_Ate: TDBEdit;
    DBEdit_Desconto: TDBEdit;
    IBTable_RegrasDeDiaria: TIBTable;
    IBTable_RegrasDeDiariaPOSTOGRADUACAO: TIBStringField;
    IBTable_RegrasDeDiariaPREDIO: TIBStringField;
    IBTable_RegrasDeDiariaINICIO: TSmallintField;
    IBTable_RegrasDeDiariaTERMINO: TSmallintField;
    IBTable_RegrasDeDiariaVALOR: TIBBCDField;
    IBQuery_PostoGraduacao: TIBQuery;
    IBQuery_Tabela_Preco: TIBQuery;
    IBQuery_Tabela_PrecoPOSTOGRADUACAO: TIBStringField;
    IBQuery_Tabela_PrecoPREDIO: TIBStringField;
    IBQuery_Tabela_PrecoINICIO: TSmallintField;
    IBQuery_Tabela_PrecoTERMINO: TSmallintField;
    IBQuery_Tabela_PrecoVALOR: TIBBCDField;
    DSQ_TabelaPreco: TDataSource;
    Panel1: TPanel;
    ComboBox_Predio: TComboBox;
    MASKEDIT_Posto: TMaskEdit;
    DBGrid_TabelaPreco: TDBGrid;

    procedure FormCreate(Sender: TObject);

    procedure Busca_Tabela(Sender: TObject);
    procedure Atualiza;
    procedure Botoes(Status: Boolean);

    procedure Campos(Status: Boolean);
    procedure ToolButton_InserirClick(Sender: TObject);
    procedure ToolButton_AlterarClick(Sender: TObject);
    procedure ToolButton_ExcluirClick(Sender: TObject);
    procedure ToolButton_CancelarClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton_GravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid_TabelaPrecoTitleClick(Column: TColumn);
    procedure DBGrid_TabelaPrecoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private        { private declarations }
      VS_opcao: String;
  public    { Public declarations }
     VS_OrderBy: String;
  end;

var
  Form_CadRegrasDeDiarias: TForm_CadRegrasDeDiarias;

implementation

uses Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Modulo Principal
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDiarias.FormCreate(Sender: TObject);
var
   VS_Comando: String;
begin
   // Alimenta os ComboBox de Trabalho

   Funcoes.AlimentaDBComboBox(DBComboBox_Predio, 0, '', 'Predio.cnf');

   DBComboBox_SituacaoCurso.Clear;

   VS_Comando:= 'Select Codigo, CodTabela, Posto from Tabela_Posto order by Codigo, CodTabela';
   IBQuery_PostoGraduacao.Close;
   IBQuery_PostoGraduacao.Sql.Clear;
   IBQuery_PostoGraduacao.Sql.Add(VS_Comando);
   IBQuery_PostoGraduacao.Open;

   IBQuery_PostoGraduacao.First;
   While not IBQuery_PostoGraduacao.Eof do
   begin
      DBComboBox_SituacaoCurso.Items.Add(IBQuery_PostoGraduacao.FieldByName('Posto').AsString);
      IBQuery_PostoGraduacao.Next
   end;

   //--- Abre as tabelas de trabalho

   Funcoes.AlimentaComboBox(ComboBox_Predio, 1, '');
   ComboBox_Predio.Text:= '';
   MASKEDIT_Posto.Text:= '';
   VS_OrderBy:= 'Predio, PostoGraduacao, inicio';
   Busca_Tabela(Sender);

   IBTable_RegrasDeDiaria.Open;
   Atualiza;
   Botoes(True);
   Campos(False);
   StatusBar.SimpleText:= 'Selecione a opção desejada.';
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDiarias.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Modulo retorno para opcao anterior
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDiarias.ToolButton_RetornarClick(Sender: TObject);
begin
   IBTable_RegrasDeDiaria.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Modulo de Inserção de Dados
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDiarias.ToolButton_InserirClick(Sender: TObject);
begin
   Try
     VS_opcao:= 'Inserção ';
     Botoes(False);
     Campos(True);
     IBTable_RegrasDeDiaria.Append;
     StatusBar.SimpleText:= 'Forneça a regras do pagamento';
     DBComboBox_SituacaoCurso.SetFocus;
   Except
     MessageDlg('Erro na inserção.', mtInformation,[mbOk], 0);
   end;

end;

//------------------------------------------------------------------------------
// Modulo de Alteração de Dados
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDiarias.ToolButton_AlterarClick(Sender: TObject);
begin
   Try
     VS_opcao:= 'Alteração ';
     Botoes(False);
     Campos(True);
     StatusBar.SimpleText:= 'Entre com a alteração necessária';
     IBTable_RegrasDeDiaria.Edit;
     DBComboBox_SituacaoCurso.SetFocus;
   Except
     MessageDlg('Erro na Alteração.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Exclusão de Dados
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDiarias.ToolButton_ExcluirClick(Sender: TObject);
begin
   Botoes(False);
   ToolButton_Gravar.Enabled:= False;
   ToolButton_Cancelar.Enabled:= False;
   if MessageDlg('Confirma a exclusão ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Funcoes.Log_Recepcao('Exclusão da Regra de Diarias Apto '+DBComboBox_Predio.Text);
      IBTable_RegrasDeDiaria.Delete;
      DM.IBTransaction_Hotel.CommitRetaining;
      Atualiza;
   end;
   Botoes(True);
end;

//------------------------------------------------------------------------------
// Modulo de Gravacao de Dados
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDiarias.ToolButton_GravarClick(Sender: TObject);
begin
   Try
      if DBComboBox_SituacaoCurso.Text = '' then
      begin
          ShowMessage('Não foi selecionado o Posto Graduação...');
          DBComboBox_SituacaoCurso.SetFocus;
      end
      else
      begin
         if DBComboBox_Predio.Text = '' then
         begin
             ShowMessage('Não foi selecionado o Prédio...');
             DBComboBox_Predio.SetFocus;
         end
         else
         begin
            if DBEdit_Do.Text = '' then
            begin
                ShowMessage('Não foi fornecido o dia inicial...');
                DBEdit_Do.SetFocus;
            end
            else
            begin
               if DBEdit_Ate.Text = '' then
               begin
                   ShowMessage('Não foi fornecido o dia final...');
                   DBEdit_Ate.SetFocus;
               end
               else
               begin
                  if DBEdit_Desconto.Text = '' then
                  begin
                      ShowMessage('Não foi fornecido o valor...');
                      DBEdit_Desconto.SetFocus;
                  end
                  else
                  begin
                     Funcoes.Log_Recepcao(VS_opcao+' da Regra de Diarias Apto '+DBComboBox_Predio.Text);
                     IBTable_RegrasDeDiaria.Post;
                     DM.IBTransaction_Hotel.CommitRetaining;
                     Botoes(True);
                     Atualiza;
                     Campos(False);
                  end;
               end;
            end;
         end;
      end;
   Except
         MessageDlg('Regras Diarias - Erro na Gravacao.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Modulo de Cancelamento de Dados
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDiarias.ToolButton_CancelarClick(Sender: TObject);
begin
   Try
      IBTable_RegrasDeDiaria.Cancel;
      DM.IBTransaction_Hotel.CommitRetaining;
      Botoes(True);
      Atualiza;
      Campos(False);
   Except
      MessageDlg('Regras Diarias - Erro na Cancelamento.', mtInformation,[mbOk], 0);
   end;
end;

//------------------------------------------------------------------------------
// Procedure de Redresh da Query
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDiarias.Atualiza;
var
   bmLocal : TBookmark;
begin
   bmLocal:= IBQuery_Tabela_Preco.GetBookMark;
   IBQuery_Tabela_Preco.Close;
   IBQuery_Tabela_Preco.Open;
   IBQuery_Tabela_Preco.GotoBookMark(bmLocal);
   IBQuery_Tabela_Preco.FreeBookMark(bmLocal);
end;

//------------------------------------------------------------------------------
// Desabilita o acesso aos campos
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDiarias.Campos(Status: Boolean);
begin
    DBComboBox_SituacaoCurso.Enabled:= Status;
    DBComboBox_Predio.Enabled:= Status;
    DBEdit_Do.Enabled:= Status;
    DBEdit_Ate.Enabled:= Status;
    DBEdit_Desconto.Enabled:= Status;
    if Status = True then
       Status:= False
    else
       Status:= True;
    Panel_ListaDeRegras.Enabled:= Status;
end;

//------------------------------------------------------------------------------
// Habilita Botoes
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDiarias.Botoes(Status: Boolean);
begin
   ToolButton_Inserir.Enabled:= Status;
   ToolButton_Alterar.Enabled:= Status;
   ToolButton_Excluir.Enabled:= Status;
   ToolButton_Retornar.Enabled:= Status;
   ToolButton_Windows.Enabled:= Status;

   if Status = True then
      Status:= False
   else
      Status:= True;
   ToolButton_Gravar.Enabled:= Status;
   ToolButton_Cancelar.Enabled:= Status;
end;

procedure TForm_CadRegrasDeDiarias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:= caFree;
end;

//------------------------------------------------------------------------------
// Consulta pela posto/graduacao
//------------------------------------------------------------------------------

procedure TForm_CadRegrasDeDiarias.Busca_Tabela(Sender: TObject);
var
   VS_Where, VS_Comando: String;
begin
   VS_Where:= '';
   VS_Comando:= 'select * from REGRASDEDIARIAS ';

   if trim(ComboBox_Predio.Text) <> '' then
   begin
      VS_Comando:= VS_Comando + ' Where Predio = '+#39+ComboBox_Predio.Text+#39;
      VS_Where:= 'S';
   end;

   if trim(MASKEDIT_Posto.Text) <> '' then
   begin
      if VS_Where = '' then
         VS_Comando:= VS_Comando +' Where postoGraduacao like '+#39+MASKEDIT_Posto.text+'%'+#39+' '
      else
         VS_Comando:= VS_Comando +'and postoGraduacao like '+#39+MASKEDIT_Posto.text+'%'+#39+' ';
   end;

   VS_Comando:= VS_Comando +'Order By '+VS_OrderBy;

   IBQuery_Tabela_Preco.Close;
   IBQuery_Tabela_Preco.SQL.Clear;
   IBQuery_Tabela_Preco.Sql.Add(VS_Comando);
   IBQuery_Tabela_Preco.Open;
end;

procedure TForm_CadRegrasDeDiarias.DBGrid_TabelaPrecoTitleClick( Column: TColumn);
var
   Sender: TObject;
begin
   if column.Title.Caption = 'PRÉDIO' then
       VS_OrderBy:= 'Predio, PostoGraduacao , inicio'
   else
      if trim(column.Title.Caption) = 'POSTO' then
          VS_OrderBy:= 'PostoGraduacao,  inicio'
      else
         if column.Title.Caption = 'VALOR' then
            VS_OrderBy:= 'valor, Predio, inicio';

   Busca_Tabela(Sender);
end;

procedure TForm_CadRegrasDeDiarias.DBGrid_TabelaPrecoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not odd(IBQuery_Tabela_Preco.RecNo) then                                //verifica se a linha não é impar
    if not(gdSelected in State) then                                        //verifica se a célula não está selecionada
    begin
      TDBGrid(Sender).Canvas.Brush.Color:=clMoneyGreen;                       //define a cor que a linha vai ser pintada
      TDBGrid(Sender).Canvas.FillRect(Rect);                                 //pinta cada retângulo (célula) da linha a ser pintada
      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);  //retorna com o desenho padrão do DBGrid
    end
    else
       DBGrid_TabelaPreco.Canvas.Brush.Color := clSkyBlue;
end;

end.
