//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : GERAL                                          //
//                                                                            //
// PROGRAMA                  : Rotinas.PAS                                    //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade montar as rotinas   //
//                             comuns para o sistema.                         //
//                                                                            //
// MODULOS CHAMADOS          :                                                //
//                                                                            //
// EQUIPE DO DESENVOLVIMENTO :                                                //
//          Gerente          : Cap Sonia                                      //
//          (Analista)       : Osvaldir Donizetti Ramos                       //
//          (Programador(es)): Osvaldir Donizetti Ramos                       //
//           Estagiário      :                                                //
//                                                                            //
// INICIO DA ELABORACAO      : 11/05/1999                                     //
//                                                                            //
//----------------------------------------------------------------------------//
//                           DETALHES DE ALTERACAO                            //
//----------------------------------------------------------------------------//
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Rotinas;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Dialogs,
  StdCtrls, Forms, DBCtrls, DB, Mask, ComCtrls, Grids, DBGrids,
  Buttons, ExtCtrls, Module;

const
   NULL     = '';
   ALFABETO = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
   HABILITA_LOG_RECEPCAO= True;
   Ultima_Atualizacao= '01-Out-09';
   Versao= '4.35';
   PredioAndar= 'Andar';
   UtilizaOpcaoParaPagamento= False;

   CABECALHO      = '0';
   OCUPADO        = '1';
   RESERVA        = '2';
   DESOCUPADO     = '3';
   NAODESOCUPADO  = '4';
   NAOOCUPAR      = '5';

   type
   Funcao = Class
      Function Procura(VS_Comando: String): Boolean;
      Function QtdRegistro(VS_Comando: String): Integer;
      Function criptografar (Armazena: String): string;
      Function descriptograr (Armazena: String): string;
      Function Extrai_Numeros(VS_PS: String): string;
      Function Extrai_Caracter(VS_PS: String): string;
      Function ValidaHora(VS_Hora: String): string;
      Function Extrai_Mes(VS_Mes: String): Integer;
      Function Mes_Extenso(VS_Mes: STRING; VI_Tipo: Integer) : String;
      Function MesExtenso(VI_Mes: Integer): String;
      Function HoraAtual: String;
      Function SubData(Data1: TDateTime; Data2: TDateTime) : Real;
      Function AnoAtual: String;
      Function NFicha(VS_NFicha: String) : String;
      Function NIdentidade(VS_Identidade: String ) : String;
      Function Busca_Usuario(VS_Usuario, VS_Senha: String): Boolean;
      Function MaiorCodigo(VS_Campo: String; VS_Tabela: String): Integer;
      Function AspasToPonto(VS_Valor: String): String;
      Function DiasNoMes(AYear, AMonth: Integer): Integer;

      Function DePara(VS_Valor: String; VS_De: String;VS_Para: String): String;
      Function GetValidaHospedagem: Boolean;
      Function GetPrivilegio: String;
      Function GetEntrada: String;
      Function GetUsuario: String;
      Function GetLogHotelUsuario: String;
      Function GetRelatorio: Integer;
      Function GetCampo_Reserva: String;
      Function GetValor_Reserva: String;
      Function GetBanco_Prod: Boolean;
      Function GetPredio: String;
      Function GetApto: String;
      Function GetCama: String;
      Function GetIdentidade: String;
      Function GetCad_Hospede : Boolean;
      Function GetMenuSoldado: Boolean;
      Function VerificaNome(VS_Nome: String): Boolean ;
      Function GetManualAjuda: String;

      Procedure SetManualAjuda(PS_Manual: String);
      Procedure SetCampo_Reserva(VS_Campo: String);
      Procedure SetValor_Reserva(VS_Valor: String);
      Procedure SetIniciaNAtividade;
      procedure SetLogHotel(VS_SetUsuario: String);
      Procedure SetValidaHospedagem(VB_Valida: Boolean);
      Procedure SetEntrada (VS_SetEntrada: String);
      Procedure SetUsuario (VS_SetUsuario: String);
      Procedure SetPrivilegio (VS_Set_Privelegio: String);
      Procedure SetRelatorio (VI_Set_Relatorio: Integer);
      Procedure SetBanco_Prod (VB_Set_Banco_Prod: Boolean);
      Procedure SetPredio (VS_Set_Predio: String);
      Procedure SetApto (VS_Set_Apto: String);
      Procedure SetCama (VS_Set_Cama: String);
      Procedure SetIdentidade (VS_Set_Identidade: String);
      Procedure SetCad_Hospede (VS_Set_Cad_Hospede: Boolean);
      Procedure SetMenuSoldado(VB_Set_MenuSoldado: Boolean);

      procedure Log_Recepcao(PS_Atividade: String);
      procedure Windows;
      Procedure LimpaMapa;
      procedure Grava_Mapa(VI_Codigo: Integer; VS_Virtual: String; VS_Identidade: String; VS_Predio: String; VS_Apto: String; VS_Cama: String;
                           VS_Ramal: String; VS_TV1: String; VS_TV2: String;
                           VS_CABECALHO: String; VS_Situacao: String;
                           VS_Situacao_Curso: String; VS_Nome: String;
                           VS_DataEntrada: String; VS_DataSaida: String);
      Procedure ExecSql_Local(VS_Comando: String);
      Procedure QueryExecuta(VS_Comando: String);
      Procedure ExecSql_Servidor(VS_Comando: String);
      Procedure AlimentaComboBox(ComboBox: TComboBox; VI_Branco: integer; Opcional: String);
   end;

