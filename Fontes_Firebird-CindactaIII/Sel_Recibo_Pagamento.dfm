�
 TFORM_RECIBO_PAGAMENTO 0u  TPF0TForm_Recibo_PagamentoForm_Recibo_PagamentoLeft� Top� WidthBHeight�BorderIconsbiSystemMenu
biMinimize
biMaximizebiHelp CaptionSis-Hotel --> Recibo PagamentoColor	clBtnFace
ParentFont		Icon.Data
�             �     (       @         �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ���  �����7w{�����  ����ffffg����  ���vfffffc���  ���fffffff{��  ��ffffffffg��  ��fffffffff��  �vwwwwwwwwvk�  �ffx�wwx�wfc�  �ffgwwwwwfff�  �ffDwwwwtFff�  6fdDGwwwDDff;  vfDDDwwtDDFf{  vfDDDH?DDDFf{  vfDDWwEETDFf{  vfw��utwt�Ff{  vfw�G���t�Vf{  vfTDDwwxEGvf{  vfUDWTwtDDFf{  vfEDDH�DDDFf{  vfdDDDtDDDff{  vfdDDGUDDDff{  vffDDG�DDFff{  vffdDH�DDfff{  vfffdGwDffff{  vfffffffffff{  �33333333333�  tGDDDDDDDDDD{  t[DDGuwwt�wD{  ww�DDDDDDDDD{  ;w{W�wwXWwxw{  tDDtDDDDDDDD{  ������������� �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  OldCreateOrder	PositionpoScreenCenter
OnActivate
FormCreatePixelsPerInchx
TextHeight TPanelPanel1Left Top�Width:Height� AlignalBottomTabOrder  
TStatusBar
StatusBar1LeftTop� Width8HeightPanels SimplePanel	
SimpleText-   Selecione o o apartamento que será descupado  	TGroupBoxGroupBox_Busca_Por_NomeLeft	TopUWidthHHeight<Caption Busca por nome TabOrder 	TMaskEditMaskEdit_Busca_NomeLeftTopWidth#HeightCharCaseecUpperCaseColorclInfoBkTabOrder OnChangeMaskEdit_Busca_NomeChange   	TGroupBox	GroupBox1Left	TopWidth� Height<Caption   Número Recibo: TabOrder 	TMaskEditMaskEdit_ReciboLeftTopWidthRHeightEditMask
999999;0; Font.CharsetDEFAULT_CHARSET
Font.ColorclMaroonFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 	MaxLength
ParentFontTabOrder    	TGroupBox	GroupBox2Left� TopWidth� Height<Caption Data  Recebimento: TabOrder TDateTimePickerDateTimePicker_RecebimentoLeftTopWidthiHeightDate ��l/d�@Time ��l/d�@TabOrder    TPanelPanel4LeftaTopWidth� Height
BevelInnerbvRaised
BevelOuter	bvLoweredBorderWidthFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTabOrder TToolBarToolBar4LeftTopWidth� Height\AutoSize	ButtonHeightButtonWidth� CaptionToolBar1EdgeBorders Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style ImagesDM.ImageList_PrincipalList	
ParentFontShowCaptions	TabOrder  TToolButtonToolButton_Cheque_PPLeft TopHint,Faz fechamento da conta paga com cheque P/P.Caption&Cheque Recebido
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_Cheque_PPClick  TToolButtonToolButton_RetornarLeft Top HintRetorna para Menu PrincipalCaption             &Retornar           
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_RetornarClick  TToolButtonToolButton_WindowsLeft Top>Hint&Sai do sistema e retorna para Windows.Caption           Windows
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_WindowsClick   TDBNavigatorDBNavigator_HospedeLeftTopWidth� HeightVisibleButtonsnbFirstnbPriornbNextnbLast AlignalTopCtl3DHints.Strings   Primeiro Hóspede   Hóspede Anterior   Hóspede Seguinte   Último Hóspede ParentCtl3DParentShowHintShowHint	TabOrder    TPanelPanel2Left Top Width:Height/AlignalTop
BevelOuterbvNoneTabOrder TLabelLabel_Fecha_ocupacaoLeftPTop	Width�HeightCaptionRecebimento de Cheque PredatadoFont.CharsetDEFAULT_CHARSET
Font.ColorclMaroonFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont   TDBGridDBGrid_HospedeLeft Top/Width:Height�AlignalClient
DataSourceDSQ_HospedeFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgMultiSelect 
ParentFontReadOnly	TabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclMaroonTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style ColumnsExpanded	FieldNameFICHATitle.AlignmenttaCenterWidth4Visible	 Expanded	FieldName
IDENTIDADETitle.AlignmenttaCenterWidth_Visible	 Expanded	FieldNameNOMETitle.AlignmenttaCenterVisible	 Expanded	FieldNameNCHEQUETitle.AlignmenttaCenterWidth[Visible	    TDataSourceDSQ_HospedeDataSetIBQuery_HospedeLeft`TopX  TIBQueryIBQuery_HospedeDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdatesSQL.Strings=Select a.identidade, b.identidade, b.nome, a.Ficha, a.nchequefrom Historico a, hospede b!where b.identidade = a.identidadeand  a.ano = '2003'and a.Recebido = 'P' Left8TopX TIBStringFieldIBQuery_HospedeIDENTIDADE	FieldName
IDENTIDADEOriginHISTORICO.IDENTIDADERequired		FixedChar	Size  TIBStringFieldIBQuery_HospedeIDENTIDADE1	FieldNameIDENTIDADE1OriginHOSPEDE.IDENTIDADERequired		FixedChar	Size  TIBStringFieldIBQuery_HospedeNOME	FieldNameNOMEOriginHOSPEDE.NOMERequired	Size(  TIBStringFieldIBQuery_HospedeFICHA	FieldNameFICHAOriginHISTORICO.FICHARequired	Size  TIBStringFieldIBQuery_HospedeNCHEQUE	FieldNameNCHEQUEOriginHISTORICO.NCHEQUESize   TIBTableIBTable_HistoricoDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdates	FieldDefsName
IDENTIDADE
Attributes
faRequiredfaFixed DataTypeftStringSize NameFICHA
Attributes
faRequired DataTypeftStringSize NameANO
Attributes
faRequired DataType
ftSmallint NamePREDIO
AttributesfaFixed DataTypeftStringSize NameAPTODataType
ftSmallint NameDATAENTRADADataTypeftStringSize NameHORAENTRADADataTypeftStringSize Name	DATASAIDADataTypeftStringSize NameDATAPAGAMENTODataTypeftStringSize NameNRECIBODataTypeftStringSize NameBANCODataTypeftStringSize
 NameNCHEQUEDataTypeftStringSize NamePRACADataTypeftStringSize Name	VALORPAGODataTypeftBCD	Precision	Size NameCUSTO_TELEFONEDataTypeftBCD	Precision	Size NameUSUARIO_ENTRADADataTypeftStringSize
 NameSITUACAO_CURSODataTypeftStringSize
 NameUSUARIO_SAIDADataTypeftStringSize
 NameTIPO_FECHAMENTO
AttributesfaFixed DataTypeftStringSize NameRECEBIDO
AttributesfaFixed DataTypeftStringSize NameOBSDataTypeftStringSize�  NameHORA_OPERACAODataTypeftStringSize NameDATA_OPERACAODataType
ftDateTime  	IndexDefsNameHISTORICO_ID_PKFieldsIDENTIDADE;FICHA;ANOOptionsixUnique   IndexFieldNamesIDENTIDADE;FICHAMasterFieldsIDENTIDADE1;FICHAMasterSourceDSQ_Hospede	StoreDefs		TableName	HISTORICOLeft8Topx   