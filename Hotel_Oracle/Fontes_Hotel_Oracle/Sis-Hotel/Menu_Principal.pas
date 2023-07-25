//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Menu_Soldado.PAS                               //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de montar o menu    //
//                             principal que sera utilizado pelo gerente.     //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 12/03/2003                                     //
//                                                                            //
// ATUALIZADO                :                                                //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      : 23/01/2004                                     //
// AUTOR                     : Osvaldir D Ramos                               //
// MODULO ALTERADO           :                                                //
// MOTIVO                    : Foi criado procedure para setar o Banco de Da- //
//                             dos para realizar treinamento.                 //
//----------------------------------------------------------------------------//

unit Menu_Principal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, Rotinas, Grids, DBGrids, Db, DBTables, Buttons, ToolWin,
  ComCtrls, ImgList, StdCtrls, JvGIF, JvGradient, JvGrdCpt, jpeg, ComObj,
  JvComponent, JvClock, JvLookOut, Mask, JvToolEdit, DBCtrls, JvShape,
  JvCaptionPanel;

type
  TForm_Menu_Pri_G = class(TForm)
    MainMenu_Gerente: TMainMenu;
    CadastrodeHospede1: TMenuItem;
    CadastrodeCamasporApto: TMenuItem;
    CadastrodeUsurios: TMenuItem;
    Reserva: TMenuItem;
    CadastrodeHospede: TMenuItem;
    FechamentoDaConta: TMenuItem;
    RetornarParaWindows: TMenuItem;
    ReciboPP: TMenuItem;
    N1: TMenuItem;
    Consulta: TMenuItem;
    Historico: TMenuItem;
    TabeladePosto: TMenuItem;
    N2: TMenuItem;
    Facilidades: TMenuItem;
    CadastrodasUnidadesDecea: TMenuItem;
    TabeladePrecosparaResidente: TMenuItem;
    CadastrodeCursosIPV1: TMenuItem;
    ArrecadacoaorMes: TMenuItem;
    N4: TMenuItem;
    ReservarealizadaatravsdoMapa1: TMenuItem;
    CadastrodaReserva1: TMenuItem;
    CadastrodosResponsveis1: TMenuItem;
    Cadastro1: TMenuItem;
    SituacaoDeHospedagem: TMenuItem;
    RelatoriodiriodemovimentodoHoteldeTransito: TMenuItem;
    N7: TMenuItem;
    PopupMenu1: TPopupMenu;
    LogsdoSistema1: TMenuItem;
    N8: TMenuItem;
    AlterarnmerodaFicha1: TMenuItem;
    AlterarnmerodoRecibo1: TMenuItem;
    Relatorios: TMenuItem;
    Reserva1: TMenuItem;
    RelaodeHospede1: TMenuItem;
    AuxilioAdministracao: TMenuItem;
    RelaodeHospedescomEMail1: TMenuItem;
    RegrasdeDirias1: TMenuItem;
    abeladePreco1: TMenuItem;
    JvGradient1: TJvGradient;
    N3: TMenuItem;
    RelacaodeHospedagem: TMenuItem;
    CancelarHospedagem1: TMenuItem;
    Geral1: TMenuItem;
    ToolBar2: TToolBar;
    ToolButton_Hospede: TToolButton;
    ToolButton_Reserva: TToolButton;
    ToolButton_Facilidade: TToolButton;
    ToolButton_Movimento: TToolButton;
    ToolButton_QuadroOcup: TToolButton;
    ToolButton_BuscaVeiculo: TToolButton;
    ToolButton2: TToolButton;
    ToolButton_Windows: TToolButton;
    StatusBar1: TStatusBar;
    ToolButton_TaxaOcupacao: TToolButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    JvClock1: TJvClock;
    Button1: TButton;
    N5: TMenuItem;
    AtividadesHotelaria1: TMenuItem;
    RelaodeEntradadeSaida: TMenuItem;
    N6: TMenuItem;
    JvCaptionPanel_TurmaAndamento: TJvCaptionPanel;
    JvShape6: TJvShape;
    DBGrid_Turma: TDBGrid;
    DBNavigator_CursosEmAndamento: TDBNavigator;
    ToolBar_PesquisarTurmaAndamento: TToolBar;
    Query_Historico: TQuery;
    DSQ_Historico: TDataSource;
    Label_Inicio: TLabel;
    Label_Final: TLabel;
    JvDateEdit_Inicio: TJvDateEdit;
    JvDateEdit_DataTermino: TJvDateEdit;
    ToolButton4: TToolButton;
    JvShape_EstatisticaCursosAndamento: TJvShape;
    JvExpressButton_EstatisticaCursosAndamento: TJvExpressButton;
    Query_HistoricoPREDIO: TStringField;
    Query_HistoricoAPTO: TFloatField;
    Query_HistoricoDATASAIDA: TStringField;
    Query_HistoricoDATAENTRADA: TStringField;
    Query_HistoricoFICHA: TStringField;
    Query_HistoricoNOME: TStringField;
    Query_HistoricoIDENTIDADE: TStringField;
    ToolButton5: TToolButton;
    procedure CadastrodeCamasporAptoClick(Sender: TObject);
    procedure CadastrodeUsuriosClick(Sender: TObject);
    procedure ReciboNovo1Click(Sender: TObject);
    procedure ReciboPPClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HistoricoClick(Sender: TObject);
    procedure TabeladePrecoClick(Sender: TObject);
    procedure TabeladePostoClick(Sender: TObject);
    procedure CadastrodasUnidadesDeceaClick(Sender: TObject);
    procedure TabeladePrecosparaResidenteClick(Sender: TObject);
    procedure CadastrodeCursosIPV1Click(Sender: TObject);
    procedure ArrecadacoaorMesClick(Sender: TObject);
    procedure CadastrodaReserva1Click(Sender: TObject);
    procedure CadastrodosResponsveis1Click(Sender: TObject);
    procedure SituacaoDeHospedagemClick(Sender: TObject);
    procedure LogsdoSistema1Click(Sender: TObject);
    procedure AlterarnmerodaFicha1Click(Sender: TObject);
    procedure SpeedButton_DicasClick(Sender: TObject);
    procedure AlterarnmerodoRecibo1Click(Sender: TObject);
    procedure Reserva1Click(Sender: TObject);
    procedure RelaodeHospede1Click(Sender: TObject);
    procedure ToolButton_ReservaClick(Sender: TObject);
    procedure ToolButton_HospedeClick(Sender: TObject);
    procedure ToolButton_FacilidadeClick(Sender: TObject);
    procedure ToolButton_MovimentoClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure RetornarParaWindowsClick(Sender: TObject);
    procedure AuxilioAdministracaoClick(Sender: TObject);
    procedure RegrasdeDescontoClick(Sender: TObject);
    procedure RelaodeHospedescomEMail1Click(Sender: TObject);
    procedure RegrasdeDirias1Click(Sender: TObject);
    procedure abeladePreco1Click(Sender: TObject);
    procedure ToolButton_BuscaVeiculoClick(Sender: TObject);
    procedure RelacaodeHospedagemClick(Sender: TObject);
    procedure CancelarHospedagem1Click(Sender: TObject);
    procedure Geral1Click(Sender: TObject);
    procedure ToolButton_TaxaOcupacaoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure AtividadesHotelaria1Click(Sender: TObject);
    procedure RelaodeEntradadeSaidaClick(Sender: TObject);
    procedure JvExpressButton_EstatisticaCursosAndamentoClick(Sender: TObject);
    procedure RelacaoDeSaidas(Sender: TObject);
  private
    { Private declarations }
  public    { Public declarations }
     VS_Data_Inicial, VS_Data_Final: String;
  end;

