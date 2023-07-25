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
   MessageDlg('      Mostra o Mapa de ocupação permitindo ao usuário: '+#13+#13+
              '- Cadastrar hospedagem através da opção Hospedar, para confirmar '+#13+
              '  a hospedagem é necessário confirmar utilizando o botão Gravar,'+#13+
              '- Alterar informações do hospede,'+#13+
              '- Fechar a conta do hospede,',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton_Rest_HospedeClick(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde o usuário poderá indicar restrições ao hospede:'+#13+
              '- Hospede que pagou com cheque sem fundo,'+#13+
              '- Hospede que teve alteração de comportamento,'+#13+
              '- Hospede restringido pelo Diretor.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton1Click(Sender: TObject);
begin
   MessageDlg('     Mostra o Mapa de ocupação permitindo ao usuário que faça:'+#13+#13+
              '- Efetuar reserva,'+#13+
              '- Cancelar reserva,',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton3Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde o usuário poderá inserir maiores informações'#13+
              'da reserva, estas informações irão auxiliar na hora da hospedagem:'+#13+#13+
              '- Cadastrar reserva,'+#13+
              '- Alterar informações de reserva já cadastrada,'+#13+
              '- Cancelar reserva.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton6Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde o usuário poderá tratar os valores de hospedagem'#13+
              'de residentes, '+#13+#13+
              '- Cadastrar valores,'+#13+
              '- Alterar valore já cadastrada,'+#13+
              '- Excluir valores cadastrados.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton5Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde o usuário poderá tratar os valores de hospedagem:'+#13+#13+
              '- Cadastrar valores,'+#13+
              '- Alterar valore já cadastrada,'+#13+
              '- Excluir valores cadastrados.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton7Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde o usuário poderá tratar do cadastro de Posto:'+#13+
              '- Cadastrar posto,'+#13+
              '- Alterar posto já cadastrado,'+#13+
              '- Excluir posto cadastrado.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton8Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde o usuário poderá tratar do cadastro dos'+#13+
              'cursos: '+#13+#13+
              '- Cadastrar curso,'+#13+
              '- Alterar curso já cadastrado,'+#13+
              '- Excluir curso cadastrado.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton9Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde o usuário poderá tratar do cadastro das'+#13+
              'unidades do DECEA: '+#13+#13+
              '- Cadastrar unidades do DECEA ,'+#13+
              '- Alterar unidades do DECEA já cadastrado,'+#13+
              '- Excluir unidades do DECEA cadastrado.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton11Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde o usuário poderá tratar do cadastro dos'+#13+
              'responsáveis pelo Hotel: '+#13+#13+
              '- Alterar nome e posto do responsavel pelo hotel,'+#13+#13+
              '     Este cadastro é feito com a finalidade de identificar os nomes'+#13+
              'que aparecerão nos documentos lançados pelo Hotel.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton10Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde o usuário poderá tratar do cadastro dos usuários do Sistema:'+#13+#13+
              '- Cadastrar usuários,'+#13+
              '- Alterar dados do usuário já cadastrado,'+#13+
              '- Excluir usuário cadastrado.'+#13+#13+
              '     OBS: Não esquecer de eliminar os usuários que não estão'+#13+
              'trabalhando mais no hotel.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton4Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde o usuário poderá tratar do cadastro dos Aptos e camas:'+#13+#13+
              '- Cadastrar apto e cama,'+#13+
              '- Alterar apto e camas já cadastrado,'+#13+
              '- Excluir apto e cama cadastrado.'+#39+#39+
              '     Permite que o usuário indique se o apto esta disponível ou com'+#39+
              'problema não permitindo hospedagem',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton12Click(Sender: TObject);
begin
   MessageDlg('Mostra janela, onde o usuário poderá cancelar hospedagem não concretizada.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton13Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde o usuário fará o encerramento das hospedagens'+#13+
              'pagas para pagamento.',
              mtInformation, [mbOK], 0);

end;

procedure TForm_Dicas_Utilizacao.ToolButton14Click(Sender: TObject);
begin
   MessageDlg('Mostra janela, onde o usuário consultar o histórico das hospedagens',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton15Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde o usuário poderá divulgar diversos serviços,'+#13+
              'que facilitam a estadia do hospede, o gerente poderá: '+#13+#13+
              '- Cadastrar facilidades,'+#13+
              '- Alterar  facilidades já cadastrado,'+#13+
              '- Excluir  facilidades cadastrado.'+#39+#39+
              '  Este modulo tem a função de dar suporte aos cassineiros quando'+#13+
              'estes precisam dar dicas aos hospedes.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton16Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde o cassineiro poderá fazer os relatórios,'+#13+
              'de movimentação (entrada, saídas e lista com os valores pagos'+#13+
              'listando os cheques.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton17Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde a gerencia poderá consultar o quadro de '+#13+
              'ocupação, através de valores fornecidos e gráficos.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton18Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde a gerencia poderá consultar a arrecadação '+#13+
              'mensal de um determinado ano, esta consulta é feita através de  '+#13+
              'valores fornecidos e gráficos.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton19Click(Sender: TObject);
begin
   MessageDlg('     Mostra janela onde a gerencia poderá consultar a arrecadação '+#13+
              'por situação de hospedagem de um determinado ano, esta consulta é'+#13+
              'feita através de valores fornecidos e gráficos.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton20Click(Sender: TObject);
begin
   MessageDlg('     Esta opção permite a gerencia ter a relação dos hospedes.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton21Click(Sender: TObject);
begin
   MessageDlg('     Esta opção permite a gerencia ter a relação das reservas.',
              mtInformation, [mbOK], 0);

end;

procedure TForm_Dicas_Utilizacao.ToolButton24Click(Sender: TObject);
begin
   MessageDlg('     Esta opção permite uma saída mais rápida do sistema.',
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton22Click(Sender: TObject);
begin
   MessageDlg('     Esta opção permite saber qual é a versão do sistema, mostrando'+#13+
              'a versão e a data da última atualização'+#13+#13+
              'A última versão é '+Versao+' do dia '+Ultima_Atualizacao,
              mtInformation, [mbOK], 0);
end;

procedure TForm_Dicas_Utilizacao.ToolButton23Click(Sender: TObject);
begin
   MessageDlg('     Esta opção permite que o usuário saíba quais são as funções do'+#13+
              'sistema ',
              mtInformation, [mbOK], 0);
end;
end.
