//------------------------------------------------------------------------------
// Nome do Projeto :  Generico
//
// Nome do Programa : Extensão.pas
//
// Descrição :  Transforma Números em valores Por Extenso
//
// Equipe de desenvolvimento :
//                   Gerente : Lanzoni
//                  Analista : Osvaldir
//               Programador : Robson
//
// Inicio da Elaboração: 14/09/1999
//
//------------------------------------------------------------------------------
//                  Passagem de Parametros
//------------------------------------------------------------------------------
// Parametro de entrada(s) :  VS_Valor: Valor ser tratado
//                            VC_Tipo: Tipo de Extenso E-Extenso p/ Número,
//                                                     D-Extenso p/ Dinheiro
// Parametro de Saída :  texto - retorna o valor por extenso do número fornecido
//------------------------------------------------------------------------------
//                   Detalhes da alteracao
//------------------------------------------------------------------------------
// Data :
// Autor:
// Motivo:
//------------------------------------------------------------------------------

unit PorExtenso ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCTRLS, DB, DBTABLES, BUTTONS, ComCtrls, Mask;

type

//  type
    TTConverte = class
  private

  public
    Function Extenso(VS_Valor: String; VC_Tipo: Char):String;
    Function Converte(VS_Valor: String; VI_Grandeza: integer; VF_Numero: Double;
                      VI_Numero: Integer; VC_Tipo: Char):String;

end ;

var
   Por_Extenso : TTConverte ;

   VS_moeda : array[1..2] of String;
   VS_nu : array[1..9] of String;
   VS_nd : array[1..9] of String;
   VS_ndb : array[1..10] of String;
   VS_nc : array[1..9] of String;
   VS_milhao : array[1..2] of String;
   VS_mil : array[1..1] of String;
   VS_centavo : array[1..2] of String;

implementation

Function TTConverte.Extenso(VS_Valor: String; VC_Tipo: Char): String;
var
   VS_Aux, VS_Numero1, VS_Posicao1, VS_Posicao2, VS_Posicao3, VS_Posicao4: String;
   VS_Extenso: string;

   Code, VI_AUX :  INTEGER;
   VI_Virgula, VI_Cont :  INTEGER;

   VF_Numero: Double;
