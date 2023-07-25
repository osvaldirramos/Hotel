object Form1: TForm1
  Left = 1541
  Top = 129
  Width = 1088
  Height = 750
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 120
    Top = 120
    Width = 769
    Height = 545
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 160
    Top = 80
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 1
  end
  object Table_Apto: TTable
    Active = True
    DatabaseName = 'hotel1'
    TableName = 'APARTAMENTO'
    Left = 344
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = Table_Apto
    Left = 392
    Top = 24
  end
end
