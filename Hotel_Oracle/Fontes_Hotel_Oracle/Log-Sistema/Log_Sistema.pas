unit Log_Sistema;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDataModule2 = class(TDataModule)
    Database_HTL: TDatabase;
    Query_Usuario: TQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{$R *.DFM}

procedure TDataModule2.DataModuleCreate(Sender: TObject);
begin
   try
      Query_Usuario.open;
      ShowMessage('         O Servidor esta no ar'+#13+#13+
                  'Entre em contato com o pessoal responsável....' );
   except
      on E:EDBEngineError Do
          Case E.Errors[0].ErrorCode of
             10024: ShowMessage('Tabela não existente');
             11271: Begin
                       ShowMessage('         O Servidor esta fora do ar'+#13+#13+
                                   'Entre em contato com o pessoal responsável....' );
//                       Form_Menu_Pri_U.Show;
                    end;
          else
             ShowMessage('MSG: '+E.Message+#13+#13+' Codigo: '+inttostr(E.Errors[0].ErrorCode));
      end;
   end;

end;

end.
