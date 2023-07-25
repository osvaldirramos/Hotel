{ QuickReport list template }

unit Rel_Rela_Hospede;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, DBTables, ExtCtrls, IBTable, IBCustomDataSet,
  IBQuery, jpeg;

type
  TQRListForm_Rel_Hospede = class(TQuickRep)
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel_Predio: TQRLabel;
    QRLabel_Apto: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    DSQ_Hospedagem: TDataSource;
    QRLabel3: TQRLabel;
    QRSysData4: TQRSysData;
    QRSysData5: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    Query_Hospedagem: TQuery;
    Query_HospedagemIDENTIDADE: TStringField;
    Query_HospedagemFICHA: TStringField;
    Query_HospedagemANO: TFloatField;
    Query_HospedagemPREDIO: TStringField;
    Query_HospedagemAPTO: TFloatField;
    Query_HospedagemCAMA: TFloatField;
    Query_HospedagemDATAENTRADA: TStringField;
    Query_HospedagemHORAENTRADA: TStringField;
    Query_HospedagemDATASAIDA: TStringField;
    Query_HospedagemDEPENDENTE: TFloatField;
    Query_HospedagemSITUACAO_HOSPEDAGEM: TStringField;
    Query_HospedagemRECEBE: TStringField;
    Query_HospedagemDESCONTO: TStringField;
    Table_Hospede: TTable;
    QRLabel1: TQRLabel;
    QRDBText8: TQRDBText;
    QRImage1: TQRImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QRListForm_Rel_Hospede: TQRListForm_Rel_Hospede;

implementation

{$R *.DFM}

end.
