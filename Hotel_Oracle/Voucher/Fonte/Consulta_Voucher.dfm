object Form_Con_Voucher: TForm_Con_Voucher
  Left = 85
  Top = 50
  Width = 1203
  Height = 910
  Caption = 'Sis-Hotel - Consulta de Voucher'
  Color = 16766640
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 1187
    Height = 823
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    Color = 16766640
    TabOrder = 0
    object DBGrid_Hospede: TDBGrid
      Left = 6
      Top = 49
      Width = 1175
      Height = 768
      Align = alClient
      DataSource = DSQ_Voucher
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Times New Roman'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clMaroon
      TitleFont.Height = -13
      TitleFont.Name = 'Times New Roman'
      TitleFont.Style = []
      OnTitleClick = DBGrid_HospedeTitleClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'FICHA'
          Title.Alignment = taCenter
          Title.Caption = 'Ficha'
          Width = 39
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ANO'
          Title.Alignment = taCenter
          Title.Caption = 'Ano'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'POSTO'
          Title.Alignment = taCenter
          Title.Caption = 'Posto/Grad.'
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Alignment = taCenter
          Title.Caption = 'Nome Completo'
          Width = 271
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TIPO'
          Title.Alignment = taCenter
          Title.Caption = 'Tipo'
          Width = 62
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CONTROLE'
          Title.Alignment = taCenter
          Title.Caption = 'Controle'
          Width = 73
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TERMO'
          Title.Alignment = taCenter
          Title.Caption = 'Termo'
          Width = 43
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATACADASTRO'
          Title.Alignment = taCenter
          Title.Caption = 'Data Cadastro'
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'USUARIOCADASTRO'
          Title.Alignment = taCenter
          Title.Caption = 'Usu'#225'rio Cadastro'
          Width = 108
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'EXPIROU'
          Title.Alignment = taCenter
          Title.Caption = 'Expirou'
          Width = 46
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATAEXPIRACAO'
          Title.Alignment = taCenter
          Title.Caption = 'Data Expira'#231#227'o'
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'USUARIOEXPIRACAO'
          Title.Alignment = taCenter
          Title.Caption = 'Usu'#225'rio Expira'#231#227'o'
          Width = 108
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'EXTRAVIO'
          Title.Alignment = taCenter
          Title.Caption = 'Extravio'
          Width = 58
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATAEXTRAVIO'
          Title.Alignment = taCenter
          Title.Caption = 'Data Extravio'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATACANCELAMENTOSI'
          Title.Alignment = taCenter
          Title.Caption = 'Data Cancelamento'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'USUARIOEXTRAVIO'
          Title.Alignment = taCenter
          Title.Caption = 'Usu'#225'rio Extravio'
          Width = 108
          Visible = True
        end>
    end
    object Panel6: TPanel
      Left = 6
      Top = 6
      Width = 1175
      Height = 43
      Align = alTop
      Color = 16766640
      TabOrder = 1
      object Label_NReg: TLabel
        Left = 1039
        Top = 15
        Width = 90
        Height = 16
        Caption = 'Qtd. Hospede: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object MaskEdit_Nome: TJvEdit
        Left = 187
        Top = 0
        Width = 273
        Height = 22
        Alignment = taCenter
        BevelInner = bvSpace
        BevelKind = bkFlat
        GroupIndex = -1
        MaxPixel.Font.Charset = DEFAULT_CHARSET
        MaxPixel.Font.Color = clWindowText
        MaxPixel.Font.Height = -13
        MaxPixel.Font.Name = 'MS Sans Serif'
        MaxPixel.Font.Style = []
        Modified = False
        SelStart = 0
        SelLength = 0
        AutoSelect = False
        AutoSize = False
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 30
        ParentCtl3D = False
        ParentFont = False
        PasswordChar = #0
        ReadOnly = False
        TabOrder = 0
        OnChange = Busca_Voucher
      end
      object MaskEdit_Controle: TJvEdit
        Left = 523
        Top = 0
        Width = 72
        Height = 22
        Alignment = taCenter
        BevelInner = bvSpace
        BevelKind = bkFlat
        GroupIndex = -1
        MaxPixel.Font.Charset = DEFAULT_CHARSET
        MaxPixel.Font.Color = clWindowText
        MaxPixel.Font.Height = -13
        MaxPixel.Font.Name = 'MS Sans Serif'
        MaxPixel.Font.Style = []
        Modified = False
        SelStart = 0
        SelLength = 0
        AutoSelect = False
        AutoSize = False
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 6
        ParentCtl3D = False
        ParentFont = False
        PasswordChar = #0
        ReadOnly = False
        TabOrder = 1
        OnChange = Busca_Voucher
      end
      object MaskEdit_PostoGrad: TJvEdit
        Left = 101
        Top = 0
        Width = 87
        Height = 22
        Alignment = taCenter
        BevelInner = bvSpace
        BevelKind = bkFlat
        GroupIndex = -1
        MaxPixel.Font.Charset = DEFAULT_CHARSET
        MaxPixel.Font.Color = clWindowText
        MaxPixel.Font.Height = -13
        MaxPixel.Font.Name = 'MS Sans Serif'
        MaxPixel.Font.Style = []
        Modified = False
        SelStart = 0
        SelLength = 0
        AutoSelect = False
        AutoSize = False
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 3
        ParentCtl3D = False
        ParentFont = False
        PasswordChar = #0
        ReadOnly = False
        TabOrder = 2
        OnChange = Busca_Voucher
      end
      object ComboBox_Ano: TComboBox
        Left = 43
        Top = 0
        Width = 58
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        Style = csDropDownList
        CharCase = ecUpperCase
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 3
        OnChange = Busca_Voucher
        Items.Strings = (
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
          '2025'
          '2026'
          '2027'
          '2028'
          '2029'
          '2030')
      end
      object MaskEdit_Ficha: TJvEdit
        Left = 0
        Top = 0
        Width = 43
        Height = 22
        Alignment = taCenter
        BevelInner = bvSpace
        BevelKind = bkFlat
        GroupIndex = -1
        MaxPixel.Font.Charset = DEFAULT_CHARSET
        MaxPixel.Font.Color = clWindowText
        MaxPixel.Font.Height = -13
        MaxPixel.Font.Name = 'MS Sans Serif'
        MaxPixel.Font.Style = []
        Modified = False
        SelStart = 0
        SelLength = 0
        AutoSelect = False
        AutoSize = False
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 4
        ParentCtl3D = False
        ParentFont = False
        PasswordChar = #0
        ReadOnly = False
        TabOrder = 4
        OnChange = Busca_Voucher
      end
      object ComboBox_Tipo: TComboBox
        Left = 461
        Top = 0
        Width = 62
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        Style = csDropDownList
        CharCase = ecUpperCase
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 5
        OnChange = Busca_Voucher
        Items.Strings = (
          ''
          'PRATA'
          'OURO')
      end
      object ComboBox_Termo: TComboBox
        Left = 595
        Top = 0
        Width = 45
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        Style = csDropDownList
        CharCase = ecUpperCase
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 6
        OnChange = Busca_Voucher
        Items.Strings = (
          ''
          'S'
          'N')
      end
      object JvDateEdit_Termino: TJvDateEdit
        Left = 640
        Top = 21
        Width = 94
        Height = 21
        Hint = 'Realiza filtro pela data de Aplica'#231#227'o.'
        ButtonFlat = False
        CheckOnExit = True
        Ctl3D = False
        DialogTitle = 'Selecione a data'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        NumGlyphs = 2
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Weekends = [Sun, Sat]
        TabOrder = 7
        OnChange = Busca_Voucher
      end
      object JvDateEdit_inicio: TJvDateEdit
        Left = 640
        Top = 0
        Width = 94
        Height = 21
        Hint = 'Realiza filtro pela data de Aplica'#231#227'o.'
        ButtonFlat = False
        CheckOnExit = True
        Ctl3D = False
        DialogTitle = 'Selecione a data'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        NumGlyphs = 2
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Weekends = [Sun, Sat]
        TabOrder = 8
        OnChange = Busca_Voucher
      end
      object ComboBox_Usuario: TComboBox
        Left = 734
        Top = 0
        Width = 106
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        Style = csDropDownList
        CharCase = ecUpperCase
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 9
        OnChange = Busca_Voucher
        Items.Strings = (
          ''
          'PRATA'
          'OURO')
      end
      object ComboBox_expirou: TComboBox
        Left = 840
        Top = 0
        Width = 45
        Height = 21
        BevelInner = bvSpace
        BevelKind = bkFlat
        Style = csDropDownList
        CharCase = ecUpperCase
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 10
        OnChange = Busca_Voucher
        Items.Strings = (
          ''
          'S'
          'N')
      end
    end
    object JvCaptionPanel_FichaHospede: TJvCaptionPanel
      Left = 292
      Top = 122
      Width = 589
      Height = 463
      Buttons = []
      Caption = 'Ficha do Hospede'
      CaptionColor = 16697257
      CaptionPosition = dpTop
      CaptionFont.Charset = ANSI_CHARSET
      CaptionFont.Color = clBlack
      CaptionFont.Height = -16
      CaptionFont.Name = 'Arial'
      CaptionFont.Style = []
      Color = 14211288
      OutlookLook = False
      TabOrder = 2
      object JvGradient1: TJvGradient
        Left = 1
        Top = 33
        Width = 573
        Height = 415
        Align = alClient
        Style = grVertical
        StartColor = 16703181
        EndColor = 16773864
        Steps = 35
      end
      object Label1: TLabel
        Left = 16
        Top = 61
        Width = 92
        Height = 20
        Caption = 'Identidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label2: TLabel
        Left = 16
        Top = 90
        Width = 90
        Height = 20
        Caption = 'CPF..........:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label3: TLabel
        Left = 16
        Top = 117
        Width = 138
        Height = 20
        Caption = 'Nome Completo.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label4: TLabel
        Left = 16
        Top = 148
        Width = 151
        Height = 20
        Caption = 'Posto/Gradua'#231#227'o.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label5: TLabel
        Left = 16
        Top = 237
        Width = 143
        Height = 20
        Caption = 'Tel. Funcional.....:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label6: TLabel
        Left = 16
        Top = 266
        Width = 146
        Height = 20
        Caption = 'Tel. Celular..........:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label7: TLabel
        Left = 16
        Top = 209
        Width = 143
        Height = 20
        Caption = 'Tel. Residencial..:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label8: TLabel
        Left = 16
        Top = 178
        Width = 143
        Height = 20
        Caption = 'Nome de Guerra.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label9: TLabel
        Left = 16
        Top = 295
        Width = 100
        Height = 20
        Caption = 'Residencia.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label10: TLabel
        Left = 16
        Top = 323
        Width = 83
        Height = 20
        Caption = 'N'#250'mero...:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label11: TLabel
        Left = 16
        Top = 351
        Width = 64
        Height = 20
        Caption = 'Bairro..:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label12: TLabel
        Left = 16
        Top = 379
        Width = 67
        Height = 20
        Caption = 'Cidade.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label13: TLabel
        Left = 16
        Top = 413
        Width = 60
        Height = 20
        Caption = 'Email..:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label14: TLabel
        Left = 432
        Top = 379
        Width = 34
        Height = 20
        Caption = 'UF..:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object SpeedButton_fechar_Consulta_Hospede: TSpeedButton
        Left = 456
        Top = 40
        Width = 80
        Height = 56
        Caption = 'Fechar'
        Flat = True
        Glyph.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C4C4C400CCCC
          CC00C9C9C900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00C1C1C100D4D3D300A2A09F003E39
          37005C595700D3D3D300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00C6C6C600C5C5C500C0BEBD0023212100182022002F5E
          710047687B00605D5B00C9C9C900FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00C1C1C100D6D6D6008D8B8B005754520000040A00375D6C0041819C003E7B
          940055788D00534F4D00CACACA00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C1C1
          C100C9C8C8001E171400212627002753660042839B005890AE00528DA8003C7D
          960054768B00615C5A00E1E1E100CECECE00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D1D1
          D000040404003D6E82004684A00046809A00548AA5004574950037627E00376B
          83006385980000000000000000002F2F2F00CECECE00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2D1
          D0000E1010004A8DAA005286A500497896004E7E99004677970038648000366B
          84006F8B9800000000000808080038383800CECECE00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2D1
          D0000E101000538EAB004A79990037658200427288004477950039627E003769
          82006E8B9800000000000808080038383800CECECE00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2D1
          D0000E1010004F8CA800497A98003A6784003D72880045769500327892002F7C
          9100708FA400000000000808080038383800CECECE00CDCDCD00C7C7C700FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2D1
          D0000E1011004B8AA300467995003B688600376A82003558720018A0AC0022AE
          BD00718A9F0000000000080808003A3A3A00EAEAEB002A2B2C0078787800CCCC
          CC00C4C4C400C1C1C100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2D1
          D0000F1011004387A3003C718D0037627E003A738A005D8AAA003AA8BC002494
          A500718CA100000000000B0B0B0035353700434141004C453D0036373900A6A6
          A7009B9B9C00B4B4B400C1C1C100FF00FF00FF00FF00FF00FF00FF00FF00D2D1
          D0000F11110041849E0045769000467790005591AC0044739300385D7A003866
          7F006F90A400000000000D100F00010300007C705A007B6B5C0026211D001E19
          150001000000696A6A00C8C8C800FF00FF00FF00FF00FF00FF00FF00FF00D2D1
          D0000E1010004F8CA9004F80A0003F6F8D004B7B96004777970038648000366B
          83006E90A4000400000002010400B1A17E00A997760093866C00897968007B6D
          5E003C3730006C6D6E00C8C8C800FF00FF00FF00FF00FF00FF00FF00FF00D2D1
          D0000E101000538DAB004B7A9A0038668300407186004477940038648000366B
          83006E90A300040000001E1720000F0D0900A5947400A1907000746A5200776B
          5100433A270065666800C8C8C800FF00FF00FF00FF00FF00FF00FF00FF00D2D1
          D0000E1010004D8BA600477997003A6784003B72890043789700396481003569
          82006E90A300040000001D161D002223250043413B0094846400191C21007678
          7A006E6F7000A5A5A500C2C2C200FF00FF00FF00FF00FF00FF00FF00FF00D2D1
          D0000E1011004A8AA400457996003B68860038688000335F7600346279003B78
          91006F91A600030000001A1A1A003B3B3B00DBDBDD000E0E0E0065656500D2D2
          D200C7C7C700C2C2C200FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2D1
          D0000F1011004386A100396A840036607B003B6F86003B778F004F87A0006FA6
          C1005F7481000E100A001A1A1A0036363600D0D0D000CFCFCF00C9C9C900FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2D1
          D0000F11120043819B003A708700386F8600427F980075A5BF007799AE004B4D
          5A00222821001E271E00181F180036363600CECECE00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2D1
          D0000E1011003F7F99004D859E006C9DB6007C97AB00474B520025201D002B2B
          29002F272E00322A32001F211F0036353600CECECE00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D1D0
          D000020406007DB6D400728FA2004D575E002F2C2B002D2C2B00313131003131
          310031313100313231002A272A0032323200CECECE00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C3C3
          C300AEAEAE00070809000F0E0E000A0907000E0E0D000E0E0E000E0E0E000E0E
          0E000E0E0E000F0F0F000808080043434300CCCCCC00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00C3C3C300D1D0D000D1D1D100D2D2D200D2D2D200D2D2D200D2D2D200D2D2
          D200D2D2D200D2D2D200D2D2D200CCCCCC00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        Layout = blGlyphTop
        OnClick = SpeedButton_fechar_Consulta_HospedeClick
      end
      object DBText1: TDBText
        Left = 110
        Top = 63
        Width = 211
        Height = 17
        DataField = 'IDENTIDADE'
        DataSource = DST_Hospede
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object DBText2: TDBText
        Left = 111
        Top = 88
        Width = 194
        Height = 17
        DataField = 'CPF'
        DataSource = DST_Hospede
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object DBText3: TDBText
        Left = 157
        Top = 117
        Width = 412
        Height = 17
        DataField = 'NOME'
        DataSource = DST_Hospede
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object DBText4: TDBText
        Left = 171
        Top = 150
        Width = 174
        Height = 17
        DataField = 'POSTO'
        DataSource = DST_Hospede
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object DBText5: TDBText
        Left = 168
        Top = 178
        Width = 201
        Height = 17
        DataField = 'NOME_GUERRA'
        DataSource = DST_Hospede
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object DBText6: TDBText
        Left = 165
        Top = 210
        Width = 124
        Height = 17
        DataField = 'TELEFONE_RESIDENCIAL'
        DataSource = DST_Hospede
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object DBText7: TDBText
        Left = 165
        Top = 237
        Width = 124
        Height = 17
        DataField = 'TELEFONE_FUNCIONAL'
        DataSource = DST_Hospede
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object DBText8: TDBText
        Left = 165
        Top = 266
        Width = 124
        Height = 17
        DataField = 'TELEFONE_CELULAR'
        DataSource = DST_Hospede
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object DBText9: TDBText
        Left = 121
        Top = 295
        Width = 447
        Height = 17
        DataField = 'RESIDENCIA'
        DataSource = DST_Hospede
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object DBText10: TDBText
        Left = 101
        Top = 322
        Width = 124
        Height = 17
        DataField = 'NUMERO'
        DataSource = DST_Hospede
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object DBText11: TDBText
        Left = 83
        Top = 351
        Width = 449
        Height = 17
        DataField = 'BAIRRO'
        DataSource = DST_Hospede
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object DBText12: TDBText
        Left = 91
        Top = 379
        Width = 318
        Height = 17
        DataField = 'CIDADE'
        DataSource = DST_Hospede
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object DBText13: TDBText
        Left = 475
        Top = 379
        Width = 46
        Height = 17
        DataField = 'ESTADO'
        DataSource = DST_Hospede
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object DBText14: TDBText
        Left = 80
        Top = 414
        Width = 489
        Height = 17
        DataField = 'EMAIL'
        DataSource = DST_Hospede
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = True
      end
      object Panel1: TPanel
        Left = 1
        Top = 25
        Width = 573
        Height = 8
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object JvGradientCaption1: TJvGradientCaption
          Left = 0
          Top = 0
          Width = 573
          Height = 8
          GradientStartColor = 16697257
          GradientEndColor = 16697257
          GradientStyle = grHorizontal
          LabelCaption = 'Put your text here ...'
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWhite
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          LabelAlignment = taLeftJustify
          Align = alClient
          BevelInner = bvNone
          Ctl3D = False
          DoubleBuffered = False
          TabOrder = 0
        end
      end
    end
  end
  object ToolBar2: TToolBar
    Left = 0
    Top = 0
    Width = 1187
    Height = 49
    AutoSize = True
    ButtonHeight = 47
    ButtonWidth = 77
    Caption = 'Inserir'
    Color = 16766640
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Images = DM.ImageList_Principal
    Indent = 5
    ParentColor = False
    ParentFont = False
    ShowCaptions = True
    TabOrder = 1
    object ToolButton_Hospedar: TToolButton
      Left = 5
      Top = 0
      Hint = 'Cadastra um novo h'#243'spede'
      AutoSize = True
      Caption = 'Informa'#231#245'es'
      ImageIndex = 3
      OnClick = ToolButton_HospedarClick
    end
    object ToolButton2: TToolButton
      Left = 86
      Top = 0
      Width = 5
      Caption = 'ToolButton2'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 91
      Top = 0
      Caption = 'Excel'
      ImageIndex = 2
      OnClick = ToolButton1Click
    end
    object ToolButton3: TToolButton
      Left = 168
      Top = 0
      Width = 5
      Caption = 'ToolButton3'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton_Windows: TToolButton
      Left = 173
      Top = 0
      Hint = 'Retorna para o Windows'
      AutoSize = True
      Caption = 'Windows'
      ImageIndex = 1
      OnClick = ToolButton_WindowsClick
    end
  end
  object Query_Voucher: TQuery
    Active = True
    DatabaseName = 'hotel1'
    SQL.Strings = (
      
        'select vo.FICHA, vo.ANO, vo.TIPO, vo.CONTROLE, vo.TERMO, vo.DATA' +
        'CADASTRO, vo.USUARIOCADASTRO, vo.EXPIROU, '
      
        '       vo.DATAEXPIRACAO, vo.USUARIOEXPIRACAO, vo.EXTRAVIO, vo.DA' +
        'TAEXTRAVIO, vo.DATACANCELAMENTOSI, vo.USUARIOEXTRAVIO,'
      '       vv.Posto, vv.nome '
      'From Voucher vo, Voucher_View vv'
      'Where vo.FICHA = vv.FICHA'
      'and   vo.ANO = vv.ANO')
    Left = 704
    Top = 48
  end
  object DSQ_Voucher: TDataSource
    DataSet = Query_Voucher
    Left = 751
    Top = 53
  end
  object Table_hospede: TTable
    DatabaseName = 'hotel1'
    IndexFieldNames = 'NOME;POSTO'
    MasterFields = 'NOME;POSTO'
    MasterSource = DSQ_Voucher
    TableName = 'HOSPEDE'
    Left = 712
    Top = 99
    object Table_hospedeIDENTIDADE: TStringField
      FieldName = 'IDENTIDADE'
      Required = True
      FixedChar = True
      Size = 12
    end
    object Table_hospedeCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object Table_hospedeNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object Table_hospedePOSTO: TStringField
      FieldName = 'POSTO'
      Size = 30
    end
    object Table_hospedeNOME_GUERRA: TStringField
      FieldName = 'NOME_GUERRA'
      Size = 15
    end
    object Table_hospedeOM_ORIGEM: TStringField
      FieldName = 'OM_ORIGEM'
      EditMask = '(99) 9999-9999;0; '
    end
    object Table_hospedeTELEFONE_RESIDENCIAL: TStringField
      FieldName = 'TELEFONE_RESIDENCIAL'
      EditMask = '(99) 9999-9999;0; '
      Size = 15
    end
    object Table_hospedeTELEFONE_FUNCIONAL: TStringField
      FieldName = 'TELEFONE_FUNCIONAL'
      EditMask = '(99) 9999-9999;0; '
      Size = 15
    end
    object Table_hospedeTELEFONE_CELULAR: TStringField
      FieldName = 'TELEFONE_CELULAR'
      EditMask = '(99) 99999-9999;0; '
      Size = 15
    end
    object Table_hospedeRESIDENCIA: TStringField
      FieldName = 'RESIDENCIA'
      Size = 40
    end
    object Table_hospedeNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 10
    end
    object Table_hospedeCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 40
    end
    object Table_hospedeBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 40
    end
    object Table_hospedeESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object Table_hospedeEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
  end
  object DST_Hospede: TDataSource
    DataSet = Table_hospede
    Left = 751
    Top = 101
  end
  object Query_Executa: TQuery
    DatabaseName = 'hotel1'
    SQL.Strings = (
      'select Distinct UsuarioCadastro'
      'From Voucher vo')
    Left = 912
    Top = 8
  end
end