begin
   VS_Extenso:= '';

   if Trim(VS_Valor) <> '' then
   begin
      VS_nu[1]:='UM ';
      VS_nu[2]:='DOIS ';
      VS_nu[3]:='TRÊS ';
      VS_nu[4]:='QUATRO ';
      VS_nu[5]:='CINCO ';
      VS_nu[6]:='SEIS ';
      VS_nu[7]:='SETE ';
      VS_nu[8]:='OITO ';
      VS_nu[9]:='NOVE ';

      VS_nd[1]:='DEZ ';
      VS_nd[2]:='VINTE ';
      VS_nd[3]:='TRINTA ';
      VS_nd[4]:='QUARENTA ';
      VS_nd[5]:='CINQUENTA ';
      VS_nd[6]:='SESSENTA ';
      VS_nd[7]:='SETENTA ';
      VS_nd[8]:='OITENTA ';
      VS_nd[9]:='NOVENTA ';

      VS_ndb[1]:='DEZ ';
      VS_ndb[2]:='ONZE ';
      VS_ndb[3]:='DOZE ';
      VS_ndb[4]:='TREZE ';
      VS_ndb[5]:='QUATORZE ';
      VS_ndb[6]:='QUINZE ';
      VS_ndb[7]:='DEZESSEIS ';
      VS_ndb[8]:='DEZESSETE ';
      VS_ndb[9]:='DEZOITO ';
      VS_ndb[10]:='DEZENOVE ';

      VS_nc[1]:='CENTO ';
      VS_nc[2]:='DUZENTOS ';
      VS_nc[3]:='TREZENTOS ';
      VS_nc[4]:='QUATROCENTOS ';
      VS_nc[5]:='QUINHENTOS ';
      VS_nc[6]:='SEISCENTOS ';
      VS_nc[7]:='SETECENTOS ';
      VS_nc[8]:='OITOCENTOS ';
      VS_nc[9]:='NOVECENTOS ';

      VS_MILHAO[1]:='MILHÃO ';
      VS_MILHAO[2]:='MILHÕES ';

      VS_centavo[1]:='CENTAVO';
      VS_centavo[2]:='CENTAVOS';

      VS_moeda[1]:='REAL ';
      VS_moeda[2]:='REAIS ';

      VS_Valor:= Trim(VS_Valor);
      VF_Numero:= StrToFloat(VS_Valor);
      VS_Numero1 := FormatFloat ('0000000000.000',VF_NUMERO);
      VS_Posicao1:=Copy(VS_Numero1,2,3);
      VS_Posicao2:=Copy(VS_Numero1,5,3);
      VS_Posicao3:=Copy(VS_Numero1,8,3);

      VS_Aux:=FloatToStr(VF_Numero);
      Val(VS_AUX,VI_Aux,Code);

      VS_Posicao4:= '';
      VI_Virgula:= 0;
      For VI_Cont := 1 to Length(VS_Valor) do
      begin
         if Copy(VS_Valor,VI_Cont,1) = ',' then
            VI_Virgula:= 1
         else
            if VI_Virgula = 1 then
               VS_Posicao4:= VS_Posicao4+Copy(VS_Valor,VI_Cont,1);
      end;

      //-------------------- Tratamento para casa do Milhão ---------------------//

      VS_Extenso:= VS_Extenso+Converte(VS_Posicao1,1, VF_NUMERO, VI_Aux, VC_Tipo);

      //---------------------- Tratamento para casa do Mil ----------------------//

      VS_Extenso:= VS_Extenso+Converte(VS_Posicao2,2, VF_NUMERO, VI_Aux, VC_Tipo);

      If (StrToInt(VS_Posicao2) <> 0) then
         VS_Extenso:= VS_Extenso+' MIL ';

      If ((StrToInt(VS_Posicao2) <> 0) and (Copy(VS_Posicao3,2,2) = '00') and (VI_aux <> 100) and (VI_AUX <> 1000) and (VI_AUX <> 10000)) Then
         VS_Extenso:= VS_Extenso+' E ';

      //--------------------- Tratamento da Casa da Centena ---------------------//

      VS_Extenso:= VS_Extenso+Converte(VS_Posicao3,3, VF_NUMERO, VI_Aux, VC_Tipo);

      If UpCase(VC_Tipo) = 'D' then
         If ((VS_Posicao3 = '000') and ((StrToInt(VS_Posicao1)+StrToInt(VS_Posicao2)) <> 0) or (StrToInt(VS_Posicao2) = 1)) Then
            If ((VI_aux = 1000) or (VI_aux = 10000) or (VI_aux = 100000)) Then
                VS_Extenso:= VS_Extenso+VS_MOEDA[2];

      //---------------------- Tratamento da Casa da Dezena ---------------------//

      VS_Extenso:= VS_Extenso+Converte(VS_Posicao4,4, VF_NUMERO, VI_Aux, VC_Tipo);

      //-------------- Tratamento do Valor quando o valor for = 0 ---------------//

      if ((VS_Extenso = '') and (UpCase(VC_Tipo) <> 'D')) then
         VS_Extenso:= 'ZERO ';

      //----------------------- Retorno 0 Valor Convertido ----------------------//
   end;

   Result:= VS_Extenso;

end;

//------------------------------------------------------------------------------
// Funcao de transformar numeros em extenso
//------------------------------------------------------------------------------

Function TTConverte.Converte(VS_Valor: String; VI_Grandeza: integer;
                                 VF_Numero: Double; VI_Numero: integer; VC_Tipo: Char): String;
var
   VS_Retorno, vs_x1, vs_x2, vs_x3, vs_x4: String;
   VI_N1, VI_N2,VI_N3,VI_N4: Integer;
