//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : P_Hotel.PAS                                    //
//                                                                            //
// DESCRICAO                 : Modulo principal do sistema.                   //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//                                                                            //
// INICIO DA ELABORACAO      : 11/08/1999                                     //
//                                                                            //
// ATUALIZADO                : 08/03/2003                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

program P_Hotel;

uses
  Forms,
  Abertura in 'Abertura.pas' {Form_Abertura},
  Cad_Apto in 'Cad_Apto.pas' {Form_Cad_Apto},
  Cad_Curso in 'Cad_Curso.pas' {Form_Cad_Curso},
  Cad_Decea in 'Cad_Decea.pas' {Form_Cad_Decea},
  Cad_Dependente in 'Cad_Dependente.pas' {Form_Cad_Dep_Hospede},
  Cad_Facilidades in 'Cad_Facilidades.pas' {Form_Cad_Facilidades},
  Cad_Hospede in 'Cad_Hospede.pas' {Form_Cad_Hospede},
  Cad_Reserva in 'Cad_Reserva.pas' {Form_Cad_Reserva},
  Cad_Responsaveis in 'Cad_Responsaveis.pas' {Form_Cad_Responsaveis},
  Cad_Tab_Posto in 'Cad_Tab_Posto.pas' {Form_Tab_Posto},
  Cad_Tab_Preco in 'Cad_Tab_Preco.pas' {Form_Tab_Preco},
  Cad_Tab_Residente in 'Cad_Tab_Residente.pas' {Form_Tab_Residente},
  Cad_Usuario in 'Cad_Usuario.pas' {Form_Cad_Usuario},
  Divisas in '..\..\..\..\Rotinas Gerais\Divisas.pas' {Form_Divisas},
  Est_Arrecadacao_Mes in 'Est_Arrecadacao_Mes.pas' {Form_Est_Arrecadacao_Mes},
  Est_Arrecadacao_Situacao in 'Est_Arrecadacao_Situacao.pas' {Form_Reletorio_Movimento_Hospedagem},
  Exclui_Ficha in 'Exclui_Ficha.pas' {Form_Exclui_Ficha},
  Menu_Principal in 'Menu_Principal.pas' {Form_Menu_Pri_G},
  Module in 'Module.pas' {DM: TDataModule},
  PorExtenso in 'PorExtenso.pas',
  Rel_Apartamento in 'Rel_Apartamento.pas' {QRLabelsForm_Apto: TQuickRep},
  Rel_Calculos in 'Rel_Calculos.pas' {QRListForm_Calculos},
  Rel_Log_Sistema in 'Rel_Log_Sistema.pas' {QRMDForm_Log_Sistema: TQuickRep},
  Rel_Mapa_Ocupacao_R in 'Rel_Mapa_Ocupacao_R.pas' {QRListForm_Mapa_Hospedagem_R},
  Relatorio_Movimento_Entrada in 'Relatorio_Movimento_Entrada.pas' {QRListForm_Movimento_Entrada},
  Relatorio_Movimento_Saida in 'Relatorio_Movimento_Saida.pas' {QRListForm_Movimento_Saida},
  Rotinas in 'Rotinas.pas',
  Sel_Apto in 'Sel_Apto.pas' {Form_Sel_Predio},
  Sel_Hospede in 'Sel_Hospede.pas' {Form_Sel_Hospede},
  Sel_Recibo in 'Sel_Recibo.pas' {Form_Fecha_Conta},
  Sel_Recibo_Pagamento in 'Sel_Recibo_Pagamento.pas' {Form_Recibo_Pagamento},
  Selecao_Data in 'Selecao_Data.pas' {Form_Movimento},
  Situacao_Hospede in 'Situacao_Hospede.pas' {Form_Situacao_Hospede},
  Sobre in 'Sobre.pas' {Form_Sobre},
  Splash in 'Splash.pas' {SplashForm},
  Utilizacao_Log_Hotel in 'Utilizacao_Log_Hotel.pas' {Form_Utilizacao_Log_Hotel},
  Altera_Ficha in 'Altera_Ficha.pas' {Form_Altera_Ficha},
  Dicas_Utilizacao in 'Dicas_Utilizacao.pas' {Form_Dicas_Utilizacao},
  Manual_OnLine in 'Manual_OnLine.pas' {Form_ManualOnLine},
  Altera_Recibo in 'Altera_Recibo.pas' {Form_Altera_Recibo},
  Auditoria_Historico in 'Auditoria_Historico.pas' {Form_Auditoria_Historico},
  Rel_Rela_Reserva in 'Rel_Rela_Reserva.pas' {QRListForm_Rel_Reserva: TQuickRep},
  Rel_Rela_Hospede in 'Rel_Rela_Hospede.pas' {QRListForm_Rel_Hospede: TQuickRep},
  Recepcao in 'Recepcao.pas' {Form_MenuRecepcao},
  Rel_MapaOcupacao in 'Rel_MapaOcupacao.pas' {QRListForm_MapaOcupacao},
  MontaReserva in 'MontaReserva.pas' {Form_MontaReserva},
  AuxilioAdministracao in 'AuxilioAdministracao.pas' {Form_AuxilioAdminstracao},
  CadRegrasDeDesconto in 'CadRegrasDeDesconto.pas' {Form_CadRegrasDeDesconto},
  Rel_EMailHospede in 'Rel_EMailHospede.pas' {QRListForm_Rel_EMailHospede: TQuickRep},
  Rel_RelacaoHospede in 'Rel_RelacaoHospede.pas' {QRListForm_Rel_RelacaoHospede: TQuickRep},
  CadRegrasDeDiarias in 'CadRegrasDeDiarias.pas' {Form_CadRegrasDeDiarias},
  RelacaoVeiculos in 'RelacaoVeiculos.pas' {Form_RelacaoVeiculos},
  Relacao_Hospedes in 'Relacao_Hospedes.pas' {Form_RelacaoHospedes},
  Excluir_Hospede in 'Excluir_Hospede.pas' {Form_Excluir_Hospede},
  Consulta_Hospedagem in 'Consulta_Hospedagem.pas' {Form_Consulta_Hospedagem},
  Est_Arrecadacao_Mes15 in 'Est_Arrecadacao_Mes15.pas' {Form_Est_Arrecadacao_Mes15},
  Selecao_Reserva in 'Selecao_Reserva.pas' {Form_SelecaoReserva},
  Voucher in 'Voucher.pas' {Form_Cad_Voucher},
  Mostra_TabPreco in 'Mostra_TabPreco.pas' {Form_MostraTabPreco},
  Mostra_TabPrecoResidente in 'Mostra_TabPrecoResidente.pas' {Form_MostraTabPrecoResidente},
  Previsao_Diaria in 'Previsao_Diaria.pas' {Form_Previsao_Diaria},
  Est_TaxaDeOcupacao in 'Est_TaxaDeOcupacao.pas' {Form_Est_TaxaDeOcupacao},
  MontaMapa in 'MontaMapa.pas' {Form_MontaMapa},
  AtividadeHotelaria in 'AtividadeHotelaria.pas' {Form_AtividadeHotelaria},
  RelacaoExcel in 'RelacaoExcel.pas' {Form_RelacaoExcel},
  Estatistica_Hospedagem in 'Estatistica_Hospedagem.pas' {Form_Estatistica_Hospedagem},
  Movimentos_Hotel in 'Movimentos_Hotel.pas' {Form_Movimentos_Hotel};

