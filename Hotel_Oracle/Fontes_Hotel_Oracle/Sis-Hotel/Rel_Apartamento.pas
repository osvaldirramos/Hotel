{ QuickReport master detail template }

unit Rel_Apartamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, DBTables, ExtCtrls, jpeg;

type
  TQRLabelsForm_Apto = class(TQuickRep)
    DetailBand1: TQRBand;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRSysData5: TQRSysData;
    QRSysData4: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    Table_Apto: TTable;
    Table_AptoPREDIO: TStringField;
    Table_AptoAPTO: TFloatField;
    Table_AptoRAMAL: TStringField;
    Table_AptoTV1: TStringField;
    Table_AptoTV2: TStringField;
    DST_Apto: TDataSource;
    Table_Cama: TTable;
    Table_CamaPREDIO: TStringField;
    Table_CamaAPTO: TFloatField;
    Table_CamaCAMA: TFloatField;
    Table_CamaAPTCODIGO: TStringField;
    DST_Cama: TDataSource;
    QRDBText7: TQRDBText;
    QRImage1: TQRImage;
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