var
  Form_Menu_Pri_G: TForm_Menu_Pri_G;

implementation

uses Cad_Apto, Cad_Responsaveis, Cad_Usuario, Cad_Tab_Preco, Abertura,
  Cad_Hospede, MontaReserva, Sel_Recibo, Sel_Recibo_Pagamento,
  Auditoria_Historico, Cad_Tab_Posto, Cad_Facilidades, Cad_Decea,
  Cad_Tab_Residente, Cad_Curso, Est_Arrecadacao_Mes, Utilizacao_Log_Hotel,
  Cad_Reserva, Selecao_Data, Situacao_Hospede, Altera_Ficha,
  Dicas_Utilizacao, Altera_Recibo, Rel_Rela_Reserva, Rel_RelacaoHospede,
  AuxilioAdministracao, CadRegrasDeDesconto, Rel_EMailHospede,
  CadRegrasDeDiarias, RelacaoVeiculos, Relacao_Hospedes, Excluir_Hospede,
  Consulta_Hospedagem, Est_Arrecadacao_Mes15, Selecao_Reserva,
  Est_TaxaDeOcupacao, MontaMapa, AtividadeHotelaria, RelacaoExcel, Apto,
  Estatistica_Hospedagem, Movimentos_Hotel, Est_Arrecadacao_Situacao;


{$R *.DFM}

//------------------------------------------------------------------------------
// Modulo Principal
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.FormActivate(Sender: TObject);
var
   Status: Boolean;
