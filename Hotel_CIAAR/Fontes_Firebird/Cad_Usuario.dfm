�
 TFORM_CAD_USUARIO 03  TPF0TForm_Cad_UsuarioForm_Cad_UsuarioLeft� TopMWidth�HeightBorderIconsbiSystemMenu
biMinimize
biMaximizebiHelp Caption"   Sis-Hotel --> Cadastro de UsuárioColor	clBtnFace
ParentFont		Icon.Data
�             �     (       @         �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ���  �����7w{�����  ����ffffg����  ���vfffffc���  ���fffffff{��  ��ffffffffg��  ��fffffffff��  �vwwwwwwwwvk�  �ffx�wwx�wfc�  �ffgwwwwwfff�  �ffDwwwwtFff�  6fdDGwwwDDff;  vfDDDwwtDDFf{  vfDDDH?DDDFf{  vfDDWwEETDFf{  vfw��utwt�Ff{  vfw�G���t�Vf{  vfTDDwwxEGvf{  vfUDWTwtDDFf{  vfEDDH�DDDFf{  vfdDDDtDDDff{  vfdDDGUDDDff{  vffDDG�DDFff{  vffdDH�DDfff{  vfffdGwDffff{  vfffffffffff{  �33333333333�  tGDDDDDDDDDD{  t[DDGuwwt�wD{  ww�DDDDDDDDD{  ;w{W�wwXWwxw{  tDDtDDDDDDDD{  ������������� �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  OldCreateOrder	PositionpoScreenCenter
OnActivate
FormCreatePixelsPerInchx
TextHeight TLabelLabel_PrivilegioLeft� Top� WidthNHeightCaption   Privilégio:Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFont  TLabelLabel_SenhaLeft� TopzWidthRHeightCaptionSenha.....:Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFont  TLabel
Label_NomeLeft� TopFWidthMHeightCaption
Nome.....:Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFont  TLabelLabel1LeftrTop� WidthHeightCaption"   (G-Gerente/U-Usuário/C-CassineiroFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFont  TLabelLabel2LeftvTop� Width� HeightCaption R-Somente Reserva)Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFont  TDBEditDBEdit_SenhaLeft&TopuWidth� HeightCharCaseecUpperCase	DataFieldSENHA
DataSource
DS_UsuarioFont.CharsetANSI_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style 
ParentFontPasswordChar*TabOrder   TDBComboBoxDBComboBox_PrivilegioLeft)Top� WidthEHeightCharCaseecUpperCase	DataField
PRIVILEGIO
DataSource
DS_UsuarioFont.CharsetANSI_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style 
ItemHeightItems.StringsGUCR 
ParentFontTabOrder  TDBEditDBEdit_UsuarioLeft!TopBWidth� HeightCharCaseecUpperCase	DataFieldUSUARIO
DataSource
DS_UsuarioFont.CharsetANSI_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style 
ParentFontTabOrder  TPanelPanel2Left	Top� Width� Height� 
BevelInnerbvRaised
BevelOuter	bvLoweredBorderWidthFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTabOrder TDBNavigatorDBNavigator_UsuarioLeftTopWidth� Height
DataSource
DS_UsuarioVisibleButtonsnbFirstnbPriornbNextnbLast AlignalTopCtl3DHints.StringsPrimeiro ReservaReserva AnteriorReserva Seguinte   Último Reserva ParentCtl3DParentShowHintShowHint	TabOrder   TToolBarToolBar4LeftTopWidth� Height� AutoSize	ButtonHeightButtonWidth� CaptionToolBar1EdgeBorders Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style ImagesDM.ImageList_PrincipalList	
ParentFontShowCaptions	TabOrder TToolButtonToolButton_InserirLeft TopHintInsere um novo ApartamentoCaption$              &Inserir              
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_InserirClick  TToolButtonToolButton_AlterarLeft Top Hint;   Permite a alteração dos dados do Apartamento selecionado.Caption             &Alterar  
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_AlterarClick  TToolButtonToolButton_ExcluirLeft Top>Hint Exclui o Apartamento selecionadoCaption             &Excluir 
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_ExcluirClick  TToolButtonToolButton_GravarLeft Top\Hint    Grava a inclusão ou alteraçãoCaption             &Gravar    
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_GravarClick  TToolButtonToolButton_IgnorarLeft TopzHint   Ignora inclusão ou alteraçãoCaption             &Ignorar
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_IgnorarClick  TToolButtonToolButton_RetornarLeft Top� Caption           &Retornar
ImageIndexWrap	OnClickToolButton_RetornarClick  TToolButtonToolButton_WindowsLeft Top� Caption         &Windows
ImageIndexOnClickToolButton_WindowsClick    TDBGridDBGrid_UsuarioLeft Top Width� Height�AlignalLeft
DataSource
DS_UsuarioTabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style ColumnsExpanded	FieldNameUSUARIOTitle.AlignmenttaCenterTitle.Caption   USUÁRIOWidthvVisible	 	AlignmenttaCenterExpanded	FieldName
PRIVILEGIOTitle.AlignmenttaCenterTitle.CaptionPRIV.Width)Visible	    
TStatusBar	StatusBarLeft Top�Width�HeightPanels SimplePanel	
SimpleText   Selecione a Opção desejada.  TDataSource
DS_UsuarioDataSetIBTable_UsuarioLeftTop  TIBTableIBTable_UsuarioDatabaseDM.IBDatabase_HotelTransactionDM.IBTransaction_HotelBufferChunks�CachedUpdates	FieldDefsNameUSUARIO
Attributes
faRequired DataTypeftStringSize
 NameSENHA
Attributes
faRequired DataTypeftStringSize
 Name
PRIVILEGIO
AttributesfaFixed DataTypeftStringSize  	IndexDefsNameHOTEL_USUARIO_ID_PKFieldsUSUARIO;SENHAOptionsixUnique   	StoreDefs		TableNameUSUARIOLeft�Top  TIBStringFieldIBTable_UsuarioUSUARIO	FieldNameUSUARIOSize
  TIBStringFieldIBTable_UsuarioSENHA	FieldNameSENHASize
  TIBStringFieldIBTable_UsuarioPRIVILEGIO	FieldName
PRIVILEGIOSize    