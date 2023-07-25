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
    QRImage1: TQRImage;
    IBQuery_Hospedagem: TIBQuery;
    QRLabel3: TQRLabel;
    IBQuery_HospedagemIDENTIDADE: TIBStringField;
    IBQuery_HospedagemFICHA: TIBStringField;
    IBQuery_HospedagemANO: TSmallintField;
    IBQuery_HospedagemPREDIO: TIBStringField;
    IBQuery_HospedagemAPTO: TSmallintField;
    IBQuery_HospedagemCAMA: TSmallintField;
    IBQuery_HospedagemDATAENTRADA: TIBStringField;
    IBQuery_HospedagemHORAENTRADA: TIBStringField;
    IBQuery_HospedagemDATASAIDA: TIBStringField;
    IBQuery_HospedagemDEPENDENTE: TSmallintField;
    IBQuery_HospedagemSITUACAO_HOSPEDAGEM: TIBStringField;
    IBQuery_HospedagemRECEBE: TIBStringField;
    IBQuery_HospedagemDESCONTO: TIBStringField;
    DSQ_Hospedagem: TDataSource;
    IBTable_Hospede: TIBTable;
    procedure QRListForm_Rel_ReservaAfterPrint(Sender: TObject);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Rel_Hospede: TForm_Rel_Hospede;

implementation

{$R *.DFM}

procedure TForm_Rel_Hospede.QRListForm_Rel_ReservaAfterPrint(Sender: TObject);
begin
   IBQuery_Hospedagem.Close;
   IBQuery_Hospedagem.Open;

   IBTable_Hospede.Close;
   IBTable_Hospede.Open;
end;

procedure TForm_Rel_Hospede.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   IBQuery_Hospedagem.Close;
   IBQuery_Hospedagem.Open;

   IBTable_Hospede.Close;
   IBTable_Hospede.Open;
end;

end.
