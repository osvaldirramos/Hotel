�
 TFORM_RECIBO_PAGAMENTO 0)  TPF0TForm_Recibo_PagamentoForm_Recibo_PagamentoLeftTop~WidthBHeightTBorderIcons CaptionRecibo Pagamento - Hotel ICEAColor	clBtnFace
ParentFont		Icon.Data
�             �     (       @         �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ���  �����7w{�����  ����ffffg����  ���vfffffc���  ���fffffff{��  ��ffffffffg��  ��fffffffff��  �vwwwwwwwwvk�  �ffx�wwx�wfc�  �ffgwwwwwfff�  �ffDwwwwtFff�  6fdDGwwwDDff;  vfDDDwwtDDFf{  vfDDDH?DDDFf{  vfDDWwEETDFf{  vfw��utwt�Ff{  vfw�G���t�Vf{  vfTDDwwxEGvf{  vfUDWTwtDDFf{  vfEDDH�DDDFf{  vfdDDDtDDDff{  vfdDDGUDDDff{  vffDDG�DDFff{  vffdDH�DDfff{  vfffdGwDffff{  vfffffffffff{  �33333333333�  tGDDDDDDDDDD{  t[DDGuwwt�wD{  ww�DDDDDDDDD{  ;w{W�wwXWwxw{  tDDtDDDDDDDD{  ������������� �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  OldCreateOrder	PositionpoScreenCenter
OnActivate
FormCreatePixelsPerInchx
TextHeight TPanelPanel3Left Top Width:HeightxAlignalClient
BevelInnerbvRaised
BevelOuter	bvLoweredBorderWidthCaptionPanel3TabOrder  TDBGridDBGrid_HospedeLeftTop3Width2HeightAAlignalClientBorderStylebsNone
DataSourceDSQ_HospedeFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgMultiSelect 
ParentFontReadOnly	TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclMaroonTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style ColumnsExpanded	FieldNameFICHATitle.AlignmenttaCenterWidth4Visible	 Expanded	FieldName
IDENTIDADETitle.AlignmenttaCenterWidth_Visible	 Expanded	FieldNameNOMETitle.AlignmenttaCenterVisible	 Expanded	FieldNameNCHEQUETitle.AlignmenttaCenterWidth[Visible	    TPanelPanel2LeftTopWidth2Height/AlignalTop
BevelOuterbvNoneTabOrder TLabelLabel_Fecha_ocupacaoLeftPTop	Width�HeightCaptionRecebimento de Cheque PredatadoFont.CharsetDEFAULT_CHARSET
Font.ColorclMaroonFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont    TPanelPanel1Left TopxWidth:Height� AlignalBottomTabOrder 
TStatusBar
StatusBar1LeftTop� Width8HeightPanels SimplePanel	
SimpleText-   Selecione o o apartamento que será descupado  TPanelPanel4LeftqTopWidth� Height
BevelInnerbvRaised
BevelOuter	bvLoweredBorderWidthFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTabOrder TToolBarToolBar4LeftTopWidth� Height\AutoSize	ButtonHeightButtonWidth� CaptionToolBar1EdgeBorders Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style ImagesDM.ImageList_PrincipalList	
ParentFontShowCaptions	TabOrder  TToolButtonToolButton_Cheque_PPLeft TopHint,Faz fechamento da conta paga com cheque P/P.Caption&Cheque Recebido
ImageIndex ParentShowHintWrap	ShowHint	OnClickToolButton_Cheque_PPClick  TToolButtonToolButton_RetornarLeft Top HintRetorna para Menu PrincipalCaption             &Retornar           
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_RetornarClick  TToolButtonToolButton_WindowsLeft Top>Hint&Sai do sistema e retorna para Windows.Caption           Windows
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_WindowsClick   TDBNavigatorDBNavigator_HospedeLeftTopWidth� Height
DataSourceDSQ_HospedeVisibleButtonsnbFirstnbPriornbNextnbLast AlignalTopCtl3DHints.Strings   Primeiro Hóspede   Hóspede Anterior   Hóspede Seguinte   Último Hóspede ParentCtl3DParentShowHintShowHint	TabOrder   	TGroupBoxGroupBox_Busca_Por_NomeLeft	TopUWidthHHeight<Caption Busca por nome TabOrder 	TMaskEditMaskEdit_Busca_NomeLeftTopWidth#HeightCharCaseecUpperCaseColorclInfoBkTabOrder OnChangeMaskEdit_Busca_NomeChange   	TGroupBox	GroupBox2Left� TopWidth� Height<Caption Data  Recebimento: TabOrder TDateTimePickerDateTimePicker_RecebimentoLeftTopWidthiHeightDate ��l/d�@Time ��l/d�@TabOrder    	TGroupBox	GroupBox1Left	TopWidth� Height<Caption   Número Recibo: TabOrder 	TMaskEditMaskEdit_ReciboLeftTopWidthRHeightEditMask
999999;0; Font.CharsetDEFAULT_CHARSET
Font.ColorclMaroonFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 	MaxLength
ParentFontTabOrder     TQueryQuery_HospedeDatabaseNamehotel1SQL.Strings=Select a.identidade, b.identidade, b.nome, a.Ficha, a.nchequefrom Historico a, hospede b!where b.identidade = a.identidadeand  a.ano = '2003'and a.Recebido = 'P' Left8TopX TStringFieldQuery_HistoricoIDENTIDADE_1	FieldNameIDENTIDADE_1OriginHOSPEDE.IDENTIDADESize  TStringFieldQuery_HistoricoNOME	FieldNameNOMEOriginHOSPEDE.NOMESize(  TStringFieldQuery_HistoricoFICHA	FieldNameFICHAOriginHISTORICO.FICHASize  TStringFieldQuery_HistoricoIDENTIDADE	FieldName
IDENTIDADEOriginHISTORICO.IDENTIDADESize  TStringFieldQuery_HospedeNCHEQUE	FieldNameNCHEQUEOriginHISTORICO.NCHEQUESize   TDataSourceDSQ_HospedeDataSetQuery_HospedeLeft`TopX  TTableTable_HistoricoDatabaseNamehotel1IndexFieldNamesIDENTIDADE;FICHAMasterFieldsIDENTIDADE_1;FICHAMasterSourceDSQ_Hospede	TableName	HISTORICOLeft8Top�    