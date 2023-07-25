unit Dicas_Utilizacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ComCtrls, StdCtrls, ExtCtrls, Rotinas, jpeg, ToolWin, JvGradient;

type
  TForm_Dicas_Utilizacao = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox_Ajuda: TGroupBox;
    GroupBox_Windows: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label_Estatistica: TLabel;
    GroupBox1: TGroupBox;
    Label_Reserva: TLabel;
    Label_Hospede: TLabel;
    JvGradient1: TJvGradient;
    Label2: TLabel;
    Label1: TLabel;
    Image_Hotel: TImage;
    ToolBar2: TToolBar;
    ToolButton_Retornar: TToolButton;
    ToolBar1: TToolBar;
    ToolButton_Rest_Hospede: TToolButton;
    ToolButton_Cad_Hospede: TToolButton;
    ToolBar3: TToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolBar4: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolBar5: TToolBar;
    ToolButton12: TToolButton;
    ToolBar6: TToolBar;
    ToolButton13: TToolButton;
    ToolBar7: TToolBar;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolBar8: TToolBar;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolBar9: TToolBar;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolBar10: TToolBar;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolBar11: TToolBar;
    ToolButton24: TToolButton;
    ToolButton_Windows: TToolButton;
    procedure ToolButton_RetornarClick(Sender: TObject);
    procedure ToolButton_WindowsClick(Sender: TObject);
    procedure ToolButton_Cad_HospedeClick(Sender: TObject);
    procedure ToolButton_Rest_HospedeClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure ToolButton15Click(Sender: TObject);
    procedure ToolButton16Click(Sender: TObject);
    procedure ToolButton17Click(Sender: TObject);
    procedure ToolButton18Click(Sender: TObject);
    procedure ToolButton19Click(Sender: TObject);
    procedure ToolButton20Click(Sender: TObject);
    procedure ToolButton21Click(Sender: TObject);
    procedure ToolButton22Click(Sender: TObject);
    procedure ToolButton23Click(Sender: TObject);
    procedure ToolButton24Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Dicas_Utilizacao: TForm_Dicas_Utilizacao;

implementation

{$R *.DFM}

procedure TForm_Dicas_Utilizacao.ToolButton_RetornarClick(Sender: TObject);
begin
   Close
end;

procedure TForm_Dicas_Utilizacao.ToolButton_WindowsClick(Sender: TObject);
begin
   Funcoes.Windows;
end;