begin
   VS_Retorno:= '';

   If VS_Valor <> '000' then
   begin

      if Length(VS_Valor) = 3 then
      begin
         VS_X1 := Copy( VS_Valor,1,1);
         VS_X2 := Copy( VS_Valor,2,1);
         VS_X3 := Copy( VS_Valor,3,1);
         VS_X4 := Copy( VS_Valor,2,2);
      end
      else
      begin
         if Length(VS_Valor) = 2 then
         begin
            VS_X1 := '0';
            VS_X2 := Copy( VS_Valor,1,1);
            VS_X3 := Copy( VS_Valor,2,1);
            VS_X4 := Copy( VS_Valor,1,2);
         end
         else
         begin
            VS_X1 := '0';
            VS_X2 := '0';
            VS_X3 := Copy( VS_Valor,1,1);
            VS_X4 := Copy( VS_Valor,1,1);
         end;
      end;

      if VS_X1 = '' then
         VI_N1 := 0
      else
         VI_N1 := StrToInt(VS_X1);

      if VS_X2 = '' then
         VI_N2 := 0
      else
         VI_N2 := StrToInt(VS_X2);

      if VS_X3 = '' then
         VI_N3 := 0
      else
         VI_N3 := StrToInt(VS_X3);

      if VS_X4 = '' then
         VI_N4 := 0
      else
         VI_N4 := StrToInt(VS_X4);

      //--------------- Tratamento quando houver casa decimal ----------------//

      If ((VI_Grandeza = 4)  and (VI_Numero <> 0)) then
         if UpCase(VC_Tipo) = 'D' then
            VS_Retorno := VS_Retorno
         else
            VS_Retorno := VS_Retorno + ' VIRGULA ';

      //------------------------- Tratamento da Centena ----------------------//

      if (Length(VS_Valor) = 3) then
      begin
         If ((VI_Grandeza = 4)  and (VS_X1 = '0')) then                 //Tratamento dos Zeros quando existir
         begin
            VS_Retorno:= VS_Retorno + 'ZERO ';
         end
         else
         begin
            If VS_X1 <> '0' then                        //CENTENA
               If ((VS_X4 = '00') and (VS_X1='1'))  then
                  VS_Retorno:= VS_Retorno + 'CEM'
               Else
                  VS_Retorno:= VS_Retorno + VS_nc[VI_N1];
         end;
      end;

      //---------- Tratamento quendo o Valor estiver entre 10 e 19 ----------//

      If ((VI_Grandeza = 4)  and (VS_X1 = '0') and (UpCase(VC_Tipo) <> 'D')) then                 //Tratamento dos Zeros quando existir
          VS_Retorno:= VS_Retorno + 'ZERO '
      else
         If ((VI_N4 >= 10) and (VI_N4 <= 19)) then     //DEZENA DE DEZENOVE
            If VS_X1 <> '0'  then
               VS_Retorno := VS_Retorno + ' E ' + VS_NDB[VI_N4-9]
            Else
               VS_Retorno := VS_Retorno + VS_NDB[VI_N4-9];

      //----------------- Tratamento de Valor apartir de 20 ------------------//

      If VI_N2 >= 2  then
         If VS_X1 <> '0'  then
            VS_Retorno:= VS_Retorno + ' E ' + VS_ND[VI_N2]
         Else
            VS_Retorno:= VS_Retorno + VS_ND[VI_N2];

      If ((VS_X3 <> '0') and (VS_X3 <> '')) then
         If (VI_N4 <= 10) or (VI_N4 > 19) then
            If ((VS_X1 <> '0') OR (VS_X2 <> '0')) then
               VS_Retorno := VS_Retorno + ' E ' + VS_NU[VI_N3]
            Else
               VS_Retorno := VS_Retorno + VS_NU[VI_N3];

      //----------------------- Tratamento da Grandeza -----------------------//

      case VI_Grandeza of
         1: begin
              If StrToInt(VS_Valor) = 1 then
                 VS_Retorno:= VS_Retorno + VS_MILHAO[1]
              else
                 VS_Retorno:= VS_Retorno + VS_MILHAO[2];
            end;

         2: begin
              If StrToInt(VS_Valor) = 0 then
                 VS_Retorno:= VS_Retorno+ VS_MIL[1]
            end;

         3: begin
              if UpCase(VC_Tipo) = 'D' then
                 If VI_Numero = 1 then
                    VS_Retorno:= VS_Retorno + VS_Moeda[1]
                 else
                    VS_Retorno:= VS_Retorno + VS_Moeda[2];
            end;

         4: begin
              if ((UpCase(VC_Tipo) = 'D') and (StrToInt(VS_Valor) > 0)) then
                 If StrToInt(VS_Valor) = 1 then
                    VS_Retorno := VS_Retorno + VS_Centavo[1]
                 else
                    VS_Retorno := VS_Retorno + VS_Centavo[2];
            end;
      end;   // case VI_Grandeza of
   end;

   Converte:= VS_Retorno;

end;

end.