begin
   JvDateEdit_Inicio.Text:= DateToStr(Date);
   JvDateEdit_DataTermino.Text:= DateToStr(Date);
//   JvDateEdit_Inicio.Date:= Date;
//   JvDateEdit_DataTermino.Date:= Date;

   RelacaoDeSaidas(Sender);

   Funcoes.SetManualAjuda('C:\DataBase_ICEA\DB_HotelMapa\MANUAL_Hotel_G.htM');

   if Funcoes.GetPrivilegio = 'N' then
   begin
      CadastrodeHospede1.Visible:= False;
      ToolButton_Hospede.Visible:= False;
      ToolButton_Reserva.Visible:= False;
      RelacaodeHospedagem.Visible:= False;
      FechamentoDaConta.Visible:= False;
      ToolButton_Facilidade.Visible:= False;
      ToolButton_BuscaVeiculo.Visible:= False;
   end
   else
   begin
      if Funcoes.GetPrivilegio = 'G' then
         Status:= True
      else
         Status:= False;

      RelatoriodiriodemovimentodoHoteldeTransito.Visible:= Status;
      ArrecadacoaorMes.Visible:= Status;
      RelacaodeHospedagem.Visible:= Status;
      ToolButton_Movimento.Visible:= Status;
      ToolButton_QuadroOcup.Visible:= Status;
      CadastrodeUsurios.Visible:= Status;
      SituacaoDeHospedagem.Visible:= Status;
      N4.Visible:= Status;
   end;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Procedure para chamar o Cadastro de Apartamento.
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.CadastrodeCamasporAptoClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao('Cadastro de Camas por Apto - Acessou');
   Form_Cad_Apto.Show;
end;

//------------------------------------------------------------------------------
// Procedure para chamar o Cadastro de Responsaveis pelo Hotel de Transito
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.CadastrodosResponsveis1Click(Sender: TObject);
begin
   Funcoes.Log_Recepcao('Cadastro de Responsaveis - Acessou');
   Form_Cad_Responsaveis.Show;
end;

//------------------------------------------------------------------------------
// Procedure para chamar o Cadastro de Usuario
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.CadastrodeUsuriosClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao('Cadastro de Usuario - Acessou');
   Form_Cad_Usuario.Show;
end;

//------------------------------------------------------------------------------
// Procedure para chamar o Cadastro da Tabela de Preco
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.TabeladePrecoClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao('Tabela de Preço - Acessou');
   Form_Tab_Preco.Show;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.FormClose(Sender: TObject;var Action: TCloseAction);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Procedure para chamar o Cadastro de Hospede
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.ToolButton_HospedeClick(Sender: TObject);
begin
  Funcoes.SetCad_Hospede(False);
  Funcoes.Log_Recepcao('Cadastro de Hospede - Acessou');
  Form_Abertura.VS_Quem_Chamou:= 'Menu';
  Form_Cad_Hospede.ShowModal;
end;

//------------------------------------------------------------------------------
// Procedure para chamar o Cadastro de Reserva
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.ToolButton_ReservaClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao('Cadastro de Reservas - Acessou ');
   Form_MontaReserva.Show;
end;

//------------------------------------------------------------------------------
// Procedure para chamar o Fechamento da Conta
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.ReciboNovo1Click(Sender: TObject);
begin
   Funcoes.Log_Recepcao('Cadastro de Camas por Apto - Acessou');
  Funcoes.Log_Recepcao('G-Fechamento');
  Form_Fecha_Conta.ShowModal;
end;

//------------------------------------------------------------------------------
// Procedure para chamar o Recibo de Pagamento
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.ReciboPPClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao('Recibo Pagamento - Acessou');
  Form_Recibo_Pagamento.Show;
end;

//------------------------------------------------------------------------------
// Procedure para chamar o Cadastro do Historico de hospedagem
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.HistoricoClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao('Cadastro Historico - Acessou');
   Form_Auditoria_Historico.Show;
end;

//------------------------------------------------------------------------------
// Procedure para chamar o Cadastro da Tabela de Posto
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.TabeladePostoClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao('Tab. Posto - Acessou');
   Form_Tab_Posto.Show;
end;

//------------------------------------------------------------------------------
// Procedure para tratar do Cadastro das Facilidades ao Hospede
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.ToolButton_FacilidadeClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao('Cadastro de Facilidade - Acessou');
   Form_Cad_Facilidades.Show;
end;

