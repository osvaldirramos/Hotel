{ QuickReport list template }

unit Relacao_Hospede;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, ExtCtrls, IBCustomDataSet, IBQuery, jpeg, IBTable;

type
  TForm_Rel_Hospede = class(TQuickRep)
    QRBand2: TQRBand;
    QRLabel_Predio: TQRLabel;
    QRLabel_Apto: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText8: TQRDBText;
    QRSysData4: TQRSysData;
    QRSysData5: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Rel_Hospede: TForm_Rel_Hospede;

implementation

uses Menu_Principal;

{$R *.DFM}


end.
