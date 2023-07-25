unit AtividadeHotelaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, ShellApi,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, Mask, JvToolEdit, Rotinas, ComObj,
  DateUtils, ExtCtrls, ComCtrls, ToolWin, DBCtrls;

type
  TForm_AtividadeHotelaria = class(TForm)
    ToolBar2: TToolBar;
    ToolButton_Imprimir: TToolButton;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    Query_Atividades: TQuery;
    DSQ_Historico: TDataSource;
    DBGrid1: TDBGrid;
    Label_Inicio: TLabel;
    Label_Final: TLabel;
    Label_Oficiais_Generais: TLabel;
    Label_Oficiais_Superiores: TLabel;
    Label_Oficiais_Intermediarios: TLabel;
    Label_Oficiais_Subalternos_Aspirantes: TLabel;
    Label_SO_SGT: TLabel;
    Label_CB_SD_TF: TLabel;
    JvDateEdit_Inicio: TJvDateEdit;
    JvDateEdit_DataTermino: TJvDateEdit;
    Label_Civil: TLabel;
    Label_Valor_Oficiais_Generais: TLabel;
    Label_Valor_Oficiais_Superiores: TLabel;
    Label_Valor_Oficiais_Intermediarios: TLabel;
    Label_Valor_Oficiais_Subalternos_Aspirantes: TLabel;
    Label_Valor_SO_SGT: TLabel;
    Label_Valor_CB_SD_TF: TLabel;
    Label_Valor_Civil: TLabel;
    ToolButton_Excel: TToolButton;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Query_Historico: TQuery;
    Label_Arrecadacao: TLabel;
    procedure ToolButton_ImprimirClick(Sender: TObject);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton_ExcelClick(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
  private    { Private declarations }
      Tempo, Oficiais_Generais, Oficiais_Superiores, Oficiais_Intermediarios, Oficiais_Subalternos_Aspirantes, SO_SGT, CB_SD_TF, Civil: Integer;
      VS_Comando, VS_Posto: string;
  public
    { Public declarations }
  end;

var
  Form_AtividadeHotelaria: TForm_AtividadeHotelaria;

implementation

{$R *.dfm}

//------------------------------------------------------------------------------
// Tratamento para fechar o programa e retornart para o windows
//------------------------------------------------------------------------------

procedure TForm_AtividadeHotelaria.ToolButton_ImprimirClick(Sender: TObject);
begin
   Oficiais_Generais:= 0;
   Oficiais_Superiores:= 0;
   Oficiais_Intermediarios:= 0;
   Oficiais_Subalternos_Aspirantes:= 0;
   SO_SGT:= 0;
   CB_SD_TF:= 0;
   Civil:= 0;

   VS_Comando:= 'Select ho.Nome, ho.posto, hi.dataentrada as Entrada, hi.datasaida as Saida, hi.Tipo_Fechamento as Tipo, '+
                '       To_Date(hi.datasaida)-TO_DATE('+#39+JvDateEdit_Inicio.Text+#39+') Tempo1, '+
                '       To_Date(hi.datasaida)-To_Date(hi.dataEntrada) Tempo2 '+
                ' From historico hi, hospede ho '+
                ' where hi.identidade = ho.identidade '+
                ' and   hi.Tipo_Fechamento = '+#39+'F'+#39+
                ' and   hi.nrecibo is not NULL  '+
                ' and   hi.ano = '+Funcoes.AnoAtual+
                ' and   TO_DATE(hi.datasaida) BETWEEN '+#39+JvDateEdit_Inicio.Text+#39+' and '+#39+JvDateEdit_DataTermino.Text+#39+
                ' order by ho.posto ';

   Query_Historico.Close;
   Query_Historico.Sql.Clear;
   Query_Historico.Sql.Add(VS_Comando);
   Query_Historico.Open;

   Update;

   Query_Historico.First;
   While not Query_Historico.Eof do
   begin

      if Query_Historico.FieldByName('Tempo1').AsInteger < Query_Historico.FieldByName('Tempo2').AsInteger then
         Tempo:= Query_Historico.FieldByName('Tempo1').AsInteger+1
      else
         Tempo:= Query_Historico.FieldByName('Tempo2').AsInteger+1;

      if tempo > 0 then
      begin

         VS_Posto:= UpperCase(trim(Query_Historico.FieldByName('Posto').AsString));
           //-------------------
          //--- Tratamento Oficiais_Generais
         //-------------------

         if ((VS_Posto = 'BRIGADEIRO') or
             (VS_Posto = 'MAJ BRIG') or (VS_Posto = 'MAJ BRIGADEIRO') or (VS_Posto = 'MAJOR BRIGADEIRO') or
             (VS_Posto = 'TEN BRIG') or (VS_Posto = 'TENENTE BRIGADEIRO') or (VS_Posto = 'MAJOR BRIGADEIRO') or
             (VS_Posto = 'OFICIAL GENERAL') or
             (VS_Posto = 'GENERAL-DE-BRIGADA') or (VS_Posto = 'GENERAL-DE-DIVISÃO') or
             (VS_Posto = 'VICE-ALMIRANTE') or (VS_Posto = 'GENERAL-DE-DIVISÃO')) Then
            Oficiais_Generais:= Oficiais_Generais + Tempo;

          //--- Tratamento para Oficiais_Superiores              MAJOR

         if ((VS_Posto = 'CORONEL') or (VS_Posto = 'TENENTE CORONEL') or (VS_Posto = 'MAJOR') or (VS_Posto = 'MAJ')) then
            Oficiais_Superiores:= Oficiais_Superiores + Tempo;

          //--- Tratamento para Oficiais_Intermediarios

         if ((VS_Posto = 'CAP') or (VS_Posto = 'CAPITÃO')) then
            Oficiais_Intermediarios:= Oficiais_Intermediarios + Tempo;

          //--- Tratamento para Oficiais_Subalternos_Aspirantes

         if ((VS_Posto = '1º TEN') or (VS_Posto = '1º TENENTE') or (VS_Posto = '1ºTEN') or (VS_Posto = '2º TEN') or
             (VS_Posto = '2º TENENTE') or (VS_Posto = '2ºTEN')) then
            Oficiais_Subalternos_Aspirantes:= Oficiais_Subalternos_Aspirantes + Tempo;

         //--- Tratamento SO_SGT

         if ((VS_Posto = 'SUBOFICIAL') or (VS_Posto = 'SO') or
             (VS_Posto = '1S') or (VS_Posto = '2S') or (VS_Posto = '3S') or
             (VS_Posto = '1º SARGENTO') or (VS_Posto = '2º SARGENTO') or (VS_Posto = '3º SARGENTO')) then
             SO_SGT:= SO_SGT + Tempo;

        //--- Tratamento para CB_SD_TF

         if ((VS_Posto = 'CB') or (VS_Posto = 'SD') or (VS_Posto = 'SOLDADO') or (VS_Posto = 'CABOS') ) then
           CB_SD_TF:= CB_SD_TF + Tempo;

         //--- Tratamento Civil

         if ((copy(VS_Posto,1,5) = 'CIVIL') or (copy(VS_Posto,1,5) = 'CIVÍL') or (copy(VS_Posto,1,2) = 'CV')) then
             Civil:= Civil + Tempo;
      end;
      Query_Historico.Next;
   end;

   Label_Valor_Oficiais_Generais.Caption:= IntToStr(Oficiais_Generais);
   Label_Valor_Oficiais_Superiores.Caption:= IntToStr(Oficiais_Superiores);
   Label_Valor_Oficiais_Intermediarios.Caption:= IntToStr(Oficiais_Intermediarios);
   Label_Valor_Oficiais_Subalternos_Aspirantes.Caption:= IntToStr(Oficiais_Subalternos_Aspirantes);
   Label_Valor_SO_SGT.Caption:= IntToStr(SO_SGT);
   Label_Valor_CB_SD_TF.Caption:= IntToStr(CB_SD_TF);
   Label_Valor_Civil.Caption:= IntToStr(Civil);

end;

//------------------------------------------------------------------------------
// Tratamento para fechar o programa e retornart menu principal
//------------------------------------------------------------------------------

procedure TForm_AtividadeHotelaria.ToolButton_RetornarClick( Sender: TObject);
begin
   Close;
end;

//------------------------------------------------------------------------------
// Tratamento para fechar o programa e retornart para o windows
//------------------------------------------------------------------------------

procedure TForm_AtividadeHotelaria.ToolButton_WindowsClick(Sender: TObject);
begin
    Funcoes.Windows;
end;

procedure TForm_AtividadeHotelaria.ToolButton_ExcelClick(Sender: TObject);
var
   objExcel, Sheet: Variant;
   VS_Mes, cTitulo : string;
   i : integer;

   Ano, Mes, Dia : word;
begin
      // Cria uma instancia para utilizar o Excel

      cTitulo := 'Cadastro de Instrutores';

      try
         objExcel := CreateOleObject('Excel.Application');
      except
         objExcel := CreateOleObject('scalc.Application');
      end;
      objExcel.Visible := True;
      objExcel.Caption := cTitulo;

      // Adiciona planilha(sheet)
      objExcel.Workbooks.Add;
      objExcel.Workbooks[1].Sheets.Add;
      objExcel.Workbooks[1].WorkSheets[1].Name := cTitulo;
      Sheet := objExcel.Workbooks[1].WorkSheets[cTitulo];

      // por aqui tu limparias a planilha

      DecodeDate (StrToDate(JvDateEdit_DataTermino.Text), Ano, Mes, Dia);
      VS_Mes:= IntToStr(Mes);
      Funcoes.Mes_Extenso(VS_Mes, 2);

      Sheet.Cells[1,2] := 'MINISTÉRIO DA DEFESA - COMANDO DA AERONÁUTICA';
      Sheet.Cells[2,2] := 'ICEA';


      Sheet.Cells[4,2] := 'ATIVIDADE DE HOTELARIA';
      Sheet.Cells[5,2] := 'MÊS '+VS_Mes+' '+IntToStr(Ano);

      Sheet.Cells[6,1] := 'SE';
      Sheet.Cells[6,2] := 'DESCRIÇÃO';
      Sheet.Cells[6,3] := 'UNIDADE DE MEDIDA';

      Sheet.Cells[7,2] := 'Pernoites Oficiais Generais';
      Sheet.Cells[7,3] := Label_Valor_Oficiais_Generais.Caption;

      Sheet.Cells[8,2] := 'Pernoites Oficiais Superiores';
      Sheet.Cells[8,3] := Label_Valor_Oficiais_Superiores.Caption;

      Sheet.Cells[9,2] := 'Pernoites Oficiais Intermediários';
      Sheet.Cells[9,3] := Label_Valor_Oficiais_Intermediarios.Caption;

      Sheet.Cells[10,2] := 'Pernoites Oficiais Subalternos/Aspirantes';
      Sheet.Cells[10,3] := Label_Valor_Oficiais_Subalternos_Aspirantes.Caption;

      Sheet.Cells[11,2] := 'Pernoites SO - SGT';
      Sheet.Cells[11,3] := Label_Valor_SO_SGT.Caption;

      Sheet.Cells[12,2] := 'Pernoites CB - SD - TF';
      Sheet.Cells[12,3] := Label_Valor_CB_SD_TF.Caption;

      Sheet.Cells[13,2] := 'Pernoites Civis';
      Sheet.Cells[13,3] := Label_Valor_Civil.Caption;


      Sheet.Cells[15,2] := 'Obs.:';

      Sheet.Cells[17,2] := 'São José dos Campos, '+IntToStr(Dia)+' de '+Funcoes.Mes_Extenso(IntToStr(Mes), 1)+' de '+IntToStr(Ano);

      Sheet.Cells[19,2] := 'CHRISTOFF 2º TEN QOCON AQV';
      Sheet.Cells[20,2] := 'Chefe da ASE';

end;

procedure TForm_AtividadeHotelaria.ToolButton3Click(Sender: TObject);
begin
   VS_Comando:= 'Select ho.Nome, ho.posto, hi.dataentrada as Entrada, hi.datasaida as Saida, hi.Tipo_Fechamento as Tipo, '+
                '       TO_DATE('+#39+JvDateEdit_DataTermino.Text+#39+') - To_Date(hi.dataentrada) Tempo1, '+
                '       9999 Tempo2 '+
                ' From historico hi, hospede ho '+
                ' where hi.identidade = ho.identidade '+
                ' and   hi.Tipo_Fechamento = '+#39+'F'+#39+
                ' and nrecibo is not NULL  '+
                ' and   hi.ano = '+Funcoes.AnoAtual+
                ' and TO_DATE(hi.dataentrada) BETWEEN '+#39+JvDateEdit_Inicio.Text+#39+' and '+#39+JvDateEdit_DataTermino.Text+#39+
//                ' and TO_DATE(hi.dataSaida) > '+#39+JvDateEdit_DataTermino.Text+#39+
                ' order by ho.posto ';

   Query_Historico.Close;
   Query_Historico.Sql.Clear;
   Query_Historico.Sql.Add(VS_Comando);
   Query_Historico.Open;

   Update;

   Query_Historico.First;
   While not Query_Historico.Eof do
   begin

      if Query_Historico.FieldByName('Tempo1').AsInteger < Query_Historico.FieldByName('Tempo2').AsInteger then
         Tempo:= Query_Historico.FieldByName('Tempo1').AsInteger+1
      else
         Tempo:= Query_Historico.FieldByName('Tempo2').AsInteger+1;

      if tempo > 0 then
      begin

         VS_Posto:= UpperCase(trim(Query_Historico.FieldByName('Posto').AsString));
           //-------------------
          //--- Tratamento Oficiais_Generais
         //-------------------

         if ((VS_Posto = 'BRIGADEIRO') or
             (VS_Posto = 'MAJ BRIG') or (VS_Posto = 'MAJ BRIGADEIRO') or (VS_Posto = 'MAJOR BRIGADEIRO') or
             (VS_Posto = 'TEN BRIG') or (VS_Posto = 'TENENTE BRIGADEIRO') or (VS_Posto = 'MAJOR BRIGADEIRO') or
             (VS_Posto = 'OFICIAL GENERAL') or
             (VS_Posto = 'GENERAL-DE-BRIGADA') or (VS_Posto = 'GENERAL-DE-DIVISÃO') or
             (VS_Posto = 'VICE-ALMIRANTE') or (VS_Posto = 'GENERAL-DE-DIVISÃO')) Then
            Oficiais_Generais:= Oficiais_Generais + Tempo;

          //--- Tratamento para Oficiais_Superiores              MAJOR

         if ((VS_Posto = 'CORONEL') or (VS_Posto = 'TENENTE CORONEL') or (VS_Posto = 'MAJOR') or (VS_Posto = 'MAJ')) then
            Oficiais_Superiores:= Oficiais_Superiores + Tempo;

          //--- Tratamento para Oficiais_Intermediarios

         if ((VS_Posto = 'CAP') or (VS_Posto = 'CAPITÃO')) then
            Oficiais_Intermediarios:= Oficiais_Intermediarios + Tempo;

          //--- Tratamento para Oficiais_Subalternos_Aspirantes

         if ((VS_Posto = '1º TEN') or (VS_Posto = '1º TENENTE') or (VS_Posto = '1ºTEN') or (VS_Posto = '2º TEN') or
             (VS_Posto = '2º TENENTE') or (VS_Posto = '2ºTEN')) then
            Oficiais_Subalternos_Aspirantes:= Oficiais_Subalternos_Aspirantes + Tempo;

         //--- Tratamento SO_SGT

         if ((VS_Posto = 'SUBOFICIAL') or (VS_Posto = 'SO') or
             (VS_Posto = '1S') or (VS_Posto = '2S') or (VS_Posto = '3S') or
             (VS_Posto = '1º SARGENTO') or (VS_Posto = '2º SARGENTO') or (VS_Posto = '3º SARGENTO')) then
             SO_SGT:= SO_SGT + Tempo;

        //--- Tratamento para CB_SD_TF

         if ((VS_Posto = 'CB') or (VS_Posto = 'SD') or (VS_Posto = 'SOLDADO') or (VS_Posto = 'CABOS') ) then
           CB_SD_TF:= CB_SD_TF + Tempo;

         //--- Tratamento Civil

         if ((copy(VS_Posto,1,5) = 'CIVIL') or (copy(VS_Posto,1,5) = 'CIVÍL') or (copy(VS_Posto,1,2) = 'CV')) then
             Civil:= Civil + Tempo;
      end;
      Query_Historico.Next;
   end;


   Label_Valor_Oficiais_Generais.Caption:= IntToStr(Oficiais_Generais);
   Label_Valor_Oficiais_Superiores.Caption:= IntToStr(Oficiais_Superiores);
   Label_Valor_Oficiais_Intermediarios.Caption:= IntToStr(Oficiais_Intermediarios);
   Label_Valor_Oficiais_Subalternos_Aspirantes.Caption:= IntToStr(Oficiais_Subalternos_Aspirantes);
   Label_Valor_SO_SGT.Caption:= IntToStr(SO_SGT);
   Label_Valor_CB_SD_TF.Caption:= IntToStr(CB_SD_TF);
   Label_Valor_Civil.Caption:= IntToStr(Civil);

end;

procedure TForm_AtividadeHotelaria.ToolButton5Click(Sender: TObject);
var
   VS_Posto, VS_Comando: String;
   Oficiais_Generais, Oficiais_Superiores, Oficiais_Intermediarios, Oficiais_Subalternos_Aspirantes, SO_SGT, CB_SD_TF, Civil: Integer;
   D_Oficiais_Generais, D_Oficiais_Superiores, D_Oficiais_Intermediarios, D_Oficiais_Subalternos_Aspirantes, D_SO_SGT, D_CB_SD_TF, D_Civil: real;
   Tempo: integer;
   Data_Entrada, Data_Saida: TDateTime;
   ValorDiarias: Real;
begin
   Oficiais_Generais:= 0;
   Oficiais_Superiores:= 0;
   Oficiais_Intermediarios:= 0;
   Oficiais_Subalternos_Aspirantes:= 0;
   SO_SGT:= 0;
   CB_SD_TF:= 0;
   Civil:= 0;

   D_Oficiais_Generais:= 0;
   D_Oficiais_Superiores:= 0;
   D_Oficiais_Intermediarios:= 0;
   D_Oficiais_Subalternos_Aspirantes:= 0;
   D_SO_SGT:= 0;
   D_CB_SD_TF:= 0;
   D_Civil:= 0;

   ValorDiarias:= 0;

   if JvDateEdit_Inicio.Text = '  /  /    ' then
   begin
      ShowMessage('A Data de início não pode ser branco...');
      JvDateEdit_Inicio.SetFocus;
   end
   else
   begin
      if JvDateEdit_DataTermino.Text = '  /  /    ' then
      begin
         ShowMessage('A Data de término não pode ser branco...');
         JvDateEdit_DataTermino.SetFocus;
      end
      else
      begin

{         VS_Comando:= 'Select ho.Nome, ho.posto, a.dataentrada as Entrada, a.datasaida as Saida, a.Tipo_Fechamento as Tipo '+
                      ' From Historico a, hospede b '+
                      ' From historico hi, hospede ho '+
                      ' where a.identidade = ho.identidade '+
//                      ' and   hi.Tipo_Fechamento = '+#39+'F'+#39+
//                      ' and nrecibo is not NULL  '+
//                      ' and   hi.ano = '+Funcoes.AnoAtual+
                      ' and (TO_DATE(hi.dataentrada)  <= '+#39+JvDateEdit_DataTermino.Text+#39+' and TO_DATE(hi.datasaida)  >= '+#39+JvDateEdit_Inicio.Text+#39+')';
//                      ' and TO_DATE(hi.dataentrada) BETWEEN '+#39+JvDateEdit_Inicio.Text+#39+' and '+#39+JvDateEdit_DataTermino.Text+#39+;
}
         VS_Comando:= 'Select b.Nome, b.posto, a.dataentrada, a.datasaida, a.Tipo_Fechamento as Tipo, a.ValorPago '+
                      ' From Historico a, hospede b '+
                      ' where a.identidade = b.identidade '+
                      ' and (TO_DATE(a.dataentrada)  <= '+#39+JvDateEdit_DataTermino.Text+#39+' and TO_DATE(a.datasaida)  >= '+#39+JvDateEdit_Inicio.Text+#39+')';

         Update;

//         Memo1.Lines.Clear;
//         Memo1.Lines.Add(VS_Comando+VS_Comando_Where+' order by b.posto ');


         Query_Atividades.Close;
         Query_Atividades.Sql.Clear;
         Query_Atividades.Sql.Add(VS_Comando+' order by b.posto ');
         Query_Atividades.Open;

//   Busca_opcao;

         Query_Atividades.First;
         While not Query_Atividades.Eof do
         begin
            if Query_Atividades.FieldByName('dataentrada').AsdateTime >= JvDateEdit_Inicio.Date then
                Data_Entrada:= Query_Atividades.FieldByName('dataentrada').AsdateTime
            else
                Data_Entrada:= JvDateEdit_Inicio.Date;

            if Query_Atividades.FieldByName('datasaida').AsdateTime >= JvDateEdit_DataTermino.Date then
                Data_Saida:= Query_Atividades.FieldByName('datasaida').AsdateTime
            else
                Data_Saida:= JvDateEdit_DataTermino.Date;

            Tempo:=  DaysBetween(Data_Saida, Data_Entrada);

            ValorDiarias:= ValorDiarias+Query_Atividades.FieldByName('ValorPago').AsFloat;

//            Memo1.Lines.Add(DateToStr(Data_Entrada)+' - '+DateToStr(Data_Saida)+' - '+IntToStr(Tempo));


               VS_Posto:= UpperCase(trim(Query_Atividades.FieldByName('Posto').AsString));
                       //-------------------
                //--- Tratamento Oficiais_Generais
               //-------------------

               if ((VS_Posto = 'BRIGADEIRO') or
                   (VS_Posto = 'MAJ BRIG') or (VS_Posto = 'MAJ BRIGADEIRO') or (VS_Posto = 'MAJOR BRIGADEIRO') or
                   (VS_Posto = 'TEN BRIG') or (VS_Posto = 'TENENTE BRIGADEIRO') or (VS_Posto = 'MAJOR BRIGADEIRO') or
                   (VS_Posto = 'OFICIAL GENERAL') or
                   (VS_Posto = 'GENERAL-DE-BRIGADA') or (VS_Posto = 'GENERAL-DE-DIVISÃO') or
                   (VS_Posto = 'VICE-ALMIRANTE') or (VS_Posto = 'GENERAL-DE-DIVISÃO')) Then
               begin
                  Oficiais_Generais:= Oficiais_Generais + Tempo;
                  D_Oficiais_Generais:= D_Oficiais_Generais + Query_Atividades.FieldByName('ValorPago').AsInteger;
               end;

                //--- Tratamento para Oficiais_Superiores              MAJOR

               if ((VS_Posto = 'CORONEL') or (VS_Posto = 'TENENTE CORONEL') or (VS_Posto = 'MAJOR') or (VS_Posto = 'MAJ')) then
               begin
                  Oficiais_Superiores:= Oficiais_Superiores + Tempo;
                  D_Oficiais_Superiores:= D_Oficiais_Superiores + Query_Atividades.FieldByName('ValorPago').AsInteger;
               end;

                //--- Tratamento para Oficiais_Intermediarios

               if ((VS_Posto = 'CAP') or (VS_Posto = 'CAPITÃO')) then
               begin
                  Oficiais_Intermediarios:= Oficiais_Intermediarios + Tempo;
                  D_Oficiais_Intermediarios:= D_Oficiais_Intermediarios + Query_Atividades.FieldByName('ValorPago').AsInteger;
               end;

                //--- Tratamento para Oficiais_Subalternos_Aspirantes

               if ((VS_Posto = '1º TEN') or (VS_Posto = '1º TENENTE') or (VS_Posto = '1ºTEN') or (VS_Posto = '2º TEN') or
                   (VS_Posto = '2º TENENTE') or (VS_Posto = '2ºTEN')) then
               begin
                  Oficiais_Subalternos_Aspirantes:= Oficiais_Subalternos_Aspirantes + Tempo;
                  D_Oficiais_Subalternos_Aspirantes:= D_Oficiais_Subalternos_Aspirantes + Query_Atividades.FieldByName('ValorPago').AsInteger;
               end;

              //--- Tratamento SO_SGT

               if ((VS_Posto = 'SUBOFICIAL') or (VS_Posto = 'SO') or
                   (VS_Posto = '1S') or (VS_Posto = '2S') or (VS_Posto = '3S') or
                   (VS_Posto = '1º SARGENTO') or (VS_Posto = '2º SARGENTO') or (VS_Posto = '3º SARGENTO')) then
               begin
                  SO_SGT:= SO_SGT + Tempo;
                  D_SO_SGT:= D_SO_SGT + Query_Atividades.FieldByName('ValorPago').AsInteger;
               end;

              //--- Tratamento para CB_SD_TF

               if ((VS_Posto = 'CB') or (VS_Posto = 'SD') or (VS_Posto = 'SOLDADO') or (VS_Posto = 'CABOS') ) then
               begin
                  CB_SD_TF:= CB_SD_TF + Tempo;
                  D_CB_SD_TF:= D_CB_SD_TF + Query_Atividades.FieldByName('ValorPago').AsInteger;
               end;

               //--- Tratamento Civil

               if ((copy(VS_Posto,1,5) = 'CIVIL') or (copy(VS_Posto,1,5) = 'CIVÍL') or (copy(VS_Posto,1,2) = 'CV')) then
               begin
                  Civil:= Civil + Tempo;
                  D_Civil:= D_Civil + Query_Atividades.FieldByName('ValorPago').AsInteger;
               end;

            Query_Atividades.Next;
         end;
      end;
   end;

   ValorDiarias:= D_Oficiais_Generais+D_Oficiais_Superiores+D_Oficiais_Intermediarios+D_Oficiais_Subalternos_Aspirantes+D_SO_SGT+D_CB_SD_TF+D_Civil;

   Label_Valor_Oficiais_Generais.Caption:= IntToStr(Oficiais_Generais);
   Label_Valor_Oficiais_Superiores.Caption:= IntToStr(Oficiais_Superiores);
   Label_Valor_Oficiais_Intermediarios.Caption:= IntToStr(Oficiais_Intermediarios);
   Label_Valor_Oficiais_Subalternos_Aspirantes.Caption:= IntToStr(Oficiais_Subalternos_Aspirantes);
   Label_Valor_SO_SGT.Caption:= IntToStr(SO_SGT);
   Label_Valor_CB_SD_TF.Caption:= IntToStr(CB_SD_TF);
   Label_Valor_Civil.Caption:= IntToStr(Civil);
   Label_Arrecadacao.Caption:= FormatFloat('####0.00', ValorDiarias);
end;

end.



{

Caso x - Y


Select ho.posto, To_Date(hi.datasaida)-TO_DATE('01/02/2018') Tempo, hi.dataEntrada, hi.datasaida
                 From historico hi, hospede ho
                 where hi.identidade = ho.identidade
                 and   hi.ano = 2018
                 and   hi.Tipo_Fechamento = 'F'
                 and   hi.nrecibo is not NULL
                 and   TO_DATE(hi.datasaida) BETWEEN '01/02/2018' and '28/02/2018'
                 order by hi.datasaida


------------------
Caso 0


Select ho.Nome, ho.posto, hi.dataentrada as Entrada, hi.datasaida as Saida, hi.Tipo_Fechamento as Tipo,
                       TO_DATE('28/02/2018') - To_Date(hi.dataentrada) Tempo1,
                       9999 Tempo2
                 From historico hi, hospede ho
                 where hi.identidade = ho.identidade
                 and   hi.ano = 2018
                 and   hi.Tipo_Fechamento = 'F'
                 and   hi.nrecibo is not NULL
                 and   TO_DATE(hi.dataEntrada) BETWEEN '01/02/2018' and '28/02/2018'
                 and TO_DATE(hi.dataSaida) > '28/02/2018'
                 order by hi.DataEntrada


------------------
Caso z


Select ho.Nome, ho.posto, hi.dataentrada as Entrada, hi.datasaida as Saida, hi.Tipo_Fechamento as Tipo, 
                       TO_DATE(hi.dataSaida) - To_Date(hi.dataentrada) Tempo1, 
                       30 Tempo2 
                 From historico hi, hospede ho 
                 where hi.identidade = ho.identidade 
                 and   hi.ano = 2018
                 and   hi.Tipo_Fechamento = 'F'
                 and   hi.nrecibo is not NULL  
                 and   TO_DATE(hi.dataEntrada) < '01/02/2018'
                 and TO_DATE(hi.dataSaida) > '28/02/2018'
                 order by hi.DataEntrada

}
