�
 TFORM_TAB_RESIDENTE 0"  TPF0TForm_Tab_ResidenteForm_Tab_ResidenteLeftkTopYWidth1HeightWBorderIconsbiSystemMenu
biMinimize
biMaximizebiHelp Caption8   Sis-Hotel --> Cadastro da Tabela de Preço de ResidentesColor	clBtnFace
ParentFont		Icon.Data
�             �     (       @         �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ���  �����7w{�����  ����ffffg����  ���vfffffc���  ���fffffff{��  ��ffffffffg��  ��fffffffff��  �vwwwwwwwwvk�  �ffx�wwx�wfc�  �ffgwwwwwfff�  �ffDwwwwtFff�  6fdDGwwwDDff;  vfDDDwwtDDFf{  vfDDDH?DDDFf{  vfDDWwEETDFf{  vfw��utwt�Ff{  vfw�G���t�Vf{  vfTDDwwxEGvf{  vfUDWTwtDDFf{  vfEDDH�DDDFf{  vfdDDDtDDDff{  vfdDDGUDDDff{  vffDDG�DDFff{  vffdDH�DDfff{  vfffdGwDffff{  vfffffffffff{  �33333333333�  tGDDDDDDDDDD{  t[DDGuwwt�wD{  ww�DDDDDDDDD{  ;w{W�wwXWwxw{  tDDtDDDDDDDD{  ������������� �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  OldCreateOrder	PositionpoScreenCenter
OnActivate
FormCreatePixelsPerInch`
TextHeight TPanelPanel2Left Top WidthyHeightAlignalLeft
BevelInner	bvLoweredBorderWidthCaptionPanel2TabOrder  TDBGrid
DBGrid_TabLeftTopWidthmHeightAlignalClient
DataSourceDST_Tab_ResidenteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgConfirmDeletedgCancelOnExit 
ParentFontTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclMaroonTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style ColumnsExpanded	FieldNamePOSTOTitle.AlignmenttaCenterWidthVisible	 Expanded	FieldNameVALORTitle.AlignmenttaCenterWidth?Visible	     	TGroupBoxGroupBox_PrecoLeft�Top/Width�HeightZCaption    Tabela de Preços Residente Font.CharsetDEFAULT_CHARSET
Font.ColorclMaroonFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder TLabel
Label_AptoLeftTopWidthqHeightCaption   Posto/Graduação.:Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel_RamalLeftTop7WidthkHeightCaptionValor........................:Font.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  TDBEditDBEdit_ValorLeft� Top5Width;HeightHint   Número do Apartamento.CharCaseecUpperCaseColorclInfoBk	DataFieldVALOR
DataSourceDST_Tab_ResidenteFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder   TDBLookupComboBoxDBLookupComboBox_PostoLeft� TopWidth� HeightColorclInfoBk	DataFieldPOSTO
DataSourceDST_Tab_ResidenteFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style KeyFieldPOSTO	ListFieldPOSTO
ListSourceDSQ_Posto_Graduacao
ParentFontTabOrder   TPanelPanel3Left�Top� Width� Height� 
BevelInnerbvRaised
BevelOuter	bvLoweredBorderWidthFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTabOrder TDBNavigatorDBNavigator_ResidenteLeftTopWidth� Height
DataSourceDST_Tab_ResidenteVisibleButtonsnbFirstnbPriornbNextnbLast AlignalTopCtl3DHints.StringsPrimeiro ResidenteResidente AnteriorResidente Seguinte   Último Residente  ParentCtl3DParentShowHintShowHint	TabOrder   TToolBarToolBar4LeftTopWidth� Height� AutoSize	ButtonHeightButtonWidth� CaptionToolBar1EdgeBorders Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style ImagesDM.ImageList_PrincipalList	
ParentFontShowCaptions	TabOrder TToolButtonToolButton_InserirLeft TopHintInsere um novo ResidenteCaption$              &Inserir              
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_InserirClick  TToolButtonToolButton_AlterarLeft Top Hint9   Permite a alteração dos dados do Residente selecionado.Caption             &Alterar  
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_AlterarClick  TToolButtonToolButton_ExcluirLeft Top>HintExclui o Residente selecionadoCaption            &Excluir  
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_ExcluirClick  TToolButtonToolButton_GravarLeft Top\Hint    Grava a inclusão ou alteraçãoCaption             &Gravar    
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_GravarClick  TToolButtonToolButton_IgnorarLeft TopzHint   Ignora inclusão ou alteraçãoCaption             &Ignorar
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_IgnorarClick  TToolButtonToolButton_RetornarLeft Top� HintRetorna para Menu PrincipalCaption           &Retornar
ImageIndexWrap	OnClickToolButton_RetornarClick  TToolButtonToolButton_WindowsLeft Top� Hint&Sai do sistema e retorna para Windows.Caption         &Windows
ImageIndexOnClickToolButton_WindowsClick    
TStatusBar	StatusBarLeft TopWidth)HeightPanels SimplePanel	
SimpleText   Selecione a Opção desejada.  TToolBar_PatenteLeft�Top�WidthhHeight#AlignalNoneButtonHeightButtonWidthMCaption_PatenteEdgeBorders ImagesDM.ImageList_PrincipalList	ShowCaptions	TabOrderOnClick_PatenteClick TToolButtonToolButton_PatentesLeft TopHint*   Mostra as patentes de acordo com a força.CaptionPatentes
ImageIndex%   TDataSourceDST_Tab_ResidenteDataSetIBTable_Tab_ResidenteLeft� Top}  TDataSourceDSQ_Posto_GraduacaoDataSetIBQuery_Posto_GraduacaoLeft� Top�   TIBQueryIBQuery_Posto_GraduacaoDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdatesSQL.StringsSelect distinct Codigo,Posto from Tabela_postoOrder By Codigo  Left� Top�  TIBStringFieldIBQuery_Posto_GraduacaoPOSTO	FieldNamePOSTOOriginTABELA_POSTO.POSTOSize   TIBTableIBTable_Tab_ResidenteDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdates	FieldDefsNameN_DEPENDENTE
Attributes
faRequired DataType
ftSmallint NamePOSTO
Attributes
faRequired DataTypeftStringSize NameVALORDataTypeftBCD	Precision	Size  	IndexDefsNamePK_RESIDENTEFieldsN_DEPENDENTE;POSTOOptionsixUnique   	StoreDefs		TableName	RESIDENTELeft� Topx TIBStringFieldIBTable_Tab_ResidentePOSTO	FieldNamePOSTOSize  TIBBCDFieldIBTable_Tab_ResidenteVALOR	FieldNameVALOR	Precision	Size  TSmallintField!IBTable_Tab_ResidenteN_DEPENDENTE	FieldNameN_DEPENDENTERequired	    