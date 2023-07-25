object Form_Cad_Voucher: TForm_Cad_Voucher
  Left = 107
  Top = 148
  Width = 1132
  Height = 647
  Caption = 'Cadastro do Voucher'
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
  object ToolBar_Principal: TToolBar
    Left = 0
    Top = 0
    Width = 1116
    Height = 52
    ButtonHeight = 44
    ButtonWidth = 57
    Caption = 'f'
    EdgeBorders = [ebTop, ebBottom]
    Flat = True
    Images = DM.ImageList_Principal
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 0
    Transparent = True
    object ToolButton_Retornar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Retorna para janela anterior.'
      Caption = '&Retornar'
      ImageIndex = 2
      OnClick = ToolButton_RetornarClick
    end
    object ToolButton_Windows: TToolButton
      Left = 57
      Top = 0
      Hint = 'Retorna para o Windows'
      Caption = '&Windows'
      ImageIndex = 3
      OnClick = ToolButton_WindowsClick
    end
  end
  object GroupBox_CadastroVoucher: TGroupBox
    Left = 0
    Top = 271
    Width = 1116
    Height = 338
    Align = alBottom
    Caption = ' Cadastro do Voucher '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label_Predio: TLabel
      Left = 14
      Top = 34
      Width = 31
      Height = 17
      Caption = 'Tipo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label_Apto: TLabel
      Left = 14
      Top = 68
      Width = 59
      Height = 17
      Caption = 'Controle:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label_Ramal: TLabel
      Left = 14
      Top = 105
      Width = 165
      Height = 17
      Hint = 'Assinou Termo Respons'#225'bilidade'
      Caption = 'Termo Respons'#225'bilidade:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 14
      Top = 180
      Width = 53
      Height = 17
      Hint = 'Assinou Termo Respons'#225'bilidade'
      Caption = 'Expirou:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 246
      Top = 180
      Width = 112
      Height = 17
      Caption = 'Data Expira'#231#227'o..:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 14
      Top = 261
      Width = 99
      Height = 17
      Caption = 'Data Extravio..:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label1: TLabel
      Left = 14
      Top = 227
      Width = 60
      Height = 17
      Hint = 'Assinou Termo Respons'#225'bilidade'
      Caption = 'Extravio.:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 302
      Top = 261
      Width = 171
      Height = 17
      Caption = 'Data Cancelamento da SI:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Bevel1: TBevel
      Left = 0
      Top = 160
      Width = 549
      Height = 2
    end
    object Bevel2: TBevel
      Left = 8
      Top = 209
      Width = 841
      Height = 3
    end
    object Label5: TLabel
      Left = 14
      Top = 137
      Width = 157
      Height = 17
      Hint = 'Assinou Termo Respons'#225'bilidade'
      Caption = 'Quantidade de Dias......:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object ToolBar_Botoes_1: TToolBar
      Left = 554
      Top = 30
      Width = 176
      Height = 164
      Align = alNone
      AutoSize = True
      BorderWidth = 2
      ButtonHeight = 30
      ButtonWidth = 164
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
      TabOrder = 8
      object ToolButton_Inserir: TToolButton
        Left = 0
        Top = 2
        Hint = 'Insere uma nova Facilidade.'
        Caption = '              &Inserir              '
        ImageIndex = 24
        ParentShowHint = False
        Wrap = True
        ShowHint = True
        OnClick = ToolButton_InserirClick
      end
      object ToolButton_Alterar: TToolButton
        Left = 0
        Top = 32
        Hint = 'Permite a altera'#231#227'o da Facilidade selecionada.'
        Caption = '             &Alterar  '
        ImageIndex = 29
        ParentShowHint = False
        Wrap = True
        ShowHint = True
        OnClick = ToolButton_AlterarClick
      end
      object ToolButton_Excluir: TToolButton
        Left = 0
        Top = 62
        Hint = 'Exclui a Facilidade selecionada.'
        Caption = '             &Excluir   '
        ImageIndex = 26
        ParentShowHint = False
        Wrap = True
        ShowHint = True
        OnClick = ToolButton_ExcluirClick
      end
      object ToolButton_Gravar: TToolButton
        Left = 0
        Top = 92
        Hint = 'Grava a inclus'#227'o ou altera'#231#227'o'
        Caption = '             &Gravar    '
        ImageIndex = 25
        ParentShowHint = False
        Wrap = True
        ShowHint = True
        OnClick = ToolButton_GravarClick
      end
      object ToolButton_Ignorar: TToolButton
        Left = 0
        Top = 122
        Hint = 'Ignora inclus'#227'o ou altera'#231#227'o'
        Caption = '             &Ignorar'
        ImageIndex = 27
        ParentShowHint = False
        ShowHint = True
        OnClick = ToolButton_IgnorarClick
      end
    end
    object DBComboBox_Tipo: TDBComboBox
      Left = 50
      Top = 28
      Width = 147
      Height = 25
      Style = csDropDownList
      BevelInner = bvSpace
      BevelKind = bkFlat
      CharCase = ecUpperCase
      Ctl3D = False
      DataField = 'TIPO'
      DataSource = DST_Voucher
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ItemHeight = 17
      Items.Strings = (
        'OURO'
        'PRATA')
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object DBEdit_Controle: TDBEdit
      Left = 78
      Top = 62
      Width = 196
      Height = 25
      Hint = 'N'#250'mero do Apartamento.'
      BevelInner = bvSpace
      BevelKind = bkFlat
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Ctl3D = False
      DataField = 'CONTROLE'
      DataSource = DST_Voucher
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      OnChange = DBEdit_ControleChange
      OnKeyPress = DBEdit_ControleKeyPress
    end
    object DBComboBox_TermoResponsabilidade: TDBComboBox
      Left = 185
      Top = 98
      Width = 47
      Height = 25
      Style = csDropDownList
      BevelInner = bvSpace
      BevelKind = bkFlat
      CharCase = ecUpperCase
      Ctl3D = False
      DataField = 'TERMO'
      DataSource = DST_Voucher
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ItemHeight = 17
      Items.Strings = (
        'S'
        'N')
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
    end
    object DBComboBox_Expirou: TDBComboBox
      Left = 74
      Top = 173
      Width = 47
      Height = 25
      Style = csDropDownList
      BevelInner = bvSpace
      BevelKind = bkFlat
      CharCase = ecUpperCase
      Ctl3D = False
      DataField = 'EXPIROU'
      DataSource = DST_Voucher
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ItemHeight = 17
      Items.Strings = (
        'S'
        'N')
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      OnChange = DBComboBox_ExpirouChange
    end
    object DBComboBox_Extravio: TDBComboBox
      Left = 80
      Top = 220
      Width = 47
      Height = 25
      Style = csDropDownList
      BevelInner = bvSpace
      BevelKind = bkFlat
      CharCase = ecUpperCase
      Ctl3D = False
      DataField = 'EXTRAVIO'
      DataSource = DST_Voucher
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ItemHeight = 17
      Items.Strings = (
        'S'
        'N')
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
      OnChange = DBComboBox_ExtravioChange
    end
    object JvDBDateEdit_DataExtravio: TJvDBDateEdit
      Left = 119
      Top = 255
      Width = 111
      Height = 23
      DataField = 'DATAEXTRAVIO'
      DataSource = DST_Voucher
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      NumGlyphs = 2
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 6
      Weekends = [Sun, Sat]
    end
    object JvDBDateEdit_DataCancelamentoSI: TJvDBDateEdit
      Left = 479
      Top = 255
      Width = 109
      Height = 23
      DataField = 'DATACANCELAMENTOSI'
      DataSource = DST_Voucher
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      NumGlyphs = 2
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 7
      Weekends = [Sun, Sat]
    end
    object JvDBDateEdit_DataExpiracao: TJvDBDateEdit
      Left = 367
      Top = 173
      Width = 113
      Height = 23
      DataField = 'DATAEXPIRACAO'
      DataSource = DST_Voucher
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      NumGlyphs = 2
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
      Weekends = [Sun, Sat]
    end
    object DBComboBox1: TDBComboBox
      Left = 185
      Top = 130
      Width = 47
      Height = 25
      Style = csDropDownList
      BevelInner = bvSpace
      BevelKind = bkFlat
      CharCase = ecUpperCase
      Ctl3D = False
      DataField = 'QTDDIAS'
      DataSource = DST_Voucher
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ItemHeight = 17
      Items.Strings = (
        '10'
        '20'
        '30'
        '60'
        '90'
        '')
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 9
    end
  end
  object DBGrid_Voucher: TDBGrid
    Left = 0
    Top = 52
    Width = 1116
    Height = 219
    Align = alClient
    BorderStyle = bsNone
    DataSource = DST_Voucher
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clMaroon
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Alignment = taCenter
        Title.Color = clMoneyGreen
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -12
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTROLE'
        Title.Alignment = taCenter
        Title.Color = clMoneyGreen
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -12
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TERMO'
        Title.Alignment = taCenter
        Title.Color = clMoneyGreen
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -12
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATACADASTRO'
        Title.Alignment = taCenter
        Title.Caption = 'DATA CADATRADO'
        Title.Color = clMoneyGreen
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -12
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIOCADASTRO'
        Title.Alignment = taCenter
        Title.Caption = 'USU'#193'RIO CADASTRO'
        Title.Color = clMoneyGreen
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -12
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Color = 53970
        Expanded = False
        FieldName = 'EXPIROU'
        Title.Alignment = taCenter
        Title.Color = clMoneyGreen
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -12
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Color = 53970
        Expanded = False
        FieldName = 'DATAEXPIRACAO'
        Title.Alignment = taCenter
        Title.Caption = 'DATA EXPIRA'#199#195'O'
        Title.Color = clMoneyGreen
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -12
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Color = 53970
        Expanded = False
        FieldName = 'USUARIOEXPIRACAO'
        Title.Alignment = taCenter
        Title.Caption = 'USU'#193'RIO EXPIRA'#199#195'O'
        Title.Color = clMoneyGreen
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -12
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Color = 16759225
        Expanded = False
        FieldName = 'EXTRAVIO'
        Title.Alignment = taCenter
        Title.Color = clMoneyGreen
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -12
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Color = 16759225
        Expanded = False
        FieldName = 'DATAEXTRAVIO'
        Title.Alignment = taCenter
        Title.Caption = 'DATA EXTRAVIO'
        Title.Color = clMoneyGreen
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -12
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Color = 16759225
        Expanded = False
        FieldName = 'DATACANCELAMENTOSI'
        Title.Alignment = taCenter
        Title.Caption = 'DATA CANCELAMENTO SI'
        Title.Color = clMoneyGreen
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -12
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Visible = True
      end
      item
        Color = 16759225
        Expanded = False
        FieldName = 'USUARIOEXTRAVIO'
        Title.Alignment = taCenter
        Title.Caption = 'USUARIO EXTRAVIO'
        Title.Color = clMoneyGreen
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -12
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Visible = True
      end>
  end
  object Table_Volcher: TTable
    DatabaseName = 'hotel1'
    IndexFieldNames = 'FICHA;ANO'
    MasterFields = 'FICHA;ANO'
    MasterSource = Form_Cad_Hospede.DST_CadHospedagem
    TableName = 'VOUCHER'
    Left = 64
    Top = 209
    object Table_VolcherFICHA: TStringField
      FieldName = 'FICHA'
      Required = True
      FixedChar = True
      Size = 6
    end
    object Table_VolcherANO: TFloatField
      FieldName = 'ANO'
      Required = True
    end
    object Table_VolcherTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 5
    end
    object Table_VolcherCONTROLE: TStringField
      FieldName = 'CONTROLE'
      Required = True
      Size = 7
    end
    object Table_VolcherTERMO: TStringField
      FieldName = 'TERMO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object Table_VolcherDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
    end
    object Table_VolcherUSUARIOCADASTRO: TStringField
      FieldName = 'USUARIOCADASTRO'
      Required = True
      Size = 10
    end
    object Table_VolcherEXPIROU: TStringField
      FieldName = 'EXPIROU'
      FixedChar = True
      Size = 1
    end
    object Table_VolcherDATAEXPIRACAO: TDateTimeField
      FieldName = 'DATAEXPIRACAO'
    end
    object Table_VolcherUSUARIOEXPIRACAO: TStringField
      FieldName = 'USUARIOEXPIRACAO'
      Size = 10
    end
    object Table_VolcherEXTRAVIO: TStringField
      FieldName = 'EXTRAVIO'
      FixedChar = True
      Size = 1
    end
    object Table_VolcherDATAEXTRAVIO: TDateTimeField
      FieldName = 'DATAEXTRAVIO'
    end
    object Table_VolcherDATACANCELAMENTOSI: TDateTimeField
      FieldName = 'DATACANCELAMENTOSI'
    end
    object Table_VolcherUSUARIOEXTRAVIO: TStringField
      FieldName = 'USUARIOEXTRAVIO'
      Size = 10
    end
    object Table_VolcherQTDDIAS: TFloatField
      FieldName = 'QTDDIAS'
    end
  end
  object DST_Voucher: TDataSource
    DataSet = Table_Volcher
    Left = 96
    Top = 209
  end
end