procedure TForm_Dicas_Utilizacao.ToolButton_Cad_HospedeClick(Sender: TObject);
begin
   MessageDlg('      Mostra o Mapa de ocupa��o permitindo ao usu�rio: '+#13+#13+
              '- Cadastrar hospedagem atrav�s da op��o Hospedar, para confirmar '+#13+
              '  a hospedagem � necess�rio confirmar utilizando o bot�o Gravar,'+#13+
              '- Alterar informa��es do hospede,'+#13+
              '- Fechar a conta do hospede,',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton_Rest_HospedeClick(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde o usu�rio poder� indicar restri��es ao hospede:'+#13+
              '- Hospede que pagou com cheque sem fundo,'+#13+
              '- Hospede que teve altera��o de comportamento,'+#13+
              '- Hospede restringido pelo Diretor.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton1Click(Sender: TObject);
begin
   MessageDlg('     Mostra o Mapa de ocupa��o permitindo ao usu�rio que fa�a:'+#13+#13+
              '- Efetuar reserva,'+#13+
              '- Cancelar reserva,',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton3Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde o usu�rio poder� inserir maiores informa��es'#13+
              'da reserva, estas informa��es ir�o auxiliar na hora da hospedagem:'+#13+#13+
              '- Cadastrar reserva,'+#13+
              '- Alterar informa��es de reserva j� cadastrada,'+#13+
              '- Cancelar reserva.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton6Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde o usu�rio poder� tratar os valores de hospedagem'#13+
              'de residentes, '+#13+#13+
              '- Cadastrar valores,'+#13+
              '- Alterar valore j� cadastrada,'+#13+
              '- Excluir valores cadastrados.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton5Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde o usu�rio poder� tratar os valores de hospedagem:'+#13+#13+
              '- Cadastrar valores,'+#13+
              '- Alterar valore j� cadastrada,'+#13+
              '- Excluir valores cadastrados.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton7Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde o usu�rio poder� tratar do cadastro de Posto:'+#13+
              '- Cadastrar posto,'+#13+
              '- Alterar posto j� cadastrado,'+#13+
              '- Excluir posto cadastrado.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton8Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde o usu�rio poder� tratar do cadastro dos'+#13+
              'cursos: '+#13+#13+
              '- Cadastrar curso,'+#13+
              '- Alterar curso j� cadastrado,'+#13+
              '- Excluir curso cadastrado.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton9Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde o usu�rio poder� tratar do cadastro das'+#13+
              'unidades do DECEA: '+#13+#13+
              '- Cadastrar unidades do DECEA ,'+#13+
              '- Alterar unidades do DECEA j� cadastrado,'+#13+
              '- Excluir unidades do DECEA cadastrado.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton11Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde o usu�rio poder� tratar do cadastro dos'+#13+
              'respons�veis pelo Hotel: '+#13+#13+
              '- Alterar nome e posto do responsavel pelo hotel,'+#13+#13+
              '     Este cadastro � feito com a finalidade de identificar os nomes'+#13+
              'que aparecer�o nos documentos lan�ados pelo Hotel.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton10Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde o usu�rio poder� tratar do cadastro dos usu�rios do Sistema:'+#13+#13+
              '- Cadastrar usu�rios,'+#13+
              '- Alterar dados do usu�rio j� cadastrado,'+#13+
              '- Excluir usu�rio cadastrado.'+#13+#13+
              '     OBS: N�o esquecer de eliminar os usu�rios que n�o est�o'+#13+
              'trabalhando mais no hotel.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton4Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde o usu�rio poder� tratar do cadastro dos Aptos e camas:'+#13+#13+
              '- Cadastrar apto e cama,'+#13+
              '- Alterar apto e camas j� cadastrado,'+#13+
              '- Excluir apto e cama cadastrado.'+#39+#39+
              '     Permite que o usu�rio indique se o apto esta dispon�vel ou com'+#39+
              'problema n�o permitindo hospedagem',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton12Click(Sender: TObject);
begin
   MessageDlg('Mostra janela, onde o usu�rio poder� cancelar hospedagem n�o concretizada.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton13Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde o usu�rio far� o encerramento das hospedagens'+#13+
              'pagas para pagamento.',
              mtInformation, [mbOK], 0);

end;

procedure TForm_Dicas_Utilizacao.ToolButton14Click(Sender: TObject);
begin
   MessageDlg('Mostra janela, onde o usu�rio consultar o hist�rico das hospedagens',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton15Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde o usu�rio poder� divulgar diversos servi�os,'+#13+
              'que facilitam a estadia do hospede, o gerente poder�: '+#13+#13+
              '- Cadastrar facilidades,'+#13+
              '- Alterar  facilidades j� cadastrado,'+#13+
              '- Excluir  facilidades cadastrado.'+#39+#39+
              '  Este modulo tem a fun��o de dar suporte aos cassineiros quando'+#13+
              'estes precisam dar dicas aos hospedes.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton16Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde o cassineiro poder� fazer os relat�rios,'+#13+
              'de movimenta��o (entrada, sa�das e lista com os valores pagos'+#13+
              'listando os cheques.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton17Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde a gerencia poder� consultar o quadro de '+#13+
              'ocupa��o, atrav�s de valores fornecidos e gr�ficos.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton18Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde a gerencia poder� consultar a arrecada��o '+#13+
              'mensal de um determinado ano, esta consulta � feita atrav�s de  '+#13+
              'valores fornecidos e gr�ficos.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton19Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde a gerencia poder� consultar a arrecada��o '+#13+
              'por situa��o de hospedagem de um determinado ano, esta consulta �'+#13+
              'feita atrav�s de valores fornecidos e gr�ficos.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton20Click(Sender: TObject);
begin
   MessageDlg('     Esta op��o permite a gerencia ter a rela��o dos hospedes.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton21Click(Sender: TObject);
begin
   MessageDlg('     Esta op��o permite a gerencia ter a rela��o das reservas.',
              mtInformation, [mbOK], 0);

end;

procedure TForm_Dicas_Utilizacao.ToolButton24Click(Sender: TObject);
begin
   MessageDlg('     Esta op��o permite uma sa�da mais r�pida do sistema.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton22Click(Sender: TObject);
begin
   MessageDlg('     Esta op��o permite saber qual � a vers�o do sistema, mostrando'+#13+
              'a vers�o e a data da �ltima atualiza��o'+#13+#13+
              'A �ltima vers�o � '+Versao+' do dia '+Ultima_Atualizacao,
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton23Click(Sender: TObject);
begin
   MessageDlg('     Esta op��o permite que o usu�rio sa�ba quais s�o as fun��es do'+#13+
              'sistema ',
              mtInformation, [mbOK], 0);
end;
end.
