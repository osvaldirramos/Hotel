�
 TFORM_CAD_HOSPEDE 0��  TPF0TForm_Cad_HospedeForm_Cad_HospedeLeftoTopWidth�Height�BorderIcons Caption!Sis-Hotel --> Cadastro de HospedeColor	clBtnFace
ParentFont		Icon.Data
�             �     (       @         �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ���  �����7w{�����  ����ffffg����  ���vfffffc���  ���fffffff{��  ��ffffffffg��  ��fffffffff��  �vwwwwwwwwvk�  �ffx�wwx�wfc�  �ffgwwwwwfff�  �ffDwwwwtFff�  6fdDGwwwDDff;  vfDDDwwtDDFf{  vfDDDH?DDDFf{  vfDDWwEETDFf{  vfw��utwt�Ff{  vfw�G���t�Vf{  vfTDDwwxEGvf{  vfUDWTwtDDFf{  vfEDDH�DDDFf{  vfdDDDtDDDff{  vfdDDGUDDDff{  vffDDG�DDFff{  vffdDH�DDfff{  vfffdGwDffff{  vfffffffffff{  �33333333333�  tGDDDDDDDDDD{  t[DDGuwwt�wD{  ww�DDDDDDDDD{  ;w{W�wwXWwxw{  tDDtDDDDDDDD{  ������������� �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  OldCreateOrder	PositionpoScreenCenter
OnActivate
FormCreatePixelsPerInch`
TextHeight TPanelPanel2Left Top Width�Height�AlignalClientColorclSilverTabOrder  TPanelPanel1Left@TopWidthiHeight�AlignalClient
BevelOuterbvNoneCaptionPanel1TabOrder  TDBGridDBGrid_MapaLeft Top0WidthiHeight�AlignalClientColorclInfoBk
DataSourceDM.DSQ_Mapa
FixedColorclOliveFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OptionsdgTitlesdgIndicatordgColumnResize
dgColLinesdgRowSelectdgAlwaysShowSelection 
ParentFontReadOnly	TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style OnDrawColumnCellDBGrid_MapaDrawColumnCell	OnKeyDownDBGrid_MapaKeyDownColumnsExpanded	FieldNameSITUACAOTitle.AlignmenttaCenterTitle.Caption   POSTO / GRADUAÇÃO - NOMEWidthVisible	 Expanded	FieldNameSITUACAO_CURSOTitle.AlignmenttaCenterTitle.Caption   SITUAÇÃO/CURSOWidth� Visible	 	AlignmenttaCenterExpanded	FieldNameDATA_ENTRADATitle.AlignmenttaCenterTitle.CaptionENTRADAWidthQVisible	 	AlignmenttaCenterExpanded	FieldName
DATA_SAIDATitle.AlignmenttaCenterTitle.Caption   SAÍDAWidthYVisible	    TPanelPanel15Left Top�WidthiHeightAlignalBottomCaptionPanel15TabOrder TJvGradientJvGradient3LeftTopWidthgHeightAlignalClientStyle	grEllipse
StartColorclSilverEndColorclWhiteSteps	  TSpeedButtonSpeedButton_AmpliaMapaLeftTopWidthHeightHintAmplia o Mapa de Hospede
Glyph.Data
z  v  BMv      v   (                                    �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 333933333337�3333339s3333337�333333�C333333s333333�G333333ss�3333<�D333337���3333<�Ds333377�?3333��DC33337�3333��DG3333s7�s�33<��DD3337�7�7�33<��DDs33737�7?33���DDC3337�333���DDG33s?ws�s�<��94DD37�w7�s��<�393tDs7�37�77���3933DCws37�3w�339337Cs337333s	NumGlyphsParentShowHintShowHint	OnClickSpeedButton_AmpliaMapaClick  TSpeedButtonSpeedButton_MostraFichaLeft'TopWidthHeightHintMostra a Ficha do Hospede
Glyph.Data
z  v  BMv      v   (                                    �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� <333�33t7��333�<�33�34D7w?337w3��3�7DG3s�?33��ÓDDC3s�sw3s3<�̔DDs37�7w37�3<�̔DD337?337333�̔DG33333333�̔DC333s�3s333<̔Ds3337�7�333<̔D33337?733333̔G3333333333̔C33333ss33333<�s3333377�33333<�333333773333333�33333333333333�3333333s333	NumGlyphsParentShowHintShowHint	OnClickSpeedButton_MostraFichaClick   TToolBarToolBar2Left Top WidthiHeight0AutoSize	ButtonHeight,ButtonWidthBCaptionInserirImagesDM.ImageList_PrincipalShowCaptions	TabOrder TToolButtonToolButton_HospedarLeft TopHint   Cadastra um novo hóspedeAutoSize	Caption	&Hospedar
ImageIndexOnClickToolButton_HospedarClick  TToolButtonToolButton_AlterarLeft9TopHint-   Permite a alteração dos dados  selecionado.AutoSize	Caption &Alterar  
ImageIndexOnClickToolButton_AlterarClick  TToolButtonToolButton_GravarLeftkTopHint    Grava a inclusão ou alteraçãoAutoSize	Caption	 &Gravar 
ImageIndexOnClickToolButton_GravarClick  TToolButtonToolButton_CancelarLeft� TopHint   Ignora inclusão ou alteraçãoAutoSize	Caption &Cancelar 
ImageIndexParentShowHintShowHint	OnClickToolButton_CancelarClick  TToolButtonToolButton_Fechar_ContaLeft� TopHint'Efetua o fechamento da conta do hospedeAutoSize	Caption	 &Fechar 
ImageIndex"OnClickToolButton_Fechar_ContaClick  TToolButtonToolButton_DesocuparLeft	TopHint<   Descupa apartamento que esta na situação de não desocuparAutoSize	Caption
&Desocupar
ImageIndexOnClickToolButton_DesocuparClick  TToolButtonToolButton_Tabela_PrecoLeftHTopHint   Mostra a tabela de preçoAutoSize	Caption   &Tab. PreçoDropdownMenuDM.PopupMenu_TabelaHospedagem
ImageIndexStyletbsDropDown  TToolButtonToolButton_RetornarLeft�TopHintRetorna para Menu PrincipalAutoSize	Caption	&Retornar
ImageIndexOnClickToolButton_RetornarClick  TToolButtonToolButton_WindowsLeft�TopHintRetorna para o WindowsAutoSize	CaptionWindows
ImageIndexOnClickToolButton_WindowsClick    	TGroupBoxGroupBox_PrincipalLeftTopWidth?Height�AlignalLeftCaption    Informações do Mapa Color	clBtnFaceParentColorTabOrder TSpeedButtonSpeedButton_Atualiza_MapaLeft!Top� WidthHeightHint   Atualiza o mapa de ocupação
Glyph.Data
�   �   BM�       v   (               x                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� wwwwwwpwwwwwx wwwwwp �wx  �Hww �� ��wp���ww����ww����ww����ww����pww����ww�����wwp��www �� wwwwx  �wwwParentShowHintShowHint	OnClickSpeedButton_Atualiza_MapaClick  TLabelLabel2LeftToplWidthHeightCaption   PrédioFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTransparent  TLabelLabel18LeftTop� WidthNHeightCaptionNome de GuerraFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTransparent	  TLabelLabel19Left� Top� WidthKHeightCaptionNome CompletoFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTransparent	  TLabelLabel_SelAptoLeft� ToplWidthHeightCaptionAptoFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTransparent	  TLabelLabel5Left� ToplWidthHeightCaptionRamalFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTransparent	  TPanelPanel4LeftTopWidth;HeightVAlignalTop
BevelInnerbvRaised
BevelOuter	bvLoweredColorclSilverTabOrder  TPanelPanel42Left� TopWidth� HeightRAlignalClient
BevelOuterbvNoneTabOrder  TPanelPanel10Left TopWidth� HeightAlignalTop	AlignmenttaLeftJustify
BevelInner	bvLoweredCaption            OcupadoTabOrder  TPanelPanel13LeftTopWidthHeightAlignalLeftColorclTealTabOrder    TPanelPanel18Left Top%Width� HeightAlignalTop	AlignmenttaLeftJustify
BevelInner	bvLoweredCaption            DesocupadoTabOrder TPanelPanel21LeftTopWidthHeightAlignalLeftColorclInfoBkFont.CharsetDEFAULT_CHARSET
Font.ColorclWhiteFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder    TPanelPanel7Left Top8Width� HeightAlignalTop	AlignmenttaLeftJustify
BevelInner	bvLoweredCaption"               Data de saída vencidaTabOrder TPanelPanel12LeftTopWidthHeightAlignalLeftColorclAquaTabOrder    TPanelPanel8Left Top Width� HeightAlignalTop
BevelOuterbvNoneTabOrder   TPanelPanel43LeftTopWidth� HeightRAlignalLeft
BevelOuterbvNoneTabOrder TPanelPanel44Left Top Width� HeightAlignalTop
BevelOuterbvNoneCaptionLEGENDA:Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFontTabOrder   TPanelPanel45Left TopWidth� HeightAlignalTop	AlignmenttaLeftJustify
BevelInner	bvLoweredCaption            ReservaTabOrder TPanelPanel47LeftTopWidthHeightAlignalLeftColorclRedTabOrder    TPanelPanel48Left Top8Width� HeightAlignalTop	AlignmenttaLeftJustify
BevelInner	bvLoweredCaption               Não OcuparTabOrder TPanelPanel50LeftTopWidthHeightAlignalLeftColorclYellowTabOrder    TPanelPanel5Left Top%Width� HeightAlignalTop
BevelInner	bvLoweredCaption       Não DesocupadoTabOrder TPanelPanel14LeftTopWidthHeightAlignalLeftColorclBlueTabOrder      TPanelPanel_MostraHospedeLeftTop� Width<Height(
BevelInner	bvLoweredTabOrder TJvGradientJvGradient2LeftTopWidth8Height$AlignalClientStyle	grEllipseEndColorclWhiteSteps  TDBTextDBText_NomeLeftTopWidth)Height	DataFieldNOME
DataSourceDM.DSQ_MapaFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFontTransparent	  TDBTextDBText3Left� TopWidth%Height	DataFieldRAMAL
DataSourceDM.DSQ_MapaFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFontTransparent	  TDBTextDBText2Left'TopWidthHeight	DataFieldAPTO
DataSourceDM.DSQ_MapaFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFontTransparent	  TDBTextDBText1LeftTopWidthHeight	DataFieldPREDIO
DataSourceDM.DSQ_MapaFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFontTransparent	  TLabelLabel1LeftNTopWidth2HeightCaption- RamalFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFontTransparent	  TLabelLabel4LeftTopWidthHeightCaption-Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFontTransparent	   TProgressBarProgressBar1LeftTop� WidthHeightTabOrder  	TMaskEditMaskEdit_Busca_Nome_CompletoLeft� Top� Width� HeightCharCaseecUpperCaseColorclInfoBk	MaxLengthTabOrderOnChange"MaskEdit_Busca_Nome_CompletoChange  	TMaskEditMaskEdit_Nome_GuerraLeftTop� Width[HeightCharCaseecUpperCaseColorclInfoBkTabOrderOnChangeMaskEdit_Nome_GuerraChange  	TComboBoxComboBox_PredioLeftTopzWidthHHeightColorclInfoBk
ItemHeightTabOrderText1OnChangeComboBox_Busca_PredioChange	OnKeyDownComboBox_PredioKeyDownItems.StringsTodos123   	TMaskEditMaskEdit_AptoLeft� TopzWidth2HeightHint    Busca o prédio por apartamento.CharCaseecUpperCaseColorclInfoBkEditMask9999;0; 	MaxLengthParentShowHintShowHint	TabOrderOnChangeMaskEdit_AptoChange  	TMaskEditMaskEdit_RamalLeft� TopzWidthDHeightCharCaseecUpperCaseColorclInfoBkEditMask9999;0; 	MaxLengthTabOrderOnChangeMaskEdit_RamalChange    
TStatusBar	StatusBarLeft Top�Width�HeightPanelsWidthP TextSelecione a opcao desejadaWidth�     TPanelPanel_FichaHospedeLeft Top�Width�Height� AlignalBottom
BevelInner	bvLoweredBorderWidthColorclInactiveCaptionTabOrder TLabel
Label_momeLeftTop:Width"HeightCaptionNome: Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel3Left�Top:Width$HeightCaption	   Prédio: Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel6LeftTopmWidthJHeightCaptionNacionalidade: Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel7Left$TopmWidth8HeightCaptionIdentidade: Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel8Left$TopTWidth=HeightCaptionPosto/Grad.:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel_Telefone_ResidencialLeftTop� WidthjHeightCaptionTelefone Residencial.:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel13Left$Top� Width;HeightCaptionOM Origem.:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel_Nome_GuerraLeftTopTWidthQHeightCaptionNome de Guerra:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel10Left$Top� WidthaHeightCaptionTelefone Funcional.:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel12LeftTop� Width>HeightCaptionDependente:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel_Situacao_CursoLeftTop� WidthPHeightCaption   Situação/Curso.:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel14LeftBTop� WidthQHeightCaptionData de Entrada:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel15Left� Top� WidthQHeightCaptionHora de Entrada:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel16LeftTop� WidthLHeightCaption   Data de Saída: Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel_RecebimentoLeftTop� WidthEHeightCaptionRecebimento: Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel_Local_RecebimentoLeft� Top� Width� HeightCaption)( H-Hotel / T-Tesouraria / C - Cortesia )Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel_Ficha_HospedeLeftTopWidth� HeightCaption   Ficha NúmeroFont.CharsetANSI_CHARSET
Font.ColorclWhiteFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFont  TLabelLabel_Dependente_deLeft(TopTWidthMHeightCaptionDependente de:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel17LeftTopWidth� HeightCaption   Ficha NúmeroFont.CharsetANSI_CHARSET
Font.ColorclMaroonFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFontTransparent	  TSpeedButtonSpeedButton_PredioLeftTop4WidthHeightHint   Seleciona o prédio.
Glyph.Data
z  v  BMv      v   (                                    �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 33333333?�333333Ds333333w��33333tDs333337w?�33334DDs33337?w?�3333DDDs3333s�w?�333tDDDs3337�3w?�334DDDDs337?33w?�33DDDDDs?����w���������wwwwww3w33�����333s33?w33<����3337�3?w333<���333373?w3333���33333s?w3333<��333337�w33333<�3333337w333333�3333333w3333333	NumGlyphsParentShowHintShowHint	OnClickSpeedButton_PredioClick  TSpeedButtonSpeedButton_IdentidadeLeftTophWidthHeightHint   Seleciona o prédio.
Glyph.Data
z  v  BMv      v   (                                    �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 33333333?�333333Ds333333w��33333tDs333337w?�33334DDs33337?w?�3333DDDs3333s�w?�333tDDDs3337�3w?�334DDDDs337?33w?�33DDDDDs?����w���������wwwwww3w33�����333s33?w33<����3337�3?w333<���333373?w3333���33333s?w3333<��333337�w33333<�3333337w333333�3333333w3333333	NumGlyphsParentShowHintShowHint	OnClickSpeedButton_IdentidadeClick  TSpeedButtonSpeedButton_DependenteLeftsTop� WidthHeightHint3Chama janela de tratamento dos dados do dependente.
Glyph.Data
z  v  BMv      v   (                                    �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 33333333?�333333Ds333333w��33333tDs333337w?�33334DDs33337?w?�3333DDDs3333s�w?�333tDDDs3337�3w?�334DDDDs337?33w?�33DDDDDs?����w���������wwwwww3w33�����333s33?w33<����3337�3?w333<���333373?w3333���33333s?w3333<��333337�w33333<�3333337w333333�3333333w3333333	NumGlyphsParentShowHintShowHint	OnClickSpeedButton_DependenteClick  TLabelLabel20Left!Top� Width>HeightCaptionOM Destino.:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel9Left#Top� Width9HeightCaptionSexo..........:Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  	TMaskEditMaskEdit_FichaLeft� TopWidthCHeightCharCaseecUpperCaseFont.CharsetDEFAULT_CHARSET
Font.ColorclMaroonFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 	MaxLength
ParentFontTabOrder 
OnKeyPressMaskEdit_FichaKeyPress  	TMaskEditMaskEdit_NomeLeft+Top3Width!HeightCharCaseecUpperCase	MaxLength(TabOrderOnExitMaskEdit_NomeExit  	TMaskEditMaskEdit_Nome_de_GuerraLeft]TopMWidth� HeightCharCaseecUpperCase	MaxLengthTabOrder  	TComboBoxComboBox_Posto_GraduacaoLeftfTopMWidth� HeightCharCaseecUpperCase
ItemHeight	MaxLengthTabOrder  	TMaskEditMaskEdit_NacionalidadeLeftRTopgWidthXHeightCharCaseecUpperCase	MaxLengthTabOrder  	TMaskEditMaskEdit_IdentidadeLeftfTopgWidth� HeightCharCaseecUpperCaseEditMask999999999999;0; 	MaxLengthTabOrderOnExitMaskEdit_IdentidadeExit  	TMaskEditMaskEdit_Telefone_ResidencialLeftwTop� WidthfHeightCharCaseecUpperCaseEditMask(cc) c999-9999;0; 	MaxLengthTabOrder  	TMaskEditMaskEdit_Telefone_FuncionalLeft�Top� WidthfHeightCharCaseecUpperCaseEditMask(cc) c999-9999;0; 	MaxLengthTabOrder	  	TMaskEditMaskEdit_Hora_EntradaLeft� Top� Width$HeightCharCaseecUpperCaseEditMask	99:99;0; 	MaxLengthTabOrder  	TComboBoxComboBox_RecebimentoLeftMTop� Width/HeightCharCaseecUpperCase
ItemHeight	MaxLengthTabOrderTextTItems.StringsHTC   TDateTimePickerDateTimePicker_EntradaLeft�Top� Width\HeightDate �c���<�@Time �c���<�@TabOrder  TDateTimePickerDateTimePicker_SaidaLeftfTop� Width]HeightDate �c���<�@Time �c���<�@TabOrder  	TMaskEditMaskEdit_DependenteLeftLTop� Width#HeightCharCaseecUpperCaseEditMask9;0; 	MaxLengthTabOrder  	TComboBoxComboBox_Dependente_deLeftwTopMWidth� HeightCharCaseecUpperCase
ItemHeight	MaxLengthTabOrder  TRadioGroupRadioGroup_DescontoLeft�TopWidth� Height!Caption   Continuação HospedagemColor	clBtnFaceColumns	ItemIndex Items.Strings   NãoSim ParentColorTabOrder  	TComboBoxComboBox_OM_OrigemLeftbTop� Width� HeightCharCaseecUpperCase
ItemHeight	MaxLengthTabOrderOnExitComboBox_OM_OrigemExit  	TComboBoxComboBox_Situacao_CursoLeft]Top� Width� HeightStylecsDropDownListCharCaseecUpperCase
ItemHeightTabOrder
Items.StringsTRANSITO	RESIDENTE	CURSO<30D	CURSO>30D	CURSO PNR
VISITA ESP   TEditEdit_PredioLeft�Top3Width%HeightCharCaseecUpperCase	MaxLengthReadOnly	TabOrder  TEdit	Edit_AptoLeft�Top3Width.HeightCharCaseecUpperCaseReadOnly	TabOrder  TPanelPanel_AvisoLeft%TopWidthaHeight
BevelInner	bvLoweredTabOrderVisible TJvBlinkingLabelJvBlinkingLabel1LeftTopWidthUHeightCaption+Verifique se esta digitando a ficha corretaFont.CharsetANSI_CHARSET
Font.ColorclMaroonFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFontHotTrackFont.CharsetDEFAULT_CHARSETHotTrackFont.ColorclWindowTextHotTrackFont.Height�HotTrackFont.NameMS Sans SerifHotTrackFont.Style    TToolBar_PatenteLeft~Top� WidthcHeight#AlignalNoneButtonHeightButtonWidthMCaption_PatenteEdgeBorders ImagesDM.ImageList_PrincipalList	ShowCaptions	TabOrder TToolButtonToolButton_PatentesLeft TopHint*   Mostra as patentes de acordo com a força.CaptionPatentes
ImageIndex%OnClickToolButton_PatentesClick   	TComboBoxComboBox_OM_DestinoLeftdTop� Width� HeightCharCaseecUpperCase
ItemHeight	MaxLengthTabOrderOnExitComboBox_OM_OrigemExit  	TComboBoxComboBox_SexoLefteTop{Width/HeightCharCaseecUpperCase
ItemHeight	MaxLengthTabOrderTextMItems.StringsMF    TDataSourceDST_CadHospedeDataSetIBTable_CadHospedeLeftxTop`  TDataSourceDST_CadHospedagemDataSetIBTable_CadHospedagemLeftxTop0  TDataSourceDST_Busca_Tabela_PrecoDataSetIBTable_Busca_Tabela_PrecoLeft� Top�   TDataSourceDST_Busca_PostoDataSetIBTable_Busca_PostoLeft� Toph  TDataSourceDSQ_Busca_HospedeDataSetIBQuery_Busca_HospedeLeftwTop�   TDataSourceDSQ_CamaDataSetIBQuery_CamaLeft� Top  TDataSourceDSQ_Atualiza_CamaDataSetIBQuery_Atualiza_CamaLeft(Top�   TDataSourceDSQ_Busca_PredioDataSetIBQuery_Busca_PredioLeft	Top  TDataSourceDSQ_Sel_DepDataSetIBQuery_Sel_DepLeft� TopE  TDataSourceDST_DependenteDataSetIBTable_DependenteLeftPTopH  TDataSourceDSQ_Monta_MapaDataSetIBQuery_Monta_MapaLeft�Top�   TDataSourceDST_HospedagemDataSetIBTable_HospedagemLeft�Top�   TDataSourceDST_HospedeDataSetIBTable_HospedeLeft8Top�   TIBQueryIBQuery_Busca_PredioDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdatesSQL.StringsSelect * from apartamento Left� Top  TIBTableIBTable_CadHospedagemDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelAfterScroll IBTable_CadHospedagemAfterScrollOnPostErrorIBTable_CadHospedagemPostErrorBufferChunks�CachedUpdates	FieldDefsName
IDENTIDADEDataTypeftStringSize NameFICHADataTypeftStringSize NameANODataType
ftSmallint NamePREDIODataTypeftStringSize NameAPTODataType
ftSmallint NameCAMADataType
ftSmallint NameDATAENTRADADataTypeftStringSize NameHORAENTRADADataTypeftStringSize Name	DATASAIDADataTypeftStringSize Name
DEPENDENTEDataType
ftSmallint NameSITUACAO_HOSPEDAGEMDataTypeftStringSize
 NameRECEBEDataTypeftStringSize NameDESCONTODataTypeftStringSize  	IndexDefsNameHOSPEDAGEM_ID_PKFieldsIDENTIDADE;FICHA;ANOOptionsixUnique   IndexFieldNamesIDENTIDADE;PREDIO;APTO;CAMAMasterFieldsIDENTIDADE;PREDIO;APTO;CAMAMasterSourceDM.DSQ_Mapa	StoreDefs		TableName
HOSPEDAGEMLeftXTop0 TIBStringFieldIBTable_CadHospedagemIDENTIDADE	FieldName
IDENTIDADESize  TIBStringFieldIBTable_CadHospedagemFICHA	FieldNameFICHASize  TSmallintFieldIBTable_CadHospedagemANO	FieldNameANO  TIBStringFieldIBTable_CadHospedagemPREDIO	FieldNamePREDIOSize  TSmallintFieldIBTable_CadHospedagemAPTO	FieldNameAPTO  TSmallintFieldIBTable_CadHospedagemCAMA	FieldNameCAMA  TIBStringField IBTable_CadHospedagemDATAENTRADA	FieldNameDATAENTRADAEditMask99/99/9999;0; Size  TIBStringField IBTable_CadHospedagemHORAENTRADA	FieldNameHORAENTRADAEditMask	99:99;0; Size  TIBStringFieldIBTable_CadHospedagemDATASAIDA	FieldName	DATASAIDAEditMask99/99/9999;0; Size  TSmallintFieldIBTable_CadHospedagemDEPENDENTE	FieldName
DEPENDENTE  TIBStringField(IBTable_CadHospedagemSITUACAO_HOSPEDAGEM	FieldNameSITUACAO_HOSPEDAGEMSize
  TIBStringFieldIBTable_CadHospedagemRECEBE	FieldNameRECEBEEditMaskc;0; Size  TIBStringFieldIBTable_CadHospedagemDESCONTO	FieldNameDESCONTOSize   TIBTableIBTable_CadHospedeDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelOnPostErrorIBTable_CadHospedePostErrorBufferChunks�CachedUpdates	FieldDefsName
IDENTIDADEDataTypeftStringSize NameNOMEDataTypeftStringSize( NameNOME_GUERRADataTypeftStringSize NamePOSTODataTypeftStringSize NameDEPENDENTE_DEDataTypeftStringSize NameNACIONALIDADEDataTypeftStringSize NameTELEFONE_RESIDENCIALDataTypeftStringSize
 NameTELEFONE_FUNCIONALDataTypeftStringSize
 NameSITUACAO_CURSODataTypeftStringSize
 Name
RESIDENCIADataTypeftStringSize( NameNUMERODataTypeftStringSize
 NameCIDADEDataTypeftStringSize( NameBAIRRODataTypeftStringSize( NameESTADODataTypeftStringSize Name	OM_ORIGEMDataTypeftStringSize NameSITUACAODataTypeftStringSize NameOBSDataTypeftStringSize2 NameSEXODataTypeftStringSize  	IndexDefsNameHOSPEDE_ID_PKFields
IDENTIDADEOptionsixUnique   IndexFieldNames
IDENTIDADEMasterFields
IDENTIDADEMasterSourceDST_CadHospedagem	StoreDefs		TableNameHOSPEDELeftXTop\ TIBStringFieldIBTable_CadHospedeIDENTIDADE	FieldName
IDENTIDADESize  TIBStringFieldIBTable_CadHospedeNOME	FieldNameNOMESize(  TIBStringFieldIBTable_CadHospedeNOME_GUERRA	FieldNameNOME_GUERRASize  TIBStringFieldIBTable_CadHospedePOSTO	FieldNamePOSTOSize  TIBStringFieldIBTable_CadHospedeDEPENDENTE_DE	FieldNameDEPENDENTE_DESize  TIBStringFieldIBTable_CadHospedeNACIONALIDADE	FieldNameNACIONALIDADESize  TIBStringField&IBTable_CadHospedeTELEFONE_RESIDENCIAL	FieldNameTELEFONE_RESIDENCIALSize
  TIBStringField$IBTable_CadHospedeTELEFONE_FUNCIONAL	FieldNameTELEFONE_FUNCIONALSize
  TIBStringField IBTable_CadHospedeSITUACAO_CURSO	FieldNameSITUACAO_CURSOSize
  TIBStringFieldIBTable_CadHospedeRESIDENCIA	FieldName
RESIDENCIASize(  TIBStringFieldIBTable_CadHospedeNUMERO	FieldNameNUMEROSize
  TIBStringFieldIBTable_CadHospedeCIDADE	FieldNameCIDADESize(  TIBStringFieldIBTable_CadHospedeBAIRRO	FieldNameBAIRROSize(  TIBStringFieldIBTable_CadHospedeESTADO	FieldNameESTADOSize  TIBStringFieldIBTable_CadHospedeOM_ORIGEM	FieldName	OM_ORIGEM  TIBStringFieldIBTable_CadHospedeSITUACAO	FieldNameSITUACAOSize  TIBStringFieldIBTable_CadHospedeOBS	FieldNameOBSSize2  TIBStringFieldIBTable_CadHospedeSEXO	FieldNameSEXOSize   TIBQueryIBQuery_Busca_HospedeDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdatesSQL.StringsSelect * from Hospede LeftXTop�   TIBQueryIBQuery_Atualiza_CamaDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdatesSQL.Strings
Select  * from AptoCamaWhere Predio = 'A'and      Apto = '3' LeftTop�  TIBStringFieldIBQuery_Atualiza_CamaPREDIO	FieldNamePREDIOOriginAPTOCAMA.PREDIORequired		FixedChar	Size  TSmallintFieldIBQuery_Atualiza_CamaAPTO	FieldNameAPTOOriginAPTOCAMA.APTORequired	  TSmallintFieldIBQuery_Atualiza_CamaCAMA	FieldNameCAMAOriginAPTOCAMA.CAMARequired	  TIBStringFieldIBQuery_Atualiza_CamaAPTCODIGO	FieldName	APTCODIGOOriginAPTOCAMA.APTCODIGOSize  TIBStringFieldIBQuery_Atualiza_CamaNOME	FieldNameNOMEOriginAPTOCAMA.NOMESize   TIBQueryIBQuery_DeceaDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdatesSQL.StringsSelect * from Tabela_Deceaorder by localidade Left8TopH TIBStringFieldIBQuery_DeceaLOCALIDADE	FieldName
LOCALIDADEOriginTABELA_DECEA.LOCALIDADERequired	   TIBQueryIBQuery_Tabela_PostoDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdatesSQL.StringsSelect * from Tabela_Deceaorder by localidade LeftXTopH  TIBQueryIBQuery_Exclui_ReservaDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdatesSQL.StringsSelect * from Tabela_Deceaorder by localidade LeftxTopH  TIBQueryIBQuery_Sel_DepDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdatesSQL.StringsSelect * from dependente Left� TopH  TIBQueryIBQuery_CamaDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdatesSQL.StringsSelect * from Hospede  Left� Top  TIBQueryIBQuery_Monta_MapaDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelActive	BufferChunks�CachedUpdatesSQL.StringsCselect ap.predio, ap.apto, ap.ramal, ac.cama, ac.aptcodigo, ac.nome from apartamento ap, aptocama ac3where (ap.predio = ac.predio and ap.apto = ac.apto)and ap.predio = '3'$order by ac.predio, ac.apto, ac.cama  Left`Top�   TIBTableIBTable_Busca_PostoDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdates	FieldDefsNameCODIGODataTypeftStringSize Name	CODTABELADataTypeftStringSize NamePOSTODataTypeftStringSize  	IndexDefsNameHOSPEDE_ID_PKFields
IDENTIDADEOptionsixUnique   IndexFieldNamesCODIGOMasterFieldsCODIGOMasterSourceDST_Busca_Tabela_Preco	StoreDefs		TableNameTABELA_POSTOLeft� Topd TIBStringFieldIBTable_Busca_PostoCODIGO	FieldNameCODIGOSize  TIBStringFieldIBTable_Busca_PostoCODTABELA	FieldName	CODTABELASize  TIBStringFieldIBTable_Busca_PostoPOSTO	FieldNamePOSTOSize   TIBTableIBTable_Busca_Tabela_PrecoDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdates	FieldDefsNamePREDIO
Attributes
faRequiredfaFixed DataTypeftStringSize NameCODIGO
Attributes
faRequired DataTypeftStringSize NamePOSTO
Attributes
faRequired DataTypeftStringSize NameVALOR
Attributes
faRequired DataTypeftBCD	Precision	Size  	IndexDefsNameTABELAPRECO_ID_PKFieldsPREDIO;CODIGOOptionsixUnique   IndexFieldNamesPREDIOMasterFieldsPREDIOMasterSourceDSQ_Busca_Predio	StoreDefs		TableNameTABELA_PRECOLeft� Top�  TIBStringField IBTable_Busca_Tabela_PrecoPREDIO	FieldNamePREDIOSize  TIBStringField IBTable_Busca_Tabela_PrecoCODIGO	FieldNameCODIGOSize   TIBTableIBTable_CadReservaDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdates	FieldDefsName
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
  IndexFieldNamesDATAENTRADA;PREDIO;APTO;CAMAMasterFieldsDATA_ENTRADA;PREDIO;APTO;CAMAMasterSourceDM.DSQ_Mapa	StoreDefs		TableNameRESERVALeft� Top�  TIBTableIBTable_FichaDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdates	FieldDefsNameFICHA
Attributes
faRequiredfaFixed DataTypeftStringSize  	StoreDefs		TableNameFICHALeftTop� TIBStringFieldIBTable_FichaFICHA	FieldNameFICHASize   TIBTableIBTable_Atualiza_CamaDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdates	FieldDefsNamePREDIODataTypeftStringSize NameAPTODataType
ftSmallint NameCAMADataType
ftSmallint Name	APTCODIGODataTypeftStringSize NameNOMEDataTypeftStringSize  IndexFieldNamesPREDIO;APTO;CAMAMasterFieldsPREDIO;APTO;CAMAMasterSourceDSQ_Atualiza_Cama	StoreDefs		TableNameAPTOCAMALeftHTop�  TIBStringFieldIBTable_Atualiza_CamaPREDIO	FieldNamePREDIOSize  TSmallintFieldIBTable_Atualiza_CamaAPTO	FieldNameAPTO  TSmallintFieldIBTable_Atualiza_CamaCAMA	FieldNameCAMA  TIBStringFieldIBTable_Atualiza_CamaAPTCODIGO	FieldName	APTCODIGOSize  TIBStringFieldIBTable_Atualiza_CamaNOME	FieldNameNOMESize   TIBTableIBTable_HistoricoDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelOnPostErrorIBTable_HistoricoPostErrorBufferChunks�CachedUpdates	FieldDefsName
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
ftDateTime  	IndexDefsNameHISTORICO_ID_PKFieldsIDENTIDADE;FICHA;ANOOptionsixUnique   IndexFieldNames	FICHA;ANOMasterFields	FICHA;ANOMasterSourceDST_CadHospedagem	StoreDefs		TableName	HISTORICOLeftXTop�  TIBStringFieldIBTable_HistoricoIDENTIDADE	FieldName
IDENTIDADERequired		FixedChar	Size  TIBStringFieldIBTable_HistoricoFICHA	FieldNameFICHARequired	Size  TSmallintFieldIBTable_HistoricoANO	FieldNameANORequired	  TIBStringFieldIBTable_HistoricoPREDIO	FieldNamePREDIO	FixedChar	Size  TSmallintFieldIBTable_HistoricoAPTO	FieldNameAPTO  TDateTimeFieldIBTable_HistoricoDATAENTRADA	FieldNameDATAENTRADA  TIBStringFieldIBTable_HistoricoHORAENTRADA	FieldNameHORAENTRADASize  TDateTimeFieldIBTable_HistoricoDATASAIDA	FieldName	DATASAIDA  TDateTimeFieldIBTable_HistoricoDATAPAGAMENTO	FieldNameDATAPAGAMENTO  TIBStringFieldIBTable_HistoricoNRECIBO	FieldNameNRECIBOSize  TIBStringFieldIBTable_HistoricoBANCO	FieldNameBANCOSize
  TIBStringFieldIBTable_HistoricoNCHEQUE	FieldNameNCHEQUESize  TIBStringFieldIBTable_HistoricoPRACA	FieldNamePRACASize  TIBBCDFieldIBTable_HistoricoVALORPAGO	FieldName	VALORPAGO	Precision	Size  TIBBCDFieldIBTable_HistoricoCUSTO_TELEFONE	FieldNameCUSTO_TELEFONE	Precision	Size  TIBStringField IBTable_HistoricoUSUARIO_ENTRADA	FieldNameUSUARIO_ENTRADASize
  TIBStringFieldIBTable_HistoricoSITUACAO_CURSO	FieldNameSITUACAO_CURSOSize
  TIBStringFieldIBTable_HistoricoUSUARIO_SAIDA	FieldNameUSUARIO_SAIDASize
  TIBStringField IBTable_HistoricoTIPO_FECHAMENTO	FieldNameTIPO_FECHAMENTO	FixedChar	Size  TIBStringFieldIBTable_HistoricoRECEBIDO	FieldNameRECEBIDO	FixedChar	Size  TIBStringFieldIBTable_HistoricoOBS	FieldNameOBSSize�   TIBStringFieldIBTable_HistoricoHORA_OPERACAO	FieldNameHORA_OPERACAOSize  TDateTimeFieldIBTable_HistoricoDATA_OPERACAO	FieldNameDATA_OPERACAO   TIBTableIBTable_DependenteDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdates	FieldDefsName
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
ftSmallint NameNOMEDataTypeftStringSize NameIDADEDataType
ftSmallint  	IndexDefsNameDEPENDENTE_ID_PKFieldsFICHA;ANO;PREDIO;APTO;CAMAOptionsixUnique   IndexFieldNames	FICHA;ANOMasterFields	FICHA;ANOMasterSourceDSQ_Sel_Dep	StoreDefs		TableName
DEPENDENTELeft0TopH TIBStringFieldIBTable_DependenteIDENTIDADE	FieldName
IDENTIDADESize  TIBStringFieldIBTable_DependenteFICHA	FieldNameFICHASize  TSmallintFieldIBTable_DependenteANO	FieldNameANO  TIBStringFieldIBTable_DependentePREDIO	FieldNamePREDIOSize  TSmallintFieldIBTable_DependenteAPTO	FieldNameAPTO  TSmallintFieldIBTable_DependenteCAMA	FieldNameCAMA  TIBStringFieldIBTable_DependenteNOME	FieldNameNOMEEditMask#>cccccccccccccccccccccccccccccc;0; Size  TSmallintFieldIBTable_DependenteIDADE	FieldNameIDADEDisplayFormat00
EditFormat00   TIBTableIBTable_HospedagemDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdates	FieldDefsName
IDENTIDADEDataTypeftStringSize NameFICHADataTypeftStringSize NameANODataType
ftSmallint NamePREDIODataTypeftStringSize NameAPTODataType
ftSmallint NameCAMADataType
ftSmallint NameDATAENTRADADataTypeftStringSize NameHORAENTRADADataTypeftStringSize Name	DATASAIDADataTypeftStringSize Name
DEPENDENTEDataType
ftSmallint NameSITUACAO_HOSPEDAGEMDataTypeftStringSize
 NameRECEBEDataTypeftStringSize NameDESCONTODataTypeftStringSize  	IndexDefsNameDEPENDENTE_ID_PKFieldsFICHA;ANO;PREDIO;APTO;CAMAOptionsixUnique   IndexFieldNamesPREDIO;APTO;CAMAMasterFieldsPREDIO;APTO;CAMAMasterSourceDSQ_Monta_Mapa	StoreDefs		TableName
HOSPEDAGEMLeft�Top�   TIBTableIBTable_HospedeDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdates	FieldDefsName
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
IDENTIDADEMasterSourceDST_Hospedagem	StoreDefs		TableNameHOSPEDELeftTop�   TIBTableIBTable_ReservaDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdates	FieldDefsName
IDENTIDADEDataTypeftStringSize NameDATAENTRADADataType
ftDateTime NameNOMEDataTypeftStringSize( NameNOME_GUERRADataTypeftStringSize NamePOSTODataTypeftStringSize NameDEPENDENTE_DEDataTypeftStringSize NameTELEFONE_FUNCIONALDataTypeftStringSize
 NameSITUACAO_CURSODataTypeftStringSize
 Name	OM_ORIGEMDataTypeftStringSize Name
DEPENDENTEDataType
ftSmallint NameHORAENTRADADataTypeftStringSize Name	DATASAIDADataType
ftDateTime NamePREDIODataTypeftStringSize NameAPTODataType
ftSmallint NameCAMADataType
ftSmallint NameRECEBEDataTypeftStringSize NameUSUARIODataTypeftStringSize
  Filteridentidade <> 'DEPENDENTE'Filtered	IndexFieldNamesPREDIO;APTO;CAMAMasterFieldsPREDIO;APTO;CAMAMasterSourceDSQ_Monta_Mapa	StoreDefs		TableNameRESERVALeft�Top�  TIBStringFieldIBTable_ReservaIDENTIDADE	FieldName
IDENTIDADESize  TDateTimeFieldIBTable_ReservaDATAENTRADA	FieldNameDATAENTRADA  TIBStringFieldIBTable_ReservaNOME	FieldNameNOMESize(  TIBStringFieldIBTable_ReservaNOME_GUERRA	FieldNameNOME_GUERRASize  TIBStringFieldIBTable_ReservaPOSTO	FieldNamePOSTOSize  TIBStringFieldIBTable_ReservaDEPENDENTE_DE	FieldNameDEPENDENTE_DESize  TIBStringField!IBTable_ReservaTELEFONE_FUNCIONAL	FieldNameTELEFONE_FUNCIONALSize
  TIBStringFieldIBTable_ReservaSITUACAO_CURSO	FieldNameSITUACAO_CURSOSize
  TIBStringFieldIBTable_ReservaOM_ORIGEM	FieldName	OM_ORIGEM  TSmallintFieldIBTable_ReservaDEPENDENTE	FieldName
DEPENDENTE  TIBStringFieldIBTable_ReservaHORAENTRADA	FieldNameHORAENTRADASize  TDateTimeFieldIBTable_ReservaDATASAIDA	FieldName	DATASAIDA  TIBStringFieldIBTable_ReservaPREDIO	FieldNamePREDIOSize  TSmallintFieldIBTable_ReservaAPTO	FieldNameAPTO  TSmallintFieldIBTable_ReservaCAMA	FieldNameCAMA  TIBStringFieldIBTable_ReservaRECEBE	FieldNameRECEBESize  TIBStringFieldIBTable_ReservaUSUARIO	FieldNameUSUARIOSize
   TIBTableIBTable_Hospede01DatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdates	FieldDefsName
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
IDENTIDADEMasterFields	APTCODIGOMasterSourceDSQ_Monta_Mapa	StoreDefs		TableNameHOSPEDELeft�Top�   TIBQueryIBQuery_CursoDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdatesSQL.StringsSelect * from Tabela_Cursosorder by Curso LeftTopH TIBStringFieldIBQuery_CursoCURSO	FieldNameCURSOOriginTABELA_CURSOS.CURSORequired	Size
   TDataSourceDST_ReservaDataSetIBTable_ReservaLeft�Top�   TDataSourceDST_CadReservaDataSetIBTable_CadReservaLeft Top�  TIBTableIBTable_Mapa_DepDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelActive	BufferChunks�CachedUpdates	FieldDefsName
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
ftSmallint NameNOMEDataTypeftStringSize NameIDADEDataType
ftSmallint  Filtered		IndexDefsNameDEPENDENTE_ID_PKFields%FICHA;ANO;PREDIO;APTO;CAMA;IDENTIDADEOptionsixUnique  NameFK_DEPENDENTEFieldsIDENTIDADE;FICHA;ANO  IndexFieldNamesIDENTIDADE;FICHA;ANOMasterFieldsIDENTIDADE;FICHA;ANOMasterSourceDST_Resp	StoreDefs		TableName
DEPENDENTELeft�Toph  TDataSourceDST_MapaDepDataSetIBTable_Mapa_DepLeft�Topi  TIBTableIBTable_RespDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelActive	BufferChunks�CachedUpdates	FieldDefsName
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
AttributesfaFixed DataTypeftStringSize  	IndexDefsNameHOSPEDAGEM_ID_PKFieldsIDENTIDADE;FICHA;ANOOptionsixUnique   IndexFieldNamesPREDIO;APTOMasterFieldsPREDIO;APTOMasterSourceDSQ_Monta_Mapa	StoreDefs		TableName
HOSPEDAGEMLeft�Top@  TDataSourceDST_RespDataSetIBTable_RespLeft�TopA   