var
   Funcoes: Funcao;
   VS_Identidade, VS_Entrada, VS_Usuario, VS_Privilegio: string;
   VS_Predio, VS_Apto, VS_Cama, VS_Log_Usuario: String;
   VS_ManualAjuda, VS_Campo_Reserva, VS_Valor_Reserva: string;
   VI_Relatorio, VI_NAtividade: integer;
   VB_Banco_Prod, VB_Valida_Hospedagem: Boolean;
   VB_FechaConta, VB_Cad_Hospede, VB_MenuSoldado: Boolean;

implementation

//------------------------------------------------------------------------------
// Retorna o Manual de Ajuda selecionado
//------------------------------------------------------------------------------

Function Funcao.GetManualAjuda: String;
begin
   GetManualAjuda:= VS_ManualAjuda;
end;

//------------------------------------------------------------------------------
// Seta Editor selecionado
//------------------------------------------------------------------------------

Procedure Funcao.SetManualAjuda(PS_Manual: String);
begin
   VS_ManualAjuda:= PS_Manual;
End;

//------------------------------------------------------------------------------
// Retorna se o CadHospede foi setado
//------------------------------------------------------------------------------

Function Funcao.GetCad_Hospede: Boolean;
begin
   GetCad_Hospede:= VB_Cad_Hospede;
end;

//------------------------------------------------------------------------------
// Retorna se o MenuSoldado foi setado
//------------------------------------------------------------------------------

Function Funcao.GetMenuSoldado: Boolean;
begin
   GetMenuSoldado:= VB_MenuSoldado;
end;

//------------------------------------------------------------------------------
// Retorna o numero da identidade do hospede
//------------------------------------------------------------------------------

Function Funcao.GetIdentidade: String;
begin
   GetIdentidade:= VS_Identidade;
end;

//------------------------------------------------------------------------------
// Retorna o variavel que identifica o predio selecionado
//------------------------------------------------------------------------------

Function Funcao.GetPredio: String;
begin
   GetPredio:= VS_Predio;
end;

//------------------------------------------------------------------------------
// Retorna o variavel que identifica o  apto selecionado
//------------------------------------------------------------------------------

Function Funcao.GetApto: String;
begin
   GetApto:= VS_Apto;
end;

//------------------------------------------------------------------------------
// Retorna o variavel que identifica a cama selecionada
//------------------------------------------------------------------------------

Function Funcao.GetCama: String;
begin
   GetCama:= VS_Cama;
end;

//------------------------------------------------------------------------------
// Seta se o CadHospede foi setado
//------------------------------------------------------------------------------

Procedure Funcao.SetCad_Hospede (VS_Set_Cad_Hospede: Boolean);
begin
   VB_Cad_Hospede:= VS_Set_Cad_Hospede;
end;

//------------------------------------------------------------------------------
// Seta se o MenuSoldado foi setado
//------------------------------------------------------------------------------

Procedure Funcao.SetMenuSoldado(VB_Set_MenuSoldado: Boolean);
begin
   VB_MenuSoldado:= VB_Set_MenuSoldado;
end;

//------------------------------------------------------------------------------
// Seta se a identidade selecionado
//------------------------------------------------------------------------------

Procedure Funcao.SetIdentidade (VS_Set_Identidade: String);
begin
   VS_Identidade:= VS_Set_Identidade;
end;

//------------------------------------------------------------------------------
// Seta se a apartamento selecionado
//------------------------------------------------------------------------------

Procedure Funcao.SetPredio (VS_Set_Predio: String);
begin
   VS_Predio:= VS_Set_Predio;
end;

//------------------------------------------------------------------------------
// Seta o Apto selecionado
//------------------------------------------------------------------------------

Procedure Funcao.SetApto (VS_Set_Apto: String);
begin
    VS_Apto:= VS_Set_Apto;
end;

//------------------------------------------------------------------------------
// Seta a cama selecionada
//------------------------------------------------------------------------------

Procedure Funcao.SetCama (VS_Set_Cama: String);
begin
   VS_Cama:= VS_Set_Cama;
end;

//------------------------------------------------------------------------------
// Retorna o variavel que verifica se o banco de dados e producao
//------------------------------------------------------------------------------

Function Funcao.GetBanco_Prod: Boolean;
begin
   GetBanco_Prod:= VB_Banco_Prod;
End;

//------------------------------------------------------------------------------
// Seta se o banco de dado eh o de producao
//------------------------------------------------------------------------------

Procedure Funcao.SetBanco_Prod (VB_Set_Banco_Prod: Boolean);
begin
   VB_Banco_Prod:= VB_Set_Banco_Prod;
End;

//------------------------------------------------------------------------------
// Retorna o campo da reserva
//------------------------------------------------------------------------------

Function Funcao.GetCampo_Reserva: String;
begin
   GetCampo_Reserva:= VS_Campo_Reserva;
End;

//------------------------------------------------------------------------------
// Recebe o campo da reserva
//------------------------------------------------------------------------------

