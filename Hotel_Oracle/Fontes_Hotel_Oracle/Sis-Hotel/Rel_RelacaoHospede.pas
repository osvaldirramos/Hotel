{ QuickReport list template }

unit Rel_RelacaoHospede;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, DBTables, ExtCtrls, IBTable, IBCustomDataSet,
  IBQuery, jpeg;

type
  TQRListForm_Rel_RelacaoHospede = class(TQuickRep)
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRSysData4: TQRSysData;
    QRSysData5: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRImage1: TQRImage;
    Query_Hospedagem: TQuery;
    DSQ_Hospedagem: TDataSource;
    Table_Hospede: TTable;
    QRLabel10: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel_Apto: TQRLabel;
    QRLabel_Predio: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    Query_HospedagemPREDIO: TStringField;
    Query_HospedagemAPTO: TFloatField;
    Query_HospedagemDATAENTRADA: TStringField;
    Query_HospedagemDATASAIDA: TStringField;
    Query_HospedagemIDENTIDADE: TStringField;
    procedure QuickRepAfterPrint(Sender: TObject);
    procedure QuickRepAfterPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QRListForm_Rel_RelacaoHospede: TQRListForm_Rel_RelacaoHospede;

implementation

{$R *.DFM}

procedure TQRListForm_Rel_RelacaoHospede.QuickRepAfterPrint(Sender: TObject);
begin
   Query_Hospedagem.Open;
   Table_Hospede.Open;
end;

procedure TQRListForm_Rel_RelacaoHospede.QuickRepAfterPreview(  Sender: TObject);
begin
   Query_Hospedagem.Open;
   Table_Hospede.open;
end;

end.
