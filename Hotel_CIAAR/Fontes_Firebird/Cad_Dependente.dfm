object Form_Cad_Dep_Hospede: TForm_Cad_Dep_Hospede
  Left = 179
  Top = 113
  Width = 549
  Height = 480
  Caption = 'Sis-Hotel --> Cadastro de Dependente de Hospede'
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
  object DBGrid_Mapa: TDBGrid
    Left = 0
    Top = 90
    Width = 541
    Height = 339
    Align = alClient
    Color = clInfoBk
    DataSource = Form_Cad_Hospede.DST_Dependente
    FixedColor = clOlive
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgColLines, dgRowLines, dgAlwaysShowSelection]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -14
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid_MapaCellClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PREDIO'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'PR'#201'DIO'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'APTO'
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 61
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CAMA'
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 52
        Visible = True
      end
      item
        Color = clWindow
        Expanded = False
        FieldName = 'NOME'
        Width = 290
        Visible = True
      end
      item
        Color = clWindow
        Expanded = False
        FieldName = 'IDADE'
        Width = 48
        Visible = True
      end>
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 429
    Width = 541
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 53
    Width = 541
    Height = 37
    Align = alTop
    TabOrder = 2
    object DBText1: TDBText
      Left = 80
      Top = 9
      Width = 385
      Height = 16
      DataField = 'NOME'
      DataSource = Form_Cad_Hospede.DST_CadHospede
    end
    object Label3: TLabel
      Left = 16
      Top = 9
      Width = 63
      Height = 16
      Caption = 'Hospede: '
    end
  end
  object ToolBar2: TToolBar
    Left = 0
    Top = 0
    Width = 541
    Height = 53
    ButtonHeight = 47
    ButtonWidth = 70
    Caption = 'Inserir'
    Images = DM.ImageList_Principal
    Indent = 10
    ShowCaptions = True
    TabOrder = 3
    object ToolButton_Gravar: TToolButton
      Left = 10
      Top = 2
      Hint = 'Grava a inclus'#227'o ou altera'#231#227'o'
      Caption = '&Gravar'
      ImageIndex = 22
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton_GravarClick
    end
    object ToolButton_Cancelar: TToolButton
      Left = 80
      Top = 2
      Hint = 'Ignora inclus'#227'o ou altera'#231#227'o'
      Caption = '&Cancelar'
      ImageIndex = 24
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton_CancelarClick
    end
    object ToolButton2: TToolButton
      Left = 150
      Top = 2
      Width = 19
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object ToolButton_Retornar: TToolButton
      Left = 169
      Top = 2
      Hint = 'Retorna para Menu Principal'
      Caption = '&Retornar'
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton_RetornarClick
    end
  end
end
