object Form_SelecaoReserva: TForm_SelecaoReserva
  Left = 270
  Top = 349
  Width = 454
  Height = 223
  Caption = 'Sis-Hotel --> Selciona per'#237'odo da Reserva'
  Color = clWindow
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar2: TToolBar
    Left = 0
    Top = 0
    Width = 436
    Height = 52
    ButtonHeight = 44
    ButtonWidth = 57
    Caption = 'f'
    Color = 16766640
    EdgeBorders = [ebTop, ebBottom]
    Images = DM.ImageList_Principal
    Indent = 15
    ParentColor = False
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 0
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
      Left = 72
      Top = 2
      Hint = 'Retorna para janela anterior.'
      Caption = '&Retornar'
      ImageIndex = 2
      OnClick = ToolButton_RetornarClick
    end
    object ToolButton_Windows: TToolButton
      Left = 129
      Top = 2
      Hint = 'Retorna para o Windows'
      Caption = '&Windows'
      ImageIndex = 3
      OnClick = ToolButton_WindowsClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 52
    Width = 436
    Height = 130
    Align = alClient
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = 16766640
    TabOrder = 1
    object Label_Inicio: TLabel
      Left = 16
      Top = 28
      Width = 31
      Height = 13
      Caption = 'Inicio.:'
    end
    object Label_Final: TLabel
      Left = 198
      Top = 28
      Width = 44
      Height = 13
      Caption = 'T'#233'rmino.:'
    end
    object JvDateEdit_Inicio: TJvDateEdit
      Left = 57
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
      Left = 249
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
    object CheckBox_Predio: TCheckBox
      Left = 16
      Top = 56
      Width = 185
      Height = 17
      Caption = 'Organizar Por Pr'#233'dio / Apto'
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = CheckBox_PredioClick
    end
    object CheckBox_Nome: TCheckBox
      Left = 16
      Top = 74
      Width = 153
      Height = 17
      Caption = 'Organizar por Nome'
      TabOrder = 3
      OnClick = CheckBox_NomeClick
    end
    object CheckBox_Data: TCheckBox
      Left = 16
      Top = 91
      Width = 185
      Height = 17
      Caption = 'Organizar por Data'
      TabOrder = 4
      OnClick = CheckBox_DataClick
    end
  end
  object Query_Reserva: TQuery
    Active = True
    DatabaseName = 'hotel1'
    SQL.Strings = (
      'Select  *'
      ' from reserva '
      'order by nome, DataEntrada')
    Left = 275
    Top = 5
    object Query_ReservaDATAENTRADA: TDateTimeField
      FieldName = 'DATAENTRADA'
      Origin = 'HOTEL1.RESERVA.DATAENTRADA'
    end
    object Query_ReservaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'HOTEL1.RESERVA.NOME'
      Size = 40
    end
    object Query_ReservaNOME_GUERRA: TStringField
      FieldName = 'NOME_GUERRA'
      Origin = 'HOTEL1.RESERVA.NOME_GUERRA'
      Size = 15
    end
    object Query_ReservaPOSTO: TStringField
      FieldName = 'POSTO'
      Origin = 'HOTEL1.RESERVA.POSTO'
      Size = 30
    end
    object Query_ReservaDEPENDENTE_DE: TStringField
      FieldName = 'DEPENDENTE_DE'
      Origin = 'HOTEL1.RESERVA.DEPENDENTE_DE'
      Size = 30
    end
    object Query_ReservaTELEFONE_FUNCIONAL: TStringField
      FieldName = 'TELEFONE_FUNCIONAL'
      Origin = 'HOTEL1.RESERVA.TELEFONE_FUNCIONAL'
      Size = 10
    end
    object Query_ReservaSITUACAO_CURSO: TStringField
      FieldName = 'SITUACAO_CURSO'
      Origin = 'HOTEL1.RESERVA.SITUACAO_CURSO'
      Size = 10
    end
    object Query_ReservaOM_ORIGEM: TStringField
      FieldName = 'OM_ORIGEM'
      Origin = 'HOTEL1.RESERVA.OM_ORIGEM'
    end
    object Query_ReservaDEPENDENTE: TFloatField
      FieldName = 'DEPENDENTE'
      Origin = 'HOTEL1.RESERVA.DEPENDENTE'
    end
    object Query_ReservaDATASAIDA: TDateTimeField
      FieldName = 'DATASAIDA'
      Origin = 'HOTEL1.RESERVA.DATASAIDA'
    end
    object Query_ReservaPREDIO: TStringField
      FieldName = 'PREDIO'
      Origin = 'HOTEL1.RESERVA.PREDIO'
      FixedChar = True
      Size = 1
    end
    object Query_ReservaAPTO: TFloatField
      FieldName = 'APTO'
      Origin = 'HOTEL1.RESERVA.APTO'
    end
  end
  object DSQ_Reserva: TDataSource
    DataSet = Query_Reserva
    Left = 320
    Top = 8
  end
end
