{ QuickReport master detail template }

unit Rel_Log_Sistema;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, DBTables, ExtCtrls, Rotinas, jpeg;

type
  TQRMDForm_Log_Sistema = class(TQuickRep)
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel_Usuario: TQRLabel;
    QRLabel_Data: TQRLabel;
    QRLabel_Hora_Entrada: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel1: TQRLabel;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRImage1: TQRImage;
    procedure QRMDForm_Utilizacao_SistemaAfterPreview(Sender: TObject);
  private    { Private declarations }

  public
    { Public declarations }
  end;

var
  QRMDForm_Log_Sistema: TQRMDForm_Log_Sistema;

implementation

uses Utilizacao_Log_Hotel;

{$R *.DFM}

procedure TQRMDForm_Log_Sistema.QRMDForm_Utilizacao_SistemaAfterPreview(
  Sender: TObject);
begin
//  Form_Utilizacao_Log_Hotel.Query_Verfica.Close;
end;

end.
