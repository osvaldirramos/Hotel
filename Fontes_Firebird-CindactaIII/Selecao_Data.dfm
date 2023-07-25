object Form_Movimento: TForm_Movimento
  Left = 289
  Top = 114
  Width = 490
  Height = 461
  BorderIcons = []
  Caption = 'Movimento di'#225'rio do Hotel de Tr'#226'nsito'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
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
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid_Responsaveis: TDBGrid
    Left = 0
    Top = 183
    Width = 482
    Height = 225
    Align = alClient
    DataSource = DST_Responsaveis
    Options = [dgTitles, dgColLines, dgRowSelect, dgAlwaysShowSelection]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'FUNCAO'
        Title.Alignment = taCenter
        Title.Caption = 'Fun'#231#227'o'
        Width = 253
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Alignment = taCenter
        Title.Caption = 'Nome'
        Width = 201
        Visible = True
      end>
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 408
    Width = 482
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'Selecione as op'#231#245'es desejada.'
  end
  object RadioGroup_Relatorio: TRadioGroup
    Left = 0
    Top = 103
    Width = 482
    Height = 80
    Align = alTop
    Caption = ' Relat'#243'rio di'#225'rio de movimento do hotel de transto '
    ItemIndex = 0
    Items.Strings = (
      'Relat'#243'rio de Entrada'
      'Relat'#243'rio de Sa'#237'da'
      'Fechamento (Rela'#231#227'o de Cheque)')
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 52
    Width = 482
    Height = 51
    Align = alTop
    TabOrder = 3
    object Label_Relatorio: TLabel
      Left = 8
      Top = 20
      Width = 74
      Height = 13
      Caption = 'Data Relat'#243'rio.:'
    end
    object DateTimePicker_Data: TDateTimePicker
      Left = 95
      Top = 11
      Width = 105
      Height = 21
      Date = 37960.388117719900000000
      Time = 37960.388117719900000000
      TabOrder = 0
    end
  end
  object ToolBar2: TToolBar
    Left = 0
    Top = 0
    Width = 482
    Height = 52
    ButtonHeight = 44
    ButtonWidth = 57
    Caption = 'f'
    EdgeBorders = [ebTop, ebBottom]
    Flat = True
    Images = DM.ImageList_Principal
    Indent = 15
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 4
    Transparent = True
    object ToolButton_Imprimir: TToolButton
      Left = 15
      Top = 0
      Hint = 'Imprime o relat'#243'rio selecionado.'
      Caption = '&Imprimir'
      ImageIndex = 0
      OnClick = ToolButton_ImprimirClick
    end
    object ToolButton_Retornar: TToolButton
      Left = 72
      Top = 0
      Hint = 'Retorna para janela anterior.'
      Caption = '&Retornar'
      ImageIndex = 2
      OnClick = ToolButton_RetornarClick
    end
    object ToolButton_Windows: TToolButton
      Left = 129
      Top = 0
      Hint = 'Retorna para o Windows'
      Caption = '&Windows'
      ImageIndex = 3
      OnClick = ToolButton_WindowsClick
    end
    object ToolButton_Ajuda: TToolButton
      Left = 186
      Top = 0
      Caption = 'Ajuda'
      DropdownMenu = DM.PopupMenu_Ajuda
      ImageIndex = 4
      Style = tbsDropDown
    end
  end
  object DST_Responsaveis: TDataSource
    DataSet = IBTable_Responsaveis
    Left = 336
    Top = 8
  end
  object DSQ_Historico: TDataSource
    DataSet = IBQuery_Historico
    Left = 72
    Top = 160
  end
  object IBTable_Hospede_Historico: TIBTable
    Database = DM.IBDatabase_Hotel
    Transaction = DM.IBTransaction_Hotel
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
        Name = 'NOME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NOME_GUERRA'
        Attributes = [faRequired]
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
        Attributes = [faRequired]
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
        Attributes = [faFixed]
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
        Name = 'HOSPEDE_ID_PK'
        Fields = 'IDENTIDADE'
        Options = [ixUnique]
      end
      item
        Name = 'FK_HOSPEDE'
        Fields = 'POSTO'
      end>
    IndexFieldNames = 'IDENTIDADE'
    MasterFields = 'IDENTIDADE'
    MasterSource = DSQ_Historico
    StoreDefs = True
    TableName = 'HOSPEDE'
    Left = 32
    Top = 208
  end
  object IBQuery_Historico: TIBQuery
    Database = DM.IBDatabase_Hotel
    Transaction = DM.IBTransaction_Hotel
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * '
      'from historico '
      'order by nrecibo')
    Left = 32
    Top = 160
    object IBQuery_HistoricoIDENTIDADE: TIBStringField
      FieldName = 'IDENTIDADE'
      Origin = 'HISTORICO.IDENTIDADE'
      Required = True
      FixedChar = True
      Size = 12
    end
    object IBQuery_HistoricoFICHA: TIBStringField
      FieldName = 'FICHA'
      Origin = 'HISTORICO.FICHA'
      Required = True
      Size = 6
    end
    object IBQuery_HistoricoANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'HISTORICO.ANO'
      Required = True
    end
    object IBQuery_HistoricoPREDIO: TIBStringField
      FieldName = 'PREDIO'
      Origin = 'HISTORICO.PREDIO'
      FixedChar = True
      Size = 1
    end
    object IBQuery_HistoricoAPTO: TSmallintField
      FieldName = 'APTO'
      Origin = 'HISTORICO.APTO'
    end
    object IBQuery_HistoricoDATAENTRADA: TDateTimeField
      FieldName = 'DATAENTRADA'
      Origin = 'HISTORICO.DATAENTRADA'
    end
    object IBQuery_HistoricoHORAENTRADA: TIBStringField
      FieldName = 'HORAENTRADA'
      Origin = 'HISTORICO.HORAENTRADA'
      Size = 4
    end
    object IBQuery_HistoricoDATASAIDA: TDateTimeField
      FieldName = 'DATASAIDA'
      Origin = 'HISTORICO.DATASAIDA'
    end
    object IBQuery_HistoricoDATAPAGAMENTO: TDateTimeField
      FieldName = 'DATAPAGAMENTO'
      Origin = 'HISTORICO.DATAPAGAMENTO'
    end
    object IBQuery_HistoricoNRECIBO: TIBStringField
      FieldName = 'NRECIBO'
      Origin = 'HISTORICO.NRECIBO'
      Size = 6
    end
    object IBQuery_HistoricoBANCO: TIBStringField
      FieldName = 'BANCO'
      Origin = 'HISTORICO.BANCO'
      Size = 10
    end
    object IBQuery_HistoricoNCHEQUE: TIBStringField
      FieldName = 'NCHEQUE'
      Origin = 'HISTORICO.NCHEQUE'
      Size = 6
    end
    object IBQuery_HistoricoPRACA: TIBStringField
      FieldName = 'PRACA'
      Origin = 'HISTORICO.PRACA'
      Size = 16
    end
    object IBQuery_HistoricoVALORPAGO: TIBBCDField
      FieldName = 'VALORPAGO'
      Origin = 'HISTORICO.VALORPAGO'
      DisplayFormat = '0.00'
      Precision = 9
      Size = 2
    end
    object IBQuery_HistoricoCUSTO_TELEFONE: TIBBCDField
      FieldName = 'CUSTO_TELEFONE'
      Origin = 'HISTORICO.CUSTO_TELEFONE'
      Precision = 9
      Size = 2
    end
    object IBQuery_HistoricoUSUARIO_ENTRADA: TIBStringField
      FieldName = 'USUARIO_ENTRADA'
      Origin = 'HISTORICO.USUARIO_ENTRADA'
      Size = 10
    end
    object IBQuery_HistoricoSITUACAO_CURSO: TIBStringField
      FieldName = 'SITUACAO_CURSO'
      Origin = 'HISTORICO.SITUACAO_CURSO'
      Size = 10
    end
    object IBQuery_HistoricoUSUARIO_SAIDA: TIBStringField
      FieldName = 'USUARIO_SAIDA'
      Origin = 'HISTORICO.USUARIO_SAIDA'
      Size = 10
    end
    object IBQuery_HistoricoTIPO_FECHAMENTO: TIBStringField
      FieldName = 'TIPO_FECHAMENTO'
      Origin = 'HISTORICO.TIPO_FECHAMENTO'
      FixedChar = True
      Size = 1
    end
    object IBQuery_HistoricoRECEBIDO: TIBStringField
      FieldName = 'RECEBIDO'
      Origin = 'HISTORICO.RECEBIDO'
      FixedChar = True
      Size = 1
    end
    object IBQuery_HistoricoHORA_OPERACAO: TIBStringField
      FieldName = 'HORA_OPERACAO'
      Origin = 'HISTORICO.HORA_OPERACAO'
      Size = 5
    end
    object IBQuery_HistoricoDATA_OPERACAO: TDateTimeField
      FieldName = 'DATA_OPERACAO'
      Origin = 'HISTORICO.DATA_OPERACAO'
    end
  end
  object IBTable_Responsaveis: TIBTable
    Database = DM.IBDatabase_Hotel
    Transaction = DM.IBTransaction_Hotel
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'NOME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'FUNCAO'
        DataType = ftString
        Size = 40
      end>
    IndexDefs = <
      item
        Name = 'RESPONSAVEL_ID_PK'
        Fields = 'CODIGO'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'RESPONSAVEL'
    Left = 304
    Top = 8
    object IBTable_ResponsaveisCODIGO: TSmallintField
      FieldName = 'CODIGO'
    end
    object IBTable_ResponsaveisNOME: TIBStringField
      FieldName = 'NOME'
      Size = 40
    end
    object IBTable_ResponsaveisFUNCAO: TIBStringField
      FieldName = 'FUNCAO'
      Size = 40
    end
  end
end