Procedure Funcao.SetCampo_Reserva(VS_Campo: String);
begin
   VS_Campo_Reserva:= VS_Campo;
End;

//------------------------------------------------------------------------------
// Retorna o valor da reserva
//------------------------------------------------------------------------------

Function Funcao.GetValor_Reserva: String;
begin
   GetValor_Reserva:= VS_Valor_Reserva;
End;

//------------------------------------------------------------------------------
// Recebe o valor da reserva
//------------------------------------------------------------------------------

Procedure Funcao.SetValor_Reserva(VS_Valor: String);
begin
   VS_Valor_Reserva:= VS_Valor;
End;

//------------------------------------------------------------------------------
// Retorna o numero do relatorio selecionado
//------------------------------------------------------------------------------

Function Funcao.GetRelatorio: Integer;
begin
   GetRelatorio:= VI_Relatorio;
End;

//------------------------------------------------------------------------------
// Recebe se o Numero do Relatorio selecionado
//------------------------------------------------------------------------------

Procedure Funcao.SetRelatorio(VI_Set_Relatorio: Integer);
begin
   VI_Relatorio:= VI_Set_Relatorio;
End;

//------------------------------------------------------------------------------
// Seta o inicio da atividade
//------------------------------------------------------------------------------

Procedure Funcao.SetIniciaNAtividade;
begin
   VI_NAtividade:= 0;
End;

//------------------------------------------------------------------------------
// Recebe o Usuario e a Hora de Entrada com a senha hotel
//------------------------------------------------------------------------------

Procedure Funcao.SetLogHotel(VS_SetUsuario: String);
begin
   VS_Log_Usuario:= VS_SetUsuario;
End;

//------------------------------------------------------------------------------
// Retorna a Hora de Entrada com a senha hotel
//------------------------------------------------------------------------------

Function Funcao.GetLogHotelUsuario: String;
begin
   GetLogHotelUsuario:= VS_Log_Usuario;
End;

//------------------------------------------------------------------------------
// Recebe se a reserva foi efitivada
//------------------------------------------------------------------------------

Procedure Funcao.SetValidaHospedagem(VB_Valida: Boolean);
begin
   VB_Valida_Hospedagem:= VB_Valida;
End;

//------------------------------------------------------------------------------
// Retorna se a reserva foi efitivada
//------------------------------------------------------------------------------

Function Funcao.GetValidaHospedagem: Boolean;
begin
   GetValidaHospedagem:= VB_Valida_Hospedagem;
End;

//------------------------------------------------------------------------------
// Recebe o privilegio do usuario
//------------------------------------------------------------------------------

Procedure Funcao.SetUsuario (VS_SetUsuario: String);
begin
   VS_Usuario:= VS_SetUsuario
End;

//------------------------------------------------------------------------------
// Retorna o privilegio do usuario
//------------------------------------------------------------------------------

Function Funcao.GetUsuario: String;
begin
   GetUsuario:= VS_Usuario;
End;

//------------------------------------------------------------------------------
// Recebe o privilegio do usuario
//------------------------------------------------------------------------------

Procedure Funcao.SetPrivilegio (VS_Set_Privelegio: String);
begin
   VS_Privilegio:= VS_Set_Privelegio
End;

//------------------------------------------------------------------------------
// Retorna o privilegio do usuario
//------------------------------------------------------------------------------

Function Funcao.GetEntrada: String;
begin
   GetEntrada:= VS_Entrada;
End;

//------------------------------------------------------------------------------
// Recebe o privilegio do usuario
//------------------------------------------------------------------------------

Procedure Funcao.SetEntrada (VS_SetEntrada: String);
begin
   VS_Entrada:= VS_SetEntrada;
End;

//------------------------------------------------------------------------------
// Retorna o privilegio do usuario
//------------------------------------------------------------------------------

Function Funcao.GetPrivilegio: String;
begin
   GetPrivilegio:= VS_Privilegio;
End;

//------------------------------------------------------------------------------
// Faz a criptografar de uma variavel fornecida
//------------------------------------------------------------------------------

Function Funcao.criptografar (Armazena: String): string;
var
    Resultado: string;
    Temp: char;
    CodIndex,Cont: integer;
begin
   Resultado:= '';

   for Cont := 1 to length(Armazena) do
   begin
      for CodIndex := 1 to 2 do
      begin
         Temp:= Succ(Armazena[cont]);
         Armazena[cont]:= Temp;
      end;
      Resultado:= Resultado + Temp;
   end;
   criptografar:= Resultado;
End;

//------------------------------------------------------------------------------
// Faz a descriptograr de uma variavel fornecida
//------------------------------------------------------------------------------

Function Funcao.descriptograr (Armazena: String): string;
var
    Resultado: string;
    Temp: char;
    CodIndex,Cont: integer;
begin
   Resultado:= '';

   for Cont := 1 to length(Armazena) do
   begin
      for CodIndex := 1 to 2 do
      begin
         Temp:= Pred(Armazena[cont]);
         Armazena[cont]:= Temp;
      end;
      Resultado:= Resultado + Temp;
   end;
   descriptograr:= Resultado;
End;

//------------------------------------------------------------------------------
// Esta função Extrai da string VS_PS apanas os Numeros
//------------------------------------------------------------------------------

