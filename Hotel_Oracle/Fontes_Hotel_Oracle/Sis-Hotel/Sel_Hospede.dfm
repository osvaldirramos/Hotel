object Form_Sel_Hospede: TForm_Sel_Hospede
  Left = 212
  Top = 39
  Width = 756
  Height = 634
  BorderIcons = []
  Caption = 'Seleciona H'#243'spede - Hotel ICEA'
  Color = clWindow
  Ctl3D = False
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
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 571
    Width = 740
    Height = 24
    Panels = <>
    SimplePanel = True
    SimpleText = 'Selecione o h'#243'spede.'
  end
  object DBGrid_Mapa: TDBGrid
    Left = 0
    Top = 80
    Width = 740
    Height = 491
    Align = alClient
    Color = clInfoBk
    DataSource = DSQ_sel_Hospede
    FixedColor = clOlive
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColLines, dgRowSelect, dgAlwaysShowSelection]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -14
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid_MapaDblClick
    OnTitleClick = DBGrid_MapaTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'IDENTIDADE'
        Title.Alignment = taCenter
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POSTO'
        Title.Alignment = taCenter
        Width = 187
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Alignment = taCenter
        Width = 399
        Visible = True
      end>
  end
  object ToolBar3: TToolBar
    Left = 0
    Top = 0
    Width = 740
    Height = 57
    AutoSize = True
    BorderWidth = 1
    ButtonHeight = 47
    ButtonWidth = 93
    Caption = 'ToolBar1'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Images = DM.ImageList_Principal
    ParentFont = False
    ShowCaptions = True
    TabOrder = 2
    object ToolButton_Retornar: TToolButton
      Left = 0
      Top = 2
      Hint = 'Calcula o Fechamento da conta do H'#243'spede Selecionado.'
      Caption = '    &Selecionar'
      ImageIndex = 6
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton_RetornarClick
    end
    object ToolButton_Cancelar: TToolButton
      Left = 93
      Top = 2
      Hint = 'Cancela o fechamento da conta.'
      Caption = ' &Cancelar'
      ImageIndex = 27
      OnClick = ToolButton_CancelarClick
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 57
    Width = 740
    Height = 23
    ButtonHeight = 19
    Caption = 'ToolBar1'
    TabOrder = 3
    object Edit_Identidade: TEdit
      Left = 0
      Top = 2
      Width = 126
      Height = 19
      CharCase = ecUpperCase
      MaxLength = 12
      TabOrder = 1
      OnChange = Edit_IdentidadeChange
      OnKeyPress = Edit_IdentidadeKeyPress
    end
    object Edit_Posto: TEdit
      Left = 126
      Top = 2
      Width = 188
      Height = 19
      CharCase = ecUpperCase
      MaxLength = 30
      TabOrder = 0
      OnChange = Edit_IdentidadeChange
    end
    object Edit_Nome: TEdit
      Left = 314
      Top = 2
      Width = 402
      Height = 19
      CharCase = ecUpperCase
      MaxLength = 40
      TabOrder = 2
      OnChange = Edit_IdentidadeChange
    end
  end
  object Query_Sel_Hospede: TQuery
    DatabaseName = 'hotel1'
    SQL.Strings = (
      'Select identidade, Nome, Posto'
      'From hospede'
      'Order by nome')
    Left = 40
    Top = 112
  end
  object DSQ_sel_Hospede: TDataSource
    DataSet = Query_Sel_Hospede
    Left = 40
    Top = 144
  end
end
