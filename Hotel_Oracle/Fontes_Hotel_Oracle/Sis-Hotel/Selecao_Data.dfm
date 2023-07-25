object Form_Movimento: TForm_Movimento
  Left = 268
  Top = 133
  Width = 419
  Height = 380
  BorderIcons = []
  Caption = 'Movimento di'#225'rio do Hotel de Tr'#226'nsito'
  Color = 16766640
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
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
  TextHeight = 16
  object DBGrid_Responsaveis: TDBGrid
    Left = 0
    Top = 204
    Width = 403
    Height = 118
    Align = alClient
    DataSource = DST_Responsaveis
    Options = [dgTitles, dgRowSelect, dgAlwaysShowSelection]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'FUNCAO'
        Title.Alignment = taCenter
        Title.Caption = 'Fun'#231#227'o'
        Width = 210
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Alignment = taCenter
        Title.Caption = 'Nome'
        Width = 175
        Visible = True
      end>
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 322
    Width = 403
    Height = 19
    Color = 16766640
    Panels = <>
    SimplePanel = True
    SimpleText = 'Selecione as op'#231#245'es desejada.'
  end
  object RadioGroup_Relatorio: TRadioGroup
    Left = 0
    Top = 125
    Width = 403
    Height = 79
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
    Width = 403
    Height = 73
    Align = alTop
    Color = 16766640
    PopupMenu = PopupMenu1
    TabOrder = 3
    object Label_Inicio: TLabel
      Left = 16
      Top = 28
      Width = 77
      Height = 16
      Caption = 'Ficha Inicial.:'
    end
    object Label_Final: TLabel
      Left = 214
      Top = 28
      Width = 72
      Height = 16
      Caption = 'Ficha Final.:'
    end
    object JvDateEdit_Inicio: TJvDateEdit
      Left = 97
      Top = 21
      Width = 97
      Height = 22
      Hint = 'Realiza filtro pela data.'
      ButtonFlat = False
      CheckOnExit = True
      Ctl3D = False
      DialogTitle = 'Selecione a data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NumGlyphs = 2
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Weekends = [Sun, Sat]
      YearDigits = dyFour
      TabOrder = 0
    end
    object JvDateEdit_DataTermino: TJvDateEdit
      Left = 289
      Top = 21
      Width = 97
      Height = 22
      Hint = 'Realiza filtro pela data.'
      ButtonFlat = False
      CheckOnExit = True
      Ctl3D = False
      DialogTitle = 'Selecione a data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NumGlyphs = 2
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Weekends = [Sun, Sat]
      YearDigits = dyFour
      TabOrder = 1
    end
  end
  object ToolBar2: TToolBar
    Left = 0
    Top = 0
    Width = 403
    Height = 52
    ButtonHeight = 47
    ButtonWidth = 69
    Caption = 'f'
    EdgeBorders = [ebTop, ebBottom]
    Images = DM.ImageList_Principal
    Indent = 15
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 4
    Transparent = True
    object ToolButton_Imprimir: TToolButton
      Left = 15
      Top = 2
      Hint = 'Imprime o relat'#243'rio selecionado.'
      Caption = '&Imprimir'
      ImageIndex = 0
      OnClick = ToolButton_ImprimirClick
    end
    object ToolButton_Retornar: TToolButton
      Left = 84
      Top = 2
      Hint = 'Retorna para janela anterior.'
      Caption = '&Retornar'
      ImageIndex = 2
      OnClick = ToolButton_RetornarClick
    end
    object ToolButton_Windows: TToolButton
      Left = 153
      Top = 2
      Hint = 'Retorna para o Windows'
      Caption = '&Windows'
      ImageIndex = 3
      OnClick = ToolButton_WindowsClick
    end
    object ToolButton_Ajuda: TToolButton
      Left = 222
      Top = 2
      Caption = 'Ajuda'
      DropdownMenu = DM.PopupMenu_Ajuda
      ImageIndex = 4
      Style = tbsDropDown
    end
  end
  object DSQ_Hospedagem: TDataSource
    DataSet = Query_Hospedagem
    Left = 208
    Top = 160
  end
  object Table_Hospede: TTable
    DatabaseName = 'hotel1'
    IndexFieldNames = 'IDENTIDADE'
    MasterFields = 'IDENTIDADE'
    MasterSource = DSQ_Hospedagem
    TableName = 'HOSPEDE'
    Left = 240
    Top = 128
  end
  object Table_Hospede_Historico: TTable
    DatabaseName = 'hotel1'
    IndexFieldNames = 'IDENTIDADE'
    MasterFields = 'IDENTIDADE'
    MasterSource = DSQ_Hostorico
    TableName = 'HOSPEDE'
    Left = 32
    Top = 192
  end
  object DSQ_Hostorico: TDataSource
    DataSet = Query_Historico
    Left = 72
    Top = 192
  end
  object Table_Responsaveis: TTable
    DatabaseName = 'hotel1'
    TableName = 'RESPONSAVEL'
    Left = 296
    Top = 16
    object Table_ResponsaveisCODIGO: TFloatField
      FieldName = 'CODIGO'
      Required = True
    end
    object Table_ResponsaveisFUNCAO: TStringField
      FieldName = 'FUNCAO'
      Size = 40
    end
    object Table_ResponsaveisNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
  end
  object DST_Responsaveis: TDataSource
    DataSet = Table_Responsaveis
    Left = 336
    Top = 16
  end
  object Query_Hospedagem: TQuery
    DatabaseName = 'hotel1'
    SQL.Strings = (
      'Select * from hospedagem')
    Left = 208
    Top = 128
  end
  object Query_Historico: TQuery
    DatabaseName = 'hotel1'
    Filter = 'ncheque <> '#39#39
    Filtered = True
    SQL.Strings = (
      'Select * '
      'from historico '
      'where ano = 2007 and nrecibo is not NULL '
      'and  (nrecibo >= '#39'000010'#39' and nrecibo <= '#39'000300'#39') '
      'order by nrecibo')
    Left = 32
    Top = 160
    object Query_HistoricoIDENTIDADE: TStringField
      FieldName = 'IDENTIDADE'
      Origin = 'HOTEL1.HISTORICO.IDENTIDADE'
      FixedChar = True
      Size = 12
    end
    object Query_HistoricoFICHA: TStringField
      FieldName = 'FICHA'
      Origin = 'HOTEL1.HISTORICO.FICHA'
      Size = 6
    end
    object Query_HistoricoANO: TFloatField
      FieldName = 'ANO'
      Origin = 'HOTEL1.HISTORICO.ANO'
    end
    object Query_HistoricoPREDIO: TStringField
      FieldName = 'PREDIO'
      Origin = 'HOTEL1.HISTORICO.PREDIO'
      FixedChar = True
      Size = 1
    end
    object Query_HistoricoAPTO: TFloatField
      FieldName = 'APTO'
      Origin = 'HOTEL1.HISTORICO.APTO'
    end
    object Query_HistoricoDATAENTRADA: TStringField
      FieldName = 'DATAENTRADA'
      Origin = 'HOTEL1.HISTORICO.DATAENTRADA'
      Size = 8
    end
    object Query_HistoricoHORAENTRADA: TStringField
      FieldName = 'HORAENTRADA'
      Origin = 'HOTEL1.HISTORICO.HORAENTRADA'
      Size = 4
    end
    object Query_HistoricoDATASAIDA: TStringField
      FieldName = 'DATASAIDA'
      Origin = 'HOTEL1.HISTORICO.DATASAIDA'
      Size = 8
    end
    object Query_HistoricoDATAPAGAMENTO: TStringField
      FieldName = 'DATAPAGAMENTO'
      Origin = 'HOTEL1.HISTORICO.DATAPAGAMENTO'
      Size = 8
    end
    object Query_HistoricoNRECIBO: TStringField
      FieldName = 'NRECIBO'
      Origin = 'HOTEL1.HISTORICO.NRECIBO'
      Size = 6
    end
    object Query_HistoricoBANCO: TStringField
      FieldName = 'BANCO'
      Origin = 'HOTEL1.HISTORICO.BANCO'
      Size = 10
    end
    object Query_HistoricoNCHEQUE: TStringField
      FieldName = 'NCHEQUE'
      Origin = 'HOTEL1.HISTORICO.NCHEQUE'
      Size = 6
    end
    object Query_HistoricoPRACA: TStringField
      FieldName = 'PRACA'
      Origin = 'HOTEL1.HISTORICO.PRACA'
      Size = 16
    end
    object Query_HistoricoVALORPAGO: TFloatField
      FieldName = 'VALORPAGO'
      Origin = 'HOTEL1.HISTORICO.VALORPAGO'
      DisplayFormat = '######0.00'
    end
    object Query_HistoricoSITUACAO_CURSO: TStringField
      FieldName = 'SITUACAO_CURSO'
      Origin = 'HOTEL1.HISTORICO.SITUACAO_CURSO'
      Size = 10
    end
    object Query_HistoricoRECEBIDO: TStringField
      FieldName = 'RECEBIDO'
      Origin = 'HOTEL1.HISTORICO.RECEBIDO'
      FixedChar = True
      Size = 1
    end
  end
  object DSQ_Historico: TDataSource
    DataSet = Query_Historico
    Left = 72
    Top = 160
  end
  object PopupMenu1: TPopupMenu
    Images = DM.ImageList_Principal
    Left = 336
    Top = 96
    object ExcluiFichacadastradaerrada1: TMenuItem
      Caption = 'Exclui Ficha cadastrada errada'
      OnClick = ExcluiFichacadastradaerrada1Click
    end
  end
  object Table_RelMovimento: TTable
    DatabaseName = 'hotel1'
    TableName = 'REL_MOVIMENTO'
    Left = 264
    Top = 248
    object Table_RelMovimentoIDENTIDADE: TStringField
      FieldName = 'IDENTIDADE'
      FixedChar = True
      Size = 12
    end
    object Table_RelMovimentoFICHA: TStringField
      FieldName = 'FICHA'
      Size = 6
    end
    object Table_RelMovimentoANO: TFloatField
      FieldName = 'ANO'
    end
    object Table_RelMovimentoPREDIO: TStringField
      FieldName = 'PREDIO'
      FixedChar = True
      Size = 1
    end
    object Table_RelMovimentoAPTO: TFloatField
      FieldName = 'APTO'
    end
    object Table_RelMovimentoNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object Table_RelMovimentoPOSTO: TStringField
      FieldName = 'POSTO'
      Size = 30
    end
    object Table_RelMovimentoNRECIBO: TStringField
      FieldName = 'NRECIBO'
      Size = 6
    end
    object Table_RelMovimentoVALORPAGO: TFloatField
      FieldName = 'VALORPAGO'
    end
    object Table_RelMovimentoDATAPAGAMENTO: TStringField
      FieldName = 'DATAPAGAMENTO'
      Size = 11
    end
  end
  object Query_executa: TQuery
    DatabaseName = 'hotel1'
    SQL.Strings = (
      'Select * '
      'from historico '
      'where ano = 2007 and nrecibo is not NULL '
      'and  (nrecibo >= '#39'000010'#39' and nrecibo <= '#39'000300'#39') '
      'order by nrecibo')
    Left = 224
    Top = 248
  end
  object Query_PagParcelado: TQuery
    Active = True
    DatabaseName = 'hotel1'
    SQL.Strings = (
      
        'Select p.IDENTIDADE, p.FICHA, p.ANO, p.DATAPAGAMENTO, p.VALOR, p' +
        '.NRECIBO, H.Nome, h.POSTO '
      'From HOSPEDE h,  PagParcelado p'
      'Where p.Identidade = h.Identidade '
      'order by nrecibo')
    Left = 40
    Top = 240
    object Query_PagParceladoIDENTIDADE: TStringField
      FieldName = 'IDENTIDADE'
      Origin = 'HOTEL1.PAGPARCELADO.IDENTIDADE'
      FixedChar = True
      Size = 12
    end
    object Query_PagParceladoFICHA: TStringField
      FieldName = 'FICHA'
      Origin = 'HOTEL1.PAGPARCELADO.FICHA'
      Size = 6
    end
    object Query_PagParceladoANO: TFloatField
      FieldName = 'ANO'
      Origin = 'HOTEL1.PAGPARCELADO.ANO'
    end
    object Query_PagParceladoDATAPAGAMENTO: TStringField
      FieldName = 'DATAPAGAMENTO'
      Origin = 'HOTEL1.PAGPARCELADO.DATAPAGAMENTO'
      Size = 10
    end
    object Query_PagParceladoVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'HOTEL1.PAGPARCELADO.VALOR'
    end
    object Query_PagParceladoNRECIBO: TStringField
      FieldName = 'NRECIBO'
      Origin = 'HOTEL1.PAGPARCELADO.NRECIBO'
      Size = 6
    end
    object Query_PagParceladoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'HOTEL1.HOSPEDE.NOME'
      Size = 40
    end
    object Query_PagParceladoPOSTO: TStringField
      FieldName = 'POSTO'
      Origin = 'HOTEL1.HOSPEDE.POSTO'
      Size = 30
    end
  end
  object DSQ_PagParcelado: TDataSource
    DataSet = Query_PagParcelado
    Left = 72
    Top = 240
  end
  object Table_HospPagParcelado: TTable
    DatabaseName = 'hotel1'
    IndexFieldNames = 'IDENTIDADE;FICHA;ANO'
    MasterFields = 'IDENTIDADE;FICHA;ANO'
    MasterSource = DSQ_PagParcelado
    TableName = 'HOSPEDAGEM'
    Left = 40
    Top = 272
    object Table_HospPagParceladoIDENTIDADE: TStringField
      FieldName = 'IDENTIDADE'
      Required = True
      FixedChar = True
      Size = 12
    end
    object Table_HospPagParceladoFICHA: TStringField
      FieldName = 'FICHA'
      Required = True
      FixedChar = True
      Size = 6
    end
    object Table_HospPagParceladoANO: TFloatField
      FieldName = 'ANO'
      Required = True
    end
    object Table_HospPagParceladoPREDIO: TStringField
      FieldName = 'PREDIO'
      FixedChar = True
      Size = 1
    end
    object Table_HospPagParceladoAPTO: TFloatField
      FieldName = 'APTO'
    end
    object Table_HospPagParceladoCAMA: TFloatField
      FieldName = 'CAMA'
    end
    object Table_HospPagParceladoDATAENTRADA: TStringField
      FieldName = 'DATAENTRADA'
      Size = 13
    end
    object Table_HospPagParceladoHORAENTRADA: TStringField
      FieldName = 'HORAENTRADA'
      Size = 4
    end
    object Table_HospPagParceladoDATASAIDA: TStringField
      FieldName = 'DATASAIDA'
      Size = 13
    end
    object Table_HospPagParceladoDEPENDENTE: TFloatField
      FieldName = 'DEPENDENTE'
    end
    object Table_HospPagParceladoSITUACAO_HOSPEDAGEM: TStringField
      FieldName = 'SITUACAO_HOSPEDAGEM'
      Size = 10
    end
    object Table_HospPagParceladoRECEBE: TStringField
      FieldName = 'RECEBE'
      FixedChar = True
      Size = 1
    end
    object Table_HospPagParceladoDESCONTO: TStringField
      FieldName = 'DESCONTO'
      FixedChar = True
      Size = 1
    end
  end
end
