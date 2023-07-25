{ QuickReport list template }

unit Rel_UtilizacaoSistema;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, ExtCtrls, IBCustomDataSet, IBQuery, jpeg, IBTable;

type
  TForm_Rel_UtilizacaoSistema = class(TQuickRep)
    QRBand2: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRSysData4: TQRSysData;
    QRSysData5: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Rel_UtilizacaoSistema: TForm_Rel_UtilizacaoSistema;

implementation

uses Utilizacao_Log_Hotel;

{$R *.DFM}

end.
