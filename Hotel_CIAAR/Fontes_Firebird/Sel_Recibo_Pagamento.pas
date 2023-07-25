//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Sel_Recibo_Pagamento.PAS                       //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de efetuar o paga-  //
//                             mento dos hospedes que pagaram com p/p         //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 20/08/1999                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      : 05/09/2003                                     //
// AUTOR                     : Anl Osvaldir D Ramosn                          //
// MODULO ALTERADO           :                                                //
// MOTIVO                    : Tratamento de correcao quando o usuario sele-  //
//                             cionava um deteminado hospede para recebimento //
//                             ao encerrar o botao de tratamento de recebi-   //
//                             mento este nao voltava a situacao habilitado.  //
//                                                                            //
//----------------------------------------------------------------------------//

unit Sel_Recibo_Pagamento;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, Mask, ComCtrls, Grids, DBGrids,
  Buttons, ExtCtrls, Rotinas, IBTable, IBCustomDataSet, IBQuery, ToolWin;

type
  TForm_Recibo_Pagamento = class(TForm)
    DSQ_Hospede: TDataSource;
    IBQuery_Hospede: TIBQuery;
    IBQuery_HospedeIDENTIDADE: TIBStringField;
    IBQuery_HospedeIDENTIDADE1: TIBStringField;
    IBQuery_HospedeNOME: TIBStringField;
    IBQuery_HospedeFICHA: TIBStringField;
    IBQuery_HospedeNCHEQUE: TIBStringField;
    IBTable_Historico: TIBTable;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    GroupBox_Busca_Por_Nome: TGroupBox;
    MaskEdit_Busca_Nome: TMaskEdit;
    GroupBox1: TGroupBox;
    MaskEdit_Recibo: TMaskEdit;
    GroupBox2: TGroupBox;
    DateTimePicker_Recebimento: TDateTimePicker;
    Panel4: TPanel;
    ToolBar4: TToolBar;
    ToolButton_Cheque_PP: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    DBNavigator_Hospede: TDBNavigator;
    Panel2: TPanel;
    Label_Fecha_ocupacao: TLabel;
    DBGrid_Hospede: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure MaskEdit_Busca_NomeChange(Sender: TObject);
    procedure Executa_Query(VS_Comando: String);
    procedure ToolButton_Cheque_PPClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
  private
    { private declarations }
  public    { public declarations }

  end;

var
  Form_Recibo_Pagamento: TForm_Recibo_Pagamento;

implementation

uses Abertura, Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Tratamento da Form Principal
//------------------------------------------------------------------------------

procedure TForm_Recibo_Pagamento.FormCreate(Sender: TObject);
var
   VS_Comando: String;
begin
   MaskEdit_Recibo.Clear;
   DateTimePicker_Recebimento.Date:= Date;

   VS_Comando:= 'Select a.identidade, b.identidade, b.nome, a.Ficha, a.ncheque '+
                ' from Historico a, hospede b '+
                ' where b.identidade = a.identidade '+
                ' and a.ano = '+Funcoes.AnoAtual+
                ' and a.Recebido = '+#39+'P'+#39+
                ' and b.nome like'+#39+'%'+MaskEdit_Busca_Nome.Text+'%'+#39+
                ' Order by b.nome';
   Executa_Query(VS_Comando);
   IBTable_Historico.Open;
end;

//------------------------------------------------------------------------------
// Tratamento para o botão Calcular
//------------------------------------------------------------------------------

procedure TForm_Recibo_Pagamento.ToolButton_RetornarClick(Sender: TObject);
begin
   IBQuery_Hospede.Close;
   IBTable_Historico.Close;
   Close;
end;

//------------------------------------------------------------------------------
// Procedure para buscar o hospede por nome
//------------------------------------------------------------------------------

procedure TForm_Recibo_Pagamento.MaskEdit_Busca_NomeChange(Sender: TObject);
var
   VS_Comando: String;
begin
   VS_Comando:= 'Select a.identidade, b.identidade, b.nome, a.Ficha, a.ncheque '+
                ' from Historico a, hospede b '+
                ' where b.identidade = a.identidade '+
                ' and a.ano = '+Funcoes.AnoAtual+
                ' and a.Recebido = '+#39+'P'+#39+
                ' and b.nome like'+#39+'%'+MaskEdit_Busca_Nome.Text+'%'+#39+
                ' Order by b.nome';
   Executa_Query(VS_Comando);
end;

//------------------------------------------------------------------------------
// Procedure para tratar da execusão da query
//------------------------------------------------------------------------------

procedure TForm_Recibo_Pagamento.Executa_Query(VS_Comando: String);
begin
    IBQuery_Hospede.Close;
    IBQuery_Hospede.SQL.Clear;
    IBQuery_Hospede.SQL.Add(VS_Comando);
    IBQuery_Hospede.open;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da descupacao
//------------------------------------------------------------------------------

procedure TForm_Recibo_Pagamento.ToolButton_Cheque_PPClick(Sender: TObject);
begin
   if Trim(MaskEdit_Recibo.Text) = '' then
   begin
      MessageDlg('O Nº do recibo não pode ser branco.', mtInformation,[mbOk], 0);
      MaskEdit_Recibo.setfocus;
   end
   else
   begin
      MaskEdit_Recibo.Text:= Funcoes.NFicha(MaskEdit_Recibo.Text);

      IBTable_Historico.Edit;
      IBTable_Historico.FieldByName('NRECIBO').AsString:= Funcoes.NFicha(Trim(MaskEdit_Recibo.Text));
      IBTable_Historico.FieldByName('DATAPAGAMENTO').AsString:= DateToStr(DateTimePicker_Recebimento.date);
      IBTable_Historico.FieldByName('RECEBIDO').AsString:= 'S';
      IBTable_Historico.Post;
      DM.IBTransaction_Hotel.CommitRetaining;

      IBQuery_Hospede.Close;
      IBQuery_Hospede.open;
      MaskEdit_Recibo.Clear;
   end;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Recibo_Pagamento.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

end.
