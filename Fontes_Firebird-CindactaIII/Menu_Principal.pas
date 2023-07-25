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
  Menus, ExtCtrls, Rotinas, Grids, DBGrids, Db, Buttons, ToolWin,
  ComCtrls, ImgList, StdCtrls, JvGIF, JvGradient, JvGrdCpt, jpeg,
  IBCustomDataSet, IBTable;

type
  TForm_Menu_Pri_G = class(TForm)
    MainMenu_Gerente: TMainMenu;
    CadastrodeHospede1: TMenuItem;
    CadastrodeCamasporApto: TMenuItem;
    CadastrodeUsurios: TMenuItem;
    Reserva: TMenuItem;
    CadastrodeHospede: TMenuItem;
    Recibo_FecgamentoDaConta: TMenuItem;
    RetornarParaWindows: TMenuItem;
    ContaFechadaParaPagamento: TMenuItem;
    TabeladePreco: TMenuItem;
    N1: TMenuItem;
    Consulta: TMenuItem;
    Historico: TMenuItem;
    TabeladePosto: TMenuItem;
    CancelarHospedagem: TMenuItem;
    N2: TMenuItem;
    StatusBar: TStatusBar;
    Facilidades: TMenuItem;
    CadastrodasUnidadesDecea: TMenuItem;
    TabeladePrecosparaResidente: TMenuItem;
    CadastrodeCursosIPV1: TMenuItem;
    Estatistica: TMenuItem;
    QuadrodeOcupao1: TMenuItem;
    ArrecadaoporMs1: TMenuItem;
    ArrecadacaoporSituacao: TMenuItem;
    N4: TMenuItem;
    ReservarealizadaatravsdoMapa1: TMenuItem;
    CadastrodaReserva1: TMenuItem;
    CadastrodosResponsveis1: TMenuItem;
    Cadastro1: TMenuItem;
    Situao1: TMenuItem;
    RelatriodiriodemovimentodoHoteldeTrnsito1: TMenuItem;
    N7: TMenuItem;
    PopupMenu1: TPopupMenu;
    ExcluiFichacadastradaerrada1: TMenuItem;
    AlterarnmerodaFicha1: TMenuItem;
    AlterarnmerodoRecibo1: TMenuItem;
    Relatrios1: TMenuItem;
    Reserva1: TMenuItem;
    RelaodeHospede1: TMenuItem;
    ToolBar2: TToolBar;
    ToolButton_Hospede: TToolButton;
    ToolButton_Facilidade: TToolButton;
    ToolButton_Reserva: TToolButton;
    ToolButton_Ajuda: TToolButton;
    ToolButton_Movimento: TToolButton;
    ToolButton_QuadroOcup: TToolButton;
    ToolButton_Windows: TToolButton;
    Image_Brasao: TImage;
    UtilizacaoDoSistema: TMenuItem;
    AuxlioaAdministrao1: TMenuItem;
    Ajustar1: TMenuItem;
    procedure CadastrodeCamasporAptoClick(Sender: TObject);
    procedure CadastrodeUsuriosClick(Sender: TObject);
    procedure ReciboNovo1Click(Sender: TObject);
    procedure ContaFechadaParaPagamentoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HistoricoClick(Sender: TObject);
    procedure TabeladePrecoClick(Sender: TObject);
    procedure TabeladePostoClick(Sender: TObject);
    procedure CancelarHospedagemClick(Sender: TObject);
    procedure SpeedButton_ManualClick(Sender: TObject);
    procedure CadastrodasUnidadesDeceaClick(Sender: TObject);
    procedure TabeladePrecosparaResidenteClick(Sender: TObject);
    procedure CadastrodeCursosIPV1Click(Sender: TObject);
    procedure ArrecadaoporMs1Click(Sender: TObject);
    procedure ArrecadacaoporSituacaoClick(Sender: TObject);
    procedure CadastrodaReserva1Click(Sender: TObject);
    procedure CadastrodosResponsveis1Click(Sender: TObject);
    procedure Situao1Click(Sender: TObject);
    procedure ExcluiFichacadastradaerrada1Click(Sender: TObject);
    procedure AlterarnmerodaFicha1Click(Sender: TObject);
    procedure SpeedButton_DicasClick(Sender: TObject);
    procedure AlterarnmerodoRecibo1Click(Sender: TObject);
    procedure Reserva1Click(Sender: TObject);
    procedure RelaodeHospede1Click(Sender: TObject);
    procedure ToolButton_ReservaClick(Sender: TObject);
    procedure ToolButton_HospedeClick(Sender: TObject);
    procedure ToolButton_FacilidadeClick(Sender: TObject);
    procedure ToolButton_MovimentoClick(Sender: TObject);
    procedure ToolButton_QuadroOcupClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure RetornarParaWindowsClick(Sender: TObject);
    procedure UtilizacaoDoSistemaClick(Sender: TObject);
    procedure AuxlioaAdministrao1Click(Sender: TObject);
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
  Auditoria_Historico, Cad_Tab_Posto, Excluir_Hospede, Cad_Facilidades,
  Manual_OnLine, Cad_Decea, Module, Cad_Curso, Estatitica,
  Est_Arrecadacao_Mes, Est_Arrecadacao_Situacao, Cad_Reserva, Selecao_Data,
  Situacao_Hospede, Exclui_Ficha, Altera_Ficha, Dicas_Utilizacao,
  Altera_Recibo, Rel_Rela_Reserva, Relacao_Hospede, Cad_Tab_Residente,
  Cad_Tab_ResidenteBaseAreaManaus, Utilizacao_Log_Hotel,
  AuxilioAdministracao;

