�
 TFORM_MONTARESERVA 0��  TPF0TForm_MontaReservaForm_MontaReservaLeft{TopfWidth$HeightCaptionSis-Hotel --> ReservaColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 	Icon.Data
�             �     (       @         �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� �������������� ������x������� �������������� ���~���{��� ����ww���x���� ��莈�������� ����o��������� �x��ǈ���̎��� ����숈�|���� �����h������� ������w���l��� �����ȃ������� ����������� ���̎��莌舿 ��h��쏌舌�� ���Ȍ�~��nh� ���l��������� ��|�����Ȏ� ��h�����̎� ������wn����� �����x|����� ����쉎�Ύ�� ����̈�̈��� ����莏������ �������興��� �wwwwwwwwwwww� ����̈��ȏ�Ά� ��36̈�o����� �c63l���ψȏǿ �6ff<���ψ��ƿ �fffffffffffg� �������������� �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  OldCreateOrderPositionpoScreenCenter
OnActivateFormActivatePixelsPerInch`
TextHeight TLabelLabel9LeftTop� Width$HeightCaption	   Prédio.:  TDBTextDBText3Left.Top� Width4Height  
TStatusBar
StatusBar1Left Top�WidthHeightPanels SimplePanel	
SimpleText   Selecione a opçãoo desejada.  TPanelPanel_TrataReservaLeft Top WidthHeight� AlignalTopTabOrder 	TGroupBox	GroupBox8Left� TopWidth(Height� AlignalClientCaption Efetuar Reserva TabOrder  
TScrollBox
ScrollBox1LeftTop3Width$Height� AlignalClientBorderStylebsNoneTabOrder  	TGroupBoxGroupBox_DataEntradaLeft�TopWidth_Height$Caption Data Entrada TabOrder	 TDateTimePickerDateTimePicker_EntradaLeftTopWidthXHeightDate �c���<�@Time �c���<�@ColorclInfoBkTabOrder    	TGroupBoxGroupBox_DataSaidaLeft�Top.Width_Height$Caption    Data Saída TabOrder
 TDateTimePickerDateTimePicker_SaidaLeftTopWidthXHeightDate �c���<�@Time �c���<�@ColorclInfoBkTabOrder    	TGroupBoxGroupBox_HoraLeft�Top.Width(Height$Caption Hora TabOrder 	TMaskEditMaskEdit_HoraLeftTopWidth HeightCharCaseecUpperCaseColorclInfoBkEditMask	99:99;0; 	MaxLengthTabOrder    	TGroupBoxGroupBox_SituacaoLeft+Top.Width� Height$Caption    Situação TabOrder 	TComboBoxComboBox_Situacao_CursoLeftTopWidth}HeightStylecsDropDownListCharCaseecUpperCaseColorclInfoBk
ItemHeightTabOrder Items.StringsTRANSITO	RESIDENTE	CURSO<30D	CURSO>30D	CURSO PNR
VISITA ESP    	TGroupBoxGroupBox_DependenteLeft� Top.Width,Height$Caption Dep. TabOrder 	TMaskEditMaskEdit_DependenteLeftTopWidth%HeightCharCaseecUpperCaseColorclInfoBkEditMask99;0; 	MaxLengthTabOrder    	TGroupBoxGroupBox_Posto_GraduacaoLeft� TopWidth� Height$Caption    Posto/Graduação TabOrder 	TComboBoxComboBox_Posto_GraduacaoLeftTopWidth}HeightCharCaseecUpperCaseColorclInfoBk
ItemHeight	MaxLengthTabOrder OnEnterComboBox_Posto_GraduacaoEnter   	TGroupBoxGroupBox_NomeGuerraLeftqTopWidth� Height$Caption Nome Guerra TabOrder 	TMaskEditMaskEdit_Nome_Guerra_hospedeLeftTopWidthyHeightCharCaseecUpperCaseColorclInfoBk	MaxLengthTabOrder OnChangeSelecionarHospede   	TGroupBoxGroupBox_NomeCompletoLeftTop.Width� Height$Caption Nome Completo TabOrder 	TMaskEditMaskEdit_Nome_HospedeLeftTopWidth� HeightCharCaseecUpperCaseColorclInfoBk	MaxLength(TabOrder OnChangeSelecionarHospede   	TGroupBoxGroupBox_IdentidadeLeftTopWidthhHeight$Caption Identidade TabOrder  	TMaskEditMaskEdit_IdentidadeLeftTopWidthaHeightCharCaseecUpperCaseColorclInfoBk	MaxLengthTabOrder OnChangeSelecionarHospede   TDBGridDBGrid_Busca_HospedeLeft TopRWidthHeightpAlignalBottom
DataSourceDSQ_Busca_HospedeOptionsdgTabsdgRowSelectdgAlwaysShowSelection TabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style 
OnDblClickDBGrid_Busca_HospedeDblClickColumnsExpanded	FieldName
IDENTIDADEFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameCourier New
Font.Style Visible	 Expanded	FieldNameNOMEFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameCourier New
Font.Style WidthNVisible	 Expanded	FieldNamePOSTOFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameCourier New
Font.Style Width� Visible	 Expanded	FieldNameNOME_GUERRAFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameCourier New
Font.Style WidthpVisible	    	TGroupBoxGroupBox_TelefoneLeft}TopWidthaHeight$CaptionTelefoneTabOrder 	TMaskEditMaskEdit_TelefoneLeftTopWidthVHeightCharCaseecUpperCaseColorclInfoBkEditMask(99) 9999-9999;0; 	MaxLengthTabOrder     TToolBarToolBar4LeftTopWidth$Height$AutoSize	ButtonHeightButtonWidth� CaptionToolBar1EdgeBordersebLeftebTopebRightebBottom Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style ImagesDM.ImageList_PrincipalList	
ParentFontShowCaptions	TabOrder TToolButtonToolButton_ReservaLeft TopHint.Efetua reserva do hospede selecionado na listaCaption&Efetuar Reserva
ImageIndexParentShowHintShowHint	OnClickToolButton_ReservaClick  TToolButtonToolButton_Cancela_ReservaLeft� TopHint-Efetuar o cancelamento da Reserva selecionadaCaption&Cancela Res.
ImageIndex	ParentShowHintShowHint	OnClickToolButton_Cancela_ReservaClick  TToolButtonToolButton_RetornarLeftTopHintRetorna para a tela de entradaCaption    &Retornar  
ImageIndexParentShowHintShowHint	OnClickToolButton_RetornarClick  TToolButtonToolButton_WindowsLeft�TopHintRetorna para o WindowsCaption   &Windows  
ImageIndexOnClickToolButton_WindowsClick  TToolButtonToolButton_AjudaLeft4TopHintD   Permite acesso ao Manual do Usuário, Dicas de Utilização e Sobre.AutoSize	Caption&Ajuda               DropdownMenuDM.PopupMenu_Ajuda
ImageIndexParentShowHintShowHint	StyletbsDropDown    	TGroupBox	GroupBox1LeftTopWidth� Height� AlignalLeftCaption    Informações do Mapa TabOrder TJvGradientvvLeftTopnWidth� HeightrAlignalClientStyle	grEllipse
StartColorclSilverEndColorclWhiteSteps)  TLabelLabel19LeftTop� WidthKHeightCaptionNome CompletoFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTransparent	  TLabelLabel18LeftTop� WidthNHeightCaptionNome de GuerraFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTransparent	  TLabelLabel5Left� Top� WidthHeightCaptionRamalFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTransparent	  TLabelLabel20Left� Top� Width"HeightCaptionAno....:Transparent	  TLabelLabel1LeftTop� Width#HeightCaption	   Mês....:Transparent	  TLabelLabel_PredioLeftTopuWidth!HeightCaption   Prédio:Transparent	  TSpeedButtonSpeedButton_AtualizarLeftbToppWidth"HeightHint   Atualiza o mapa de ocupação
Glyph.Data
�   �   BM�       v   (               x                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� wwwwwwpwwwwwx wwwwwp �wx  �Hww �� ��wp���ww����ww����ww����ww����pww����ww�����wwp��www �� wwwwx  �wwwParentShowHintShowHint	OnClickSpeedButton_AtualizarClick  TProgressBarProgressBar1LeftTop� Width� HeightAlignalBottomTabOrder   	TMaskEditMaskEdit_Busca_Nome_CompletoLeftTop� Width� HeightCharCaseecUpperCaseColorclInfoBk	MaxLengthTabOrderOnChange"MaskEdit_Busca_Nome_CompletoChange  	TMaskEditMaskEdit_Nome_GuerraLeftTop� WidthjHeightCharCaseecUpperCaseColorclInfoBkTabOrderOnChangeMaskEdit_Nome_GuerraChange  	TMaskEditMaskEdit_RamalLeft� Top� Width7HeightCharCaseecUpperCaseColorclInfoBkEditMask9999;0; 	MaxLengthTabOrderOnChangeMaskEdit_RamalChange  	TComboBoxComboBox_AnoLeft� Top� WidthHHeight
ItemHeight	MaxLengthTabOrderText01Items.Strings2008200920102011201220132014201520162017201820192020202120222023202420252026202720282029    	TComboBoxComboBox_MesLeft-Top� Width5Height
ItemHeight	MaxLengthTabOrderText01Items.Strings010203040506070809101112    	TComboBoxComboBox_PredioLeft-TopoWidth5Height
ItemHeight	MaxLengthTabOrderOnClickSpeedButton_AtualizarClickItems.StringsTodosGO   TPanelPanel2LeftTopWidth� Height_AlignalTopTabOrder TLabelLabel7LeftTop�Width<HeightCaptionLegenda:Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.StylefsBoldfsItalic 
ParentFontTransparent	  TPanelPanel4LeftTopWidth� HeightAlignalBottom
BevelInner	bvLoweredCaption
   OcupadoColorclSilverTabOrder  TPanelPanel5LeftTopWidthHeightAlignalLeftColorclTealTabOrder    TPanelPanel6LeftTopWidth� HeightAlignalBottom
BevelInner	bvLoweredCaption   DesocupadoColorclSilverTabOrder TPanelPanel7LeftTopWidthHeightAlignalLeftColorclInfoBkFont.CharsetDEFAULT_CHARSET
Font.ColorclWhiteFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder    TPanelPanel8LeftTop-Width� HeightAlignalBottom
BevelInner	bvLoweredCaption
   ReservaColorclSilverTabOrder TPanelPanel9LeftTopWidthHeightAlignalLeftColorclRedTabOrder    TPanelPanel12LeftTop<Width� HeightAlignalBottom
BevelInner	bvLoweredCaption      Não OcuparColorclSilverTabOrder TPanelPanel15LeftTopWidthHeightAlignalLeftColorclYellowTabOrder    TPanelPanel14LeftTopLWidth� HeightAlignalBottom
BevelInner	bvLoweredCaption      Não DesocupadoColorclSilverTabOrder TPanelPanel16LeftTopWidthHeightAlignalLeftColorclBlueTabOrder       TPanelPanel_ApresentaMapaLeft Top� WidthHeight�AlignalClientCaptionPanel_ApresentaMapaTabOrder TPanel
Panel_MapaLeftTopWidth Height�AlignalLeftTabOrder  TDBGridDBGrid_MapaLeftTopvWidthHeightaAlignalBottomColorclMoneyGreen
DataSourceDST_Mostrar
FixedColorclOliveFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OptionsdgTitlesdgColumnResize
dgColLinesdgTabsdgRowSelectdgAlwaysShowSelection 
ParentFontReadOnly	TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style OnDrawColumnCellDBGrid_MapaDrawColumnCellColumnsExpanded	FieldNameCAMATitle.CaptionCamaWidth'Visible	 Expanded	FieldNameSITUACAOTitle.AlignmenttaCenterTitle.Caption"   Código - Posto/Grad - Nome GuerraWidth.Visible	 Expanded	FieldNameNOMETitle.AlignmenttaCenterTitle.CaptionNome CompletoWidth� Visible	 	AlignmenttaCenterExpanded	FieldNameDATA_ENTRADATitle.AlignmenttaCenterTitle.CaptionData EntradaWidthZVisible	 	AlignmenttaCenterExpanded	FieldName
DATA_SAIDATitle.AlignmenttaCenterTitle.Caption   Data SaídaVisible	    TDBGridDBGrid_VisaoLeftTopWidthHeightuAlignalClient
DataSource	DSQ_Visao
FixedColorclMoneyGreenTabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style OnCellClickDBGrid_VisaoCellClickOnDrawColumnCellDBGrid_VisaoDrawColumnCellOnExitDBGrid_VisaoExitColumns	AlignmenttaCenterColorclMoneyGreenExpanded	FieldNameCAMATitle.AlignmenttaCenterTitle.CaptionCVisible	 	AlignmenttaCenterExpanded	FieldNameDIA01Title.AlignmenttaCenterTitle.Caption01WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA02Title.AlignmenttaCenterTitle.Caption02WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA03Title.AlignmenttaCenterTitle.Caption03WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA04Title.AlignmenttaCenterTitle.Caption04WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA05Title.AlignmenttaCenterTitle.Caption05WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA06Title.AlignmenttaCenterTitle.Caption06WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA07Title.AlignmenttaCenterTitle.Caption07WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA08Title.AlignmenttaCenterTitle.Caption08WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA09Title.AlignmenttaCenterTitle.Caption09WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA10Title.AlignmenttaCenterTitle.Caption10WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA11Title.AlignmenttaCenterTitle.Caption11WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA12Title.AlignmenttaCenterTitle.Caption12WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA13Title.AlignmenttaCenterTitle.Caption13WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA14Title.AlignmenttaCenterTitle.Caption14WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA15Title.AlignmenttaCenterTitle.Caption15WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA16Title.AlignmenttaCenterTitle.Caption16WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA17Title.AlignmenttaCenterTitle.Caption17WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA18Title.AlignmenttaCenterTitle.Caption18WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA19Title.AlignmenttaCenterTitle.Caption19WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA20Title.AlignmenttaCenterTitle.Caption20WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA21Title.AlignmenttaCenterTitle.Caption21WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA22Title.AlignmenttaCenterTitle.Caption22WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA23Title.AlignmenttaCenterTitle.Caption23WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA24Title.AlignmenttaCenterTitle.Caption24WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA25Title.AlignmenttaCenterTitle.Caption25WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA26Title.AlignmenttaCenterTitle.Caption26WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA27Title.AlignmenttaCenterTitle.Caption27WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA28Title.AlignmenttaCenterTitle.Caption28WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA29Title.AlignmenttaCenterTitle.Caption29WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA30Title.AlignmenttaCenterTitle.Caption30WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDIA31Title.AlignmenttaCenterTitle.Caption31WidthVisible	     TPanelPanel3Left!TopWidth� Height�AlignalClientTabOrder TLabelLabel17LeftTopTWidth HeightCaption   Saída:  	TGroupBoxGroupBox_SituacaoAtualLeftTopWidth� Height� AlignalClientCaption    Situação Atual TabOrder  TLabelLabel_IndiponiveisLeftTop;WidthOHeightCaption   Indisponível......:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel_ReservasLeftTop,WidthNHeightCaptionReservas..........:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel_HospedagensLeftTopWidthHHeightCaptionHospedagens.:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel_TotalVagasLeftTopWidthKHeightCaptionTotal de Vagas:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TSpeedButtonSpeedButton_MostraResumoLeft� TopWidthHeightHint   Mostra Resumo de Ocupação
Glyph.Data
z  v  BMv      v   (                                    �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 333033333337�333333 333333w3333333333?3w�?33�; 3�33s�ww?s33;��3337sw�33;��33373ss�?33����3377�?33����3?s7�s�������w?737s3����33s�3s33����33s�?�3s33;� �3337�ws7�33;����3337s�?w?33�;��3�33s7sw3s3333;33333337�333333;333333373333	NumGlyphsParentShowHintShowHint	OnClickSpeedButton_MostraResumoClick   TToolBarToolBar1LeftTopWidth� Height"ButtonHeightButtonWidthCaptionToolBar1Flat	ImagesDM.ImageList_PrincipalTabOrder TToolButtonToolButton_AmpliaMapaLeft Top Hint   Amplia a apresentação do MapaCaptionToolButton_AmpliaMapa
ImageIndex!OnClickToolButton_AmpliaMapaClick  TToolButtonToolButton_ReduzMapaLeftTop Hint   Reduz a apresentação do MapaCaptionToolButton_ReduzMapa
ImageIndex OnClickToolButton_ReduzMapaClick  TToolButtonToolButton_MostrarReservasLeft>Top Hint!Mostra janela com todas reservas.CaptionToolButton_MostrarReservas
ImageIndex(ParentShowHintShowHint	OnClickToolButton_MostrarReservasClick  TDBNavigatorDBNavigator_VisaoLeft]Top WidthXHeight
DataSource	DSQ_VisaoVisibleButtonsnbFirstnbPriornbNextnbLast AlignalTopFlat	Hints.StringsPosiciona na primeira linha   Próxima linhaRetorna linha   Última linha TabOrder    	TGroupBox	GroupBox2LeftTop#Width� Height� AlignalTopCaption   Informações HospedeTabOrder TLabelLabel8Left[Top)Width%HeightCaption	Apto....:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel21LeftTopIWidth!HeightCaptionCama.:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel22LeftTopfWidth� HeightCaption   Cód-Posto Grad-Nome GuerraFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel23LeftUTop� Width HeightCaption   Saída:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel24LeftTop*Width$HeightCaption	   Prédio.:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TDBTextDBText1LeftTop7Width5Height	DataFieldPREDIO
DataSource	DSQ_Busca  TDBTextDBText2LeftfTop6Width4Height	DataFieldAPTO
DataSource	DSQ_Busca  TLabelLabel25Left[TopHWidth$HeightCaptionRamal.:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TDBTextDBText14LeftfTopUWidth1Height	DataFieldRAMAL
DataSource	DSQ_Busca  TLabelLabel26LeftTop� Width-HeightCaption   Situação:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TDBTextDBText15LeftTop� WidthfHeight	DataFieldSITUACAO_CURSO
DataSource	DSQ_Busca  TDBTextDBText16LeftTopWWidth5Height	DataFieldCAMA
DataSource	DSQ_Busca  TLabelLabel27LeftTopWidth$HeightCaption   Código:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TDBTextDBText17LeftTopWidthiHeight	DataFieldCODIGO
DataSource	DSQ_Busca  TDBTextDBText18LeftTopuWidth� Height	DataFieldSITUACAO
DataSource	DSQ_Busca  TDBTextDBText19Left_Top� Width;Height	DataField
DATA_SAIDA
DataSource	DSQ_Busca  TLabelLabel28LeftTop� Width(HeightCaptionEntrada:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TDBTextDBText20LeftTop� WidthAHeight	DataFieldDATA_ENTRADA
DataSource	DSQ_Busca  TLabelLabel29LeftTop� WidthKHeightCaptionNome CompletoFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TDBTextDBText21LeftTop� Width� Height	DataFieldNOME
DataSource	DSQ_Busca     TJvCaptionPanelJvCaptionPanel_MostrarReservasLeft� TophWidthzHeightButtons Caption+   Hotel --> Relação das Reservas realizadasCaptionPositiondpTopCaptionFont.CharsetDEFAULT_CHARSETCaptionFont.ColorclWhiteCaptionFont.Height�CaptionFont.NameMS Shell Dlg 2CaptionFont.StylefsBold OutlookLookTabOrder TToolBarToolBar5LeftTopWidthjHeight"ButtonHeightButtonWidthtCaptionToolBar_BotoesIniciaisEdgeBordersebTopebBottom Flat	ImagesDM.ImageList_PrincipalIndentList	ParentShowHintShowCaptions	ShowHint	TabOrder  TToolButton#ToolButton_EmissaoRelBoletimEscolarLeftTop Hint    Imprime a relação de reservas.Caption   Imprime Relatório
ImageIndex OnClick(ToolButton_EmissaoRelBoletimEscolarClick  TToolButtonToolButton8LeftTop WidthCaptionToolButton10
ImageIndex!Wrap	StyletbsSeparator  TToolButtonToolButton_selecionaReservaLeftTop7Caption	Localizar
ImageIndex	Visible  TToolButtonToolButton1LeftTop7WidthCaptionToolButton1
ImageIndexWrap	StyletbsSeparator  TToolButtonToolButton_FinalizaRelatorioLeftTopgHintFechar a janela.CaptionRetornar
ImageIndexOnClick!ToolButton_FinalizaRelatorioClick   	TGroupBoxGroupBox_DescricaoLeftTop;WidthjHeight� AlignalClientCaption   < Relação de Reservas >Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder TDBGridDBGrid_MostrarReservasLeftTopWidthfHeight� AlignalClientColorclWhite
DataSourceDSQ_MostrarReservas
FixedColorclOliveFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OptionsdgTitlesdgColumnResize
dgColLinesdgTabsdgRowSelectdgAlwaysShowSelection 
ParentFontReadOnly	TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style Columns	AlignmenttaCenterExpanded	FieldNamePREDIOTitle.AlignmenttaCenterTitle.Caption   PrédioVisible	 	AlignmenttaCenterExpanded	FieldNameAPTOTitle.AlignmenttaCenterTitle.CaptionAptoWidth!Visible	 	AlignmenttaCenterExpanded	FieldNameCAMATitle.AlignmenttaCenterTitle.CaptionCamaWidth,Visible	 Expanded	FieldNamePOSTOTitle.AlignmenttaCenterTitle.CaptionPosto/Grad.Width� Visible	 Expanded	FieldNameNOMETitle.AlignmenttaCenterTitle.CaptionNomeWidthBVisible	 Expanded	FieldNameSITUACAO_CURSOTitle.AlignmenttaCenterTitle.Caption
   SituaçãoWidthaVisible	 	AlignmenttaCenterExpanded	FieldName
DEPENDENTETitle.AlignmenttaCenterTitle.Caption   Nº Dep.Width2Visible	 	AlignmenttaCenterExpanded	FieldNameDATAENTRADATitle.AlignmenttaCenterTitle.CaptionData EntradaWidthWVisible	 	AlignmenttaCenterExpanded	FieldName	DATASAIDATitle.AlignmenttaCenterTitle.Caption   Data SaídaWidthTVisible	     
TStatusBar
StatusBar2LeftTop� WidthjHeightPanelsTextC   Entre com as informações necessarias para criação do relatórioWidth�      TJvCaptionPanelJvCaptionPanel_ResumoLeftfTopWidth;HeightXButtons Caption"   Hotel --> Situação da HospedagemCaptionPositiondpTopCaptionFont.CharsetDEFAULT_CHARSETCaptionFont.ColorclWhiteCaptionFont.Height�CaptionFont.NameMS Shell Dlg 2CaptionFont.StylefsBold OutlookLookTabOrder TToolBarToolBar2LeftTopWidth+Height"ButtonHeightButtonWidthqCaptionToolBar_BotoesIniciaisEdgeBordersebTopebBottom Flat	ImagesDM.ImageList_PrincipalIndentList	ParentShowHintShowCaptions	ShowHint	TabOrder  TToolButtonToolButton_RelResumoOcupacaoLeftTop Hint   Imprimeo resumo de ocupação.CaptionImprime Resumo
ImageIndex OnClick!ToolButton_RelResumoOcupacaoClick  TToolButtonToolButton3LeftTop WidthCaptionToolButton10
ImageIndex!Wrap	StyletbsSeparator  TToolButtonToolButton_FecharResumoLeftTop7HintFechar a janela.CaptionFechar
ImageIndexOnClickToolButton_FecharResumoClick   
TStatusBar
StatusBar3LeftTop6Width+HeightPanelsTextC   Entre com as informações necessarias para criação do relatórioWidth�     TPsyRichEditText1LeftTop;Width+Height� AlignalClientBorderStylebsNoneFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameCourier New
Font.Style HideScrollBarsLines.StringsResumo feito em.: 26/3/2008   Prédio..........: DSitu   ação do    mês.: 03/2008 Dia...........: 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31Total de Vagas: 76 59 58 58 58 58 58 58 56 56 56 56 56 56 57 55 50 50 49 49 49 50 45 39 35 33 33 33 41 41 42Hospedagens...: 190 107 108 108 108 108 108 108 110 110 110 110 110 110 109 111 116 116 117 117 117 116 121 127 131 133 133 133 125 125 124Reservas......: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00Indispon   ível..: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
ParentFont
ScrollBars
ssVerticalTabOrder   TIBQueryIBQuery_MapaDatabaseDM.IBDatabase_HotelLocalTransactionDM.IBTransaction_HotelLocalBufferChunks�CachedUpdatesSQL.Strings~select Identidade, predio, apto, cama, Codigo, ramal, nome, tipo, situacao, situacao_curso, data_entrada, Data_Saida from mapawhere nome  like '%J%'  Left�TopX TIBStringFieldIBQuery_MapaIDENTIDADE	FieldName
IDENTIDADEOriginMAPA.IDENTIDADESize  TIBStringFieldIBQuery_MapaPREDIO	FieldNamePREDIOOriginMAPA.PREDIORequired		FixedChar	Size  TIntegerFieldIBQuery_MapaAPTO	FieldNameAPTOOrigin	MAPA.APTORequired	  TIntegerFieldIBQuery_MapaCAMA	FieldNameCAMAOrigin	MAPA.CAMARequired	  TIBStringFieldIBQuery_MapaRAMAL	FieldNameRAMALOrigin
MAPA.RAMALSize  TIBStringFieldIBQuery_MapaNOME	FieldNameNOMEOrigin	MAPA.NOMESize(  TIBStringFieldIBQuery_MapaTIPO	FieldNameTIPOOrigin	MAPA.TIPO	FixedChar	Size  TIBStringFieldIBQuery_MapaSITUACAO	FieldNameSITUACAOOriginMAPA.SITUACAOSize<  TIBStringFieldIBQuery_MapaSITUACAO_CURSO	FieldNameSITUACAO_CURSOOriginMAPA.SITUACAO_CURSOSize
  TIBStringFieldIBQuery_MapaDATA_ENTRADA	FieldNameDATA_ENTRADAOriginMAPA.DATA_ENTRADASize  TIBStringFieldIBQuery_MapaDATA_SAIDA	FieldName
DATA_SAIDAOriginMAPA.DATA_SAIDASize  TIBStringFieldIBQuery_MapaCODIGO	FieldNameCODIGOOriginMAPA.CODIGORequired	Size   TIBTableIBTable_HotelDatabaseDM.IBDatabase_HotelLocalTransactionDM.IBTransaction_HotelLocalBufferChunks�CachedUpdates	FieldDefsNameCODIGO
Attributes
faRequired DataTypeftStringSize Name
IDENTIDADEDataTypeftStringSize NamePREDIO
AttributesfaFixed DataTypeftStringSize NameAPTODataType	ftInteger NameCAMADataType	ftInteger NameRAMALDataTypeftStringSize NameTV1DataTypeftStringSize
 NameTV2DataTypeftStringSize
 NameTIPO
AttributesfaFixed DataTypeftStringSize NameSITUACAODataTypeftStringSize< NameSITUACAO_CURSODataTypeftStringSize
 NameNOMEDataTypeftStringSize( NameDATA_ENTRADADataTypeftStringSize Name
DATA_SAIDADataTypeftStringSize  	IndexDefsNameRDB$PRIMARY1FieldsCODIGOOptions	ixPrimaryixUnique   	StoreDefs		TableNameMAPALeft�Top�  TDataSourceDSQ_MapaDataSetIBQuery_MapaLeftTop]  TIBQueryIBQuery_VisaoDatabaseDM.IBDatabase_HotelLocalTransactionDM.IBTransaction_HotelLocalBufferChunks�CachedUpdatesSQL.Stringsselect * from VISAOorder by Codigo Left� Top�  TIBStringFieldIBQuery_VisaoCODIGO	FieldNameCODIGOOriginVISAO.CODIGORequired	Size  TIBStringFieldIBQuery_VisaoPREDIO	FieldNamePREDIOOriginVISAO.PREDIORequired		FixedChar	Size  TIntegerFieldIBQuery_VisaoAPTO	FieldNameAPTOOrigin
VISAO.APTORequired	  TIBStringFieldIBQuery_VisaoCAMA	FieldNameCAMAOrigin
VISAO.CAMA	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA01	FieldNameDIA01OriginVISAO.DIA01	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO01	FieldNameTIPO01OriginVISAO.TIPO01	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA02	FieldNameDIA02OriginVISAO.DIA02	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO02	FieldNameTIPO02OriginVISAO.TIPO02	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA03	FieldNameDIA03OriginVISAO.DIA03	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO03	FieldNameTIPO03OriginVISAO.TIPO03	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA04	FieldNameDIA04OriginVISAO.DIA04	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO04	FieldNameTIPO04OriginVISAO.TIPO04	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA05	FieldNameDIA05OriginVISAO.DIA05	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO05	FieldNameTIPO05OriginVISAO.TIPO05	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA06	FieldNameDIA06OriginVISAO.DIA06	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO06	FieldNameTIPO06OriginVISAO.TIPO06	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA07	FieldNameDIA07OriginVISAO.DIA07	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO07	FieldNameTIPO07OriginVISAO.TIPO07	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA08	FieldNameDIA08OriginVISAO.DIA08	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO08	FieldNameTIPO08OriginVISAO.TIPO08	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA09	FieldNameDIA09OriginVISAO.DIA09	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO09	FieldNameTIPO09OriginVISAO.TIPO09	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA10	FieldNameDIA10OriginVISAO.DIA10	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO10	FieldNameTIPO10OriginVISAO.TIPO10	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA11	FieldNameDIA11OriginVISAO.DIA11	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO11	FieldNameTIPO11OriginVISAO.TIPO11	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA12	FieldNameDIA12OriginVISAO.DIA12	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO12	FieldNameTIPO12OriginVISAO.TIPO12	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA13	FieldNameDIA13OriginVISAO.DIA13	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO13	FieldNameTIPO13OriginVISAO.TIPO13	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA14	FieldNameDIA14OriginVISAO.DIA14	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO14	FieldNameTIPO14OriginVISAO.TIPO14	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA15	FieldNameDIA15OriginVISAO.DIA15	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO15	FieldNameTIPO15OriginVISAO.TIPO15	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA16	FieldNameDIA16OriginVISAO.DIA16	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO16	FieldNameTIPO16OriginVISAO.TIPO16	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA17	FieldNameDIA17OriginVISAO.DIA17	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO17	FieldNameTIPO17OriginVISAO.TIPO17	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA18	FieldNameDIA18OriginVISAO.DIA18	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO18	FieldNameTIPO18OriginVISAO.TIPO18	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA19	FieldNameDIA19OriginVISAO.DIA19	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO19	FieldNameTIPO19OriginVISAO.TIPO19	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA20	FieldNameDIA20OriginVISAO.DIA20	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO20	FieldNameTIPO20OriginVISAO.TIPO20	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA21	FieldNameDIA21OriginVISAO.DIA21	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO21	FieldNameTIPO21OriginVISAO.TIPO21	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA22	FieldNameDIA22OriginVISAO.DIA22	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO22	FieldNameTIPO22OriginVISAO.TIPO22	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA23	FieldNameDIA23OriginVISAO.DIA23	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO23	FieldNameTIPO23OriginVISAO.TIPO23	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA24	FieldNameDIA24OriginVISAO.DIA24	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO24	FieldNameTIPO24OriginVISAO.TIPO24	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA25	FieldNameDIA25OriginVISAO.DIA25	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO25	FieldNameTIPO25OriginVISAO.TIPO25	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA26	FieldNameDIA26OriginVISAO.DIA26	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO26	FieldNameTIPO26OriginVISAO.TIPO26	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA27	FieldNameDIA27OriginVISAO.DIA27	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO27	FieldNameTIPO27OriginVISAO.TIPO27	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA28	FieldNameDIA28OriginVISAO.DIA28	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO28	FieldNameTIPO28OriginVISAO.TIPO28	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA29	FieldNameDIA29OriginVISAO.DIA29	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO29	FieldNameTIPO29OriginVISAO.TIPO29	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA30	FieldNameDIA30OriginVISAO.DIA30	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO30	FieldNameTIPO30OriginVISAO.TIPO30	FixedChar	Size  TIBStringFieldIBQuery_VisaoDIA31	FieldNameDIA31OriginVISAO.DIA31	FixedChar	Size  TIBStringFieldIBQuery_VisaoTIPO31	FieldNameTIPO31OriginVISAO.TIPO31	FixedChar	Size   TDataSource	DSQ_VisaoDataSetIBQuery_VisaoLeft� Top�   TIBTableIBTable_MostrarDatabaseDM.IBDatabase_HotelLocalTransactionDM.IBTransaction_HotelLocalBufferChunks�CachedUpdates	FieldDefsNamePREDIODataTypeftStringSize NameAPTODataType	ftInteger NameCAMADataType	ftInteger NameCODIGODataTypeftStringSize NameRAMALDataTypeftStringSize NameTV1DataTypeftStringSize
 NameTV2DataTypeftStringSize
 NameTIPODataTypeftStringSize NameSITUACAODataTypeftStringSize< NameSITUACAO_CURSODataTypeftStringSize
 NameNOMEDataTypeftStringSize( NameDATA_ENTRADADataTypeftStringSize Name
DATA_SAIDADataTypeftStringSize Name
IDENTIDADEDataTypeftStringSize  Filter	Tipo <> 0Filtered		IndexDefsNamePK_MAPAFieldsPREDIO;APTO;CAMA;CODIGOOptionsixUnique   IndexFieldNamesPREDIO;APTOMasterFieldsPREDIO;APTOMasterSource	DSQ_Visao	StoreDefs		TableNameMAPALeft� Top�  TIBStringFieldIBTable_MostrarPREDIO	FieldNamePREDIOSize  TIntegerFieldIBTable_MostrarAPTO	FieldNameAPTO  TIntegerFieldIBTable_MostrarCAMA	FieldNameCAMA  TIBStringFieldIBTable_MostrarCODIGO	FieldNameCODIGOSize  TIBStringFieldIBTable_MostrarRAMAL	FieldNameRAMALSize  TIBStringFieldIBTable_MostrarTV1	FieldNameTV1Size
  TIBStringFieldIBTable_MostrarTV2	FieldNameTV2Size
  TIBStringFieldIBTable_MostrarTIPO	FieldNameTIPOSize  TIBStringFieldIBTable_MostrarSITUACAO	FieldNameSITUACAOSize<  TIBStringFieldIBTable_MostrarSITUACAO_CURSO	FieldNameSITUACAO_CURSOSize
  TIBStringFieldIBTable_MostrarNOME	FieldNameNOMESize(  TIBStringFieldIBTable_MostrarDATA_ENTRADA	FieldNameDATA_ENTRADASize  TIBStringFieldIBTable_MostrarDATA_SAIDA	FieldName
DATA_SAIDASize  TIBStringFieldIBTable_MostrarIDENTIDADE	FieldName
IDENTIDADESize   TDataSourceDST_MostrarDataSetIBTable_MostrarLeft� Top�   TDataSource	DST_VisaoDataSetIBTable_VisaoLeft0Top�   TIBTableIBTable_VisaoDatabaseDM.IBDatabase_HotelLocalTransactionDM.IBTransaction_HotelLocalBufferChunks�CachedUpdates	FieldDefsNameCODIGODataTypeftStringSize NamePREDIODataTypeftStringSize NameAPTODataType	ftInteger NameDIA01DataTypeftStringSize NameTIPO01DataTypeftStringSize NameDIA02DataTypeftStringSize NameTIPO02DataTypeftStringSize NameDIA03DataTypeftStringSize NameTIPO03DataTypeftStringSize NameDIA04DataTypeftStringSize NameTIPO04DataTypeftStringSize NameDIA05DataTypeftStringSize NameTIPO05DataTypeftStringSize NameDIA06DataTypeftStringSize NameTIPO06DataTypeftStringSize NameDIA07DataTypeftStringSize NameTIPO07DataTypeftStringSize NameDIA08DataTypeftStringSize NameTIPO08DataTypeftStringSize NameDIA09DataTypeftStringSize NameTIPO09DataTypeftStringSize NameDIA10DataTypeftStringSize NameTIPO10DataTypeftStringSize NameDIA11DataTypeftStringSize NameTIPO11DataTypeftStringSize NameDIA12DataTypeftStringSize NameTIPO12DataTypeftStringSize NameDIA13DataTypeftStringSize NameTIPO13DataTypeftStringSize NameDIA14DataTypeftStringSize NameTIPO14DataTypeftStringSize NameDIA15DataTypeftStringSize NameTIPO15DataTypeftStringSize NameDIA16DataTypeftStringSize NameTIPO16DataTypeftStringSize NameDIA17DataTypeftStringSize NameTIPO17DataTypeftStringSize NameDIA18DataTypeftStringSize NameTIPO18DataTypeftStringSize NameDIA19DataTypeftStringSize NameTIPO19DataTypeftStringSize NameDIA20DataTypeftStringSize NameTIPO20DataTypeftStringSize NameDIA21DataTypeftStringSize NameTIPO21DataTypeftStringSize NameDIA22DataTypeftStringSize NameTIPO22DataTypeftStringSize NameDIA23DataTypeftStringSize NameTIPO23DataTypeftStringSize NameDIA24DataTypeftStringSize NameTIPO24DataTypeftStringSize NameDIA25DataTypeftStringSize NameTIPO25DataTypeftStringSize NameDIA26DataTypeftStringSize NameTIPO26DataTypeftStringSize NameDIA27DataTypeftStringSize NameTIPO27DataTypeftStringSize NameDIA28DataTypeftStringSize NameTIPO28DataTypeftStringSize NameDIA29DataTypeftStringSize NameTIPO29DataTypeftStringSize NameDIA30DataTypeftStringSize NameTIPO30DataTypeftStringSize NameDIA31DataTypeftStringSize NameTIPO31DataTypeftStringSize NameCAMADataTypeftStringSize  	IndexDefsNamePK_VISAOFieldsCODIGOOptionsixUnique   IndexFieldNamesCODIGOMasterFieldsCODIGOMasterSource	DSQ_Visao	StoreDefs		TableNameVISAOLeft0Top�  TIBStringFieldIBTable_VisaoCODIGO	FieldNameCODIGOSize  TIBStringFieldIBTable_VisaoPREDIO	FieldNamePREDIOSize  TIntegerFieldIBTable_VisaoAPTO	FieldNameAPTO  TIBStringFieldIBTable_VisaoDIA01	FieldNameDIA01Size  TIBStringFieldIBTable_VisaoTIPO01	FieldNameTIPO01Size  TIBStringFieldIBTable_VisaoDIA02	FieldNameDIA02Size  TIBStringFieldIBTable_VisaoTIPO02	FieldNameTIPO02Size  TIBStringFieldIBTable_VisaoDIA03	FieldNameDIA03Size  TIBStringFieldIBTable_VisaoTIPO03	FieldNameTIPO03Size  TIBStringFieldIBTable_VisaoDIA04	FieldNameDIA04Size  TIBStringFieldIBTable_VisaoTIPO04	FieldNameTIPO04Size  TIBStringFieldIBTable_VisaoDIA05	FieldNameDIA05Size  TIBStringFieldIBTable_VisaoTIPO05	FieldNameTIPO05Size  TIBStringFieldIBTable_VisaoDIA06	FieldNameDIA06Size  TIBStringFieldIBTable_VisaoTIPO06	FieldNameTIPO06Size  TIBStringFieldIBTable_VisaoDIA07	FieldNameDIA07Size  TIBStringFieldIBTable_VisaoTIPO07	FieldNameTIPO07Size  TIBStringFieldIBTable_VisaoDIA08	FieldNameDIA08Size  TIBStringFieldIBTable_VisaoTIPO08	FieldNameTIPO08Size  TIBStringFieldIBTable_VisaoDIA09	FieldNameDIA09Size  TIBStringFieldIBTable_VisaoTIPO09	FieldNameTIPO09Size  TIBStringFieldIBTable_VisaoDIA10	FieldNameDIA10Size  TIBStringFieldIBTable_VisaoTIPO10	FieldNameTIPO10Size  TIBStringFieldIBTable_VisaoDIA11	FieldNameDIA11Size  TIBStringFieldIBTable_VisaoTIPO11	FieldNameTIPO11Size  TIBStringFieldIBTable_VisaoDIA12	FieldNameDIA12Size  TIBStringFieldIBTable_VisaoTIPO12	FieldNameTIPO12Size  TIBStringFieldIBTable_VisaoDIA13	FieldNameDIA13Size  TIBStringFieldIBTable_VisaoTIPO13	FieldNameTIPO13Size  TIBStringFieldIBTable_VisaoDIA14	FieldNameDIA14Size  TIBStringFieldIBTable_VisaoTIPO14	FieldNameTIPO14Size  TIBStringFieldIBTable_VisaoDIA15	FieldNameDIA15Size  TIBStringFieldIBTable_VisaoTIPO15	FieldNameTIPO15Size  TIBStringFieldIBTable_VisaoDIA16	FieldNameDIA16Size  TIBStringFieldIBTable_VisaoTIPO16	FieldNameTIPO16Size  TIBStringFieldIBTable_VisaoDIA17	FieldNameDIA17Size  TIBStringFieldIBTable_VisaoTIPO17	FieldNameTIPO17Size  TIBStringFieldIBTable_VisaoDIA18	FieldNameDIA18Size  TIBStringFieldIBTable_VisaoTIPO18	FieldNameTIPO18Size  TIBStringFieldIBTable_VisaoDIA19	FieldNameDIA19Size  TIBStringFieldIBTable_VisaoTIPO19	FieldNameTIPO19Size  TIBStringFieldIBTable_VisaoDIA20	FieldNameDIA20Size  TIBStringFieldIBTable_VisaoTIPO20	FieldNameTIPO20Size  TIBStringFieldIBTable_VisaoDIA21	FieldNameDIA21Size  TIBStringFieldIBTable_VisaoTIPO21	FieldNameTIPO21Size  TIBStringFieldIBTable_VisaoDIA22	FieldNameDIA22Size  TIBStringFieldIBTable_VisaoTIPO22	FieldNameTIPO22Size  TIBStringFieldIBTable_VisaoDIA23	FieldNameDIA23Size  TIBStringFieldIBTable_VisaoTIPO23	FieldNameTIPO23Size  TIBStringFieldIBTable_VisaoDIA24	FieldNameDIA24Size  TIBStringFieldIBTable_VisaoTIPO24	FieldNameTIPO24Size  TIBStringFieldIBTable_VisaoDIA25	FieldNameDIA25Size  TIBStringFieldIBTable_VisaoTIPO25	FieldNameTIPO25Size  TIBStringFieldIBTable_VisaoDIA26	FieldNameDIA26Size  TIBStringFieldIBTable_VisaoTIPO26	FieldNameTIPO26Size  TIBStringFieldIBTable_VisaoDIA27	FieldNameDIA27Size  TIBStringFieldIBTable_VisaoTIPO27	FieldNameTIPO27Size  TIBStringFieldIBTable_VisaoDIA28	FieldNameDIA28Size  TIBStringFieldIBTable_VisaoTIPO28	FieldNameTIPO28Size  TIBStringFieldIBTable_VisaoDIA29	FieldNameDIA29Size  TIBStringFieldIBTable_VisaoTIPO29	FieldNameTIPO29Size  TIBStringFieldIBTable_VisaoDIA30	FieldNameDIA30Size  TIBStringFieldIBTable_VisaoTIPO30	FieldNameTIPO30Size  TIBStringFieldIBTable_VisaoDIA31	FieldNameDIA31Size  TIBStringFieldIBTable_VisaoTIPO31	FieldNameTIPO31Size  TIBStringFieldIBTable_VisaoCAMA	FieldNameCAMASize   TIBQueryIBQuery_Monta_MapaDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdatesSQL.StringsCselect ap.predio, ap.apto, ap.ramal, ac.cama, ac.aptcodigo, ac.nome from apartamento ap, aptocama ac3where (ap.predio = ac.predio and ap.apto = ac.apto)$order by ac.predio, ac.apto, ac.cama  Left@Top`  TDataSourceDSQ_MontaMapaDataSetIBQuery_Monta_MapaLeftbTopa  TIBTableIBTable_Mapa_DepDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdates	FieldDefsName
IDENTIDADEDataTypeftStringSize NameFICHADataTypeftStringSize NameANODataType
ftSmallint NamePREDIODataTypeftStringSize NameAPTODataType
ftSmallint NameCAMADataType
ftSmallint NameNOMEDataTypeftStringSize NameIDADEDataType
ftSmallint  	IndexDefsNameDEPENDENTE_ID_PKFieldsFICHA;ANO;PREDIO;APTO;CAMAOptionsixUnique   IndexFieldNamesIDENTIDADE;FICHA;ANOMasterFieldsIDENTIDADE;FICHA;ANOMasterSourceDST_Resp	StoreDefs		TableName
DEPENDENTELeft� Top8  TIBTableIBTable_HospedagemDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdates	FieldDefsName
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
AttributesfaFixed DataTypeftStringSize  	IndexDefsNameHOSPEDAGEM_ID_PKFieldsIDENTIDADE;FICHA;ANOOptionsixUnique   IndexFieldNamesPREDIO;APTO;CAMAMasterFieldsPREDIO;APTO;CAMAMasterSourceDSQ_MontaMapa	StoreDefs		TableName
HOSPEDAGEMLeft� Toph  TIBTableIBTable_ReservaDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdates	FieldDefsName
IDENTIDADE
AttributesfaFixed DataTypeftStringSize NameDATAENTRADADataType
ftDateTime NameNOMEDataTypeftStringSize( NameNOME_GUERRADataTypeftStringSize NamePOSTODataTypeftStringSize NameDEPENDENTE_DEDataTypeftStringSize NameTELEFONE_FUNCIONALDataTypeftStringSize
 NameSITUACAO_CURSODataTypeftStringSize
 Name	OM_ORIGEMDataTypeftStringSize Name
DEPENDENTEDataType
ftSmallint NameHORAENTRADADataTypeftStringSize Name	DATASAIDADataType
ftDateTime NamePREDIO
AttributesfaFixed DataTypeftStringSize NameAPTODataType
ftSmallint NameCAMADataType
ftSmallint NameRECEBE
AttributesfaFixed DataTypeftStringSize NameUSUARIODataTypeftStringSize
  IndexFieldNamesPREDIO;APTO;CAMAMasterFieldsPREDIO;APTO;CAMAMasterSourceDSQ_MontaMapa	StoreDefs		TableNameRESERVALeft� Top�  TIBTableIBTable_Hospede01DatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdates	FieldDefsName
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
IDENTIDADEMasterFields	APTCODIGOMasterSourceDSQ_MontaMapa	StoreDefs		TableNameHOSPEDELeft� Top�  TDataSourceDataSource2DataSetIBTable_HospedagemLeft� Topi  TIBTableIBTable_HospedeDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdates	FieldDefsName
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
IDENTIDADEMasterSourceDataSource2	StoreDefs		TableNameHOSPEDELeft� Toph  TDataSourceDataSource3DataSetIBTable_HospedeLeftToph  TDataSourceDST_MapaDepDataSetIBTable_Mapa_DepLeft� Top9  TIBQueryIBQuery_BuscaDatabaseDM.IBDatabase_HotelLocalTransactionDM.IBTransaction_HotelLocalBufferChunks�CachedUpdatesSQL.StringsSelect * from Mapa Left�Top�   TDataSource	DSQ_BuscaDataSetIBQuery_BuscaLeft�Top�   TIBTableIBTable_Busca_PostoDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdates	FieldDefsNameCODIGODataTypeftStringSize Name	CODTABELADataTypeftStringSize NamePOSTODataTypeftStringSize  	IndexDefsNameHOSPEDE_ID_PKFields
IDENTIDADEOptionsixUnique   IndexFieldNamesCODIGOMasterFieldsCODIGOMasterSourceDST_Busca_Tabela_Preco	StoreDefs		TableNameTABELA_POSTOLeftpTop� TIBStringFieldIBTable_Busca_PostoCODIGO	FieldNameCODIGOSize  TIBStringFieldIBTable_Busca_PostoCODTABELA	FieldName	CODTABELASize  TIBStringFieldIBTable_Busca_PostoPOSTO	FieldNamePOSTOSize   TDataSourceDST_Busca_PostoDataSetIBTable_Busca_PostoLeft�Top�  TDataSourceDST_Busca_Tabela_PrecoDataSetIBTable_Busca_Tabela_PrecoLeft�Top�  TIBQueryIBQuery_Tabela_PostoDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdatesSQL.Strings4select tpr.predio, tpr.valor, tpo.posto, tpo.codigo 'from tabela_preco tpr, tabela_posto tpo Left�Top� TIBStringFieldIBQuery_Tabela_PostoPREDIO	FieldNamePREDIOOriginTABELA_PRECO.PREDIORequired		FixedChar	Size  TIBBCDFieldIBQuery_Tabela_PostoVALOR	FieldNameVALOROriginTABELA_PRECO.VALORRequired		Precision	Size  TIBStringFieldIBQuery_Tabela_PostoPOSTO	FieldNamePOSTOOriginTABELA_POSTO.POSTOSize  TIBStringFieldIBQuery_Tabela_PostoCODIGO	FieldNameCODIGOOriginTABELA_POSTO.CODIGORequired	Size   TIBTableIBTable_Busca_Tabela_PrecoDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdates	FieldDefsNamePREDIO
Attributes
faRequiredfaFixed DataTypeftStringSize NameCODIGO
Attributes
faRequired DataTypeftStringSize NamePOSTO
Attributes
faRequired DataTypeftStringSize NameVALOR
Attributes
faRequired DataTypeftBCD	Precision	Size  	IndexDefsNameTABELAPRECO_ID_PKFieldsPREDIO;CODIGOOptionsixUnique   IndexFieldNamesPREDIOMasterFieldsPREDIOMasterSource	DSQ_Visao	StoreDefs		TableNameTABELA_PRECOLeftpTop� TIBStringField IBTable_Busca_Tabela_PrecoPREDIO	FieldNamePREDIOSize  TIBStringField IBTable_Busca_Tabela_PrecoCODIGO	FieldNameCODIGOSize   TIBTableIBTable_CadReservaDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelActive	BufferChunks�CachedUpdates	FieldDefsName
IDENTIDADE
AttributesfaFixed DataTypeftStringSize NameDATAENTRADADataType
ftDateTime NameNOMEDataTypeftStringSize( NameNOME_GUERRADataTypeftStringSize NamePOSTODataTypeftStringSize NameDEPENDENTE_DEDataTypeftStringSize NameTELEFONE_FUNCIONALDataTypeftStringSize
 NameSITUACAO_CURSODataTypeftStringSize
 Name	OM_ORIGEMDataTypeftStringSize Name
DEPENDENTEDataType
ftSmallint NameHORAENTRADADataTypeftStringSize Name	DATASAIDADataType
ftDateTime NamePREDIO
AttributesfaFixed DataTypeftStringSize NameAPTODataType
ftSmallint NameCAMADataType
ftSmallint NameRECEBE
AttributesfaFixed DataTypeftStringSize NameUSUARIODataTypeftStringSize
  IndexFieldNames&DATAENTRADA;DATASAIDA;PREDIO;APTO;CAMAMasterFields(DATA_ENTRADA;DATA_SAIDA;PREDIO;APTO;CAMAMasterSource	DSQ_Busca	StoreDefs		TableNameRESERVALeft�Top�  TIBStringFieldIBTable_CadReservaIDENTIDADE	FieldName
IDENTIDADESize  TDateTimeFieldIBTable_CadReservaDATAENTRADA	FieldNameDATAENTRADA  TIBStringFieldIBTable_CadReservaNOME	FieldNameNOMESize(  TIBStringFieldIBTable_CadReservaNOME_GUERRA	FieldNameNOME_GUERRASize  TIBStringFieldIBTable_CadReservaPOSTO	FieldNamePOSTOSize  TIBStringFieldIBTable_CadReservaDEPENDENTE_DE	FieldNameDEPENDENTE_DESize  TIBStringField$IBTable_CadReservaTELEFONE_FUNCIONAL	FieldNameTELEFONE_FUNCIONALSize
  TIBStringField IBTable_CadReservaSITUACAO_CURSO	FieldNameSITUACAO_CURSOSize
  TIBStringFieldIBTable_CadReservaOM_ORIGEM	FieldName	OM_ORIGEM  TSmallintFieldIBTable_CadReservaDEPENDENTE	FieldName
DEPENDENTE  TIBStringFieldIBTable_CadReservaHORAENTRADA	FieldNameHORAENTRADASize  TDateTimeFieldIBTable_CadReservaDATASAIDA	FieldName	DATASAIDA  TIBStringFieldIBTable_CadReservaPREDIO	FieldNamePREDIOSize  TSmallintFieldIBTable_CadReservaAPTO	FieldNameAPTO  TSmallintFieldIBTable_CadReservaCAMA	FieldNameCAMA  TIBStringFieldIBTable_CadReservaRECEBE	FieldNameRECEBESize  TIBStringFieldIBTable_CadReservaUSUARIO	FieldNameUSUARIOSize
   TIBQueryIBQuery_Busca_HospedeDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdatesSQL.Strings@Select identidade, nome, posto, nome_guerra, Telefone_Funcional,%             OM_Origem, situacao, obsfrom hospedeOrder By Nome  Left�Top�   TDataSourceDSQ_Busca_HospedeDataSetIBQuery_Busca_HospedeLeft�Top�   TDataSourceDST_CadReservaDataSetIBTable_CadReservaLeft�Top�   TDataSourceDSQ_MostrarReservasDataSetIBQuery_MostraReservaLeft�Top�   TIBQueryIBQuery_MostraReservaDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdatesSQL.StringsSelect * from reservaorder by nome Left�Top�   TRichPrinterRichPrinter1CompressPreview	MarginTop       �@MarginBottom �t�@��@
MarginLeft       �@MarginRight 8�IS*�@LogoTop       ��	LogoWidth       �@
LogoHeight       �@Header{$TITLE}HeaderFormat>75Footer   Página {$PAGE}FooterFormat>200Font_HeaderFooter.CharsetDEFAULT_CHARSETFont_HeaderFooter.ColorclWindowTextFont_HeaderFooter.Height�Font_HeaderFooter.NameVerdanaFont_HeaderFooter.StylefsBold BorderOffset       � @Options_Dialog Left� Top  TPrintDialogPrintDialog1LeftTop  TIBTableIBTable_HistoricoDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdates	FieldDefsName
IDENTIDADEDataTypeftStringSize NameFICHADataTypeftStringSize NameANODataType
ftSmallint NamePREDIODataTypeftStringSize NameAPTODataType
ftSmallint NameDATAENTRADADataType
ftDateTime NameHORAENTRADADataTypeftStringSize Name	DATASAIDADataType
ftDateTime NameDATAPAGAMENTODataType
ftDateTime NameNRECIBODataTypeftStringSize NameBANCODataTypeftStringSize
 NameNCHEQUEDataTypeftStringSize NamePRACADataTypeftStringSize Name	VALORPAGODataTypeftBCD	Precision	Size NameCUSTO_TELEFONEDataTypeftBCD	Precision	Size NameUSUARIO_ENTRADADataTypeftStringSize
 NameSITUACAO_CURSODataTypeftStringSize
 NameUSUARIO_SAIDADataTypeftStringSize
 NameTIPO_FECHAMENTODataTypeftStringSize NameRECEBIDODataTypeftStringSize NameOBSDataTypeftStringSize�  NameHORA_OPERACAODataTypeftStringSize NameDATA_OPERACAODataType
ftDateTime  	IndexDefsNameHOSPEDE_ID_PKFields
IDENTIDADEOptionsixUnique   IndexFieldNamesIDENTIDADE;PREDIO;APTOMasterFieldsAPTCODIGO;PREDIO;APTOMasterSourceDSQ_MontaMapa	StoreDefs		TableName	HISTORICOLeft� Top� TIBStringFieldIBTable_HistoricoIDENTIDADE	FieldName
IDENTIDADESize  TIBStringFieldIBTable_HistoricoFICHA	FieldNameFICHASize  TSmallintFieldIBTable_HistoricoANO	FieldNameANO  TIBStringFieldIBTable_HistoricoPREDIO	FieldNamePREDIOSize  TSmallintFieldIBTable_HistoricoAPTO	FieldNameAPTO  TDateTimeFieldIBTable_HistoricoDATAENTRADA	FieldNameDATAENTRADA  TDateTimeFieldIBTable_HistoricoDATAPAGAMENTO	FieldNameDATAPAGAMENTO   TIBTableIBTable_RespDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelActive	BufferChunks�CachedUpdates	FieldDefsName
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
AttributesfaFixed DataTypeftStringSize  	IndexDefsNameHOSPEDAGEM_ID_PKFieldsIDENTIDADE;FICHA;ANOOptionsixUnique   IndexFieldNamesPREDIO;APTOMasterFieldsPREDIO;APTOMasterSourceDSQ_MontaMapa	StoreDefs		TableName
HOSPEDAGEMLeft� Top  TDataSourceDST_RespDataSetIBTable_RespLeft� Top  TIBTableIBTable_ResponsavelDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelActive	BufferChunks�CachedUpdates	FieldDefsName
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
AttributesfaFixed DataTypeftStringSize  	IndexDefsNameHOSPEDAGEM_ID_PKFieldsIDENTIDADE;FICHA;ANOOptionsixUnique   IndexFieldNamesPREDIO;APTOMasterFieldsPREDIO;APTOMasterSourceDST_MapaDep	StoreDefs		TableName
HOSPEDAGEMLeft Top8  TDataSourceDST_ResponsavelDataSetIBTable_ResponsavelLeft Top8   