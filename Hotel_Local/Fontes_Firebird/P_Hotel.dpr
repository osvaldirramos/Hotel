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
  Windows,
  Dialogs,
  SysUtils,
  Abertura in 'Abertura.pas' {Form_Abertura},
  Cad_Apto in 'Cad_Apto.pas' {Form_Cad_Apto},
  Cad_Curso in 'Cad_Curso.pas' {Form_Cad_Curso},
  Cad_Dependente in 'Cad_Dependente.pas' {Form_Cad_Dep_Hospede},
  Cad_Facilidades in 'Cad_Facilidades.pas' {Form_Cad_Facilidades},
  Cad_Hospede in 'Cad_Hospede.pas' {Form_Cad_Hospede},
  Cad_Reserva in 'Cad_Reserva.pas' {Form_Cad_Reserva},
  Cad_Responsaveis in 'Cad_Responsaveis.pas' {Form_Cad_Responsaveis},
  Cad_Tab_Residente in 'Cad_Tab_Residente.pas' {Form_Tab_Residente},
  Cad_Usuario in 'Cad_Usuario.pas' {Form_Cad_Usuario},
  Divisas in 'Divisas.pas' {Form_Divisas},
  Est_Arrecadacao_Mes in 'Est_Arrecadacao_Mes.pas' {Form_Est_Arrecadacao_Mes},
  Exclui_Ficha in 'Exclui_Ficha.pas' {Form_Exclui_Ficha},
  Excluir_Hospede in 'Excluir_Hospede.pas' {Form_Excluir_Hospede},
  Menu_Principal in 'Menu_Principal.pas' {Form_Menu_Pri_G},
  Module in 'Module.pas' {DM: TDataModule},
  PorExtenso in 'PorExtenso.pas',
  Rel_Apartamento in 'Rel_Apartamento.pas' {QRLabelsForm_Apto: TQuickRep},
  Rel_Calculos in 'Rel_Calculos.pas' {QRListForm_Calculos},
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
  Altera_Ficha in 'Altera_Ficha.pas' {Form_Altera_Ficha},
  Altera_Recibo in 'Altera_Recibo.pas' {Form_Altera_Recibo},
  Auditoria_Historico in 'Auditoria_Historico.pas' {Form_Auditoria_Historico},
  Rel_Rela_Reserva in 'Rel_Rela_Reserva.pas' {QRListForm_Rel_Reserva: TQuickRep},
  Mostra_TabPreco in 'Mostra_TabPreco.pas' {Form_MostraTabPreco},
  Cad_Tab_ResidenteBaseAreaManaus in 'Cad_Tab_ResidenteBaseAreaManaus.pas' {Form_Tab_ResidenteBaseAreaManaus},
  Mostra_TabPrecoResidente in 'Mostra_TabPrecoResidente.pas' {Form_MostraTabPrecoResidente},
  Mostra_TabPrecoResidenteBaseAreaManaus in 'Mostra_TabPrecoResidenteBaseAreaManaus.pas' {Form_MostraTabPrecoResidenteBaseAereaManaus},
  Recepcao in 'Recepcao.pas' {Form_MenuRecepcao},
  MontaReserva in 'MontaReserva.pas' {Form_MontaReserva},
  Rel_MapaOcupacao in 'Rel_MapaOcupacao.pas' {QRListForm_MapaOcupacao},
  Relacao_Hospede in 'Relacao_Hospede.pas' {Form_Rel_Hospede: TQuickRep},
  Utilizacao_Log_Hotel in 'Utilizacao_Log_Hotel.pas' {Form_UtilizacaoDoSistema},
  Rel_UtilizacaoSistema in 'Rel_UtilizacaoSistema.pas' {Form_Rel_UtilizacaoSistema: TQuickRep},
  AuxilioAdministracao in 'AuxilioAdministracao.pas' {Form_AuxilioAdminstracao},
  CancelamentoDeHospedagem in 'CancelamentoDeHospedagem.pas' {Form_CancelamentoDeHospedagem},
  CadRegrasDeDiarias in 'CadRegrasDeDiarias.pas' {Form_CadRegrasDeDiarias},
  Cad_Decea in 'Cad_Decea.pas' {Form_Cad_Decea},
  Cad_Tab_Posto in 'Cad_Tab_Posto.pas' {Form_Tab_Posto};