{$R *.DFM}

//------------------------------------------------------------------------------
// Modulo Principal
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.FormActivate(Sender: TObject);
var
   Status: Boolean;
   dia, mes, ano: Word;
begin
   Image_Brasao.Picture.LoadFromFile('C:\DataBase_ICEA\DBHotel\BrasaoCinza.jpg');
   Funcoes.SetManualAjuda('C:\DataBase_ICEA\DB_HotelMapa\MANUAL_Hotel_G.htM');

   if Funcoes.GetPrivilegio = 'G' then
      Status:= True
   else
      Status:= False;

   Historico.Visible:= Status;
   Estatistica.Visible:= Status;
   CancelarHospedagem.Visible:= Status;
   CadastrodeUsurios.Visible:= Status;
   N4.Visible:= Status;

   Recibo_FecgamentoDaConta.Visible:= UtilizaOpcaoParaPagamento;
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
   Funcoes.Log_Recepcao('G-Cad. Cama');
   Form_Cad_Apto.Show;
end;

//------------------------------------------------------------------------------
// Procedure para chamar o Cadastro de Responsaveis pelo Hotel de Transito
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.CadastrodosResponsveis1Click(Sender: TObject);
begin
   Form_Cad_Responsaveis.Show;
end;

//------------------------------------------------------------------------------
// Procedure para chamar o Cadastro de Usuario
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.CadastrodeUsuriosClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao('G-Cad. Usuário');
   Form_Cad_Usuario.Show;
end;

//------------------------------------------------------------------------------
// Procedure para chamar o Cadastro da Tabela de Preco
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.TabeladePrecoClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao('G-Tab. Preço');
   Form_Tab_Preco.Show;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Procedure para chamar o Cadastro de Hospede
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.ToolButton_HospedeClick(Sender: TObject);
begin
  Funcoes.SetCad_Hospede(False);
  Funcoes.Log_Recepcao('G-Cad. Hospede');
  Form_Abertura.VS_Quem_Chamou:= 'Menu';
  Form_Cad_Hospede.ShowModal;
end;

//------------------------------------------------------------------------------
// Procedure para chamar o Cadastro de Reserva
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.ToolButton_ReservaClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao('G-Reserva');
   Form_MontaReserva.Show;
end;

//------------------------------------------------------------------------------
// Procedure para chamar o Fechamento da Conta
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.ReciboNovo1Click(Sender: TObject);
begin
  Funcoes.Log_Recepcao('G-Fechamento');
  Form_Fecha_Conta.ShowModal;
end;

//------------------------------------------------------------------------------
// Procedure para chamar o Recibo de Pagamento
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.ContaFechadaParaPagamentoClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao('G-Conta Fech. PP');
  Form_Recibo_Pagamento.Show;
end;

//------------------------------------------------------------------------------
// Procedure para chamar o Cadastro do Historico de hospedagem
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.HistoricoClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao('G-Historico');
   Form_Auditoria_Historico.Show;
end;

//------------------------------------------------------------------------------
// Procedure para chamar o Cadastro da Tabela de Posto
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.TabeladePostoClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao('G-Tab. Posto');
   Form_Tab_Posto.Show;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da Exclusao do Hospede
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.CancelarHospedagemClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao('G-Cancelar Hosp.');
   Form_Excluir_Hospede.Show;
end;

