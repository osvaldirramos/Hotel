object Form_RelacaoExcel: TForm_RelacaoExcel
  Left = 268
  Top = 133
  Width = 746
  Height = 569
  BorderIcons = []
  Caption = 'Rela'#231#227'o de entradad e Saidas'
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
  object StatusBar: TStatusBar
    Left = 0
    Top = 512
    Width = 730
    Height = 19
    Color = 16766640
    Panels = <>
    SimplePanel = True
    SimpleText = 'Selecione as op'#231#245'es desejada.'
  end
  object ToolBar2: TToolBar
    Left = 0
    Top = 0
    Width = 730
    Height = 52
    ButtonHeight = 47
    ButtonWidth = 115
    Caption = 'f'
    EdgeBorders = [ebTop, ebBottom]
    Images = DM.ImageList_Principal
    Indent = 15
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 1
    Transparent = True
    object ToolButton_RelacaoExcel: TToolButton
      Left = 15
      Top = 2
      Caption = 'Rela'#231#227'o Em Excel'
      ImageIndex = 51
      OnClick = ToolButton_RelacaoExcelClick
    end
    object ToolButton_Retornar: TToolButton
      Left = 130
      Top = 2
      Hint = 'Retorna para janela anterior.'
      Caption = '&Retornar'
      ImageIndex = 2
      OnClick = ToolButton_RetornarClick
    end
    object ToolButton_Windows: TToolButton
      Left = 245
      Top = 2
      Hint = 'Retorna para o Windows'
      Caption = '&Windows'
      ImageIndex = 3
      OnClick = ToolButton_WindowsClick
    end
  end
  object DBGrid_Turma: TDBGrid
    Left = 0
    Top = 80
    Width = 730
    Height = 432
    Align = alClient
    Color = 16444382
    DataSource = DSQ_Historico
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clTeal
    TitleFont.Height = -13
    TitleFont.Name = 'Times New Roman'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PREDIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'PR'#201'DIO'
        Title.Color = 16311249
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'APTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Color = 16311249
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Width = 51
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FICHA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Color = 16311249
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Color = 16311249
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Width = 332
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATAENTRADA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'DATA ENTRADA'
        Title.Color = 16311249
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATASAIDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'DATA SA'#205'DA'
        Title.Color = 16311249
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Width = 103
        Visible = True
      end>
  end
  object ToolBar_PesquisarTurmaAndamento: TToolBar
    Left = 0
    Top = 52
    Width = 730
    Height = 28
    ButtonHeight = 20
    Caption = 'ToolBar_Selecao'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object ToolButton5: TToolButton
      Left = 0
      Top = 2
      Width = 30
      Caption = 'ToolButton5'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object Label_Inicio: TLabel
      Left = 30
      Top = 2
      Width = 102
      Height = 20
      Caption = 'Data Inicial.:'
    end
    object JvDateEdit_Inicio: TJvDateEdit
      Left = 132
      Top = 2
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
    object ToolButton4: TToolButton
      Left = 229
      Top = 2
      Width = 53
      Caption = 'ToolButton4'
      Style = tbsSeparator
    end
    object Label_Final: TLabel
      Left = 282
      Top = 2
      Width = 94
      Height = 20
      Caption = 'Data Final.:'
    end
    object JvDateEdit_DataTermino: TJvDateEdit
      Left = 376
      Top = 2
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
  object Query_Historico: TQuery
    DatabaseName = 'hotel1'
    SQL.Strings = (
      'Select * '
      'from historico '
      'where ano = 2007 and nrecibo is not NULL '
      'and  (nrecibo >= '#39'000010'#39' and nrecibo <= '#39'000300'#39') '
      'order by nrecibo')
    Left = 416
    Top = 80
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
  end
  object DSQ_Historico: TDataSource
    DataSet = Query_Historico
    Left = 456
    Top = 80
  end
  object Table_Hospede_Historico: TTable
    DatabaseName = 'hotel1'
    IndexFieldNames = 'IDENTIDADE'
    MasterFields = 'IDENTIDADE'
    MasterSource = DSQ_Hostorico
    TableName = 'HOSPEDE'
    Left = 408
    Top = 120
  end
  object DSQ_Hostorico: TDataSource
    DataSet = Query_Historico
    Left = 448
    Top = 120
  end
end
