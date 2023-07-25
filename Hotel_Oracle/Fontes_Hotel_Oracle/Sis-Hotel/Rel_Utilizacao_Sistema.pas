{ QuickReport master detail template }

unit Rel_Utilizacao_Sistema;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, DBTables, ExtCtrls, Rotinas, jpeg;

Const
   ASPAS= '''';

type
  TQRMDForm_Utilizacao_Sistema = class(TQuickRep)
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel_Usuario: TQRLabel;
    QRLabel_Data: TQRLabel;
    QRLabel_Hora_Entrada: TQRLabel;
    QRLabel_Hora_Saida: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRImage1: TQRImage;
    QRLabel1: TQRLabel;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    procedure QRMDForm_Utilizacao_SistemaAfterPreview(Sender: TObject);
  private    { Private declarations }

  public
    { Public declarations }
  end;

var
  QRMDForm_Utilizacao_Sistema: TQRMDForm_Utilizacao_Sistema;

implementation

{$R *.DFM}


procedure TQRMDForm_Utilizacao_Sistema.QRMDForm_Utilizacao_SistemaAfterPreview(
  Sender: TObject);
begin
//Form_Utilizacao_Sistema.Query_Verfica.Close;
end;

end.
