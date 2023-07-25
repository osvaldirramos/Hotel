object Form_MontaMapa: TForm_MontaMapa
  Left = 382
  Top = 123
  Width = 1230
  Height = 794
  Caption = 'Monta Mapa'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 128
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 64
    Width = 1193
    Height = 353
    DataSource = DSQ_Mapa
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 16
    Top = 432
    Width = 993
    Height = 49
    DataSource = DST_Apto
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid3: TDBGrid
    Left = 16
    Top = 496
    Width = 993
    Height = 49
    DataSource = DST_Hospedagem
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid4: TDBGrid
    Left = 16
    Top = 560
    Width = 993
    Height = 73
    DataSource = DST_Reserva
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button2: TButton
    Left = 24
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 5
    OnClick = Button2Click
  end
  object DBGrid5: TDBGrid
    Left = 16
    Top = 640
    Width = 993
    Height = 73
    DataSource = TST_Mapa
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DST_Apto: TDataSource
    DataSet = Table_Apto
    Left = 658
    Top = 17
  end
  object IBQuery_Mapa: TIBQuery
    Database = DM.IBDatabase_HotelLocal
    Transaction = DM.IBTransaction_HotelLocal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select Identidade, predio, apto, cama, ramal, nome, tipo, situac' +
        'ao, situacao_curso, data_entrada, Data_Saida '
      'from mapa'
      'Where Tipo <> 0 and tipo <> 3'
      '')
    Left = 496
    Top = 8
    object IBQuery_MapaIDENTIDADE: TIBStringField
      FieldName = 'IDENTIDADE'
      Origin = 'MAPA.IDENTIDADE'
      Size = 12
    end
    object IBQuery_MapaPREDIO: TIBStringField
      FieldName = 'PREDIO'
      Origin = 'MAPA.PREDIO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IBQuery_MapaAPTO: TIntegerField
      FieldName = 'APTO'
      Origin = 'MAPA.APTO'
      Required = True
    end
    object IBQuery_MapaCAMA: TIntegerField
      FieldName = 'CAMA'
      Origin = 'MAPA.CAMA'
      Required = True
    end
    object IBQuery_MapaRAMAL: TIBStringField
      FieldName = 'RAMAL'
      Origin = 'MAPA.RAMAL'
      Size = 11
    end
    object IBQuery_MapaNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'MAPA.NOME'
      Size = 40
    end
    object IBQuery_MapaTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = 'MAPA.TIPO'
      FixedChar = True
      Size = 1
    end
    object IBQuery_MapaSITUACAO: TIBStringField
      FieldName = 'SITUACAO'
      Origin = 'MAPA.SITUACAO'
      Size = 60
    end
    object IBQuery_MapaSITUACAO_CURSO: TIBStringField
      FieldName = 'SITUACAO_CURSO'
      Origin = 'MAPA.SITUACAO_CURSO'
      Size = 10
    end
    object IBQuery_MapaDATA_ENTRADA: TIBStringField
      FieldName = 'DATA_ENTRADA'
      Origin = 'MAPA.DATA_ENTRADA'
      Size = 13
    end
    object IBQuery_MapaDATA_SAIDA: TIBStringField
      FieldName = 'DATA_SAIDA'
      Origin = 'MAPA.DATA_SAIDA'
      Size = 13
    end
  end
  object DSQ_Mapa: TDataSource
    DataSet = IBQuery_Mapa
    Left = 527
    Top = 6
  end
  object Table_Apto: TTable
    DatabaseName = 'hotel1'
    IndexFieldNames = 'PREDIO;APTO;CAMA'
    MasterFields = 'PREDIO;APTO;CAMA'
    MasterSource = DSQ_Mapa
    TableName = 'APTOCAMA'
    Left = 624
    Top = 16
    object Table_AptoPREDIO: TStringField
      FieldName = 'PREDIO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Table_AptoAPTO: TFloatField
      FieldName = 'APTO'
      Required = True
    end
    object Table_AptoCAMA: TFloatField
      FieldName = 'CAMA'
      Required = True
    end
    object Table_AptoAPTCODIGO: TStringField
      FieldName = 'APTCODIGO'
      FixedChar = True
      Size = 12
    end
    object Table_AptoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
  end
  object Table_Hospedagem: TTable
    DatabaseName = 'hotel1'
    IndexFieldNames = 'PREDIO;APTO;CAMA'
    MasterFields = 'PREDIO;APTO;CAMA'
    MasterSource = DST_Apto
    TableName = 'HOSPEDAGEM'
    Left = 712
    Top = 8
    object Table_HospedagemIDENTIDADE: TStringField
      FieldName = 'IDENTIDADE'
      Required = True
      FixedChar = True
      Size = 12
    end
    object Table_HospedagemFICHA: TStringField
      FieldName = 'FICHA'
      Required = True
      FixedChar = True
      Size = 6
    end
    object Table_HospedagemANO: TFloatField
      FieldName = 'ANO'
      Required = True
    end
    object Table_HospedagemPREDIO: TStringField
      FieldName = 'PREDIO'
      FixedChar = True
      Size = 1
    end
    object Table_HospedagemAPTO: TFloatField
      FieldName = 'APTO'
    end
    object Table_HospedagemCAMA: TFloatField
      FieldName = 'CAMA'
    end
    object Table_HospedagemDATAENTRADA: TStringField
      FieldName = 'DATAENTRADA'
      Size = 13
    end
    object Table_HospedagemHORAENTRADA: TStringField
      FieldName = 'HORAENTRADA'
      Size = 4
    end
    object Table_HospedagemDATASAIDA: TStringField
      FieldName = 'DATASAIDA'
      Size = 13
    end
    object Table_HospedagemDEPENDENTE: TFloatField
      FieldName = 'DEPENDENTE'
    end
    object Table_HospedagemSITUACAO_HOSPEDAGEM: TStringField
      FieldName = 'SITUACAO_HOSPEDAGEM'
      Size = 10
    end
    object Table_HospedagemRECEBE: TStringField
      FieldName = 'RECEBE'
      FixedChar = True
      Size = 1
    end
    object Table_HospedagemDESCONTO: TStringField
      FieldName = 'DESCONTO'
      FixedChar = True
      Size = 1
    end
  end
  object DST_Hospedagem: TDataSource
    DataSet = Table_Hospedagem
    Left = 746
    Top = 9
  end
  object Table_Reserva: TTable
    DatabaseName = 'hotel1'
    IndexFieldNames = 'PREDIO;APTO'
    MasterFields = 'PREDIO;APTO'
    MasterSource = DST_Apto
    TableName = 'RESERVA'
    Left = 800
    Top = 8
  end
  object DST_Reserva: TDataSource
    DataSet = Table_Reserva
    Left = 834
    Top = 9
  end
  object IBQuery_Executa: TIBQuery
    Database = DM.IBDatabase_HotelLocal
    Transaction = DM.IBTransaction_HotelLocal
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select Identidade, predio, apto, cama, ramal, nome, tipo, situac' +
        'ao, situacao_curso, data_entrada, Data_Saida '
      'from mapa'
      'Where Tipo <> 0 and tipo <> 3'
      '')
    Left = 408
    Top = 16
    object IBStringField1: TIBStringField
      FieldName = 'IDENTIDADE'
      Origin = 'MAPA.IDENTIDADE'
      Size = 12
    end
    object IBStringField2: TIBStringField
      FieldName = 'PREDIO'
      Origin = 'MAPA.PREDIO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IntegerField1: TIntegerField
      FieldName = 'APTO'
      Origin = 'MAPA.APTO'
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'CAMA'
      Origin = 'MAPA.CAMA'
      Required = True
    end
    object IBStringField3: TIBStringField
      FieldName = 'RAMAL'
      Origin = 'MAPA.RAMAL'
      Size = 11
    end
    object IBStringField4: TIBStringField
      FieldName = 'NOME'
      Origin = 'MAPA.NOME'
      Size = 40
    end
    object IBStringField5: TIBStringField
      FieldName = 'TIPO'
      Origin = 'MAPA.TIPO'
      FixedChar = True
      Size = 1
    end
    object IBStringField6: TIBStringField
      FieldName = 'SITUACAO'
      Origin = 'MAPA.SITUACAO'
      Size = 60
    end
    object IBStringField7: TIBStringField
      FieldName = 'SITUACAO_CURSO'
      Origin = 'MAPA.SITUACAO_CURSO'
      Size = 10
    end
    object IBStringField8: TIBStringField
      FieldName = 'DATA_ENTRADA'
      Origin = 'MAPA.DATA_ENTRADA'
      Size = 13
    end
    object IBStringField9: TIBStringField
      FieldName = 'DATA_SAIDA'
      Origin = 'MAPA.DATA_SAIDA'
      Size = 13
    end
  end
  object Table_Hospede: TTable
    DatabaseName = 'hotel1'
    IndexFieldNames = 'IDENTIDADE'
    MasterFields = 'IDENTIDADE'
    MasterSource = DST_Hospedagem
    TableName = 'HOSPEDE'
    Left = 712
    Top = 40
  end
  object IBTable_Mapa: TIBTable
    Database = DM.IBDatabase_HotelLocal
    Transaction = DM.IBTransaction_HotelLocal
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
      end
      item
        Name = 'MAPA_IDX1'
        Fields = 'PREDIO;APTO;CAMA'
      end>
    IndexFieldNames = 'PREDIO;APTO;CAMA'
    MasterFields = 'PREDIO;APTO;CAMA'
    MasterSource = DSQ_Mapa
    StoreDefs = True
    TableName = 'MAPA'
    Left = 496
    Top = 40
    object IBTable_MapaPREDIO: TIBStringField
      FieldName = 'PREDIO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object IBTable_MapaAPTO: TIntegerField
      FieldName = 'APTO'
      Required = True
    end
    object IBTable_MapaCAMA: TIntegerField
      FieldName = 'CAMA'
      Required = True
    end
    object IBTable_MapaCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 6
    end
    object IBTable_MapaRAMAL: TIBStringField
      FieldName = 'RAMAL'
      Size = 11
    end
    object IBTable_MapaTV1: TIBStringField
      FieldName = 'TV1'
      Size = 10
    end
    object IBTable_MapaTV2: TIBStringField
      FieldName = 'TV2'
      Size = 10
    end
    object IBTable_MapaTIPO: TIBStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object IBTable_MapaSITUACAO: TIBStringField
      FieldName = 'SITUACAO'
      Size = 60
    end
    object IBTable_MapaSITUACAO_CURSO: TIBStringField
      FieldName = 'SITUACAO_CURSO'
      Size = 10
    end
    object IBTable_MapaNOME: TIBStringField
      FieldName = 'NOME'
      Size = 40
    end
    object IBTable_MapaDATA_ENTRADA: TIBStringField
      FieldName = 'DATA_ENTRADA'
      Size = 13
    end
    object IBTable_MapaDATA_SAIDA: TIBStringField
      FieldName = 'DATA_SAIDA'
      Size = 13
    end
    object IBTable_MapaIDENTIDADE: TIBStringField
      FieldName = 'IDENTIDADE'
      Size = 12
    end
  end
  object TST_Mapa: TDataSource
    DataSet = IBTable_Mapa
    Left = 527
    Top = 38
  end
end
