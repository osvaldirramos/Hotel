{ QuickReport list template }

unit Rel_EMailHospede;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, DB, DBTables, ExtCtrls, IBTable, IBCustomDataSet,
  IBQuery, jpeg;

type
  TQRListForm_Rel_EMailHospede = class(TQuickRep)
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel3: TQRLabel;
    QRSysData4: TQRSysData;
    QRSysData5: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    Table_Hospede: TTable;
    QRImage1: TQRImage;
    Table_HospedeIDENTIDADE: TStringField;
    Table_HospedeNOME: TStringField;
    Table_HospedeNOME_GUERRA: TStringField;
    Table_HospedePOSTO: TStringField;
    Table_HospedeNACIONALIDADE: TStringField;
    Table_HospedeTELEFONE_RESIDENCIAL: TStringField;
    Table_HospedeTELEFONE_FUNCIONAL: TStringField;
    Table_HospedeSITUACAO_CURSO: TStringField;
    Table_HospedeRESIDENCIA: TStringField;
    Table_HospedeNUMERO: TStringField;
    Table_HospedeCIDADE: TStringField;
    Table_HospedeBAIRRO: TStringField;
    Table_HospedeESTADO: TStringField;
    Table_HospedeOM_ORIGEM: TStringField;
    Table_HospedeDEPENDENTE_DE: TStringField;
    Table_HospedeSITUACAO: TStringField;
    Table_HospedeOBS: TStringField;
    Table_HospedeTELEFONE_CELULAR: TStringField;
    Table_HospedeEMAIL: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QRListForm_Rel_EMailHospede: TQRListForm_Rel_EMailHospede;

implementation

{$R *.DFM}

end.
