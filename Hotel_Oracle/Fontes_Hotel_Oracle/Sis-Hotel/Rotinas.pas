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
  Menus, ExtCtrls, Grids, DBGrids, Db, DBTables, ComCtrls, SysUtils,
  Buttons, ToolWin, StdCtrls, Mask, DBCtrls, IBQuery, IBCustomDataSet,
  JvComponent, JvxClock, jpeg, JvGradient, JvGrdCpt, Windows, Messages,
  Classes, Graphics, Controls,Dialogs, Forms, Module;

const
   NULL     = '';
   ALFABETO = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
   HABILITA_LOG_RECEPCAO= True;
//   Ultima_Atualizacao= '7-Novembro-19';
//   Ultima_Atualizacao= '30-Novembro-22';
   Ultima_Atualizacao= '26-Julho-23';
   Versao= '4.11';
   PredioAndar= 'Prédio';

   CABECALHO      = '0';
   OCUPADO        = '1';
   RESERVA        = '2';
   DESOCUPADO     = '3';
   NAODESOCUPADO  = '4';
   NAOOCUPAR      = '5';

   type
   Funcao = Class
      Function LReplStr(VS_Variavel, VS_Repl: string; Len: integer): string;
      Function DiasNoMes(AYear, AMonth: Integer): Integer;
      Function QtdRegistro(VS_Comando: String): Integer;
      Function criptografar (Armazena: String): string;
      Function descriptograr (Armazena: String): string;
      Function Extrai_Numeros(VS_PS: String): string;
      Function Extrai_Caracter(VS_PS: String): string;
      Function ValidaHora(VS_Hora: String): string;
      Function Extrai_Mes(VS_Mes: String): Integer;
      Function Mes_Extenso(VS_Mes: STRING; VI_Tipo: Integer) : String;
      Function HoraAtual: String;
      Function SubData(Data1: TDateTime; Data2: TDateTime) : Real;
      Function AnoAtual: String;
      Function NFicha(VS_NFicha: String) : String;
      Function NIdentidade(VS_Identidade: String ) : String;
      Function Busca_Usuario(VS_Usuario, VS_Senha: String): Boolean;
      Function MaiorCodigo(VS_Campo: String; VS_Tabela: String): Integer;
      Function AspasToPonto(VS_Valor: String): String;
      Function Procura(VS_Comando: String): Boolean;

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

      Procedure ExecSql(VS_Comando: String);
      procedure Habilita_Banco;
      Procedure AlimentaComboBox(ComboBox: TComboBox; VI_Branco: integer; Opcional, Arquivo: String);
      Procedure AlimentaDBComboBox(ComboBox: TDBComboBox; VI_Branco: integer; Opcional, Arquivo: String);
      procedure Log_Recepcao(PS_Atividade: String);
      procedure Windows;
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

      if ((StrToInt(Copy(VS_Hora,1,2)) < 0) or (StrToInt(Copy(VS_Hora,1,2)) > 24)) then
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

        DM.Table_Verifica.Open;
        DM.Table_Verifica.Insert;
        DM.Table_Verifica.FieldByName('VUsuario').AsString:= VS_Usuario;
        DM.Table_Verifica.FieldByName('VData').AsString:= DateToStr(Date);
        DM.Table_Verifica.FieldByName('VHoraEntrada').AsString:= VS_Entrada;
        DM.Table_Verifica.FieldByName('VHoraSaida').AsString:= TimeToStr(Time);
        DM.Table_Verifica.Post;
        DM.Table_Verifica.Close;
//        Log_Recepcao('Saida do Sistema ');
     end
     else
     begin
        Log_Recepcao('Saida do Sistema - Usuario Recepção');
     end;

     DM.Table_LogHotel.Close;
     Application.Terminate;
  end;
end;

//------------------------------------------------------------------------------
// Procedure para gravar o Arquivo de logs da recepção
//------------------------------------------------------------------------------

procedure Funcao.Log_Recepcao(PS_Atividade: String);
var
   VS_Comando: String;
begin
    //---
    //Grava a atividade utilizada

//    if DM.Table_Log.FieldByName('Status').AsInteger = 1 then
//    begin
    VS_Comando:= 'Select count(1) as Qtd From HOTEL_LOGS where Usuario = '+#39+VS_Usuario+#39;
   Dm.Query_ExecutaQuery.Close;
   Dm.Query_ExecutaQuery.Sql.Clear;
   Dm.Query_ExecutaQuery.Sql.Add(VS_Comando);
   Dm.Query_ExecutaQuery.Open;

   DM.Table_LogHotel.Open;
   DM.Table_LogHotel.Append;
   DM.Table_LogHotel.FieldByName('USUARIO').AsString:= VS_Usuario;
   DM.Table_LogHotel.FieldByName('NATIVIDADE').AsInteger:= Dm.Query_ExecutaQuery.FieldByName('Qtd').Asinteger+ 1;
   DM.Table_LogHotel.FieldByName('ATIVIDADE').AsString:= PS_Atividade;
   DM.Table_LogHotel.FieldByName('DATA').AsString:= DateToStr(Date);
   DM.Table_LogHotel.FieldByName('HORAENTRADA').AsString:= TimeToStr(Time);
   DM.Table_LogHotel.Post;
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
var
   Ano, Mes, Dia : word;
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

