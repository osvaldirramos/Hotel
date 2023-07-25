{ QuickReport master detail template }

unit Rel_Apartamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, DBTables, ExtCtrls, jpeg, IBCustomDataSet, IBTable,
  IBQuery;

type
  TQRLabelsForm_Apto = class(TQuickRep)
    DetailBand1: TQRBand;
    TitleBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRSysData5: TQRSysData;
    QRSysData4: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    DST_Apto: TDataSource;
    QRDBText7: TQRDBText;
    QRImage1: TQRImage;
    IBTable_Cama: TIBTable;
    IBTable_CamaPREDIO: TIBStringField;
    IBTable_CamaAPTO: TSmallintField;
    IBTable_CamaCAMA: TSmallintField;
    IBTable_CamaAPTCODIGO: TIBStringField;
    IBTable_CamaNOME: TIBStringField;
    QRLabel9: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    IBQuery_Apto: TIBQuery;
    IBQuery_AptoPREDIO: TIBStringField;
    IBQuery_AptoAPTO: TSmallintField;
    IBQuery_AptoRAMAL: TIBStringField;
    IBQuery_AptoTV1: TIBStringField;
    IBQuery_AptoTV2: TIBStringField;
    IBQuery_AptoVIRTUAL: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QRLabelsForm_Apto: TQRLabelsForm_Apto;

implementation

{$R *.DFM}

end.
