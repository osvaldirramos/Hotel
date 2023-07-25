object Form_AtividadeHotelaria: TForm_AtividadeHotelaria
  Left = 110
  Top = 173
  Width = 1246
  Height = 565
  Caption = 'Atividades da Hotelaria'
  Color = 16773089
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 20
  object Label_Inicio: TLabel
    Left = 16
    Top = 76
    Width = 91
    Height = 20
    Caption = 'Ficha Inicial.:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label_Final: TLabel
    Left = 17
    Top = 108
    Width = 85
    Height = 20
    Caption = 'Ficha Final.:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label_Oficiais_Generais: TLabel
    Left = 24
    Top = 157
    Width = 228
    Height = 20
    Caption = 'Oficiais Generais..........................:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label_Oficiais_Superiores: TLabel
    Left = 24
    Top = 179
    Width = 228
    Height = 20
    Caption = 'Oficiais Superiores.......................:'
  end
  object Label_Oficiais_Intermediarios: TLabel
    Left = 24
    Top = 201
    Width = 228
    Height = 20
    Caption = 'Oficiais Intermedi'#225'rios.................:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label_Oficiais_Subalternos_Aspirantes: TLabel
    Left = 24
    Top = 221
    Width = 229
    Height = 20
    Caption = 'Oficiais Subalternos/Aspirantes.:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label_SO_SGT: TLabel
    Left = 24
    Top = 240
    Width = 228
    Height = 20
    Caption = 'SO/SGT.........................................:'
  end
  object Label_CB_SD_TF: TLabel
    Left = 24
    Top = 262
    Width = 228
    Height = 20
    Caption = 'CB / SD / TF..................................:'
  end
  object Label_Civil: TLabel
    Left = 24
    Top = 284
    Width = 227
    Height = 20
    Caption = 'Civil.................................................:'
  end
  object Label_Valor_Oficiais_Generais: TLabel
    Left = 256
    Top = 157
    Width = 50
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0'
  end
  object Label_Valor_Oficiais_Superiores: TLabel
    Left = 257
    Top = 179
    Width = 50
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0'
  end
  object Label_Valor_Oficiais_Intermediarios: TLabel
    Left = 256
    Top = 201
    Width = 50
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0'
  end
  object Label_Valor_Oficiais_Subalternos_Aspirantes: TLabel
    Left = 257
    Top = 221
    Width = 50
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0'
  end
  object Label_Valor_SO_SGT: TLabel
    Left = 256
    Top = 240
    Width = 50
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0'
  end
  object Label_Valor_CB_SD_TF: TLabel
    Left = 257
    Top = 262
    Width = 50
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0'
  end
  object Label_Valor_Civil: TLabel
    Left = 257
    Top = 283
    Width = 50
    Height = 20
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0'
  end
  object Label_Arrecadacao: TLabel
    Left = 16
    Top = 324
    Width = 308
    Height = 20
    Caption = 'Arrecada'#231#227'o........................:         0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ToolBar2: TToolBar
    Left = 0
    Top = 0
    Width = 1238
    Height = 52
    ButtonHeight = 47
    ButtonWidth = 114
    Caption = 'f'
    EdgeBorders = [ebTop, ebBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Images = DM.ImageList_Principal
    Indent = 15
    ParentFont = False
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 0
    Transparent = True
    object ToolButton_Imprimir: TToolButton
      Left = 15
      Top = 2
      Hint = 'Calcula o tempo'
      Caption = 'Calcular (Sa'#237'da)'
      ImageIndex = 40
      OnClick = ToolButton_ImprimirClick
    end
    object ToolButton1: TToolButton
      Left = 129
      Top = 2
      Width = 12
      Caption = 'ToolButton1'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 141
      Top = 2
      Hint = 'Calcula o tempo'
      Caption = 'Calcular (Entrada)'
      ImageIndex = 40
      OnClick = ToolButton3Click
    end
    object ToolButton2: TToolButton
      Left = 255
      Top = 2
      Width = 7
      Caption = 'ToolButton2'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButton_Excel: TToolButton
      Left = 262
      Top = 2
      Hint = 'Gerar o arquivo em Excel'
      Caption = 'Excel'
      ImageIndex = 51
      OnClick = ToolButton_ExcelClick
    end
    object ToolButton4: TToolButton
      Left = 376
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton_Retornar: TToolButton
      Left = 384
      Top = 2
      Hint = 'Retorna para janela anterior.'
      Caption = '&Retornar'
      ImageIndex = 2
      OnClick = ToolButton_RetornarClick
    end
    object ToolButton_Windows: TToolButton
      Left = 498
      Top = 2
      Hint = 'Retorna para o Windows'
      Caption = '&Windows'
      ImageIndex = 3
      OnClick = ToolButton_WindowsClick
    end
    object ToolButton5: TToolButton
      Left = 612
      Top = 2
      Caption = 'ToolButton5'
      ImageIndex = 4
      OnClick = ToolButton5Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 336
    Top = 52
    Width = 902
    Height = 482
    Align = alRight
    Color = 15658734
    DataSource = DSQ_Historico
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object JvDateEdit_Inicio: TJvDateEdit
    Left = 110
    Top = 74
    Width = 97
    Height = 22
    Hint = 'Realiza filtro pela data.'
    ButtonFlat = False
    CheckOnExit = True
    Color = 14276864
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
    TabOrder = 2
  end
  object JvDateEdit_DataTermino: TJvDateEdit
    Left = 108
    Top = 106
    Width = 97
    Height = 22
    Hint = 'Realiza calculo pela data.'
    ButtonFlat = False
    CheckOnExit = True
    Color = 14276864
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
    TabOrder = 3
  end
  object Query_Atividades: TQuery
    DatabaseName = 'hotel1'
    SQL.Strings = (
      'Select ho.posto, 1 as Tempo, hi.datasaida '
      'From historico hi, hospede ho'
      'where hi.identidade = ho.identidade'
      'and   hi.ano = 2018'
      'order by ho.posto')
    Left = 240
    Top = 8
  end
  object DSQ_Historico: TDataSource
    DataSet = Query_Atividades
    Left = 280
    Top = 8
  end
  object Query_Historico: TQuery
    DatabaseName = 'hotel1'
    SQL.Strings = (
      'Select ho.posto, 1 as Tempo, hi.datasaida '
      'From historico hi, hospede ho'
      'where hi.identidade = ho.identidade'
      'and   hi.ano = 2018'
      'order by ho.posto')
    Left = 272
    Top = 64
  end
end