Function Funcao.Extrai_Numeros(VS_PS: String): string;
var
   VS_Retorno: string;

   VI_Tam: integer;
begin
   VS_Retorno:= NULL;
   VI_Tam:= 1;

   While VI_Tam <= Length(VS_PS) do
   begin
      if ((Copy(VS_PS,VI_Tam,1) = '0') or (Copy(VS_PS,VI_Tam,1) = '1') or
          (Copy(VS_PS,VI_Tam,1) = '2') or (Copy(VS_PS,VI_Tam,1) = '3') or
          (Copy(VS_PS,VI_Tam,1) = '4') or (Copy(VS_PS,VI_Tam,1) = '5') or
          (Copy(VS_PS,VI_Tam,1) = '6') or (Copy(VS_PS,VI_Tam,1) = '7') or
          (Copy(VS_PS,VI_Tam,1) = '8') or (Copy(VS_PS,VI_Tam,1) = '9')) Then
      begin
         VS_Retorno:= VS_Retorno+Copy(VS_PS,VI_Tam,1);
      end;
      VI_Tam:= VI_Tam + 1;
   end;
   Extrai_Numeros:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Esta função Extrai da string VS_PS apenas os caracteres
//------------------------------------------------------------------------------

Function Funcao.Extrai_Caracter(VS_PS: String): string;
var
   VS_Retorno: string;

   VI_Tam: integer;
begin
   VS_Retorno:= '';
   VI_Tam:= 1;

   While (VI_Tam <= Length(VS_PS)) do
   begin
      if ((Copy(VS_PS,VI_Tam,1) <> '0') and (Copy(VS_PS,VI_Tam,1) <> '1') and
          (Copy(VS_PS,VI_Tam,1) <> '2') and (Copy(VS_PS,VI_Tam,1) <> '3') and
          (Copy(VS_PS,VI_Tam,1) <> '4') and (Copy(VS_PS,VI_Tam,1) <> '5') and
          (Copy(VS_PS,VI_Tam,1) <> '6') and (Copy(VS_PS,VI_Tam,1) <> '7') and
          (Copy(VS_PS,VI_Tam,1) <> '8') and (Copy(VS_PS,VI_Tam,1) <> '9')) then
      begin
         VS_Retorno:= VS_Retorno+Copy(VS_PS,VI_Tam,1);
      end;
      VI_Tam:= VI_Tam + 1;
   end;
   Extrai_Caracter:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Esta função tem a finalidade de Validar a Hora fornecida
//------------------------------------------------------------------------------

Function Funcao.ValidaHora(VS_Hora: String): String;
var
   VS_Retorno: string;
begin
   if Trim(VS_Hora) = '' then
   begin
      MessageDlg('A hora não pode ser branco...',mtError, [mbOk],0);
      VS_Retorno:= 'IIII';
   end
   else
   begin
      if ((Length(VS_Hora) = 1) or (Length(VS_Hora) = 2)) then
         VS_Hora:= VS_Hora+'00'
      else
         if Length(VS_Hora) = 3 then
            VS_Hora:= '0'+VS_Hora;

      VS_Retorno:= VS_Hora;

      if ((StrToInt(Copy(VS_Hora,1,2)) < 1) or (StrToInt(Copy(VS_Hora,1,2)) > 24)) then
      begin
         MessageDlg('A hora deve estar entre 1 e 24...',mtError, [mbOk],0);
         VS_Retorno:= 'IIII';
      end
      else
      begin
         if ((StrToInt(Copy(VS_Hora,3,2)) < 0) or (StrToInt(Copy(VS_Hora,3,2)) > 59)) then
         begin
            MessageDlg('O minuto deve estar entre 0 e 59...',mtError, [mbOk],0);
            VS_Retorno:= 'IIII';
         end;
      end;
   end;
   ValidaHora:= VS_Retorno;
end;

//-----------------------------------------------------------------------
// Modulo que transforma o Mes de Numero para Extenso.
//-----------------------------------------------------------------------

Function Funcao.Extrai_Mes(VS_Mes: String): Integer;
var
   VI_Cont, VI_Continua: Integer;
   VS_Retorno: String;
Begin
   VI_Continua:= 0;
   VI_Cont:= 1;
   VS_Retorno:= '';

   if Trim(VS_Mes) = '' then
   begin
      VS_Retorno:= '0';
   end
   else
   begin
      While VI_Continua <= 1 do
      Begin
         if Copy(VS_Mes,VI_Cont,1) = '/' then
            VI_Continua:= VI_Continua+1
         else
         begin
            if VI_Continua = 1 then
               VS_Retorno:= VS_Retorno+Copy(VS_Mes,VI_Cont,1);
         end;

         VI_Cont:= VI_Cont +1;
      end;
   end;
   if trim(VS_Retorno) ='' then
      VS_Retorno:= '0';

   Extrai_Mes:= StrToInt(Trim(VS_Retorno));
end;

//-----------------------------------------------------------------------
// Modulo que transforma o Mes de Numero para Extenso.
//-----------------------------------------------------------------------

Function Funcao.Mes_Extenso(VS_Mes: String; VI_Tipo: Integer) : String;
var
   VS_Mes_Extenso: String;
