object Form_Seleciona_Banco: TForm_Seleciona_Banco
  Left = 341
  Top = 192
  Width = 214
  Height = 234
  BorderIcons = []
  Caption = 'Banco de Dados - Hotel IPV - Vers�o 3.00'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000008
    8888888BBB37777BBB8888888800000888888BBB6666666667BB888888000008
    8888BB76666666666663B88888000008888BB6666666666666667B8888000008
    88BB666666666666666667B88800000888B6666666666666666666BB88000008
    8B767777777777777777766B88000008BB6666788877777888776663B8000008
    B76666677777777777666666B8000008B66666447777777774466666B800000B
    3666644447777777444466663B00000B7666444444777774444446667B00000B
    7666444444483F44444446667B00000B7666444457774545544446667B00000B
    7666778487757477748846667B00000B7666778447848487748756667B00000B
    7666544444777778454776667B00000B7666554457547774444446667B00000B
    7666454444488744444446667B00000B7666644444447444444466667B00000B
    7666644444475544444466667B00000B7666664444478744444666667B00000B
    7666666444488844446666667B00000B7666666664477744666666667B00000B
    7666666666666666666666667B00000BB33333333333333333333333BB00000B
    7447444444444444444444447B00000B745B444447757777748777447B00000B
    7777B74444444444444444447B00000B3B777B5787777758577778777B00000B
    7444447444444444444444447B00000BBBBBBBBBBBBBBBBBBBBBBBBBBB00E000
    0003E0000003E0000003E0000003E0000003E0000003E0000003E0000003E000
    0003E0000003E0000003E0000003E0000003E0000003E0000003E0000003E000
    0003E0000003E0000003E0000003E0000003E0000003E0000003E0000003E000
    0003E0000003E0000003E0000003E0000003E0000003E0000003E0000003}
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object RadioGroup_BD: TRadioGroup
    Left = 20
    Top = 20
    Width = 130
    Height = 59
    Caption = ' Banco de Dados '
    ItemIndex = 0
    Items.Strings = (
      'Hotel'
      'Simula��o')
    TabOrder = 0
  end
  object BitBtn_Retornar: TBitBtn
    Left = 33
    Top = 105
    Width = 103
    Height = 26
    Caption = '&Retornar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn_RetornarClick
    Glyph.Data = {
      B2050000424DB205000000000000360400002800000013000000130000000100
      0800000000007C01000000000000000000000001000000010000000000008080
      8000000080000080800000800000808000008000000080008000408080004040
      0000FF80000080400000FF00400000408000FFFFFF00C0C0C0000000FF0000FF
      FF0000FF0000FFFF0000FF000000FF00FF0080FFFF0080FF0000FFFF8000FF80
      80008000FF004080FF00C0DCC000F0CAA60060208000C0FFFF00E0E0A0008000
      60008080FF00C0800000FFC0C000FFCF0000FFFF6900E0FFE000B39CDD00EE8F
      B300F96F2A00CDB83F0036844800418C9500425E8E007A62A000AC4F6200BE2F
      1D007666280000450000013E450013286A006A39850085324A00040404000808
      08000C0C0C0011111100161616001C1C1C002222220029292900303030005F5F
      5F00555555004D4D4D0042424200393939000007000000000D008199B700B499
      840090BDBD00607F7F007F606000000E000000001B00000028002B090800001D
      0000000039009B00000000250000000049003B111100002F000000005D004517
      1700003A000011114900531C1C00FF160000FF002B006C212100141459000051
      00006A1A47006732190000610000FF310000FF0061007B20530067431600E22E
      2E001659260004465100492E68008F520700B8186A0015239000FF530000FF00
      A300124A6A006C3375009A414A000B653700152CA400B11F8300FF2C4E00B651
      2000926408000B566F00AD435900127236001733B00000A100001F5F77007147
      89001C43B0007D2DB70095860000236E7A00009F260001A9730000CA0000015B
      AC00C21D2000705294004CAA240089940A007B6E360090754400A800FF00FF71
      0000FF00DF004A915600F84834008232CC007041E40001CA680042BC3600FF9A
      0000B7229600337D85008CB72500ED5A360000FF5C000048FF00A29B22004DCF
      42005258C20095D32000E024A500B556730000A9A9003C6FD000589F67000BCF
      890000ACFF00FE2EA7007F59E20067DC4C00FF18FF00FF7D3A0018D0B10000FF
      C70000E2FF003D9ADF009F815600BA43C6008B71AF00C9A23800CE53D100659A
      FF00DBCA4600FF4DFF006AE9C800E0DE4C00FF98FF0082C0DF00A5ECE900CDF6
      F500FFD0FF005AACB100AE916300654C22003F4E8D0070705000FFFFD000FFE7
      FF00696969007777770086868600969696009D9D9D00A4A4A400B2B2B200CBCB
      CB00D7D7D700DDDDDD00E3E3E300EAEAEA00F1F1F100F8F8F80066C1B20078BF
      8000F0F0C600FFA4B200FFB3FF00A38ED10037DCC300549EA00070AE7600C19E
      7800BF648300D383A400323FD100007DFF0023784400605F24002C0E0E000000
      BE00001FFF00003931003E85D9008577020081D8B0001D21560030000000B3C8
      88000079A0008170EA0069F15100CD749100FF7CFF00FFFFA200F0FBFF00A4A0
      A000537F680029793E0012911200CF05FC00AC117F0072E52E000E0E0E0E0E0E
      0E0E0E0E0E0E0E0E0E0E0E0E0E000E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E
      0E000E0E0E0E0E0E0E0E000E0E0E0E0E0E0E0E0E0E000E0E0E0E0E0E0E00000E
      0E0E0E0E0E0E0E0E0E000E0E0E0E0E0E0003000E0E0E0E0E0E0E0E0E0E000E0E
      0E0E0E000303000E0E0E0E0E0E0E0E0E0E000E0E0E0000030303000000000000
      00000E0E0E000E0E0E0E00030303000F0F000E0E0E0E0E0E0E000E0E0E0E0003
      0300000F0F000E0E0E0E060E0E000E0E0E0E00030303000F0F000E0E0E06060E
      0E000E0E0E0E00030303000F0F000E0E0606060606000E0E0E0E00030303000F
      0F000E060606060606000E0E0E0E00030303000F0F000E0E0606060606000E0E
      0E0E000303000F0F0F000E0E0E06060E0E000E0E0E0E0003000F0F0F0F000E0E
      0E0E060E0E000E0E0E0E00000F0F0F0F0F000E0E0E0E0E0E0E000E0E0E0E0000
      0000000000000E0E0E0E0E0E0E000E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E
      0E000E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E00}
  end
  object StatusBar_Abertura: TStatusBar
    Left = 0
    Top = 175
    Width = 206
    Height = 25
    Panels = <
      item
        Text = 'Forne�a o nome do usu�rio e sua senha'
        Width = 750
      end
      item
        Width = 50
      end>
    SimplePanel = False
    SimpleText = 'Selecione o banco de dados.'
  end
end