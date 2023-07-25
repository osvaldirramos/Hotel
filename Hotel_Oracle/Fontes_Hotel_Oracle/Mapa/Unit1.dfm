object Form1: TForm1
  Left = 192
  Top = 124
  Width = 783
  Height = 540
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object DBGrid1: TDBGrid
    Left = 112
    Top = 64
    Width = 585
    Height = 393
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object IBTable1: TIBTable
    Database = DataModule2.IBDatabase_HotelLocal
    Transaction = DataModule2.IBTransaction_HotelLocal
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'PREDIO'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'APTO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CAMA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 6
      end
      item
        Name = 'RAMAL'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'TV1'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TV2'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TIPO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'SITUACAO_CURSO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'DATA_ENTRADA'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'DATA_SAIDA'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'IDENTIDADE'
        DataType = ftString
        Size = 12
      end>
    IndexDefs = <
      item
        Name = 'PK_MAPA'
        Fields = 'PREDIO;APTO;CAMA;CODIGO'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'MAPA'
    Left = 88
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = IBTable1
    Left = 136
    Top = 16
  end
end
