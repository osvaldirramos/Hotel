�
 TFORM_ESTATISTICA 0�  TPF0TForm_EstatisticaForm_EstatisticaLeftMTop� Width�Height�BorderIcons Caption Sis-Hotel --> Dados EstatisticosColorclSilverFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 	Icon.Data
�             �     (       @         �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ���  �����7w{�����  ����ffffg����  ���vfffffc���  ���fffffff{��  ��ffffffffg��  ��fffffffff��  �vwwwwwwwwvk�  �ffx�wwx�wfc�  �ffgwwwwwfff�  �ffDwwwwtFff�  6fdDGwwwDDff;  vfDDDwwtDDFf{  vfDDDH?DDDFf{  vfDDWwEETDFf{  vfw��utwt�Ff{  vfw�G���t�Vf{  vfTDDwwxEGvf{  vfUDWTwtDDFf{  vfEDDH�DDDFf{  vfdDDDtDDDff{  vfdDDGUDDDff{  vffDDG�DDFff{  vffdDH�DDfff{  vfffdGwDffff{  vfffffffffff{  �33333333333�  tGDDDDDDDDDD{  t[DDGuwwt�wD{  ww�DDDDDDDDD{  ;w{W�wwXWwxw{  tDDtDDDDDDDD{  ������������� �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  OldCreateOrder	PositionpoScreenCenter
OnActivateFormActivatePixelsPerInchx
TextHeight 
TStatusBar	StatusBarLeft Top�Width�HeightPanels ParentShowHintShowHint	SimplePanel	
SimpleText   Selecione a opção desejada.  TDBChartDBChart1Left ToprWidth�Height5BackWall.Brush.ColorclWhiteBackWall.Brush.StylebsClearGradient.EndColor��@ Gradient.Visible	Title.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclBlueTitle.Font.Height�Title.Font.NameArialTitle.Font.StylefsBoldfsItalic Title.Text.Strings   Ocupação do Hotel LeftAxis.AxisValuesFormat##0LeftAxis.LabelsSeparationLeftAxis.LabelStyletalValueLeftAxis.MinorTickCount LeftAxis.MinorTickLength LeftAxis.TickLength LeftAxis.Title.Caption   Numero Máximo de OcupantesLegend.ColorWidthLegend.TextStyle	ltsXValueLegend.TopPosRightAxis.AxisValuesFormat##0RightAxis.Logarithmic	AlignalClient
BevelInner	bvLoweredBorderStylebsSingleTabOrder 
TBarSeriesSeries1ColorEachPoint	Marks.ArrowLengthMarks.Visible
DataSourceIBQuery_EstatisticaPercentFormat##0,## %SeriesColorclRedShowInLegendTitle	OcupantesValueFormat###XLabelsSourceSITUACAOXValues.DateTimeXValues.NameXXValues.Multiplier       ��?XValues.OrderloAscendingYValues.DateTimeYValues.NameBarYValues.Multiplier       ��?YValues.OrderloNoneYValues.ValueSourceVALOR   TPanelPanel4Left Top4Width�Height>AlignalTop
BevelInner	bvLowered
BevelWidthTabOrder 	TGroupBox	GroupBox1LeftTop	Width`Height(Caption Cursos TabOrder  TLabelLabel_CursoLeft	TopWidthLHeight	AlignmenttaRightJustifyAutoSizeCaptionLabel_CursoColor	clSkyBlueParentColor   	TGroupBox	GroupBox2Left� Top	Width`Height(Caption  Transito TabOrder TLabelLabel_TransitoLeft	TopWidthLHeight	AlignmenttaRightJustifyAutoSizeCaptionLabel_CursoColor	clSkyBlueParentColor   	TGroupBox	GroupBox3Left Top	Width`Height(Caption
 ResidenteTabOrder TLabelLabel_ResidenteLeft	TopWidthLHeight	AlignmenttaRightJustifyAutoSizeCaptionLabel_CursoColor	clSkyBlueParentColor   	TGroupBox	GroupBox4Left0Top	Width`Height(Caption Outros TabOrder TLabelLabel_OutrosLeft	TopWidthLHeight	AlignmenttaRightJustifyAutoSizeCaptionLabel_CursoColor	clSkyBlueParentColor   	TGroupBox	GroupBox5Left�Top	Width`Height(Caption Dependente TabOrder TLabelLabel_DependenteLeft	TopWidthLHeight	AlignmenttaRightJustifyAutoSizeCaptionLabel_CursoColor	clSkyBlueParentColor    TToolBarToolBar2Left Top Width�Height4ButtonHeight/ButtonWidthGCaptionfColor	clBtnFaceEdgeBordersebTopebBottom Flat	ImagesDM.ImageList_PrincipalIndentParentColorParentShowHintShowCaptions	ShowHint	TabOrderTransparent	 TToolButtonToolButton_RetornarLeftTop HintRetorna para janela anterior.Caption	&Retornar
ImageIndexOnClickToolButton_RetornarClick  TToolButtonToolButton_WindowsLeftVTop HintRetorna para o WindowsCaption&Windows
ImageIndexOnClickToolButton_WindowsClick  TToolButtonToolButton_AjudaLeft� Top CaptionAjudaDropdownMenuDM.PopupMenu_Ajuda
ImageIndexStyletbsDropDown   TDataSourceDST_HospedeDataSetIBTable_HospedeLeft� Top   TDataSourceDST_EstatisticaDataSetIBTable_EstatisticaLeft� Topp  TDataSourceDSQ_HospedagemDataSetIBQuery_HospedagemLeft� Top�   TIBTableIBTable_EstatisticaDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelActive	BufferChunks�CachedUpdates	FieldDefsNameCODIGO
Attributes
faRequired DataType
ftSmallint NameSITUACAODataTypeftStringSize NameVALORDataTypeftBCD	Precision	Size  	IndexDefsNameESTATISTICA_PKFieldsCODIGOOptionsixUnique   	StoreDefs		TableNameESTATISTICALeft� Topp TSmallintFieldIBTable_EstatisticaCODIGO	FieldNameCODIGO  TIBStringFieldIBTable_EstatisticaSITUACAO	FieldNameSITUACAOSize  TIBBCDFieldIBTable_EstatisticaVALOR	FieldNameVALOR	Precision	Size   TIBQueryIBQuery_EstatisticaDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelActive	BufferChunks�CachedUpdatesSQL.StringsSelect * from  EstatisticaOrder By Codigo Left� Topv TSmallintFieldIBQuery_EstatisticaCODIGO	FieldNameCODIGOOriginESTATISTICA.CODIGORequired	  TIBStringFieldIBQuery_EstatisticaSITUACAO	FieldNameSITUACAOOriginESTATISTICA.SITUACAOSize  TIBBCDFieldIBQuery_EstatisticaVALOR	FieldNameVALOROriginESTATISTICA.VALOR	Precision	Size   TIBTableIBTable_HospedeDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelActive	BufferChunks�CachedUpdates	FieldDefsName
IDENTIDADE
Attributes
faRequiredfaFixed DataTypeftStringSize NameNOME
Attributes
faRequired DataTypeftStringSize( NameNOME_GUERRA
Attributes
faRequired DataTypeftStringSize NamePOSTODataTypeftStringSize NameDEPENDENTE_DEDataTypeftStringSize NameNACIONALIDADE
Attributes
faRequired DataTypeftStringSize NameTELEFONE_RESIDENCIALDataTypeftStringSize
 NameTELEFONE_FUNCIONALDataTypeftStringSize
 NameSITUACAO_CURSODataTypeftStringSize
 Name
RESIDENCIADataTypeftStringSize( NameNUMERODataTypeftStringSize
 NameCIDADEDataTypeftStringSize( NameBAIRRODataTypeftStringSize( NameESTADODataTypeftStringSize Name	OM_ORIGEMDataTypeftStringSize NameSITUACAO
AttributesfaFixed DataTypeftStringSize NameOBSDataTypeftStringSize2  	IndexDefsNameHOSPEDE_ID_PKFields
IDENTIDADEOptionsixUnique   IndexFieldNames
IDENTIDADEMasterFields
IDENTIDADEMasterSourceDSQ_Hospedagem	StoreDefs		TableNameHOSPEDELeft� Top  TIBStringFieldIBTable_HospedeIDENTIDADE	FieldName
IDENTIDADESize  TIBStringFieldIBTable_HospedeSITUACAO_CURSO	FieldNameSITUACAO_CURSOSize
   TIBQueryIBQuery_HospedagemDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelActive	BufferChunks�CachedUpdatesSQL.StringsSelect * from Hospedagem Left� Top�  TIBStringFieldIBQuery_HospedagemIDENTIDADE	FieldName
IDENTIDADEOriginHOSPEDAGEM.IDENTIDADERequired		FixedChar	Size  TIBStringFieldIBQuery_HospedagemFICHA	FieldNameFICHAOriginHOSPEDAGEM.FICHARequired		FixedChar	Size  TSmallintFieldIBQuery_HospedagemANO	FieldNameANOOriginHOSPEDAGEM.ANORequired	  TIBStringFieldIBQuery_HospedagemPREDIO	FieldNamePREDIOOriginHOSPEDAGEM.PREDIORequired		FixedChar	Size  TSmallintFieldIBQuery_HospedagemAPTO	FieldNameAPTOOriginHOSPEDAGEM.APTORequired	  TSmallintFieldIBQuery_HospedagemDEPENDENTE	FieldName
DEPENDENTEOriginHOSPEDAGEM.DEPENDENTE    