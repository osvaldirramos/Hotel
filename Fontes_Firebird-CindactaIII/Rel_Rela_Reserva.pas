{ QuickReport list template }

unit Rel_Rela_Reserva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, ExtCtrls, IBCustomDataSet, IBQuery, jpeg;

type
  TQRListForm_Rel_Reserva = class(TQuickRep)
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
    QRLabel3: TQRLabel;
    QRSysData4: TQRSysData;
    QRSysData5: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRImage1: TQRImage;
    IBQuery_Reserva: TIBQuery;
    IBQuery_ReservaDATAENTRADA: TDateTimeField;
    IBQuery_ReservaNOME: TIBStringField;
    IBQuery_ReservaPOSTO: TIBStringField;
    IBQuery_ReservaSITUACAO_CURSO: TIBStringField;
    IBQuery_ReservaOM_ORIGEM: TIBStringField;
    IBQuery_ReservaDEPENDENTE: TSmallintField;
    IBQuery_ReservaDATASAIDA: TDateTimeField;
    IBQuery_ReservaPREDIO: TIBStringField;
    IBQuery_ReservaAPTO: TSmallintField;
    QRDBText9: TQRDBText;
    IBQuery_ReservaNOME_GUERRA: TIBStringField;
    IBQuery_ReservaTELEFONE_FUNCIONAL: TIBStringField;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    procedure QRListForm_Rel_ReservaAfterPrint(Sender: TObject);
    procedure QuickRepAfterPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QRListForm_Rel_Reserva: TQRListForm_Rel_Reserva;

implementation

{$R *.DFM}

procedure TQRListForm_Rel_Reserva.QRListForm_Rel_ReservaAfterPrint(Sender: TObject);
begin
   IBQuery_Reserva.Close;
   IBQuery_Reserva.Open;
end;

procedure TQRListForm_Rel_Reserva.QuickRepAfterPreview(Sender: TObject);
begin
   IBQuery_Reserva.Close;
   IBQuery_Reserva.Open;
end;

end.