{$R *.RES}

begin
  Application.Initialize;
  With TSplashForm.Create(nil) do
  try
    Application.Title := 'Sis - Hotel - ICEA';
    ProgressBar1.Max:= 50;
    show;
    update;

  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm_Abertura, Form_Abertura);
  Application.CreateForm(TForm_Est_TaxaDeOcupacao, Form_Est_TaxaDeOcupacao);
  Application.CreateForm(TForm_MontaMapa, Form_MontaMapa);
  Application.CreateForm(TForm_AtividadeHotelaria, Form_AtividadeHotelaria);
  Application.CreateForm(TForm_RelacaoExcel, Form_RelacaoExcel);
  Application.CreateForm(TForm_Estatistica_Hospedagem, Form_Estatistica_Hospedagem);
  Application.CreateForm(TForm_Movimentos_Hotel, Form_Movimentos_Hotel);
  ProgressBar1.StepBy(1);
    Update;


  Application.CreateForm(TForm_Previsao_Diaria, Form_Previsao_Diaria);
  ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_AuxilioAdminstracao, Form_AuxilioAdminstracao);
  ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_CadRegrasDeDesconto, Form_CadRegrasDeDesconto);
  ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TQRListForm_Rel_EMailHospede, QRListForm_Rel_EMailHospede);
  ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TQRListForm_Rel_RelacaoHospede, QRListForm_Rel_RelacaoHospede);
  ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_RelacaoVeiculos, Form_RelacaoVeiculos);
  ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Excluir_Hospede, Form_Excluir_Hospede);
  ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Consulta_Hospedagem, Form_Consulta_Hospedagem);
  ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Est_Arrecadacao_Mes15, Form_Est_Arrecadacao_Mes15);
  ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_SelecaoReserva, Form_SelecaoReserva);
  ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Cad_Voucher, Form_Cad_Voucher);
  ProgressBar1.StepBy(1);
    Update;


  Application.CreateForm(TForm_MostraTabPreco, Form_MostraTabPreco);
    ProgressBar1.StepBy(1);
    Update;


  Application.CreateForm(TForm_ManualOnLine, Form_ManualOnLine);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Altera_Recibo, Form_Altera_Recibo);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Auditoria_Historico, Form_Auditoria_Historico);
  ProgressBar1.StepBy(1);
  Update;

  Application.CreateForm(TForm_Dicas_Utilizacao, Form_Dicas_Utilizacao);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Altera_Ficha, Form_Altera_Ficha);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Cad_Apto, Form_Cad_Apto);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Cad_Decea, Form_Cad_Decea);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Cad_Dep_Hospede, Form_Cad_Dep_Hospede);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Cad_Facilidades, Form_Cad_Facilidades);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Cad_Hospede, Form_Cad_Hospede);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Cad_Reserva, Form_Cad_Reserva);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Cad_Responsaveis, Form_Cad_Responsaveis);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Tab_Posto, Form_Tab_Posto);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Tab_Preco, Form_Tab_Preco);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Tab_Residente, Form_Tab_Residente);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Cad_Usuario, Form_Cad_Usuario);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Est_Arrecadacao_Mes, Form_Est_Arrecadacao_Mes);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Reletorio_Movimento_Hospedagem, Form_Reletorio_Movimento_Hospedagem);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Exclui_Ficha, Form_Exclui_Ficha);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Menu_Pri_G, Form_Menu_Pri_G);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TQRLabelsForm_Apto, QRLabelsForm_Apto);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TQRListForm_Calculos, QRListForm_Calculos);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TQRMDForm_Log_Sistema, QRMDForm_Log_Sistema);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TQRListForm_Mapa_Hospedagem_R, QRListForm_Mapa_Hospedagem_R);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TQRListForm_Movimento_Entrada, QRListForm_Movimento_Entrada);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TQRListForm_Movimento_Saida, QRListForm_Movimento_Saida);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Sel_Predio, Form_Sel_Predio);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Sel_Hospede, Form_Sel_Hospede);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Fecha_Conta, Form_Fecha_Conta);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Recibo_Pagamento, Form_Recibo_Pagamento);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Movimento, Form_Movimento);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Situacao_Hospede, Form_Situacao_Hospede);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_MenuRecepcao, Form_MenuRecepcao);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TQRListForm_MapaOcupacao, QRListForm_MapaOcupacao);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_MontaReserva, Form_MontaReserva);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TQRListForm_Rel_Reserva, QRListForm_Rel_Reserva);
    ProgressBar1.StepBy(1);
    Update;

  Application.CreateForm(TForm_Utilizacao_Log_Hotel, Form_Utilizacao_Log_Hotel);
    ProgressBar1.StepBy(1);
    Update;
  finally
     free;
  end;
  Application.Run;
end.
