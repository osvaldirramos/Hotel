�
 TFORM_MENURECEPCAO 0�  TPF0TForm_MenuRecepcaoForm_MenuRecepcaoLeftTop
Width|HeightGCaption   Sis-Hotel --> Mapa RecepçãoColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 	Icon.Data
�             �     (       @         �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� �������������� ������x������� �������������� ���~���{��� ����ww���x���� ��莈�������� ����o��������� �x��ǈ���̎��� ����숈�|���� �����h������� ������w���l��� �����ȃ������� ����������� ���̎��莌舿 ��h��쏌舌�� ���Ȍ�~��nh� ���l��������� ��|�����Ȏ� ��h�����̎� ������wn����� �����x|����� ����쉎�Ύ�� ����̈�̈��� ����莏������ �������興��� �wwwwwwwwwwww� ����̈��ȏ�Ά� ��36̈�o����� �c63l���ψȏǿ �6ff<���ψ��ƿ �fffffffffffg� �������������� �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  OldCreateOrderPositionpoScreenCenter
OnActivateFormActivatePixelsPerInchx
TextHeight 
TStatusBar
StatusBar1Left TopWidthtHeightPanels SimplePanel	
SimpleText   Selecione a opçãoo desejada.  TToolBarToolBar2Left Top WidthtHeight4ButtonHeight/ButtonWidthGCaptionfEdgeBordersebTopebBottom Flat	ImagesDM.ImageList_PrincipalParentShowHintShowCaptions	ShowHint	TabOrderTransparent	 TToolButtonToolButton_WindowsLeft Top HintRetorna para o WindowsCaption&Windows
ImageIndexOnClickToolButton_WindowsClick  	TJvxClock	JvxClock1LeftGTop WidthfHeight/AlignalTopColor	clSkyBlue   	TGroupBoxGroupBox_PrincipalLeft Top4WidthtHeightUAlignalTopCaption    Informações do Mapa ColorclSilverParentColorTabOrder TSpeedButtonSpeedButton_Atualiza_MapaLeftTTop)Width"HeightHint   Atualiza o mapa de ocupação
Glyph.Data
�   �   BM�       v   (               x                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� wwwwwwpwwwwwx wwwwwp �wx  �Hww �� ��wp���ww����ww����ww����ww����pww����ww�����wwp��www �� wwwwx  �wwwParentShowHintShowHint	OnClickSpeedButton_Atualiza_MapaClick  TLabelLabel1LeftvTopWidthbHeightCaptionNome CompletoFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTransparent	  TLabelLabel4LeftTopWidth(HeightCaption   PrédioFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTransparent	  	TMaskEdit	MaskEdit1LefttTop'Width� HeightCharCaseecUpperCaseColorclInfoBk	MaxLengthTabOrder   	TComboBox	ComboBox1LeftTop'WidthXHeightColorclInfoBk
ItemHeightTabOrderTextTodosItems.StringsTodosABCDE    TDBGridDBGrid_MapaLeft Top� WidthtHeight�AlignalClientColorclInfoBk
DataSourceDSQ_Mapa
FixedColorclOliveFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OptionsdgTitlesdgIndicatordgColumnResize
dgColLinesdgRowSelectdgAlwaysShowSelection 
ParentFontReadOnly	TabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style ColumnsExpanded	FieldNamePREDIOTitle.AlignmenttaCenterVisible	 Expanded	FieldNameAPTOTitle.AlignmenttaCenterWidth/Visible	 Expanded	FieldNameCAMATitle.AlignmenttaCenterWidth0Visible	 Expanded	FieldNameRAMALTitle.AlignmenttaCenterWidth;Visible	 Expanded	FieldNameSITUACAOTitle.AlignmenttaCenterWidth4Visible	 Expanded	FieldNameNOMETitle.AlignmenttaCenterWidthVisible	 Expanded	FieldNameSITUACAO_CURSOTitle.AlignmenttaCenterVisible	 Expanded	FieldNameDATA_ENTRADATitle.AlignmenttaCenterTitle.CaptionENTRADAWidthOVisible	 Expanded	FieldName
DATA_SAIDATitle.AlignmenttaCenterTitle.CaptionSAIDAWidthQVisible	    TIBQueryIBQuery_MapaDatabaseDM.IBDatabase_HotelLocalTransactionDM.IBTransaction_HotelLocalActive	BufferChunks�CachedUpdatesSQL.Stringsselect *	from mapa   Left�TopX TIBStringFieldIBQuery_MapaIDENTIDADE	FieldName
IDENTIDADEOriginMAPA.IDENTIDADESize  TIBStringFieldIBQuery_MapaPREDIO	FieldNamePREDIOOriginMAPA.PREDIORequired		FixedChar	Size  TIntegerFieldIBQuery_MapaAPTO	FieldNameAPTOOrigin	MAPA.APTORequired	  TIntegerFieldIBQuery_MapaCAMA	FieldNameCAMAOrigin	MAPA.CAMARequired	  TIBStringFieldIBQuery_MapaRAMAL	FieldNameRAMALOrigin
MAPA.RAMALSize  TIBStringFieldIBQuery_MapaNOME	FieldNameNOMEOrigin	MAPA.NOMESize(  TIBStringFieldIBQuery_MapaTIPO	FieldNameTIPOOrigin	MAPA.TIPO	FixedChar	Size  TIBStringFieldIBQuery_MapaSITUACAO	FieldNameSITUACAOOriginMAPA.SITUACAOSize<  TIBStringFieldIBQuery_MapaSITUACAO_CURSO	FieldNameSITUACAO_CURSOOriginMAPA.SITUACAO_CURSOSize
  TIBStringFieldIBQuery_MapaDATA_ENTRADA	FieldNameDATA_ENTRADAOriginMAPA.DATA_ENTRADASize  TIBStringFieldIBQuery_MapaDATA_SAIDA	FieldName
DATA_SAIDAOriginMAPA.DATA_SAIDASize   TDataSourceDSQ_MapaDataSetIBQuery_MapaLeftTop]   