�
 TFORM_CAD_HOSPEDE 06�  TPF0TForm_Cad_HospedeForm_Cad_HospedeLeftRTop�Width�HeightCaption Cadastro de Hospede - Hotel ICEAColorclWindowCtl3D
ParentFont		Icon.Data
�             �     (       @         �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ���  �����7w{�����  ����ffffg����  ���vfffffc���  ���fffffff{��  ��ffffffffg��  ��fffffffff��  �vwwwwwwwwvk�  �ffx�wwx�wfc�  �ffgwwwwwfff�  �ffDwwwwtFff�  6fdDGwwwDDff;  vfDDDwwtDDFf{  vfDDDH?DDDFf{  vfDDWwEETDFf{  vfw��utwt�Ff{  vfw�G���t�Vf{  vfTDDwwxEGvf{  vfUDWTwtDDFf{  vfEDDH�DDDFf{  vfdDDDtDDDff{  vfdDDGUDDDff{  vffDDG�DDFff{  vffdDH�DDfff{  vfffdGwDffff{  vfffffffffff{  �33333333333�  tGDDDDDDDDDD{  t[DDGuwwt�wD{  ww�DDDDDDDDD{  ;w{W�wwXWwxw{  tDDtDDDDDDDD{  ������������� �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  OldCreateOrder	PositionpoScreenCenterWindowStatewsMaximized
OnActivate
FormCreatePixelsPerInch`
TextHeight TPanelPanel2Left Top Width�Height�AlignalClientColorclSilverTabOrder  TPanelPanel1LeftKTopWidth4Height�AlignalClient
BevelOuterbvNoneTabOrder  TJvGradientJvGradient4Left�Top WidthvHeight�AlignalClientStyle
grVertical
StartColor��� EndColor���   TPanelPanel6Left Top Width�Height�AlignalLeftCaptionPanel6TabOrder  TDBGridDBGrid_MapaLeftTopdWidth�Height<AlignalClientColorclInfoBk
DataSourceDSQ_Mapa
FixedColor��� Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style OptionsdgTitlesdgIndicatordgColumnResize
dgColLinesdgRowSelectdgAlwaysShowSelection 
ParentFontReadOnly	TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style OnDrawColumnCellDBGrid_MapaDrawColumnCell	OnKeyDownDBGrid_MapaKeyDownColumnsExpanded	FieldNameSITUACAOTitle.AlignmenttaCenterTitle.Caption   POSTO / GRADUAÇÃO - NOMETitle.Font.CharsetANSI_CHARSETTitle.Font.ColorclNavyTitle.Font.Height�Title.Font.NameArialTitle.Font.Style WidthIVisible	 Expanded	FieldNameSITUACAO_CURSOTitle.AlignmenttaCenterTitle.Caption   SITUAÇÃO/CURSOTitle.Font.CharsetANSI_CHARSETTitle.Font.ColorclNavyTitle.Font.Height�Title.Font.NameArialTitle.Font.Style Width� Visible	 	AlignmenttaCenterExpanded	FieldNameDATA_ENTRADATitle.AlignmenttaCenterTitle.CaptionENTRADATitle.Font.CharsetANSI_CHARSETTitle.Font.ColorclNavyTitle.Font.Height�Title.Font.NameArialTitle.Font.Style Width^Visible	 	AlignmenttaCenterExpanded	FieldName
DATA_SAIDATitle.AlignmenttaCenterTitle.Caption   SAÍDATitle.Font.CharsetANSI_CHARSETTitle.Font.ColorclNavyTitle.Font.Height�Title.Font.NameArialTitle.Font.Style WidthpVisible	    TToolBarToolBar_RodapeLeftTop�Width�Height"AlignalBottomAutoSize	ButtonHeightButtonWidthMCaptionInserirColor��� ImagesDM.ImageList_PrincipalIndent
List	ParentColorShowCaptions	TabOrder TToolButtonToolButton2Left
TopWidth?CaptionToolButton2
ImageIndex/StyletbsSeparator  TToolButtonToolButton_MostraFichaLeftITopHintMostra a Ficha do HospedeAutoSize	
ImageIndex'OnClickToolButton_MostraFichaClick  TToolButtonToolButton_AmpliaMapaLeftsTopHintAmplia o Mapa de HospedeAutoSize	
ImageIndex&VisibleOnClickToolButton_AmpliaMapaClick  TToolButtonToolButton_PatentesLeft�TopHint,   Mostra as Patentes de acordo com cada ForçaCaptionPatentes
ImageIndex.OnClickToolButton_PatentesClick  TToolButtonToolButton6Left�TopWidthCaptionToolButton6
ImageIndex0StyletbsSeparator  TToolButtonToolButton_VoucherLeft�TopHintCadastro dos Voucher.CaptionVoucher
ImageIndex2ParentShowHintShowHint	OnClickToolButton_VoucherClick   TToolBarToolBar2LeftTopWidth�HeightcAutoSize	ButtonHeight/ButtonWidthOCaptionInserirColor��� Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style ImagesDM.ImageList_PrincipalIndentParentColor
ParentFontShowCaptions	TabOrder TToolButtonToolButton_HospedarLeftTopHint   Cadastra um novo hóspedeAutoSize	Caption	&Hospedar
ImageIndexOnClickToolButton_HospedarClick  TToolButtonToolButton_AlterarLeftGTopHint-   Permite a alteração dos dados  selecionado.AutoSize	Caption &Alterar  
ImageIndexOnClickToolButton_AlterarClick  TToolButtonToolButton3Left� TopWidthCaptionToolButton3
ImageIndexStyletbsSeparator  TToolButtonToolButton_GravarLeft� TopHint    Grava a inclusão ou alteraçãoAutoSize	Caption	 &Gravar 
ImageIndexOnClickToolButton_GravarClick  TToolButtonToolButton_CancelarLeft� TopHint   Ignora inclusão ou alteraçãoAutoSize	Caption &Cancelar 
ImageIndexParentShowHintShowHint	OnClickToolButton_CancelarClick  TToolButtonToolButton4LeftTopWidthCaptionToolButton4
ImageIndexWrap	StyletbsSeparator  TToolButtonToolButton_Fechar_ContaLeftTop2Hint'Efetua o fechamento da conta do hospedeAutoSize	Caption	 &Fechar 
ImageIndex(OnClickToolButton_Fechar_ContaClick  TToolButtonToolButton_DesocuparLeft@Top2Hint<   Descupa apartamento que esta na situação de não desocuparAutoSize	Caption
&Desocupar
ImageIndexOnClickToolButton_DesocuparClick  TToolButtonToolButton_Tabela_PrecoLeft� Top2Hint   Mostra a tabela de preçoAutoSize	Caption   &Tab. PreçoDropdownMenuDM.PopupMenu_TabelaHospedagem
ImageIndex  TToolButtonToolButton1Left� Top2WidthCaptionToolButton1
ImageIndexStyletbsSeparator  TToolButtonToolButton_RetornarLeft� Top2HintRetorna para Menu PrincipalAutoSize	Caption	&Retornar
ImageIndexOnClickToolButton_RetornarClick  TToolButtonToolButton_WindowsLeftTop2HintRetorna para o WindowsAutoSize	CaptionWindows
ImageIndexOnClickToolButton_WindowsClick  TToolButtonToolButton5LeftPTop2WidthCaptionToolButton5
ImageIndexStyletbsSeparator  TDBNavigatorDBNavigator_HospedeLeftSTop2WidthdHeight/
DataSourceDSQ_MapaVisibleButtonsnbFirstnbPriornbNextnbLast TabOrder     TJvCaptionPanelJvCaptionPanel3LeftGTop Width�Height�AlignalRightButtons Caption4                                  Relação de ReservasCaptionColor�uu CaptionPositiondpTopCaptionFont.CharsetANSI_CHARSETCaptionFont.ColorclBlackCaptionFont.Height�CaptionFont.NameArialCaptionFont.Style Color�uu OutlookLookTabOrder TJvShapeJvShape5LeftTopWidthRHeight	Pen.Color��    TDBNavigatorDBNavigator3LeftTopWidthPHeightVisibleButtonsnbFirstnbPriornbNextnbLast Flat	Ctl3DHints.StringsPosiciona no primeiro registroPosiciona no proximo registroPosiciona no registro anterior   Posiciona no último registro  ParentCtl3DParentShowHintShowHint	TabOrder   TPanelPanel9LeftTopWidth�HeightAlignalTopTabOrder 	TMaskEdit	MaskEdit1LeftfTopWidthHeightHintBusca a reserva pelo NomeCharCaseecUpperCaseColorclInfoBkParentShowHintShowHint	TabOrder OnChangeBuscaReserva  	TMaskEditMaskEdit_PredioLeftTopWidth1HeightHintBusca a reserva pelo NomeCharCaseecUpperCaseColorclInfoBkParentShowHintShowHint	TabOrderOnChangeBuscaReserva  	TMaskEdit	MaskEdit2Left4TopWidth0HeightHintBusca a reserva pelo AptoCharCaseecUpperCaseColorclInfoBkParentShowHintShowHint	TabOrderOnChangeBuscaReserva   TDBGridDBGrid_ReservaLeftTop0Width�Height�AlignalClient
DataSourceDSQ_ReservaOptionsdgTitlesdgColumnResize
dgColLines
dgRowLinesdgTabs TabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style OnTitleClickDBGrid_ReservaTitleClickColumns	AlignmenttaCenterExpanded	FieldNamePREDIOTitle.AlignmenttaCenterTitle.Color��@ Title.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclGrayTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.StylefsBold Visible	 	AlignmenttaCenterExpanded	FieldNameAPTOTitle.AlignmenttaCenterTitle.Color��@ Title.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclGrayTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.StylefsBold Width/Visible	 Expanded	FieldNameNOMETitle.AlignmenttaCenterTitle.CaptionN O M ETitle.Color��@ Title.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclGrayTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.StylefsBold WidthVisible	 	AlignmenttaCenterExpanded	FieldNameDATAENTRADATitle.AlignmenttaCenterTitle.CaptionENTRADATitle.Color��@ Title.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclGrayTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.StylefsBold WidthSVisible	      	TGroupBoxGroupBox_PrincipalLeftTopWidthJHeight�AlignalLeftCaption    Informações do Mapa Color��� Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style ParentColor
ParentFontTabOrder TJvGradientJvGradient1LeftTop^WidthHHeightdAlignalClientStyle
grVertical
StartColor��� EndColor���   TSpeedButtonSpeedButton_Atualiza_MapaLeft!Top� WidthHeightHint   Atualiza o mapa de ocupação
Glyph.Data
�   �   BM�       v   (               x                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� wwwwwwpwwwwwx wwwwwp �wx  �Hww �� ��wp���ww����ww����ww����ww����pww����ww�����wwp��www �� wwwwx  �wwwParentShowHintShowHint	OnClickSpeedButton_Atualiza_MapaClick  TLabelLabel18LeftTop� WidthNHeightCaptionNome de GuerraFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTransparent	  TLabelLabel19Left� Top� WidthKHeightCaptionNome CompletoFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTransparent	  TLabelLabel2LeftTopuWidthHeightCaption   PrédioFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTransparent	  TLabelLabel_SelAptoLeft� TopuWidthHeightCaptionAptoFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTransparent	  TLabelLabel5Left� TopuWidthHeightCaptionRamalFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTransparent	  TSpeedButtonSpeedButton_PreviaLeftXTopWidth� Height"Hint-   Abre janela para fazer prévia de hospedagem.Caption   Prévia de Preço
Glyph.Data
�	  �	  BM�	      6   (                �	                  ����������������������������������������������������������������������������������������������������ddd�������������������������������������������������������������������������������������������������ttt�)))��ttt������������������������������������������������������������������������������������������GGG�999�>>>�����������������������������������������������������������������������������������������BBB�!!!��^^^�����������������������������������������������������������������������������������������$$$�������������������������������������������������������������������������������������������yyy���###�����������������������������������������������������������������������������������������===���fff������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������SSS�


��&&&�����������������������������������������������������������������b�\�Z�T�s�w�����d�]���������sts�   �FEF�������������������������������������������������������������������P�H�L�E�MC�,m%�Z�T�RkS�������������������������������������������������������������������������¾��������.��%��"��#��
_�h
���������������������������������������������������������������������S�H�'u�(T#�)X%�,X1�.s�$�$��� ��>�7������������������������������������������������������������������Ҽ�0�%�2�#�%��%X�!����@�+��'��'�������������������������������������������������������������������͐���\� ��,��0����&���d�� �����������������������������������������������������������������������d�#��5�$��&�� ��� �� ������������������������������������������������������������������������� �(��}	�"�� � X ���������������������{�t�����������������������������������������������������������������0� ���y�2�(���A�%���������������������k{f�����������������������������������������������������������������������������������������������������^i^�������������������������������������������������������������x�|�������������������������������������QYP�������������������������������������������������������������������������K]H��������������ü�����AT;�r�m����������������������������������������������������������������������������������·�����y�w���~�������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������ParentShowHintShowHint	OnClickSpeedButton_PreviaClick  TPanelPanel3LeftTopWidthHHeightMAlignalTop
BevelOuterbvNoneColor��� TabOrder  TPanelPanel4LeftTop WidthAHeightK
BevelOuterbvNoneColorclSilverTabOrder  TPanelPanel42Left� Top Width� HeightKAlignalClient
BevelOuterbvNoneColorclSilverTabOrder  TPanelPanel10Left TopWidth� HeightAlignalTop
BevelInner	bvLoweredCaptionOcupadoColorclSilverTabOrder  TPanelPanel13LeftTopWidthHeightAlignalLeftColorclTealTabOrder    TPanelPanel8Left Top Width� HeightAlignalTop
BevelOuterbvNoneColor��� TabOrder  TPanelPanel18Left Top%Width� HeightAlignalTop
BevelInner	bvLoweredCaption
DesocupadoColorclSilverTabOrder TPanelPanel21LeftTopWidthHeightAlignalLeftColorclInfoBkFont.CharsetDEFAULT_CHARSET
Font.ColorclWhiteFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder    TPanelPanel7Left Top8Width� HeightAlignalTop	AlignmenttaLeftJustify
BevelInner	bvLoweredCaption!              Data de saída vencidaColorclSilverTabOrder TPanelPanel12LeftTopWidthHeightAlignalLeftColorclAquaTabOrder     TPanelPanel43Left Top Width� HeightKAlignalLeft
BevelOuterbvNoneColorclSilverTabOrder TPanelPanel44Left Top Width� HeightAlignalTop	AlignmenttaLeftJustify
BevelOuterbvNoneCaption
  LEGENDA:Color��� Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFontTabOrder   TPanelPanel45Left TopWidth� HeightAlignalTop
BevelInner	bvLoweredCaptionReservaColorclSilverTabOrder TPanelPanel47LeftTopWidthHeightAlignalLeftColorclRedTabOrder    TPanelPanel48Left Top8Width� HeightAlignalTop
BevelInner	bvLoweredCaption   Não OcuparColorclSilverTabOrder TPanelPanel50LeftTopWidthHeightAlignalLeftColorclYellowTabOrder    TPanelPanel5Left Top%Width� HeightAlignalTop
BevelInner	bvLoweredCaption           Não DesocupadoColorclSilverTabOrder TPanelPanel14LeftTopWidthHeightAlignalLeftColorclBlueTabOrder       TPanelPanel_MostraHospedeLeftTop� Width<Height(
BevelInner	bvLoweredTabOrder TJvGradientJvGradient2LeftTopWidth8Height$AlignalClientStyle
grVertical
StartColor��� EndColor��� Steps$  TDBTextDBText1LeftTopWidthHeight	DataFieldPREDIO
DataSourceDSQ_MapaFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFontTransparent	  TLabelLabel4LeftTopWidthHeightCaption-Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFontTransparent	  TDBTextDBText2Left'TopWidthHeight	DataFieldAPTO
DataSourceDSQ_MapaFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFontTransparent	  TLabelLabel1LeftNTopWidth2HeightCaption- RamalFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFontTransparent	  TDBTextDBText_NomeLeftTopWidth)Height	DataFieldNOME
DataSourceDSQ_MapaFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFontTransparent	  TDBTextDBText3Left� TopWidth� Height	DataFieldRAMAL
DataSourceDSQ_MapaFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFontTransparent	   TProgressBarProgressBar1LeftTop� WidthHeightTabOrder  	TMaskEditMaskEdit_Busca_Nome_CompletoLeft� Top� Width� Height
BevelInnerbvSpace	BevelKindbkFlatBorderStylebsNoneCharCaseecUpperCaseColorclInfoBkCtl3D	MaxLengthParentCtl3DTabOrderOnChange"MaskEdit_Busca_Nome_CompletoChange  	TMaskEditMaskEdit_Nome_GuerraLeftTop� Width[Height
BevelInnerbvSpace	BevelKindbkFlatBorderStylebsNoneCharCaseecUpperCaseColorclInfoBkCtl3DParentCtl3DTabOrderOnChangeMaskEdit_Nome_GuerraChange  	TComboBoxComboBox_PredioLeftTop� WidthHHeight
BevelInnerbvSpace	BevelKindbkFlatColorclInfoBkCtl3D
ItemHeightParentCtl3DTabOrderTextTodosOnChangeComboBox_Busca_PredioChange	OnKeyDownComboBox_PredioKeyDownItems.StringsTodosABCDE   	TMaskEditMaskEdit_AptoLeft� Top� Width2HeightHint    Busca o prédio por apartamento.
BevelInnerbvSpace	BevelKindbkFlatBorderStylebsNoneCharCaseecUpperCaseColorclInfoBkCtl3DEditMask9999;0; 	MaxLengthParentCtl3DParentShowHintShowHint	TabOrderOnChangeMaskEdit_AptoChangeOnEnterMaskEdit_AptoEnter  	TMaskEditMaskEdit_RamalLeft� Top� WidthDHeight
BevelInnerbvSpace	BevelKindbkFlatBorderStylebsNoneCharCaseecUpperCaseColorclInfoBkCtl3DEditMask9999;0; 	MaxLengthParentCtl3DTabOrderOnChangeMaskEdit_RamalChange    
TStatusBar	StatusBarLeft Top�Width�HeightPanelsWidthP WidthP TextSelecione a opcao desejadaWidth�     TPanelPanel_FichaHospedeLeft Top�Width�HeightAlignalBottom
BevelInner	bvLoweredBorderWidthColor��� TabOrder TJvGradientJvGradient3LeftTopWidthzHeightAlignalClientStyle
grVertical
StartColor��� EndColor���   TLabel
Label_momeLeftTop:Width/HeightCaptionNome: Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	  TLabelLabel3Left�Top:WidthSHeightCaption   Prédio/Apto: Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	  TLabelLabel6LeftToplWidthcHeightCaptionNacionalidade: Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	  TLabelLabel7Left�Top:Width1HeightCaption   RG Nº.:Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	  TLabelLabel8Left^ToplWidthRHeightCaptionPosto/Grad.:Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	  TLabelLabel_Telefone_ResidencialLeftTop� Width� HeightCaptionTelefone Residencial.:Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	  TLabelLabel13LeftTop� WidthhHeightCaptionOM de Origem.:Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	  TLabelLabel_Nome_GuerraLeftTopQWidth� HeightCaptionNome de Guerra(Usual):Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	  TLabelLabel10LeftWTop� Width� HeightCaptionTelefone Funcional.:Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	  TLabelLabel_EmailLeftTop� Width,HeightCaptionE-Mail:Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	  TLabelLabel12LeftTop� WidthSHeightCaptionDependente:Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	  TLabelLabel_Situacao_CursoLeftYTop� WidthmHeightCaption   Situação/Curso.:Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	  TLabelLabel14Left� Top� WidthnHeightCaptionData de Entrada:Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	  TLabelLabel15Left�Top� WidthnHeightCaptionHora de Entrada:Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	  TLabelLabel16Left�Top� WidthfHeightCaption   Saída Prevista: Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	  TLabelLabel_RecebimentoLeftTopWidth_HeightCaptionRecebimento: Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	  TLabelLabel_Local_RecebimentoLeft� TopWidth� HeightCaption)( H-Hotel / T-Tesouraria / C - Cortesia )Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	  TLabelLabel_Ficha_HospedeLeftTopWidth� HeightCaption   Ficha NúmeroFont.CharsetANSI_CHARSET
Font.ColorclWhiteFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFont  TLabelLabel_Dependente_deLeft�ToplWidthHeightCaptionDependente de......:Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	  TLabelLabel17LeftTopWidth� HeightCaption   Ficha NúmeroFont.CharsetANSI_CHARSET
Font.ColorclMaroonFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFontTransparent	  TSpeedButtonSpeedButton_PredioLeft�Top5WidthHeightHint   Seleciona o prédio.
Glyph.Data
z  v  BMv      v   (                                    �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 33333333?�333333Ds333333w��33333tDs333337w?�33334DDs33337?w?�3333DDDs3333s�w?�333tDDDs3337�3w?�334DDDDs337?33w?�33DDDDDs?����w���������wwwwww3w33�����333s33?w33<����3337�3?w333<���333373?w3333���33333s?w3333<��333337�w33333<�3333337w333333�3333333w3333333	NumGlyphsParentShowHintShowHint	OnClickSpeedButton_PredioClick  TSpeedButtonSpeedButton_IdentidadeLeft�Top5WidthHeightHint   Seleciona o prédio.
Glyph.Data
z  v  BMv      v   (                                    �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 33333333?�333333Ds333333w��33333tDs333337w?�33334DDs33337?w?�3333DDDs3333s�w?�333tDDDs3337�3w?�334DDDDs337?33w?�33DDDDDs?����w���������wwwwww3w33�����333s33?w33<����3337�3?w333<���333373?w3333���33333s?w3333<��333337�w33333<�3333337w333333�3333333w3333333	NumGlyphsParentShowHintShowHint	OnClickSpeedButton_IdentidadeClick  TSpeedButtonSpeedButton_DependenteLeft� Top� WidthHeightHint3Chama janela de tratamento dos dados do dependente.
Glyph.Data
z  v  BMv      v   (                                    �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 33333333?�333333Ds333333w��33333tDs333337w?�33334DDs33337?w?�3333DDDs3333s�w?�333tDDDs3337�3w?�334DDDDs337?33w?�33DDDDDs?����w���������wwwwww3w33�����333s33?w33<����3337�3?w333<���333373?w3333���33333s?w3333<��333337�w33333<�3333337w333333�3333333w3333333	NumGlyphsParentShowHintShowHint	OnClickSpeedButton_DependenteClick  TLabelLabel_TelefoneCelularLeft�Top� Width� HeightCaptionTelefone Celular......:Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	  TLabelLabel9LeftTop� Width� HeightCaptionVeiculo (Marca/Cor):Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	  TLabelLabel11LeftITop� Width� HeightCaptionPlaca......................:Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	  TLabelLabel20LeftZTopQWidthPHeightCaptionCPF............:Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	  TLabelLabel21Left�TopQWidth0HeightCaptionSaram:Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	  TLabelLabel22Left�Top� WidthgHeightCaptionSISCEAB.........:Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparent	  	TMaskEditMaskEdit_FichaLeft� TopWidthCHeight
BevelInnerbvSpace	BevelKindbkFlatBorderStylebsNoneCharCaseecUpperCaseCtl3DFont.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 	MaxLengthParentCtl3D
ParentFontTabOrder
OnKeyPressMaskEdit_FichaKeyPress  	TMaskEditMaskEdit_NomeLeft;Top5WidthtHeight
BevelInnerbvSpace	BevelKindbkFlatBorderStylebsNoneCharCaseecUpperCaseCtl3DFont.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 	MaxLength(ParentCtl3D
ParentFontTabOrderOnExitMaskEdit_NomeExit  	TMaskEditMaskEdit_Nome_de_GuerraLeft� TopMWidth� Height
BevelInnerbvSpace	BevelKindbkFlatBorderStylebsNoneCharCaseecUpperCaseCtl3DFont.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 	MaxLengthParentCtl3D
ParentFontTabOrder  	TComboBoxComboBox_Posto_GraduacaoLeft�TopgWidth� Height
BevelInnerbvSpace	BevelKindbkFlatCharCaseecUpperCaseCtl3D
ItemHeight	MaxLengthParentCtl3DTabOrder  	TMaskEditMaskEdit_NacionalidadeLeftrTopgWidthXHeight
BevelInnerbvSpace	BevelKindbkFlatBorderStylebsNoneCharCaseecUpperCaseCtl3DFont.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 	MaxLengthParentCtl3D
ParentFontTabOrder  	TMaskEditMaskEdit_IdentidadeLeftTop5Width� Height
BevelInnerbvSpace	BevelKindbkFlatBorderStylebsNoneCharCaseecUpperCaseCtl3DEditMask999999999999;0; Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 	MaxLengthParentCtl3D
ParentFontTabOrder OnExitMaskEdit_IdentidadeExit  	TMaskEditMaskEdit_Telefone_ResidencialLeft� Top� WidthbHeight
BevelInnerbvSpace	BevelKindbkFlatBorderStylebsNoneCharCaseecUpperCaseCtl3DEditMask(cc) cc999-9999;0; Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 	MaxLengthParentCtl3D
ParentFontTabOrder	  	TMaskEditMaskEdit_Telefone_FuncionalLeft�Top� WidthcHeight
BevelInnerbvSpace	BevelKindbkFlatBorderStylebsNoneCharCaseecUpperCaseCtl3DEditMask(cc) cc999-9999;0; Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 	MaxLengthParentCtl3D
ParentFontTabOrder
  	TMaskEditMaskEdit_EMailLeft>Top� Width�Height
BevelInnerbvSpace	BevelKindbkFlatBorderStylebsNoneCharCaseecUpperCaseCtl3DFont.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 	MaxLength2ParentCtl3D
ParentFontTabOrder  	TMaskEditMaskEdit_Hora_EntradaLeftKTop� Width$Height
BevelInnerbvSpace	BevelKindbkFlatBorderStylebsNoneCharCaseecUpperCaseCtl3DEditMask	99:99;0; Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 	MaxLengthParentCtl3D
ParentFontTabOrder  	TComboBoxComboBox_RecebimentoLeftlTopWidth/Height
BevelInnerbvSpace	BevelKindbkFlatCharCaseecUpperCaseCtl3D
ItemHeight	MaxLengthParentCtl3DTabOrderTextTItems.StringsHTC   TDateTimePickerDateTimePicker_EntradaLeftPTop� Width[Height
BevelInnerbvNoneDate �c���<�@Time �c���<�@TabOrder  TDateTimePickerDateTimePicker_SaidaLeftTop� Width]Height
BevelInnerbvNone
BevelOuterbvNoneDate �c���<�@Time �c���<�@TabOrder  	TMaskEditMaskEdit_DependenteLeftcTop� Width#Height
BevelInnerbvSpace	BevelKindbkFlatBorderStylebsNoneCharCaseecUpperCaseCtl3DEditMask9;0; Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 	MaxLengthParentCtl3D
ParentFontTabOrder  	TComboBoxComboBox_Dependente_deLeftXTopgWidth� Height
BevelInnerbvSpace	BevelKindbkFlatCharCaseecUpperCaseCtl3D
ItemHeight	MaxLengthParentCtl3DTabOrder  TRadioGroupRadioGroup_DescontoLeft�TopWidth� Height!Caption
 Desconto Color��� ColumnsFont.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 	ItemIndexItems.StringsSim   Não ParentColor
ParentFontTabOrder  	TComboBoxComboBox_OM_OrigemLeft}Top� Width� Height
BevelInnerbvSpace	BevelKindbkFlatCharCaseecUpperCaseCtl3D
ItemHeight	MaxLengthParentCtl3DTabOrderOnExitComboBox_OM_OrigemExit  	TComboBoxComboBox_Situacao_CursoLeft�Top� Width� Height
BevelInnerbvSpace	BevelKindbkFlatCharCaseecUpperCase
ItemHeightTabOrderItems.StringsTRANSITO	RESIDENTE
CURSO ICEA
INST CURSOOUTROS   TEditEdit_PredioLeft0Top5Width!Height
BevelInnerbvSpace	BevelKindbkFlatBorderStylebsNoneCharCaseecUpperCaseCtl3DFont.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style ParentCtl3D
ParentFontReadOnly	TabOrderOnChangeEdit_PredioChange  TEdit	Edit_AptoLeftXTop5Width+Height
BevelInnerbvSpace	BevelKindbkFlatBorderStylebsNoneCharCaseecUpperCaseCtl3DFont.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style ParentCtl3D
ParentFontReadOnly	TabOrder  TPanelPanel_AvisoLeft%TopWidthaHeight
BevelInner	bvLoweredTabOrderVisible TJvBlinkingLabelJvBlinkingLabel1LeftTopWidthSHeightCaption+Verifique se esta digitando a ficha corretaFont.CharsetANSI_CHARSET
Font.ColorclMaroonFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFontHotTrackFont.CharsetDEFAULT_CHARSETHotTrackFont.ColorclWindowTextHotTrackFont.Height�HotTrackFont.NameMS Sans SerifHotTrackFont.Style    	TMaskEditMaskEdit_Telefone_CelularLeftXTop� WidthcHeight
BevelInnerbvSpace	BevelKindbkFlatBorderStylebsNoneCharCaseecUpperCaseCtl3DEditMask(cc) cc999-9999;0; Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 	MaxLengthParentCtl3D
ParentFontTabOrder  	TMaskEditMaskEdit_VeiculoLeft� Top� Width
Height
BevelInnerbvSpace	BevelKindbkFlatBorderStylebsNoneCharCaseecUpperCaseCtl3DFont.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 	MaxLength2ParentCtl3D
ParentFontTabOrder  	TMaskEditMaskEdit_PlacaLeft�Top� WidthcHeight
BevelInnerbvSpace	BevelKindbkFlatBorderStylebsNoneCharCaseecUpperCaseCtl3DFont.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 	MaxLengthParentCtl3D
ParentFontTabOrder  	TMaskEditMaskEdit_CPFLeft�TopMWidth� Height
BevelInnerbvSpace	BevelKindbkFlatBorderStylebsNoneCharCaseecUpperCaseCtl3DEditMask999.999.999-99;0; Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 	MaxLengthParentCtl3D
ParentFontTabOrder  	TMaskEditMaskEdit_SaramLeftTopMWidthXHeight
BevelInnerbvSpace	BevelKindbkFlatBorderStylebsNoneCharCaseecUpperCaseCtl3DFont.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style 	MaxLengthParentCtl3D
ParentFontTabOrder  	TComboBoxComboBox_SisceabLeftATop� WidthuHeight
BevelInnerbvSpace	BevelKindbkFlatCharCaseecUpperCase
ItemHeightTabOrderItems.StringsSIM   NÃO    TQueryQuery_Exclui_ReservaDatabaseNamehotel1LeftqTopN  TQueryQuery_Busca_PredioDatabaseNamehotel1SQL.StringsSelect * from apartamento  Left� Top   TDataSourceDST_CadHospedeDataSetTable_CadHospedeLeftxTop`  TTableTable_CadHospedeOnPostErrorTable_CadHospedePostErrorDatabaseNamehotel1IndexFieldNames
IDENTIDADEMasterFields
IDENTIDADEMasterSourceDST_CadHospedagem	TableNameHOSPEDELeftXTop` TStringFieldTable_CadHospedeIDENTIDADE	FieldName
IDENTIDADERequired	Size  TStringFieldTable_CadHospedeNOME	FieldNameNOMESize(  TStringFieldTable_CadHospedeNOME_GUERRA	FieldNameNOME_GUERRASize  TStringFieldTable_CadHospedePOSTO	FieldNamePOSTOSize  TStringFieldTable_CadHospedeDEPENDENTE_DE	FieldNameDEPENDENTE_DESize  TStringFieldTable_CadHospedeNACIONALIDADE	FieldNameNACIONALIDADESize  TStringFieldTable_CadHospedeSITUACAO_CURSO	FieldNameSITUACAO_CURSOSize
  TStringFieldTable_CadHospedeRESIDENCIA	FieldName
RESIDENCIASize(  TStringFieldTable_CadHospedeCIDADE	FieldNameCIDADESize(  TStringFieldTable_CadHospedeBAIRRO	FieldNameBAIRROSize(  TStringFieldTable_CadHospedeESTADO	FieldNameESTADOSize  TStringFieldTable_CadHospedeNUMERO	FieldNameNUMEROSize
  TStringFieldTable_CadHospedeOM_ORIGEM	FieldName	OM_ORIGEM  TStringFieldTable_CadHospedeSITUACAO	FieldNameSITUACAO	FixedChar	Size  TStringFieldTable_CadHospedeOBS	FieldNameOBSSize2  TStringFieldTable_CadHospedeEMAIL	FieldNameEMAILSize2  TStringFieldTable_CadHospedeVEICULO	FieldNameVEICULOSize2  TStringFieldTable_CadHospedePLACA	FieldNamePLACASize  TStringFieldTable_CadHospedeCPF	FieldNameCPFSize  TStringField$Table_CadHospedeTELEFONE_RESIDENCIAL	FieldNameTELEFONE_RESIDENCIALSize  TStringField"Table_CadHospedeTELEFONE_FUNCIONAL	FieldNameTELEFONE_FUNCIONALSize  TStringField Table_CadHospedeTELEFONE_CELULAR	FieldNameTELEFONE_CELULARSize  TStringFieldTable_CadHospedeSARAM	FieldNameSARAMSize   TTableTable_CadHospedagemAfterScrollTable_CadHospedagemAfterScrollOnPostErrorTable_CadHospedagemPostErrorDatabaseNamehotel1IndexFieldNames1IDENTIDADE;PREDIO;APTO;CAMA;DATAENTRADA;DATASAIDAMasterFields3IDENTIDADE;PREDIO;APTO;CAMA;DATA_ENTRADA;DATA_SAIDAMasterSourceDSQ_Mapa	TableName
HOSPEDAGEMLeftXTop0 TStringFieldTable_CadHospedagemIDENTIDADE	FieldName
IDENTIDADERequired	Size  TStringFieldTable_CadHospedagemFICHA	FieldNameFICHARequired	Size  TStringFieldTable_CadHospedagemPREDIO	FieldNamePREDIOSize  TFloatFieldTable_CadHospedagemAPTO	FieldNameAPTO  TFloatFieldTable_CadHospedagemCAMA	FieldNameCAMA  TStringFieldTable_CadHospedagemDATAENTRADA	FieldNameDATAENTRADAEditMask99/99/9999;0; Size  TStringFieldTable_CadHospedagemHORAENTRADA	FieldNameHORAENTRADAEditMask	99:99;0; Size  TStringFieldTable_CadHospedagemDATASAIDA	FieldName	DATASAIDASize  TFloatFieldTable_CadHospedagemDEPENDENTE	FieldName
DEPENDENTE  TStringField&Table_CadHospedagemSITUACAO_HOSPEDAGEM	FieldNameSITUACAO_HOSPEDAGEMSize
  TStringFieldTable_CadHospedagemRECEBE	FieldNameRECEBEEditMaskc;0; Size  TStringFieldTable_CadHospedagemDESCONTO	FieldNameDESCONTOSize  TFloatFieldTable_CadHospedagemANO	FieldNameANORequired	  TStringFieldTable_CadHospedagemSISCEAB	FieldNameSISCEABSize   TDataSourceDST_CadHospedagemDataSetTable_CadHospedagemLeftxTop0  TQueryQuery_Busca_HospedeDatabaseNamehotel1SQL.StringsSelect * from Hospede  LeftSTop�   TDataSourceDSQ_Busca_HospedeDataSetQuery_Busca_HospedeLeftwTop�   TQueryQuery_ProcuraDatabaseNamehotel1Left� Top�   TTableTable_HistoricoOnPostErrorTable_HistoricoPostErrorDatabaseNamehotel1IndexFieldNames	FICHA;ANOMasterFields	FICHA;ANOMasterSourceDST_CadHospedagem	TableName	HISTORICOLeftXTop�  TStringFieldTable_HistoricoIDENTIDADE	FieldName
IDENTIDADERequired		FixedChar	Size  TStringFieldTable_HistoricoFICHA	FieldNameFICHARequired	Size  TFloatFieldTable_HistoricoANO	FieldNameANORequired	  TStringFieldTable_HistoricoPREDIO	FieldNamePREDIO	FixedChar	Size  TFloatFieldTable_HistoricoAPTO	FieldNameAPTO  TStringFieldTable_HistoricoDATAENTRADA	FieldNameDATAENTRADASize
  TStringFieldTable_HistoricoHORAENTRADA	FieldNameHORAENTRADASize  TStringFieldTable_HistoricoDATASAIDA	FieldName	DATASAIDASize
  TStringFieldTable_HistoricoDATAPAGAMENTO	FieldNameDATAPAGAMENTOSize
  TStringFieldTable_HistoricoNRECIBO	FieldNameNRECIBOSize  TStringFieldTable_HistoricoBANCO	FieldNameBANCOSize
  TStringFieldTable_HistoricoNCHEQUE	FieldNameNCHEQUESize  TStringFieldTable_HistoricoPRACA	FieldNamePRACASize  TFloatFieldTable_HistoricoVALORPAGO	FieldName	VALORPAGO  TFloatFieldTable_HistoricoCUSTO_TELEFONE	FieldNameCUSTO_TELEFONE  TStringFieldTable_HistoricoUSUARIO_ENTRADA	FieldNameUSUARIO_ENTRADASize
  TStringFieldTable_HistoricoSITUACAO_CURSO	FieldNameSITUACAO_CURSOSize
  TStringFieldTable_HistoricoUSUARIO_SAIDA	FieldNameUSUARIO_SAIDASize
  TStringFieldTable_HistoricoTIPO_FECHAMENTO	FieldNameTIPO_FECHAMENTO	FixedChar	Size  TStringFieldTable_HistoricoRECEBIDO	FieldNameRECEBIDO	FixedChar	Size  TStringFieldTable_HistoricoOBS	FieldNameOBSSize�   TStringFieldTable_HistoricoHORA_OPERACAO	FieldNameHORA_OPERACAOSize  TDateTimeFieldTable_HistoricoDATA_OPERACAO	FieldNameDATA_OPERACAO  TStringFieldTable_HistoricoADE	FieldNameADESize	  TStringFieldTable_HistoricoHORASAIDA	FieldName	HORASAIDASize  TStringFieldTable_HistoricoSARAM	FieldNameSARAMSize  TStringFieldTable_HistoricoSISCEAB	FieldNameSISCEABSize   TQueryQuery_Tabela_PostoDatabaseNamehotel1Left8TopP  TQueryQuery_DeceaDatabaseNamehotel1SQL.StringsSelect * from Tabela_Deceaorder by localidade LeftTopM TStringFieldQuery_DeceaLOCALIDADE	FieldName
LOCALIDADEOriginTABELA_DECEA.LOCALIDADE   TQuery
Query_CamaDatabaseNamehotel1SQL.StringsSelect * from Hospede  Left� Top  TDataSourceDSQ_CamaDataSet
Query_CamaLeft� Top  TTableTable_Atualiza_CamaDatabaseNamehotel1IndexFieldNamesPREDIO;APTO;CAMAMasterFieldsPREDIO;APTO;CAMAMasterSourceDSQ_Atualiza_Cama	TableNameAPTOCAMALeftHTop�  TStringFieldTable_Atualiza_CamaPREDIO	FieldNamePREDIORequired		FixedChar	Size  TFloatFieldTable_Atualiza_CamaAPTO	FieldNameAPTORequired	  TFloatFieldTable_Atualiza_CamaCAMA	FieldNameCAMARequired	  TStringFieldTable_Atualiza_CamaAPTCODIGO	FieldName	APTCODIGOSize
  TStringFieldTable_Atualiza_CamaNOME	FieldNameNOMESize   TQueryQuery_Atualiza_CamaDatabaseNamehotel1SQL.Strings
Select  * from AptoCamaWhere Predio = 'A'and      Apto = '3' LeftTop�   TDataSourceDSQ_Atualiza_CamaDataSetQuery_Atualiza_CamaLeft(Top�   TTableTable_FichaOnPostErrorTable_CadHospedagemPostErrorDatabaseNamehotel1	TableNameFICHALeftTop� TStringFieldTable_FichaFICHA	FieldNameFICHARequired		FixedChar	Size   TDataSourceDSQ_Busca_PredioDataSetQuery_Busca_PredioLeft	Top  TQueryQuery_Sel_DepDatabaseNamehotel1SQL.StringsSelect * from dependente   Left� TopE  TDataSourceDSQ_Sel_DepDataSetQuery_Sel_DepLeft� TopE  TTableTable_DependenteOnPostErrorTable_CadHospedagemPostErrorDatabaseNamehotel1IndexFieldNames	FICHA;ANOMasterFields	FICHA;ANOMasterSourceDSQ_Sel_Dep	TableName
DEPENDENTELeft0TopH TStringFieldTable_DependenteIDENTIDADE	FieldName
IDENTIDADE	FixedChar	Size  TFloatFieldTable_DependenteANO	FieldNameANORequired	  TStringFieldTable_DependentePREDIO	FieldNamePREDIORequired		FixedChar	Size  TFloatFieldTable_DependenteAPTO	FieldNameAPTORequired	  TFloatFieldTable_DependenteCAMA	FieldNameCAMARequired	  TStringFieldTable_DependenteNOME	FieldNameNOMEEditMask#>cccccccccccccccccccccccccccccc;0; Size  TStringFieldTable_DependenteFICHA	FieldNameFICHARequired		FixedChar	Size   TDataSourceDST_DependenteDataSetTable_DependenteLeftPTopH  TTableTable_CadReservaDatabaseNamehotel1IndexFieldNamesDATAENTRADA;NOME;PREDIO;APTOMasterFieldsDATA_ENTRADA;NOME;PREDIO;APTOMasterSourceDSQ_Mapa	TableNameRESERVALeft� Top� TStringFieldTable_CadReservaIDENTIDADE	FieldName
IDENTIDADERequired		FixedChar	Size  TDateTimeFieldTable_CadReservaDATAENTRADA	FieldNameDATAENTRADARequired	  TStringFieldTable_CadReservaNOME	FieldNameNOMESize(  TStringFieldTable_CadReservaNOME_GUERRA	FieldNameNOME_GUERRASize  TStringFieldTable_CadReservaPOSTO	FieldNamePOSTOSize  TStringFieldTable_CadReservaDEPENDENTE_DE	FieldNameDEPENDENTE_DESize  TStringField"Table_CadReservaTELEFONE_FUNCIONAL	FieldNameTELEFONE_FUNCIONALSize
  TStringFieldTable_CadReservaSITUACAO_CURSO	FieldNameSITUACAO_CURSOSize
  TStringFieldTable_CadReservaOM_ORIGEM	FieldName	OM_ORIGEM  TFloatFieldTable_CadReservaDEPENDENTE	FieldName
DEPENDENTE  TStringFieldTable_CadReservaHORAENTRADA	FieldNameHORAENTRADASize  TDateTimeFieldTable_CadReservaDATASAIDA	FieldName	DATASAIDA  TStringFieldTable_CadReservaPREDIO	FieldNamePREDIO	FixedChar	Size  TFloatFieldTable_CadReservaAPTO	FieldNameAPTO  TFloatFieldTable_CadReservaCAMA	FieldNameCAMA  TStringFieldTable_CadReservaRECEBE	FieldNameRECEBE	FixedChar	Size  TStringFieldTable_CadReservaUSUARIO	FieldNameUSUARIOSize
  TStringFieldTable_CadReservaCPF	FieldNameCPFSize  TStringFieldTable_CadReservaSISCEAB	FieldNameSISCEABSize   TIBTableIBTable_Apto_OcupadoDatabaseDM.IBDatabase_HotelLocalTransactionDM.IBTransaction_HotelLocalBufferChunks�CachedUpdates	FieldDefsNamePREDIODataTypeftStringSize NameAPTODataType	ftInteger NameCAMADataType	ftInteger NameCODIGODataTypeftStringSize NameRAMALDataTypeftStringSize NameTV1DataTypeftStringSize
 NameTV2DataTypeftStringSize
 NameTIPODataTypeftStringSize NameSITUACAODataTypeftStringSize< NameSITUACAO_CURSODataTypeftStringSize
 NameNOMEDataTypeftStringSize( NameDATA_ENTRADADataTypeftStringSize Name
DATA_SAIDADataTypeftStringSize Name
IDENTIDADEDataTypeftStringSize  	IndexDefsNameRDB$PRIMARY1FieldsCODIGOOptions	ixPrimaryixUnique   IndexFieldNamesPREDIO;APTO;CAMAMasterFieldsPREDIO;APTO;CAMA	StoreDefs		TableNameMAPALeftHTop� TIBStringFieldIBTable_Apto_OcupadoPREDIO	FieldNamePREDIOSize  TIntegerFieldIBTable_Apto_OcupadoAPTO	FieldNameAPTO  TIntegerFieldIBTable_Apto_OcupadoCAMA	FieldNameCAMA  TIBStringFieldIBTable_Apto_OcupadoCODIGO	FieldNameCODIGOSize  TIBStringFieldIBTable_Apto_OcupadoRAMAL	FieldNameRAMALSize  TIBStringFieldIBTable_Apto_OcupadoTV1	FieldNameTV1Size
  TIBStringFieldIBTable_Apto_OcupadoTV2	FieldNameTV2Size
  TIBStringFieldIBTable_Apto_OcupadoTIPO	FieldNameTIPOSize  TIBStringFieldIBTable_Apto_OcupadoSITUACAO	FieldNameSITUACAOSize<  TIBStringField"IBTable_Apto_OcupadoSITUACAO_CURSO	FieldNameSITUACAO_CURSOSize
  TIBStringFieldIBTable_Apto_OcupadoNOME	FieldNameNOMESize(  TIBStringField IBTable_Apto_OcupadoDATA_ENTRADA	FieldNameDATA_ENTRADASize  TIBStringFieldIBTable_Apto_OcupadoDATA_SAIDA	FieldName
DATA_SAIDASize  TIBStringFieldIBTable_Apto_OcupadoIDENTIDADE	FieldName
IDENTIDADESize   TIBQueryIBQuery_Verifica_MapaDatabaseDM.IBDatabase_HotelLocalTransactionDM.IBTransaction_HotelLocalBufferChunks�CachedUpdatesSQL.Strings~select Identidade, codigo, predio, apto, cama, ramal, nome, tipo, situacao, situacao_curso, data_entrada, Data_Saida from mapawhere nome  like '%J%'union~select Identidade, codigo, predio, apto, cama, ramal, nome, tipo, situacao, situacao_curso, data_entrada, Data_Saida from mapawhere nome  like '%J%' and 5(codigo in ( select codigo from mapa where cama = 0)) Left�Top�  TIBTableIBTable_HotelDatabaseDM.IBDatabase_HotelLocalTransactionDM.IBTransaction_HotelLocalBufferChunks�CachedUpdates	FieldDefsNameCODIGO
Attributes
faRequired DataTypeftStringSize Name
IDENTIDADEDataTypeftStringSize NamePREDIO
AttributesfaFixed DataTypeftStringSize NameAPTODataType	ftInteger NameCAMADataType	ftInteger NameRAMALDataTypeftStringSize NameTV1DataTypeftStringSize
 NameTV2DataTypeftStringSize
 NameTIPO
AttributesfaFixed DataTypeftStringSize NameSITUACAODataTypeftStringSize< NameSITUACAO_CURSODataTypeftStringSize
 NameNOMEDataTypeftStringSize( NameDATA_ENTRADADataTypeftStringSize Name
DATA_SAIDADataTypeftStringSize  	IndexDefsNameRDB$PRIMARY1FieldsCODIGOOptions	ixPrimaryixUnique   	StoreDefs		TableNameMAPALeft�Topx  TIBQueryIBQuery_MapaDatabaseDM.IBDatabase_HotelLocalTransactionDM.IBTransaction_HotelLocalActive	BufferChunks�CachedUpdatesSQL.Stringsvselect Identidade, predio, apto, cama, ramal, nome, tipo, situacao, situacao_curso, data_entrada, Data_Saida from mapawhere nome  like '%J%'  Left�TopX  TDataSourceDSQ_MapaDataSetIBQuery_MapaLeftTop]  TIBQueryIBQuery_Delete_MapaDatabaseDM.IBDatabase_HotelLocalTransactionDM.IBTransaction_HotelLocalBufferChunks�CachedUpdatesSQL.StringsDelete from mapa Left�Top0  TQueryQuery_Monta_MapaDatabaseNamehotel1SQL.StringsCselect ap.predio, ap.apto, ap.ramal, ac.cama, ac.aptcodigo, ac.nome from apartamento ap, aptocama ac3where (ap.predio = ac.predio and ap.apto = ac.apto)$order by ac.predio, ac.apto, ac.cama LeftpTop�   TDataSourceDSQ_Monta_MapaDataSetQuery_Monta_MapaLeft�Top�   TTableTable_Mapa_DepDatabaseNamehotel1IndexFieldNamesPREDIO;APTO;CAMAMasterFieldsPREDIO;APTO;CAMAMasterSourceDSQ_Monta_Mapa	TableName
DEPENDENTELeft�Toph  TTableTable_HospedagemDatabaseNamehotel1IndexFieldNamesPREDIO;APTO;CAMAMasterFieldsPREDIO;APTO;CAMAMasterSourceDSQ_Monta_Mapa	TableName
HOSPEDAGEMLeft�Top�   TTableTable_ReservaDatabaseNamehotel1IndexFieldNamesPREDIO;APTO;CAMAMasterFieldsPREDIO;APTO;CAMAMasterSourceDSQ_Monta_Mapa	TableNameRESERVALeft�Top�   TTableTable_Hospede01DatabaseNamehotel1IndexFieldNames
IDENTIDADEMasterFields	APTCODIGOMasterSourceDSQ_Monta_Mapa	TableNameHOSPEDELeft�Top�   TDataSourceDST_HospedagemDataSetTable_HospedagemLeft�Top�   TTableTable_HospedeDatabaseNamehotel1IndexFieldNames
IDENTIDADEMasterFields
IDENTIDADEMasterSourceDST_Hospedagem	TableNameHOSPEDELeftTop�   TDataSourceDST_HospedeDataSetTable_HospedeLeft8Top�   TTableTable_Apto_OcupadoDatabaseNamehotel1IndexFieldNamesPREDIO;APTO;CAMAMasterFieldsPREDIO;APTO;CAMAMasterSourceDSQ_Mapa	TableNameAPTOCAMALeft@Top� TStringFieldTable_Apto_OcupadoPREDIO	FieldNamePREDIORequired		FixedChar	Size  TFloatFieldTable_Apto_OcupadoAPTO	FieldNameAPTORequired	  TFloatFieldTable_Apto_OcupadoCAMA	FieldNameCAMARequired	  TStringFieldTable_Apto_OcupadoAPTCODIGO	FieldName	APTCODIGO	FixedChar	Size  TStringFieldTable_Apto_OcupadoNOME	FieldNameNOMESize   TQueryQuery_ReservaDatabaseNamehotel1SQL.StringsSelect * from Reservaorder by Nome   Left�Tope  TDataSourceDSQ_ReservaDataSetQuery_ReservaLeft�Topa   