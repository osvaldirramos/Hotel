�
 TFORM_TAB_PRECO 0�  TPF0TForm_Tab_PrecoForm_Tab_PrecoLeft� Top� WidthrHeight�BorderIcons Caption)   Cadastro da Tabela de Preço - HOTEL ICEAColor	clBtnFace
ParentFont		Icon.Data
�             �     (       @         �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ���  �����7w{�����  ����ffffg����  ���vfffffc���  ���fffffff{��  ��ffffffffg��  ��fffffffff��  �vwwwwwwwwvk�  �ffx�wwx�wfc�  �ffgwwwwwfff�  �ffDwwwwtFff�  6fdDGwwwDDff;  vfDDDwwtDDFf{  vfDDDH?DDDFf{  vfDDWwEETDFf{  vfw��utwt�Ff{  vfw�G���t�Vf{  vfTDDwwxEGvf{  vfUDWTwtDDFf{  vfEDDH�DDDFf{  vfdDDDtDDDff{  vfdDDGUDDDff{  vffDDG�DDFff{  vffdDH�DDfff{  vfffdGwDffff{  vfffffffffff{  �33333333333�  tGDDDDDDDDDD{  t[DDGuwwt�wD{  ww�DDDDDDDDD{  ;w{W�wwXWwxw{  tDDtDDDDDDDD{  ������������� �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  OldCreateOrder	PositionpoScreenCenter
OnActivate
FormCreatePixelsPerInch`
TextHeight TPanelPanel1Left~Top Width�Height�AlignalClientTabOrder  TJvGradientGradientLeftTopWidth�Height�AlignalClientStyle	grEllipse
StartColor��� EndColor��� Steps!  
TStatusBar	StatusBarLeftTop�Width�HeightPanels SimplePanel	
SimpleText   Selecione a Opção desejada.  	TGroupBoxGroupBox_PrecoLeftTop<Width�Height� Caption    Tabela de Preços Font.CharsetDEFAULT_CHARSET
Font.ColorclMaroonFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder  TLabelLabel_PredioLeftTopWidthmHeightCaption   Prédio......................:Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabel
Label_AptoLeftTopNWidthqHeightCaption   Posto/Graduação.:Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel_RamalLeftTopeWidthkHeightCaptionValor........................:Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel1LeftTop4WidthnHeightCaption   Código.....................:Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  	TComboBoxComboBox_PredioLeft� TopWidth4HeightColorclInfoBkFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style 
ItemHeight
ParentFontTabOrder TextAOnChangeComboBox_PredioChangeItems.StringsABCDE   TDBEditDBEdit_ValorLeft� TopbWidth4HeightHint   Número do Apartamento.CharCaseecUpperCaseColorclInfoBk	DataFieldVALOR
DataSourceDS_Tab_PrecoFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder  TDBEditDBEdit_CodigoLeft� Top2Width4HeightHint   Número do Apartamento.CharCaseecUpperCaseColorclInfoBk	DataFieldCODIGO
DataSourceDS_Tab_PrecoFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder  TDBComboBoxDBComboBox_Posto_GraduacaoLeft� TopIWidth� HeightCharCaseecUpperCaseColorclInfoBk	DataFieldPOSTO
DataSourceDS_Tab_PrecoFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style 
ItemHeightItems.StringsOFICIAL GENERALOFICIAL SUPERIOR   OFICIAL INTERMEDIÁRIOOFICIAL SUBALTERNOASPIRANTE OU GUARDA MARINHA   CV NS C/ VÍNCULO   CV NS S/ VÍNCULO	GRADUADOS   CV NM C/ VÍNCULO   CV NM S/ VÍNCULOCABOCADETESOLDADOTAIFEIROCV SUP INFRAEROCV NM INFRAERO 
ParentFontTabOrderOnExitDBComboBox_Posto_GraduacaoExit   TPanelPanel3Left5Top� Width� Height� 
BevelInnerbvRaised
BevelOuter	bvLoweredBorderWidthFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTabOrder TDBNavigatorDBNavigator_ApartamentoLeftTopWidth� Height
DataSourceDS_Tab_PrecoVisibleButtonsnbFirstnbPriornbNextnbLast AlignalTopCtl3DHints.StringsPrimeiro ApartamentoApartamento AnteriorApartamento Seguinte   Último Apartamento ParentCtl3DParentShowHintShowHint	TabOrder   TToolBarToolBar4LeftTopWidth� Height� AutoSize	ButtonHeightButtonWidth� CaptionToolBar1EdgeBorders Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style ImagesDM.ImageList_PrincipalList	
ParentFontShowCaptions	TabOrder TToolButtonToolButton_InserirLeft TopHintInsere um novo ApartamentoCaption$              &Inserir              
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_InserirClick  TToolButtonToolButton_AlterarLeft Top Hint;   Permite a alteração dos dados do Apartamento selecionado.Caption             &Alterar  
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_AlterarClick  TToolButtonToolButton_ExcluirLeft Top>Hint Exclui o Apartamento selecionadoCaption            &Excluir  
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_ExcluirClick  TToolButtonToolButton_GravarLeft Top\Hint    Grava a inclusão ou alteraçãoCaption             &Gravar    
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_GravarClick  TToolButtonToolButton_IgnorarLeft TopzHint   Ignora inclusão ou alteraçãoCaption             &Ignorar
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_IgnorarClick  TToolButtonToolButton_RetornarLeft Top� Caption           &Retornar
ImageIndexWrap	OnClickToolButton_RetornarClick  TToolButtonToolButton_WindowsLeft Top� Caption         &Windows
ImageIndexOnClickToolButton_WindowsClick    TToolBar_PatenteLeftITop�WidthXHeight#AlignalNoneButtonHeightButtonWidthMCaption_PatenteEdgeBorders ImagesDM.ImageList_PrincipalList	ShowCaptions	TabOrderTransparent	 TToolButtonToolButton_PatentesLeft TopHint*   Mostra as patentes de acordo com a força.CaptionPatentes
ImageIndex.OnClickToolButton_PatentesClick    TPanelPanel2Left Top Width~Height�AlignalLeft
BevelInner	bvLoweredBorderWidthCaptionPanel2TabOrder TDBGrid
DBGrid_TabLeftTopWidthrHeight�AlignalClient
DataSourceDS_Tab_PrecoFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgConfirmDeletedgCancelOnExit 
ParentFontTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclMaroonTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style ColumnsExpanded	FieldNamePOSTOWidthVisible	 Expanded	FieldNameVALORWidth?Visible	     TDataSourceDS_Tab_PrecoDataSetTable_Tab_PrecoLeft� Top}  TTableTable_Tab_PrecoOnPostErrorTable_Tab_PrecoPostErrorDatabaseNamehotel1	TableNameTABELA_PRECOLeft� Topx TStringFieldTable_Tab_PrecoPREDIO	FieldNamePREDIORequired	Size  TStringFieldTable_Tab_PrecoCODIGO	FieldNameCODIGORequired	EditMask99;0; Size  TStringFieldTable_Tab_PrecoPOSTO	FieldNamePOSTOSize  TFloatFieldTable_Tab_PrecoVALOR	FieldNameVALORDisplayFormat###.00
EditFormat###.##    