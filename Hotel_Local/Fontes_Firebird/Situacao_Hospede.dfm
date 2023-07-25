object Form_Situacao_Hospede: TForm_Situacao_Hospede
  Left = 253
  Top = 71
  Width = 822
  Height = 624
  Caption = 'Sis-Hotel --> Tratamento da situa'#231#227'o do H'#243'spede'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
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
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 463
    Height = 562
    Align = alLeft
    BevelInner = bvLowered
    BorderWidth = 4
    Caption = 'Panel2'
    TabOrder = 0
    object DBGrid_Hospede: TDBGrid
      Left = 6
      Top = 6
      Width = 451
      Height = 510
      Align = alClient
      DataSource = DSQ_Sel_Hospede
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clMaroon
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'IDENTIDADE'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_GUERRA'
          Title.Alignment = taCenter
          Title.Caption = 'NOME GUERRA'
          Visible = True
        end>
    end
    object GroupBox1: TGroupBox
      Left = 6
      Top = 516
      Width = 451
      Height = 40
      Align = alBottom
      Caption = ' Sele'#231#227'o por nome '
      TabOrder = 1
      object Edit_Sel_Nome: TEdit
        Left = 7
        Top = 13
        Width = 397
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 40
        TabOrder = 0
        OnChange = Edit_Sel_NomeChange
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 562
    Width = 806
    Height = 24
    Panels = <>
    SimplePanel = True
    SimpleText = 'Selecione a Op'#231#227'o desejada.'
  end
  object Panel_Botoes: TPanel
    Left = 558
    Top = 127
    Width = 174
    Height = 216
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BorderWidth = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object DBNavigator_Decea: TDBNavigator
      Left = 4
      Top = 4
      Width = 166
      Height = 22
      DataSource = DSQ_Sel_Hospede
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alTop
      Ctl3D = False
      Hints.Strings = (
        'Primeiro H'#243'spede'
        'H'#243'spede  Anterior'
        'H'#243'spede Seguinte'
        #218'ltimo h'#243'spede')
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ToolBar4: TToolBar
      Left = 4
      Top = 26
      Width = 166
      Height = 186
      AutoSize = True
      ButtonHeight = 30
      ButtonWidth = 161
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
      object ToolButton_Inserir: TToolButton
        Left = 0
        Top = 2
        Hint = 'Prmite inserir restri'#231#227'o de hospedagem.'
        Caption = '&Inserir Restri'#231#227'o'
        ImageIndex = 51
        ParentShowHint = False
        Wrap = True
        ShowHint = True
        OnClick = ToolButton_InserirClick
      end
      object ToolButton_Limpar: TToolButton
        Left = 0
        Top = 32
        Hint = 'Realiza a limpeza da restri'#231#227'o do h'#243'spede.'
        Caption = 'Limpar Restri'#231#227'o'
        ImageIndex = 52
        Wrap = True
        OnClick = ToolButton_LimparClick
      end
      object ToolButton_Gravar: TToolButton
        Left = 0
        Top = 62
        Hint = 'Grava a restri'#231#227'o imposta ao h'#243'spede'
        Caption = '     &Gravar Restri'#231#227'o'
        ImageIndex = 25
        Wrap = True
        OnClick = ToolButton_GravarClick
      end
      object ToolButton_Ignorar: TToolButton
        Left = 0
        Top = 92
        Hint = 'Ignora a restri'#231#227'o imposta ao h'#243'spede'
        Caption = '&Cancelar Restri'#231#227'o'
        ImageIndex = 27
        Wrap = True
        OnClick = ToolButton_IgnorarClick
      end
      object ToolButton_Retornar: TToolButton
        Left = 0
        Top = 122
        Hint = 'Retorna para Menu Principal'
        Caption = '   &Retorna'
        ImageIndex = 2
        Wrap = True
        OnClick = ToolButton_RetornarClick
      end
      object ToolButton_Windows: TToolButton
        Left = 0
        Top = 152
        Caption = '&Windows'
        ImageIndex = 3
        OnClick = ToolButton_WindowsClick
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 489
    Top = 74
    Width = 304
    Height = 44
    Caption = ' Observa'#231#227'o '
    TabOrder = 3
    object DBMemo_Obs: TDBEdit
      Left = 3
      Top = 14
      Width = 292
      Height = 21
      DataField = 'OBS'
      DataSource = DST_Hospede
      TabOrder = 0
    end
  end
  object DSQ_Sel_Hospede: TDataSource
    DataSet = IBQuery_Sel_Hospede
    Left = 264
    Top = 40
  end
  object IBQuery_Sel_Hospede: TIBQuery
    Database = DM.IBDatabase_Hotel
    Transaction = DM.IBTransaction_Hotel
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select identidade, nome, nome_Guerra  from hospede'
      'order by nome_guerra'
      '')
    Left = 216
    Top = 40
  end
  object IBTable_Hospede: TIBTable
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
      end
      item
        Name = 'SEXO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TELEFONE_CELULAR'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'VEICULO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PLACA'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'CPF'
        DataType = ftString
        Size = 11
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
    MasterSource = DSQ_Sel_Hospede
    StoreDefs = True
    TableName = 'HOSPEDE'
    Left = 216
    Top = 72
  end
  object DST_Hospede: TDataSource
    DataSet = IBTable_Hospede
    Left = 256
    Top = 72
  end
end