//------------------------------------------------------------------------------
// Procedure para tratar do Cadastro das Unidades do Decea
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.CadastrodasUnidadesDeceaClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao('Cadastro de Unid. DECEA - Acessou');
   Form_Cad_Decea.Show;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da Tabela de Preco para Residente
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.TabeladePrecosparaResidenteClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao('Tab. Preço Res. - Acessou');

   Form_Tab_Residente.Show;
end;

//------------------------------------------------------------------------------
// Procedure para tratar do Cadastro dos Cursos IPV
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.CadastrodeCursosIPV1Click(Sender: TObject);
begin
   Funcoes.Log_Recepcao('Cadastro de Cursos ICEA - Acessou');
   Application.CreateForm(TForm_Cad_Curso, Form_Cad_Curso);
   Form_Cad_Curso.Show;
end;

//------------------------------------------------------------------------------
// Procedure para tratar do Janela de Estatistica de arrecadacao por mes
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.ArrecadacoaorMesClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao('Estatistica de Arrecadação por Mês - Acessou');
   Form_Est_Arrecadacao_Mes.ShowModal;
end;

//------------------------------------------------------------------------------
// Procedure para tratar do Janela de utilizacao do sistema
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.LogsdoSistema1Click(Sender: TObject);
begin
   Form_Utilizacao_Log_Hotel.ShowModal;
end;

//------------------------------------------------------------------------------
// Procedure para chamar a form de tratamento da reserva
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.CadastrodaReserva1Click(Sender: TObject);
begin
   Funcoes.Log_Recepcao('Cadastro de Reservas - Acessou');
   Form_Cad_Reserva.Show;
end;

//------------------------------------------------------------------------------
// Procedure para tratar do relatorio diario de movimento de hotel de transito-Entrada
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.ToolButton_MovimentoClick(Sender: TObject);
begin
//   Funcoes.SetRelatorio(0);
//   Funcoes.Log_Recepcao('Relatorio de Movimentos - Acessou');
//   Form_Movimento.Show;
   Form_Reletorio_Movimento_Hospedagem.ShowModal;
end;

procedure TForm_Menu_Pri_G.SituacaoDeHospedagemClick(Sender: TObject);
begin
   Form_Situacao_Hospede.ShowModal;
end;

//------------------------------------------------------------------------------
// Chamada da janela de tratamento da alteracao do numero da ficha
//-----------------------------------------------------------------------------
procedure TForm_Menu_Pri_G.AlterarnmerodaFicha1Click(Sender: TObject);
begin
   Funcoes.Log_Recepcao('Alterar numero da Ficha - Acessou');
   Form_Altera_Ficha.Show;
end;

procedure TForm_Menu_Pri_G.SpeedButton_DicasClick(Sender: TObject);
begin
   Form_Dicas_Utilizacao.ShowModal;
end;

procedure TForm_Menu_Pri_G.AlterarnmerodoRecibo1Click(Sender: TObject);
begin
   Funcoes.Log_Recepcao('Alterar Numero de Recibo  - Acessou');
   Form_Altera_Recibo.Show;
end;

procedure TForm_Menu_Pri_G.Reserva1Click(Sender: TObject);
begin
   Form_SelecaoReserva.ShowModal;
end;

procedure TForm_Menu_Pri_G.RelaodeHospede1Click(Sender: TObject);
begin
   QRListForm_Rel_RelacaoHospede.Preview;
end;

procedure TForm_Menu_Pri_G.RetornarParaWindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

procedure TForm_Menu_Pri_G.AuxilioAdministracaoClick(Sender: TObject);
begin
   Form_AuxilioAdminstracao.Show;
end;

procedure TForm_Menu_Pri_G.RegrasdeDescontoClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao('Cadastro de Regras de Pagamento  - Acessou');
   Form_CadRegrasDeDesconto.ShowModal;
end;

procedure TForm_Menu_Pri_G.RelaodeHospedescomEMail1Click(Sender: TObject);
begin
   QRListForm_Rel_EMailHospede.Preview;
end;

procedure TForm_Menu_Pri_G.RegrasdeDirias1Click(Sender: TObject);
begin
   Funcoes.Log_Recepcao('Cadastro de Regras de Diarias  - Acessou');
   Application.CreateForm(TForm_CadRegrasDeDiarias, Form_CadRegrasDeDiarias);
   Form_CadRegrasDeDiarias.Show;
end;

procedure TForm_Menu_Pri_G.abeladePreco1Click(Sender: TObject);
begin
   Funcoes.Log_Recepcao('Cadastro da Tabela de Preços  - Acessou');
   Form_Tab_Preco.Show;
end;

procedure TForm_Menu_Pri_G.ToolButton_BuscaVeiculoClick(Sender: TObject);
begin
   Application.CreateForm(TForm_RelacaoVeiculos, Form_RelacaoVeiculos);
   Form_RelacaoVeiculos.ShowModal;