Begin
   VS_Mes_Extenso:= '';
   if (VI_Tipo = 1 ) then
     case StrToInt(VS_Mes) of
        1: VS_Mes_Extenso:= 'Janeiro';
        2: VS_Mes_Extenso:= 'Fevereiro';
        3: VS_Mes_Extenso:= 'Março';
        4: VS_Mes_Extenso:= 'Abril';
        5: VS_Mes_Extenso:= 'Maio';
        6: VS_Mes_Extenso:= 'Junho';
        7: VS_Mes_Extenso:= 'Julho';
        8: VS_Mes_Extenso:= 'Agosto';
        9: VS_Mes_Extenso:= 'Setembro';
        10: VS_Mes_Extenso:= 'Outubro';
        11: VS_Mes_Extenso:= 'Novembro';
        12: VS_Mes_Extenso:= 'Dezembro';
     end
   else
     case StrToInt(VS_Mes) of
        1: VS_Mes_Extenso:= 'Jan';
        2: VS_Mes_Extenso:= 'Fev';
        3: VS_Mes_Extenso:= 'Mar';
        4: VS_Mes_Extenso:= 'Abr';
        5: VS_Mes_Extenso:= 'Mai';
        6: VS_Mes_Extenso:= 'Jun';
        7: VS_Mes_Extenso:= 'Jul';
        8: VS_Mes_Extenso:= 'Ago';
        9: VS_Mes_Extenso:= 'Set';
        10: VS_Mes_Extenso:= 'Out';
        11: VS_Mes_Extenso:= 'Nov';
        12: VS_Mes_Extenso:= 'Dez';
     end;

   Mes_Extenso:= VS_Mes_Extenso;

End;

//------------------------------------------------------------------------------
// Esta função tranforma o Mes fornecido para o referente em ingles
//------------------------------------------------------------------------------

Function Funcao.MesExtenso(VI_Mes: Integer): String;
var
   VS_Retorno: string;
begin
   case VI_Mes of
   1:  VS_Retorno:= 'Jan';
   2:  VS_Retorno:= 'Feb';
   3:  VS_Retorno:= 'Mar';
   4:  VS_Retorno:= 'Apr';
   5:  VS_Retorno:= 'May';
   6:  VS_Retorno:= 'Jun';
   7:  VS_Retorno:= 'Jul';
   8:  VS_Retorno:= 'Aug';
   9:  VS_Retorno:= 'Sep';
   10: VS_Retorno:= 'Oct';
   11: VS_Retorno:= 'Nov';
   12: VS_Retorno:= 'Dec';
   end;

   MesExtenso:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure Funcao.Windows;
begin
  if MessageDlg('Deseja sair do sistema ?',
    mtConfirmation, [mbYes, mbNo], 1) = mrYes then
  begin
     if VS_Usuario <> 'HOTEL' then
     begin
         //---
        //Grava o Nome do Usuário que utilizou o sistema

        DM.IBTable_Verifica.Open;
        DM.IBTable_Verifica.Insert;
        DM.IBTable_Verifica.FieldByName('VUsuario').AsString:= VS_Usuario;
        DM.IBTable_Verifica.FieldByName('VData').AsString:= DateToStr(Date);
        DM.IBTable_Verifica.FieldByName('VHoraEntrada').AsString:= VS_Entrada;
        DM.IBTable_Verifica.FieldByName('VHoraSaida').AsString:= TimeToStr(Time);
        DM.IBTable_Verifica.Post;
        DM.IBTransaction_Hotel.CommitRetaining;
        DM.IBTable_Verifica.Close;
        Log_Recepcao('G-Fim');
     end
     else
     begin
        Log_Recepcao('R-Fim');
     end;

     DM.IBTable_LogHotel.Close;
     Application.Terminate;
  end;
end;


//------------------------------------------------------------------------------
// Procedure para gravar o Arquivo de logs da recepção
//------------------------------------------------------------------------------

procedure Funcao.Log_Recepcao(PS_Atividade: String);
begin
    //---
    //Grava a atividade utilizada

{    VI_NAtividade:= VI_NAtividade+ 1;
    DM.IBTable_LogHotel.Open;
    DM.IBTable_LogHotel.Append;
    DM.IBTable_LogHotel.FieldByName('USUARIO').AsString:= VS_Usuario;
    DM.IBTable_LogHotel.FieldByName('NATIVIDADE').AsInteger:= VI_NAtividade;
    DM.IBTable_LogHotel.FieldByName('ATIVIDADE').AsString:= PS_Atividade;
    DM.IBTable_LogHotel.FieldByName('DATA').AsString:= DateToStr(Date);
    DM.IBTable_LogHotel.FieldByName('HORAENTRADA').AsString:= TimeToStr(Time);
    DM.IBTable_LogHotel.Post;
    DM.IBTransaction_Hotel.CommitRetaining;
}
end;

//------------------------------------------------------------------------------
// Esta função tem a fornecer a hora atual tratada
//------------------------------------------------------------------------------

Function Funcao.HoraAtual: String;
var
   VS_Time, VS_Retorno: string;

   VI_Cont,VI_Tam: integer;
