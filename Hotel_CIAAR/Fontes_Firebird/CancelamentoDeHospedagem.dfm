object Form_CancelamentoDeHospedagem: TForm_CancelamentoDeHospedagem
  Left = 136
  Top = 157
  Width = 849
  Height = 515
  BorderIcons = []
  Caption = 'Sis-Hotel --> Cancelamento de Hospedagem'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000008
    8888888BBB37777BBB8888888800000888888BBB6666666667BB888888000008
    8888BB76666666666663B88888000008888BB6666666666666667B8888000008
    88BB666666666666666667B88800000888B6666666666666666666BB88000008
    8B767777777777777777766B88000008BB6666788877777888776663B8000008
    B76666677777777777666666B8000008B66666447777777774466666B800000B
    3666644447777777444466663B00000B7666444444777774444446667B00000B
    7666444444483F44444446667B00000B7666444457774545544446667B00000B
    7666778487757477748846667B00000B7666778447848487748756667B00000B
    7666544444777778454776667B00000B7666554457547774444446667B00000B
    7666454444488744444446667B00000B7666644444447444444466667B00000B
    7666644444475544444466667B00000B7666664444478744444666667B00000B
    7666666444488844446666667B00000B7666666664477744666666667B00000B
    7666666666666666666666667B00000BB33333333333333333333333BB00000B
    7447444444444444444444447B00000B745B444447757777748777447B00000B
    7777B74444444444444444447B00000B3B777B5787777758577778777B00000B
    7444447444444444444444447B00000BBBBBBBBBBBBBBBBBBBBBBBBBBB00E000
    0003E0000003E0000003E0000003E0000003E0000003E0000003E0000003E000
    0003E0000003E0000003E0000003E0000003E0000003E0000003E0000003E000
    0003E0000003E0000003E0000003E0000003E0000003E0000003E0000003E000
    0003E0000003E0000003E0000003E0000003E0000003E0000003E0000003}
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 120
  TextHeight = 16
  object GroupBox1: TGroupBox
    Left = 1
    Top = 17
    Width = 472
    Height = 136
    Caption = '< Cancelamento da Hospedagem >'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 72
      Width = 71
      Height = 16
      Caption = 'Data Sa'#237'da:'
    end
    object Label2: TLabel
      Left = 16
      Top = 104
      Width = 78
      Height = 16
      Caption = 'Observa'#231#227'o:'
    end
    object DBText_Nome: TDBText
      Left = 16
      Top = 24
      Width = 433
      Height = 17
      DataField = 'NOME'
      DataSource = DST_Hospede
    end
    object MaskEdit_Observacao: TMaskEdit
      Left = 98
      Top = 98
      Width = 365
      Height = 24
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object DateTimePicker_Data_Saida: TDateTimePicker
      Left = 94
      Top = 65
      Width = 120
      Height = 24
      Date = 37697.385277800920000000
      Time = 37697.385277800920000000
      TabOrder = 1
    end
  end
  object ToolBar4: TToolBar
    Left = 488
    Top = 40
    Width = 193
    Height = 73
    Align = alNone
    BorderWidth = 1
    ButtonHeight = 30
    ButtonWidth = 185
    Caption = 'ToolBar1'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Images = DM.ImageList_Principal
    List = True
    ParentFont = False
    ShowCaptions = True
    TabOrder = 1
    object ToolButton_Excluir: TToolButton
      Left = 0
      Top = 2
      Hint = 'Cancela a Hospedagem selecionada.'
      Caption = '&Cancelar Hospedagem'
      ImageIndex = 23
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = ToolButton_ExcluirClick
    end
    object ToolButton_Retornar: TToolButton
      Left = 0
      Top = 32
      Caption = '               &Retornar'
      ImageIndex = 2
      OnClick = ToolButton_RetornarClick
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 463
    Width = 841
    Height = 20
    Panels = <>
    SimplePanel = True
    SimpleText = 'Entre com o motivo do cancelamento da hospedagem.'
  end
  object IBTable_Exclui_Hospede: TIBTable
    Database = DM.IBDatabase_Hotel
    Transaction = DM.IBTransaction_Hotel
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'IDENTIDADE'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'FICHA'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'ANO'
        DataType = ftSmallint
      end
      item
        Name = 'PREDIO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'APTO'
        DataType = ftSmallint
      end
      item
        Name = 'CAMA'
        DataType = ftSmallint
      end
      item
        Name = 'DATAENTRADA'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'HORAENTRADA'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'DATASAIDA'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'DEPENDENTE'
        DataType = ftSmallint
      end
      item
        Name = 'SITUACAO_HOSPEDAGEM'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RECEBE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DESCONTO'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'HOSPEDAGEM_ID_PK'
        Fields = 'IDENTIDADE;FICHA;ANO'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'IDENTIDADE;PREDIO;APTO;CAMA;DATAENTRADA;DATASAIDA'
    MasterFields = 'IDENTIDADE;PREDIO;APTO;CAMA;DATA_ENTRADA;DATA_SAIDA'
    MasterSource = Form_MenuRecepcao.DSQ_Busca
    StoreDefs = True
    TableName = 'HOSPEDAGEM'
    Left = 344
    Top = 8
    object IBTable_Exclui_HospedeIDENTIDADE: TIBStringField
      FieldName = 'IDENTIDADE'
      Size = 12
    end
    object IBTable_Exclui_HospedeFICHA: TIBStringField
      FieldName = 'FICHA'
      Size = 6
    end
    object IBTable_Exclui_HospedeANO: TSmallintField
      FieldName = 'ANO'
    end
    object IBTable_Exclui_HospedePREDIO: TIBStringField
      FieldName = 'PREDIO'
      Size = 1
    end
    object IBTable_Exclui_HospedeAPTO: TSmallintField
      FieldName = 'APTO'
    end
    object IBTable_Exclui_HospedeCAMA: TSmallintField
      FieldName = 'CAMA'
    end
    object IBTable_Exclui_HospedeDATAENTRADA: TIBStringField
      FieldName = 'DATAENTRADA'
      Size = 13
    end
    object IBTable_Exclui_HospedeHORAENTRADA: TIBStringField
      FieldName = 'HORAENTRADA'
      Size = 4
    end
    object IBTable_Exclui_HospedeDATASAIDA: TIBStringField
      FieldName = 'DATASAIDA'
      Size = 13
    end
    object IBTable_Exclui_HospedeDEPENDENTE: TSmallintField
      FieldName = 'DEPENDENTE'
    end
    object IBTable_Exclui_HospedeSITUACAO_HOSPEDAGEM: TIBStringField
      FieldName = 'SITUACAO_HOSPEDAGEM'
      Size = 10
    end
    object IBTable_Exclui_HospedeRECEBE: TIBStringField
      FieldName = 'RECEBE'
      Size = 1
    end
    object IBTable_Exclui_HospedeDESCONTO: TIBStringField
      FieldName = 'DESCONTO'
      Size = 1
    end
  end
  object DST_Exclui_Hospede: TDataSource
    DataSet = IBTable_Exclui_Hospede
    Left = 384
    Top = 9
  end
  object IBTable_Historico: TIBTable
    Database = DM.IBDatabase_Hotel
    Transaction = DM.IBTransaction_Hotel
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'IDENTIDADE'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 12
      end
      item
        Name = 'FICHA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 6
      end
      item
        Name = 'ANO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'PREDIO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'APTO'
        DataType = ftSmallint
      end
      item
        Name = 'DATAENTRADA'
        DataType = ftDateTime
      end
      item
        Name = 'HORAENTRADA'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'DATASAIDA'
        DataType = ftDateTime
      end
      item
        Name = 'DATAPAGAMENTO'
        DataType = ftDateTime
      end
      item
        Name = 'NRECIBO'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'BANCO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NCHEQUE'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'PRACA'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'VALORPAGO'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'CUSTO_TELEFONE'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'USUARIO_ENTRADA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SITUACAO_CURSO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'USUARIO_SAIDA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TIPO_FECHAMENTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'RECEBIDO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'OBS'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'HORA_OPERACAO'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'DATA_OPERACAO'
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'HISTORICO_ID_PK'
        Fields = 'IDENTIDADE;FICHA;ANO'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'IDENTIDADE;PREDIO;APTO;DATAENTRADA;DATASAIDA'
    MasterFields = 'IDENTIDADE;PREDIO;APTO;DATA_ENTRADA;DATA_SAIDA'
    MasterSource = Form_MenuRecepcao.DSQ_Busca
    StoreDefs = True
    TableName = 'HISTORICO'
    Left = 344
    Top = 48
    object IBTable_HistoricoIDENTIDADE: TIBStringField
      FieldName = 'IDENTIDADE'
      Size = 12
    end
    object IBTable_HistoricoFICHA: TIBStringField
      FieldName = 'FICHA'
      Size = 6
    end
    object IBTable_HistoricoANO: TSmallintField
      FieldName = 'ANO'
    end
    object IBTable_HistoricoPREDIO: TIBStringField
      FieldName = 'PREDIO'
      Size = 1
    end
    object IBTable_HistoricoAPTO: TSmallintField
      FieldName = 'APTO'
    end
    object IBTable_HistoricoHORAENTRADA: TIBStringField
      FieldName = 'HORAENTRADA'
      Size = 4
    end
    object IBTable_HistoricoUSUARIO_ENTRADA: TIBStringField
      FieldName = 'USUARIO_ENTRADA'
      Size = 10
    end
    object IBTable_HistoricoSITUACAO_CURSO: TIBStringField
      FieldName = 'SITUACAO_CURSO'
      Size = 10
    end
    object IBTable_HistoricoUSUARIO_SAIDA: TIBStringField
      FieldName = 'USUARIO_SAIDA'
      Size = 10
    end
    object IBTable_HistoricoTIPO_FECHAMENTO: TIBStringField
      FieldName = 'TIPO_FECHAMENTO'
      Size = 1
    end
    object IBTable_HistoricoRECEBIDO: TIBStringField
      FieldName = 'RECEBIDO'
      Size = 1
    end
    object IBTable_HistoricoOBS: TIBStringField
      FieldName = 'OBS'
      Size = 150
    end
    object IBTable_HistoricoHORA_OPERACAO: TIBStringField
      FieldName = 'HORA_OPERACAO'
      Size = 5
    end
    object IBTable_HistoricoDATA_OPERACAO: TDateTimeField
      FieldName = 'DATA_OPERACAO'
    end
    object IBTable_HistoricoDATAENTRADA: TDateTimeField
      FieldName = 'DATAENTRADA'
    end
    object IBTable_HistoricoDATASAIDA: TDateTimeField
      FieldName = 'DATASAIDA'
    end
    object IBTable_HistoricoDATAPAGAMENTO: TDateTimeField
      FieldName = 'DATAPAGAMENTO'
    end
  end
  object DST_Historico: TDataSource
    DataSet = IBTable_Historico
    Left = 384
    Top = 49
  end
  object IBTable_Apto: TIBTable
    Database = DM.IBDatabase_Hotel
    Transaction = DM.IBTransaction_Hotel
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
        DataType = ftSmallint
      end
      item
        Name = 'CAMA'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'APTCODIGO'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'APTOCAMA_ID_PK'
        Fields = 'PREDIO;APTO;CAMA'
        Options = [ixUnique]
      end
      item
        Name = 'APTO_APTOCAMA_FK'
        Fields = 'PREDIO;APTO'
      end>
    IndexFieldNames = 'PREDIO;APTO;CAMA'
    MasterFields = 'PREDIO;APTO;CAMA'
    MasterSource = DST_Exclui_Hospede
    StoreDefs = True
    TableName = 'APTOCAMA'
    Left = 344
    Top = 80
    object IBTable_AptoPREDIO: TIBStringField
      FieldName = 'PREDIO'
      Size = 1
    end
    object IBTable_AptoAPTO: TSmallintField
      FieldName = 'APTO'
    end
    object IBTable_AptoCAMA: TSmallintField
      FieldName = 'CAMA'
    end
    object IBTable_AptoAPTCODIGO: TIBStringField
      FieldName = 'APTCODIGO'
      Size = 12
    end
  end
  object DST_Apto: TDataSource
    DataSet = IBTable_Apto
    Left = 384
    Top = 81
  end
  object IBTable_Exclui_Dependente: TIBTable
    Database = DM.IBDatabase_Hotel
    Transaction = DM.IBTransaction_Hotel
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'PREDIO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'APTO'
        DataType = ftSmallint
      end
      item
        Name = 'CAMA'
        DataType = ftSmallint
      end
      item
        Name = 'APTCODIGO'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'APTOCAMA_ID_PK'
        Fields = 'PREDIO;APTO;CAMA'
        Options = [ixUnique]
      end
      item
        Name = 'APTO_APTOCAMA_FK'
        Fields = 'PREDIO;APTO'
      end>
    IndexFieldNames = 'PREDIO;APTO'
    MasterFields = 'PREDIO;APTO'
    MasterSource = DST_Exclui_Hospede
    StoreDefs = True
    TableName = 'APTOCAMA'
    Left = 344
    Top = 120
    object IBTable_Exclui_DependentePREDIO: TIBStringField
      FieldName = 'PREDIO'
      Size = 1
    end
    object IBTable_Exclui_DependenteAPTO: TSmallintField
      FieldName = 'APTO'
    end
    object IBTable_Exclui_DependenteCAMA: TSmallintField
      FieldName = 'CAMA'
    end
    object IBTable_Exclui_DependenteAPTCODIGO: TIBStringField
      FieldName = 'APTCODIGO'
      Size = 12
    end
    object IBTable_Exclui_DependenteNOME: TIBStringField
      FieldName = 'NOME'
      Size = 30
    end
  end
  object DST_Exclui_Dependente: TDataSource
    DataSet = IBTable_Exclui_Dependente
    Left = 384
    Top = 113
  end
  object IBQuery_Exclui_Ficha: TIBQuery
    Database = DM.IBDatabase_Hotel
    Transaction = DM.IBTransaction_Hotel
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from Tabela_Preco '
      ' Where Predio = '#39'A'#39
      'and Codigo = '#39'01'#39)
    Left = 336
    Top = 158
  end
  object IBTable_Hospede: TIBTable
    Database = DM.IBDatabase_Hotel
    Transaction = DM.IBTransaction_Hotel
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'IDENTIDADE'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NOME_GUERRA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'POSTO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DEPENDENTE_DE'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NACIONALIDADE'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'TELEFONE_RESIDENCIAL'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TELEFONE_FUNCIONAL'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SITUACAO_CURSO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RESIDENCIA'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NUMERO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ESTADO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'OM_ORIGEM'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'OBS'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'HISTORICO_ID_PK'
        Fields = 'IDENTIDADE;FICHA;ANO'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'IDENTIDADE'
    MasterFields = 'IDENTIDADE'
    MasterSource = DST_Historico
    StoreDefs = True
    TableName = 'HOSPEDE'
    Left = 440
    Top = 48
    object IBTable_HospedeIDENTIDADE: TIBStringField
      FieldName = 'IDENTIDADE'
      Size = 12
    end
    object IBTable_HospedeNOME: TIBStringField
      FieldName = 'NOME'
      Size = 40
    end
  end
  object DST_Hospede: TDataSource
    DataSet = IBTable_Hospede
    Left = 480
    Top = 49
  end
end
