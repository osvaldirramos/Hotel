object Form_Estatistica_Hospedagem: TForm_Estatistica_Hospedagem
  Left = 170
  Top = 169
  Width = 1382
  Height = 1080
  Caption = 'Estat'#237'stica Hospedagem'
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
  object Memo2: TMemo
    Left = 0
    Top = 284
    Width = 1374
    Height = 765
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    TabOrder = 0
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1374
    Height = 36
    ButtonHeight = 30
    ButtonWidth = 31
    Caption = 'ToolBar_Selecao'
    Color = 30186
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Images = DM.ImageList_Principal
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object ToolButton7: TToolButton
      Left = 0
      Top = 2
      Width = 30
      Caption = 'ToolButton5'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object Label26: TLabel
      Left = 30
      Top = 2
      Width = 102
      Height = 30
      Caption = 'Data Inicial.:'
    end
    object JvDateEdit_Inicio: TJvDateEdit
      Left = 132
      Top = 6
      Width = 97
      Height = 22
      Hint = 'Realiza filtro pela data Inicial'
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
      OnClick = JvDateEdit_InicioClick
    end
    object ToolButton8: TToolButton
      Left = 229
      Top = 2
      Width = 53
      Caption = 'ToolButton4'
      Style = tbsSeparator
    end
    object Label29: TLabel
      Left = 282
      Top = 2
      Width = 94
      Height = 30
      Caption = 'Data Final.:'
    end
    object JvDateEdit_DataTermino: TJvDateEdit
      Left = 376
      Top = 6
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
      OnClick = JvDateEdit_DataTerminoClick
    end
    object ToolButton6: TToolButton
      Left = 473
      Top = 2
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object ToolButton_Atividades: TToolButton
      Left = 481
      Top = 2
      Hint = 'Monta a estatistica'
      ImageIndex = 9
      OnClick = ToolButton_AtividadesClick
    end
    object ToolButton14: TToolButton
      Left = 512
      Top = 2
      Width = 8
      Caption = 'ToolButton14'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton_Excel: TToolButton
      Left = 520
      Top = 2
      Caption = 'ToolButton_Excel'
      ImageIndex = 51
      OnClick = ToolButton_ExcelClick
    end
    object ToolButton13: TToolButton
      Left = 551
      Top = 2
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 559
      Top = 2
      Caption = 'ToolButton9'
      ImageIndex = 2
      OnClick = ToolButton9Click
    end
    object ToolButton12: TToolButton
      Left = 590
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton10: TToolButton
      Left = 598
      Top = 2
      Caption = 'ToolButton10'
      ImageIndex = 3
      OnClick = ToolButton10Click
    end
    object ToolButton11: TToolButton
      Left = 629
      Top = 2
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object Panel8: TPanel
      Left = 637
      Top = 2
      Width = 84
      Height = 30
      Caption = 'Panel1'
      TabOrder = 2
      object JvShape2: TJvShape
        Left = 1
        Top = 1
        Width = 82
        Height = 28
        Align = alClient
        Pen.Color = 33023
      end
      object DBNavigator_Atividades: TDBNavigator
        Left = 2
        Top = 2
        Width = 80
        Height = 26
        DataSource = DSC_Hospede
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Flat = True
        Ctl3D = False
        Hints.Strings = (
          'Posiciona no primeiro registro'
          'Posiciona no proximo registro'
          'Posiciona no registro anterior'
          'Posiciona no '#250'ltimo registro'
          '')
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
    object ToolButton3: TToolButton
      Left = 721
      Top = 2
      Width = 41
      Caption = 'ToolButton3'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object ToolButton_Visualicaoa: TToolButton
      Left = 762
      Top = 2
      ImageIndex = 5
      OnClick = ToolButton_VisualicaoaClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 36
    Width = 1374
    Height = 248
    Align = alTop
    Color = 16697257
    TabOrder = 2
    object Panel4: TPanel
      Left = 3
      Top = 0
      Width = 446
      Height = 247
      Color = 15112795
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object Label_Oficiais_Generais: TLabel
        Left = 9
        Top = 29
        Width = 250
        Height = 20
        Caption = '1 - Oficiais Generais                           '
        Color = 16759260
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label_Oficiais_Superiores: TLabel
        Left = 9
        Top = 51
        Width = 250
        Height = 20
        Caption = '2 - Oficiais Superiores                        '
        Color = 16749513
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label_Oficiais_Intermediarios: TLabel
        Left = 9
        Top = 73
        Width = 250
        Height = 20
        Caption = '3 - Oficiais Intermedi'#225'rios                  '
        Color = 16759260
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label_Oficiais_Subalternos_Aspirantes: TLabel
        Left = 9
        Top = 96
        Width = 251
        Height = 20
        Caption = '4 - Oficiais Subalternos/Aspirantes  '
        Color = 16749513
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label_SO_SGT: TLabel
        Left = 9
        Top = 118
        Width = 250
        Height = 20
        Caption = '5 - SO/SGT                                          '
        Color = 16759260
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label_CB_SD_TF: TLabel
        Left = 9
        Top = 141
        Width = 250
        Height = 20
        Caption = '6 - CB / SD / TF                                   '
        Color = 16749513
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label_Civil: TLabel
        Left = 9
        Top = 165
        Width = 249
        Height = 20
        Caption = '7 - Civil                                                  '
        Color = 16759260
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label_Valor_Oficiais_Generais: TLabel
        Left = 263
        Top = 29
        Width = 86
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = 16759260
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label_Valor_Oficiais_Superiores: TLabel
        Left = 263
        Top = 51
        Width = 86
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = 16749513
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label_Valor_Oficiais_Intermediarios: TLabel
        Left = 263
        Top = 73
        Width = 86
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = 16759260
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label_Valor_Oficiais_Subalternos_Aspirantes: TLabel
        Left = 263
        Top = 96
        Width = 86
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = 16749513
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label_Valor_SO_SGT: TLabel
        Left = 263
        Top = 119
        Width = 86
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = 16759260
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label_Valor_CB_SD_TF: TLabel
        Left = 263
        Top = 142
        Width = 86
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = 16749513
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label_Valor_Civil: TLabel
        Left = 263
        Top = 165
        Width = 86
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = 16759260
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label_Arrecadacao: TLabel
        Left = 9
        Top = 221
        Width = 251
        Height = 20
        Caption = 'Total                                          '
        Color = 16759260
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label_D_Valor_Civil: TLabel
        Left = 352
        Top = 165
        Width = 92
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = 16759260
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label_D_Valor_CB_SD_TF: TLabel
        Left = 352
        Top = 142
        Width = 92
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = 16749513
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label_D_Valor_SO_SGT: TLabel
        Left = 352
        Top = 119
        Width = 92
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = 16759260
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label_D_Valor_Oficiais_Subalternos_Aspirantes: TLabel
        Left = 352
        Top = 96
        Width = 92
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = 16749513
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label_D_Valor_Oficiais_Intermediarios: TLabel
        Left = 352
        Top = 73
        Width = 92
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = 16759260
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label_D_Valor_Oficiais_Superiores: TLabel
        Left = 352
        Top = 51
        Width = 92
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = 16749513
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label_D_Valor_Oficiais_Generais: TLabel
        Left = 352
        Top = 29
        Width = 92
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = 16759260
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label_Diarias: TLabel
        Left = 289
        Top = 4
        Width = 42
        Height = 16
        Caption = 'Hosp.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label38: TLabel
        Left = 358
        Top = 4
        Width = 80
        Height = 16
        Caption = 'Di'#225'rias(R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label_Total_Hospede: TLabel
        Left = 263
        Top = 221
        Width = 86
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = 16759260
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label_Total_Diarias: TLabel
        Left = 352
        Top = 221
        Width = 92
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = 16759260
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label21: TLabel
        Left = 9
        Top = 188
        Width = 250
        Height = 20
        Caption = '8 - Outros                                             '
        Color = 16749513
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label_Valor_Outros: TLabel
        Left = 263
        Top = 188
        Width = 86
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = 16749513
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label_D_Valor_Outros: TLabel
        Left = 352
        Top = 188
        Width = 92
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Color = 16749513
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
    end
    object Panel1: TPanel
      Left = 454
      Top = 0
      Width = 283
      Height = 247
      Color = 15112795
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 149
        Width = 218
        Height = 20
        Caption = 'Total de Registros.............:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 37
        Width = 186
        Height = 20
        Caption = 'Total de H'#243'spedes............:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 8
        Top = 69
        Width = 187
        Height = 20
        Caption = 'Total de Fechamentos......:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 8
        Top = 101
        Width = 188
        Height = 20
        Caption = 'Total de Cancelamentos...:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Labe_Total_Reg: TLabel
        Left = 207
        Top = 149
        Width = 69
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Labe_Total_Hosp: TLabel
        Left = 207
        Top = 37
        Width = 69
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Labe_Total_Fech: TLabel
        Left = 207
        Top = 69
        Width = 69
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Labe_Total_Canc: TLabel
        Left = 207
        Top = 101
        Width = 69
        Height = 20
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
    object Panel5: TPanel
      Left = 742
      Top = 4
      Width = 268
      Height = 240
      BevelInner = bvLowered
      BevelWidth = 2
      Color = 16112837
      TabOrder = 2
      object GroupBox1: TGroupBox
        Left = 8
        Top = 55
        Width = 78
        Height = 36
        Caption = ' Janeiro '
        Color = 16112837
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        object Label_Jan: TLabel
          Left = 7
          Top = 15
          Width = 64
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Label_Jan'
          Color = 16112837
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
      end
      object GroupBox2: TGroupBox
        Left = 96
        Top = 55
        Width = 78
        Height = 36
        Caption = ' Fevereiro '
        Color = 16112837
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        object Label_Fev: TLabel
          Left = 7
          Top = 13
          Width = 64
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Label_Curso'
          Color = 16112837
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
      end
      object GroupBox3: TGroupBox
        Left = 184
        Top = 55
        Width = 78
        Height = 36
        Caption = '  Mar'#231'o '
        Color = 16112837
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 2
        object Label_Mar: TLabel
          Left = 7
          Top = 13
          Width = 64
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Label_Curso'
          Color = 16112837
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
      end
      object GroupBox4: TGroupBox
        Left = 96
        Top = 96
        Width = 78
        Height = 36
        Caption = ' Maio '
        Color = 16112837
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 3
        object Label_Mai: TLabel
          Left = 7
          Top = 13
          Width = 64
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Label_Curso'
          Color = 16112837
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
      end
      object GroupBox5: TGroupBox
        Left = 8
        Top = 96
        Width = 78
        Height = 36
        Caption = ' Abril '
        Color = 16112837
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 4
        object Label_Abr: TLabel
          Left = 7
          Top = 13
          Width = 64
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Label_Curso'
          Color = 16112837
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
      end
      object GroupBox6: TGroupBox
        Left = 184
        Top = 96
        Width = 78
        Height = 36
        Caption = ' Junho '
        Color = 16112837
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 5
        object Label_Jun: TLabel
          Left = 7
          Top = 13
          Width = 64
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Label_Curso'
          Color = 16112837
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
      end
      object GroupBox7: TGroupBox
        Left = 8
        Top = 136
        Width = 78
        Height = 36
        Caption = ' Julho '
        Color = 16112837
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 6
        object Label_Jul: TLabel
          Left = 7
          Top = 13
          Width = 64
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Label_Curso'
          Color = 16112837
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
      end
      object GroupBox8: TGroupBox
        Left = 96
        Top = 136
        Width = 78
        Height = 36
        Caption = ' Agosto '
        Color = 16112837
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 7
        object Label_Ago: TLabel
          Left = 7
          Top = 13
          Width = 64
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Label_Curso'
          Color = 16112837
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
      end
      object GroupBox9: TGroupBox
        Left = 184
        Top = 136
        Width = 78
        Height = 36
        Caption = 'Setembro '
        Color = 16112837
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 8
        object Label_Set: TLabel
          Left = 7
          Top = 13
          Width = 64
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Label_Curso'
          Color = 16112837
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
      end
      object GroupBox10: TGroupBox
        Left = 96
        Top = 176
        Width = 78
        Height = 36
        Caption = ' Novembro '
        Color = 16112837
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 9
        object Label_Nov: TLabel
          Left = 7
          Top = 13
          Width = 64
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Label_Curso'
          Color = 16112837
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
      end
      object GroupBox11: TGroupBox
        Left = 8
        Top = 176
        Width = 78
        Height = 36
        Caption = ' Outubro '
        Color = 16112837
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 10
        object Label_Out: TLabel
          Left = 7
          Top = 13
          Width = 64
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Label_Curso'
          Color = 16112837
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
      end
      object GroupBox12: TGroupBox
        Left = 184
        Top = 176
        Width = 78
        Height = 36
        Caption = ' Dezembro '
        Color = 16112837
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 11
        object Label_Dez: TLabel
          Left = 7
          Top = 13
          Width = 64
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Label_Curso'
          Color = 16112837
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
      end
      object GroupBox14: TGroupBox
        Left = 161
        Top = 4
        Width = 91
        Height = 37
        Caption = ' Valor Total '
        Color = 16112837
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 12
        object Label_ValorTotal: TLabel
          Left = 7
          Top = 13
          Width = 78
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Label_Total'
          Color = 16112837
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
      end
      object GroupBox13: TGroupBox
        Left = 7
        Top = 5
        Width = 106
        Height = 38
        Caption = ' Ano '
        TabOrder = 13
        object SpeedButton_Atualiza_Mapa: TSpeedButton
          Left = 66
          Top = 14
          Width = 27
          Height = 19
          Hint = 'Atualiza o gr'#225'fico.'
          Glyph.Data = {
            EE000000424DEE000000000000007600000028000000100000000F0000000100
            0400000000007800000000000000000000001000000000000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            70077777777777780008777777777770008777780000874808777700F7F70084
            8777708F7FFFF808777780FFF77FFF08777707FFFFF77FF077770F7FFFFFF7F0
            777707F7FFFFFF7077770F7FF7FFFFF0777780F7FFFFFF087777708F7F7FF807
            77777700F7F7007777777778000087777777}
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton_Atualiza_MapaClick
        end
        object ComboBox_Ano: TComboBox
          Left = 6
          Top = 14
          Width = 59
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          Text = '2004'
          Items.Strings = (
            '2000'
            '2001'
            '2002'
            '2003'
            '2004'
            '2005'
            '2006'
            '2007'
            '2008'
            '2009'
            '2010'
            '2011'
            '2012'
            '2013'
            '2014'
            '2015'
            '2016'
            '2017'
            '2018'
            '2019'
            '2020'
            '2021'
            '2022'
            '2023'
            '2024'
            '2025')
        end
      end
    end
    object DBChart1: TDBChart
      Left = 1012
      Top = 1
      Width = 351
      Height = 246
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Gradient.EndColor = 4227327
      Gradient.Visible = True
      Title.Font.Charset = DEFAULT_CHARSET
      Title.Font.Color = clBlue
      Title.Font.Height = -15
      Title.Font.Name = 'Arial'
      Title.Font.Style = [fsBold, fsItalic]
      Title.Text.Strings = (
        'Arrecada'#231#227'o por M'#234's')
      LeftAxis.AxisValuesFormat = '##0'
      LeftAxis.LabelsSeparation = 5
      LeftAxis.LabelStyle = talValue
      LeftAxis.MinorTickCount = 0
      LeftAxis.MinorTickLength = 0
      LeftAxis.TickLength = 0
      LeftAxis.Title.Caption = 'Valor M'#225'ximo de Arrecada'#231#227'o'
      Legend.ColorWidth = 17
      Legend.TextStyle = ltsXValue
      Legend.TopPos = 7
      RightAxis.AxisValuesFormat = '##0'
      RightAxis.Logarithmic = True
      BevelInner = bvLowered
      BorderStyle = bsSingle
      TabOrder = 3
      object Series1: TBarSeries
        ColorEachPoint = True
        Marks.ArrowLength = 20
        Marks.Visible = False
        DataSource = Query_Estatistica
        PercentFormat = '##0,## %'
        SeriesColor = clRed
        ShowInLegend = False
        Title = 'Mes'
        ValueFormat = '###'
        XLabelsSource = 'SITUACAO'
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
        YValues.ValueSource = 'VALOR'
      end
    end
  end
  object DBGrid_Ativ: TDBGrid
    Left = 0
    Top = 284
    Width = 1374
    Height = 765
    Align = alClient
    Color = 16378073
    DataSource = DSC_Hospede
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid_AtivDrawColumnCell
    Columns = <
      item
        Color = 13820415
        Expanded = False
        FieldName = 'ficha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'FICHA'
        Title.Color = 15512452
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Color = 13820415
        Expanded = False
        FieldName = 'nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'NOME DO HOSPEDE'
        Title.Color = 15512452
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 436
        Visible = True
      end
      item
        Color = 13820415
        Expanded = False
        FieldName = 'posto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'POSTO/GRAD'
        Title.Color = 15512452
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 135
        Visible = True
      end
      item
        Color = 13820415
        Expanded = False
        FieldName = 'entrada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'ENTRADA'
        Title.Color = 15512452
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Color = 13820415
        Expanded = False
        FieldName = 'saida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'SA'#205'DA'
        Title.Color = 15512452
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Color = 13820415
        Expanded = False
        FieldName = 'tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'TIPO'
        Title.Color = 15512452
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Color = 13820415
        Expanded = False
        FieldName = 'diarias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'DI'#193'RIAS (R$)'
        Title.Color = 15512452
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Color = 13820415
        Expanded = False
        FieldName = 'tempo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'TEMPO'
        Title.Color = 15512452
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Color = 13820415
        Expanded = False
        FieldName = 'dep'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'DEP.'
        Title.Color = 15512452
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Color = 13820415
        Expanded = False
        FieldName = 'total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'TOTAL'
        Title.Color = 15512452
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object Query_Atividades: TQuery
    DatabaseName = 'hotel1'
    SQL.Strings = (
      'Select ho.posto, 1 as Tempo, hi.datasaida '
      'From historico hi, hospede ho'
      'where hi.identidade = ho.identidade'
      'and   hi.ano = 2018'
      'order by ho.posto')
    Left = 680
    Top = 336
  end
  object DSQ_Atividades: TDataSource
    DataSet = Query_Atividades
    Left = 719
    Top = 333
  end
  object Query_Historico: TQuery
    DatabaseName = 'hotel1'
    SQL.Strings = (
      
        'Select DataPagamento, Data_Operacao, ValorPago, Identidade, Fich' +
        'a, ano '
      ' from Historico'
      'where DataPagamento <> '#39' '#39
      'order by dataPagamento')
    Left = 1097
    Top = 339
    object Query_HistoricoDATAPAGAMENTO: TStringField
      FieldName = 'DATAPAGAMENTO'
      Origin = 'HOTEL1.HISTORICO.DATAPAGAMENTO'
      Size = 10
    end
    object Query_HistoricoDATA_OPERACAO: TDateTimeField
      FieldName = 'DATA_OPERACAO'
      Origin = 'HOTEL1.HISTORICO.DATA_OPERACAO'
    end
    object Query_HistoricoVALORPAGO: TFloatField
      FieldName = 'VALORPAGO'
      Origin = 'HOTEL1.HISTORICO.VALORPAGO'
    end
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
  end
  object DataSource2: TDataSource
    DataSet = Query_Historico
    Left = 1146
    Top = 339
  end
  object Table_Estatistica: TTable
    DatabaseName = 'hotel1'
    TableName = 'ESTATISTICA'
    Left = 1096
    Top = 392
    object Table_EstatisticaCODIGO: TFloatField
      FieldName = 'CODIGO'
    end
    object Table_EstatisticaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 15
    end
    object Table_EstatisticaVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object ClientDataSet_Hospede: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 856
    Top = 352
    Data = {
      080100009619E0BD01000000180000000B000000000003000000080105736172
      616D0100490000000100055749445448020002000C0005666963686101004900
      00000100055749445448020002000800046E6F6D650100490000000100055749
      44544802000200640005706F73746F0100490000000100055749445448020002
      000F0007656E74726164610100490000000100055749445448020002000A0005
      73616964610100490000000100055749445448020002000A00047469706F0100
      4900000001000557494454480200020023000764696172696173080004000000
      00000574656D706F080004000000000003646570080004000000000005746F74
      616C08000400000000000000}
    object ClientDataSet_Hospedesaram: TStringField
      FieldName = 'saram'
      Size = 12
    end
    object ClientDataSet_Hospedeficha: TStringField
      FieldName = 'ficha'
      Size = 8
    end
    object ClientDataSet_Hospedenome: TStringField
      FieldName = 'nome'
      Size = 100
    end
    object ClientDataSet_Hospedeposto: TStringField
      FieldName = 'posto'
      Size = 15
    end
    object ClientDataSet_Hospedeentrada: TStringField
      FieldName = 'entrada'
      Size = 10
    end
    object ClientDataSet_Hospedesaida: TStringField
      FieldName = 'saida'
      Size = 10
    end
    object ClientDataSet_Hospedetipo: TStringField
      FieldName = 'tipo'
      Size = 35
    end
    object ClientDataSet_Hospedediarias: TFloatField
      FieldName = 'diarias'
      DisplayFormat = '####0.00'
    end
    object ClientDataSet_Hospedetempo: TFloatField
      FieldName = 'tempo'
      DisplayFormat = '####0.00'
    end
    object ClientDataSet_Hospededep: TFloatField
      FieldName = 'dep'
      DisplayFormat = '####0.00'
    end
    object ClientDataSet_Hospedetotal: TFloatField
      FieldName = 'total'
      DisplayFormat = '####0.00'
    end
  end
  object DSC_Hospede: TDataSource
    DataSet = ClientDataSet_Hospede
    Left = 863
    Top = 389
  end
  object Query_PagParcelado: TQuery
    DatabaseName = 'hotel1'
    SQL.Strings = (
      'Select IDENTIDADE, FICHA, ANO, DATAPAGAMENTO, VALOR, NRECIBO '
      'From PagParcelado ')
    Left = 1096
    Top = 488
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
  end
  object DSQ_PagParcelado: TDataSource
    DataSet = Query_PagParcelado
    Left = 1128
    Top = 488
  end
  object Query_Estatistica: TQuery
    DatabaseName = 'hotel1'
    SQL.Strings = (
      'Select * from  Estatistica'
      'Order By Codigo')
    Left = 1097
    Top = 427
    object Query_EstatisticaCODIGO: TFloatField
      FieldName = 'CODIGO'
      Origin = 'ESTATISTICA.CODIGO'
    end
    object Query_EstatisticaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'ESTATISTICA.SITUACAO'
      Size = 15
    end
    object Query_EstatisticaVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'ESTATISTICA.VALOR'
    end
  end
end