begin
   VS_Time:= TimeToStr(Time);

   VI_Cont:= 0;
   for VI_Tam:= 1 to length(VS_Time) do
   begin
      if copy(VS_Time,VI_Tam,1) = ':' then
          VI_Cont:= VI_Cont + 1
      else
         if VI_Cont < 2 then
            VS_Retorno:= VS_Retorno+copy(VS_Time,VI_Tam,1);
   end;
   if length(VS_Retorno) = 3 then
      VS_Retorno:= '0'+VS_Retorno;
      
   HoraAtual:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Esta funcao tem a finalidade de extrair um periodo entre duas datas
//------------------------------------------------------------------------------

function Funcao.SubData(Data1: TDateTime; Data2: TDateTime) : Real;
begin
  Result:= Data1 - Data2;
end;

//------------------------------------------------------------------------------
// Esta funcao tem a finalidade de retornar o ano atual
//------------------------------------------------------------------------------

function Funcao.AnoAtual: String;

var Ano, Mes, Dia : word;
begin
  DecodeDate (Date, Ano, Mes, Dia);
  Result:= IntToStr(Ano);
end;

//------------------------------------------------------------------------------
// Esta funcao tem a finalidade de retornar o numero da ficha tratada
//------------------------------------------------------------------------------

Function Funcao.NFicha(VS_NFicha: String ) : String;
var
   VS_Ret: String;
   i: integer;
begin
  if length(VS_NFicha) = 6 then
  begin
     VS_Ret:= VS_NFicha;
  end
  else
  begin
     VS_Ret:= '';

     if trim(VS_NFicha) <> '' then
     begin
        for i := 1 to length(VS_NFicha) do
        begin
           if Copy(VS_NFicha,i,1) <> ' ' then
              VS_Ret:= VS_Ret+Copy(VS_NFicha,i,1);
        end;
        VS_Ret:= FormatFloat('000000',StrToInt(VS_Ret));
     end
     else
     begin
        MessageDlg('Não pode ser branco...',mtError, [mbOk],0);
     end;
  end;
  NFicha:= VS_Ret;
end;

//------------------------------------------------------------------------------
// Esta funcao tem a finalidade de retornar o numero da identidade com zeros a esquerda
//------------------------------------------------------------------------------

Function Funcao.NIdentidade(VS_Identidade: String ) : String;
var
   VS_Ret: String;
   i: integer;
begin
  if length(trim(VS_Identidade)) = 12 then
  begin
     VS_Ret:= VS_Identidade;
  end
  else
  begin
     VS_Ret:= '';
     if trim(VS_Identidade) <> '' then
     begin
        for i := 1 to length(trim(VS_Identidade)) do
        begin
           if Copy(VS_Identidade,i,1) <> ' ' then
              VS_Ret:= VS_Ret+Copy(VS_Identidade,i,1);
        end;
        VS_Ret:= FormatFloat('000000000000',StrToFloat(VS_Ret));
     end;
  end;
  NIdentidade:= VS_Ret;
end;

//------------------------------------------------------------------------------
// Esta funcao tem a finalidade de extrair um periodo entre duas datas
//------------------------------------------------------------------------------

Function Funcao.Busca_Usuario(VS_Usuario, VS_Senha: String): Boolean;
Var
   VS_Comando: String;
   Status: Boolean;
