�
 TFORM_SEL_PREDIO 0:A  TPF0TForm_Sel_PredioForm_Sel_PredioLeft� TopCWidth�HeightCBorderIcons Caption+Seleciona Predio e Apartamento - Hotel ICEAColor	clBtnFace
ParentFont		Icon.Data
�             �     (       @         �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ���  �����7w{�����  ����ffffg����  ���vfffffc���  ���fffffff{��  ��ffffffffg��  ��fffffffff��  �vwwwwwwwwvk�  �ffx�wwx�wfc�  �ffgwwwwwfff�  �ffDwwwwtFff�  6fdDGwwwDDff;  vfDDDwwtDDFf{  vfDDDH?DDDFf{  vfDDWwEETDFf{  vfw��utwt�Ff{  vfw�G���t�Vf{  vfTDDwwxEGvf{  vfUDWTwtDDFf{  vfEDDH�DDDFf{  vfdDDDtDDDff{  vfdDDGUDDDff{  vffDDG�DDFff{  vffdDH�DDfff{  vfffdGwDffff{  vfffffffffff{  �33333333333�  tGDDDDDDDDDD{  t[DDGuwwt�wD{  ww�DDDDDDDDD{  ;w{W�wwXWwxw{  tDDtDDDDDDDD{  ������������� �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  OldCreateOrder	PositionpoScreenCenter
OnActivate
FormCreatePixelsPerInch`
TextHeight 
TStatusBar	StatusBarLeft TopWidth�HeightPanels   TPanelPanel2Left Top Width�HeightAlignalClientTabOrder TPanelPanel27Left� TopWidthHeightAlignalLeft
BevelOuterbvNoneTabOrder   	TGroupBox	GroupBox1LeftTopWidth� HeightAlignalLeftCaption    Informações do Mapa TabOrder 
TScrollBox
ScrollBox2LeftTop~Width� Height�AlignalClientBorderStylebsNoneTabOrder  TPanelPanel5Left Top Width� Height�AlignalClient
BevelOuterbvNone
BevelWidthTabOrder  TSpeedButtonSpeedButton_Atualiza_MapaLeft� TopYWidthHeightHint   Atualiza o mapa de ocupação
Glyph.Data
�   �   BM�       v   (               x                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� wwwwwwpwwwwwx wwwwwp �wx  �Hww �� ��wp���ww����ww����ww����ww����pww����ww�����wwp��www �� wwwwx  �wwwParentShowHintShowHint	OnClickSpeedButton_Atualiza_MapaClick  TProgressBarProgressBar1LeftTopYWidth� HeightTabOrder   	TGroupBox	GroupBox2LeftrTop!WidthLHeight#Caption Apto TabOrder 	TMaskEditMaskEdit_AptoLeftTopWidth<HeightHint    Busca o prédio por apartamento.CharCaseecUpperCaseColorclInfoBkEditMask9999;0; 	MaxLengthParentShowHintShowHint	TabOrder OnChangeMaskEdit_AptoChange   	TGroupBox	GroupBox3LeftTop!WidthYHeight"Caption
     Prédio TabOrder 	TComboBoxComboBox_PredioLeftTopWidthHHeightColorclInfoBk
ItemHeightTabOrder TextTodosOnChangeComboBox_Busca_PredioChangeItems.StringsTodosABCDE    TPanelPanel23LeftToptWidth� Height(
BevelInner	bvLoweredTabOrder TDBTextDBText_NomeLeftTopWidth� Height	DataFieldNOME
DataSourceDSQ_MapaFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFont  TDBTextDBText1LeftTopWidthHeight	DataFieldPREDIO
DataSourceDSQ_MapaFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFont  TDBTextDBText2Left'TopWidthHeight	DataFieldAPTO
DataSourceDSQ_MapaFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFont  TDBTextDBText3Left� TopWidth%Height	DataFieldRAMAL
DataSourceDSQ_MapaFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFont  TPanelPanel3LeftTopWidth
Height

BevelOuterbvNoneCaption-Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFontTabOrder   TPanelPanel4LeftLTopWidth4Height
BevelOuterbvNoneCaption- RamalFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFontTabOrder   TToolBarToolBar3Left@Top� Width� HeightFAlignalNoneAutoSize	BorderWidthButtonHeightButtonWidthyCaptionToolBar1EdgeBordersebLeftebTopebRightebBottom Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style ImagesDM.ImageList_PrincipalList	
ParentFontShowCaptions	TabOrder TToolButtonToolButton_RetornarLeft TopHint6   Calcula o Fechamento da conta do Hóspede Selecionado.Caption    &SelecionarEnabled
ImageIndexParentShowHintWrap	ShowHint	OnClickToolButton_RetornarClick  TToolButtonToolButton_CancelarLeft Top HintCancela o fechamento da conta.Caption
 &Cancelar
ImageIndexOnClickToolButton_CancelarClick     TPanelPanel6LeftTopWidth� HeightoAlignalTop
BevelInner	bvLowered
BevelWidthTabOrder TPanelPanel10LeftTopWidth� HeightAlignalTop
BevelInner	bvLoweredCaption      OcupadoTabOrder  TPanelPanel13LeftTopWidthMHeightAlignalLeftColorclTealTabOrder    TPanelPanel14LeftTop0Width� HeightAlignalTop
BevelInner	bvLoweredCaption    ReservaTabOrder TPanelPanel17LeftTopWidthMHeightAlignalLeftColorclRedTabOrder    TPanelPanel18LeftTopCWidth� HeightAlignalTop
BevelInner	bvLoweredCaption             DesocupadoTabOrder TPanelPanel21LeftTopWidthMHeightAlignalLeftColorclInfoBkFont.CharsetDEFAULT_CHARSET
Font.ColorclWhiteFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder    TPanelPanel12LeftTopWidth� HeightAlignalTop
BevelInner	bvLoweredCaptionLEGENDA:Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTimes New Roman
Font.StylefsBold 
ParentFontTabOrder  TPanelPanel16LeftTopVWidth� HeightAlignalTop
BevelInner	bvLoweredCaption      Não DesocupadoTabOrder TPanelPanel22LeftTopWidthMHeightAlignalLeftColorclBlueTabOrder      TPanelPanel1Left� TopWidth�HeightAlignalClientCaptionPanel1TabOrder TDBGridDBGrid_MapaLeftTopWidth�HeightAlignalClientColorclInfoBk
DataSourceDSQ_Mapa
FixedColorclOliveFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabs 
ParentFontReadOnly	TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style OnDrawColumnCellDBGrid_MapaDrawColumnCell
OnDblClickDBGrid_MapaDblClickColumnsExpanded	FieldNameSITUACAOTitle.AlignmenttaCenterTitle.Caption   POSTO / GRADUAÇÃO - NOMEWidth3Visible	 Expanded	FieldNameSITUACAO_CURSOTitle.AlignmenttaCenterTitle.Caption   SITUAÇÃO/CURSOWidth� Visible	 Expanded	FieldNameDATA_ENTRADATitle.AlignmenttaCenterTitle.CaptionENTRADAWidthZVisible	 Expanded	FieldName
DATA_SAIDATitle.AlignmenttaCenterTitle.Caption   SAÍDAWidth[Visible	      TQueryQuery_Exclui_ReservaDatabaseNamehotel1LeftaTopV  TDataSourceDST_Mapa_HospedeDataSetTable_Mapa_HospedeLeft�Topk  TTableTable_Mapa_HospedeDatabaseNamehotel1IndexFieldNames
IDENTIDADEMasterFields
IDENTIDADEMasterSourceDST_Mapa_Hospedagem	TableNameHOSPEDELeft�Toph TStringFieldTable_Mapa_HospedeIDENTIDADE	FieldName
IDENTIDADERequired	Size  TStringFieldTable_Mapa_HospedeNOME	FieldNameNOMESize(  TStringFieldTable_Mapa_HospedeNOME_GUERRA	FieldNameNOME_GUERRASize  TStringFieldTable_Mapa_HospedePOSTO	FieldNamePOSTOSize  TStringField Table_Mapa_HospedeSITUACAO_CURSO	FieldNameSITUACAO_CURSOSize
  TStringFieldTable_Mapa_HospedeOM_ORIGEM	FieldName	OM_ORIGEM   TTableTable_Mapa_HospedagemDatabaseNamehotel1IndexFieldNamesIDENTIDADE;PREDIO;APTO;CAMAMasterFieldsAPTCODIGO;PREDIO;APTO;CAMAMasterSourceDSQ_NaoDesocupar	TableName
HOSPEDAGEMLeft�TopC TStringFieldTable_Mapa_HospedagemIDENTIDADE	FieldName
IDENTIDADERequired	Size  TStringFieldTable_Mapa_HospedagemFICHA	FieldNameFICHARequired	Size  TStringFieldTable_Mapa_HospedagemPREDIO	FieldNamePREDIOSize  TFloatFieldTable_Mapa_HospedagemAPTO	FieldNameAPTO  TFloatFieldTable_Mapa_HospedagemCAMA	FieldNameCAMA  TStringField(Table_Mapa_HospedagemSITUACAO_HOSPEDAGEM	FieldNameSITUACAO_HOSPEDAGEMSize
  TStringField Table_Mapa_HospedagemDATAENTRADA	FieldNameDATAENTRADASize  TStringFieldTable_Mapa_HospedagemDATASAIDA	FieldName	DATASAIDASize   TDataSourceDST_Mapa_HospedagemDataSetTable_Mapa_HospedagemLeft�TopC  TDataSourceDST_Mapa_HistoricoDataSetTable_Mapa_HistoricoLeftiTopC  TDataSourceDST_Mapa_Hospede_HistoricoDataSetTable_Mapa_Hospede_HistoricoLeftiTopk  TTableTable_Mapa_Hospede_HistoricoDatabaseNamehotel1IndexFieldNames
IDENTIDADEMasterFields
IDENTIDADEMasterSourceDST_Mapa_Historico	TableNameHOSPEDELeftHToph TStringFieldStringField2	FieldName
IDENTIDADERequired	Size  TStringFieldStringField7	FieldNameNOMESize(  TStringFieldStringField8	FieldNameNOME_GUERRASize  TStringFieldStringField9	FieldNamePOSTOSize  TStringFieldStringField10	FieldNameSITUACAO_CURSOSize
  TStringFieldStringField11	FieldName	OM_ORIGEM   TTableTable_Mapa_HistoricoDatabaseNamehotel1IndexFieldNames
IDENTIDADEMasterFields	APTCODIGOMasterSourceDSQ_NaoDesocupar	TableName	HISTORICOLeftITopC TStringFieldTable_Mapa_HistoricoIDENTIDADEDisplayWidth	FieldName
IDENTIDADERequired	Size  TStringFieldTable_Mapa_HistoricoFICHADisplayWidth	FieldNameFICHARequired	Size  TStringFieldTable_Mapa_HistoricoPREDIODisplayWidth	FieldNamePREDIOSize  TFloatFieldTable_Mapa_HistoricoAPTODisplayWidth
	FieldNameAPTO  TStringFieldTable_Mapa_HistoricoDATAENTRADADisplayWidth	FieldNameDATAENTRADASize  TStringFieldTable_Mapa_HistoricoHORAENTRADADisplayWidth	FieldNameHORAENTRADASize  TStringFieldTable_Mapa_HistoricoDATASAIDADisplayWidth	FieldName	DATASAIDASize   TDataSourceDSQ_MapaDataSetIBQuery_MapaLeft�Top�   TQueryQuery_NaoDesocuparDatabaseNamehotel1SQL.StringsRselect ac.predio, ac.apto, ac.cama, ' ', ' ', ac.nome, ' ', ' ', ' ', ac.aptcodigofrom aptocama acwhere (ac.predio = 'A')z   and    (ac.aptcodigo<> 'OCUPADO' and ac.aptcodigo<> 'DESOCUPADO' and ac.aptcodigo<> 'NÃO OCUPAR' and ac.aptcodigo<>'DEP')   Left TopP  TQueryQuery_Monta_MapaDatabaseNamehotel1SQL.Strings�select ho.predio, ho.apto, ho.cama, hp.posto, hp.nome_guerra, hp.nome, hp.situacao_curso, ho.dataentrada, ho.datasaida, ac.aptcodigo,from hospedagem ho, hospede hp , aptocama ac%where (ho.identidade = hp.identidade)Hand ( ho.predio = ac.predio and ho.apto = ac.apto and ho.cama = ac.cama)unionQ   select ac.predio, ac.apto, ac.cama, ' ', ' ', ' ', ' ', ' ', ' ', ac.aptcodigo   from aptocama ac   where (ac.predio = 'A')&   and   (ac.aptcodigo = 'DESOCUPADO')   unionY       select ac.predio, ac.apto, ac.cama, ' ', ' ', ac.nome, ' ', ' ', ' ', ac.aptcodigo       from aptocama ac       where ac.predio = 'A'*          and    ac.aptcodigo = 'NÃO OCUPAR'       union\          select ac.predio, ac.apto, ac.cama, ' ', ' ', ac.nome, ' ', ' ', ' ', ac.aptcodigo          from aptocama ac!          where (ac.predio = 'A')&          and   (ac.aptcodigo = 'DEP')          union`              select ac.predio, ac.apto, ac.cama, ' ', ' ', ac.nome, ' ', ' ', ' ', ac.aptcodigo              from aptocama ac%              where (ac.predio = 'A')�                 and    (ac.aptcodigo<> 'OCUPADO' and ac.aptcodigo<> 'DESOCUPADO' and ac.aptcodigo<> 'NÃO OCUPAR' and ac.aptcodigo<>'DEP')              union�                  select distinct re.predio, re.apto, re.cama, re.posto, re.nome_guerra, re.nome, re.situacao_curso, re.dataentrada, re.datasaida , 'RESERVA'.                  from reserva re, aptocama ac*                  where (re.predio = 'A' )F                  and   (re.predio = ac.predio and re.apto = ac.apto )5                  and   (ac.aptcodigo = 'DESOCUPADO') Left Top0  TQueryQuery_Mapa_CabecalhoDatabaseNamehotel1SQL.Strings5select predio, apto, ramal, tv1, tv2 from apartamento Left Top TStringFieldQuery_Mapa_CabecalhoPREDIO	FieldNamePREDIOOriginHOTEL1.APARTAMENTO.PREDIO	FixedChar	Size  TFloatFieldQuery_Mapa_CabecalhoAPTO	FieldNameAPTOOriginHOTEL1.APARTAMENTO.APTO  TStringFieldQuery_Mapa_CabecalhoRAMAL	FieldNameRAMALOriginHOTEL1.APARTAMENTO.RAMALSize  TStringFieldQuery_Mapa_CabecalhoTV1	FieldNameTV1OriginHOTEL1.APARTAMENTO.TV1Size
  TStringFieldQuery_Mapa_CabecalhoTV2	FieldNameTV2OriginHOTEL1.APARTAMENTO.TV2Size
   TDataSourceDSQ_NaoDesocuparDataSetQuery_NaoDesocuparLeft TopP  TDataSourceDST_Table_Tabela_PostoDataSetQuery_Tabela_PostoLeft~Top2  TQueryQuery_Tabela_PostoDatabaseNamehotel1Left`Top0  TQueryQuery1DatabaseNamehotel1LeftaTopV  TTableTable_Apto_OcupadoDatabaseNamehotel1IndexFieldNamesPREDIO;APTO;CAMAMasterFieldspredio;apto;camaMasterSourceDSQ_Mapa	TableNameAPTOCAMALeftPTop�   TTableTable_ReservaDatabaseNamehotel1IndexFieldNamesNOME;PREDIO;APTOMasterFieldsnome;predio;aptoMasterSourceDSQ_Mapa	TableNameRESERVALeftSTop�  TStringFieldTable_ReservaIDENTIDADE	FieldName
IDENTIDADERequired		FixedChar	Size  TDateTimeFieldTable_ReservaDATAENTRADA	FieldNameDATAENTRADARequired	  TStringFieldTable_ReservaNOME	FieldNameNOMESize(  TStringFieldTable_ReservaNOME_GUERRA	FieldNameNOME_GUERRASize  TStringFieldTable_ReservaPOSTO	FieldNamePOSTOSize  TStringFieldTable_ReservaDEPENDENTE_DE	FieldNameDEPENDENTE_DESize  TStringFieldTable_ReservaTELEFONE_FUNCIONAL	FieldNameTELEFONE_FUNCIONALSize
  TStringFieldTable_ReservaSITUACAO_CURSO	FieldNameSITUACAO_CURSOSize
  TStringFieldTable_ReservaOM_ORIGEM	FieldName	OM_ORIGEM  TFloatFieldTable_ReservaDEPENDENTE	FieldName
DEPENDENTE  TStringFieldTable_ReservaHORAENTRADA	FieldNameHORAENTRADASize  TDateTimeFieldTable_ReservaDATASAIDA	FieldName	DATASAIDA  TStringFieldTable_ReservaPREDIO	FieldNamePREDIO	FixedChar	Size  TFloatFieldTable_ReservaAPTO	FieldNameAPTO  TFloatFieldTable_ReservaCAMA	FieldNameCAMA  TStringFieldTable_ReservaRECEBE	FieldNameRECEBE	FixedChar	Size  TStringFieldTable_ReservaUSUARIO	FieldNameUSUARIOSize
   TDataSourceDST_ReservaDataSetTable_ReservaLeftwTop�   TIBQueryIBQuery_Delete_MapaDatabaseDM.IBDatabase_HotelLocalTransactionDM.IBTransaction_HotelLocalBufferChunks�CachedUpdatesSQL.StringsDelete from Sel_Predio LeftpTop�   TIBQueryIBQuery_MapaDatabaseDM.IBDatabase_HotelLocalTransactionDM.IBTransaction_HotelLocalAfterScrollIBQuery_MapaAfterScrollBufferChunks�CachedUpdatesSQL.Stringsiselect codigo, predio, apto, cama, ramal, nome, tipo,  situacao, situacao_curso, data_entrada, Data_Saidafrom Sel_Predio LeftpTop�   TIBTableIBTable_HotelDatabaseDM.IBDatabase_HotelLocalTransactionDM.IBTransaction_HotelLocalBufferChunks�CachedUpdates	FieldDefsNameCODIGO
Attributes
faRequired DataTypeftStringSize Name
IDENTIDADEDataTypeftStringSize NamePREDIO
AttributesfaFixed DataTypeftStringSize NameAPTODataType	ftInteger NameCAMADataType	ftInteger NameRAMALDataTypeftStringSize NameTV1DataTypeftStringSize
 NameTV2DataTypeftStringSize
 NameTIPO
AttributesfaFixed DataTypeftStringSize NameSITUACAODataTypeftStringSize< NameSITUACAO_CURSODataTypeftStringSize
 NameNOMEDataTypeftStringSize( NameDATA_ENTRADADataTypeftStringSize Name
DATA_SAIDADataTypeftStringSize  	IndexDefsNameRDB$PRIMARY2FieldsCODIGOOptions	ixPrimaryixUnique   	StoreDefs		TableName
SEL_PREDIOLeftxTop0  TIBQueryIBQuery_Verifica_MapaDatabaseDM.IBDatabase_HotelLocalTransactionDM.IBTransaction_HotelLocalBufferChunks�CachedUpdatesSQL.Strings~select Identidade, codigo, predio, apto, cama, ramal, nome, tipo, situacao, situacao_curso, data_entrada, Data_Saida from mapawhere nome  like '%J%'union~select Identidade, codigo, predio, apto, cama, ramal, nome, tipo, situacao, situacao_curso, data_entrada, Data_Saida from mapawhere nome  like '%J%' and 5(codigo in ( select codigo from mapa where cama = 0)) LeftxTop    