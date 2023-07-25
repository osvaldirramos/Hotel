unit Unit2;

interface

uses
  SysUtils, Classes, IBDatabase, DB, ImgList, Controls;

type
  TDM = class(TDataModule)
    IBDatabase_HotelLocal: TIBDatabase;
    IBTransaction_HotelLocal: TIBTransaction;
    ImageList_Principal: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
