�
 TFORM_DESOCUPACAO 0  TPF0TForm_DesocupacaoForm_DesocupacaoLeftTopCWidth_HeightXBorderIconsbiSystemMenu
biMinimize
biMaximizebiHelp Caption    Sis-Hotel --> Fecha a OcupaçãoColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 	Icon.Data
�             �     (       @         �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ���  �����7w{�����  ����ffffg����  ���vfffffc���  ���fffffff{��  ��ffffffffg��  ��fffffffff��  �vwwwwwwwwvk�  �ffx�wwx�wfc�  �ffgwwwwwfff�  �ffDwwwwtFff�  6fdDGwwwDDff;  vfDDDwwtDDFf{  vfDDDH?DDDFf{  vfDDWwEETDFf{  vfw��utwt�Ff{  vfw�G���t�Vf{  vfTDDwwxEGvf{  vfUDWTwtDDFf{  vfEDDH�DDDFf{  vfdDDDtDDDff{  vfdDDGUDDDff{  vffDDG�DDFff{  vffdDH�DDfff{  vfffdGwDffff{  vfffffffffff{  �33333333333�  tGDDDDDDDDDD{  t[DDGuwwt�wD{  ww�DDDDDDDDD{  ;w{W�wwXWwxw{  tDDtDDDDDDDD{  ������������� �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  OldCreateOrder	
OnActivateFormActivatePixelsPerInchx
TextHeight TPanelPanel1Left Top WidthWHeight)AlignalTop
BevelOuterbvNoneTabOrder  TLabelLabel_Fecha_ocupacaoLeftPTop	Width� HeightCaption   Fecha OcupaçãoFont.CharsetDEFAULT_CHARSET
Font.ColorclMaroonFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont   TPanelPanel3Left Top)WidthWHeight AlignalTop
BevelInnerbvRaised
BevelOuter	bvLoweredBorderWidthCaptionPanel3TabOrder TDBGridDBGrid_HospedeLeftTopWidthOHeightAlignalClientBorderStylebsNone
DataSourceDSQ_Apto_OcupadoFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgMultiSelect 
ParentFontReadOnly	TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclMaroonTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style Columns	AlignmenttaCenterExpanded	FieldNamePREDIOTitle.AlignmenttaCenterTitle.Caption   PRÉDIOVisible	 	AlignmenttaCenterExpanded	FieldNameAPTOTitle.AlignmenttaCenterVisible	 	AlignmenttaCenterExpanded	FieldNameCAMATitle.AlignmenttaCenterVisible	 Expanded	FieldName	APTCODIGOTitle.Caption
   SITUAÇÃOWidth^Visible	     
TStatusBar	StatusBarLeft TopWidthWHeightPanels SimplePanel	
SimpleText-   Selecione o o apartamento que será descupado  TPanel
Panel_NomeLeft TopIWidthWHeight0AlignalTopTabOrder TDBTextDBText1LeftTopWidthAHeight	DataFieldPOSTO
DataSourceDST_Hospede  TDBTextDBText2LeftTopWidthAHeight	DataFieldNOME_GUERRA
DataSourceDST_Hospede   TPanelPanel2LeftYTop�Width� Height
BevelInnerbvRaised
BevelOuter	bvLoweredBorderWidthFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTabOrder TToolBarToolBar4LeftTopWidth� Height\AutoSize	ButtonHeightButtonWidth� CaptionToolBar1EdgeBorders Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style ImagesDM.ImageList_PrincipalList	
ParentFontShowCaptions	TabOrder  TToolButtonToolButton_DesocuparLeft TopHint#Desocupa o apartamento seelcionado.Caption          &Desocupar
ImageIndex$ParentShowHintWrap	ShowHint	OnClickToolButton_DesocuparClick  TToolButtonToolButton_RetornarLeft Top HintRetorna para Menu PrincipalCaption             &Retornar           
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_RetornarClick  TToolButtonToolButton_WindowsLeft Top>Hint&Sai do sistema e retorna para Windows.Caption           Windows
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_WindowsClick   TDBNavigatorDBNavigator_HospedeLeftTopWidth� Height
DataSourceDSQ_Apto_OcupadoVisibleButtonsnbFirstnbPriornbNextnbLast AlignalTopCtl3DHints.Strings   Primeiro Hóspede   Hóspede Anterior   Hóspede Seguinte   Último Hóspede ParentCtl3DParentShowHintShowHint	TabOrder   TDataSourceDSQ_Apto_OcupadoDataSetIBQuery_Apto_OcupadoLeftxTopY  TDataSourceDST_HospedeDataSetIBTable_HospedeLeftxTopy  TDataSourceDataSource1DataSetIBTable_Apto_OcupadoLeftxTop�   TIBQueryIBQuery_Apto_OcupadoDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelActive	BufferChunks�CachedUpdatesSQL.StringsSelect * from aptoCama#where aptcodigo <> 'DESOCUPADO' andaptcodigo <> 'OCUPADO'  and   aptcodigo <> 'NÃO OCUPAR'  andaptcodigo <> 'DEP'  LeftXTopX TIBStringFieldIBQuery_Apto_OcupadoPREDIO	FieldNamePREDIOOriginAPTOCAMA.PREDIORequired		FixedChar	Size  TSmallintFieldIBQuery_Apto_OcupadoAPTO	FieldNameAPTOOriginAPTOCAMA.APTORequired	  TSmallintFieldIBQuery_Apto_OcupadoCAMA	FieldNameCAMAOriginAPTOCAMA.CAMARequired	  TIBStringFieldIBQuery_Apto_OcupadoAPTCODIGO	FieldName	APTCODIGOOriginAPTOCAMA.APTCODIGOSize  TIBStringFieldIBQuery_Apto_OcupadoNOME	FieldNameNOMEOriginAPTOCAMA.NOMESize   TIBTableIBTable_HospedeDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelActive	BufferChunks�CachedUpdates	FieldDefsName
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
IDENTIDADEMasterFields	APTCODIGOMasterSourceDSQ_Apto_Ocupado	StoreDefs		TableNameHOSPEDELeftXTopz TIBStringFieldIBTable_HospedeIDENTIDADE	FieldName
IDENTIDADERequired		FixedChar	Size  TIBStringFieldIBTable_HospedeNOME_GUERRA	FieldNameNOME_GUERRARequired	Size  TIBStringFieldIBTable_HospedePOSTO	FieldNamePOSTOSize   TIBTableIBTable_Apto_OcupadoDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelActive	BufferChunks�CachedUpdates	FieldDefsNamePREDIO
Attributes
faRequiredfaFixed DataTypeftStringSize NameAPTO
Attributes
faRequired DataType
ftSmallint NameCAMA
Attributes
faRequired DataType
ftSmallint Name	APTCODIGODataTypeftStringSize NameNOMEDataTypeftStringSize  	IndexDefsNameAPTOCAMA_ID_PKFieldsPREDIO;APTO;CAMAOptionsixUnique  NameAPTO_APTOCAMA_FKFieldsPREDIO;APTO  IndexFieldNames	APTCODIGOMasterFields	APTCODIGOMasterSourceDSQ_Apto_Ocupado	StoreDefs		TableNameAPTOCAMALeftXTop�    