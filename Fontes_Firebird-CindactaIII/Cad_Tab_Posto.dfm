�
 TFORM_TAB_POSTO 0o  TPF0TForm_Tab_PostoForm_Tab_PostoLeftMTop� WidthHeight�BorderIconsbiSystemMenu
biMinimize
biMaximizebiHelp Caption)Sis-Hotel --> Cadastro da Tabela de PostoColor	clBtnFace
ParentFont		Icon.Data
�             �     (       @         �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ���  �����7w{�����  ����ffffg����  ���vfffffc���  ���fffffff{��  ��ffffffffg��  ��fffffffff��  �vwwwwwwwwvk�  �ffx�wwx�wfc�  �ffgwwwwwfff�  �ffDwwwwtFff�  6fdDGwwwDDff;  vfDDDwwtDDFf{  vfDDDH?DDDFf{  vfDDWwEETDFf{  vfw��utwt�Ff{  vfw�G���t�Vf{  vfTDDwwxEGvf{  vfUDWTwtDDFf{  vfEDDH�DDDFf{  vfdDDDtDDDff{  vfdDDGUDDDff{  vffDDG�DDFff{  vffdDH�DDfff{  vfffdGwDffff{  vfffffffffff{  �33333333333�  tGDDDDDDDDDD{  t[DDGuwwt�wD{  ww�DDDDDDDDD{  ;w{W�wwXWwxw{  tDDtDDDDDDDD{  ������������� �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  OldCreateOrder	PositionpoScreenCenter
OnActivate
FormCreatePixelsPerInch`
TextHeight TPanelPanel1Left� Top Width�Height�AlignalClientTabOrder  	TGroupBoxGroupBox_PrecoLeftTopWidth�HeightOCaption Tabela de PostoFont.CharsetDEFAULT_CHARSET
Font.ColorclMaroonFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder  TLabelLabel1LeftTopWidthnHeightCaption   Código.....................:Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel2LeftTop4WidthqHeightCaption   Posto/Graduação.:Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TDBEditDBEdit_Posto_GraduacaoLeft|Top2Width=HeightHint   Número do Apartamento.CharCaseecUpperCaseColorclInfoBk	DataFieldPOSTO
DataSourceDS_Tab_PrecoFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder  TDBEditDBEdit_CodigoLeft|TopWidth4HeightHint   Número do Apartamento.CharCaseecUpperCaseColorclInfoBk	DataField	CODTABELA
DataSourceDS_Tab_PrecoFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder    TDBGridDBGrid_Posto_GraduacaoLeftTopeWidth� HeightL
DataSource	DSQ_PostoFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OptionsdgTabsdgAlwaysShowSelectiondgConfirmDeletedgCancelOnExit 
ParentFontReadOnly	TabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclMaroonTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style ColumnsExpanded	FieldNamePOSTOWidthVisible	    TPanelPanel3LeftTopeWidth� Height� 
BevelInnerbvRaised
BevelOuter	bvLoweredBorderWidthFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTabOrder TDBNavigatorDBNavigator_PostoLeftTopWidth� Height
DataSource	DSQ_PostoVisibleButtonsnbFirstnbPriornbNextnbLast AlignalTopCtl3DHints.StringsPrimeiro PostoPosto AnteriorPosto Seguinte   Último Posto ParentCtl3DParentShowHintShowHint	TabOrder   TToolBarToolBar4LeftTopWidth� Height� AutoSize	ButtonHeightButtonWidth� CaptionToolBar1EdgeBorders Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style ImagesDM.ImageList_PrincipalList	
ParentFontShowCaptions	TabOrder TToolButtonToolButton_InserirLeft TopHintInsere um novo ApartamentoCaption$              &Inserir              
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_InserirClick  TToolButtonToolButton_AlterarLeft Top Hint;   Permite a alteração dos dados do Apartamento selecionado.Caption             &Alterar  
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_AlterarClick  TToolButtonToolButton_ExcluirLeft Top>Hint Exclui o Apartamento selecionadoCaption            &Excluir  
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_ExcluirClick  TToolButtonToolButton_GravarLeft Top\Hint    Grava a inclusão ou alteraçãoCaption             &Gravar    
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_GravarClick  TToolButtonToolButton_IgnorarLeft TopzHint   Ignora inclusão ou alteraçãoCaption             &Ignorar
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_IgnorarClick  TToolButtonToolButton_RetornarLeft Top� Caption           &Retornar
ImageIndexWrap	OnClickToolButton_RetornarClick  TToolButtonToolButton_WindowsLeft Top� Caption         &Windows
ImageIndexOnClickToolButton_WindowsClick    TToolBarToolBar_PatenteLeft�Top�Width`Height#AlignalNoneButtonHeightButtonWidthMEdgeBorders ImagesDM.ImageList_PrincipalList	ShowCaptions	TabOrder TToolButtonToolButton_PatentesLeft TopHint*   Mostra as patentes de acordo com a força.CaptionPatentes
ImageIndex%OnClickToolButton_PatentesClick   
TStatusBar	StatusBarLeftTop�Width�HeightPanels SimplePanel	
SimpleText   Selecione a Opção desejada.   TPanelPanel2Left Top Width� Height�AlignalLeft
BevelInner	bvLoweredBorderWidthCaptionPanel2TabOrder TDBGrid
DBGrid_TabLeftTopWidth� Height�AlignalClient
DataSourceDS_Tab_PrecoFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgConfirmDeletedgCancelOnExit 
ParentFontReadOnly	TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclMaroonTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style ColumnsExpanded	FieldNamePOSTOTitle.Caption   POSTO/GRADUAÇÃOWidth� Visible	     TDataSourceDS_Tab_PrecoDataSetIBTable_Tab_PostoLeft� Top}  TDataSource	DSQ_PostoDataSetIBQuery_PostoLeft?Top]  TIBQueryIBQuery_PostoDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdatesSQL.StringsSelect distinct posto, CodigoFrom Tabela_Precoorder by codigo LeftTop` TIBStringFieldIBQuery_PostoPOSTO	FieldNamePOSTOOriginTABELA_PRECO.POSTORequired	Size  TIBStringFieldIBQuery_PostoCODIGO	FieldNameCODIGOOriginTABELA_PRECO.CODIGORequired	Size   TIBTableIBTable_Tab_PostoDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdates	FieldDefsNameCODIGO
Attributes
faRequired DataTypeftStringSize Name	CODTABELA
Attributes
faRequired DataTypeftStringSize NamePOSTODataTypeftStringSize  IndexFieldNamesCODIGOMasterFieldsCODIGOMasterSource	DSQ_Posto	StoreDefs		TableNameTABELA_POSTOLeft� Top�  TIBStringFieldIBTable_Tab_PostoCODIGO	FieldNameCODIGOSize  TIBStringFieldIBTable_Tab_PostoCODTABELA	FieldName	CODTABELASize  TIBStringFieldIBTable_Tab_PostoPOSTO	FieldNamePOSTOSize    