end;

procedure TForm_Menu_Pri_G.RelacaodeHospedagemClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao('Relação de Hospedes - Acessou');
   Application.CreateForm(TForm_RelacaoHospedes, Form_RelacaoHospedes);
   Form_RelacaoHospedes.ShowModal;
end;

procedure TForm_Menu_Pri_G.CancelarHospedagem1Click(Sender: TObject);
begin
   Funcoes.Log_Recepcao('Cancelamento de Hospedagem - Acessou');
   Form_Excluir_Hospede.Show;
end;

procedure TForm_Menu_Pri_G.Geral1Click(Sender: TObject);
begin
Form_Consulta_Hospedagem.ShowModal;
end;

procedure TForm_Menu_Pri_G.ToolButton_TaxaOcupacaoClick(Sender: TObject);
begin
   Form_Estatistica_Hospedagem.ShowModal;
//   Form_Movimentos_Hotel.ShowModal;
//   Form_Est_TaxaDeOcupacao.ShowModal;
end;

procedure TForm_Menu_Pri_G.Button1Click(Sender: TObject);
begin
    Form1.Show
end;

procedure TForm_Menu_Pri_G.AtividadesHotelaria1Click(Sender: TObject);
begin
   Form_Estatistica_Hospedagem.ShowModal;
end;

procedure TForm_Menu_Pri_G.RelaodeEntradadeSaidaClick(Sender: TObject);
begin
   Form_RelacaoExcel.ShowModal;
end;

//------------------------------------------------------------------------------
//
procedure TForm_Menu_Pri_G.RelacaoDeSaidas(Sender: TObject);
var
    VS_Comando: String;
begin
   if JvDateEdit_DataTermino.Text = '  /  /    ' then
      JvDateEdit_DataTermino.Text:= JvDateEdit_Inicio.Text;

   VS_Comando:= 'Select hi.identidade, Hi.Predio, Hi.Apto, Hi.DataSaida, Hi.DataEntrada, Hi.Ficha, Ho.Nome '+
                ' From historico Hi, Hospede Ho '+
                ' where hi.Identidade = Ho.Identidade '+
                ' and   Hi.ano = '+Funcoes.AnoAtual+
                ' and   (DataSaida >= To_date('+#39+JvDateEdit_Inicio.Text+#39+', '+#39+'DD/MM/YYYY'+#39+') '+
                ' and   DataSaida <= To_date('+#39+JvDateEdit_DataTermino.Text+#39+', '+#39+'DD/MM/YYYY'+#39+'))'+
                ' order by DataSaida';
   Query_Historico.Close;
   Query_Historico.Sql.Clear;
   Query_Historico.Sql.Add(VS_Comando);
   Query_Historico.Open;
end;

procedure TForm_Menu_Pri_G.JvExpressButton_EstatisticaCursosAndamentoClick(Sender: TObject);
var
   objExcel,Sheet: Variant;
    cTitulo : string;
   i : integer;
begin

   // Cria uma instancia para utilizar o Excel

   cTitulo := 'Relação de Saídas';
   objExcel := CreateOleObject('Excel.Application');
   objExcel.Visible := True;
   objExcel.Caption := cTitulo;

   // Adiciona planilha(sheet)
   objExcel.Workbooks.Add;
   objExcel.Workbooks[1].Sheets.Add;
   objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;
   Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

   // Preenchendo as Colunas
   Sheet.Range['A1'] := 'PRÉDIO';
   Sheet.Range['B1'] := 'APTO';
   Sheet.Range['C1'] := 'Nº FICHA';
   Sheet.Range['D1'] := 'NOME';
   Sheet.Range['E1'] := 'ENTRADA';
   Sheet.Range['F1'] := 'SAIDA';

   // por aqui tu limparias a planilha

   i:= 2;
   Query_Historico.First;
   while not Query_Historico.eof do
   begin
       Sheet.Cells[i,1] := Query_Historico.FieldByName('Predio').AsString;
       Sheet.Cells[i,2] := Query_Historico.FieldByName('Apto').AsString;
       Sheet.Cells[i,3] := Query_Historico.FieldByName('ficha').AsString;
       Sheet.Cells[i,4] := Query_Historico.FieldByName('nome').AsString;
       Sheet.Cells[i,5] := Query_Historico.FieldByName('dataEntrada').AsString;
       Sheet.Cells[i,6] := Query_Historico.FieldByName('DataSaida').AsString;
       i:= i+1;
       Query_Historico.Next;
   end;
end;


end.