//------------------------------------------------------------------------------
// Procedure para tratar do Cadastro das Facilidades ao Hospede
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.ToolButton_FacilidadeClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao('G-Facilidade');
   Form_Cad_Facilidades.Show;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da Chamada para o manual On-Line
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.SpeedButton_ManualClick(Sender: TObject);
begin
   Form_ManualOnLine.ShowModal;
end;

//------------------------------------------------------------------------------
// Procedure para tratar do Cadastro das Unidades do Decea
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.CadastrodasUnidadesDeceaClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao('G-Unid. DECEA');
   Form_Cad_Decea.Show;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da Tabela de Preco para Residente
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.TabeladePrecosparaResidenteClick(Sender: TObject);
begin
   Funcoes.Log_Recepcao('G-Tab. Preço Res.');
   if DM.Habilitado_Para = 'HOTEL CTA' then
      Form_Tab_Residente.Show
   else
      if DM.Habilitado_Para = 'BASE AREA MANAUS' then
         Form_Tab_ResidenteBaseAreaManaus.Show
      else
         if ((DM.Habilitado_Para = 'NATAL') or (DM.Habilitado_Para = 'CINDACTA III')) then
             Form_Tab_Residente.Show
end;

//------------------------------------------------------------------------------
// Procedure para tratar do Cadastro dos Cursos IPV
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.CadastrodeCursosIPV1Click(Sender: TObject);
begin
   Funcoes.Log_Recepcao('G-Cursos ICEA');
   Form_Cad_Curso.Show;
end;

//------------------------------------------------------------------------------
// Procedure para tratar do Janela de Estatistica
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.ToolButton_QuadroOcupClick(Sender: TObject);
begin
   Form_AuxilioAdminstracao.ShowModal;
end;

//------------------------------------------------------------------------------
// Procedure para tratar do Janela de Estatistica de arrecadacao por mes
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.ArrecadaoporMs1Click(Sender: TObject);
begin
   Form_Est_Arrecadacao_Mes.ShowModal;
end;

//------------------------------------------------------------------------------
// Procedure para tratar do Janela de Estatistica de arrecadaao por situacao
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.ArrecadacaoporSituacaoClick(Sender: TObject);
begin
   Form_Est_Arrecadacao_Situacao.ShowModal;
end;

//------------------------------------------------------------------------------
// Procedure para chamar a form de tratamento da reserva
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.CadastrodaReserva1Click(Sender: TObject);
begin
   Form_Cad_Reserva.Show;
end;

//------------------------------------------------------------------------------
// Procedure para tratar do relatorio diario de movimento de hotel de transito-Entrada
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.ToolButton_MovimentoClick(Sender: TObject);
begin
   Funcoes.SetRelatorio(1);
   Form_Movimento.Show;
end;

procedure TForm_Menu_Pri_G.Situao1Click(Sender: TObject);
begin
   Form_Situacao_Hospede.ShowModal;
end;

procedure TForm_Menu_Pri_G.ExcluiFichacadastradaerrada1Click(Sender: TObject);
begin
   Form_Exclui_Ficha.Show;
end;

//------------------------------------------------------------------------------
// Chamada da janela de tratamento da alteracao do numero da ficha
//-----------------------------------------------------------------------------
procedure TForm_Menu_Pri_G.AlterarnmerodaFicha1Click(Sender: TObject);
begin
   Form_Altera_Ficha.Show;
end;

procedure TForm_Menu_Pri_G.SpeedButton_DicasClick(Sender: TObject);
begin
   Form_Dicas_Utilizacao.ShowModal;
end;

procedure TForm_Menu_Pri_G.AlterarnmerodoRecibo1Click(Sender: TObject);
begin
  Form_Altera_Recibo.Show;
end;

procedure TForm_Menu_Pri_G.Reserva1Click(Sender: TObject);
begin
   QRListForm_Rel_Reserva.Preview;
end;

procedure TForm_Menu_Pri_G.RelaodeHospede1Click(Sender: TObject);
begin
   Form_Rel_Hospede.Preview;
end;

procedure TForm_Menu_Pri_G.RetornarParaWindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

//------------------------------------------------------------------------------
// Procedure para tratar do Janela de utilizacao do sistema
//------------------------------------------------------------------------------

procedure TForm_Menu_Pri_G.UtilizacaoDoSistemaClick(Sender: TObject);
begin
   Form_UtilizacaoDoSistema.Show;
end;

procedure TForm_Menu_Pri_G.AuxlioaAdministrao1Click(Sender: TObject);
begin
   Form_AuxilioAdminstracao.Show;
end;


end.
