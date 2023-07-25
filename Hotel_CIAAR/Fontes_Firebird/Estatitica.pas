//----------------------------------------------------------------------------//
//                                                                            //
// NOME DO PROJETO           : HOTEL                                          //
//                                                                            //
// PROGRAMA                  : Menu_Soldado.PAS                               //
//                                                                            //
// DESCRICAO                 : Este modulo tem finalidade de montar o menu    //
//                             que sera utilizado pelo pessoal da recepcao.   //
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
// DATA                      :                                                //
// AUTOR                     :                                                //
// MODULO ALTERADO           :                                                //
// MOTIVO                    :                                                //
//----------------------------------------------------------------------------//

unit Estatitica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, Rotinas, Grids, DBGrids, Db, DBTables, ComCtrls,
  Buttons, ToolWin, StdCtrls, Mask, TeEngine, Series, TeeProcs, Chart,
  DBChart, DBCtrls, IBQuery, IBCustomDataSet, IBTable;

type
  TForm_Estatistica = class(TForm)
    StatusBar: TStatusBar;
    DST_Hospede: TDataSource;
    DST_Estatistica: TDataSource;
    DSQ_Hospedagem: TDataSource;
    IBTable_Estatistica: TIBTable;
    IBTable_EstatisticaCODIGO: TSmallintField;
    IBTable_EstatisticaSITUACAO: TIBStringField;
    IBTable_EstatisticaVALOR: TIBBCDField;
    IBQuery_Estatistica: TIBQuery;
    IBQuery_EstatisticaCODIGO: TSmallintField;
    IBQuery_EstatisticaSITUACAO: TIBStringField;
    IBQuery_EstatisticaVALOR: TIBBCDField;
    IBTable_Hospede: TIBTable;
    IBTable_HospedeIDENTIDADE: TIBStringField;
    IBTable_HospedeSITUACAO_CURSO: TIBStringField;
    IBQuery_Hospedagem: TIBQuery;
    IBQuery_HospedagemIDENTIDADE: TIBStringField;
    IBQuery_HospedagemFICHA: TIBStringField;
    IBQuery_HospedagemANO: TSmallintField;
    IBQuery_HospedagemPREDIO: TIBStringField;
    IBQuery_HospedagemAPTO: TSmallintField;
    IBQuery_HospedagemDEPENDENTE: TSmallintField;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    Label_Curso: TLabel;
    GroupBox2: TGroupBox;
    Label_Transito: TLabel;
    GroupBox3: TGroupBox;
    Label_Residente: TLabel;
    GroupBox4: TGroupBox;
    Label_Outros: TLabel;
    GroupBox5: TGroupBox;
    Label_Dependente: TLabel;
    ToolBar2: TToolBar;
    ToolButton_Retornar: TToolButton;
    ToolButton_Windows: TToolButton;
    ToolButton_Ajuda: TToolButton;
    procedure FormActivate(Sender: TObject);
    procedure Calcular;
    procedure Grava(Cod: integer; Desc: String; Valor: Real);
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);

  private
    { Private declarations }
  public    { Public declarations }
  end;

var
  Form_Estatistica: TForm_Estatistica;

implementation

uses Module;

{$R *.DFM}

//------------------------------------------------------------------------------
// Procedure principal
//------------------------------------------------------------------------------

procedure TForm_Estatistica.FormActivate(Sender: TObject);
begin
   IBQuery_Hospedagem.Open;
   IBTable_Hospede.Open;
   IBTable_Estatistica.Open;
   IBQuery_Estatistica.Open;

   Calcular;
end;

//------------------------------------------------------------------------------
// Tratamento do botao retornar
//------------------------------------------------------------------------------

procedure TForm_Estatistica.ToolButton_RetornarClick(Sender: TObject);
begin
   IBQuery_Hospedagem.Close;
   IBTable_Hospede.Close;
   DM.IBQuery_Curso.Close;
   IBTable_Estatistica.Close;
   Close;
end;

procedure TForm_Estatistica.Calcular;
var
   VS_Comando: String;
   Curso, Transito, Residente, Dependente, outros: Integer;
begin
   Curso:= 0;
   Transito:= 0;
   Residente:= 0;
   Dependente:= 0;
   outros:= 0;

   IBQuery_Hospedagem.First;
   While not IBQuery_Hospedagem.Eof do
   begin
     if IBQuery_Hospedagem.FieldByName('DEPENDENTE').AsInteger > 0 then
        Dependente:= Dependente+1;

     if Trim(IBTable_Hospede.FieldByName('SITUACAO_CURSO').AsString) = 'TRANSITO' then
     Begin
        Transito:= Transito+1;
     end
     else
     begin
        if Trim(IBTable_Hospede.FieldByName('SITUACAO_CURSO').AsString) = 'RESIDENTE' then
        begin
           Residente:= Residente+1;
        end
        else
        begin
           VS_Comando:= 'Select * from Tabela_Cursos where Curso = '+
                        #39+Trim(IBTable_Hospede.FieldByName('SITUACAO_CURSO').AsString)+#39;

           DM.IBQuery_Curso.Close;
           DM.IBQuery_Curso.Sql.Clear;
           DM.IBQuery_Curso.Sql.Add(VS_Comando);
           DM.IBQuery_Curso.Open;

           if DM.IBQuery_Curso.RecordCount > 0 then
              Curso:= Curso+1
           else
              Outros:= Outros+1;
        end;
     end;
     IBQuery_Hospedagem.Next;
   end;

   Label_Curso.Caption:= IntToStr(Curso);
   Label_Transito.Caption:= IntToStr(Transito);
   Label_Residente.Caption:= IntToStr(Residente);
   Label_Dependente.Caption:= IntToStr(Dependente);
   Label_Outros.Caption:= IntToStr(Outros);

   Funcoes.ExecSql_Servidor('Delete from Estatistica');
   Grava(1, 'Curso', Curso);
   Grava(2, 'Transito', Transito);
   Grava(3, 'Residente', Residente);
   Grava(4, 'Dependente', Dependente);
   Grava(5, 'Outros', Outros);

   IBQuery_Estatistica.Close;
   IBQuery_Estatistica.Open;

end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Estatistica.Grava(Cod: integer; Desc: String; Valor: Real);
begin
   IBTable_Estatistica.Append;
   IBTable_Estatistica.FieldByName('CODIGO').AsInteger:= Cod;
   IBTable_Estatistica.FieldByName('SITUACAO').AsString:= Desc;
   IBTable_Estatistica.FieldByName('VALOR').AsFloat:= Valor;
   IBTable_Estatistica.Post;
   DM.IBTransaction_Hotel.CommitRetaining;
end;

//------------------------------------------------------------------------------
// Procedure para tratar da saida do sistema.
//------------------------------------------------------------------------------

procedure TForm_Estatistica.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

end.
