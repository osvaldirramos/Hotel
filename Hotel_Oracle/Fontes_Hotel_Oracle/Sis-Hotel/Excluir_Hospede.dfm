�
 TFORM_EXCLUIR_HOSPEDE 0�&  TPF0TForm_Excluir_HospedeForm_Excluir_HospedeLeft�Top	Width Height�BorderIcons Caption"   Exclusão de Hóspede - Hotel ICEAColor	clBtnFace
ParentFont		Icon.Data
�             �     (       @         �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ���  �����7w{�����  ����ffffg����  ���vfffffc���  ���fffffff{��  ��ffffffffg��  ��fffffffff��  �vwwwwwwwwvk�  �ffx�wwx�wfc�  �ffgwwwwwfff�  �ffDwwwwtFff�  6fdDGwwwDDff;  vfDDDwwtDDFf{  vfDDDH?DDDFf{  vfDDWwEETDFf{  vfw��utwt�Ff{  vfw�G���t�Vf{  vfTDDwwxEGvf{  vfUDWTwtDDFf{  vfEDDH�DDDFf{  vfdDDDtDDDff{  vfdDDGUDDDff{  vffDDG�DDFff{  vffdDH�DDfff{  vfffdGwDffff{  vfffffffffff{  �33333333333�  tGDDDDDDDDDD{  t[DDGuwwt�wD{  ww�DDDDDDDDD{  ;w{W�wwXWwxw{  tDDtDDDDDDDD{  ������������� �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  OldCreateOrder	PositionpoScreenCenter
OnActivateFormActivatePixelsPerInch`
TextHeight TJvGradientJvGradient1Left Top�WidthHeight� AlignalClientStyle
grVertical
StartColor��� EndColor���   	TGroupBoxGroupBox_Busca_Por_NomeLeftTopWidth�Height5Caption Busca por nome TabOrder  	TMaskEditMaskEdit_Busca_NomeLeftTopWidthhHeightCharCaseecUpperCaseColorclInfoBkTabOrder OnChangeMaskEdit_Busca_NomeChange   TPanelPanel3Left Top!WidthHeight�AlignalTop
BevelInnerbvRaised
BevelOuter	bvLoweredBorderWidthCaptionPanel3TabOrder TDBGridDBGrid_HospedeLeftTopWidthHeight�AlignalClientBorderStylebsNone
DataSourceDSQ_Busca_HospedeFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgMultiSelect 
ParentFontReadOnly	TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclMaroonTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style ColumnsExpanded	FieldNameIDENTIDADE_1Title.AlignmenttaCenterTitle.Caption
IDENTIDADEWidthuVisible	 	AlignmenttaCenterExpanded	FieldNameFICHATitle.AlignmenttaCenterWidth4Visible	 Expanded	FieldNamePOSTOTitle.AlignmenttaCenterTitle.Caption   POSTO/GRADUAÇÃOWidth� Visible	 Expanded	FieldNameNOMETitle.AlignmenttaCenterWidth�Visible	     
TStatusBar	StatusBarLeft Top\WidthHeightPanels SimplePanel	
SimpleText8   Selecione o hóspede que irá ser cancelada a hospedagem  	TGroupBox	GroupBox1LeftTop�Width�HeightNCaption    Informação do Fechamento TabOrder TLabelLabel1LeftTopWidth:HeightCaption   Data Saída:  TLabelLabel2LeftTop4Width=HeightCaption   Observação:  	TMaskEditMaskEdit_ObservacaoLeftPTop/Width(HeightCharCaseecUpperCaseTabOrder   TDateTimePickerDateTimePicker_Data_SaidaLeftLTopWidthbHeightDate �␡bA�@Time �␡bA�@TabOrder   TPanelPanel1Left Top WidthHeight!AlignalTop
BevelOuterbvNoneTabOrder TJvGradientJvGradient2Left Top WidthHeight!AlignalClientStyle
grVertical
StartColor��� EndColor��� Steps!  TLabelLabel_Ficha_HospedeLeft� TopWidth� HeightCaptionCancela HospedagemFont.CharsetDEFAULT_CHARSET
Font.ColorclMaroonFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTransparent	   TPanelPanel2Left�Top�Width� Height|
BevelInnerbvRaised
BevelOuter	bvLoweredBorderWidthFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTabOrder TDBNavigatorDBNavigator_HospedeLeftTopWidth� Height
DataSourceDSQ_Busca_HospedeVisibleButtonsnbFirstnbPriornbNextnbLast AlignalTopCtl3DHints.StringsPrimeiro HospedeHospede AnteriorHospede Seguinte   Último Hospede ParentCtl3DParentShowHintShowHint	TabOrder   TToolBarToolBar4LeftTopWidth� Height\AutoSize	ButtonHeightButtonWidth� CaptionToolBar1EdgeBorders Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style ImagesDM.ImageList_PrincipalList	
ParentFontShowCaptions	TabOrder TToolButtonToolButton_ExcluirLeft TopHint Exclui o Apartamento selecionadoCaption&Cancelar Hospedagem
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_ExcluirClick  TToolButtonToolButton_RetornarLeft Top Caption               &Retornar
ImageIndexWrap	OnClickToolButton_RetornarClick  TToolButtonToolButton_WindowsLeft Top>Caption               &Windows
ImageIndexOnClickToolButton_WindowsClick    TQueryQuery_Busca_HospedeActive	DatabaseNamehotel1SQL.StringsBSelect a.identidade, a.ficha, b.identidade, b.nome, b.Posto, a.anofrom hospedagem a, hospede b!where b.identidade = a.identidade  Left� Top8 TStringFieldQuery_Busca_HospedeIDENTIDADE	FieldName
IDENTIDADEOriginHOSPEDAGEM.IDENTIDADESize  TStringFieldQuery_Busca_HospedeIDENTIDADE_1	FieldNameIDENTIDADE_1OriginHOSPEDE.IDENTIDADESize  TStringFieldQuery_Busca_HospedeNOME	FieldNameNOMEOriginHOSPEDE.NOMESize(  TStringFieldQuery_Busca_HospedePOSTO	FieldNamePOSTOOriginHOSPEDE.POSTOSize  TFloatFieldQuery_Busca_HospedeANO	FieldNameANOOriginHOTEL1.HOSPEDAGEM.ANO  TStringFieldQuery_Busca_HospedeFICHA	FieldNameFICHAOriginHOTEL1.HOSPEDAGEM.FICHA	FixedChar	Size   TDataSourceDSQ_Busca_HospedeDataSetQuery_Busca_HospedeLeft� Top8  TTableTable_Exclui_HospedagemDatabaseNamehotel1IndexFieldNamesIDENTIDADE;FICHA;ANOMasterFieldsIDENTIDADE;FICHA;ANOMasterSourceDSQ_Busca_Hospede	TableName
HOSPEDAGEMLeftxToph TStringField!Table_Exclui_HospedagemIDENTIDADE	FieldName
IDENTIDADERequired	Size  TStringFieldTable_Exclui_HospedagemFICHA	FieldNameFICHARequired	Size  TStringFieldTable_Exclui_HospedagemPREDIO	FieldNamePREDIOSize  TFloatFieldTable_Exclui_HospedagemAPTO	FieldNameAPTO  TFloatFieldTable_Exclui_HospedagemCAMA	FieldNameCAMA  TStringField"Table_Exclui_HospedagemDATAENTRADA	FieldNameDATAENTRADASize  TStringField"Table_Exclui_HospedagemHORAENTRADA	FieldNameHORAENTRADASize  TStringField Table_Exclui_HospedagemDATASAIDA	FieldName	DATASAIDASize  TStringField*Table_Exclui_HospedagemSITUACAO_HOSPEDAGEM	FieldNameSITUACAO_HOSPEDAGEMSize
  TStringFieldTable_Exclui_HospedagemRECEBE	FieldNameRECEBESize  TFloatField!Table_Exclui_HospedagemDEPENDENTE	FieldName
DEPENDENTE  TFloatFieldTable_Exclui_HospedagemANO	FieldNameANORequired	  TStringFieldTable_Exclui_HospedagemDESCONTO	FieldNameDESCONTO	FixedChar	Size   TTableTable_HistoricoDatabaseNamehotel1IndexFieldNamesIDENTIDADE;FICHA;ANOMasterFieldsIDENTIDADE;FICHA;ANOMasterSourceDSQ_Busca_Hospede	TableName	HISTORICOLeftxTop�  TStringFieldTable_HistoricoIDENTIDADE	FieldName
IDENTIDADERequired	Size  TStringFieldTable_HistoricoFICHA	FieldNameFICHARequired	Size  TStringFieldTable_HistoricoDATASAIDA	FieldName	DATASAIDASize  TStringFieldTable_HistoricoUSUARIO_SAIDA	FieldNameUSUARIO_SAIDASize
  TStringFieldTable_HistoricoTIPO_FECHAMENTO	FieldNameTIPO_FECHAMENTOSize  TStringFieldTable_HistoricoOBS	FieldNameOBSSize�   TFloatFieldTable_HistoricoANO	FieldNameANORequired	  TStringFieldTable_HistoricoPREDIO	FieldNamePREDIO	FixedChar	Size  TFloatFieldTable_HistoricoAPTO	FieldNameAPTO  TStringFieldTable_HistoricoDATAENTRADA	FieldNameDATAENTRADASize
  TStringFieldTable_HistoricoHORAENTRADA	FieldNameHORAENTRADASize  TStringFieldTable_HistoricoDATAPAGAMENTO	FieldNameDATAPAGAMENTOSize
  TStringFieldTable_HistoricoNRECIBO	FieldNameNRECIBOSize  TStringFieldTable_HistoricoBANCO	FieldNameBANCOSize
  TStringFieldTable_HistoricoNCHEQUE	FieldNameNCHEQUESize  TStringFieldTable_HistoricoPRACA	FieldNamePRACASize  TFloatFieldTable_HistoricoVALORPAGO	FieldName	VALORPAGO  TFloatFieldTable_HistoricoCUSTO_TELEFONE	FieldNameCUSTO_TELEFONE  TStringFieldTable_HistoricoUSUARIO_ENTRADA	FieldNameUSUARIO_ENTRADASize
  TStringFieldTable_HistoricoSITUACAO_CURSO	FieldNameSITUACAO_CURSOSize
  TStringFieldTable_HistoricoRECEBIDO	FieldNameRECEBIDO	FixedChar	Size  TStringFieldTable_HistoricoHORA_OPERACAO	FieldNameHORA_OPERACAOSize  TDateTimeFieldTable_HistoricoDATA_OPERACAO	FieldNameDATA_OPERACAO  TStringFieldTable_HistoricoADE	FieldNameADESize	   TDataSourceDST_HistoricoDataSetTable_HistoricoLeft� Top�   TTable
Table_AptoDatabaseNamehotel1IndexFieldNamesPREDIO;APTO;CAMAMasterFieldsPREDIO;APTO;CAMAMasterSourceDST_Exclui_Hospede	TableNameAPTOCAMALeftxTop�  TStringFieldTable_AptoPREDIO	FieldNamePREDIORequired	Size  TFloatFieldTable_AptoAPTO	FieldNameAPTORequired	  TFloatFieldTable_AptoCAMA	FieldNameCAMARequired	  TStringFieldTable_AptoAPTCODIGO	FieldName	APTCODIGOSize
   TDataSourceDST_AptoDataSet
Table_AptoLeft� Top�   TDataSourceDST_Exclui_HospedeDataSetTable_Exclui_HospedagemLeft� Topi  TTableTable_Exclui_DependenteDatabaseNamehotel1FilterAptCodigo = 'DEP'Filtered	IndexFieldNamesPREDIO;APTOMasterFieldsPREDIO;APTOMasterSourceDST_Exclui_Hospede	TableNameAPTOCAMALeftxTop�  TStringFieldStringField1DisplayWidth	FieldNamePREDIORequired	Size  TFloatFieldFloatField1DisplayWidth
	FieldNameAPTORequired	  TFloatFieldFloatField2DisplayWidth
	FieldNameCAMARequired	  TStringFieldStringField2DisplayWidth	FieldName	APTCODIGOSize
   TDataSourceDST_Exclui_DependenteDataSetTable_Exclui_DependenteLeft� Top�    