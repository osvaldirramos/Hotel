�
 TFORM_EXCLUIR_HOSPEDE 0~1  TPF0TForm_Excluir_HospedeForm_Excluir_HospedeLeftTopaWidth�Height�BorderIconsbiSystemMenu
biMinimize
biMaximizebiHelp Caption(Sis-Hotel --> Cancelamento de HospedagemColor	clBtnFace
ParentFont		Icon.Data
�             �     (       @         �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ���  �����7w{�����  ����ffffg����  ���vfffffc���  ���fffffff{��  ��ffffffffg��  ��fffffffff��  �vwwwwwwwwvk�  �ffx�wwx�wfc�  �ffgwwwwwfff�  �ffDwwwwtFff�  6fdDGwwwDDff;  vfDDDwwtDDFf{  vfDDDH?DDDFf{  vfDDWwEETDFf{  vfw��utwt�Ff{  vfw�G���t�Vf{  vfTDDwwxEGvf{  vfUDWTwtDDFf{  vfEDDH�DDDFf{  vfdDDDtDDDff{  vfdDDGUDDDff{  vffDDG�DDFff{  vffdDH�DDfff{  vfffdGwDffff{  vfffffffffff{  �33333333333�  tGDDDDDDDDDD{  t[DDGuwwt�wD{  ww�DDDDDDDDD{  ;w{W�wwXWwxw{  tDDtDDDDDDDD{  ������������� �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  OldCreateOrder	PositionpoScreenCenter
OnActivateFormActivateOnClose	FormClosePixelsPerInch`
TextHeight 	TGroupBoxGroupBox_Busca_Por_NomeLeftTop_Width�Height5Caption Busca por nome TabOrder  	TMaskEditMaskEdit_Busca_NomeLeftTopWidthhHeightCharCaseecUpperCaseColorclInfoBkTabOrder OnChangeMaskEdit_Busca_NomeChange   TPanelPanel3Left Top!Width�Height� AlignalTop
BevelInnerbvRaised
BevelOuter	bvLoweredBorderWidthCaptionPanel3TabOrder TDBGridDBGrid_HospedeLeftTopWidth�Height� AlignalClientBorderStylebsNone
DataSourceDSQ_Busca_HospedeFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgMultiSelect 
ParentFontReadOnly	TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclMaroonTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style ColumnsExpanded	FieldName
IDENTIDADEVisible	 Expanded	FieldNamePOSTOTitle.AlignmenttaCenterTitle.Caption   POSTO/GRADUAÇÃOWidth� Visible	 Expanded	FieldNameNOMETitle.AlignmenttaCenterWidth{Visible	     
TStatusBar	StatusBarLeft Top�Width�HeightPanels SimplePanel	
SimpleText8   Selecione o hóspede que irá ser cancelada a hospedagem  	TGroupBox	GroupBox1LeftTopWidth�HeightNCaption    Informação do Fechamento TabOrder TLabelLabel1LeftTopWidth:HeightCaption   Data Saída:  TLabelLabel2LeftTop6Width#HeightCaptionMotivo:  	TMaskEditMaskEdit_ObservacaoLeft5Top/Width@HeightCharCaseecUpperCaseTabOrder   TDateTimePickerDateTimePicker_Data_SaidaLeftLTopWidthbHeightDate �␡bA�@Time �␡bA�@TabOrder   TPanelPanel1Left Top Width�Height!AlignalTop
BevelOuterbvNoneTabOrder TLabelLabel_Ficha_HospedeLeft� TopWidth� HeightCaptionCancela HospedagemFont.CharsetDEFAULT_CHARSET
Font.ColorclMaroonFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont   TPanelPanel2Left�Top Width� Height
BevelInnerbvRaised
BevelOuter	bvLoweredBorderWidthFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTabOrder TDBNavigatorDBNavigator_HospedeLeftTopWidth� Height
DataSourceDSQ_Busca_HospedeVisibleButtonsnbFirstnbPriornbNextnbLast AlignalTopCtl3DHints.StringsPrimeiro HospedeHospede AnteriorHospede Seguinte   Último Hospede ParentCtl3DParentShowHintShowHint	TabOrder   TToolBarToolBar4LeftTopWidth� Height\AutoSize	ButtonHeightButtonWidth� CaptionToolBar1EdgeBorders Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style ImagesDM.ImageList_PrincipalList	
ParentFontShowCaptions	TabOrder TToolButtonToolButton_ExcluirLeft TopHint!Cancela a Hospedagem selecionada.Caption&Cancelar Hospedagem
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_ExcluirClick  TToolButtonToolButton_RetornarLeft Top Caption               &Retornar
ImageIndexWrap	OnClickToolButton_RetornarClick  TToolButtonToolButton_WindowsLeft Top>Caption               &Windows
ImageIndexOnClickToolButton_WindowsClick    TDataSourceDSQ_Busca_HospedeDataSetIBQuery_Busca_HospedeLeft� Top8  TDataSourceDST_HistoricoDataSetIBTable_HistoricoLeft� Top�   TDataSourceDST_AptoDataSetIBTable_AptoLeft� Top�   TDataSourceDST_Exclui_HospedeDataSetIBTable_Exclui_HospedeLeft� Topi  TDataSourceDST_Exclui_DependenteDataSetIBTable_Exclui_DependenteLeft� Top�   TIBQueryIBQuery_Busca_HospedeDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdatesSQL.Strings4Select b.identidade, b.nome, b.Posto, a.ano, a.fichafrom hospedagem a, hospede bwhere a.ano = '2003'and b.identidade = a.identidade LeftxTop6 TIBStringFieldIBQuery_Busca_HospedeIDENTIDADE	FieldName
IDENTIDADEOriginHOSPEDAGEM.IDENTIDADERequired		FixedChar	Size  TIBStringFieldIBQuery_Busca_HospedeNOME	FieldNameNOMEOriginHOSPEDE.NOMERequired	Size(  TIBStringFieldIBQuery_Busca_HospedePOSTO	FieldNamePOSTOOriginHOSPEDE.POSTOSize  TSmallintFieldIBQuery_Busca_HospedeANO	FieldNameANOOriginHOSPEDAGEM.ANORequired	  TIBStringFieldIBQuery_Busca_HospedeFICHA	FieldNameFICHAOriginHOSPEDAGEM.FICHARequired		FixedChar	Size   TIBTableIBTable_Exclui_HospedeDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdates	FieldDefsName
IDENTIDADE
Attributes
faRequiredfaFixed DataTypeftStringSize NameFICHA
Attributes
faRequiredfaFixed DataTypeftStringSize NameANO
Attributes
faRequired DataType
ftSmallint NamePREDIO
Attributes
faRequiredfaFixed DataTypeftStringSize NameAPTO
Attributes
faRequired DataType
ftSmallint NameCAMA
Attributes
faRequired DataType
ftSmallint NameDATAENTRADA
Attributes
faRequired DataTypeftStringSize NameHORAENTRADA
Attributes
faRequired DataTypeftStringSize Name	DATASAIDA
Attributes
faRequired DataTypeftStringSize Name
DEPENDENTEDataType
ftSmallint NameSITUACAO_HOSPEDAGEMDataTypeftStringSize
 NameRECEBE
AttributesfaFixed DataTypeftStringSize NameDESCONTO
AttributesfaFixed DataTypeftStringSize  	IndexDefsNameHOSPEDAGEM_ID_PKFieldsIDENTIDADE;FICHA;ANOOptionsixUnique   IndexFieldNamesIDENTIDADE;FICHA;ANOMasterFieldsIDENTIDADE;FICHA;ANOMasterSourceDSQ_Busca_Hospede	StoreDefs		TableName
HOSPEDAGEMLeftxTop` TIBStringField IBTable_Exclui_HospedeIDENTIDADE	FieldName
IDENTIDADESize  TIBStringFieldIBTable_Exclui_HospedeFICHA	FieldNameFICHASize  TSmallintFieldIBTable_Exclui_HospedeANO	FieldNameANO  TIBStringFieldIBTable_Exclui_HospedePREDIO	FieldNamePREDIOSize  TSmallintFieldIBTable_Exclui_HospedeAPTO	FieldNameAPTO  TSmallintFieldIBTable_Exclui_HospedeCAMA	FieldNameCAMA  TIBStringField!IBTable_Exclui_HospedeDATAENTRADA	FieldNameDATAENTRADASize  TIBStringField!IBTable_Exclui_HospedeHORAENTRADA	FieldNameHORAENTRADASize  TIBStringFieldIBTable_Exclui_HospedeDATASAIDA	FieldName	DATASAIDASize  TSmallintField IBTable_Exclui_HospedeDEPENDENTE	FieldName
DEPENDENTE  TIBStringField)IBTable_Exclui_HospedeSITUACAO_HOSPEDAGEM	FieldNameSITUACAO_HOSPEDAGEMSize
  TIBStringFieldIBTable_Exclui_HospedeRECEBE	FieldNameRECEBESize  TIBStringFieldIBTable_Exclui_HospedeDESCONTO	FieldNameDESCONTOSize   TIBTableIBTable_HistoricoDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdates	FieldDefsName
IDENTIDADE
Attributes
faRequiredfaFixed DataTypeftStringSize NameFICHA
Attributes
faRequired DataTypeftStringSize NameANO
Attributes
faRequired DataType
ftSmallint NamePREDIO
AttributesfaFixed DataTypeftStringSize NameAPTODataType
ftSmallint NameDATAENTRADADataType
ftDateTime NameHORAENTRADADataTypeftStringSize Name	DATASAIDADataType
ftDateTime NameDATAPAGAMENTODataType
ftDateTime NameNRECIBODataTypeftStringSize NameBANCODataTypeftStringSize
 NameNCHEQUEDataTypeftStringSize NamePRACADataTypeftStringSize Name	VALORPAGODataTypeftBCD	Precision	Size NameCUSTO_TELEFONEDataTypeftBCD	Precision	Size NameUSUARIO_ENTRADADataTypeftStringSize
 NameSITUACAO_CURSODataTypeftStringSize
 NameUSUARIO_SAIDADataTypeftStringSize
 NameTIPO_FECHAMENTO
AttributesfaFixed DataTypeftStringSize NameRECEBIDO
AttributesfaFixed DataTypeftStringSize NameOBSDataTypeftStringSize�  NameHORA_OPERACAODataTypeftStringSize NameDATA_OPERACAODataType
ftDateTime  	IndexDefsNameHISTORICO_ID_PKFieldsIDENTIDADE;FICHA;ANOOptionsixUnique   IndexFieldNamesIDENTIDADE;FICHA;ANOMasterFieldsIDENTIDADE;FICHA;ANOMasterSourceDSQ_Busca_Hospede	StoreDefs		TableName	HISTORICOLeftxTop�  TIBStringFieldIBTable_HistoricoIDENTIDADE	FieldName
IDENTIDADESize  TIBStringFieldIBTable_HistoricoFICHA	FieldNameFICHASize  TSmallintFieldIBTable_HistoricoANO	FieldNameANO  TIBStringFieldIBTable_HistoricoPREDIO	FieldNamePREDIOSize  TSmallintFieldIBTable_HistoricoAPTO	FieldNameAPTO  TIBStringFieldIBTable_HistoricoHORAENTRADA	FieldNameHORAENTRADASize  TIBStringField IBTable_HistoricoUSUARIO_ENTRADA	FieldNameUSUARIO_ENTRADASize
  TIBStringFieldIBTable_HistoricoSITUACAO_CURSO	FieldNameSITUACAO_CURSOSize
  TIBStringFieldIBTable_HistoricoUSUARIO_SAIDA	FieldNameUSUARIO_SAIDASize
  TIBStringField IBTable_HistoricoTIPO_FECHAMENTO	FieldNameTIPO_FECHAMENTOSize  TIBStringFieldIBTable_HistoricoRECEBIDO	FieldNameRECEBIDOSize  TIBStringFieldIBTable_HistoricoOBS	FieldNameOBSSize�   TIBStringFieldIBTable_HistoricoHORA_OPERACAO	FieldNameHORA_OPERACAOSize  TDateTimeFieldIBTable_HistoricoDATA_OPERACAO	FieldNameDATA_OPERACAO  TDateTimeFieldIBTable_HistoricoDATAENTRADA	FieldNameDATAENTRADA  TDateTimeFieldIBTable_HistoricoDATASAIDA	FieldName	DATASAIDA  TDateTimeFieldIBTable_HistoricoDATAPAGAMENTO	FieldNameDATAPAGAMENTO   TIBTableIBTable_AptoDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdates	FieldDefsNamePREDIO
Attributes
faRequiredfaFixed DataTypeftStringSize NameAPTO
Attributes
faRequired DataType
ftSmallint NameCAMA
Attributes
faRequired DataType
ftSmallint Name	APTCODIGODataTypeftStringSize NameNOMEDataTypeftStringSize  	IndexDefsNameAPTOCAMA_ID_PKFieldsPREDIO;APTO;CAMAOptionsixUnique  NameAPTO_APTOCAMA_FKFieldsPREDIO;APTO  IndexFieldNamesPREDIO;APTO;CAMAMasterFieldsPREDIO;APTO;CAMAMasterSourceDST_Exclui_Hospede	StoreDefs		TableNameAPTOCAMALeftxTop�  TIBStringFieldIBTable_AptoPREDIO	FieldNamePREDIOSize  TSmallintFieldIBTable_AptoAPTO	FieldNameAPTO  TSmallintFieldIBTable_AptoCAMA	FieldNameCAMA  TIBStringFieldIBTable_AptoAPTCODIGO	FieldName	APTCODIGOSize   TIBTableIBTable_Exclui_DependenteDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdates	FieldDefsNamePREDIO
Attributes
faRequiredfaFixed DataTypeftStringSize NameAPTO
Attributes
faRequired DataType
ftSmallint NameCAMA
Attributes
faRequired DataType
ftSmallint Name	APTCODIGODataTypeftStringSize NameNOMEDataTypeftStringSize  	IndexDefsNameAPTOCAMA_ID_PKFieldsPREDIO;APTO;CAMAOptionsixUnique  NameAPTO_APTOCAMA_FKFieldsPREDIO;APTO  IndexFieldNamesPREDIO;APTOMasterFieldsPREDIO;APTOMasterSourceDST_Exclui_Hospede	StoreDefs		TableNameAPTOCAMALeftxTop�  TIBStringFieldIBTable_Exclui_DependentePREDIO	FieldNamePREDIOSize  TSmallintFieldIBTable_Exclui_DependenteAPTO	FieldNameAPTO  TSmallintFieldIBTable_Exclui_DependenteCAMA	FieldNameCAMA  TIBStringField"IBTable_Exclui_DependenteAPTCODIGO	FieldName	APTCODIGOSize  TIBStringFieldIBTable_Exclui_DependenteNOME	FieldNameNOMESize   TIBQueryIBQuery_Exclui_FichaDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdatesSQL.StringsSelect * from Tabela_Preco  Where Predio = 'A'and Codigo = '01' LeftpTop�    