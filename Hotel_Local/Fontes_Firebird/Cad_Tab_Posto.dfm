�
 TFORM_TAB_POSTO 0�  TPF0TForm_Tab_PostoForm_Tab_PostoLeftDTopoWidth�Height�BorderIcons Caption)Cadastro da Tabela de Postos - HOTEL ICEAColor	clBtnFace
ParentFont		Icon.Data
�             �     (       @         �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ���  �����7w{�����  ����ffffg����  ���vfffffc���  ���fffffff{��  ��ffffffffg��  ��fffffffff��  �vwwwwwwwwvk�  �ffx�wwx�wfc�  �ffgwwwwwfff�  �ffDwwwwtFff�  6fdDGwwwDDff;  vfDDDwwtDDFf{  vfDDDH?DDDFf{  vfDDWwEETDFf{  vfw��utwt�Ff{  vfw�G���t�Vf{  vfTDDwwxEGvf{  vfUDWTwtDDFf{  vfEDDH�DDDFf{  vfdDDDtDDDff{  vfdDDGUDDDff{  vffDDG�DDFff{  vffdDH�DDfff{  vfffdGwDffff{  vfffffffffff{  �33333333333�  tGDDDDDDDDDD{  t[DDGuwwt�wD{  ww�DDDDDDDDD{  ;w{W�wwXWwxw{  tDDtDDDDDDDD{  ������������� �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  OldCreateOrder	PositionpoScreenCenter
OnActivate
FormCreateOnClose	FormClosePixelsPerInch`
TextHeight TPanelPanel1Left� Top Width�Height[AlignalClientTabOrder  
TStatusBar	StatusBarLeftTopCWidth�HeightPanels SimplePanel	
SimpleText   Selecione a Opção desejada.  	TGroupBoxGroupBox_PrecoLeftTopWidth�Height:AlignalTopCaption Tabela de PostoFont.CharsetDEFAULT_CHARSET
Font.ColorclMaroonFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder  TLabelLabel2LeftTopWidthqHeightCaption   Posto/Graduação.:Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TDBEditDBEdit_Posto_GraduacaoLeft|TopWidth=HeightHint   Entre com o Posto/GraduaçãoCharCaseecUpperCaseColorclInfoBk	DataFieldPOSTO
DataSourceDS_TabelaDePostoFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontParentShowHintShowHint	TabOrder    TPanelPanel4LeftTopUWidth�Height�AlignalClientTabOrder TPanelPanel3Left{Top!Width� Height� 
BevelInnerbvRaised
BevelOuter	bvLoweredBorderWidthFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTabOrder  TDBNavigatorDBNavigator_PostoLeftTopWidth� Height
DataSourceDS_TabelaDePostoVisibleButtonsnbFirstnbPriornbNextnbLast AlignalTopCtl3DHints.StringsPrimeiro PostoPosto AnteriorPosto Seguinte   Último Posto ParentCtl3DParentShowHintShowHint	TabOrder   TToolBarToolBar4LeftTopWidth� Height� AutoSize	ButtonHeightButtonWidth� CaptionToolBar1EdgeBorders Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style ImagesDM.ImageList_PrincipalList	
ParentFontShowCaptions	TabOrder TToolButtonToolButton_InserirLeft TopHintInsere um novo ApartamentoCaption$              &Inserir              
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_InserirClick  TToolButtonToolButton_AlterarLeft Top Hint;   Permite a alteração dos dados do Apartamento selecionado.Caption             &Alterar  
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_AlterarClick  TToolButtonToolButton_ExcluirLeft Top>Hint Exclui o Apartamento selecionadoCaption            &Excluir  
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_ExcluirClick  TToolButtonToolButton_GravarLeft Top\Hint    Grava a inclusão ou alteraçãoCaption             &Gravar    
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_GravarClick  TToolButtonToolButton_IgnorarLeft TopzHint   Ignora inclusão ou alteraçãoCaption             &Ignorar
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_IgnorarClick  TToolButtonToolButton_RetornarLeft Top� Caption           &Retornar
ImageIndexWrap	OnClickToolButton_RetornarClick  TToolButtonToolButton_WindowsLeft Top� Caption         &Windows
ImageIndexOnClickToolButton_WindowsClick    TToolBar_PatenteLeft!Top�WidthpHeight#AlignalNoneButtonHeightButtonWidthMCaption_PatenteEdgeBorders ImagesDM.ImageList_PrincipalList	ShowCaptions	TabOrder TToolButtonToolButton_PatentesLeft TopHint*   Mostra as patentes de acordo com a força.CaptionPatentes
ImageIndex.OnClickToolButton_PatentesClick    TPanelPanel5LeftTopWidth�HeightAlignalTop
BevelOuterbvNoneTabOrder   TPanelPanel2Left Top Width� Height[AlignalLeft
BevelInner	bvLoweredBorderWidthCaptionPanel2TabOrder TDBGrid
DBGrid_TabLeftTopWidth� HeightOAlignalClient
DataSourceDS_TabelaDePostoFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgConfirmDeletedgCancelOnExit 
ParentFontReadOnly	TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclMaroonTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style ColumnsExpanded	FieldNamePOSTOTitle.Caption   POSTO/GRADUAÇÃOWidth� Visible	     TDataSourceDS_TabelaDePostoDataSetIBTable_TabelaPostoLeftoTop�   TIBTableIBTable_TabelaPostoDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdates	FieldDefsNameCODIGO
Attributes
faRequired DataTypeftStringSize Name	CODTABELA
Attributes
faRequired DataTypeftStringSize NamePOSTO
Attributes
faRequired DataTypeftStringSize  	IndexDefsNameUNQ_TABELA_POSTOFieldsPOSTOOptionsixUnique  NamePK_TABELA_POSTOFieldsCODIGO;CODTABELAOptionsixUnique   	StoreDefs		TableNameTABELA_POSTOLeftFTop�  TIBStringFieldIBTable_TabelaPostoCODIGO	FieldNameCODIGOSize  TIBStringFieldIBTable_TabelaPostoCODTABELA	FieldName	CODTABELASize  TIBStringFieldIBTable_TabelaPostoPOSTO	FieldNamePOSTOSize   TIBQueryIBQuery_ExecutaDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdatesSQL.StringsSelect distinct Codigo,Posto from Tabela_postoOrder By Codigo  LeftFTop�    