procedure Funcao.Habilita_Banco;
begin
  DM.Database_HTL.Connected:= False;

  with DM.Database_HTL do
  begin
    AliasName := 'Hotel';
    Params.Values['USER'] := 'hotel';
    Params.Values['PASSWORD'] := 'ipvhtl';
  end;
  DM.Database_HTL.Connected:= True;

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
         VS_Comando:= 'Select * from Hotel_Usuario where Usuario = '+#39+VS_Usuario+#39+' and senha = '+#39+VS_Senha+#39;

         DM.Query_Usuario.Close;
         DM.Query_Usuario.Sql.Clear;
         DM.Query_Usuario.Sql.Add(VS_Comando);
         DM.Query_Usuario.Open;

         if DM.Query_Usuario.RecordCount = 0 then
             MessageDlg('Usuário não foi Cadastrado...',mtError, [mbOk],0)
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
begin
   DM.Query_Executa.Close;
   DM.Query_Executa.SQL.Clear;
   DM.Query_Executa.SQL.Add('Select Max('+VS_Campo+') Maior from '+VS_Tabela);
   DM.Query_Executa.Open;

   MaiorCodigo:= DM.Query_Executa.FieldByName('Maior').AsInteger+1;
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
   dm.Query_ExecutaQuery.Close;
   dm.Query_ExecutaQuery.SQL.Clear;
   dm.Query_ExecutaQuery.SQL.Add(VS_Comando);
   dm.Query_ExecutaQuery.Open;

   QtdRegistro:= dm.Query_ExecutaQuery.FieldByName('QtdReg').AsInteger;
end;

//------------------------------------------------------------------------------
// Funcao para Retorna quantos dias tem um referido mes do ano
//------------------------------------------------------------------------------

function Funcao.DiasNoMes(AYear, AMonth: Integer): Integer;
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
// Descricao: Carrega o Combobox com os predios
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.AlimentaComboBox(ComboBox: TComboBox; VI_Branco: integer; Opcional, Arquivo: String);
var
   arq: TextFile;
   linha: String;
   i: integer;
begin
   if FileExists('C:\DataBase_ICEA\DBHotel\'+Arquivo) = False then
   begin
      MessageDlg('O arquivo '+Arquivo+' não foi encontrado na pasta "C:\DataBase_ICEA\DBHotel" '+#13+'Este arquivo contém o endereço do Banco de Dados'+#13+#13+'Favor entrar em contato com o responsável',mtError, [mbOk],0);
   end
   else
   begin
      AssignFile ( arq, 'C:\DataBase_ICEA\DBHotel\'+Arquivo );
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
// Descricao: Carrega o DBCombobox com os predios
// Data     :
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Procedure Funcao.AlimentaDBComboBox(ComboBox: TDBComboBox; VI_Branco: integer; Opcional, Arquivo: String);
var
   arq: TextFile;
   linha: String;
   i: integer;
begin
   if FileExists('C:\DataBase_ICEA\DBHotel\'+Arquivo) = False then
   begin
      MessageDlg('O arquivo '+Arquivo+' não foi encontrado na pasta "C:\DataBase_ICEA\DBHotel" '+#13+'Este arquivo contém o endereço do Banco de Dados'+#13+#13+'Favor entrar em contato com o responsável',mtError, [mbOk],0);
   end
   else
   begin
      AssignFile ( arq, 'C:\DataBase_ICEA\DBHotel\'+Arquivo );
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
// Descricao: Tem a funcao de executar e processar a Query atraves do comando
//            ExecSql  do HotelMapa
//
// Atualizado em: 17/12/2005
//------------------------------------------------------------------------------

Procedure Funcao.ExecSql(VS_Comando: String);
begin
   DM.Query_ExecutaQuery.Close;
   DM.Query_ExecutaQuery.Sql.Clear;
   DM.Query_ExecutaQuery.Sql.Add(VS_Comando);
   DM.Query_ExecutaQuery.ExecSql;
end;

//------------------------------------------------------------------------------
// Descricao: Replica uma string a esquerda até atingir o tamanho especificado
// Data     : 23/09/2008
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

Function Funcao.LReplStr(VS_Variavel, VS_Repl: string; Len: integer): string;
var
   VS_Retorno: String;
   VI_Tam: Integer;
begin
  VS_Retorno:= VS_Variavel;
  VI_tam:= Length(VS_Retorno);
  while VI_Tam < Len do
  begin
     VS_Retorno := VS_Repl+VS_Retorno;
     VI_Tam:= VI_Tam + 1;
  end;
  LReplStr:= VS_Retorno;
end;


//------------------------------------------------------------------------------
// Descricao: Funcao para procurar o select do VS_Comando
// Data     : 14/12/2015
//
// Atualizado em:
// Descricao    :
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Funcao para procurar o select do VS_Comando
//------------------------------------------------------------------------------

Function Funcao.Procura(VS_Comando: String): Boolean;
begin
   DM.Query_Executa.Close;
   DM.Query_Executa.SQL.Clear;
   DM.Query_Executa.SQL.Add(VS_Comando);
   DM.Query_Executa.Open;

   if DM.Query_Executa.RecordCount = 0 then
      Result:= False
   else
      Result:= True;
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