begin
   Status:= False;
   if Trim(VS_Usuario) = '' then
      MessageDlg('O nome do usuário não pode ser branco...',mtError, [mbOk],0)
   else
   begin
      if Trim(VS_Senha) = '' then
         MessageDlg('A senha do usuário não pode ser branco...',mtError, [mbOk],0)
      else
      begin
         VS_Comando:= 'Select * from Usuario where Usuario = '+#39+VS_Usuario+#39+' and senha = '+#39+VS_Senha+#39;

         DM.IBQuery_Usuario.Close;
         DM.IBQuery_Usuario.Sql.Clear;
         DM.IBQuery_Usuario.Sql.Add(VS_Comando);
         DM.IBQuery_Usuario.Open;

         if DM.IBQuery_Usuario.RecordCount = 0 then
             MessageDlg('Verifique se o nome ou a senha esta errado'+#13+#13+'O usuário não encontra-se na lista...',mtError, [mbOk],0)
         else
            Status:= True;
      end;
   end;

   Busca_Usuario:= Status;
end;

//------------------------------------------------------------------------------
// Retorna o maior valor
//------------------------------------------------------------------------------

Function Funcao.MaiorCodigo(VS_Campo: String; VS_Tabela: String): Integer;
Var
   VS_Comando :String;
begin
   VS_Comando:= 'Select Max('+trim(VS_Campo)+') Maior from '+VS_Tabela;
   DM.IBQuery_Executa.Close;
   DM.IBQuery_Executa.SQL.Clear;
   DM.IBQuery_Executa.SQL.Add(VS_Comando);
   DM.IBQuery_Executa.Open;

   MaiorCodigo:= StrToInt(Trim(DM.IBQuery_Executa.FieldByName('Maior').AsString))+1;
end;

//------------------------------------------------------------------------------
// Troca aspas por ponto
//------------------------------------------------------------------------------

Function Funcao.AspasToPonto(VS_Valor: String): String;
var
   VS_Retorno: String;
   VI_Cont: Integer;
begin
   VS_Retorno:= '';
   For VI_Cont:= 1 to Length(VS_Valor) do
   begin
      if Copy(VS_Valor,VI_Cont,1) = ',' then
          VS_Retorno:= VS_Retorno+'.'
      else
          VS_Retorno:= VS_Retorno+Copy(VS_Valor,VI_Cont,1);
   end;
   AspasToPonto:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Verifica se o posto nao esta sendo inserido junto ao nome ou o nome de guerra
//------------------------------------------------------------------------------

Function Funcao.VerificaNome(VS_Nome: String): Boolean ;
var
   VB_Analise, VB_Retorno: Boolean;

   VS_Comp: String;
   VI_Cont: Integer;
begin
   VB_Retorno:= True;
   if trim(VS_Nome) <> '' then
   begin
      VB_Analise:= False;
      VS_Comp:= '';
      VI_Cont:= 1;

      While ((VB_Analise = False) and (VI_Cont <= length(VS_Nome))) do
      begin
         if Copy(VS_Nome,VI_Cont,1) = ' ' then
         begin
            if VI_Cont = 1 then
            begin
               MessageDlg('O primeiro letra não pode ser branco...',mtError, [mbOk],0);
               VB_Analise:= True;
               VB_Retorno:= False;
            end
            else
            begin
               if ((VS_Comp = 'CV') or(VS_Comp = '3S') or(VS_Comp = '2S') or(VS_Comp = '1S') or(VS_Comp = 'SO') or(VS_Comp = 'TEN') or(VS_Comp = 'CAP')) then
               begin
                  MessageDlg('O Posto/Graduação deve ser selecionado...',mtError, [mbOk],0);
                  VB_Retorno:= False;
               end;
               VB_Analise:= True;
            end;
         end
         else
         begin
            VS_Comp:= VS_Comp+Copy(VS_Nome,VI_Cont,1);
            VI_Cont:= VI_Cont + 1;
         end;
      end;
   end;
   VerificaNome:= VB_Retorno;
end;

//------------------------------------------------------------------------------
// Funcao para procurar o select do VS_Comando
//------------------------------------------------------------------------------

Function Funcao.QtdRegistro(VS_Comando: String): Integer;
begin
   dm.IBQuery_Executa.Close;
   dm.IBQuery_Executa.SQL.Clear;
   dm.IBQuery_Executa.SQL.Add(VS_Comando);
   dm.IBQuery_Executa.Open;

   QtdRegistro:= dm.IBQuery_Executa.FieldByName('QtdReg').AsInteger;
end;

//------------------------------------------------------------------------------
// Limpa o arquivo para montar o mapa se ele existir existe
//------------------------------------------------------------------------------

Procedure Funcao.LimpaMapa;
begin
   if FileExists('C:\DataBase_ICEA\DB_HotelMapa\HOTELMAPA.GDB') = True then
   begin
      Funcoes.ExecSql_Local('Delete from mapa');
      DM.IBTable_Hotel.Close;
      DM.IBTable_Hotel.Open;
   end
   else
   begin
      MessageDlg('O Arquivo C:\DataBase_ICEA\DB_HotelMapa\HOTELMAPA.GDB, foi apagado, '+#13+'favor entrar em contato como o administrador ...',mtError, [mbOk],0);
      Application.Terminate;
   end;
end;

//------------------------------------------------------------------------------
// Grava os dados do Mapa
//------------------------------------------------------------------------------

procedure Funcao.Grava_Mapa(VI_Codigo: Integer; VS_Virtual: String; VS_Identidade: String; VS_Predio: String; VS_Apto: String; VS_Cama: String;
                           VS_Ramal: String; VS_TV1: String; VS_TV2: String;
                           VS_CABECALHO: String; VS_Situacao: String;
                           VS_Situacao_Curso: String; VS_Nome: String;
                           VS_DataEntrada: String; VS_DataSaida: String);
begin
   if VS_Virtual <> 'S' Then
   begin
      DM.IBTable_Hotel.Append;
      DM.IBTable_Hotel.FieldByName('Codigo').AsInteger:= VI_Codigo;
      DM.IBTable_Hotel.FieldByName('Identidade').AsString:= VS_Identidade;
      DM.IBTable_Hotel.FieldByName('predio').AsString:= VS_Predio;
      DM.IBTable_Hotel.FieldByName('apto').AsString:= VS_Apto;
      DM.IBTable_Hotel.FieldByName('cama').AsString:= VS_Cama;
      DM.IBTable_Hotel.FieldByName('ramal').AsString:= VS_Ramal;
      DM.IBTable_Hotel.FieldByName('tv1').AsString:= VS_TV1;
      DM.IBTable_Hotel.FieldByName('tv2').AsString:= VS_TV2;
      DM.IBTable_Hotel.FieldByName('tipo').AsString:= VS_CABECALHO;
      DM.IBTable_Hotel.FieldByName('situacao').AsString:= VS_Situacao;
      DM.IBTable_Hotel.FieldByName('situacao_curso').AsString:= VS_Situacao_Curso;
      DM.IBTable_Hotel.FieldByName('nome').AsString:= VS_Nome;
      if trim(VS_DataEntrada) <> '' then
         DM.IBTable_Hotel.FieldByName('data_entrada').AsString:= VS_DataEntrada;
      if trim(VS_DataSaida) <> '' then
         DM.IBTable_Hotel.FieldByName('data_saida').AsString:= VS_DataSaida;
      DM.IBTable_Hotel.Post;
      DM.IBTransaction_Hotel.CommitRetaining;
   end;
end;


//------------------------------------------------------------------------------
// Funcao para procurar o select do VS_Comando
//------------------------------------------------------------------------------

Function Funcao.Procura(VS_Comando: String): Boolean;
begin
   DM.IBQuery_Executa.Close;
   DM.IBQuery_Executa.SQL.Clear;
   DM.IBQuery_Executa.SQL.Add(VS_Comando);
   DM.IBQuery_Executa.Open;

   if DM.IBQuery_Executa.fieldbyname('Qtd').AsInteger = 0 then
      Result:= False
   else
      Result:= True;
end;

//------------------------------------------------------------------------------
// Funcao para Executar a QueryExecuta
//------------------------------------------------------------------------------

Procedure Funcao.QueryExecuta(VS_Comando: String);
begin
   DM.IBQuery_Executa.Close;
   DM.IBQuery_Executa.Sql.Clear;
   DM.IBQuery_Executa.Sql.Add(VS_Comando);
   DM.IBQuery_Executa.Open;
end;

//------------------------------------------------------------------------------
// Descricao: Carrega o Combobox com os predios
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.AlimentaComboBox(ComboBox: TComboBox; VI_Branco: integer; Opcional: String);
var
   arq: TextFile;
   linha: String;
   i: integer;
begin
   if FileExists('C:\DataBase_ICEA\DBHotel\predio.cnf') = False then
   begin
      MessageDlg('O arquivo Predio.cnf não foi encontrado na pasta "C:\DataBase_ICEA\DBHotel" '+#13+'Este arquivo contém o endereço do Banco de Dados'+#13+#13+'Favor entrar em contato com o responsável',mtError, [mbOk],0);
   end
   else
   begin
      AssignFile ( arq, 'C:\DataBase_ICEA\DBHotel\predio.cnf' );
      Reset ( arq );
      ReadLn ( arq, linha );
      ComboBox.Items.Clear;

      //--- Tratamento para inserir linhas em branco no ComboBox

      if VI_Branco > 0 then
         For i := 1 to VI_Branco do
            ComboBox.Items.Add('');

      if Opcional <> '' then
      begin
         ComboBox.Text:= Opcional;
         ComboBox.Items.Add(Opcional);
      end
      else
      begin
         ComboBox.Text:= linha;
      end;

      ComboBox.Items.Add(linha);
      while not Eof ( arq ) do
      begin
         ReadLn ( arq, linha );
         ComboBox.Items.Add(linha);
      end;
      CloseFile ( arq );
   end;
end;

//------------------------------------------------------------------------------
// Descricao: Troca o valor da Variavel VS_De para o conteudo da variavel VS_Para
// Data     : 15/03/2005
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.DePara(VS_Valor: String; VS_De: String;VS_Para: String): String;
var
   VS_Retorno: String;
   VI_Cont: Integer;
begin
   VS_Retorno:= '';
   For VI_Cont:= 1 to Length(VS_Valor) do
   begin
      if Copy(VS_Valor,VI_Cont,1) = VS_De then
          VS_Retorno:= VS_Retorno+VS_Para
      else
          VS_Retorno:= VS_Retorno+Copy(VS_Valor,VI_Cont,1);
   end;
   DePara:= VS_Retorno;
end;

//------------------------------------------------------------------------------
// Descricao: Funcao para Retorna quantos dias tem um referido mes do ano
// Data     : 10/03/2008
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.DiasNoMes(AYear, AMonth: Integer): Integer;
const
   DaysInMonth: array[1..12] of Integer = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
Var
   VI_Retorno: Integer;
begin
   VI_Retorno:= DaysInMonth[AMonth];
   if AMonth = 2 then
   begin
      if Ayear mod 4 = 0 then
      begin
         VI_Retorno:= 29;
      end;
   end;
   Result := VI_Retorno
end;

//------------------------------------------------------------------------------
// Descricao: Tem a funcao de executar e processar a Query atraves do comando
//            ExecSql  do HotelMapa
//
// Atualizado em: 17/12/2005
//------------------------------------------------------------------------------

Procedure Funcao.ExecSql_Local(VS_Comando: String);
begin
   DM.Query_ExecSqlLocal.Close;
   DM.Query_ExecSqlLocal.Sql.Clear;
   DM.Query_ExecSqlLocal.Sql.Add(VS_Comando);
   DM.Query_ExecSqlLocal.ExecSql;
   DM.IBTransaction_HotelLocal.Commit;
end;

//------------------------------------------------------------------------------
// Descricao: Tem a funcao de executar e processar a Query atraves do comando
//            ExecSql  do HotelMapa
//
// Atualizado em: 17/12/2005
//------------------------------------------------------------------------------

Procedure Funcao.ExecSql_Servidor(VS_Comando: String);
begin
   DM.IBQuery_ExecSqlServidor.Close;
   DM.IBQuery_ExecSqlServidor.Sql.Clear;
   DM.IBQuery_ExecSqlServidor.Sql.Add(VS_Comando);
   DM.IBQuery_ExecSqlServidor.ExecSql;
   DM.IBTransaction_Hotel.CommitRetaining;
end;

//------------------------------------------------------------------------------
// Descricao: Procedure Principal
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Begin
  Funcoes:= Funcao.Create;
end.