{$R *.RES}


var
   Handle: THandle;
begin
    //--------------------------------------
   // Verifica se a aplicacao ja esta aberto

   if FileExists('C:\DataBase_ICEA\DBHotel\servidor.cnf') = False then
   begin
      MessageDlg('O arquivo Servidor.cnf não foi encontrado na pasta "C:\DataBase_ICEA\DBHotel" '+#13+'Este arquivo contém o endereço do Banco de Dados'+#13+#13+'Favor entrar em contato com o responsável',mtError, [mbOk],0);
      Application.terminate;
   end
   else
   begin
     Handle := FindWindow('Form_Abertura', nil);
     if Handle <> 0 then
     begin
        MessageDlg('O Sis-Hotel já está aberto...',mtError, [mbOk],0);
        if not IsWindowVisible(Handle) then
           ShowWindow(Handle, SW_RESTORE);
        SetForegroundWindow(Handle);
        Exit;
     end
     else
     begin
        Application.Initialize;
        With TSplashForm.Create(nil) do
        try
          Application.Title := 'Sis - Hotel - ICEA';
          ProgressBar1.Max:= 29;
          show;
          update;

          Application.CreateForm(TDM, DM);
  ProgressBar1.StepBy(1);
            Update;

          Application.CreateForm(TForm_Abertura, Form_Abertura);
            ProgressBar1.StepBy(1);
            Update;

          Application.CreateForm(TForm_UtilizacaoDoSistema, Form_UtilizacaoDoSistema);
            ProgressBar1.StepBy(1);
            Update;

          Application.CreateForm(TForm_Rel_UtilizacaoSistema, Form_Rel_UtilizacaoSistema);
            ProgressBar1.StepBy(1);
            Update;

          Application.CreateForm(TForm_MontaReserva, Form_MontaReserva);
            ProgressBar1.StepBy(1);
            Update;

          Application.CreateForm(TQRListForm_MapaOcupacao, QRListForm_MapaOcupacao);
            ProgressBar1.StepBy(1);
            Update;

          Application.CreateForm(TForm_Rel_Hospede, Form_Rel_Hospede);
            ProgressBar1.StepBy(1);
            Update;
          Application.CreateForm(TForm_MenuRecepcao, Form_MenuRecepcao);
            ProgressBar1.StepBy(1);
            Update;

          Application.CreateForm(TQRListForm_Rel_Reserva, QRListForm_Rel_Reserva);
            ProgressBar1.StepBy(1);
            Update;

          Application.CreateForm(TForm_Altera_Recibo, Form_Altera_Recibo);
            ProgressBar1.StepBy(1);
            Update;

          Application.CreateForm(TForm_Auditoria_Historico, Form_Auditoria_Historico);
           ProgressBar1.StepBy(1);
           Update;

          Application.CreateForm(TForm_Altera_Ficha, Form_Altera_Ficha);
            ProgressBar1.StepBy(1);
            Update;

          Application.CreateForm(TForm_Cad_Apto, Form_Cad_Apto);
            ProgressBar1.StepBy(1);
            Update;

          Application.CreateForm(TForm_Cad_Hospede, Form_Cad_Hospede);
            ProgressBar1.StepBy(1);
            Update;

          Application.CreateForm(TForm_Cad_Reserva, Form_Cad_Reserva);
            ProgressBar1.StepBy(1);
            Update;

          Application.CreateForm(TForm_Tab_Residente, Form_Tab_Residente);
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

          finally
             free;
          end;
          Application.Run;
     end;
   end;
end.
