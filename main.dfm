object frmMain: TfrmMain
  Left = 200
  Top = 113
  Caption = 'Cobia Test Program'
  ClientHeight = 761
  ClientWidth = 768
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object CheckBox1: TCheckBox
    Left = 336
    Top = 170
    Width = 97
    Height = 17
    Caption = 'CheckBox1'
    Color = clMoneyGreen
    ParentColor = False
    TabOrder = 2
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 768
    Height = 737
    ActivePage = autoTest
    Align = alClient
    Images = ImageList1
    TabOrder = 0
    object TabSheet2: TTabSheet
      Caption = 'Offsets'
      ImageIndex = -1
      TabVisible = False
      object lvOffsetR0_3: TListView
        Left = 16
        Top = 19
        Width = 617
        Height = 134
        Columns = <
          item
            Width = 40
          end
          item
            Caption = '0 A'
            Width = 70
          end
          item
            Caption = '0 B'
            Width = 70
          end
          item
            Caption = '1 A'
            Width = 70
          end
          item
            Caption = '1 B'
            Width = 70
          end
          item
            Caption = '2 A'
            Width = 70
          end
          item
            Caption = '2 B'
            Width = 70
          end
          item
            Caption = '3 A'
            Width = 70
          end
          item
            Caption = '3 B'
            Width = 70
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Items.ItemData = {
          05380200000400000000000000FFFFFFFFFFFFFFFF10000000FFFFFFFF000000
          000253003100007011C21800B055C21800C012C218005848C218002048C21800
          E847C21800B047C218004047C21800D046C218009846C218006046C21800F045
          C21800B845C218008045C218004845C218001045C21800000000FFFFFFFFFFFF
          FFFF10000000FFFFFFFF000000000253003200006844C218003044C21800F843
          C21800C043C218008843C218005043C218001843C21800E042C21800A842C218
          007042C218000042C218009041C218005841C218002041C21800B040C2180078
          40C21800000000FFFFFFFFFFFFFFFF10000000FFFFFFFF000000000253003300
          00803EC218000840C21800D83DC21800903AC21800583AC21800203AC21800B0
          39C218007839C218000839C21800D038C218009838C21800F835C218006038C2
          1800F84AC218007034C21800A036C21800000000FFFFFFFFFFFFFFFF10000000
          FFFFFFFF000000000253003400000034C21800C833C218005833C218002033C2
          1800E832C21800B032C218007832C218004032C21800D031C218009831C21800
          6031C218002831C21800F030C218008030C218004830C218001030C218FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ReadOnly = True
        ParentFont = False
        TabOrder = 0
        ViewStyle = vsReport
      end
      object lvOffsetR4_7: TListView
        Left = 16
        Top = 177
        Width = 617
        Height = 136
        Columns = <
          item
            Width = 40
          end
          item
            Caption = '4 A'
            Width = 70
          end
          item
            Caption = '4 B'
            Width = 70
          end
          item
            Caption = '5 A'
            Width = 70
          end
          item
            Caption = '5 B'
            Width = 70
          end
          item
            Caption = '6 A'
            Width = 70
          end
          item
            Caption = '6 B'
            Width = 70
          end
          item
            Caption = '7 A'
            Width = 70
          end
          item
            Caption = '7 B'
            Width = 70
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Items.ItemData = {
          05380200000400000000000000FFFFFFFFFFFFFFFF10000000FFFFFFFF000000
          0002530031000040572F110070832F1100A0692F1100080FC218003818C21800
          2010C21800A013C21800F812C21800400FC218003013C21800C817C21800E855
          C218007832C218002831C21800B032C21800E832C21800000000FFFFFFFFFFFF
          FFFF10000000FFFFFFFF000000000253003200005833C21800C833C218000034
          C218004040C21800A036C218007034C21800F84AC218006038C21800F835C218
          009838C21800D038C218000839C218007839C21800B039C21800203AC2180058
          3AC21800000000FFFFFFFFFFFFFFFF10000000FFFFFFFF000000000253003300
          00D83DC218000840C21800803EC21800D844C218007840C21800B040C2180020
          41C218005841C218009041C218000042C218007042C21800A842C21800E042C2
          18001843C218005043C218008843C21800000000FFFFFFFFFFFFFFFF10000000
          FFFFFFFF00000000025300340000F843C218003044C218006844C21800B830C2
          18001045C218004845C218008045C21800B845C21800F045C218006046C21800
          9846C21800D046C218004047C21800B047C21800E847C218002048C218FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ReadOnly = True
        ParentFont = False
        TabOrder = 1
        ViewStyle = vsReport
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Detectors'
      ImageIndex = -1
      TabVisible = False
      object Label4: TLabel
        Left = 218
        Top = 291
        Width = 75
        Height = 14
        Caption = 'Offset adjusted'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 16
        Top = 287
        Width = 191
        Height = 19
        Caption = 'Summed Detector values'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 16
        Top = 16
        Width = 157
        Height = 19
        Caption = 'Raw Detector values'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 191
        Top = 20
        Width = 104
        Height = 14
        Caption = 'No Offset adjustment'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object lvRing: TListView
        Left = 16
        Top = 312
        Width = 617
        Height = 233
        Columns = <
          item
            Width = 140
          end
          item
            Caption = 'Alias'
            Width = 75
          end
          item
            Width = 80
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        FlatScrollBars = True
        Items.ItemData = {
          05E00100000800000000000000FFFFFFFFFFFFFFFF02000000FFFFFFFF000000
          000349004E0031000253003100A8C8C11A013000B0C6C11A00000000FFFFFFFF
          FFFFFFFF02000000FFFFFFFF000000000B49004E0032002B0049004E0035002B
          0049004E003600025300320088D0C11A0130002871C11A00000000FFFFFFFFFF
          FFFFFF02000000FFFFFFFF000000000349004E003300025300330070CFC11A01
          3000C8CEC11A00000000FFFFFFFFFFFFFFFF02000000FFFFFFFF000000000B49
          004E0034002B0049004E0037002B0049004E003800025300340040C6C11A0130
          0028CCC11A00000000FFFFFFFFFFFFFFFF02000000FFFFFFFF00000000076D00
          650061006E00200053003100026900310030D1C11A01300050D0C11A00000000
          FFFFFFFFFFFFFFFF02000000FFFFFFFF00000000076D00650061006E00200053
          003200026900320060D3C11A01300050D7C11A00000000FFFFFFFFFFFFFFFF02
          000000FFFFFFFF00000000076D00650061006E00200053003300026900330040
          D4C11A01300008D4C11A00000000FFFFFFFFFFFFFFFF02000000FFFFFFFF0000
          0000076D00650061006E00200053003400026900340098D3C11A013000D0D3C1
          1AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF}
        ParentFont = False
        TabOrder = 0
        ViewStyle = vsReport
      end
      object btnCopy: TButton
        Left = 368
        Top = 281
        Width = 75
        Height = 25
        Caption = 'Copy'
        TabOrder = 1
        OnClick = btnCopyClick
      end
      object btnEraseLast: TButton
        Left = 558
        Top = 281
        Width = 75
        Height = 25
        Caption = 'Erase Last'
        TabOrder = 2
        OnClick = btnEraseLastClick
      end
      object btnEraseAll: TButton
        Left = 465
        Top = 281
        Width = 75
        Height = 25
        Caption = 'Erase All'
        TabOrder = 3
        OnClick = btnEraseAllClick
      end
      object lvValues: TListView
        Left = 16
        Top = 40
        Width = 427
        Height = 225
        Columns = <
          item
            Width = 60
          end
          item
            Caption = 'Integration'
            Width = 140
          end
          item
            Caption = 'Mean'
            Width = 110
          end
          item
            Caption = 'Overflow'
            Width = 80
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Items.ItemData = {
          05A80100000800000000000000FFFFFFFFFFFFFFFF03000000FFFFFFFF000000
          000349004E00310000F87F8D120080498D120008156A1400000000FFFFFFFFFF
          FFFFFF03000000FFFFFFFF000000000349004E00320000A8548D120058458D12
          0028536A1400000000FFFFFFFFFFFFFFFF03000000FFFFFFFF00000000034900
          4E00330000C8458D120010498D1200F0526A1400000000FFFFFFFFFFFFFFFF03
          000000FFFFFFFF000000000349004E0034000098518D1200A0808D1200B8526A
          1400000000FFFFFFFFFFFFFFFF03000000FFFFFFFF000000000349004E003500
          00E0468D1200E8448D120080526A1400000000FFFFFFFFFFFFFFFF03000000FF
          FFFFFF000000000349004E0036000068808D120060146A140048526A14000000
          00FFFFFFFFFFFFFFFF03000000FFFFFFFF000000000349004E0037000010136A
          1400A8176A140010526A1400000000FFFFFFFFFFFFFFFF03000000FFFFFFFF00
          0000000349004E0038000098146A1400D0146A1400D8516A14FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF}
        ParentFont = False
        TabOrder = 4
        ViewStyle = vsReport
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Calibration'
      ImageIndex = -1
      object GroupBox3: TGroupBox
        Left = 15
        Top = 55
        Width = 634
        Height = 282
        Caption = 'Calibration data'
        Color = clMoneyGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 2
        object GroupBox2: TGroupBox
          Left = 303
          Top = 24
          Width = 266
          Height = 81
          Caption = ' Dose Calibration Normation '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label20: TLabel
            Left = 13
            Top = 21
            Width = 88
            Height = 16
            Caption = 'f(x) = Nk*x'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
          end
          object Label28: TLabel
            Left = 14
            Top = 51
            Width = 35
            Height = 16
            Caption = ' Nk ='
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object CalibrationUnit: TLabel
            Left = 167
            Top = 47
            Width = 81
            Height = 16
            Caption = '*10^6 Gy/C'
          end
          object btnSaveNormFactor: TButton
            Left = 153
            Top = 16
            Width = 65
            Height = 25
            Caption = 'Save'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = ClearExcelClick
          end
          object edtDoseNormFactor: TEdit
            Left = 55
            Top = 47
            Width = 106
            Height = 24
            Color = clCream
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = '-'
          end
        end
        object GroupBox4: TGroupBox
          Left = 14
          Top = 24
          Width = 266
          Height = 241
          Caption = ' kV + TF Normation '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object Label18: TLabel
            Left = 15
            Top = 21
            Width = 128
            Height = 16
            Caption = 'f(x) = c1*x + c0'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
          end
          object btnSavePolynomCoeffs: TButton
            Left = 198
            Top = 12
            Width = 65
            Height = 25
            Caption = 'Save'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = btnSavePolynomCoeffsClick
          end
          object memNormFactorPrix: TMemo
            Left = 16
            Top = 46
            Width = 103
            Height = 155
            Alignment = taRightJustify
            BorderStyle = bsNone
            Color = clMoneyGreen
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Courier New'
            Font.Style = []
            Lines.Strings = (
              'kV-Low-c1'
              'kV-Low-c0'
              'kV-High-c1'
              'kV-High-c0'
              'TF-Low-c1'
              'TF-Low-c0'
              'TF-High-c1'
              'TF-High-c0')
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object memNormationCoeffs: TMemo
            Left = 125
            Top = 43
            Width = 116
            Height = 158
            Color = clCream
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Courier New'
            Font.Style = []
            Lines.Strings = (
              '-'
              '-'
              '-'
              '-'
              '-'
              '-'
              '-'
              '-')
            ParentFont = False
            TabOrder = 2
          end
        end
        object GroupBox5: TGroupBox
          Left = 303
          Top = 111
          Width = 224
          Height = 154
          Caption = ' Calibration meta data '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object Label19: TLabel
            Left = 13
            Top = 43
            Width = 29
            Height = 16
            Caption = 'Year'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object Label24: TLabel
            Left = 70
            Top = 43
            Width = 41
            Height = 16
            Caption = 'Month'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object Label25: TLabel
            Left = 125
            Top = 43
            Width = 25
            Height = 16
            Caption = 'Day'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object Label22: TLabel
            Left = 16
            Top = 93
            Width = 97
            Height = 16
            Caption = 'Calibration Lab'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object Label21: TLabel
            Left = 13
            Top = 27
            Width = 104
            Height = 16
            Caption = 'Calibration date'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object edtCalDateYear: TEdit
            Left = 13
            Top = 61
            Width = 44
            Height = 24
            Color = clCream
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Text = '-'
          end
          object edtCalDateMonth: TEdit
            Left = 70
            Top = 61
            Width = 44
            Height = 24
            Color = clCream
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = '-'
          end
          object edtCalDateDay: TEdit
            Left = 125
            Top = 61
            Width = 44
            Height = 24
            Color = clCream
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Text = '-'
          end
          object edtCalLab: TEdit
            Left = 15
            Top = 115
            Width = 156
            Height = 24
            Color = clCream
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Text = '-'
          end
          object btnSaveCalMetaData: TButton
            Left = 156
            Top = 15
            Width = 65
            Height = 25
            Caption = 'Save'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnClick = btnSaveCalMetaDataClick
          end
        end
      end
      object btnReadFactors: TButton
        Left = 17
        Top = 16
        Width = 134
        Height = 33
        Caption = 'Read from device'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 1
        ImageMargins.Left = 6
        Images = ImageList1
        ParentFont = False
        TabOrder = 0
        OnClick = btnReadFactorsClick
      end
      object GroupBox1: TGroupBox
        Left = 21
        Top = 343
        Width = 333
        Height = 346
        Caption = ' Product data '
        Color = clInactiveCaption
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        object Label17: TLabel
          Left = 14
          Top = 94
          Width = 41
          Height = 16
          Caption = 'Serial '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 14
          Top = 154
          Width = 47
          Height = 16
          Caption = 'Version'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label29: TLabel
          Left = 14
          Top = 216
          Width = 38
          Height = 16
          Caption = 'Model'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label40: TLabel
          Left = 14
          Top = 38
          Width = 111
          Height = 16
          Caption = 'Firmware version'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object edtSerialNum: TEdit
          Left = 14
          Top = 116
          Width = 123
          Height = 24
          Color = clCream
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '-'
        end
        object btnSaveSerial: TButton
          Left = 260
          Top = 15
          Width = 65
          Height = 25
          Caption = 'Save'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnSaveSerialClick
        end
        object edtVersion: TEdit
          Left = 14
          Top = 176
          Width = 123
          Height = 24
          Color = clCream
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = '-'
        end
        object edtModelNo: TEdit
          Left = 29
          Top = 306
          Width = 58
          Height = 24
          Color = clCream
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Text = '-'
          Visible = False
          OnChange = edtModelNoChange
        end
        object edtModelType: TEdit
          Left = 14
          Top = 276
          Width = 268
          Height = 24
          BevelInner = bvLowered
          BevelKind = bkSoft
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clInactiveCaption
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          Text = '-'
        end
        object GroupBox7: TGroupBox
          Left = 171
          Top = 40
          Width = 159
          Height = 192
          Caption = ' Permissions '
          Color = clInactiveCaption
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 5
          object Label77: TLabel
            Left = 16
            Top = 82
            Width = 92
            Height = 16
            Caption = 'Ocean license'
          end
          object Label99: TLabel
            Left = 16
            Top = 136
            Width = 137
            Height = 13
            Caption = 'License limit (Year-Mon)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object cbxPerms_PTBSystem: TCheckBox
            Left = 16
            Top = 24
            Width = 97
            Height = 17
            Caption = 'PTB System'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object cbxPerms_CustomerSystem: TCheckBox
            Left = 16
            Top = 47
            Width = 128
            Height = 17
            Caption = 'Customer System'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object cbxPerm_Ocean: TComboBox
            Left = 16
            Top = 104
            Width = 121
            Height = 21
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object edtOceanLicensLimit: TEdit
            Left = 16
            Top = 152
            Width = 121
            Height = 21
            BevelInner = bvLowered
            BevelKind = bkSoft
            BevelOuter = bvNone
            BorderStyle = bsNone
            Color = clInactiveCaption
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            Text = '-'
          end
        end
        object cBxSelectModelType: TComboBox
          Left = 14
          Top = 238
          Width = 310
          Height = 24
          Color = clCream
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          Text = 'Select Model type'
        end
        object edtFirmwareVersion: TEdit
          Left = 14
          Top = 60
          Width = 146
          Height = 24
          Color = clCream
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
          Text = '-'
        end
      end
      object GroupBox9: TGroupBox
        Left = 360
        Top = 343
        Width = 289
        Height = 170
        Caption = 'Electrometer calibration'
        Color = clMoneyGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 3
        OnClick = GroupBox9Click
        object lowElChargeCalValLabel: TLabel
          Left = 83
          Top = 93
          Width = 31
          Height = 16
          Caption = 'Low '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object highElChargeCalValLabel: TLabel
          Left = 82
          Top = 65
          Width = 28
          Height = 16
          Caption = 'High'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label31: TLabel
          Left = 13
          Top = 39
          Width = 59
          Height = 13
          Caption = 'Sensitivity'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label35: TLabel
          Left = 130
          Top = 39
          Width = 100
          Height = 13
          Caption = 'Calibration Factor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object lowElChargeCalValEdit: TEdit
          Left = 128
          Top = 90
          Width = 129
          Height = 24
          Color = clCream
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '-'
        end
        object highElChargeCalValEdit: TEdit
          Left = 128
          Top = 60
          Width = 129
          Height = 24
          Color = clCream
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = '-'
        end
        object EMHighStart: TButton
          Left = 10
          Top = 59
          Width = 65
          Height = 25
          Caption = 'Set High'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = EMHighStartClick
        end
        object Button11: TButton
          Left = 10
          Top = 122
          Width = 65
          Height = 25
          Caption = 'Set Auto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = btnSetAuto
        end
      end
      object lowElChargeCalValSave: TButton
        Left = 552
        Top = 470
        Width = 65
        Height = 25
        Caption = 'Save'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = lowElChargeCalValSaveClick
      end
      object EMLowStart: TButton
        Left = 370
        Top = 433
        Width = 65
        Height = 25
        Caption = 'Set Low'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = EMLowStartClick
      end
      object GroupBox6: TGroupBox
        Left = 360
        Top = 519
        Width = 289
        Height = 170
        Caption = 'Internal MAS calibration'
        Color = clMoneyGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 6
        OnClick = GroupBox9Click
        object lowMasCalValLabel: TLabel
          Left = 86
          Top = 100
          Width = 31
          Height = 16
          Caption = 'Low '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object highMasCalValLabel: TLabel
          Left = 86
          Top = 73
          Width = 28
          Height = 16
          Caption = 'High'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label42: TLabel
          Left = 260
          Top = 102
          Width = 21
          Height = 13
          Caption = 'A/V'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label44: TLabel
          Left = 260
          Top = 70
          Width = 21
          Height = 13
          Caption = 'A/V'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label72: TLabel
          Left = 130
          Top = 43
          Width = 100
          Height = 13
          Caption = 'Calibration Factor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object lowMasCalValEdit: TEdit
          Left = 128
          Top = 92
          Width = 129
          Height = 24
          Color = clCream
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '-'
        end
        object highMasCalValEdit: TEdit
          Left = 128
          Top = 62
          Width = 129
          Height = 24
          Color = clCream
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = '-'
        end
        object lowMasCalValSave: TButton
          Left = 192
          Top = 122
          Width = 65
          Height = 25
          Caption = 'Save'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = lowMasCalValSaveClick
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Log'
      ImageIndex = -1
      object Command: TLabel
        Left = 11
        Top = 8
        Width = 47
        Height = 13
        Caption = 'Command'
      end
      object Label1: TLabel
        Left = 11
        Top = 54
        Width = 17
        Height = 13
        Caption = 'Log'
      end
      object lblSend_N: TLabel
        Left = 496
        Top = 54
        Width = 95
        Height = 13
        Caption = '<No command set>'
      end
      object JvArrowButton1: TJvArrowButton
        Left = 496
        Top = 27
        Width = 89
        Height = 25
        DropDown = mnuSend_N
        Caption = 'Send (n)'
        FillFont.Charset = DEFAULT_CHARSET
        FillFont.Color = clWindowText
        FillFont.Height = -11
        FillFont.Name = 'Tahoma'
        FillFont.Style = []
        OnClick = Send1Click
      end
      object edtCommand: TEdit
        Left = 11
        Top = 27
        Width = 350
        Height = 21
        TabOrder = 0
        OnKeyUp = edtCommandKeyUp
      end
      object btnSendCommand: TButton
        Left = 376
        Top = 25
        Width = 89
        Height = 25
        Caption = 'Send'
        TabOrder = 1
        OnClick = btnSendCommandClick
      end
      object edtCommLog: TMemo
        Left = 11
        Top = 73
        Width = 454
        Height = 488
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object btnClearLog: TButton
        Left = 496
        Top = 536
        Width = 75
        Height = 25
        Caption = 'Clear log'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsItalic]
        ParentFont = False
        TabOrder = 3
        OnClick = btnClearLogClick
      end
      object btnCopyLog: TButton
        Left = 496
        Top = 328
        Width = 75
        Height = 25
        Caption = 'Copy log'
        TabOrder = 4
        OnClick = btnCopyLogClick
      end
      object pnlSend_N: TPanel
        Left = 144
        Top = 84
        Width = 306
        Height = 45
        Caption = 'pnlSend_N'
        ShowCaption = False
        TabOrder = 5
        Visible = False
        object Memo1: TMemo
          Left = 121
          Top = -44
          Width = 185
          Height = 89
          Lines.Strings = (
            'Memo1')
          TabOrder = 0
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Measure'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabVisible = False
      object Shape1: TShape
        Left = 361
        Top = 395
        Width = 277
        Height = 75
        Brush.Color = clSilver
      end
      object Bevel2: TBevel
        Left = 12
        Top = 391
        Width = 626
        Height = 2
        Shape = bsBottomLine
      end
      object imgExcel: TImage
        Left = 11
        Top = 399
        Width = 35
        Height = 35
        AutoSize = True
      end
      object imgOverFlow: TImage
        Left = 238
        Top = 180
        Width = 170
        Height = 80
        AutoSize = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000AA0000
          00500803000000BEA11ECF0000000467414D410000AFC837058AE90000001974
          455874536F6674776172650041646F626520496D616765526561647971C9653C
          00000300504C5445084C86FFFFFF318AAA1690CB08477FB490385B8B86238AB7
          148CC74E8D920B5484084D8E888C5C0C609F6B8B76C3912B2F83A51078B53B84
          9BA58E440A57970F73B00C5B927A8D6A39748A127AAE798A694C81881172A50B
          568D1589C1207DAB988D51B48F36106C9EE09314FFC4055B847D1073ACD1921F
          4D868D7988664E898F3D8195968B4E127EB5094A7B6A86710A54913F899C9790
          52408C9F1075B30F70AD0E6DAA1488C41487C20D65A30A59981695CF0A549511
          7AB70B5A9A158FCA1692CD158EC91591CB148DC8FFC201EF9607148BC61179B6
          1077B4148AC50F72AF1281BE0F71AF0F6FAC1074B1095293094F900951910D67
          A50E6AA80D6AA90D68A60B5D9C0C63A20E69A70C62A10D66A30B5C9B0B5E9D0C
          5F9E095394FFFBD60C61A0095192FFDE62063863FED74CFFEDA2127EBBC76D19
          FFF8C8063157FFE375FFF4BCFEE5871281BD052947052C4DFFEA95127FBC0740
          731486C1FFF0B0117BB8FED1371483C0FFFBE31484C0127DBAFFCA00117DB8D2
          7B14DA8711FFCD24EAA20BEF9606F09505F39A05EF9407ED8800E08F0D000000
          CD7417E69B0EE8940BFFF18AFFFEF6FFFCEEF0AB09FFC302FFFFFCEE9202FFF9
          AAFFF5987A7F7997989CED8D00FFCA17EEB414F0B302F4C151DF9412F3B630FF
          C70E3D3D3D61645D1797D2B38B2FFFC501073F6C141411F6D178EE8F05CB8E1E
          094F899B79207C7345FEE954E59A040D5E8C4D5054EBA500F2C7141076B2EFA5
          21EF9B0E2324290C5F99436365F6D619062F52FBD5060844780E63930A5B9916
          91CC0D6499F6EDC6B9B9B8D29320127CB9F4C901FEE532F3BE0A0E68A40D66A0
          1482BE587777D2CAABDFCE92E6DAABFBE318D992030E699D27637B0F68971482
          B8C3B7862F7FA00E6AA77987650B61A00B5F9E4D838A0E6CA80F6FA8FAB903DE
          A801174C6C6356271179B2265369106EA3127FB81485BC1485BE0E6AA10F6CA5
          7A906D0F6FAB2180AF1B709AE1BB32127AB5D9D9D97A8E6B0E66A22084B4227A
          A61283BD125B82104E761A5675186385473A141C92C6168FCAEAE9E51693CE16
          96D0EF9507FFC00030E51DBD000010C24944415478DAED9B795C5367BAC79F93
          04C292064288010504141001675C7163C0B12E0828D6DE818ED68AD45AEB6768
          ADDAF1D6E5D33B6D4767B0DAF6DA6AA75AC6A5D6F52AD3BA00562B8B1BB6B468
          B50A4410CB2AB22F8959EEF39E370990939300CEFDC3CFE7BE7E9AE4F99DF77D
          9E6F9E773DE19431C0D35298FF47FD3F42D5F35EDDFFA26DDB8AD2872A035104
          4F1DEA545ED4DCDFD9B6AD287DA83210259FA2EA7851A32FDAB6B90AE3E0B7E2
          1CFC6E78C3B25900E7FAD8A80F8AF0DF8FEAF2AE46DE28732F110C5F182560F4
          84F6DF893A8D17F5DCB3B66D4BE59CCB46699BD2F927AF8EC08CA57322EA26E5
          66C3BBF61AF549B94051A7F3A266CFB46D5B2ADF65AA1CDC2EE9A607D6695BCB
          FCB69E995C1729B4DBA84FCAB7F650F502DBB68592FD65B948513096F1927AD6
          6D4BC9782F312BBE2E1218813DB77D50ECA2AE7FDFB66DA1E41F6F959C168E80
          D1EDFA41951D2A65E228C29A1F6DCF6D1F14236A0C2F6AFE54DB766F45F04A89
          B0BA75ACDAA92809D7EADB5E19CBDED4652D73C99A61CF6D1F94EF28EAEF7951
          FB370016340A947963D562CDDAF35D9236F54D5D7E7ABCAE709986B3C70C6000
          9CA7A89CD9672E5A916DBBA7A2BFF417A7D6A6B6304843E3B5E406F16DAF07CA
          DFC6C9CEA6E44E81BEBBE151CE5154675ED449976DDBBD14AFA0189C53EA9BFB
          8891FA52037C12FFCD2AEF3959F161BADC7EB8B1AE7452D4596621D720B807E0
          A735E5B93F1BEBF55572DF53304CAC5F45AC3F27E81B6AA4194B3D53748593C3
          4CBB4C5E77C391720C061065DF315BB228EA1C937D3EEC3AFD201E35887DBF60
          B13B5CE0EC166645B7F0BEC03F7B5C57C3DFA8BD324209425593DF181C02CF81
          07154F7537144F137ED70E1067D7312DA729EA44A3A96D2A315F720F25AF6ECD
          BDDB5BDADD4A75CD46764E957D66BC90DE3A5859F3502F4E0BEBBC2678CE28F6
          E854F1182846D449F61C1BCB955EA83FFA20695E5CA9D8BF112DD751F8E2F1A8
          777B4BBB5BA9DED8D156DF380ED46B4D570ABF0FAFFF31B874842C4577F79D7C
          33AAACC3881AF5A8072ABFE3DEA8C6EA1AECFDE658F2A965552AE4FD193F1898
          DEED2DED6EA5E6B5C7EC9C1ABDCA7CE93383018E4731098604D9A5770A58E912
          40B8946D6400065A6E024CB6E7B8BB3FBA51AF694DA400EAEF71088CBC550153
          A4C4347DF821FC0688431C4C9273798B7328F5786D8BE451539B694E91B21D7E
          73170C3522FD50C9DACE6BBF665EE88DCA66C48C4A1C47DC1CD323D41900F904
          F4DB0010DB03750D5BFD4035ECF9C518A7A0A41E144B5011E322E9B86D472A84
          C73A6ED3ABD98BD2E5F8F2B11AA4DB49EEC99AE978FEB50AA1FF8D215D823526
          D274F4ECED520BC7E35BC60E89CB17EE106858151DA17BBAD09E4154325ECE7F
          48D70159E0EF0985EC657AC97B1114DC6C410E726D2B457D9BADF8950A14AF98
          227D510D796777E270F14875844F9AD0C0DA482A76C171ECBD941A2CB623BEAE
          1CB5EE71C469A17F799029A9E90CD42B4A7EABACAD1181D2233049FC6CD2095C
          9A705FF796D3A13A530099C8B31E60677A2ADA800EF7AC4DDD83315BB790F820
          C6EFFD6923B8AF24F5FF4A51D7B18DB7A9C1C77C3FF3357AF94FD85DCF4AF46D
          6713044967923768FD2BA90D792F887F5D4D36CDF9F74A05D5AD3DE7543A535F
          0DA3BC485AA32F2E932DEFF48C59780260B379EC89DF340521AE648133053B0D
          8D44DD85702B58F7884C9285C1B06CA1A8F16CE36C441D6DF254760B200172BA
          2074381490E44E812BF5205D89CEF11DEB61ED3D7FD8A00A744105621B4464A1
          A2FB144043F1948F1E5683732744B93FAC115D9C36E7D1E2FCDDCDA082AFBB51
          679A8210F723E7DDA4A6E7C2E30F40319156745AB9A78918A47C631B351046A5
          82E7A422B63124A6820F19F05D2A080C23B54934D8F82EC0C1231D6DE59A70F1
          EB14F4642D445454421308DB9E99FE138C2DCA7B591498143054CCA21A172B71
          B40915DD870E276EA0F4361220F99E5B9F748118274334A6C53DAA276A1A6B64
          B480F855132A7E37D9625693A6ECC32E49D5C247DD2B07D6DB855F6C017E5405
          6247A69003B59AEE539AC39500BEEE15954D42CCEB6F3C6E42419438C2212472
          9116B4E863E40CDA084B0EA2BE4E42895F6515EA13C38D7CD0029EB212D962AC
          FF50F525A9FB31457D937CD6E616613FA718614EDF8651E833E31184D692AF89
          D20724233EECD5FA6570B20C7C92803D00ED5D27F13DAB1B56FE297B6D470B92
          6ADCABC20E0BF118D4E5FBFC3150E72D920C8FFB4476C0157D8C8C359F9ACEA0
          DBD570F8010C4B6415EAF3734C8FB0714FF1C17A185D04B2A514681B455DCE1A
          EF79020C339E82F37E062841BFAED87A543148D31E025CBC0D21B3D5A6C4E694
          4118E91AD77698522EC2CDDF38A7B6FBDD21A84CFBC4DD12688608278F323817
          E52695AE1505AC3FB0CBE8B69DF5B13A08E055B8800D1E6E6EA70078B5E006C8
          1A41B1F8ECCFE43DCC789EF98CA2AEA7D609E413171D84D923023133C35E40E9
          E1D5227225621EBEFCAB18BF8927BC3149DFE2350FBE42D4F9A486DB47D13164
          A1326DFE5FD460FD3AA623F2D2FD667005ED4C4D19A80DBAB72E873C7BF9673C
          D997ECC5469E6CD5971075033A2C41204F367E10E9A8E3B7F1252C2A6D24BBD5
          1CA46EDFA7A81BA9B5BF89ECFDA11A28C3B72027025297B501D73CD99FC8E564
          6CAAF0006D1904651E822F11958CD5BA4161756DD5ADE17777B339D5AEFDEF56
          1CA99A2A66E48D1BAED8D521E27139C07442A83050726B2BDEDB97EC278DD880
          2F22EA2644C314292EC1826280D109287FD842B23365D0D1DBA6D058DEA5A86F
          19CD23823253FF868AD89361C2D76788037A9F9B5D64BC48EC6365F04B06A951
          4C172A764E6DD7326B70AC92FE67EEB139D58360A6CFF750950FE9656B45D97E
          3838FE48DCB27E0EE20424270D12836E282BD8797203E3CFA5A1D918A4FC9DA2
          761F625BCA1B59D013B17EAC3DF1CA236C17400DA81190AE9149C86C7D80A864
          8C9FDAE9A4B8A00967E71492D67B4DFE96450D2F568196FDE54E13088AC62EC3
          08916CF8B3B871FB0612B7AC3F15A2467787950DF2A271EA704ECB265EA9C141
          7C6B85912CD71295B40710F9014FD9390BB256F4145CEE2C152A0AC695F9AEA1
          A4784BF16B6504F6FFF8AB6588AA872E3C918CF91E8E00ACEAC421F0E9C144AB
          8EEF6B2D1C5B1623EA6C1870297C5D41162A32A790147037F50EAE55BA573191
          97CB8CA42088AC075197213835332C267DC98481053A4B513D068EFA219EA8B2
          C715EF36E694ECA671654A1CAA3F8A49E777B13F8C4EBCEFD425E9140E91CA42
          53972F1958A047143576C0A4FF952D200B156EFE2652E85CF39386E9083BA935
          937A405025383D66446FF86749E2A49E038A7486A28EE7ADC06ECDFCB6E7820E
          B250D57ED04D2AD4BD5C0C1DCCF88B157A33E9DC5FEE0348D486114B32C384E1
          43B96EFBA014DA431D5C65CB6E49EB788C0B95CA774D372938FB3D63E8602664
          74E714659736062E47318BAFCB42E77A4395A55B6E208E62449DC78B7A79922D
          FB00F254B6E19C3291261D7386E6886DDBAAC24F6ACCA4CEE0058E156070D6E9
          FD5748B224AF174EB274CB0DC4513229EA205ED4F185B66CD7556D0AD590E2B0
          55E9DD39C56D7FDAF58EB023484A7E7422A4E0E5E8735947D20AE39ECF0C4BF4
          2CB474CB0DC451EA286A1C2FAA40CF6F97B6BCE6E97B16704E19498540485D87
          4DBCCA8CFF678FDEF772DCBC094AF116D5C1A0DDBA5F162A48E5FE4D47604F39
          45511378516B9536EC852578EB27AFFDC09C53EC7DDC4C87DC0B8309E5674CBD
          CF92EE8B94E37EF48C3A54BF4492295F5DA3B41788A37C4D51F95765AF1A7E7B
          072E54C7714E0975C69C52525CF857E4226A2FD238F91D57413B2302A7E7C3BF
          7196BBC5DB0BC451AE3D016A759AD8E16E236EFE5B7BF63EBB99AE6838A23176
          3E4B8AF7F2A72253F682AB5E97FB728AE49093E7EA1A3B81F850E70E600088AF
          939F281D21041E42B533B073DF48DAB5A27D5F8F9CFAC7B1232D526A80F62B30
          75FC7275A6E10D50DA0EC451FE455123A1FFE57EC47CF71F70A11A51D3739C6A
          D9DD747AD02E8139A7465258FCE22657E87060866D6EDCE5214DE96FBCABF650
          FDEEF3D92B6B1F2B545D222F36A73DC629D055CA44DA226F30FE5499B3C1A13A
          00046A66C84A4986CCCD6191CD401CC588FA1FBCA8BC3FAFADBD28F1392D7468
          1C55DF7B46B147A958C8627BDF0FCC39256571692D0C72D42784282499E90C30
          B6027194A314F5795E54BE75F52FC5B850658797073CE4E634160ADFFAFBDC1C
          B2471152F3AFBF391BFC7E0018AAC3A3807C9787C16D93AD401CE518457D8117
          55E368D556ADF93C4699A768965BE9FDD8ACF50595BE0E4372BC2C48F196CFB5
          02D30A8697422587C6DCFAD856208EF21545FD032FAA4E68D5FE3443E3512474
          EA72B79CFB988C5909DB4995C0E149E01FD71314EF33271FBB074A07BDBF77AA
          7A3AD325B41188A31CA1A80B7851ABBDADDA3F90BB1447905B8C5332A36675E0
          8928029A20E0B427F426C5B43A5443C0B7516EBE8BE4BB0E305D36027194E314
          75212FEABD002BF69FE6B39BBF43A3771358CC2801CC1A7708940CB8390EAE4F
          37373392C28C9C4D7524ADC19B4B251907CA03F80371942F29EA645E54AB8BD5
          994C7297221389CCA4ECAD293DA0CCD2AB7C5DAA18834BF417572D4931AD72BC
          0B1DA6967ABF572AE98C2FE70FC4512ED943F52FB7627F48EE5224CD1ACE2A45
          D6D3B9233E87902A665CC54F26D29C9E0EE8CCCA9D961C1EFCFED14EB8CF1788
          A31851937951DF79876BBF7DADC3E156ABEC719B3337A7B8F2CFFDF5B1BBC6A9
          5673FFAA1552D890924E162CFD888507D2328EAAF57C8138CA218AFA475ED46F
          E239B67E0159A81C41632DA7648F9AEB7E1DF4C91BDE9B61851459A52A92D619
          49098DEA9922355F208E7290A2F26FC8EBB6706CF5DCBAD60AA14ED829B19653
          7290F60117B8B7CF2A282E58FB26919925F5764F9467EC3DB980271047C9A0A8
          525ED479995C7B227BA212B23975050E29D9A34CD573ACB864172C356883D3DF
          4ECB38749227104769A1A88B7951D5628E6D0852B8E539B56B243C39DD0C3649
          E9223054272C4B4A94AB6708780271947D14F545E02B5636564D98C2ED928316
          B442236BF7618ACDA92AE40EA9197287BE738B6B45C03D821AA37C9476F01F8E
          D6037194FD14358917D5E131C7760826A86E83996B30A17478298AC195BE95BE
          E0C99EDA3B8C3F48638F495BCCCD9C3B4DFFC0B9BD1658D44A0DA6D537E0B1F5
          401CE530455D047C25258363A7FC6DBEE355D9303406B1BFE8E25E4DFFD8AF02
          3270816E97C6E7375DF1BF7B163E037023D218AA049A98F446F5C10CEB8138CA
          018ACA7962C75CAC3C1072EB83CA40497538DC60C2AFB229A4C9C3E3A947A30C
          EA7BC312540E2B0408D4B92F0C3E1A93FEF6161791F5401CE5E20050F53BB2BB
          3CEB0D52D2C5DD980CF94BB4AC914DAB93E91C627E34D6B5DDFC0FDA81713418
          422EC5664E46D40723FB876AF9144C77B91BCCB1EF4E7DE5C70BD1812AA307F2
          352F4E857CF20C5F1479DE833ECB87AFD1A023CE855847973FD5F80FA6E647A1
          1A5200738EE2BCDAF220D87A208E523010549F75130A7FBE0C4F50262EDD0E8C
          464306407F5115FD0AE4B36E515AB3E3BC334FF4E43383FDAF9C135FFEA0AF0D
          EA296A54BFA22892169DAEFD0E599F803416323531CA9989E592BEB6C8B3876A
          1A923D6D39735244589F801417788851CE397058DFC01388A318515FE2F5D8EC
          C6B19B416038294A1B4D9ED21B7889299A3D479BC8E8C1CD7A208EB297A226F6
          C9BBB9080CC9C9A2D3E46F1E032EB3610E681381D1F7B9C5498ABA94B7C2230F
          AEDD84EB654E3B88E0098A56A4250962DCF90271942F28EA737D70DEAB182039
          754F727F5BF52C870E251F02A61F0DFE87A2CEEF7FA89C19C613DE0CCB931E47
          E05366407FCA89A7EE7F0C794ACA5384FABF67148E6A3C7D06E6000000004945
          4E44AE426082}
        Visible = False
      end
      object lstMeasure: TListView
        Left = 0
        Top = 567
        Width = 760
        Height = 141
        Align = alBottom
        Columns = <
          item
            Caption = 'kV calc'
          end
          item
            Caption = 'TF calc'
          end
          item
            Caption = 'Dose'
          end
          item
            Caption = 'HVL'
          end
          item
            Caption = 'kV ratio'
          end
          item
            Caption = 'TF ratio'
          end
          item
            Caption = 'Time'
          end
          item
            Caption = 'S1'
          end
          item
            Caption = 'S2'
          end
          item
            Caption = 'S3'
          end
          item
            Caption = 'S4'
          end
          item
            Caption = 'S1Cu'
          end
          item
            Caption = 'S2Cu'
          end
          item
            Caption = 'S3Cu'
          end
          item
            Caption = 'S4Cu'
          end>
        RowSelect = True
        PopupMenu = mnuSend_N
        TabOrder = 0
        ViewStyle = vsReport
      end
      object pnlExcel: TPanel
        Left = 0
        Top = 565
        Width = 760
        Height = 2
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        Visible = False
        object Bevel1: TBevel
          Left = 233
          Top = 10
          Width = 4
          Height = 96
          Shape = bsLeftLine
        end
        object lblFileName: TLabel
          Left = 596
          Top = 16
          Width = 35
          Height = 17
          AutoSize = False
          Caption = 'lblFileName'
          Visible = False
          WordWrap = True
        end
        object Label2: TLabel
          Left = 596
          Top = 39
          Width = 48
          Height = 27
          AutoSize = False
          Caption = 'Version'
          Color = clGradientInactiveCaption
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clCaptionText
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
          Visible = False
        end
        object chkOO: TCheckBox
          Left = 10
          Top = 51
          Width = 101
          Height = 17
          Caption = 'Use Open Office'
          TabOrder = 0
          OnClick = chkOOClick
        end
        object chkCloseApp: TCheckBox
          Left = 10
          Top = 89
          Width = 142
          Height = 17
          Caption = 'Close app when destroy'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = chkCloseAppClick
        end
        object btnSave: TButton
          Left = 146
          Top = 40
          Width = 75
          Height = 25
          Caption = 'Save...'
          TabOrder = 2
          OnClick = btnSaveClick
        end
        object edtCol: TEdit
          Left = 379
          Top = 14
          Width = 25
          Height = 21
          TabOrder = 3
          Text = '1'
        end
        object edtRow: TEdit
          Left = 331
          Top = 14
          Width = 25
          Height = 21
          TabOrder = 4
          Text = '1'
        end
        object btnActiveCell: TButton
          Left = 247
          Top = 10
          Width = 75
          Height = 25
          Caption = 'GetActiveCell'
          TabOrder = 5
          OnClick = btnActiveCellClick
        end
        object btnSetValue: TButton
          Left = 247
          Top = 40
          Width = 75
          Height = 25
          Caption = 'SetValue'
          TabOrder = 6
          OnClick = btnSetValueClick
        end
        object edtCellValue: TEdit
          Left = 331
          Top = 44
          Width = 73
          Height = 21
          TabOrder = 7
          Text = 'edtCellValue'
        end
        object chkUseActiveCell: TCheckBox
          Left = 331
          Top = 78
          Width = 90
          Height = 17
          Caption = 'Use active cell'
          Checked = True
          State = cbChecked
          TabOrder = 8
        end
        object optCellValue: TRadioButton
          Left = 426
          Top = 92
          Width = 81
          Height = 17
          Caption = 'As number'
          Checked = True
          TabOrder = 9
          TabStop = True
        end
        object optCellString: TRadioButton
          Left = 426
          Top = 78
          Width = 73
          Height = 17
          Caption = 'As string'
          TabOrder = 10
        end
        object btnGetValue: TButton
          Left = 248
          Top = 70
          Width = 75
          Height = 25
          Caption = 'GetValue'
          TabOrder = 11
          OnClick = btnGetValueClick
        end
        object btnFindCell: TButton
          Left = 496
          Top = 10
          Width = 75
          Height = 25
          Caption = 'FindCell'
          TabOrder = 12
          OnClick = btnFindCellClick
        end
        object edtSheetName: TLabeledEdit
          Left = 500
          Top = 51
          Width = 105
          Height = 21
          EditLabel.Width = 28
          EditLabel.Height = 13
          EditLabel.Caption = 'Sheet'
          TabOrder = 13
          Text = 'Sheet1'
        end
        object chkActiveSheet: TCheckBox
          Left = 505
          Top = 74
          Width = 119
          Height = 17
          Caption = 'Use active Sheet'
          Checked = True
          State = cbChecked
          TabOrder = 14
        end
      end
      object chkExcel: TCheckBox
        Left = 52
        Top = 399
        Width = 97
        Height = 17
        Caption = 'Send to Excel'
        Checked = True
        Enabled = False
        State = cbChecked
        TabOrder = 2
      end
      object btnOpen: TButton
        Left = 175
        Top = 399
        Width = 75
        Height = 25
        Caption = 'Open Excel'
        TabOrder = 3
        OnClick = btnOpenClick
      end
      object pnlKVcalcCont: TPanel
        Left = 11
        Top = 16
        Width = 185
        Height = 87
        BevelOuter = bvNone
        BorderWidth = 1
        Caption = 'kV(poly)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clLime
        Font.Height = -27
        Font.Name = 'MS Reference Sans Serif'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 4
        object lblKVcalc: TLabel
          Left = 1
          Top = 1
          Width = 183
          Height = 20
          Align = alTop
          Caption = 'kV (calc)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 80
        end
        object pnlKVcalc: TPanel
          Left = 1
          Top = 21
          Width = 183
          Height = 48
          Align = alClient
          BevelOuter = bvNone
          Caption = '0.0'
          Color = clBlack
          ParentBackground = False
          TabOrder = 0
        end
        object chkKVcalc: TCheckBox
          Left = 1
          Top = 69
          Width = 183
          Height = 17
          Align = alBottom
          Caption = 'Enable'
          Checked = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 1
          OnClick = chkKVcalcClick
        end
      end
      object pnlTFcalcCont: TPanel
        Left = 231
        Top = 16
        Width = 185
        Height = 87
        BevelOuter = bvNone
        BorderWidth = 1
        Caption = 'kV(poly)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clLime
        Font.Height = -27
        Font.Name = 'MS Reference Sans Serif'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 5
        object lblTFcalc: TLabel
          Left = 1
          Top = 1
          Width = 183
          Height = 20
          Align = alTop
          Caption = 'TF (calc)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 79
        end
        object pnlTFcalc: TPanel
          Left = 1
          Top = 21
          Width = 183
          Height = 48
          Align = alClient
          BevelOuter = bvNone
          Caption = '0.0'
          Color = clBlack
          ParentBackground = False
          TabOrder = 0
        end
        object chkTFcalc: TCheckBox
          Left = 1
          Top = 69
          Width = 183
          Height = 17
          Align = alBottom
          Caption = 'Enable'
          Checked = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 1
          OnClick = chkTFcalcClick
        end
      end
      object pnlDoseCont: TPanel
        Left = 454
        Top = 16
        Width = 185
        Height = 87
        BevelOuter = bvNone
        BorderWidth = 1
        Caption = 'kV(poly)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clLime
        Font.Height = -27
        Font.Name = 'MS Reference Sans Serif'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 6
        object lblDose: TLabel
          Left = 1
          Top = 1
          Width = 183
          Height = 20
          Align = alTop
          Caption = 'Dose'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 45
        end
        object pnlDose: TPanel
          Left = 1
          Top = 21
          Width = 183
          Height = 48
          Align = alClient
          BevelOuter = bvNone
          Caption = '0.0'
          Color = clBlack
          ParentBackground = False
          TabOrder = 0
        end
        object chkDose: TCheckBox
          Left = 1
          Top = 69
          Width = 183
          Height = 17
          Align = alBottom
          Caption = 'Enable'
          Checked = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 1
          OnClick = chkDoseClick
        end
      end
      object pnlKVratioCont: TPanel
        Left = 11
        Top = 200
        Width = 121
        Height = 57
        BevelOuter = bvNone
        BorderWidth = 1
        Caption = 'kV(poly)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clLime
        Font.Height = -27
        Font.Name = 'MS Reference Sans Serif'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        ShowCaption = False
        TabOrder = 7
        object lblKVratio: TLabel
          Left = 1
          Top = 1
          Width = 119
          Height = 15
          Align = alTop
          Caption = 'kV (ratio)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 65
        end
        object pnlKVratio: TPanel
          Left = 1
          Top = 16
          Width = 119
          Height = 23
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          BorderWidth = 1
          Caption = '0.0'
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
        end
        object chkKVratio: TCheckBox
          Left = 1
          Top = 39
          Width = 119
          Height = 17
          Align = alBottom
          Caption = 'Enable'
          Checked = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 1
          OnClick = chkKVratioClick
        end
      end
      object pnlTFratioCont: TPanel
        Left = 509
        Top = 200
        Width = 121
        Height = 57
        BevelOuter = bvNone
        BorderWidth = 1
        Caption = 'kV(poly)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'MS Reference Sans Serif'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        ShowCaption = False
        TabOrder = 8
        object lblTFratio: TLabel
          Left = 1
          Top = 1
          Width = 119
          Height = 15
          Align = alTop
          Caption = 'TF (ratio)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 63
        end
        object pnlTFratio: TPanel
          Left = 1
          Top = 16
          Width = 119
          Height = 23
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          BorderWidth = 1
          Caption = '0.0'
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
        end
        object chkTFratio: TCheckBox
          Left = 1
          Top = 39
          Width = 119
          Height = 17
          Align = alBottom
          Caption = 'Enable'
          Checked = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 1
          OnClick = chkTFratioClick
        end
      end
      object pnlTimeCont: TPanel
        Left = 454
        Top = 105
        Width = 185
        Height = 87
        BevelOuter = bvNone
        BorderWidth = 1
        Caption = 'kV(poly)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clLime
        Font.Height = -27
        Font.Name = 'MS Reference Sans Serif'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 9
        object lblTime: TLabel
          Left = 1
          Top = 1
          Width = 183
          Height = 20
          Align = alTop
          Caption = 'Time'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 44
        end
        object pnlTime: TPanel
          Left = 1
          Top = 21
          Width = 183
          Height = 48
          Align = alClient
          BevelOuter = bvNone
          Caption = '0.0'
          Color = clBlack
          ParentBackground = False
          TabOrder = 0
        end
        object chkTime: TCheckBox
          Left = 1
          Top = 69
          Width = 183
          Height = 17
          Align = alBottom
          Caption = 'Enable'
          Checked = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 1
          OnClick = chkTimeClick
        end
      end
      object pnlS1Cont: TPanel
        Left = 11
        Top = 260
        Width = 121
        Height = 55
        BevelOuter = bvNone
        Caption = 'pnlS1Cont'
        TabOrder = 10
        object lblS1: TLabel
          Left = 0
          Top = 0
          Width = 121
          Height = 13
          Align = alTop
          Caption = 'S1 (s1) pC'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 57
        end
        object chkS1: TCheckBox
          Left = 0
          Top = 38
          Width = 121
          Height = 17
          Align = alBottom
          Caption = 'Enable'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = chkS1Click
        end
        object pnlS1: TPanel
          Left = 0
          Top = 13
          Width = 121
          Height = 25
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          BorderWidth = 1
          Caption = '0'
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
      end
      object pnlS2Cont: TPanel
        Left = 175
        Top = 260
        Width = 121
        Height = 55
        BevelOuter = bvNone
        Caption = 'pnlS1Cont'
        TabOrder = 11
        object lblS2: TLabel
          Left = 0
          Top = 0
          Width = 121
          Height = 13
          Align = alTop
          Caption = 'S2 (s2+s5+s6) pC'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 101
        end
        object chkS2: TCheckBox
          Left = 0
          Top = 38
          Width = 121
          Height = 17
          Align = alBottom
          Caption = 'Enable'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = chkS2Click
        end
        object pnlS2: TPanel
          Left = 0
          Top = 13
          Width = 121
          Height = 25
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          BorderWidth = 1
          Caption = '0'
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
      end
      object pnlS3Cont: TPanel
        Left = 340
        Top = 260
        Width = 121
        Height = 55
        BevelOuter = bvNone
        Caption = 'pnlS1Cont'
        TabOrder = 12
        object lblS3: TLabel
          Left = 0
          Top = 0
          Width = 121
          Height = 13
          Align = alTop
          Caption = 'S3 (s3) pC'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 57
        end
        object chkS3: TCheckBox
          Left = 0
          Top = 38
          Width = 121
          Height = 17
          Align = alBottom
          Caption = 'Enable'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = chkS3Click
        end
        object pnlS3: TPanel
          Left = 0
          Top = 13
          Width = 121
          Height = 25
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          BorderWidth = 1
          Caption = '0'
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
      end
      object pnlS4Cont: TPanel
        Left = 510
        Top = 260
        Width = 121
        Height = 55
        BevelOuter = bvNone
        Caption = 'pnlS1Cont'
        TabOrder = 13
        object lblS4: TLabel
          Left = 0
          Top = 0
          Width = 121
          Height = 13
          Align = alTop
          Caption = 'S4 (s4+s7+s8) pC'
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 101
        end
        object chkS4: TCheckBox
          Left = 0
          Top = 38
          Width = 121
          Height = 17
          Align = alBottom
          Caption = 'Enable'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = chkS4Click
        end
        object pnlS4: TPanel
          Left = 0
          Top = 13
          Width = 121
          Height = 25
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          BorderWidth = 1
          Caption = '0'
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
      end
      object btnDumpGrid: TButton
        Left = 175
        Top = 430
        Width = 75
        Height = 25
        Caption = 'Dump grid'
        Enabled = False
        TabOrder = 14
        OnClick = btnDumpGridClick
      end
      object optLowKVRange: TRadioButton
        Left = 370
        Top = 402
        Width = 124
        Height = 17
        Caption = 'Low kV (38,6 - 90,7)'
        TabOrder = 15
        OnClick = optLowKVRangeClick
      end
      object optHighKVRange: TRadioButton
        Left = 370
        Top = 428
        Width = 135
        Height = 17
        Caption = 'High kV (74,6 - 140,6)'
        Checked = True
        TabOrder = 16
        TabStop = True
        OnClick = optHighKVRangeClick
      end
      object pnlS1ContCu: TPanel
        Left = 10
        Top = 317
        Width = 121
        Height = 55
        BevelOuter = bvNone
        Caption = 'pnlS1Cont'
        TabOrder = 17
        object lblS1Cu: TLabel
          Left = 0
          Top = 0
          Width = 121
          Height = 13
          Align = alTop
          Caption = 'S1 pA'
          Font.Charset = ANSI_CHARSET
          Font.Color = 191
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 32
        end
        object chkS1Cu: TCheckBox
          Left = 0
          Top = 38
          Width = 121
          Height = 17
          Align = alBottom
          Caption = 'Enable'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = chkS1CuClick
        end
        object pnlS1Cu: TPanel
          Left = 0
          Top = 13
          Width = 121
          Height = 25
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          BorderWidth = 1
          Caption = '0'
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
      end
      object pnlS2ContCu: TPanel
        Left = 174
        Top = 317
        Width = 121
        Height = 55
        BevelOuter = bvNone
        Caption = 'pnlS1Cont'
        TabOrder = 18
        object lblS2Cu: TLabel
          Left = 0
          Top = 0
          Width = 121
          Height = 13
          Align = alTop
          Caption = 'S2 pA'
          Font.Charset = ANSI_CHARSET
          Font.Color = 191
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 32
        end
        object chkS2Cu: TCheckBox
          Left = 0
          Top = 38
          Width = 121
          Height = 17
          Align = alBottom
          Caption = 'Enable'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = chkS2CuClick
        end
        object pnlS2Cu: TPanel
          Left = 0
          Top = 13
          Width = 121
          Height = 25
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          BorderWidth = 1
          Caption = '0'
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
      end
      object pnlS3ContCu: TPanel
        Left = 339
        Top = 317
        Width = 121
        Height = 55
        BevelOuter = bvNone
        Caption = 'pnlS1Cont'
        TabOrder = 19
        object lblS3Cu: TLabel
          Left = 0
          Top = 0
          Width = 121
          Height = 13
          Align = alTop
          Caption = 'S3 pA'
          Font.Charset = ANSI_CHARSET
          Font.Color = 191
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 32
        end
        object chkS3Cu: TCheckBox
          Left = 0
          Top = 38
          Width = 121
          Height = 17
          Align = alBottom
          Caption = 'Enable'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = chkS3CuClick
        end
        object pnlS3Cu: TPanel
          Left = 0
          Top = 13
          Width = 121
          Height = 25
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          BorderWidth = 1
          Caption = '0'
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
      end
      object pnlS4ContCu: TPanel
        Left = 509
        Top = 317
        Width = 121
        Height = 55
        BevelOuter = bvNone
        Caption = 'pnlS1Cont'
        TabOrder = 20
        object lblS4Cu: TLabel
          Left = 0
          Top = 0
          Width = 121
          Height = 13
          Align = alTop
          Caption = 'S4 pA'
          Font.Charset = ANSI_CHARSET
          Font.Color = 191
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 32
        end
        object chkS4Cu: TCheckBox
          Left = 0
          Top = 38
          Width = 121
          Height = 17
          Align = alBottom
          Caption = 'Enable'
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = chkS4CuClick
        end
        object pnlS4Cu: TPanel
          Left = 0
          Top = 13
          Width = 121
          Height = 25
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          BorderWidth = 1
          Caption = '0'
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
      end
      object chkOpenFile: TCheckBox
        Left = 55
        Top = 417
        Width = 69
        Height = 17
        Caption = 'Open file'
        TabOrder = 21
      end
      object cmbBq: TComboBox
        Left = 533
        Top = 402
        Width = 95
        Height = 21
        TabOrder = 22
        Text = 'BeamQualities'
        OnSelect = cmbBqSelect
      end
      object Button1: TButton
        Left = 120
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 24
        Visible = False
        OnClick = Button1Click
      end
      object edtTfSet: TLabeledEdit
        Left = 576
        Top = 428
        Width = 25
        Height = 21
        EditLabel.Width = 38
        EditLabel.Height = 13
        EditLabel.Caption = 'TF (set)'
        EditLabel.Transparent = True
        LabelPosition = lpLeft
        NumbersOnly = True
        TabOrder = 23
        Text = '5.0'
      end
      object pnlHvlCont: TPanel
        Left = 11
        Top = 105
        Width = 185
        Height = 87
        BevelOuter = bvNone
        BorderWidth = 1
        Caption = 'HVL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clLime
        Font.Height = -27
        Font.Name = 'MS Reference Sans Serif'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 25
        object lblHvl: TLabel
          Left = 1
          Top = 1
          Width = 183
          Height = 20
          Align = alTop
          Caption = 'HVL'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 35
        end
        object pnlHvl: TPanel
          Left = 1
          Top = 21
          Width = 183
          Height = 48
          Align = alClient
          BevelOuter = bvNone
          Caption = '0.0'
          Color = clBlack
          ParentBackground = False
          TabOrder = 0
        end
        object chkHvl: TCheckBox
          Left = 1
          Top = 69
          Width = 183
          Height = 17
          Align = alBottom
          Caption = 'Enable'
          Checked = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 1
          OnClick = chkTimeClick
        end
      end
      object edtKvHidden: TLabeledEdit
        Left = 232
        Top = 126
        Width = 72
        Height = 21
        EditLabel.Width = 36
        EditLabel.Height = 13
        EditLabel.Caption = 'kV ratio'
        TabOrder = 26
      end
      object edtTfHidden: TLabeledEdit
        Left = 344
        Top = 126
        Width = 72
        Height = 21
        EditLabel.Width = 37
        EditLabel.Height = 13
        EditLabel.Caption = 'TF ratio'
        TabOrder = 27
      end
      object btnTest: TButton
        Left = 344
        Top = 153
        Width = 72
        Height = 25
        Caption = 'Test...'
        TabOrder = 28
        OnClick = btnTestClick
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Firmware'
      ImageIndex = 1
      object Image1: TImage
        Left = 263
        Top = 7
        Width = 32
        Height = 32
        AutoSize = True
        Picture.Data = {
          055449636F6E0000010009002020100001000400E80200009600000010101000
          01000400280100007E0300003030000001000800A80E0000A604000020200000
          01000800A80800004E130000101000000100080068050000F61B000000000000
          01002000312801005E2100003030000001002000A82500008F49010020200000
          01002000A8100000376F0100101000000100200068040000DF7F010028000000
          2000000040000000010004000000000000000000000000000000000000000000
          0000000000000000000080000080000000808000800000008000800080800000
          80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
          FFFFFF0000000000700000000000000000000000000000701170000000000000
          0000000000000013810500000000000000000000000703888971080000000000
          00000000001198F9797970700000000000000000013788939713911500000000
          00000000798879507777797117000000000000000F8971788888803971700000
          00000000089790888F8887179971700000000000008996888888F59979790700
          000000000008913888F873793179311800000000000089357771889710001531
          1700000000000F97988879170000025171000000000000897939710600007001
          3900000000000000971700000500010518000000000000000791100002043053
          7080000000000000008153005300179317151000000000000000391000079793
          5131370000000000000008971797097935051700000000000000000790000797
          0520130000000000000000000008111161471900000000000000000000081707
          0727057000000000000000000001161405773510000000000000000000816160
          7774253000000000000000000009043776350197000000000000000000097167
          4340037000000000000000000008305250079700000000000000000000009070
          0079000000000000000000000000351039700000000000000000000000008903
          5000000000000000000000000000079700000000000000000000000000000800
          00000000FF7FFFFFFC1FFFFFF80FFFFFE003FFFFC001FFFF8000FFFF00003FFF
          80001FFF800007FFC00003FFE00000FFF000003FF800003FFC00003FFF00003F
          FF80005FFFC00007FFF00003FFF80803FFFE7803FFFFE003FFFFE001FFFFE001
          FFFFC001FFFFE000FFFFE001FFFFE003FFFFF00FFFFFF01FFFFFF07FFFFFF8FF
          FFFFFBFF28000000100000002000000001000400000000000000000000000000
          0000000000000000000000000000000000008000008000000080800080000000
          800080008080000080808000C0C0C0000000FF0000FF000000FFFF00FF000000
          FF00FF00FFFF0000FFFFFF000008700000000000007795000000000001873917
          0000000088978771700000000918888971700000007788791037800000097771
          3001100000007900040580000000081101353170000000077089351000000000
          0014061000000000071277180000000008177017000000000014018000000000
          007170000000000000080000E7FFFBFFC3FFFBFF80FFFBFF007FFBFF801FFBFF
          C007FBFFE007FBFFF007FBFFF801FBFFFE41FBFFFFC1FBFFFF80FBFFFF80FBFF
          FFC1FBFFFFC7FBFFFFEFFBFF2800000030000000600000000100080000000000
          0000000000000000000000000000000000000000000000000902050004030900
          0B050C000A0B0B00130C0D0006041300060912000C0C130006091C000B0B1C00
          130E13000F111400141214001719160012121A001A151D0014191F001A1A1B00
          0B0B2500100C2600091022000D112C00161528000C0D3300040B39000C0E3B00
          120D33000D1031000B103A0012113200171A34001D1B310015143D00241E2700
          211D3B001F21280026272800332C2D00222434002A2730002A2D330024233D00
          2A233800372E30003834360042383900513E3F0044403A000C0B41000D154100
          1515440018144400171942001B1B460013154B00171A4E001B1B4E000E165200
          1413520019155000141A52001A1D53001B1C5C00201D5F001F22540029284500
          24234800373843002C2C57002B315500343251003D3951001C1D63001B1B6A00
          211D65001C2064001A216C001C2373001D2178001F287D00212265002F2E6000
          22216A002E3168003C3D6200222176002128770023257C0025287C0032307800
          463C4100403E58004A4546005447490059524C00454859005F4E510057535700
          60524C006454550073625C005856610055556B005F5F720053557E006A6A6A00
          78696300636472006C6A7B007373740073767F007A7A7B0087746E008A777400
          937C7B009B827F001F238300242888002F318B00363B8B00242B93002A2D9400
          252C9A002A2B9A0029329B00343496002A2EA4002533A2002A31A3002734AB00
          2B33AB003337A6002535B1002B35B2002E38B3002B36BA002E3ABC003238B900
          3F4380003E4293003B43AF003540B4004C5381005A5D82004A47940058619D00
          6F6D80007A798E006A6B9C006E7097004244AC00434BBA004A54B4005456B900
          5E63BF007D7BAA006C6CB7002E3CC500343CC600393FD4002E41C9003742CB00
          3441D3003841D5003642DB003A42DA003745E3003B45E3003B48E2003747EF00
          3A45EA003A48EC003C4AF2003D4BFA004447C8004752C300424AD5004246DE00
          404DDF004850D7004F55DC005153D3006A6CCB006971CD00777ACC004045E800
          4755EA00404AF200414CFA004752F3004F59F3004353F9004B55FA004D5AF900
          5A5FF8005B6AFA00616EE0006473EF00616BF6006471F500757EF300807FC000
          7D82D9007D82ED007885FC009B838100868593008C8C9A0092939200A28B8800
          AA908C008B89A4009A97A2009596A9009D9DA9008D8FB5009696B900A4A2A800
          ABADAD00A5A6B600B5B6B6008488CE009C9DCD00878CDC008993DE009296D500
          A09FC100A0A0C100A5A5DB00999CE600858DF7008F94F5008E98FB009699FB00
          9FA8EC009DA5FA00ABACE000B9BAE700A5ABFA00B9B9FB00C7C7C700CFD0CE00
          C7C8D200D5D5D500C2C5FA00C5CBFC00C9CCF800CCD1FC00D5D8F700DDE0FB00
          E2E5F500E5E9FB00ECEDFC00F2F3F500FFFFFF00000000000000000000000000
          90D7000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000DA0F371D6700000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000660207
          4E1D1D4300000000000000000000000000000000000000000000000000000000
          00000000000000000000000010011E8AE76919191E6F00000000000000000000
          00000000000000000000000000000000000000000000000000006C1E034CB5F0
          FCE87C1A1E1C4800000000000000000000000000000000000000000000000000
          0000000000000000002B535981C9FAF6C4C0C0A64D1B1B1ED000000000000000
          00000000000000000000000000000000000000000000006D041E75B3EFFCE9C0
          ADADAAACAA863B1E1C6700000000000000000000000000000000000000000000
          0000000000004401157BC6F9F6C7BCACA7A7A9A7A8A8A87A31182A0000000000
          0000000000000000000000000000000000000000001E513EA2ECFCEABEACA79E
          76493E3E537DA0BAA04D1B1B9300000000000000000000000000000000000000
          00000000001E7DC6F8F8C8ACA9893E0C306A706E5F111550A6BA873C1B470000
          000000000000000000000000000000000000000000B4EFFDECBEA8B2810A66DB
          F1F1F1F1F1F1700F53A2A5A6761A1BCF00000000000000000000000000000000
          0000000000F9FCCDBDACA68A095FF1DDF1F1F1F1F2F2F470077D9EA3A59F4A1C
          5C000000000000000000000000000000000000000000C8C1BDABA75302DDF1F1
          F1F1F1F2F4F4F4F2114E9F9F9FA3A0813216CF00000000000000000000000000
          00000000000000C1C0ADA83805F1F1F1F1F1F2F2F4F4F4F42950A69E9F9F9F9F
          8A4D185C00000000000000000000000000000000000000F5C1AEBA5102DBF1F1
          F2F2F4F4F4F4F4DD0C8EA99E9E89898A87877B3A17D500000000000000000000
          0000000000000000F7C1BD86132EF1F1F2F2F4F4F4F4F44445C4A39E89888150
          84818182571A6000000000000000000000000000000000000000C1AD802144D0
          F1F2F2F4F2D12E60EBBBA39F9F57070116587C7C7D7B402136E3000000000000
          0000000000000000000000C2BC9F76351729442C225EDDFBC5A2A18E35020000
          000235767C7C7F793C37960000000000000000000000000000000000C3BCABBC
          BFCBF3F4FEF9E2AF9F9F772812000000000000063F797C7F837A340000000000
          00000000000000000000000000C7BAA6A2AF9A998D828687834126252D0E0000
          00000C0D04144F7B83878A92000000000000000000000000000000000000CCA8
          A0878381817D80590A04292D0E000404001226242D01023579837FDC00000000
          000000000000000000000000000000E6A08983847B7A37020000000000292526
          120C2D250E0003547D8ACA000000000000000000000000000000000000000000
          EEA28E837C3802000000000000262912121212010120787A8400000000000000
          000000000000000000000000000000000000B0827F7A3D020000000004120402
          2604281752847C762B0000D44400000000000000000000000000000000000000
          000000B9837D7B571302010D5D2D5D022425428C81838787346C8F75378B7A68
          0000000000000000000000000000000000000000E58E7F807B3802052D252500
          04529783898989897C4C58767681804100000000000000000000000000000000
          0000000000009B878282761B0101020F8C8E8AA19F9F9E9FA37E59583575824E
          0000000000000000000000000000000000000000000000E58A8A878656144698
          9F9A00B4A2A3A1B3B17949201039837B6D000000000000000000000000000000
          000000000000000000B89F9F9E89B7EEDF0000EDA4A5BB874F36245B2D138386
          410000000000000000000000000000000000000000000000000000B6A1E50000
          0000005AB2B37A4C24262E2F2C0476854D000000000000000000000000000000
          0000000000000000000000000000000000967576767636252D5E2D2D612D3F86
          7C94000000000000000000000000000000000000000000000000000000000000
          007E7B7956202C2F2F262E645E2C14878A460000000000000000000000000000
          00000000000000000000000000000000009D7D41252E2C2E2C2C643063D2057A
          9F4C000000000000000000000000000000000000000000000000000000000000
          DE7D232D2C2C2C2C2C2C2E6573D32F518A7AD000000000000000000000000000
          000000000000000000000000000000DE8A4B222D2D2D2E2D2C5ED271CE642616
          9F8A5500000000000000000000000000000000000000000000000000000000EE
          8A8105442E2D2D30735ECE6B5F2D6404819F3F00000000000000000000000000
          000000000000000000000000000000009F9F142D302D6572735B2E2E2D642602
          4E9F7AD600000000000000000000000000000000000000000000000000000000
          CB9F4B22442D6473D25F2E5E5D05000776A27E00000000000000000000000000
          0000000000000000000000000000000000A1810A442D5F722D2E642C01031C83
          AF78000000000000000000000000000000000000000000000000000000000000
          00A2A1142D2E2D2D2D260E01024B9F8495000000000000000000000000000000
          0000000000000000000000000000000000E09F4B252E2E2D2402221F81A27EE4
          0000000000000000000000000000000000000000000000000000000000000000
          0000A27F0B5B2C0D00024C9F8E91000000000000000000000000000000000000
          000000000000000000000000000000000000AFA20A200204137BA27DD8000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000E0A23F02023D9F8991000000000000000000000000000000000000000000
          00000000000000000000000000000000000000A2810F77A37E9C000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000AFA2A28A91000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000E1A27ED9000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000FFF3FFFFFFFF0000FFC1FFFF
          FFFF0000FF80FFFFFFFF0000FF003FFFFFFF0000FC001FFFFFFF0000F80007FF
          FFFF0000E00003FFFFFF0000C00001FFFFFF00008000007FFFFF00008000003F
          FFFF00008000000FFFFF000080000007FFFF0000C0000001FFFF0000E0000000
          FFFF0000E00000003FFF0000F00000001FFF0000FC00000003FF0000FE000000
          01FF0000FF00000001FF0000FF80000000FF0000FFC0000000FF0000FFE00000
          01FF0000FFF0000007FF0000FFFC0000067F0000FFFE0000000F0000FFFF0000
          000F0000FFFFC000000F0000FFFFE00200070000FFFFF80600070000FFFFFE3E
          00070000FFFFFFF800030000FFFFFFF800030000FFFFFFF800030000FFFFFFF0
          00010000FFFFFFE000010000FFFFFFE000010000FFFFFFF000000000FFFFFFF0
          00010000FFFFFFF800030000FFFFFFF800070000FFFFFFF8000F0000FFFFFFFC
          003F0000FFFFFFFC007F0000FFFFFFFC01FF0000FFFFFFFE03FF0000FFFFFFFE
          0FFF0000FFFFFFFE1FFF0000FFFFFFFFFFFF0000280000002000000040000000
          0100080000000000000000000000000000000000000000000000000000000000
          05050500090407000306080006040A0005050D0008040A000A0A0B000D091100
          08081A00120C1100100E1900151214001815160015161800171819001B1A1B00
          0E0B22000A0C24000B0D2A00171725001D1D21001314290018142E00080E3500
          0F0E3400110E3100100F3B000E1031000A113B00101136001513340016143500
          1916350011173C0017183C001E1D3900251D23001A2139002222210028212300
          25232A002B272E0029292900342A2D002B2632002A29300029293900392F3000
          2E3231002F333D00333033003C333400313139003F35380038363F0037383800
          3B3B3C0040373C00443A3C00483F3F0047443B004A423E001719450013164C00
          16194C0019184E00171B56001A1A5700151A5900191C5A001D1E59001F1E5E00
          2221430022254E0032334E0020225700373A520036395E001B1C6500161D6D00
          191F6B001D1E6A001C2063001F206D001F25790020226E002B2D6B002D326C00
          2123750021247B0024297E002D30770036387500453F40003E4054004C424300
          47484E00504345004F504F004E4C53005757570051535B0058585A006E5C5F00
          494B6F00535661005E5E610057576D0047457A00696B6E00786863007D6D6800
          7473730076757D0086746F00837172008E7674008F797500937D7B001F238000
          24258100252982002429850025278B00242A8B00252C9000262C9400282D9300
          262D9A00292D9C0026319E002C329E003534900033399B00393E9E00272EA000
          2B2FA4002733A2002932A3002A32A9002C32AB002F34AB002B33AD002D32AD00
          3038A7003137AB003338AD002D35B1002C33B4002C38B4002E3ABE003036B200
          353BB700363EB5003239BB003940A5003D40AB003F44B2003742BF0053578700
          565983006C6C870078788B007C7B89007F7F8F006D7095004041A8004F54A400
          4049B5004148BF007E7FA7007274B0002E3BC300323BC3003A3FC200343DCB00
          363FD0003241CE003842C8003C4AC9003241D0003541D1003743D7003C48D500
          3B43DC003D49DD003D48E5003C46E8003A47EC003A48EC003D4AED003B4AF000
          3E49F1003F4CF900424ACA004A4FCF00454BD0004043DD005A5CD3005E66CB00
          6265C9007076C300646CDB004145E4004E56E3004E5AED00414EF2004752FC00
          4B57F800747AE2007881F7007581FC0083808D008A8B8A0085879A0091919300
          90909A009B9AA5009794AE009898A9008687B6009192B800AEAFB000BCBCBC00
          9496CB009798CC008183D3008488D3008A8CD1009097DF00A0A0D300A6A9DA00
          B9BCD700969AE000969FEA00878CF9008E93F7008894FC00969EF800A9AEE800
          A1A4F700A4ACF700A6ACFA00AAB1F800B0B6FC00B4B9FA00BEC2F600C4C3C400
          CBCBCB00D3D3D300D9D9D900C7CCFB00CFD2FB00D7DCFB00FFFFFF0000000000
          0000000069000000000000000000000000000000000000000000000000000000
          00007205431DA500000000000000000000000000000000000000000000000000
          002E119EF04C185F0000000000000000000000000000000000000000000000D5
          4756D2FDD4CF801B20DA0000000000000000000000000000000000000000371C
          9AF4F5D1C0BEBDB254196C0000000000000000000000000000000000003F42CB
          FCD3C0B7837A7B8EC695404900000000000000000000000000000000DB9CF2F6
          CEBA5B3271D8D6672691C67C1BA3000000000000000000000000000000FEEEBF
          B95365F8F8F8F9FADF1496B6AE4F4B0000000000000000000000000000F3D0C1
          B008E0F8F8F9F9FAFA6A81AEB0B18222A400000000000000000000000000ECC2
          B008E0F9F9FAFAFBFB619FADAD979B94504D00000000000000000000000000ED
          C14F64F8F9FAFBFBD64ECEB0977D5384897E42D9000000000000000000000000
          EFBB804A666E6B63D8EBB6AF470001095480827841AB00000000000000000000
          00F1C1BCCDE7E9E8C9AE842F1500000000197982905900000000000000000000
          0000F7CCAE8F8B8A8B461031100101072B290641889000000000000000000000
          00000000C598897A12000001072B2B07270D06588BE200000000000000000000
          0000000000C88C7C13000000072710152921857CA200DC000000000000000000
          000000000000E58C8145040A393907155D91989642A05A5C5B00000000000000
          0000000000000000A98C7E1A0C0717879BAEAEAE9A795A558AD7000000000000
          000000000000000000E49B9B5A58AACA00B1B2BA93442D208D6D000000000000
          0000000000000000000000C7B400000000AFB87A24333C0E8178000000000000
          000000000000000000000000000000DE7C7C532A5E36625E568D000000000000
          000000000000000000000000000000E17E49333B30623E6F219BA10000000000
          000000000000000000000000000000862D343434306075762C985B0000000000
          0000000000000000000000000000E384253634366875706034558E0000000000
          000000000000000000000000000000AE17393D7377365E3B0D40B3A600000000
          000000000000000000000000000000C353353874606234021E93A80000000000
          000000000000000000000000000000E68B293638330F075999DD000000000000
          00000000000000000000000000000000B0173A28012392A70000000000000000
          00000000000000000000000000000000C4480B03519BAC000000000000000000
          00000000000000000000000000000000EA8B168B9D0000000000000000000000
          0000000000000000000000000000000000B199AC000000000000000000000000
          0000000000000000000000000000000000E800000000000000000000FF7FFFFF
          FC1FFFFFF80FFFFFE003FFFFC001FFFF8000FFFF00003FFF80001FFF800007FF
          C00003FFE00000FFF000003FF800003FFC00003FFF00003FFF80005FFFC00007
          FFF00003FFF80803FFFE7803FFFFE003FFFFE001FFFFE001FFFFC001FFFFE000
          FFFFE001FFFFE003FFFFF00FFFFFF01FFFFFF07FFFFFF8FFFFFFFBFF28000000
          1000000020000000010008000000000000000000000000000000000000000000
          000000000000000004040400060714000F0F1000191919001717210019192200
          1E1C25001312370013163C001D1F3D002625260028232F00342C2E00322A3100
          312B3E00383134003D333400433A3B00141646001C1D52001A1B5E001F225500
          282842002729490028285C001C2169002423640021236F00302E630030326400
          27297200272874002327790023287A0036367B003C3E7F00564A49005A4E4E00
          605152006258550044466D004B4F72004F5073005B5E750057587E005E5E7A00
          7A6864002529830025298D002D328E0031348100262C9000282D9600292D9C00
          29319300363BA1003239A7002F39B9003038BB00303CBF0070728F007A7D9A00
          4B50AD005255A900575CA900686DA2006467AC00696DBD006C73BF007B7DB200
          767ABA00343EC000323CC600383FC3003A46D2004C56CF005359CA006067CB00
          6267CC007579D200535DF7005B66EE006269EC007E82CF009191960097989900
          9E9E9F008D8FBE009899B200A4A3A3009E9FCE008F93DE009D9ED000A0A2D100
          A0A3D700888FE8008791F600C1C2C100CACACA00D3D3D3004CB0000059CF0000
          67F0000078FF11008AFF31009CFF5100AEFF7100C0FF9100D2FFB100E4FFD100
          FFFFFF0000000000262F0000405000005A700000749000008EB00000A9CF0000
          C2F00000D1FF1100D8FF3100DEFF5100E3FF7100E9FF9100EFFFB100F6FFD100
          FFFFFF00000000002F26000050410000705B000090740000B08E0000CFA90000
          F0C30000FFD21100FFD83100FFDD5100FFE47100FFEA9100FFF0B100FFF6D100
          FFFFFF00000000002F1400005022000070300000903E0000B04D0000CF5B0000
          F0690000FF791100FF8A3100FF9D5100FFAF7100FFC19100FFD2B100FFE5D100
          FFFFFF00000000002F030000500400007006000090090000B00A0000CF0C0000
          F00E0000FF201200FF3E3100FF5C5100FF7A7100FF979100FFB6B100FFD4D100
          FFFFFF00000000002F000E00500017007000210090002B00B0003600CF004000
          F0004900FF115A00FF317000FF518600FF719C00FF91B200FFB1C800FFD1DF00
          FFFFFF00000000002F0020005000360070004C0090006200B0007800CF008E00
          F000A400FF11B300FF31BE00FF51C700FF71D100FF91DC00FFB1E500FFD1F000
          FFFFFF00000000002C002F004B0050006900700087009000A500B000C400CF00
          E100F000F011FF00F231FF00F451FF00F671FF00F791FF00F9B1FF00FBD1FF00
          FFFFFF00000000001B002F002D0050003F007000520090006300B0007600CF00
          8800F0009911FF00A631FF00B451FF00C271FF00CF91FF00DCB1FF00EBD1FF00
          FFFFFF000000000008002F000E005000150070001B0090002100B0002600CF00
          2C00F0003E11FF005831FF007151FF008C71FF00A691FF00BFB1FF00DAD1FF00
          FFFFFF00000000552A000000000000000000000000002B434E16000000000000
          00000000001E60523C3B312E00000000000000005E614A2C5A57293B23000000
          0000000000511C626364553A49343D000000000000004C2D56563E4B1A133124
          59000000000000534D453818030105153600000000000000503502000404071B
          5800000000000000005F37080B0A393B33214200000000000000004F41005448
          190C320000000000000000000000220F12253000000000000000000000440E11
          272F1D460000000000000000005C1728260D1447000000000000000000001F10
          06205B00000000000000000000003F094000000000000000000000000000005D
          00000000E7FF0000C3FF000080FF0000007F0000801F0000C0070000E0070000
          F0070000F8010000FE410000FFC10000FF800000FF800000FFC10000FFC70000
          FFEF000089504E470D0A1A0A0000000D49484452000001000000010008060000
          005C72A8660000FFFF4944415478DAECBD079C1CD5952EFE55AEEA38D3934733
          1ACD288C349A91509690000126998CB101E388094E6BAFBD6FD7FB76BDEBF53A
          ACC10903C6060C980C26583219011220014239A7198D341A6972E85CB9DEB9B7
          4798F5AEF7FF7641487EFF3EFC9A9E6E55575557D7F9CEF7DD7BCEB9028A56B4
          13DC0E0441AD8AE0EC38B03C2C8823EC3D27F00D4510F3C7FBDCFED24D38DE27
          50B4A2FD4F8C00402300B08EF779FCA55B11008AF61763B9C09F9FCF656BDA1F
          599EEED8B51B0DF3661C5E7CE527F61CEFF3FA4BB6220014ED84B6A03F2BF83D
          3D153B36AF39E9D0E8C882FCBEEE33AC6DFB97F6A447214D1F9F2AAB19F7D8EC
          5397DC5ED934FE4078F2C4247D440C2BBA77BCCFFB2FC58A0050B413D6824CBA
          22F5CEC6EB9D033DDFEF78E965ACDAF816BABC34F221055E328F3A354E5B1988
          358D47CDC2597B94CA8A7FBCECBA6B366B9ADE71BCCFFD2FC58A0050B413D6D2
          BB367CABF3CE3B7EA4EEDE87EAA927E148E741BCB56D333AED0C4C4383997710
          D5CBA1882A724E00A5A62A9875CE998F1B9515DFBCF08B9F3B7CBCCFFF2FC18A
          0050B413D28682E0546C7BF3818EBFBA667CD8CC410CE2A86B698360C4B07ED7
          1EBCB36F1F6C4545DAF5E0290A645F8152528664D84073CBCC6C785CF5959FFB
          EEDF3E73BCBFC7896E450028DA0969C92090FAEEFAD9A6C17B6E6E5342024435
          0A71C8456D7C3CE2E39B702897C69A8E5DD8971E44366D41314AA0E725A85030
          50A14328893B6DD3673C625494FDF8CCCB2F3954DDDA923CDEDFE944B4220014
          ED84B491556F5FB0F9DE5BFE60746D1464C981E449F0C9BD83408526E8285123
          A8A8ACC10E21854DEB76E1C05012A90088C6C2F46987B60BC15234A0A21CA75C
          7AF16B73172EBCA06EF1BCCCF1FE5E279A1501A06827A4ADBFF147773BCF3D7F
          8D20A7E895451280BC5B50E859826C06D0F22EAAE3A508D58F432E14C1BE2DFB
          B165EF5E7494D848C63D20AF202AC510D51318313D4C5C347F53F3A2D93F9C3E
          6FF6B2D8D46989B0AAF71FEFEF78225811008A76C259FB73CB9B4657BFBE4D79
          754DC83444487011083E3806D0430B04689E07379B43DCD3605457436B6AC0A8
          E760C5EAD7B02DDD03B73CCA1207A0644528721419454578623DA6CC9A735FCB
          490BBFB3E8CA8B0E1EEFEF79225811008A76C25836484D0E0BB17D6FFFEC170B
          B3AF3EFB56596F3F1CBD1412DDA579D58361F9D01C1F900324A53C2C0328CD6B
          D046B330341D65939B10949661EDFE0E6CDBB91EA3660E6E280A9F1EB21E41E0
          06B01145C38C799DF5335AFEE5E2BFBDE1FEE3FD9D8FB71501A068278C0D05BD
          73CB84EAF5FB1F7EF447FB7EFEA36F35883E72720C82AFD28D1AC054890BC83E
          0A63022602C785286A48AB024A2D01E1D13C428938CAC7376178E430DEECDC89
          0DD951A4A311F88E84B029202E8F435608C3AB4F58D34E6EBD65DEC927FD78D2
          ECD939ADB23E7BBCBFFFF1B0220014ED84B35DF7DCB373F88E5F4E4BF869E4C2
          51B84104B22FC11265920236FD9D812A920420A92FDB022C2D0C2DE721AC7848
          C9E4C76280683486EA442DB2491B5B3AF6E3AD915E74571A04183194581128AE
          0F57B450BFA00DD5B366ADED3878F092FFFDD3DB7A8FF777FFB0AD0800453BA1
          2CB37A5DEBCE871F5A2FAF5FADC92113594981EC8620FA0A3C412407B6A1CB2E
          D2B914D4680981838A8C28204AD240CDA7601240E882013DE3400F87503E750A
          84908177B66FC38EF6760CC81ED20C20D408310B1FC97C1E9E164763EBDC6DD5
          4B96FCF345175FF86278D284FFDF54191601A068278CD94150FED677FF6DA9B4
          76FDE3D1C103304316040200C351610B328440800C9722BC4DC02020AB19D8D1
          97420A1E2653C4AFF4C8E94511115B85E3D8D05419B9741255F5D5A86A9E8483
          437D58B76503FA064690A13D392A6DA7A8F0449208520CE1F1F598B260D60F96
          5C74DEFD8D73E7EE3DDED7E3C3B0220014ED84B191DE23FA9E277E7FAFF5C043
          571A5E1A6A791841D6824E8E9F9324D2FD0124DFA128EF623814C55B5D47F0FA
          FE1E0C053E1A482ACCAA2A436B633D6A6040714C482409022F0FC536512EA8A8
          8A55205F12C3DEC121BCB9710746E97376248C7ECB47BCAC1AF94C12A0D7D317
          2F5A37FFB4A5DF9B73E5E54F1FEF6B72ACAD0800453B61ECC0DB6FCFDE72EB2F
          37D4ECDB0D39028ACE0A24D3864851DF1741BA9D343FD17627A463AB1DE0A92D
          BBB1D2B160A921105940BD6B61D6B8322C1E371E9354119A9F87469240F16D08
          B6039980C428AD41657D3306877258BB6D0B3ACC518C183A310281B60DA0D17F
          16EDBB7C4A334213EA6E3AE5FC8F3E35E7C2F3D71EEF6B73ACAC0800453B212C
          F03D69D3CF6FB965E0F9155F6EB0934849A4FF49F36BF4F04513BAE74275D8ED
          2AC20EC5F0EC811E3CD5DE89BD7298A44214A225C2A0CF28C208EA0C05275786
          707AFD784CB47D442D1319D9C5488C00252B20618550565987C4B87138D47B04
          6BD66EC4A14C0A237115218390C75761891A6C2584091326D9A5F3A6FF60C929
          27DF3D71C9925E599478A9B1EFFA92288B7FF165C7450028DA0961F9CE8EC61D
          F7DFBB7164C5AB25358108CBCF211F55E00A2CEA3B508334345B425E0A911C28
          C1C39B76E299F420FA955204041242260F3F4C1241B420090EC6D3E75A8C304E
          ADAEC4BC8A7284891D786E1E811C22F5AF41276611D3C3A89AD88C1C01CADBAB
          D760777707FAA3029239620B6A0C52B40C0A8180EDD8A89B3DE385D32EBFEC8E
          9669539787274F0A8A0050B4A27D4066077EC59157572DDA7BEB6DCBA3038711
          13C809ED1C84F2281C8AFC7210C083CD01400AC23820AAF8F1C6B5D8E45B709C
          3062561E59C5E460110E7490E7C2A7F7E282878961098B6BCB70CAB82A549223
          DBB44DA02A4830D048672112D8548C9F8068F9381C3E348C9736BD851D52068A
          A6431F25FF5654F8E565308773A89AD186DA2573FE2E31A3F9CEF3CEF8A84DA7
          1E4886611EEFEBF77EAC0800453BEE9677ADE9079E7AEA9F066FBEFD8A72CD65
          D3F8182100F0223A4FFF95E8E1B152204F86E286F06A3E857FDBBB0983928090
          13A03EEBA33B26C0C905287123F0F452A414F24EDD87E00CA3CECEE3E244352E
          49D4637244C5A03B806458401026499071111FF551A926503A753A466407AF1F
          D8853DBBDB0978D814234B2BD02147A3483A3EFCD252342F5CB0EACCAB3FF1F7
          9317CDFF8B1F1B280240D18EBBF5ED5A5FB7FF89DF1F325E7A15A29F8724ABC8
          B92E1C7270419120100AC89E0FC953901743F84DF73E3C9EEE21E6A0C0401EE3
          932A3A24058E2D22EC07A4DFE961C844F96DC8B6891802244401CD35B5387D5C
          1427C544C44906F031054F82E5D2FE25020C2F8DBA692D886909ACDBB2031B46
          86D1DD3BC8B70BE921086A184145250E1318D5B4B46C5974CE193F39FB73573E
          78BCAFDFFBB1220014EDB8DBE1471EF8DAF67BEEF845999B2327A488EB8B907C
          01BE40D45F15E0093E8CAC0709616C9605FC78D746EC75481AB80A64DD4228A7
          60D80E6042841AB870492E7814B9C18A87E80E67B5048A0F727911957109AD55
          219C1EAFC5827035E2240132161DD7F0901786896DC8A813CB5012AF46365186
          7D07BAF0CEE60DE8151C484614215B874F8C20178B411E57159494271EBBE0D3
          573D31ED8C939F1623867DBCAFE57FD78A0050B4E36A7EE049477E75C7B2FEBB
          6EBF20970064310AC9F4A153D495C989B30AB9B31C209E9220CB713C680EE2B6
          FDBB90CE0888052198E4DD0EB100D5C9D1B60104362C1748E4EA22ED9B2480C0
          1E01FD5DB8D915920671FA63762886B3EB276076650211D18669A52153640F13
          932042003965A3442B41A2650AF6BB19AC79E32D1CCEA4E0444BE198324AAC10
          4A23D518145D84DA9AFCD9179FF583FAE6893F6C3E79FE5FD4984011008A765C
          6DFB8AE717E51F5CBE3AE8582BAAA203478E100B5038E517030B24FB299A4B08
          9912D25A083F39B0032F0E0DC2C9907E17C2F0258B9C3F4BD1DF23A028E40A78
          CCF9DF3D425078222AC06EF65020200236BDE8A12AA661FEB80A9C52598D7A41
          8696B7600479B8521E198DF4BE2DA0564EA072EA5C4879019BDBF76279EF3E8C
          C654181EFDDB4101AE2EC3AD09215BA2E3B4CBAF58553D7ED2F50D179ED717CA
          E574231239E17B0E1401A068C7D59EFABB6F7D5E797DED3DB55A0E7260137DD7
          E18A2A517172638F822969F7409088DAEB68376DDCB87B33363A367C4B43E02B
          7CDA2FE1FBC4016C58A4E3556200166D4F8A805C9FC140C05207B80E6072C008
          14921880A30510650201C7C7E248099656D662566505C27616963B8A5CC887A4
          EBC44464C47B81C8A406E88D0DD8D5DB8BB59B36E370FF20F48A12B8D93C7CDA
          4E2BADC0508EF6B770FEF38B2EBDE8A9D9E79CF5B4248AE51149DE71BCAFF17F
          65450028DA7133CB1C6D187DFAE5959D37DFD6A8B0EC7CA2EACCA96D5525A7F7
          A00426018100DF9510E82578B6BB0B77B5EFC62151E4DBB1F44003166A48B713
          778049749F6DCFFA7EE5E8D6F631368540C040FC9E3FCBBE4A9840515B656740
          BA3EEBA0DE97D04CC75C3AAE1AF3CB2A11575D920C7938760EA2466044C79332
          B45DF938944E9884B4E962F5EAB7B1C3ED41BFCC062875022803F9A80193C0A9
          727C335A4E3FE3730BAFFEC473E31B1A078EF775FEAFAC0800453B6E961FE86E
          EEBBEDCEDDD9D75721974B933ED749C30BB074857CDB2100B0E821C273148CAA
          71DCBE6B339EEBE9E515822CAC8B021B0770302D5A41ACC1C700EDC3312DA4C8
          F5B34701400E0ACE2FF38F4096756216F4224F0C83C0C2751D842419119928BD
          E460AE11C79CBA6AB4C562284D131B905CD8A5221CDF26103051666B888E9B00
          61623DFA8686F1DA5B6B71309725B6A0C1A06D4C9DB6176330E275289BD1B6B3
          B16DC6372EF8F2575649927C420E101601A068C7CD92EBDEBE66F3B7FFF16E35
          79046129465A5F2301EFC35129E28B26F9AC4DB45D4640D1759F29E3FB5BDFC6
          AEBC0B8F39B0440C8118432D39EFA2C9ADF02306F60FF562E8481F46F2592409
          1804C61444621542810508E4E42CAF4025570CDB121496F74F12234D8E1B6802
          22828B6A0B280FEB581A4BE09C483942E5218C1A7952101634C527F020E0C8F8
          A894CB503BED24921A12B66DDC8475FBB66124E6622444FB92A2080B71C44395
          704B2A9C391F3DFF96BA8609B7CDB8EC8203C7FB9AFFA91501A068C7CDB6FEE3
          777F997F7BC597CDFC61944BD5A4E375B09C3FF2290AD62645788BA2A904594D
          6055E7107E7C681706038AE00E45642F47F49FA27F4905664C9C06AB3484EE6C
          0AF9C11124D369748FF615A6117D1FAEE3F03B5D20C6C09A8BAA3EC70F020605
          ACF0DFA7F7D8BFC9AC20881E79D541831DE0423D8E0953EA31BBA40CA55E9E9C
          7D04A31107B26240EBB3519189224A4C20468FFD070F60D5B60D6877B3707412
          262E100D2710152248A7F2987BC1D9BDAD679EFA6D75EAB47BA64E9D1A1CEF6B
          7FD48A0050B40FDD023BD047060E5DD273E3CF6F37DF79A914E100BE1FA7E8AA
          C391D814A04FCC3D075736915644F87A028F6CECC4F2C1510C5174F57C0FBE37
          822ABA7BE74C9888CAFA7A0C910418762CF8960DDF71319C4EA2A7AF17997406
          C1D81C20737243D0C8D1095EC8A13D89C10DC09306586A30CB365465B8718D57
          1D26B21EAA54039F99340127559622961D866C6760130B108C1084200C8D2447
          34AA213665027A3316D66ED889CE81218CE80284440C52CA438D568A0C6B5832
          B101B5F3E7FFF3A4D696DB4EBDEAF291E3FD3B302B0240D13E742300900EBEB3
          FADABE1FFEF8D7DAD05EB80648C397505466001040A3F0A9F9263CC5415E5731
          4094FF57EB7661534E443F31002F2076A0E4313114C682292D10E351F45A798C
          DA26BFA1557266DB2510182136904C62747414B6EDB02343458CA8BF4E913F4D
          F2C0A287C71B8D7063B3051E49069220424847480E411CCDA159B071F2F82A2C
          AE2A43BD2C1183F06133878E941270D950087874FA5CEDA469F06325787DDDDB
          D873A40B6943412E1A4666D446257DBFA8568283BE83E65317FEB675FE9CAF9D
          F1F94FA58FF76F510480A21D17DBF2C39F3D3378CF7DE78F9FA852E44E51002E
          45E0AA44DB59262039AAC7C6CC3CA2D311EC184AE1E61DDBD0A3946020C7D8B3
          0D51B7D05A5583590D5361AB0AFACD1CD244F53D727C55920AB3FF14F16DDBC6
          F0F0307F6432E4F47E98137D1F39920039DAC681C809800045D1109063BB2409
          0245A1F7497E1098209F428D22A0C5D0313791405B8224014149346C20E35AD0
          E8B325960F3167A264422DB4DA32A4C8D1DFDCBB0BDB7A7A41F0C00A131022C6
          A0FB3A86C222E2531B772D38EBCC07CA6B6B1F9A77FEB95DC7EB77280240D13E
          74330F77CEDFFCED9FAEA9D8B153CE1803C8C91664314ED45D25C7157979AFEA
          B2061E2252A28167F7ECC39D83079065F4DF5321107D87E162F1F436D486AB90
          23C018B24C1C1D6617C6927F18E5972489FF9D4AA7D0DBDB8BD15492A2B7C90A
          FA01FC67D5BC0244EE1624084496434C9F773C3A170F09020656663C331EC7A9
          53A6A12AA62042915FB7D938438E40C486415244A2D791498D484C6CC4CEB7B7
          61EDAE7D3814D691A643C6F20A1402128F50274D0FBD69FC73675C79F9CFCFFF
          FC675F3E1EBF4511008AF6A1DBC1D52BEEDFFF0F377FBADACBC212FA910F7944
          CB23082C72EE40213900682E399DA0E28023E0DE4D1BF1AC9C81E387A0BB0A24
          370B37E4E3E499B35119AAC2488EA2BFEDD2E744BE7F563C542804281C2F60E5
          C4A4DB191B48E5073092EC453695876B1F1D8B13C79EC7800385D4019646C43A
          1189BEC4730B4B0C0D06014D25BD3FB1A414AD8DE53839518BF2BC83113F0547
          F350461446257CD158839252A2FD274DC3C0C028DED9B005BB7369E419C5C959
          28D363B068BFA3D1084A67B438332E3DF7073367CCB8B1A96DE6879A4A5C0480
          A27DA876705F47F991658F6DC1B255B59E9446899F44364294DB266DEDB24EBD
          1A5C56FC4300101000AC49A671D7CE2DD8582A13F3D71026D6AEFB79289561CC
          2106A01173184EA5610502EF1ACC07FBC6961062D1FFA8F3FBBE5F9805905C58
          5606FDBD7D18191A419EF47B2014561C62CEE033CF0FD8310AA9C3D61890C8B2
          8CC6F10D44E67D388303F052199484359C5A5D8D53CA2B501156E112AB08320E
          CA61202B7AD0E9F846DA44EDA973E11A0AD6AD7A1BAB0F1F802505C41664B05A
          46498CC29743E8AF2DC5DCD396DC563BA5E91FCEF9F4D51FDAD84011008A764C
          CD0CFC2A5D10FB0A7F3B899E55EF9C72E0A1FB96C5F71F44CE1D4589445159B1
          D928204577032A39B947B7A542B43E4911FD899E6E3CD5BD1F9DA52A01800A23
          6523414E583D793CEA264D82458090A188CA3EC3E6FB590C17483AB0BF24A910
          D98F02007BA86C808FB6CB6532181D1DC6E0F000B266AE001A4121E2335359BE
          00018647E711901490350DAD336622515A8A9E039D38D4DE4960E2A39424405B
          3484D31A1BD11C2B412CE7D2711C2872004D26DE609A304C1F89C94D90A636A1
          7DE31E6CD9B71DBBED24103210636B1E90F4C94512E8CB65317DE1BC17A72C9A
          FB0FF33E71D1E6787985A149F2315DB0A40800453BA6E6058122098263FAACA4
          07A57DCFACF8F6FAEF7CE7AFAB74111199E5E4BBC8509C35541D41D64389A993
          9E96E0490ABAC8896E69270D3D32485459A3BB55839ECCA3866EDBA9ADADD01A
          EA303098A4ED599E3F737A873B377C85CFEDBBAE0D91A5F18E8D033000608B83
          31C765EF5996C56709464646904AA6E0B2E9BDB1326289F6C300402000508822
          287A08535ADB505A5185743A83EDDBB7C3537CC47503A9DE23181752B1A4A20C
          679757A3566312C28643EC45360C08F4DD5861514C89A2A66E022C5DC0CB6B57
          63676E08838247E24743DC2B07140DA3045062F304CC3D73E9B3A79CBEF4DA71
          D3A71FD3C54A8A0050B40FC5D2BEA389817BD6DE7FBAF17EF38D95A58A6B12FD
          255D4E4EE4C83E7760813479694E834D008048146B46FAF1E39D9BD04DB7A913
          0A410945218D2631251A45EB496D4892B38C26C9D19CC26D2C8A6E81CB130014
          B8C01F070383E06855A0CB47FEDFFB9EE3381C0406070791CD66B957F89E0F65
          ECDC15DA5615152448F73736342149922367D9A86F69459EE4C4D61DEBE05A69
          44F21E4E4A94E08CC671981D8D23316222900498511DACC6D8C8D371AD3CCA27
          4C4669E314ACDBBE156B3B766058B411A8242192266F69A6454A31120BA1E98C
          C5EB977EE2F2AFB6CE5D70CC3A0F1501A0681F8AF5FB295D3E78F89A7DDFFCCE
          2D5A4FA7C44AF2D8609FA7885CF3B3F978D662339E91E97508D958148FECDA8E
          877A0E619415F02806028574B39DC582C6F19838A91183BE87D1B40F8B28368B
          F482C832FE7CF27BE6BA7F4CB63BEAE8CCE999F3FB4181191CFD37F6601A3F97
          CBE1C081039C15F06104EE1E0144DE2E5CE01D8A43B24AAF655454D5A0A56D1E
          F230F1CEAEB7D19FEA8367BA08D1BFD511749CDD30190B23E568A47396092434
          4D40CA198544AC2634ACA0A2A105F1894D3832DC8335EB5663AF730462490CE9
          640EE5728237253D98CF61F225E7391F39FB9C6F4C9F3BE76EB1BCEA031F202C
          0240D13E140BECACB2F7D9A71F1EF9D92D97C7AC246C8A8CB6AA8D0DDCB18C3C
          D2CDA4B543248DED50290E2812EE5CBB166BB216FD738C8FF0E72507BAECE0CC
          59ADA82C2B436F3E8F64461C9300180300EF3F00C0BF33C129B000FC111898F3
          B3F102364BC0E87D7FFF2081401A365B7C902381CD9B93A842E1A36C4E20112F
          C549135B0143C49AEDEB90CC652090AC1019DDCF07884B3A669496E0B2F21A2C
          9215FA6C1679CD44462BCC78E83D3E62E11254CD9AC625C9333B5EC586839DBC
          6169902129142A27700C63D8F1A0D6D762D639677EFFA3577CFC07DAB8BA2064
          44AC0FEA77290240D13E14CB6F5817EF7CF185BD99177F5F193753C893D3995A
          18814FCEC706E8C879595F3E65D443B6B4122B4706F0C8961DE8F6C388F9718C
          22878C11A0A22282939B1B11510D1C1E4923EBE87413ABE4A7242344EBBF0D00
          4773055C97151911C0682162021606864730426090CB64E1BB6936FC00491711
          9034A0A00FD59350138E438FC7D1D5DB4F3AC2279050E069324F0E52A32188D9
          0CE669115C5C5587A925118474568198862FC9D0240D25232E112101FAAC4948
          549661EBCE6D58B5611DFC6818699339A70E5DD1E04722488743685BBA74C399
          975FFEF5FA9933DE9125D9F9207E97220014ED985A3A0866470561E3867BEE6A
          3457BDB1DFDDB3065562809C2853448C427489D6FBACFD36E96336969F093052
          5183FB77EEC4AAAE3EE4C512DEE9775048231F93D034B116CD556590C8878F0C
          A588194408380C5E1FC09C3BE00020F1C8CD070451680CC2E93F4F1162FAFF68
          0250E1F6E7B5026CA49F588063337010F99A84A3D93C8EF4F6223B721881419F
          5503CE34022B806409608403E4C81E4914C3D7F898810597984A166A84808D2D
          669AC9611281405BA804B34B63684948300C0512B117967DC8D63DD2650DE144
          399A2A6B3164E6F0E6DE9DD83B3842D74844969845D888D171C218710234CC9F
          D3D37CFAFCEFCE3BEF8C871AEAA765DEEFEF530480A27D28B6EDA1DF7C73DFAD
          B7FFB4514A930791A311457649D7CB8CE27A267CC322E7CB93A39561B751815F
          BFB109FB46E97D360ACFE402D170D5D03077FE7C18A110B2290204D2ECDCA905
          85B5F62037970A7774C0527858D51E93052E32D924A7F90ABDE1BA6CF110197F
          4CF711F9F9087CF8DF831F38FC5926ED6E5B1E2CCB41DF400F72D91C5F20848D
          1D58965DA8395074620D3E1F442CA889823BB1A2223E163136A3C0A6140DDA7F
          8DA1E2AC099538A57C1CC6B1D461DF86C3D62F34240E50A5B90055139A11AE9C
          8CF66DBBB162CF3AF48BA390D41002879840A0C28CE84897C8B8E4BAEB57354E
          9E7E59DBE225EFABA8A80800453BA666072CF50DF2EE5B7FB173F4A9C727695E
          1F342144915285470EA9382E31001381C61A7366E0872BF1529F8D87B775A23F
          608EEA106D76E050342FAFA8C0ECB97379B44E8D8C1260141CD2F5450E00AC75
          D8D8B81D4FCBE50D41459F9CD385CB9616533508AC1B90CB00A2C00804EEA505
          4F654C21606D895967215182693AD0341D6CFED2344D741FEEC6283BAEE37080
          10E9782E9D3F930FEF35616C0EE2A877B1750ED82062849CBC4E11D056412030
          7922AA650125B93CCA0990584F43D1B708F008964AC6A1B1751EFA0EF7E1C5F5
          AFE29097418AD84879A894902404CF3070246762FA92C55B3FF9D52FFFEFEAE9
          D39F1765F97F54625C0480A21D53B37DAF6A64F7D6F376DF78EBAFA31D3B344B
          1B81EA8628A22BA48549BD13E5563D8B00C083E9121094D4E2BEADDD78EED008
          86C83115C9260CC8C327279938791226354F81C506EBD8483D6B1C4ADEC906EB
          5C813511391AD10B4EE891E3B3B10145910BEE2E16FECDA5CF09EF360B3D3A43
          F0C71981A372814577B699E73B3C87A0BCBC9C5716B21C80A3DB699AC68B8C58
          B2D1513BEA54ACAEA1B07FA1B0B4B9C49A9008A8A2C794B08E25E3EB71523C86
          6ADA4EA2EF23AB3964120466A301AAED728C3BE514E44BC378EAB187D0276691
          967CF88316426A0C72B40C430444E316CCC9CE3AF5D4EF9E71C5E5BF954BA2FF
          EDF663450028DA31B7B577DDFEB7CE234FDF1449F7C02923CA9C2392AC68DC39
          0C7266D571791F004B16918E94E1EE0DED583590C1306BDE11E421FB2EF44814
          D3DBDA505159C90B7A2C8A9C7CA95072AABC69F12942FF3D949E0D049A791BD1
          688C3B27A3ED2A1B61678C421CA3E8BC699857787ED7F1592990C41D5E2686C2
          DE629FAFABABC3E9A79F8EAD5BB7E295575EE1FFDEDBDBC36581E7B1EC3FDE8F
          9C7F5FE1DFFDC5A727C65EA9FC21D1B1F5C0C4949086534A135850518DCA2850
          951B811521B623AA28491AB0F3A4F9172C01EA1378E3AD57F1CE8EEDB0A20642
          BE01294DE728EB403C0AAB24965FFCB10B7F6A9427FE75C6D51FAF2B9394CEFF
          DBDFA60800453BA6D6FBDCD3DAE8CE3D03C9C7964543521E3983742FD1708FAD
          F843CE17368901D801310211F9B0811D391BF793FEDD4CEF9BB20AC5CAC320E7
          2CABAEC1F4196D505415C3A32370C9A1D9E83D6BD899B34C728642F760DEFCCF
          A7884F7AD9F3C895C9994451411B81076303BBF76C23A7CD7159C0A6DF583D3F
          7BE6038563DD437DAF9059C8C60D2C8B150D390887C358B26409366EDC88582C
          86B2B232AC7CED35F4F7F7F14A439F571716BA1017D8C4D12B50009542410193
          201A88EC200C9668944798A44A43690CE7348E474385860A3A5E2DE97DCFA46B
          42A763916C19575A8D8AC94D38981AC29AB7D7E2505F1F3CD6D84432782E851F
          8B625895D0BC70EE13A79D7DCE53B32EBDFC91FFDBDFA70800453BA676E4B595
          5776DC7AF72391839DF003D2F8BA00531379371E81F476946E74D5126091E3A5
          295ABF70E020961DE8C4414D8245CEABE6C8F9E8366D983411CDD3A6226F5B18
          211A0E4ECF033E06E090F3B1A63E3E8FB432CF0464153E3E5B5DC893F09133CF
          C1273F79357DC4C5BE7DBBF1DC73CF62CBD6F5D00DA9000072A15250530D38AC
          2CC10142A1300183807C3E0B93F4F6CC9933316EDC38BC464ECF98C269A79D86
          43870E63707808EDED7B70F870379F7560C750559694445CC3669D8B82423D01
          B11289648F420060302140FBCE0904448A45C7F55143C076BA1AC1BCAA4AB444
          CAA167F2180ED910D400D1AC889813465D6B2B457B9DD8C06BD8D2B51F52791C
          7DE911F89A424C27815CCA426C5C13665CFCB1BB5BE7CDFE9B69A72C49FE7FFD
          3E450028DA31B5BD77DDF3E8BE5B7F7145454246D86211CDE0A9AF86E4C1206D
          9F674533960ED18DA13BACE2EE8E6DD8DC3580614345DAB3383B2823AADB30BD
          054D4D4D18658D3DB24767BF1888483C8B907505E6243C90F9401F8801388E07
          5D37F0577FF5752C987F3239B9CB194347473BEEBBEFB7D8B16B2B6271053973
          881C88516E56D7CF3EABD17E04621B029F1560B30113274EE4519DF5176C993E
          9DB3809D3B76A269E204741F3E88975F5E811CB1979191340715367819A03006
          51B002AB6022244C40C0DA92E5E98C4D8318872E41C99B14F98169D108CEA918
          8705F14AB8098AF2240BD8FEC214EA235901D5AD33E14E6BC49B2B5FC1563AFF
          DE900397AEA14E8709AB15103D1523AE85B64B2F5D79D567AFBDD0689BF65F16
          131501A068C7CC46DEDC3465C7A30FAF1736BD1155358A7679363017E2E9BF82
          641215CEC154E9C6350D884E0C5B05173FDFB7051DC339588AC28B79D8E879A9
          1EC5B459B3505151C129B7E31C6DFD11F048FF2E0070F12D71FDCF4080397136
          9BC385175C8C334EFF08D6AE5D87A953DBD03A7D0639EC8B78F8917B21ABE440
          7E9AE710B0C86FE6986C8840D7C2703D9670E79114D00848746203799C7BEEB9
          282D2D2516F11C52A9149A9BA7A0BEBE0EAB5E5B85BEDE7E1CE9E9A1F32E7C8E
          7D9E4903365E70D4D8BC86C1562682C821C2A4D375890D286C3154365B40AF5B
          D510968612583AAE119571D600350BC9CB232610B8E54594D74D4464DA7474A7
          46F0F88A3F108866903529D813B0484A84AEAD0E3954868A96B66D177CE9FAAF
          4F5CB264E59FFB8D8A0050B46366AFFCF0178BCC5757BE19CD779293A6E8FE0C
          C3F0E25049AB6791822230064032201F426087F1DC503F6EE9EBC48019F029B6
          289B5E23BA5D3B6E3CA64C6DE1037E2323437CCDBF821584B64F00E0896E4181
          07528101B07503440999741EF178025595D544D5F763CAA459F8D6DFFE130E1D
          6EC7CDB7FC10B63B4A8F349F32F43C765CA2FE4CA17B8559019B24874AF4DC30
          0CA4D36972F67AB4B4B49094D8876C2E8DC609E48CE1385E7FFD753436D5C308
          2958BD7A350E1E3C586002ACCE21F00B6302DCDBC8D9D9E0260A29C52E1B7DE0
          09413E7C761C29C4564C41A5EFE0A3E10A2CADAB414D75088E9626E964C1B044
          24FA0594E9B5289B371FBD928F3757BF4CE7B30D4E4240529150ADD5404E922C
          0AC5604EA8B3CFFFC2177E397DD69CBF8B354D70FFF4372A0240D18E99753CF6
          E4EB9D3FBDED949258966EF21C528E8F88574274D7811372C941F37C3DBF1031
          80A4A9E1B7FBDBF13B8AC6794724EAEBA08CBC902D113EB9B50D13EA1B91A488
          6B9A393E761F8C35EAE0B3F73CFADB8565C43CB62CA8CC9DD7F745A2EF3E348A
          E66CF350C8C0F8BA567CE54B7F83EE23FBF0EB3B7F0ED31AA5FD0E11956F2236
          A0A2635F17C24609AC3C9B2D10F8083F1B6C3CDA4F8059341AE5EFB5B64DE3C9
          403D47FAB173D72E4C9AD488AAAA041FF55FB3FA4D0C0CF6A2AFFF0881885968
          3BAEE9E0F9BB36ED9B98012B6066D9876CD2C22247961D0DD53E39AD14206998
          28B1F2981B0AE1CCB20ACC2479142E23E024C0541D920C3E01A4A9A379C21CD8
          D5112CDBF51A76F7EE2796E212D0961080E890463D825919A9C65A4C3D7BE9AF
          3EFEC92BBE9F983AE5C87B7FA3220014ED98983970A86CFD3FFC4B9FB06DAF64
          181E6CD18267FA14214B20E42C98E4FC8AE820CF3AF750F46FA7C8F6EB3DBBF0
          8ECA9A701215364D84487F6B8908A6B7CD224AAE234DDADFA368CA3AEFB07AFF
          C2943FCBBB7320691445493238A4D7A314F9B2AC8808AC724FE7B9FD975D7A19
          66CC988EB24403AA2AEAB175FB5ADCFEEB9FD176698AEE617CF18B5F21C72EC1
          D34F3F835DA4ED794B115E35C8560F2A0C12B25901FEDDE8DC980C282D2D4124
          12C2DE7D7BA1282A6719E309A89864300C1D969DC5B2E54FE0C0C1FD3C0B1192
          8C1C5B3080353C65094724131485D51E1348B93EB10089F73C7025D699C881CA
          06493D1F650436D5110D332755637E49199A875CC4E97AFA042A664E843EA10E
          55735BD0D57D04DBD66EC391E10C8E10282AA138A2BEC12727465C13A75E77C5
          BEE6D6696DD32FB9ECDD62A2220014ED98D88EB75EF9DEC1AF7DF3DBE5AC86DF
          25AD2B0688D27D9F254795C8791D3F4F74374096E7E1976245FF08EE245ADD1B
          0EF1C12E85F4B343ACA176423DA64F69E16BEE9944C759CE3F1BF5F7C71800C5
          4DB62E30145DE423F0CCAF548934BB56428E18426FCF302ACB6B71D1C517E1AC
          B34E27761DE04067375E7AF90F7867DD1A3E3A7FEA92B3F0F1CBAFA6686E908E
          3F8295AFBE80D56FBC428E9FE1054A8E5BC811E025C7637D040ACF2CD89313AB
          0126363561CEEC25E8EE1AC1E6CD5BE138792C58381B3B766EE52C60EF9E3D04
          362602BF901C242A6CBF260181F36ECD026B3EC2F226B5B1F54CF31189E71105
          8EC7EB0A9A880D5C32BE09E79456226E0E20AFB8C80702AA8931C58911542D9A
          0FAFB606BF7BF0491C1ECDC3A46B6F066CC973DA099BCD284FE08C1B3EFBD8B9
          D77FF5CAA3BF5311008AF6819BE7DBF1EDCB9E787DE4A73F9F11228A2CBB44C5
          E94E567CD6FCC3E349336CD04B56899E524074C4186EDBB2012F644C92046184
          583F40961EAC07983D6B0E6ACBAB9164ABFE903666D1DFE3B9F6636BFF0A6389
          B7B2C4EB063495226FDEC282B90B70E619E7E1AD3737E2A515AF1135AFC6673E
          7B35EA6A9A70EB2DB761D79E7588C614244AABF0F5AF7D1BB55513091C1CE821
          D2FDCE08B66D5D8767FEB00C5D9D0739D8143A0B8905A73F3ACFCF171B214072
          F37CFFF3E62EC6FEF62338D47598F61DC6E2C50B0864DE424F6F37D2245FFA7A
          0790CB90FCF10A454BBE6FF1C4A442FEC05863425676EC8B7CB0D00CD1BFB0F1
          4E62072C93B084FE5C1AAFC0A767B4A2CA1A86A4FAC8C70D28436984691B85D8
          4F251D539A3C0D3B576DC1FA97DE44BA268A2E238512424649AF402A1E1BFDD2
          DFFDFDDFCC38FFC27B80220014ED18986F67DB76DFF7C00BD9871FAE0D2C970F
          DED962C097EA92C9F95DBAE9431E9B62139015541C22A7B875C726ACF3249E28
          635054F549D31BF13016CE5F88906A60707818B6E7F001401EFDC5020080F7EB
          A5DB5852C87159A42420206738FB23A7E393577D06073B7BF1B39B6F47DEB431
          63662BAEFDFC17F1BB471FC1DBEB5EA2ED53B8F0828FE1C28F5E0DDB14B172D5
          4A4C68AAC5942975A4FDF358FED41378E9851779D51ECBF7673301BCAD58F0C7
          34624128F41E64038435D5F52827B0625260EFDEBD9834B911EBD7AFE3919ED5
          18B081C554D2446F5F2F72F90C7D1736265758FFE068FE20FB3F9B246440E085
          3CB08908991888C2D38903340B322EABA9C559136BE05B19240D116536CB5E74
          38700E6B121275D3D0347916DE7C671356746CC1A892253144EC8898164BAF6E
          39E3CCE4B76FFD6509500480A21D031BDEB9F5E29D37DDBC4C59FF0E42B11872
          E4409626F2B0C9DA7DDB828588AC223F4A943E548A17F6B4E391A16E1C22B620
          9123EAACB73EF1E0F2BA6AB44C9B4E92D9C7C0E07061D11049781700021E8955
          301511B006A0E4FC8E590081898D8DF8E637FE161639D04F7E7A0B76EFDE8B2B
          AEF8042EBBE462ECD8B1193FFCD13F1220B4E08B377C0DB1482D06FA46F18B5B
          7E420E2DE1DCF3CE416D6D399EFDC3E3D8BD733369796FAC6948A1B7E01F3B0C
          89182B1BE0E3026CE682A50FD7D78DC7E42993F90CC21B6FBC514810F25C3E93
          601120B2A62343434348A6460A32A0D0801CE0AD4D8901B094619940C7B0E1E6
          0394B86CDD4209293A7C8280E4D258029F9ED582209F845362C048E6A0853564
          92E4DE55A550067D94C5EB30EE331FC79ACDEBF1BBDFDE0BBF3C8C7C8ACEB782
          588011C6B2B7DE1A9B93285AD13E60DB71E71D2B0EFCEA371F99C017F0309054
          44E455898FC41B360300BA61650D6E3A40468AE2DEED9BB18A22618A84B19667
          EB023A7443CB686A9D4A11B512799206A3A92CF9B7C8D3EA3D5EDF5FE8D6CBE6
          FAD96B369526110B60BDFE198116021D5FFFAB6F62DAB419D8B66D174FDA39E7
          9C7351559DC0868D6B70F32F6EC219672EC555577E8622B3C183F0E0D0613C78
          FFEFB073E71E72E21AF4F6EC832239302DEFDDE8CF1EAC3620447A9C270611A0
          B1D7BAAE2197A348ABA97C649FA52C3BB643CCC3443412433E6F4292459E37C0
          98C0D6ADDB3808643229A43349C88AC8138704D6D88475382212606916EF2E54
          C96736240C1288460900AEAEACC32726D5437232C8E84019018419D8D0351949
          354078D881941611993F176A433D7E79E71D38904B9264886154925136BD158F
          AE58510480A21D1B5B73C35786C54DEB4A43568A97FC6655850040E6C5B7BA45
          0EE4A778134CC98B60CFB08D3BF7EDC08E88CE07DB348B8D7EBB882622689B37
          9B1C504572380593E96049E0037DBCC058383A0BC032000BFFF96C3E8D2DE241
          AC20F04398396336AEBCE293A8ADA9879567A9BE1A1F30BCFFC1BBF1CA2B2F90
          932A38E3F4B3D03CA50D25B152344EA827EDBF07F7FEF63E98B914ED3E470760
          AD79E4F7140B157A0BB2078BE42C6598C90359960A8D46DE2D410E786D010328
          814F4B8ABC18E9924B2EE1EF75767662D7AE5D387CF8100606FA793FC2509458
          51264B0C889EDD1C5CDD81478098E00040324325BA4F00F0A9710DB8A8B1962F
          90928E8888991E17112AC92A36C8AA7A3EB40C1B6C0DA12BA2E1E14D6B91711C
          D804BA524525E69E7DF68BDFBBFD57E7F2EF72BC6F96A2FDBF65071F7EEAA27D
          77DFBB4C4B7509A2976633DD083403B6A2F2DA7B99E8BCE2A7E1840CB87E04AF
          EDEBC1BDBD5D38445241628938B90C989B8EABAF41732BD15CBAA9D3A359D657
          80CFF33BAECD7A768FADE45128EA65A30A1E1B54632F7C15A2CF96186311398F
          85F317E1FC8F5E80C6864664D3396CDAB219BF7DE05EB4CD988EBABA7178FDB5
          D7290AE7519EA8C465175F8E3973E6E091471FC4DAB757932F9B7CEFEF1DF967
          C658C05139C0928D0A9583021F0CF47C8B5880C85901737A81F509625989BE48
          C71B4F20D3C8590D1B54DCDFD9819E9E6E344D6CC4A68D5BF1F63B6FC0731DC4
          F528D266127E88BE9319F0E2217E34FA7ECD741D3F3D650A4EAE8A12DB492155
          AA209AA3EBE6123BB064586CF4902806CB87C806125E1DEEC1CBDD5D74EE3254
          DD80565583CF7EE39B5FBDEA861B7EC976590480A27DA0B6E10737DFDBFFE493
          9F2B55D290A30E1C2BE06DBE034903CF7DA3E8A4B29579350D493B8447B675E0
          69338BE1480412E9E3C0CCC0D07DCC9CD28C9A71F5C89A1645C57C21CD97A8B5
          45BA5A900B2B003109E007121F13607901BCFEDE97C622AFC8671B5887DF6953
          A76262D3440C0D0EA3839CCE221672F65917E0E28B3F8A3BEEFA0576EEDA417E
          AE6146CBC9B8EEBACFE1F5375EC6230FDF079DF5E80778E5A03056D6CB6A094C
          93A40D9B805458D3108B9C59260010F974A0489281E525785EA1BA30E085492C
          1F41C3B8DA065E70142F8973EADFD8D480783C4C1223C79B8FFCE10FCBD1D9D1
          013BC712A788E9E81E5FC230700228043471FA8EA7252A70C5A4A918AF64E918
          A330631A544781E0A9889832BF166C86C52640EAA2EBF3D4810E6C2779809489
          CA9232C4264C18FDE71FFE706EDB69A777B0DFAB080045FBC06CF3E34F5566D7
          6CD837BCF2A5588DEC20AD0FF388CC72EB992308BC0D076B9E9985EC49E8B654
          DCB67D3FDE264A6C123D964C1BAE602256A5E114BAC959E38B212B0F9B74B440
          5280397C010024EE8C6C10D06374DB5328E8B18E7C63EB7A8D35FDCC9B3984C3
          065FFD97F5D6634EABAA02454E1D27CFBB189FFDDC27F1E893B761D5AA97C9D1
          22983FE71C5C75D5C7B079D35B78EAC98769BF36DE1D9CE33506144515B6E888
          C7F3FD6B89A5D4D735204B00D575E800B2F9610281420B32DE6B4854F84AC481
          C71A971AC8E71C545656F0D4E0EAEA4A9426E2A8A828C3638F3D828F9CFB110C
          F7A5B07DCB56741DDE83546E980F043260F329BA4B74FCF2C021E79F844B6B27
          91C6EF821EB6B93C716592218201892810CBB9504D1F2EE1EDF6912C9E3EDC8F
          9D0905E19E61DADEC0955FFEF28EAFFDEBF75A8FFE66450028DA076299C0491C
          B8EDBEABD7DCF6EB5B66D4C6E1A5FAF8AA3FA2C0B2DE355EB4C3FBF450345504
          1B3651E2CD2326EE6DEFC63E31C49B79488E89BC92434D6339163734C37764F4
          E7F37C049DADA5C700C0262DCBA615791210630182C73B0BB38770140098D38A
          0E457A934769C761F9FC32CFEAB31DDA9FA36166CB59B8FEFA2F2295EDC5134F
          3C4EAA2284D34E3D1B2D2D4D78EAF70FE0E5154FD3B93B7CE08EF50995C40295
          B76D8FF7145CB060014E39ED34343636219D4963F9F227F1FAEA97E8781E2251
          850FECB11C5F91672386F8F9796C3A8FA5179364A828AFE28388539B5B303030
          80499327E1D0C15EF4F61EC181EE9D3878782F6C0220DDF16191F37B6C2D02CF
          C297674EC5F9F132E447FB609446081C023ECEC26641240226D9A5EF6991FC31
          243CDFDE8135A3191CD62554E67CE4440FD77EE3EB9FFAEAF7BEFBD0D1DFAD08
          0045FB402C1DD8B3467EF4CBE59BEF7DA03E56A1C2250DAB84C25CC3732DCCF5
          73A1F10679344CD2A3BFDBB907CB06924849A588051A64E431AC6730696A0366
          9733CDEEA39F2DFEC733FEC63AF81EBD63C792710A1D7E0B0540C17B9A71F14E
          3FACEB0F9F5E2F2C16CA670F259B004042586FC0D5577D01F3E7CF47929C844D
          FFB1429E91D11EDC7BDF6DD8BB77337DC6E4837B165B925C6000A2713A7FCAA9
          67E0DC73CF4722514EF4DD24FA9EC1BDBFBD133B766EE48B8EB06422CBCEF005
          4444D6D3403178A5A14D8CA4301B4A0EED0A08874A3177CE42848C086F37B673
          473B0E1FE942E5B80856BEF11CBA0F1D44197D8124E9795792314517F0D73327
          630E5D1351D6E1AA71BA66044A74DD02C9A4AB40E0EAB216E971F4D0711EDCBE
          090778BF04096ADAC5B4258B3163EE9CD8377FFCFD77171F2D0240D13E104B1F
          D9F3FD0D5FFDE76F29073A654B0FF840148BEA229B2B17C5B1D4B93187243ABF
          9FA8FD433B77E1CDAC074B88A18428BC420E978AE431BDB5192DD13A0C0E6631
          C2A6F8B8238BFFEE78471B7E0B4793681845C77BD0E13D4FEFFD8424DB7C6C20
          9B52D03C6936CE3BF7624C99DC8C583C4AEC208315AF3C8BE79E7F12AE9725B4
          70F93C3F2B4E620030755A2BE62F381533DAE6F2A21BC6462A2A13E8ECDC835F
          DD710BB1831C6F181A0A4BBC8E806516BA8ECF233EAB0D107C87DCD5E21D875C
          DAA7AAB096E63A1AC63772F662D93E66CC6CC391FE7D78E891DFD039A6109304
          A4BD42EBD2D3AB4BF1A5E94DA81DEA851C2E453E88410B0C785296945692F640
          FBB715386214FB4C170FB66F47AF4240C352ABA5102EBEE686DD177DECD29326
          2F9E5BAC0528DA0767BE9B94DA9F79FEE98E9B6E392F26BB48E62D44F51832F9
          0C9F1F7FEF083A33570F636557271EDFDF894ED6D6CA0B2342514EA75826546B
          983E7D0A6A4893F7F525910DC97CA24F10A4FFE4C8FF4923DC31A9C1ED3FDCDD
          02777256FA2B22847C46242A3E0ECD5327A3AAAA029974061B36AE4526374234
          3E849111D2F4A4F955C3A0A87F1A162E5A8C9ADA09D8BDFB0056AF598FD3962E
          46D3C43A3CFFC2325EF4E3382E1FF5BFE8C2F331BEBE0E2B57BE866DDBB6A1A4
          2406D76589423654C9E279008C01B06A45D6B548918925C81A962E3D07357535
          F8B77FFB3606FA0EF29A095F250942CFA5A4EF3F376D322EAEAD803CD40F291C
          866D8510164AC09659F7F4610E860C0032AE8E4D049E4FF57660240424464984
          B12623E79EFFD80FEEBAF5CA7F7F458A56B4F769839D7BEADB1F7FA273F8F127
          244F622BFD4611574B3190EC85A6A9EF71FE42E24E929CF9B11D5BB17A34851E
          8DF4BF17E29D7F0CC945CDD47A34D4D7C018F1303A6A221F9179BD3FD3DF7FFE
          66FDE342A0EFF6DFC39F96BE8F49080E265C85F0F45F81AD384C1A99B5FEF249
          3FEB8646CE1FC6F9177C1403FD8378EBADB5686C1A8F4F7DFA530847E358BF61
          2BFEF0F44BA8AB6FC295577D8C4B8A3BEEBA15FBF7EF453663A1A5E5245CF7F9
          EB50535583AEAE6EBCF2CACB78FD8D57F9F46038C4B44C9A4F1D3246619A8C25
          58282B2BE76302272F5A8A975F7905AB57BF08379F824EAC276D0890550593E8
          9A7DFDA493308D5884605BBCEB99E486A17B2504125902D5E14207645B439A1E
          AFB61FC1F39923B0E31A4A075D04D5B5F8AB6FFFE3DF5FF1A52FDCF81FAF4AD1
          8AF63EACFD9917CE7EE79FBEFB62ADEEC3642BFD72DAEB7209CE2228CFE01304
          9EC7CF6EFEEE6C0E37B5B7A3376B63C45010B8718836E9D7908D996DD3501525
          F63098217D2DF27E77AEC846E1C5F77FA2002FBE918916B3D45DF68A65F8B124
          1C45D1E1D0F14481A4C1D429B8E1866B293ACBB8FFDEC751595381F3CF3F9F4D
          FAA3BDA3939C7415DA66CCC4C9A4A9F7B66FC37DF7DF8EE4E810E2B10A7CECD2
          CF60C1DC857CED01C6063C2F879DBBD7E1C5979EC7C103ED90F9B882C2CB8719
          00B032E3783CCE65015B3FA0BBA71BFDFD3D10AC2C62F47A20E223AA4A383592
          C0179B67223A3C044444E4D8B2E2AE01DD96611B3EF2BA4DD1DF43C851309017
          F1BB83ED78293788CA70044ACA45C3BC39FD373EF0C0F4C6C6C6C1F75E8F2200
          14ED7DDB9E071F7E75CFBFDC787AA24C46D260E9BE223CB130E856289D03AF79
          B72C0B21238495FB0FE0AEE1418A5474231B6C94BC1C8610A0B2368496A993E0
          B35578D22E0780426DBC5F68F5FD0158C06486E8BFDBAB2FE08D4559F34F766E
          71E4B22E1289525C7AE9A5284BD4E2B7F73ECAE7E9179D7C3216D2A3ACBC1269
          3A3F96EA2B9123AF78F969BCFCEA1F90CFA570DA6967E1131FFB2C14318C6D5B
          77C1A47DCE99D7865038C06BAFBF8A07EEBF0F115D79377390CD6EB0E5C8595F
          01DB32F9B5EAD8DF4E9FCBC02746A2D13966E232E2968BEBDB6662A91E4594DE
          B758E6325D0EDD5220E789EB8449DA843C9E48A5B80AB61E1EC42B238358E712
          88281A125A0CA75E7AF1C1EFDEFEAB097F7A3D8A0050B4F76DEFDCF4E31DCE3D
          8FB7045113231109514B82C3BBF4166E2F8FB5F066557BAECB07051FD9B5178F
          1218049E0A8BB5070FE2D0882E34355760525303F2A9149C1C51F43120613DFF
          C672E1DEB7056C71D0425F9EF7D4F5FB9C05E87A84ADD4474E9947381C426D4D
          03FAFB52C899ACAFA688E669D3B1F4F433316D7A0BF79CD1641A0F3FF25BECD9
          B7091A45E96BBFF0454C9ED886F4A843C0F108C982FDB8E4D2B3316FE174BCF0
          C2B37875C52A443436D868F23C0249668B85087CAAD177E90BD3336B35964B25
          A1F3CC420714D03123A4E386696D6093F7B26FC354449E15A9D375166D62563A
          606AC4A058AAB3A7E08D035D78B9A717667909B2748E95D53538FF8A2BBEF1CD
          EFFDE0E63FBD1E450028DAFBB69537DEB4C37EF2E91655CD2323BA301CA9D0AF
          1EE0997316454C5990F8CDE61018DCB7BB1DCB58E38E2044119E85F810E26111
          53DBEA281AC6914E6578775E8795B94A6CE29025E4C81FC8B906B07803D0C25A
          80854544581F01D66884A5EFB2222256E893C98CC262EB01844A78A4CFE758FB
          70A2DCC4603E71D55538E9A419F439057BF66EC7B3CF3F456095C537FEFA7F41
          53223CA7A0BDA30BAFBCBC02BBF76EC2B4D6093872F83086084C1A6B26A1B169
          028647FA71F0E07EBEEA50C0DA8305160E0F0FE070771741502161292FB9904C
          1717D68CC3D5E3EB50E16679D1135B3844A473969D804F0306C4904CD1811A29
          C108C9AFDFEFDE8E2D69622961BA96C430669EBA046DF3E6D5FEDDBF7EBFE74F
          AF4711008AF6BEED95DB6EF9F4EE179EBDBF94B46B8958A8FA638D6FA4A0B0FA
          1E5BC38F8F01B82E7F7EB4BD0B4FE448C3FA61783C02EBA828D7D132AB812FEF
          3538320A8FDEF35CB6F087CF6BDD03E1030200215F58229C0F2A16DA875BA6CB
          3307583A2F6F384CFA5A3702BEB8286B2ACA160754E408456499C0C0C0A73FFB
          59CC9A3D0BA9A4C36BFAEFFACDAD38D0B90F9FF9CCE730756A2B2F603242610C
          0D0DE08E3B6FC6BE8EEDC42862A8296FC097AEF91AEAEA6A91373358B76E2D9E
          7976397A7B7A10350C740DF56090AE21C12244C58393905196F4713D45FFD30C
          019A9F822DB174EA1031013A639255822740254660B1AC4572F8BD23C378BC73
          37D2D104F28339A8C4642EF9CAB56B2EBBFA93A74F9AD6FA1F96142F0240D1DE
          B7F51D6AD7F2C37D2F75DD7EE7A9F6C69DC8082E9F6AD3FC42930B5EED4E37AB
          C9C60042069EEF1EC463A316B49C3C26137454D51A987C52034C8A6047864728
          326ABCBDB74CF45F145CDEFAEB83B040608945CCCB559EA64C449A22B6CECB76
          1DA2E6BA1EA6E70C64CD84EDA6A06B1A393EA3EA11A2EE2A6A6B9B70DD0D5FE2
          6C61D9EF5FE68D3D04C9C18CB6A958BBF61D020C967D18E0B4D397E0F4D397E2
          E9679FC4AB2B5F2090F171C13997E163E77F9C970DB3EB128F47B16BF74E3CF9
          C413D8B97917BA46FAE05A69A8747CFA1F517809D3F3117C6DE61C4C36FB21C8
          69D8B20ADD0C73BDEFB202289BF6A36BB01C0BB612C61BFB3BF052BE0F23C444
          C22901899A2AFCE477F77D6BEAA2936FFACFAE4711008AF68158E0F4570EBEF8
          C6F89D877AEFD8F6C493B32A92592164D34DABAA9C36278793903415B62A6250
          D4B1BAE310F60D6570849C3C4937AE52568989AD93918893061F3C023B3D0A5D
          0D2147CEE70985145F0616BCF8D7619439E0B30C8657181F08D87A7EBC3A902D
          11161C5DF3F33F9A5058BEAB902F5098326495792C4F89815401B2482288ACA8
          274FC13F184B322A54F6098282C58B4F457575357EBFEC4958968685F4FAB24F
          9C85BBEFBD055B37EFE66CA179E229F8C2759F4257F76EFCEA8E9FD0590FE093
          1FFF6B2C59742E56AC7A05CF3EF71CBEF0F9CF63FE49B3F1CCEF97E357BF7A10
          E9FC30B1A44350633A6CDA6F9939884F34D4E3B4D2046A080F2D3A49C552C8F9
          65E47401B69E21969546A91D836B97612FBDB7FCD056ECA66B175663905C05F1
          AA9AE413CF2DAF0F378C4FFFA797E378DF3845FB7FCB02D7D6B73DF3F44D1B9F
          7CEAAFC23B37A0546179F1C3480B164ACACA20A44883EB95389873B0F6700FD6
          27D3D8EF929395D750E45430A1B602E3AAE30045E3E45092F6472C812DE92DF8
          BCA5185BF197D7E3070527977986A1C8D36BB9430B7FCC08F89FDFDC6EA1A048
          B0B81C088231A02019C2F086AD78CEBAFBE4CD2C9D4B19C64F68C135375C8595
          AF2D27DDFF1AB19610C6D7CEC1B5D77F06878FB4E3FE077F85A1D17D5838F702
          5CFF85FF85877FF728963DB31C179EF7515CFFD9CF61E7D66DF8876FFF90B72A
          D7B5410891103106054DE6283EDF3205F3C3114424D6C980648045D2858E9F65
          00606421F9A32873CB61DB15D8E4E7F1879EED182590B552365D0D03575D73ED
          F0DFDCF483B23FF74D8B0050B40FD432D96455303C94DAB862C5A2AEB56F2C4F
          BFB52ED2E099083407C9C022879510722BE1EA51F44A2236A79278BDEB208EB8
          CCC149DFD27BB553C6A3767C1DDDBEC4180632F0B20EB2A471991F8AA477596F
          409EEF1FF870A4C2401EAB051079F30D66634D36FFC7B7B7571827E00FB7002E
          4161D090393FEF482ECA3CCBD1B2C3A4F7AB71CD759FE5F2E281FBEFC791237D
          388FD1FD8F5D82DD7BB6E3D6DB7E82685C405BCB625C7AE167D07EA08322FE6D
          B8E6F39FC119A72CC10E02806FFECDFFC670B60BA23F088F989248CC689E2AE1
          7353A7A245A6EFE66589E24BD01D999754E75592009A45CC8B18008150D68AE3
          ADD121BCDCD78E41C5E36B0FC54A2AF1D18B2EBDF65B3FBDF1EE3FF74D8B0050
          B463666F2E7BA835BBA7E31703AB569E61EDDB83D2B2183224E5C3E4346C9430
          49D135A9CA38904E6317B181C3C92CFA030FA38682487D0D268C9B8009E132F8
          C91C5F13209BCFC3610B7528ACBF40A1543627CB3C4948F4454ED2596B6D91B5
          0BC3D1EAC37F9F86FCC77E7EC21F9B7B8EBD7E771B9E2D580001DEA60B8565C6
          1808B0B6638AA2F1453F4D36BD29C791C901175E7C09CE39E723E83AD8C57B10
          4C9D3605B1681CCB972FC3868DEB71E5951FC7B469ADB072124F924AA793A8AE
          4C405764BCB2E225FCCB77BF0747E8A5EB423B53153E1370D9B8265C585B8B3A
          DB8243EFDB745D74977D571FAEE4C297D9B2630E74318681AC8C5507BBB1DD1C
          C130EB2B2EE998397F112EBAF4B2E6CBAEF9FCDE3FF71B1501A068C7D446776D
          313CCBBCBAE3F5D5FFFCEA6FEEAB2F575484D9DA801459D948B8400E20A83A06
          46D33C3370D3C000B6D9265225512891286A42118C4F947367622DB89223C942
          EB4C51E6E5C06C5971562AC3418017FD8D1508F15983F7F6F00FDE6DE5C5FEFE
          73CE5F309F53FF425F81B13464A1305DC8E4802CA9BC17205B7A9C01115BB3A0
          B4BC1AE79C75214E5E745AA174584CA1A3BD0B0F3DF818162F3E05679F751152
          991EAC5AF916264E6CC4BCB9B371E8E0016CDEB4012FBCF0027FB6856EDEFD57
          A1EBA15B597CA56D1ED1FF10E2E9143C8AEA6644874A00C03A2BB34A45AE8124
          565EA4A02BE5E0E5DD9D182240ED23B050E3719C79E1C56F7DE92B5F3D65426B
          ABF7E77E9F220014ED43B1D50FDC377EB4EBC8370EBEB0EAAF956C1F14C9E685
          AC02D179D65E8B2D030829826E62DDCF777763AB998715268A4D377F221E4143
          D304949754C0770264D22C2282D8004542DBE5D1589655DA279B36049F5B7758
          EB3116A9C79A78B2813EF6CC5E1F5DE0A330DF9FE17ADE1D9BA264C6A4054B17
          66F9FB2C4DC1B10B8B00B0958398F3F7F70F22CC8B710268111F29B39FCF52E8
          4A2516CC39039327B7E048FF56ECD8DE81D4A885EBAFFB0A2635CDC26B6FFE1E
          8FFCEE77A84824F0F7DFFA168606FA71E34D37627FC77EDE83D097FA591B03C4
          C351544959DC30711EA6910C60D97FAE26201DD6A179321476CD90E30D445D59
          2739A061757B2736740FC3D4C348CA0E5C55C5CDBFB9FB5B675E74F14DFFD5EF
          520480A27D68B6EFA9E562F7FAEDBDBB963D5A113398E6CF43105D9E12CBE875
          E0AB14E9E2E81314ACEF1DC0E6DEC318F66D582CA9881C81AD123471D214DE27
          2F472090CD593C8F202EA8C8B936A90A11519FC0842224ABA063EDBA249974B3
          AE8E45EF42D4678B7DB2957E599D02EBE7CF96105794A3CD44C4B1453F7CBEBA
          8FA68D0DFCD19B8B162DC1F496566CD9B20D9B376F81A684319A3BCC4B710391
          B6B743045051E8AA0155B3C152F464A2E7D75DFB154C6D3E0977DCF3136CDAF1
          3624FAAEDFF9F677108BC5F1B39FFD14AB5E5B092F3BC2D742609314E59A8419
          11199F9E3C07D5AE8528911993A2BDA3B2AE3FBC7018AA972229009240610CD2
          F77B79CF6EECE927A0604942B110E4EA4AE7F7CF3C6324EA1BBCFFEA37290240
          D13E343BF0C28BC2EADF3ED1FB7FD8FB0E38CBEAF2ECE7F4736EBFD367B6F7C2
          D23B0B2B4D17954E08A020166C8862AF9F2406A3893126FAE5B324262A28D828
          52567A5B169605B6F7D9DDE9BDDC5E4EFFDEF77F66D01893D08D710EBFCBCCCE
          DCB9F79C73FFEFF33ECFFB7F0BF6EE69F1FC12A03964C0B648C2D1485B73E0AB
          4432408EA7314946D25DA962FB401F86C94BDBE4EDFCB4813019C3E2652B441D
          3D97D43A251F5AB1869242BF27234E789C3E2C0979A0A9AAE8CDCF8E5DD35591
          7FCF8D425932703110330F660E7C48620341E42EE285211D220599BCAC17C234
          2CBCF92D6FC181CE43983D7B0E7A7BFB70B0B31BC5DA28D4B80D8FAEC3F77558
          7A13788460405EDAAE118B70355C7ED9D538FDF4B3F0C8E30FE0D65F7E1FCDD9
          367CEAE39F41B6218BAF7EF5463CFCD0AF113A05D1D390EB125A497E9C337B16
          CE9BBB1C56854B932DD45C0249D9144DD5E8ECA18579A874FD552989FD8404F7
          1DDA8FC1820B99180217505DF5A98FDBD77FF106F3BFFB4C660060E678DD8E7B
          BE74E379830F3E7997329E273B2363537D84922776E33982AF87DC44D317E9C4
          AE45F45FB5303052C478B182FD8501F4D936C64873C79A33686F9D8359CDB3A0
          D754D4F265D4549E3F189021B962BAAEC6A3B7EBDCA1977B058644DFE358B972
          85E800BC6F6FA768DA295A8691B532138862047C969149B024E0001B67FA715B
          B3458B16E1C4134FC29D77DE85D3DF70868809A44812FCE2F69F910C5091CC12
          1B28E445E3D1585C17D382025F15AC66F9B25578C755EF84466CE2A73FFB3116
          CC5F89B3CF780BAA046C7F71C3A7B069D363F4B645D1F28C25C712623B972F5D
          89E3AD6648760E16BD9EE3717B1563AA1B7A0D815A84E12AC43852D850CDE3EE
          A14328BB04726520DE98C1FB3EFBC9EF5CF5894F5CFBDF7D2633003073BC2E87
          73687FECD11FDFF2C09E1FDEBA3AA5F3045C0EE445033E443F6F72B62A696A95
          4BE613126C2DEA260C37468457C5F6FA20F68D8D611FE9E1824C9E5BB2D0DED8
          8139CDED4864B3E4E95D38B52AAA757A887C7F5964F1393C1A888CBBBDBD0D8B
          172F115D7AB66DDB29743F37FC60C34F2613C2E0F9980602AE0DF05C57000457
          0A3200C4620932F01CCE3CF32C3CF1C49338F9A493B073D76E1C7EF4D1E8240F
          DCD894447FFF01ECDEBB730A58ACA84F2101DB09279C8C379E7D363299069831
          6209721C0FDE7F1FBEF3ADBFC3C4582F5C350FC9549120C6716CDCC2DB57AC42
          4795078438624742E306A341540320CB361CBD0CD5216FEFA671FFF810EE1EED
          8144EF27E73D2C58BA18279C75C6595FFCF63F3DF2DF7D2E33003073BC2EC7C0
          A60D4BB7FDE217FB06D7DD2B72FB7DDEAA139D7DA568FF3EE006178A08F28188
          ABAFF0382D321E2FEAC5E7A81EC6DC003B5C1B8F8F8F20471E91F3751AE2265A
          162FC2BC4C3B8C0A77232AA21AD48824FBE2B56B951A6677CCC569ABD7A0902F
          62E3C66789055471CA2927A36ED7F0DC739B04EDE6BE00D12E01696DD2DD0C04
          A2F77FC8A5C28E1800C22073C4E1471160A4313838887973E7D2CF53E8E91BC0
          DECE7D68694DE1A4938EC4C30F3F08DB710488B0D44824926230C9D225CB71C6
          E96F42F3ACD9E81B18C6CDFFF643746EDF4E74DE4711DC053814F4FFA279AD38
          A3A51DF11A81912030DC48955B7F6BD0554E8CAAC257EB90D524466D03BF22F0
          D95ECF43210050093497AD5A55BAFA031F3876ED556FEFFCEF3E97190098395E
          97E3BEAFFFF5BCEE271EEF46CF1E4EEF21E30E45E24F100980A9AD3C5524DDC8
          229D976082C788731311B274ABCE51EF18C6E3693CEF39787E6808E552153583
          E442530A59620A87372F80D692C238E9E6B25D14813F8D74B3530BB070DE5234
          37B662EF9EFD48A49258B16239196705B9FCA40842F6F7F789EEC1BCFDE7FB8E
          D831E05D84E8DC54F15A4CFB1B1B9A08402AA4E9CF44D7A18358B264199E7D7E
          0BFA07FB090C749CF186D5D8B0E149313B200C5D98561463E076614EDD472C91
          8196D490A7733CB06B1F8CBA0A23D4311E1444B7E465248BDEB36A1116A98A18
          09AE48AAA8828876243518A641F784BC3FDD97BA95C6E6BA8787087CCA041E79
          BA1F16DD9F3F7BC73B777DF66FBE7A8C2C2291FFF531030033C7EB723CF47FBF
          F1B90D3FF8D7AFB44A1518BE0DDFF511C82A7C91BD270BE3F2992E4B6AD4839F
          7EE69241D4A59AA8E08B91B15AF5046C358B42B20183953A264727B0BEDE4FA0
          A08AFE011D56235A16CE270D9CA4D7F048639356F6651427E93DD5182C938770
          78A205D7BCF973C993C74866D864AC5574777789619D3C99C7B434E1BDB95B8F
          1833204683710A304B8368E4D791471C859E9E6E9C72F26A6CDCF4AC88E82F25
          EA7DF0E07E211D2A95B26841CE5381399058AE54904C70C3913A40A065873574
          7776C3F4E30809776ABA879853C6A9E938AE3C6C11D24E49A43EEB4487346626
          3ECB2495BC3C97FFFA90E93D7266124FDB0E9E200070FC002AB1212599C1759F
          FCEC172E7FFFFBBFF2623E97190098395E97E3F6BFBA71D7E65B7EB2729E0E31
          728BF7DAC3E91EDFD38D3C254EEE21502030F0E480640011F9B044BFA94127C3
          D4DC243CA901552343CFD150234ABFAB368EBD4E013DBE2BFAEE67C82866CF9A
          8B6CBA051CD1AF927E9FCCE7C87064B1D5C735FC0D8DEDC2585977F0CF1445C2
          73CF6F12033C2B240F627143FCCC762A221390353CE70E70034F9EECC30D4AF9
          79DCDE6CD5AAA33077CE423CF1F89362AAF0F8C4302CCBC0B66DDB90CF158414
          E0E1246274981F35465188C1ECEFDA8FC96A058A41A04440A5C488A5D43CAC6D
          6DC3E98BE700D57190F021E337A2CECAD10C34F1DEB2A6C30B3C8CD0CF1E1F9E
          4467BE808253839A4E42218672F8F1A724FEE5473FA8BC98CF650600668ED7FC
          08EBF5D88DEF7CCFDE60C78E39CD625A8F2ACA57D980C40C0F292AB6E14D388F
          1376C8E3B1FCF77937C067EAEF100070CB2B0D214FC1D1E851E7FA781D45A2CC
          87823C7617475124BD5F2D737D800E556F44B6A9058DEDAD900CEE31302AFAF7
          73A55EBDEA8B6DC176FA1D070779825067E77E2C59BC0CC5620193B971E1BDA5
          A95460CEFEE3D1DF7CBE9C08C4466D9931916710D0891EB6F268CC99BD48040A
          EFB9F76E2C5BBA883C3E2718C5D1D7D787050BE689C9415DDD07E9BCAB683434
          ECDA430041D715242CB85E40A4C0C67192853F5BB004F3E35CD74000C3D7CD95
          907264A6F2D4E463D9A0F7A6F3EAA5F3B867CF4154B8AF210142954066ED2597
          762D39FC9865EFFBD007DD17F3D9CC00C0CCF19A1FD5A1E153BF74ED871FF776
          EE9113E313686A4EC2206DEC3944B7B98D15D1D9C0F3C5D04F8F8370B42A454B
          31DECF07F7155090AA2AB0656E91252124E90047815B72A19391D51B24144C1B
          DD03C3E8192961D40E301172A44146B23183D9F367239D8EC1B52BC8E7AB624E
          9F18F54DF49C770038E0C74D3C4F3CE16411101C1CEA27633D8062695C787336
          13DE09B04C4B5C8FA2A8229128168FA156E14C448380258974328B529968FC69
          270960E19E8003030398356B161E7EE44198310395C2384CF2FC5D8776A16685
          98D4C88DD33565F22EDE9C6AC5250B97C20C6A047E2E01005D3BC724B4687742
          732492049648082AC0C51E62368F1EEA43984A89A0A7DED488F3FEFCCFAFFDC4
          5FDEF89D17FBD9CC00C0CCF19A1F7EA1687DEBAFBEBCE7B9DBEE9CD75A736190
          06CE36A6E1F1FC00020087E8B42E2B62EF9CA9BF4DDECDE629420A6B5E1386A3
          235B3651D06CE4FD3269694B8CC2AE15AB304CD2D5864346E1C1239D3C54B471
          B054C3BE72017987F43D194E860C63DE9C59684CA744F0B158AD45FA3E2A1F02
          9B0167072E58B08800214506ED63746C18B9FC38C6E82BEFF7F3D3386F80477C
          B331F2F7F1441C95920D458ED323263AFB32B05C74F105686E6EC20FFEED269C
          73CE39C42E0EE0C4138F47C52EE3B98D8FA377CB164C4EF4A3CCF9FD49050E79
          EFB9B91097752CC2591DB348F6546013FBE06BD465078EC9E54921E28E46E69F
          444536314826BFB1A70BFB2B7554993191C499B36A55E1FD1FFDE8096FBAE0A2
          FD2FF6B399018099E37539BEFBB5AF9D7EDF4F6E7D34365240364B7A5C0DA093
          A66E222AADB981E881EF54D9F3F9E4FD89FACBCC0454A844F779FB0B7519E584
          8A037D07D16699984D0F95FBE91969946C9209BE073D5411C4E2182000E9191F
          A7C704C6C998CB64208A15C3BC790BD031BB8DE4812CB60473A4D139C0C73108
          6ED39DC96445A0B0BD7DB6C813608630343488FDFBF6936450A2BEFB228EE089
          CC419E30C4D98832771422606B6D6DC59A35A72293CE60DDAFEF17B1084D35B0
          7BF76E5C78D105189D18856317B0EED61FA35E9944990395DC469D58C7F19E85
          CBE62DC58A640CC5B028644BA2CE9D88C8C063819045F18A02CB4FA21ECF62AF
          9DC783BBB7638C2441C57311CBA671E13BDF75E0335FFDEA9297F2B9CC00C09F
          F0E13905A33CD6A70DF6F6C92B8E3AB626592D6EE0F892AC2BE12B7FF57F7FDC
          71EB8F1303FB0EFC60F33D0F5ED2DBBD556A6E48206B58087345B4584924C9DB
          73850F77F3F134179E12901CE0A9402631011DE38A8751F283FDDD7D68757C1C
          DB9C1254B94CD45BD50C581EB7C8F621C50DE41332DCA28BA15C099D950A7A3C
          0F3932724FD5D0D24A9260560B1289146AD53A4AA5AA6005DCEC23F003C46249
          CC9DBB4804FBB88D397BF267366D14949E038387BA3A45645FE6726402004D25
          FD5DB1453D01FBE9238E3C0C8324454647720270868746B16AD5E1686CCC925C
          6130D88A5DCF6C80532386C2DD86354904F7D6C65B71FE9C8568D748BE480502
          2915990A019746E7180B11D0FB254B32B1A1142A56069BF28378ECE05E14551D
          2157549A063EF0A94FDD78CDA73E75C34BF95C6600E04FF4A80F1F3AD2EDEAFF
          87C2D3CF9FD8B7AF33A6CF9AFDF4ECD5C7FF75E31BCED8E0D6BD9495307B5F8B
          F7FDFAD7BF7EFED0CECDD71ED8BE75AD373286765501116CD2F91EE25CC84240
          E018A4CFC91074EE795B25E3544CF4EA210E8C762311E83867C13138A6B10185
          91BDD84C3ABD6465A1B806EA041249325AD6CE01D16457B3D0EB78D8C14050A8
          937C50E0AB1CE5F730A7BD1D4D0D0D50C943F35624171615C74AD08D9848406A
          6D9D85542A1349046224B366B5A35229617FE75EF2C6C42AAA65215B384AA1A8
          A1E80E641A26EA7517167968961736D173859E73D659678BCCC4D9F3E6E08927
          1FC583EB7E85840231FA6B92002A466CE67D4D0B71724323243ABFBAE62046E7
          207B0A318E225C5312FD48AC5A08C3CB62D249E3BE037BF0BC330C2FC3FD0165
          741CB6120B0F3FACF9EFBFFBCFE32FE5F39801803FB1C33ED8D5D4FBE853E73B
          C3FBBE31F1F4A674EB7801162DD2E1988AFE74CC5F78E985DB3A961D766DCB31
          AB9F99FE9BC9D0279F0CB355524AAFE4BDA78FDECE3D9975BFFCF9DB363DFEF8
          3F0E6EDBA6CD26CFAC97CA6888C744743E903C18860195478B8BD6E0718C13D5
          EEEBDD83B3971D862BCE5A0BB538886AE110FAABA378BA7F0C3D44FFA19B6420
          242526AB88879AD8520C898E8F93616ECD4F60576E1215D2DD35D2E29C58D390
          CD6256C77C24D30D64C03672A53C52A689E2C4A488F673D1ED91471F87C5B3E6
          A0582C8AB8412E9723D650C4F8C484A821E0A6A0898445A0E18AD90292902D86
          D835E0C21D7E0E83C5396F790BF4B4855FDEF173E40F0C88590965A72A068676
          10005CBD68198ED26250E5AA60409C160D99AE41AF1218CAA2EBA1E57083E20C
          0E1465ACDBD589618B3E1B7A8DF67423DEFCF6CBF79D73D9C5C71C75CAEAEA4B
          F92C6600E04FE808070EB41EBCFFD1EF77DD7ACFB9CD6E9E0CC48644DE26E0ED
          AE9029AD822299B8B2E6F489F88927BEED843FBBFC01FEBBC930584200707CAB
          24DFF26A9ECF1D3FF9C169BB376FBEF7E11FDF9A9C4FDA1D95221A122688F122
          466C400A34D8E409155AE0FD04108DB50AAE39FD74CC4B99F0FC31920925A8F9
          71F4567C3C6557D1D73F42FA9917B545A061B2E34658F160C652F048727491FE
          DE55C8A3BB5040A15443A8AA483434D3A3050D4D2D44E743380414219D872819
          F62598C98C48C249A55258B9F230D4AB0EB63EBF4D64E9719A2F3FAF4A066E98
          BA90143CF68B63051651724D0CF00851A99789C2872804150C8D0E411FE1AC42
          620B9283B857C1AA98850B562DC11257469C7BFFF93528245B3C9E22A487513B
          52D727A056615B293C3B5AC6A307C6518927A1AB32B10905EFFDCCC7BF72E947
          3FF08597FA19CC00C09FC011EEDD670D741EFC9B7D3FFFE53B637D5DA9ACEA22
          C8915E36C95B92B7F165074A40FA57D130667B28984D28CF595A5F79EE5BAE9B
          7FEED93B5557C9E9BED22FA59597E45D5ECCF1C05DBF5CBE6BF396AF3D70C79D
          E77913636826A351F355CC49648822933171414D328EFEE18338A3653ED692AE
          4E9317D79A62A41B88479327AE957D8C583231846E6C234630C4DD7D83346292
          05ADCE8D4403D4E38AD0D255620A23E3651C9C1C435FA54C1A9A58821943B2B1
          0D0B9B3B488690DFAE55C5C49E62AD86925387ABFB88275358B264054262229C
          C1A71340B18C482612E8EF1FC0F8F884283FE6693E3AB118458E3277B89AD023
          2E21D3BD1E288E6284004019E33E861681828F96A08A358D599C79D87C349788
          731023E0108C64D7E99C6504F49A1681A06E072299694C37F00401DDE651C24B
          3D8EA05EC58A450BFCAF7FE75B6F9CB7E6B8475FEAFD9F0180FFE5C7A1FBEEFD
          F8F3B7DE7E65F3C8C4D1B3AA9C434E94D2F031580E11A3C5A4849E68831D8AAE
          B3040CB64F8B3F0BD76A4117ADD3A32E78CBC6C3DEFD8EB59269165FAB73BCED
          A737A93B76ECBC7CACAFFF7B3B1E7F2C46528340803C7E2C4986972159404639
          D2858B979D8059E4192DCD462C93819A6C2661A22324E3F0EA25D4DC02F61486
          B069B00F03BE41ABDB8029F13572FF4097D80E79D34027C663A1CF2961DBD810
          BAEA3514786C19D1ED6CAC090BE62E42269915E3BCEBC418EA0E796F020FCEAA
          D1786680436052B69120E35BB66881680D9688A7B06DDB76FA3E6A56CA3B0651
          83910081EF90AE97C484E39EA15E4C16268132274091EC211DB248F2B176E15C
          1CD7DE08B3EC8A0CBF18797585184D3D214192B989AA06D660BEA9E090EBE2B1
          037DE8AEC5E86588E5D0E777C6E96B86BFF9EB9FB5BF9C7B3F0300FF0B8FB06E
          2BF9FD87CE1EDAB8E9AF77DD7EEBD1732A3539C91167A2933532F0AC99419E8C
          455649594E792A12A5E450E9F7551B723C03970C256165D05B239ABAFA34BBF1
          C8A37FD476D2719F6E5C38A7F05A9DF777FFF11B8D8387BA3FDFBF6BC7F55D9B
          9E55DA62A489C9781B884E9F904E6175FB2224C8285D6F54D40FA4CD36620259
          2019835CE31A791B7EB98ED1A28DCD240D0E9157CE8744EB35150679659D7CB1
          59275D6DCBC813DD2FC534741672E81ACF214FC0522476A0180D686A5F80D6D6
          460202A0561C42BDE6214FAC4026A6E00712818D87638E388A98852BDA8AB174
          9244DA71158303BDC89572B048D7737EA3C673FF021FF9620EC34383B09951F0
          6FBC1059622A27D09BBC61C9422CF403D10FA1260530897D1824779C7828F43F
          4F00D6880DB9968E6DB9493CB6BB0B2564502249C0730B6EFCDA570E5DF891F7
          2D7A39F77C0600FE971D8F7CE79F16A8C5CA8FF31BB71DD33859361B49DF3BDC
          6D46AE8BA11A0A7944CE27ABB9D1561637A1630610CDCBF31070E3199202EC79
          4A05322A2D85F180FEA6B90DE19CB6034B8F3BEED295D75CD5A9CBEA8BCA357F
          39C73F7FED6B176F7A6ECB2F77AE5F2FCD22BABF88CEFBBCC54BD02EFAF979A8
          19DC185342AC4AD45C0990CCC4A0242C84D966B815620F133EEA9E8383CE04B6
          96067070624854177A040646C922569024EF2AA34AD7ED10C59E247BDC3F3C84
          B15C058364844EBA59E4EECF269931875E5B26C02C172A84919E68F859A854D0
          D8DC0A231D4363B6097DDDFD58B3660D46C7C7B179FB66C4C950431EEC69DB44
          5034D195A8B7A70BC57C5E186C9563036E88760281B3DA5AB066C15C240B05E8
          8629669088AEC66E9D5804E13281B6EAF118330376328D8D830378725F17C907
          CE17D010EB98850F7EE4DAF75DF3890FFDCBCBB9D73300F04774E443F758F22B
          DB4C49F17EDFEFD7FFCDD7DFD3FDDC737F91991C9FD352AFC3F2C8236AA18834
          47EDEE3432029328B026A82337E4E00020F7A2131133296A1FC7996E3CD64BAF
          83161F07C334D8E4E9064A15B49E7052F9B8775EF57165C9829BD1DA24698A52
          7BB5AFB3E43BB3AB7B07ADAF7DF3AFFFFAB9C7D65DFA7EA2E627B635C12D8E41
          23E3AAAA9A2818D27C9FCEB382B85323A323C36E9B4340D00CA9E28A34DCD0F1
          50B26BE43507B1657214551E9FED6785047075070AD17CA956874220C0D974FB
          2B25ECA37F77913776140219D7C6EC4C0ACB9B8979E8F437751755A2FC63E49D
          EBE4D9AB194334E86A4A3460F19CF9F47B1B1E19EE92E58B5128E6B169D34632
          629580A02E6A0D02FA4CF883A8D1DFC6E83DE7393E2E5ABC10CB921612F47721
          7F2EAA21F2097CBA2E5DF5C9D03531F23BF44D622C09DC7F603FF6139B30E349
          94E8635BB2FA345C78F99F2FBFEC1D97EF7B39F77A0600FEC88F72A947A9F44F
          5E75F0C1272FEBFED5BAB3E697AA5ADC2F8BA1118EEE8B411C8A0BB1A71C843A
          5C8574AC621007288BA97DDC928BB7DD0202006E6C5957A371DC6C5CA62B0802
          190E10B3126244D7A4ADA21E6BC6F20BCE7FAAF59493AF548F5951C94AEA289F
          8B1D860D2A503CF8EB47CC6D7B774B279CF10665DED147E45FEA35150800D28A
          DEBF63F7B34D031B9E5CDFFAD375CBADE238D4D4D45010326087188AA333F1AE
          21493A3E49C61D9291265B5B11CF2488BB932BAD9001915EAF90D1EEAB16B1BE
          F7007A5C096E2A0DD9F0619124489157D72B1E8124311E5D478F5FC3F6E20446
          1C57742AE6EDC256D2F873DB66239D48A32E4B18A7BF1B712AE48103029E0492
          5C6A0C0D2B162C427B7333F61CDA87E68E666CDDBA0589440CE3E363A2774040
          FA9D0B8808359126403EDA8A11B3998F16DEF60CB8743846373C419F09037309
          AA56158353CD204E869A401F31863BF7EDC02831A01A8195665A58FBF677EEF8
          F0673E73DAECF92F4F9ACD00C01FD9E1D4DDB86E6A827EFB6E7E75FF334F5D3F
          F1D4D397F6DC7E0FDAC10B8B3C4C5047D19260EBE469EA8AC82997BDA89DA4C3
          137039D22E46614FB5E4A205E7CBA1A83F6716C07DF5B93A5FE3693DBE47DE92
          F7D8550415960909B86A1AFD450FC935A70E9D74F5151F6B3A62D53DA6AA55AA
          FBF7A5F7DCFFE017F76CDFFDE1FD83BDFA9265AB268F39F3B47F38ECDCB77EF9
          A55E67250CD3F51D5B1677DD7EFB2669C306394B462EA5E8CCC8B3CB744D9C25
          58D7B968889840680B46C35B9931A2DC2D190B71BD0D9219272A4E165C75502D
          97D0EDE4B13B97476FB18431BB08C23258460286A3417520A2F739CD437F5843
          5FA58AAE9112BC4016CD37629A890479E06C5B1BE474928C9F747DB5264A8499
          B71BAA892524534AC502E2495378F1DEDE1E2C5FB10C1B9F791ADD5D8788E21B
          62EBD022A069B41D9CDED68AB3E677C0AA1745931484497A24C484335F2A1261
          2B1149D360D0CF3C02807D3507771DD88D9EB08EB8C6C94A6D78FF17BEF4E5CB
          DFFD9E2FBEDCF53403007F64070180E60CEE4FD64BF54B7A1E7FE4C68107EF6B
          CDD44B70CBE3B44063706C57E8C530E456D8DC7083ABE2A38CB590DCB9AF38B4
          5EE9398129DA4AF394595E04BC8EB9FACE5603B12A34A2C126F7E80B425198E3
          D65C5AB871D1CACB235A5A226A3C4E1CD48A35DA477FE4BD773638D5DCA1071F
          BFD01F1A68ABA7556CEDEB44FFD67E8C66E2E1DA0FBD7F63A6B9ED1DE7BEE35D
          0725E5C5A5194F84F6E163B7DC7141FE5F7E78A39EB091F6F8DA89FA1275F6AA
          DC475011865225C3F3156E28C885331A24BB2A6481996E44C6CA206692573589
          86934C902A358C93E1F5948BD83FD28F1E7A6E4EE2966309E88E429E96A837CF
          D5334812683A4608387A472730969F10F1838064814C5EB78574779C58040F23
          B15D624D740FE3D94674F7F78B0AC115CB16C12403EDEBEFC5FCF9F3B07DC736
          1C38D8C99B822299C822A05A4AAF7FEEA2455891D4097C4AD114E42046AF6945
          C34B788AB15285CE1F8714479180F7F1DE016C9C1C41C9245027A06E9F35D7FD
          A71FFFF4F815C71CBFEDE5AEA71900F8233A42DFD1894FCEDF7EE71D3FDB7FDB
          5D473516C87384445565D2BB0A7941EE64C3DD63B88F9EAD892C3A9E711B92C7
          095525E2F36145B495661DACB177235A298B888224FAEA87F2549FBE801B57C8
          62FC56D382B9685E7312517C097BEEBF0F7675124AA1820C07A22A36C10BB952
          A2D4ED44CBE7679B497E2818F649F70E0EA393BCE42159853A6F917BC575D77D
          E5B80BCEFDCB1775AD7BBBE63EF4CDFFDBB560CF6EB922E5A012D556889A7320
          B3CAD131F6F6C4502A1AF7DE8F6AE5796AAEACF9704DA2CE76817EAFA221DE84
          4C6307A458C4067C3B107DFE87F2A3D89C1FC4B3C551E4E95AD3460609DB8C36
          44E87ED8741FD8D3974872ECCB0D8BBC8141AF4E3F9744579EB6D60E2C6F9C45
          0093C064B9069BEE6395E8BD41F7DAB1CBE8E86883C25A3F61E1B1C71F43AE90
          173B2EDC7034E186389100E4FC254BD1E857C1B37D024D22B055A1F04E84C821
          64FD453285C0C55793E8F534ACEB3C8089B889B16A89D84A886BAEBBAE72FD97
          BE9A78256B6A0600FE480E6762A06D60C3431F7EE6DE07AE777776C6674B3A69
          7BB1A1445A95E8A3461E8ABC20DB3253616EABC51E1EC2F32B917173DEFA14BD
          0FD99BD16F65620C2A198F5876E40D4BF443DB3031490BEFD0D80486C85B1A4D
          69AC3AFA48ACBDEA52A4D3294CDEBA0EE34FAC87AFD55020E6A1591626C910EB
          E49D1BE85D8E8A65891958A81343E8218FBBAB50A5AF3E76578ACE459FB8B6E7
          E4B3CEBE60E111C7EFF97DD7990FBD456669E2F8ADDFF8EE97EB1B9E5DD44474
          572730B1095474D71151F20A5F13F31C3A4787AE4BE7E09E1B88C6A20EB9CCAA
          E5C2F46AC46242E836C9222985544307D49656380ADD9B621572B18C5C502410
          E8C7DE416E16A2C2D12C70174EDDCEC25588F5C4EBA215373704E92AE7D059C9
          D1D73C2A3CA55857302BDB8E16028234797FBB5643A5548647E8A1D2EF6A64A4
          8B972E46DF601FB6EFDA2DCE582670E0D16573E89E9FD1D88C53E6CC168D4038
          EAEF318309F9F3F18451EA0A81B6131040132B319378D671711B0180116F2031
          20A32CD770F9FBDF75F5276EFC9B9B5EC9BA9A0180FFE1479DB4B07B68E72987
          1E59FFAF9BEFB8A53D418B25E192172AD589B24A621E5E30D54423941461ECE2
          607DCF0F4C6D184851C79DA8FB1607CF5CB10D28DAF3D342F388EEBB44A16DC3
          C270D5C681C902B68E8E60880DB0358B5AB980A58181B79DF556AC7DFF5528ED
          DF8EA1BBEE4671A88B3C25C98DBA84BA1247B9ECC248C858D19A419BD5821A9D
          677FBE88CEC0C5FAC9210C93211C76DA1B472EBEE2ED7F7FF81BDFF877BF7BBD
          D5D05D55D8BBE3EDBB3EF3979F6D2586C3A9B0263700967FB3F1C10D3B7F7348
          42A6C8E4A93978E6703B710643BA46939B82561CB19B1137B248665A61B624A0
          260CA044CF2D9790F74B18B04BE81ECEA17FBC8021D786252D8094E03DF961A4
          6C8B8C5A428D287D8558D4AEA101F47BBC5D6893BCD2A011E56F9F3D07739AC9
          E3BB3E267313D16742543F998A61CFFEBDC8558875E926DD5F6E73E4E208622E
          6FEE2006D1D4209AA1A824A918D8B805982C71B75F59743F4299D48BA1A3A628
          B837378A87734532FE244C029A05271E8EE6158B8EF8E6F77FB0E395ACAF1900
          F81F7AB0E12B644D13CF3CF7574FFECB77AEC7A1DD6A369180479E4EA68526F1
          3E3EA7C308CF1EF2B05D7A907F5794C8D01188601E07FB205A7087223025BEA7
          DFEB812FE8BD0C4DC40A6A8A81095A0DDDE3151C1CE43459328CD0C38816A016
          27BA4D5EBEC19630BF12E0D84C0BDEFFB96B317FE17C4CFC721D3AB7AF27DA3D
          09B83ABCC46254080C1C6F1C7349E72E8CA79126CA3EE0D6B08D747867BD8E3E
          7A8FA0B939B8F0C31FDCB2E6A28BDFAAC492E5E9BC824AE8C8BDB7FEE4FEF16F
          FFF0EC567A7E3D1935E494F09BD00137DD983E18D018C4388121245D4CAC9F1E
          A1181B2EBAE9F278B09A47EC41418C002A950A916C20CD1F9F2726ED8421BD87
          4740408C60C7C018B6164650A8C5C45C02D9B0D1EA27E094AAA4F38158AA1175
          02D97D93A3D845B2A09B40A942DE5E253A9F8D67B1B06516498E04815E593439
          F1E9BD7BFB7A51A3F32D113390490EA8F50A4E208675C182F968E1DE02C490B8
          78C857B9F0D91163BF5862F81C13AC4848255218295770E7482F36F384223F86
          2C7DE6E75C7549CFA9E7AE3DF6F4B79E37F14AD6D90C00FC0F3CC6B6754AFBEE
          BA73717B83F98BAE7B7F7DA43ED04F1E9E3CB6AC23CEC31F8B45A2991A24359A
          838729E360E3F7E8E173AAB9E8221988D6D4A26495FBDC9391F0572E970D8350
          E40328660A791BD8313E81BDE4E5FB8A1EC6EA2E26882170C6AA493A5827632A
          D6CB304DF29CB5321A0C0927EA195C78EA9B70CE25E7C1EF3D80915FFE824063
          18A5441629BD9568B607BB3E847846477342459362A2E6AAE821003B3499C338
          79E86E3AC5D3AE787B57BCB1E9DA23CE3AF3FE398B9648933BB6BD71F89EBBEF
          55EEBA5FC990069E30A68C399C1EDC19FE3B06C03F1683BC0400701970543B1F
          F0345FFE9E418FAE55271A6FF2EC5D953CBCEBA135C820D9D20434918466FA44
          A035E694B16F82B4FEC038BA2B458C1238A4546E3CC2EFABC290E3705D99C0CE
          C04850472717174D8C639241979ED7946C407B4B0B32E934349253A37D43E8EE
          EE41958C3FE0380C5D4FDA2EE38CE616BC69CE2CC43D478C3357B8F290A48BC5
          BB190C02F4B93AF4997089B341F4BF736408EB46FAB09FC0A7C16C82410CE143
          9FFFF8B7AFFCF8473FF44AD7DA0C00FC0F39CA9EB3903ED7497D7C32BE65DD93
          B7EDBEF9E6131BFBF71015B5459E7A87DB20E6D1E7FD0A52CD8DC891C664C7A7
          92B75085AD87A2A1263FD800040088DE7A6CF401B4208AE8739599441EA94E60
          5226A31824CADE95AB623B01C021DF4681FC668D99445C156CC1A8B9682786C0
          7F3F205560379047666F459E2F5302D6C4DAF0D1EBAEC3E1271E85CA1D77E3E0
          BABB611368B86A16C5701C569C0C8668B6294B589A9A83162F8961CD21A029A2
          7BB4842E47C25E32D2CBBEF0E9E74E5B73DAA7BB7FFDC0CD233FFBF9AC6544CF
          B979E89812C2E620E294D7E74B65F07AE160E9C3DC26F4C557D15F544408C894
          E8679E12A5D34A4A3411D8773C98B68F469BBCBBA520D5D40C39390BC4E58959
          D48514AA8D8D90D62FE3E95C0EA3A5313872200C5193630414519B7087343BB7
          E21EA6C7B6F17102BF1A6AF47E92A1C2CA6490218D3F3196C3E444211A362AF3
          DE4C8039F4026F24C9705C438A58492DA2FFFC7A04741681B51A3AD1C8717A9F
          A4DE802A743CB377179EA9E551CE362121A7106B4CE292ABDF96FAE0A73FF58A
          CBB36700E07FC8E13A75A3BC67FF254FDDF4936FD49F7DB6D5224F6B9247E024
          1D99E7CDD70241F31D853BE6F0E2262920A2F5D1969DC200204500C033E62243
          204FEFBA51008A837E5CF986A83A6E84E8FC21D2E6DB4772E8ADBA18E75C76D3
          841D084141C6C07BEBA4E7C9F04CB115258905EED26BFB3145C40F62B4D8E5BA
          83A389265F73FE4578EBE5E721ECEF47D74FEFC0507E00B62989BDF52279569D
          7BD6E72A38A979116A169D11C983F1E10A0E8C14B1AF56C338E9F2C52B57E696
          1B5676DE2831875A0E0437E46D138218CBE16FBCFEF4186FF17D18E52F7822A9
          89AB6F43A1C1A3896391DCE180A70890D20F79C007073C63C402125E950C2A44
          82244D2CDB0C25CE7D0A8931D5C730E202CF4FD8D8DFB51B93AA079F6BFC4926
          C5025D044DD973EB9C8664C491D32CEC1A1C22501BC744504589BBF872E11079
          6C1E2D2EB9ECDD65A408E8E6CA759CB36431965ABC9D598061C5E9F3D260EB74
          3F039203CCD898D985064C2589BE7A800DBBB6E200E99C929580E6E878EF27AE
          733B16CF332F7EFB95C14B5E68BF73CC00C0EB7CE403B731236BFF4EB705B62B
          F53CFED85FECBEEBEECF57376ED69AE55122E06CAC31D2F0BAA8D42B2B1561B8
          12790C66ACA045ED3B2E7966092A2D308E78F33EBEAB725B6DFABD47DEA8EEC1
          A005181AA4F363065C4BC3A45DC5707E127B731E0EE48AE8F72414891A57B825
          1719297867C1B645E4DD6220E0A219F66CBA22B6C8585F04B498255AB071FA67
          864EC627EADD42E7784CD31C7CE1D337A0634106DB6EF90E8A5B0EA092344531
          8E5329A3896870AE3886054B662345745A9792C8977C7491A7EC232A9D6C6BC1
          72A2C7ED64FC32CA2812F8F9EC7539A741FA4D97EB7F07004194C4E40A638F8C
          9FE7E7B1DBE51EFC3CE09763259CE7C053835DD6F6A102CB8BEEABA45461D915
          3493219AD90E582D1D047205B8CDB3B1ADAB840DF7AD839B5550A0FBA22792C2
          F875324A9DC329F49FA358F0F414724E8031B784BD63DDE8B16B28D039DA5CD5
          685A303D1956DD4796EEE7CAA481D5F367A183839A6E158A4EF75CE541A8C410
          E83E6BA1132567D1752B5A16DBC7F2D8D0B5072304A6B29181E469B8E8CACBBF
          FC856F7EFD6527FFFCF6310300AFF34100601100D446ECAAD56AC46A8FDEF2E3
          C65A4FDF4DC58DCF9E99E8EB3653924394B74E8B93E3F4262D194B2C5E4E0C11
          E5BA5CAF2EFAC49321921793C9DA357EB8515E7F8DD6132F26B52E23595369A1
          EA220FA0A4491820AFBE3B3F8A7DE3A338685B9874B903AF1135C6D48842733A
          1C4B04029618385516827554D8C82C5904AA42CE2AAC87683452D0EC403CA140
          00E36664E8A53CCE201D7CCD9BDF8CB3DE7C16C6B73D8B03BF7C9CAE8724457B
          1C79A508BF3E894CC527FD1B437BD33C58D9164CD4CB181E1D80659868B04C18
          A4AD65DD4595B7DB44259C2EBA050BB2FF3B2B96773A0231462C10DE5E9A9243
          4A1019E894128A1E9C14C5E3C7B8D38EC2CD3C8945290EB8DF911F563187A44E
          A3DE087BF122986BDE803B6EBA1DDB36EF428C184BB95EA373D244A722854197
          BB98F3F9884A40BA53660C65BA3FFD953162541574E70B18A3FBC860CD310493
          DEBB95C0FB74A2FF4B1A63C878657017418F7B7DE93104BA2C36680DFA8C2CAF
          422C208EB2D68C67BAFAF150BE076122215AA3772C5B8653CF7FF3EA8FDD70C3
          53AFC67A9C01803FD051AB168EED7E72FD05CFFEF4E7EFA86EDF316F1EEBD44A
          09BA2289BD6A4EC8F124F27C648ABCB483B00C6E2D417A4064C0F1C15B4891B7
          83A0C8BC8444049C3C2E47F73931066468AE1B62B050C6D6FC389EAF13E5A785
          EFBA042EDC75879806679BC97E95DEA74E0B36149A5515232814114B08F8F93C
          7A5B87001BF6821679D118792FC7F521528B1A74F88683349DD7C29287ABD79C
          8D775DF06638E40D279EDE820D9D5BE0341A682A3930F381D85AB36269649329
          B8BE8D1219443C1D83C5349E24814206510D5CD1B05309A6DB774F853BA77632
          F8E08425064837988A0108A30F4532D33400F03DE29F45DFEBE2DE40F3086449
          6FF35783EEB7EFA3CD36491224619E7212B6958AB8EBE7BF423291852E734255
          883A8F0A5795A9F70DC963D36B12D3E2BFE5FC7EDFD0B979315D9B8A89620D03
          B50A7A8A39143D873EBF008B1A1AF086F63674100B493B159844576ABCBFC1F3
          064812F1F91B3EDD1FA746FFB630EC9B78A8AB07DB83223109A2FF451F6FBCF8
          E2BE2FFEFDDF1E99686BCBBD1AEB700600FE00C7BE5B7E7572DFDECEDBBBD7AF
          6BCB4E4CA23D2E63A43E01973CA95DF590D1E2A20F3C7B2A2831B1EDE5056531
          2596474349536E8DF3F411441E90B7C9D8D3F02AF74D8316A2827CDD457FBE86
          A18902FAAB751C741C0C4BB4986316694955180D63498C5B5885514930E7F5D5
          438D3C624C74E495C4F84EEE8E5726E320C9015978E17240F43CAE112B2159E2
          EAA22D3759043C7A7087DF2657C6B1E4D1DFBEE674BCF1DC33E01DECC3E63B7F
          8D618D9E4F5AD6632643D7A316488090A1683115CD6D4DF48E2A9F06E19C8AAA
          CDA0E48A6B139E1B53414091D3102D5D4EC7E5637A37444CF8A5EF5C61A79288
          09301B107101DEF920EAAFD26BE9E4F503C3469D588F4300A74B0692450BC978
          2BF6D04B3ED6B9074DF1A41837EE945CCECC8164D2D55B53E7C175FB36517C8E
          9590EEE77C0B49A5FBA0C7495610AB22A31EE592649236DDB93111905C45DEFF
          18C322E3B791222357E8B37208E8422B6A61C6E5D826B7F8A64BB1E935F6148B
          B86F7808C33C5FD42689E02878DF273F79D387BEFCA5AB5FADB5380300AFF3B1
          E19FBFFBA5EE47365E67F68E35646911BAB91132861AEC243794F09092AC686A
          8D14F582E7DEB842DDD2220BD96043E937DE508AB6FB02315E9BF7FE6498068F
          CE3230420B69EFF830B6D002EAB75D4C9041D498119024484831916A5A0EEB22
          37C0A0F7E2E212995848A5464283A8B0C733BA6188F7E171DE1AB18324E31119
          91439EB9C6AC848CD6F5A31E030DF4E06E3679C526466BC0E272E262150B6931
          9F357F1EAEFCD8BB3137D580ED37DD85E1915192056430443DCA8531C40D950B
          6011272DDC9A6E2243D04415A3E4D951B932D3FF4015FE5D6CF98B8714F97BCE
          FFE773F1450EE49406980680C8F0A78382FCD5E75EC374AFCC80A9BF83AAEE08
          66A5D2BDC9A21D46AA03376F7D1E2E37F4A816C9301D18B221C092C14EE55A7F
          C1C22498AE21A2F63281B32A71420F77213245143F4AC13650A3F7B48368EA51
          8AE443BA6E2346322B1E44791A3CD0C3D758461063A37B62F901B10003059265
          5B0A2378A830812AB38E9C43CF3071DD0DFFE713EFFBC2E7BFF16AADC7190078
          9D8EDEA7379CDABB75F377B7FCFCB6956DB62B1964A0DC5E9A1F60FACE86E405
          6291DABC8F2D7B51855E38B592397F5FF4BAA3C532355197F86894E21B04220B
          D02503AA7B8A28D2D93739817D45F23E644445D2FFBC974E4F8046DE3A4B0BA9
          4EC4BD22064A05BC3645934BA82A5483B4BC1A0DC374DD8028BE2316BB5D7745
          1EBB4E5435469EAECAEDACC99B956B55C15678BA2FF7E8E3ED3895AE2315B020
          21032077369B00E1C85A80BFFCC4F5587AD8521437EDC3F3B7DD49FAB70EB923
          853C272CD5E99A4ADC80008867E2C892B1981C8F904311BDE7E063D4BB481205
          4E22EB91CEC7E3DD0DA6F8629B309AC41BC8BFB9EF2F2CF0A958007B5C6EA31D
          AF42DC7B87F4BD4A2CC02D5789EECFC56049C24F77EE44C782F930AA399EEB2B
          8AA9F8E5B9490A7846E054C3144D0CEDA4332216C0DE5B559408BC58F78B746C
          49B40597C4AE4C74F67C15BC7BA3F1794BD357C40959F42EB22DBA1A6B4106A3
          04004FE7BAF17889E3C52A52151973162CC3FC230F6FFCC6AD3F997CB5D6E50C
          00BCC6476D72F2989DF7AC5BB4E7C98D3FF2F7EDB5124A9DE427790CBB2E1A4C
          D639C98556AC415ABA2E3BC8991E625CC8C3957B92D8E987087E8575E1F538C7
          5F12993E8A9891C7DB69123DAF46147ED40B313C5943FF5819DDD50A46241E32
          417F45DAD4A5F708B964803CA9C5C5A77299CC3F1A1F9F88C730A76D2E12E946
          A2E231D16936C64129A78E62852830ADD3C9D131E4C7E941745DE2C49720880C
          C30FA209BA9C63CFA9C5225B8D1EB4A40B521C19020B1E6F95911C1CA5EBB864
          CD29587BF555A8EFEBC2F3F73F803EAF8449DBC302BF116AD5C650300633ADA0
          356E20C5B9FC53CD3F142FF2F85E2889883FC4D04C99C03288687E18F183A8C7
          C1D456E0D467C04031BD5F5635B8EA4E42B6640A70B50DF2F00A5178AF8E78D3
          3CDCFBF46E6CA76B68ED9885446D926E7399EE39B72857A388A82F8B2122BC35
          2B699EF0E2223391EEB322EE01DF0A92311C2BE1388A1419BF2CFA1172DD3FE7
          FDCB629807838116F044A35048310600DD2390462B7AE8963E3AB60F4F950B30
          B92D5A55C165575F83C5C71D93BEE083EF7BD5FA33CE00C06B7854F6EE9D3FFC
          DC960F3C7BF7AF3F83C121A46A35F2F4A4E56340C1298ACC3AB7CADB6B8AA0E4
          9CB5C6432A04899523CF4B845024F3D8F298F0282AD34EA2F12460491612ED26
          2FCC2D790627C684DEDCE556D04B46E18828B52C282671735AE0D1C44D39D4C5
          704C2835245349B4B737A3B9B911C9645AE86E3695D1D151A1A5B915B64AAC40
          9932F842A180FEFE7E4C4C4CA0420C201AB0198A8E3A1C510F545F54D229B488
          79BFBC2CAA04C9DB662CF844659B1D07EDF4BA47CE6FC5873E701D56A41761FF
          9D0F61EFC1DD2865035488EAC779126F6E92910A464302294F43C2910928590C
          D1F573808F137CE468FB8F537F158E8BF0D6243015F50F456010D27F5CDE0E27
          3739F43E24B7EAA68A0A9F1FE9EB562B8D3D0905DF5EFF0C528976B4DB2A126A
          1DF5589D3CBB49EF2189E6A2BC4BA2F19460022593DED7E181A5E0FD7BE23BA1
          2A24898AA973E18A42EEDBC7A3C7F8BA02DE76F4A2442D0E3C2A116BE10EC23E
          4B04172293530E4C924925DC33D48303063904474253AA05EFBCFEA3FFEF9ACF
          7EEEBA57738DCE00C06B704C76ED4D4C8E0E5FB7E38E759F2CEFE86CD4895E1A
          64306942FB5A2D479E9E4C36AEA254AF91A76D100010B0261500305DD4E34E79
          2D4D18971FE4A20818191689675A28164AE46906ABD528AB6E7C1293AE873122
          0F45835F4316D1738E5007227185D903EB685DF4046C6834B170D17C34359120
          3075311DD7A5BFAF1273D8B16387187291C964C4B6577373B378F0F73C15979B
          5AF0D8EBE1E161F13C85BCB4AA310F88CE5F21838A13D094490F9BD9A4A8D70F
          9C0A8C72090D0C18BA8245F4FBD30F3F06D75CF34EA8C434B6DE722B9DFF081C
          3544B5C64660212E73CE439D2F1769FA9F4506C51D0D210A7F7C91EAEBB07715
          86C652490445A2D46009F87D8D0798B1C864C4CC1A78AB95731A12749EBCC77F
          6BCF1E3C31328E44AA0D1D043C29D8084D173AFD5EA3F750099065FA7BF6EA0A
          9F0BCB2E966A0400DA3400489A186ACA814A66280A01006F1B72C34FC5F3E975
          3C915BC10D5A0306034E7312750B24AD08A4B9C189E3ABD8DB3D82C77323C835
          6AD009B88F3FFA94F0C39FFAF41B8F5E7BCEC3AFE65A9D018057F9E8DBB0A1A9
          7FE7F66FEE79E491B7499D87D06AC439D18768BF438BC7866C8482EAD7C8C06D
          B12F4DBF77A3FA6F9F4D48A4B329D1B612EBD9294A8D7A45ECFF73C55E9D1658
          91E8742F1922E7AE774E945008A2822087B30479E9F3BC3BAEF49B8A8D895D71
          1E97451200B28E654B6761EEDCD9042CB658801A67BAD1FB7A641CDBB76F1363
          AD9905B0712D58B000F3E7CF8FF6C0952826512E97D1D9D989DEDE3E44D177EE
          C21D05E9384F204522A0460F9F3B0F9B51900F0E3120C74656C98ABC8276BB84
          531A1BF0BE775F8195271D85E15FDF83E79F780CF90AE9EB6C1B014820AE3B3D
          95C9D8944C8AFD748973E81145FD3D25DA1B10B2448A0020146990BF3F494EA9
          FB516E039D6B9A98909AF7906A6AC3EE4A1EDFDBF11C46899E3B748F96665B91
          E1CA40021F53898939011A6B7762100C00F214947AB22F3E3B9DD890116A0200
          5C02C480AEBB446069E80662AA0583403EC631833A0126C70A35976401313B62
          6CBAC12041D28BA59D66618CCE7153771F0E861E72B140CC203875F5997DDFFA
          D9CFE7BEDAEB7506005EC1E10581A4CAF20B8EE6E96FFFA0B13436BAAEEBBE07
          4F98ED73255E5DF4A30FA70254FC3D53469B90DFE1D65B4C5DBD98880504A123
          00803D12AD36A83C678E1620379AB4C83F18B428794844957E3D64D770B05646
          57BD8C01FA7EAC16A0C6AB7A3A20C6D582883E5CDEF5E6FF441A0DA79CD23756
          3C8DC30E5B44122041E7E08B745DEE21C07BEE3CFE7A60A01FFBF6ED13DD6B98
          E6CF9E3D1B2B56AC10C6CFA020F43F7D3F383888AD5BB78AE21CF17E7AB44568
          8A4C3B5AEC812EEAF5B915A62744AE247432DCA428DFF56365328A3A8EA545FF
          9E33D7E24D179F0B740DE1E0BDF7A1BFA7135EDA42812C90B735A5913158BCBD
          984EC352390E12EDBFF3ED92A23D3E0190536A1AFF190070169F4DA05149A848
          D624646D0B7653137EB2F379AC1F1D2606C2225E43633C01CB26B0E2A027B103
          6EE3A590974F703B35D15781F4BB2845E41D1A07A6170A00E0C6ABAEA689E29F
          FD3DDDBC8189E674231ACC149AE32984152EAA22E0B273300D3A977A11F19805
          378C8B9C0C85C0A6B358C6FAA10154AC18CA24856C02E50F7DF4937F7BED673E
          FBD9577B0DCF00C02B383CAEA3658757CDCD720F1D5AB9E9C7B7FFDDC4034FAD
          68254374C9CB87E4A94212C5DC09DEE7441A8D7F4E8491BBF8D062626A2871C3
          478E98B304082300E075C4D567BECF7DEE88226A26C98014BD8E44DEA18C5DA3
          43D84D3AB9A04733261C32734E1DE591542AA7FF7A1126B1EC5745C02A1433EF
          85AFA2E7A4D20D5871F80AC462A6001E9516BD428B9E338C980DD4499A8C8F8F
          0BADCF4C20499EF7F0C30F173DF0A7E301A1D0E221D6AF5F8F1ACB00CE5C14DB
          5D3CD64B253A0B31520B5CE842E75DA7F775849112A391E2A4DDE939BC919194
          61D70A88D51D5CD876183E72ED8730B751C6D65B7F8CF18307514C5A64040AE2
          AE8B5AA54A6CC94763B681743AB101F2AE9C515B2326212BBE68B91DA50AFEE7
          0060040A2A3E015B42875E70D19E9D8FA7CB057C6FCB268CB801D2E49ECD8449
          CFB19189C51113814E0FAD0D193A6F62361AB708F1C5E62CC70024A6591E27EF
          300330440E804392AAAE4BD8B27F3F72A53A52B104E636B5A3A3B1590CFD4872
          1A61759CF8910D4200C4CD1801BB41F7861E8E864D232378223F4A3732018DC0
          21E051E89639FB99ED3B075EED353C0300AFF018DDB36BF6E033CFBDFBE083F7
          7D4E1D1931F5C93CAC20EAF052A345EFFA9CC4430F3642F2902E07CB442DBE1F
          5173CF24005045D9AE4B20C0FA9F27E37243088DB5A4EAA24246395135305AAC
          90D61F425FAD84316E4A194204C178D18562CF3E141364E2414490AB22894716
          13A8790B60BAA63E914860FECAE56868C8D202F605ED1781F5A924239E77C75E
          9D07616EDFBE9D3C962900C0B2AC1700603A1FFFC9279F44919379C8A09D20D2
          1B1CDB4AD2770ADD03FEB9410BDC2210D1934473C9B83CC5163D06472BF475B2
          0E8D3D2DB7D3A2E7B7D0733FF0AEABB1F6E49331F2D063D8FBCC068C92B18464
          502A0161B55617D573DCA5D8A2E726C84465025B6EA3CDD71815034EEF03FEC7
          2800039D4306CD44A4594FC3D653F8D7DDDBF178B544D2234487A4239E3090A7
          FBCE5BA7292386A3972E46E7EEDD68A5F38FD3355A9C38254740270803BD9EE5
          3003E01C011D151EB44A9E7D4FFF20CA225310688825D19469403A65D135CA98
          452F102349C4BB3FBAC4FD18345A23066A39178FF5F56133EF087085225DCB79
          575E5E3DEAA413165E7EE53B465EEDF53B03002FE17082204B9F65D992655199
          D27FDF436F1A787CFDBF8D3EF0F0AC58354774B70A3D4B1ECBE15EFBA6D8640B
          822800C7053A9C4EEA8B0115515DBBC685342245D517812D8E0270D7DE3451C1
          0A6F1B31BD2DB9E82ED6B185BE3F902BA04606C05EDC97A2EDB028DA1D3501E1
          C512849A48E2F5C503531D7EC5061AF4A9B422D6B2E9B91D9845D43E918A93F1
          305079E2D96CD86CB4FC95037C5BB66CC19C3973306FDEBC170C9FE302FC7572
          7212CF3EFB2C5C47D4EB89CEB8DC128BE00E0D99045ADB3368206F6DC5E32220
          C6556E1CDB30B9730F818EAE98288D1720176AA8D37BC974DF7213A330551D27
          1C7E242E7FEB5A1C336736F6DF7B3F9EDFF028EC360B15BB4A409440B9E2713A
          22AC541AEDC4644C9F13A56C110708C5AE4018C509A4702A3F4816454081A989
          487E93AB11136AC60383FDF8C5502F06899E57C7642C2623AFB89318335C14BC
          00A7AF5EF3CBBFFCF075DFD9B567D7976FFE7FFFF7E438B18D14D18E38A1AAC9
          CD4489EE1B9287040140CC67A6469F7F4CC1E65C1F76568AA22E43AE8548705A
          379D9B6E018B8849BD81EE678C8790BA75313CA4A82688256A181D2AE2613AA7
          AE4C0C5A5D25304AE37D1FBFFE13EFFDD8475EB5E49FDF3E6600E0651E5DB7DD
          F1C16D0F3DF40FB52D9B8D795CA25B2A9237F650551CD4A0D1876909B3E3D65C
          C20CC35074966520F083702AE26F0B4352DC10AA4DCF217A6A4B322DF01872E4
          CAF30151F1E13CF68C16B0935843692A9FFD7777B864F13651D2AECF94555412
          4E45C539D14418017B1A490080C82CB034B475B4631619B7499E9D258938176E
          A41144DD6B19007A7B7BB172E54AB125C8D1FF69106000E320E041A2E9E154E5
          9DA95A824DE89682C5CB1762EEEC36012E955A1575DB16D58C5C92CC432EABC5
          129A6229C4394A415ED0A9BB6240A9447F3F3430482C441183392E5C7D2AAEB8
          F412540FEEC793DFFB212A293AB7068E9B28A89107D6C72C482EBD5656876145
          E4DF0C14915EC3D994A168731E4C6D0B1014C649A3D76A68D332743F75FC70CB
          F3D8A5A9C4A8C8F3576358D69CC660A11723720DB3962DC37BAEBEE6860F5DFF
          D11B9FBCFB366DA4A7FBC38FDFFFEBCFED7DFE99A6245D43C2B3908913AB21E6
          910AB9FD3AB136D2FAB412B079AC077B09946C8E89D489019869022DAEE87408
          4CDBF091F7BCABD0F3CCC6A473A05B6ED363248FE8BC0C1DFBFA0645F47FAC29
          032FE760F5EA35FEA5975D76CE85EFB8E2A1D7621DCF00C0CB38BAD7DD7BC3D6
          1FDDF445A3B747E59C3AFE4FE2281719425D7245E22C3300118CE79CF9A9BBCC
          0B928B42385B8EF57E4D290A6FCD79F9866DC0B33551FB5E8D5B18A5C573A03E
          89CE52013D853AD8E14584768AD6FEFB9E182F7C8D826051B5E0549FA0179E21
          FDD66F19492CD2B873E6CE4553731392E994788EC32DAA88E6DB64B0FCE03C00
          9E713FBD03C0D280C16184742A6F05E6F3F9E85D9985041183E8E868C58AC396
          2249AFCFA0C1EC6282D8C2E0D020F2858200053E07CE28CC90378F93E5C6E9B9
          8D3CF093C0A038322EE6E891AB16DB6BA7AF3A0A1FB9F24A911CB4E5073761FF
          440F8AB352B0B837627536AA6430BAE6409F6A5D162366A1F3965CD4885B6CD3
          F11CBF8083773C1DC9F6916868C593877AF10019DC989541A82590AA87884B04
          7C12C901C5C579975DB6F3CDE79C7BC279975C521B99C82F6BCC240FDDFDAFDF
          6DEFE91DFCD5ED3FB9E5A8669FA4085D7B925E370BCE0CE482A81846CA050CD3
          E7B7DF29F00430C46C198D569AEED5A488035D72EDBBF67FF893D79F3776B0E7
          C49D773E70D3EE7B1F417B3A812269A74D5D9D78BE36894222860BDF74018E3B
          FCC83F7BEFC73F72DB6BB5966700E0451C6ECD8ED1177FE0C08E85FBEF79F87B
          7BEFBFFFB4E564C0F1E2246CB70A37C686AB8A05E68ACE34511EBD4858095CB1
          083095A51620D2FFBC3320D16B381C380BA2041D8FB47C853C701F197CD7F828
          7613DDECE504B4B80EA9E08AE6FDBF3FB4355D26F39B637A17E03F3E3FFA8D3C
          55F5C7FF6C6A6A42C7AC0E641B1A445B6B4E5F654367CF3E9D08C4071B331B3E
          0708393EC039016CF0DC055774C9B15D11275875F84A915CA48840A62F7ADC71
          E210C713C6277EAB1582C8809384D79ED5DA8E654B97918EA6132AD6D0D7DD8D
          F1721E0A79458BDE7F1919D647AEB81C27AD3E1AFD0F3C8C6D8F3C821ED32163
          6F12454C15AF4A124C82A1C4D1A037A091CF4BF0009B8771212066C6A9C709DB
          42526BC60881C9BF3DF70CBACD24866ABCBFAFA139AE12E815116BB290258974
          D53BDF79FEBBAFF9C0DDBFEF8EDFF1A35BBFFED37FFEDE07C77BBA6369922E73
          B418528A2912790EE546B1BF388A319D002596100C40E58EEC9C30D59241C792
          85A7FEE2BE75CF1AAA265231B7FCE0CEDB9EF8F5DD670CE6C7CB8DCB170C9E78
          EE9B9E5AB86AC557E6742C187FADD7F60C00BC88239F1BEDF08707CFDEF8BDEF
          7FCBDB73289D21A30CF3E3082A0591FECAD1769E2D1705F84231CE29E48A3A2E
          67E52A3BD6E653852A2271960180F4A566AB62104760682260D75F2DA1AF5CC4
          E0641D13B4A878DE56511159BF6272CDD41CDF577E4891A7C654249FBF374C03
          31F2C22DCDCD2208C81E9F837FACF7D9F0F9C19980636363421A4CFF5D842253
          C1775A4E31D2FBC71E733432A4CDB98519FF3D03064B89C9C99C088086D3CB4E
          742D8EF6D7E7B47760F9F21522634EAB7B0268F6F5F7A2E49267275089AB2156
          129FBEE2F81371F1BBFF0C2536B25FDE87835D3BE1A675E46232CA9C9D57B3D0
          66A7498E04B04C990002D0649BF76AE0F845242A29B4352FC3BD03FB717BDF01
          0C98713AED2C62B2495288CBA687212554AC3DF79C9FFDE0FB375F45E0E7FE67
          B7F1DE5B6FB9E8D1871FBAF9B9071EB452E5BA3C279E21296363D82EA3CFABA0
          4452C8B53D34AAC413E86B99D6CAF9EF7DD7E089279C70EAC5975E3EA2A96A75
          FAB50E3CB4611EDDABEAC2334F1E7B3DD7F60C00FC3747FE89E73B72F9E11B9E
          BDE9FBEF4FF774C3906A24A703D1BC82F7676B64E43619BE27711BA740ECA793
          C026E367FF638B6EB53C97CF47D4B187E3002E37D8986ACA6913252C91518C90
          51ED1A19465FB58E9CCC3D2A39C9449FAA6F09049BF8CFB6B67EFF21FDCEBF7E
          4B40FC6E530DA1E97F2B773E8CB2EB1804A60DBD2E065B46CF6549E0BAAEF8BD
          4D0B9EFF3898AAB661C6B09C3CF9FC39F3902780ECEFEBC7D0D090900DC96442
          04313D37AADDE783250957BBCE6D6FC761871D01DFE5819F40A15CC6E67DFB50
          E34428A2ED0AB121893CAA6E84586626F0B693D6E0BCF3DE82F2E62D78E2FE75
          64DC64E002480978C99B07DCC4934E28A371234D15BA5227302ED3D726549534
          6EDDB9117B0D1F43AE8C9494469BD980F15A5EB42B3BECC4A32B1FFBC4C78E5F
          7BFADA3D7811C753F7DDFD855FFCF0A6EBF73DFD6CB341F7606864142525C488
          EF209B22A9C2CD7FEA2EDE74F145A32BD7BC61D1FBDF7B4DF9C5BC6E2D08786B
          C7B764D97B31CF7F39C70C00FCD6E107BE681AA3CA8A3752F39761FF8EA5234F
          3DF399D17B1F5C6DF677231BF331EE8CD222E72E3A06AA6E14B5AF4A9EE8EC12
          06D1508E30E056DB51308DC7D0F080491E2EE12BB298FF6E87D1E7E990A7E532
          DDEE89490C8CE6315CB331C1033A6396287AF15DD2955045161AEF7523705EF0
          B8FFF521FDCEF7D33EF7378D34F807B224FFE6276164DCA271A61F0504D998D9
          D0A7B53F1BBEC8FF9F6AD02900C0B645609219046B7D0E02363534E298A38E41
          B15AC4DE3D7BA3E017A7DFCA518E3C57143AF4BABCDB205A7DD0DFB535B760D5
          AAC3512780B078EE1F01CE73BB778B24229DC0552B13C5370964535C93EC621E
          E9F8771FBD1A575F7039501AC3969B6EC2C4C43026D3710C25C9ABBB24C3484A
          35909C69899974AE043A3AB1896C1B361CEAC37DDD9D28C5B9EAD120E36F2409
          A060A05E1633104E7FF3D99FFAF6B7BEF3F597B2766EFEA77F6CEDDCD3B9FEFE
          7BD72D2915F3820D8E552B686D6A16BD032FBDE4D289E38E3BF63D6FB9F2CA5F
          BDD8D7AC04419697495C965FB351EC3300F07B0E2FF063B51DFBCEDB7CFBCF7F
          3CFAE003EA526E96591CA705EBA26638B0FD50F4ECB3D9A8E569CFAF8A92512E
          8EF189DE7B5C42C7197E5E10B5A8227DEFF2768FE4892A3CD777314E3FDF569C
          404FBE885A95DB739194E05C01568621C7EAB5A9703F7B7F4744F25FCB830D9D
          1FECADF92B4B0036F038D1FA62B128F4FDF4EFA66304E16F01121B3883033F7F
          7AEB900F66003D3D3D4242F061D1EBB6B5B6615647074C0291C9F109F1BA1C87
          30081C885AA1B7AB1B077A0FA11A70EEBC2CE21FC9C0223AAFA21256C46791A2
          7B758EDE848F5EFD6E2C3C62313A1F7E0CCF3FB3110599A487D50CAE928AB102
          23305189D667663760480970C7A64D98A49FA574030D46021201DB64E86090EE
          F39B2EF9F3E73F7FC3974EEE686B775FEAFD1B3ED01DBB77DDBA6FDCFA8B9BAF
          D9BE7B3BE73DE2D4D5A7E2ACB3CEFED5F1C71F7FC5F1A79CF6AA8F527FA5C70C
          00FCD651F63D29181D4BF7AE7BE0E291E79EFD767DEB16631E79AE98AEA0A0DA
          282824D9823AB87B7B853E5C0EFCB140E7BE7C124FD215D1FD50149C04BCF038
          38E04BA2610777ECB50900DCB881098F27CF0E613FA7F37A36723CDADA41546D
          C6FDF5CA8E785DE9B7B6F242FCA6FFFF6B714C6FED4D7B7E3666F6E66CD0ECF9
          D9A8DB89A64F7FCF00C0BF9FDE2EE4070706F9DFD3F103AE1F48A7D3E2F9A552
          093B77EE14AF379F8081F303780F5D9D4E2C02330383591806B8B3F0C10304A2
          B648F965BE511339FE06C928556CEDA921374F015A641FF3150B171E7502CE7F
          D765A80CF563CB2DB71163F2889991BCE2442C85E400C9AD24BDFEC61CFDBE30
          8A7999145634B6123DA7E7B9751448776CAD57F081CFFC9FBB2EBFE2DD171A99
          86977DB36FBCE1F3CB8D98F5A34422653637355D75C2F1C7EF9BB7682929468F
          488FFA9281E5B53CFEA401A01C040DF4259798CAE7770A456B78FDFAAF6FFDB7
          1F5CDB303A882CB7C272EA22B7BB4432CC511C51E7CD0BAB4CB4D4E6A41B4F86
          CEB5EA7E5D68FE4014F484C2F879AF9A5900A7E238BA8A1ABD4E8E40E2606912
          7B4687D14BBA302F26D944402189269B78A1B9A5E86ACB343D0CA2C2A0D7F87E
          B0F1B3B13210B041B3B1734520D70270F6201B363FF8E7D3C339A673069829F0
          9620971273A090C1819FC75584CC041810782780FF3E49AF358D65FCF7FE14D0
          B88E87D1B1510C8D8F8831DB3CF32F2EC922E7BE4EF7A248861CC4E282516974
          EFD25C666B7263900A12A6873734CDC5F56F7F37E65BEDD8FFB39BB167F00046
          B99EC0D411DA0C16491C1C1F459988D5B2B9ED58D094819F1B47797C0C3DF4F3
          43F4BC45A7AEF5CF3CFFD22FBCE1F24BFEF60FBD3E5F8FE34F1A008A41309BBE
          0C6A959CD6B579F3D5D2CE83D7541E79F878DD1E47BC52C318790A1E4A2927B2
          B4804803F39EB66C928E5750E5D1D0BC7DE7454D300254E1C9040292136DF5F1
          F86A5715DA5234944C5828D3EDDED9DB871D39D2FC04048E1CCDB7E7AE77BE18
          6E1925E970F2881446AD4078379B65802340E0B53DA6B3FCA6F5FEE2C58B0595
          67E3E72D3F366AFE9E8D9D65001B3B537B060CF6F46CEC9C30C419825C4CC415
          83D3AFC97FC7E0C2DFEB64C80C0862F392FE969FE77AAED0FD390211CE6EE4D7
          970910B882CEE02D46BAE73C945327CACEF7C4523538C49E3CBF804A82E30244
          F18B2EDE6836E3E4538FC799E71C0D8BCE79FD5DF721D733282AF27CFA9CFC6C
          33DD4B090D04EC6D2903694E2AA23F1F1E9B40D935B03757A7CF06C131E79C55
          5D78F4E15F597DCEDA7FC87674F8FFD56EC01FF3F1270D007C049EAFF53F78D7
          A7F7DC76EF9753FDA388F92532F482C8DFF735325C3284895A8098C6A99936CF
          E710013F7EB84CDD0391ED4386EF91B3AFD3C38E6AD519007C5D8CD8E6F2DC4A
          42C778B58EEDDDFDD855AD60801BDA189A2866E12C5C8723EF9A024DE7669835
          621A81C8A9D74547190575DF7BDD00808DB283F43957004E670072ED3F0300B3
          01F6E4D39A9EBDFEB47CC866B3226B90C1808B88F6EEDD2BC0623A36309D45C8
          00E04D8FF762C9A145034B3830A81B3ADD0F5FEC2B6A8A0ECF9E0A42CAD19663
          52D211E386A77E054E4A8367546155095CCAA6F87DC9AAA1C9AB61755B1BAEBD
          F4729CB8E2306CBEEB0E3CB37923C2C63831370BC9308E24C915D92923D19A42
          BAB509A66AC2CD79182C55314252E040610CB115CB71CA5BCEFDE1A59FF9DCBB
          FED0EBF435FBCCFFD027F0873A26C2D0901CFBE2C95B7E7669E5DE072ED227B8
          194520AC51A5855E09EB629F9A73EA2BE4225847721A67201277381E478BDA8F
          26D2708AABD0F924FC1900B891A5D80EF40DD17F8E3D5A89984495166E5FBE82
          678649FFBB15D86A040022918087673057E06000170B04A2D2546C934553FE5E
          DA26E0CB3DA60B8156AD5A8559B366BDB013C09D800E1C38203CF9741E00B302
          3ED8A8A77FCECF5FB870A1A0FD9C26CCE9C2D325C4D3CF15DD75781089144900
          DE3D103B10F2D4A0BFFFCFDE77C0D97517579FDB5E7F5B25ADBA2CC95DB601DB
          726F1083B14D0B601C0298140825852440C807210984109290464920C997840F
          12E2104880180708CD0D1B1B5B2E92ACBE5A69A5EDBBAFBFDBBF39F37F6FB512
          EB12B011365CFFD6ABDD7DE5BE7BFF337366FE33E7287989ADBB2DBEA417B65C
          278F7A79A41E0B03789DC9C698833874B472813CCF7C77624B998DCBF2D8B5E2
          60AF3DE74CFCEA752F437BCF5EECFEC62DD84727CE7426653197AC46210A7E8A
          75FD43E81D1C44249F75B63285F1660DFBE59487E5DE9CF5D3D7DF9554A65FFE
          B68FFF1DDB135357C70E9F1EC78F9D0368C471C99640D438B8CFB3C7E7FEEA81
          0F7EE8D52B2BD3B290E650119417871E726D2AE5B47491919092F619F1DF49AC
          DFB9DD47E367EB6BA43DE7960A6690558732D691D55443B6391C429967D586F3
          B4063021AF37ECD7B1EDF0211C6A8698C9D84AB8E905894EED73567D3ED493D8
          42975AAA8DBD3F0C07A0062A11F799CF7C26D6AE5DDB991494731E1ED6221E1D
          0473FEF498EDC82E7A6057219FC78221F902F89C6E0FC1B18FEF161DBBDFBB13
          865D14D2DD9178AC83A952D1D6D280A466E410CC6B9A3020E9D85A3BC6B5CF38
          0D6FBCE1D5C8C9EBDFF1CF9FC58438B3EA600E350A22A41172F21E25B9C24BFB
          06B0B2AF1F3949C7662B0D0CB7031C94CFFF50A58AC1F3CF9EB8FAB5AFFDC892
          F2D23F3FFDFCF37AB3AE37E18923703987FC143E7EEC1CC058D4E8731BB5CDAD
          AF7FE39DDB3EFE4F579C52288957A821A114751C0A0C95882EC6DC66879E1A7E
          D299E24B4D5AC06EBEF88803302AB4B6FE4E734C65FA6DEA9C3D0931F8652786
          A482FAF04D897CED7C56A066050FCFCD60CBD8217522393BA3AC80733008C0D8
          97D3E1BF4F3A536D4F7EE0E936FA6CDAB4091B376E9CAFEAEFDBB74FC93F98BB
          775B80BB064A83EDD600F8C5ED423E8EB93DE9C5D809B8D87B748945F86F720D
          F08BFF268AA003E06B73FB916904FFBD98E3510E032A18749A12DB9CC320E9A2
          DC973EF1BD6B8B2E4A92D2ADEBEFC50DAFBA0E9B9F793A0EDF761776DCF44D71
          F2116696D868D981187D844C33C1B26C2F3696576220DF8BAA208DBDB39398CB
          78D8139084A58DF39E7BCD67AFBCE69A3F3DF9AAE7DE276F9E66ED1FADAAFEFF
          FA7E1FEF13F8611ECD9103990377DC7DF5CC8EAD1F8FBF7BDBD0A9126DEBE313
          088B947D16739328CC5CBB214E5D1B7B38C29B9AA8DF75000AC5D9EE2B0E204E
          2CC3FFA685334E99A6CA481BC33800EEE5AB03E07C3A493F624B196EAD6C1EB1
          6B63561EB3AF368B7DD3D3921ACC614ADEA7E259CA75A7BB02B1692E32772AC1
          911F9E9CC370EB99597AE6FAA79E7AAA1A288D8EADBCDBB76F57E3252AE8466C
          FE8D3B05CCFDF99D86DF4D1168BCAC03707BF058C3EDEE100C0C0C68FAA0453F
          796F3E9F0E40770708F5E58B0882AFC5A2235F8BEFBFE0AC75DACFB34CB35564
          E601E53E783AAB9F899B18CC027D05175937C535279F82979DB319EB96AFC43D
          DFF81A1ED87A1FB26BCAA8592D491B1C58731696B48B589DEDC7C0600FF24B4A
          78706614532D1F551F18996DA2FF59CFAC9D76C5657FB0E9D24BFFF994F3CE3B
          74BCD7F50F72FCD838805DFF7DB35B3978F8B7FD0776FF41DFCE3D18B2AAA84D
          EE45B9B70C9D3B13E898F1C91A1BE92C3E9BEEA24EAEA9D253A999E4D3142036
          12D58996ABA93347461FE30068A7315A3A7862865333CAE1CF862087D48F5E0E
          51A02D83703392AF0A7E1D0B9AD82E88E081CA1CF6340589E4CC4CBBF27133BE
          289FD7635701BA06F9FD1EDDC93F1A5C370D58B66C99BE2ED98108E9F96F1A22
          8D95119B86C9DFD16170C780BF5325233152E6FFDD5D8285078D9C2902BFE834
          F8F76ECF41D7F85968A423219AE83211757B0DF8BAAC4B98D4C16C931EF9FC46
          64431B8C49CAE9A4AA6C94C42DE4C41164E57AAFCD15F196E75E8BEB2FBB1263
          F7DE83BBBFF51534DD1666FA22E4931EE42A2E0A8D045941734B570D62E9B27E
          65FA9DDA378ED9C916F60B4ADC57CC62F9F32EBD29C866DEF0F60FFDE513CED4
          F3C33A7E2C1C406DFFDE2595071FBC6EDF673EF7D74BA72AE8676FBDC042D7A6
          3A4E0C92AC33034F23526645CA34AB945C34F8B4C3E8C3FC3F89E76DB19B0280
          049044000CDA6197924AA0AAED6BB427259612FFA8C33014D62AF14759EFD490
          5BA6B22AA73C170FCC54B0756C12A3A1449B38559D393A1782DCD43748D3EAE4
          C78BE5E0FC1D8DAB0B95693C84CFCCDB55DE5BA07BF7790B736F1A3D9FD385F5
          DD08CB469EA1A121CDEBBB46CDA31B99BB68A06BB8DDB161FE4CC7B073E74E75
          1CC79E2B9D0AB71819FDBBAFD935FC2EECE72E027718F8FEA79C728ABE5F7717
          81834274464C2D4867665057DA6158A2DB6503B5A7CC41A13610B13AC8F7F161
          495E3020E8E0EC0AF08AB32FC035575D8EE9F161DC7BE73731EDCFA0581C40D1
          1244D2E4C056AC2AC8EB97F562D9927E647D49072B94FBAAE39ED919DCEF37D0
          77F6199535E79FFBD6DE956B3EFDCB6F7863134FB1E3C7C201ECBFF9A67FDBFA
          89FF7BDD99A98F7CADAAD1DAE762D3682D0B45A20937D9FC2492A89F682E1964
          3C6DEBA5D153FE2A4EBBD57E5303E82280541C800A79B20598F27AAC4A732B90
          0E80C62A06CFBA00975F3B56CE5CE50224CAA7145491703A94FC56D282593B87
          59DFC2D6D131EC6D54B05F1C442D636B153C6EF8F3FDFA3C1E29D2771DC042F6
          9E6E518DDB743470EED3770D571741E735F99D4E838E827F233467F4E5F3E804
          18ADBB1D820B25BABBE7C3D7E673D908C4F6DFE9CEE8EFC2F7E1F9718B918881
          FFEE3A80EE73892EF85CD60FF89ACB972F573A321EDDE6237E3EBE369100272E
          392DD99D46246AE24421C54F62EDD6CC6A17269BB739365C287AF2DB08A56688
          55725AE72E19C4F927AE453E6C23989E412A30C176B288C9F1972B8B03F05098
          1C437E308F75EB56A2902D62421CC16DFB47B075CF011CECC962A494C7E9E79E
          F7921B3FF92F8FBBCFFF47E578DA3980386A95605B4BC668A6776F71A37B1FFC
          40FD5B5F7FC50A1AB7DCC8A460A1CAC2BCAC07B72D513E72D1B249B325064B5A
          2EF2F95946E586BB7101B7A9D8E8D319B9A78E9C41E3963CB6C3C7C72220DB80
          A3B0D3E06666FF0D4BB5D361EA49740C98F97D629917A3029F2B51C60E62D57D
          CB646860054CC66D3C383581BB66C411081A48F312BD1BA916134D4A42FA6822
          96C854BE3A937C4C3838019FEBE9D15BEBD7EAE0EE58A9A7A47DF6CB960FE939
          1D1A3D8891FD87151D749B7B78D0E8BA7BF6F3E3BEC07C6E3E383838EF0816E6
          E15D6744A32444E717D3086DFA11F4D1DD05A091F3F9DC5EE46B755FBF0BF90F
          8F1DC6A444F566A3A9BCFBCA41289FF5B4D34F47B9AF6C9047142A7169E807D8
          BA759B38B33958143FF13A5B8DA1B91885D853E5A2D8C876EAAF990C64ADA23C
          94629C9212A47338299FE0F235CB704AA90C672A4086D13F2D68ED27CEC9BD91
          F592646BC80482A4E4FD07972DC78EB1693C70701CFBAA2DCCE5F278589CF473
          7EFAE53BDEFC0B6FDC7CF94517D48EB70DFC6F8EA7950398480E9DBCCC5EB933
          0912677A7CE485D54FFDBF0F4FDCFCD5D56BFB7B41718EDE4216D34155727C31
          F040E06E8B220C94E7E2FEBD444D4102011D0021BD6B6BBE6F1C4032BFC83596
          2786828BB01E0E89208DC044147546763B12353AC29B1A63A74B20824895A6CA
          887AEAA83009256D160A058653D1D2CAC195453593CB60B851C3E8F818B6CE4C
          6087F8332AE1A053672037BDA21174A39F11BF349B078E6E83153379AC5ABF0E
          03626C6CB431C33E2E3202B7C954C468CBFD7DF6E97721F662A9C5C2E11F4275
          C2FC2EAAE0D1FDDE4D3116A6197C7C772B91AF4334C16D42427BFE9ECD444424
          84F3FC77773A51D50F8960C401ACDFB011AB56AF53E7C559014E11F2FADE7FFF
          164C4F4CC3CB665498348EA3F9CBCFC48BD78877C46466860845003E7A2CF238
          D530D8E7E08CA1124EC802ABDC0CF20D0759A7479C66414951A2A825F78CACBE
          E4FD9394ACD900E7787757C8CC3C8B1171CEADE5FD98895D5C78DEE578D39B7F
          79F9739EFFEC279CB8F3C93C9E560EA099562F28583D77EEFBE2979E1FDCFCCD
          2F2DDFFF80E56402C492B7E53305D49A35F87972C9092C16A86DB749579DAA03
          600B6F1C46DADDC7EDBA885F946F2672488E0CE21C7100501E7DCBEDEC02249E
          491F3ADA74B452B61191A7DF4E0D1948DA8111DD99FC4417A9C07681F80CA83E
          B9C3DC2C3C0E10F5F6111FA03553C5C3D519DC34731807C396F61AA45D1FD3DD
          26B40CB168B76988FA0003BD3D58BF662D0ACB06D16EB4F40F037D03FAAC9A20
          03DF6F4924EFD5E8CC861D3A836EDAD085DADDFA40B748D775060B8DFAD87DFC
          6E714E4F63018578F7E0EF08EB293642E4C17C9F888168841FA5D16CA22A8E80
          D4645DBD81DEDE7E9C76EA26E52EB43A5AA9611460C7CE9DA8708721615AD0A9
          91E8E8B3EA29EB63AD8E4290E3DAEA302D415325F9F7E65C1F2EEE5B2AC6EFC0
          8EEAA609CB2BC2B2C5B949FA9011075F6023166B23ED489C8220AB621E71B984
          1971160F8D4DE0EE03FB30ECC6A84ADA77E9A5CFC5BBDFF7DE8D679C75FADEE3
          6D07FF9BE369E5000E7DFDEB5621A9BF69E6CB5FF9CBF4A1ADDE802C8062ABA9
          2499114531B8ED47AA6EB2C686265FA4E4668BF93A178044D7801259B20438C5
          CBAD3F85823054DEBAD8755BFEC89E7CDC892E6C068ABB86DE61FE51914A46EB
          D86CAD2D84D53C74130186D433EA200F2B93D549371621D96DA88C3C62707BD9
          41383A863D8D2A0ECBDFDB194F157ED8364035DEBC381CEEE0B1EFA87FF5726C
          3871BD525FFB7E13392FA35F44280D89D23581FA4960AB3176877CD8E8C3AD3E
          1E0BE13D217C9715689E3D481EDFAD331CB5988ED985E816F68E7D1C5F93853D
          22816EE18FBFE32E0BC9431BF506DA729EA118754D1C44180658BB6EB5A0873E
          5508220A989E9EC2DE7DC36808345781D2D0744FCEAF68E7085B1195B8F2AEAD
          D7FAD4C1224ECC67B0BED48F555E0E5ECBCC75DAF2F7D0CDA8E2323518A9D253
          88594B30526336094D6DB385DBF2B24872051C6EB7F05DB96EDFAECFE279BFF2
          86E99FFB85D79D7CE689A73E61CABD3F8CE329EF00FC241A4CD3A49999AD16C6
          6FFEDAEBEA777CED032B26B74BCE16216965D0700DE9854D652ADA3C1979B56D
          D754F7D97CD3B60D75571A9A7C3FD0BF77843468FCA9D9FBD70B66B91D846FE4
          B048F0C9C892F20D34EA773A03AD8E7E3D053DA9E48B0E739FD5A1E750BD7A23
          6B4DE89E38462092FA019EFC9B7AF59C3C94FF69EE6AC539CCA4196CAFCCE19B
          07877596A025103F8E059E3702B6BE60E9D22558BE6135C25CAA112DCB061D1A
          30DB76EB3534DA4DB404B6B61371714111AEE3CEEFE33327A71320D127F371E6
          FC34E8AE08E81379D0902836C23480C540E6FA3C8F58E9C2A0B3004997944490
          585D52A15CDE56AE8086A42B81DFC6D4E424C6C62605F5A5FA983832CD5829DB
          3C25C523FBB04532932046BF5CC615C5224E5DB3061B3D1B4BC3B6CE1470B330
          A2B4A71BA903C845A61DD9D68D4447771228AC42414F8A927A7ACFCC166D265F
          5475E6B9BA8F6FD46770D9DB7EED9D2FFA855FFA63DBCBFE301A369FB0E329EF
          00EA7E6B59FCD0F6767068E2F3B5FFF7F12B0609253928D29C412657923B5C56
          23F4C524347047A692DF14C3F2C9CD275F94EA52682F0E20088D0308AC502BF7
          FCD228DF65F851FD37CBC07A861CA5D9E5BFC34EA6CFCE40B30595E852EAC856
          5B461B20B1EC797E9E4CCC1A406A82158B84E2446287121FEC0A74241548D0E3
          87EA34E64A4589EE12C5E545F64FCFE1FEF129DC27F077824A3E82043CBB8893
          379C80652B97C2301644284A44636FFCCCD424EA64A9916BD06447BDBC479FBB
          4C22B437BF4D4823647E4E83674AC09C9C70FE918CFF07E939E8A2202290EE56
          A3220DF92CAAA8DBC9FDD52984916A0D7884F0AC19CCCC60ECE0A8A4350D0E72
          29977EAAF300196551A2E34B9C045949FDBC30C632D7C199CB96E1844209AB28
          F7A51A853E3C316247673A42155FF55CAB43A69EE8FDB054DF2FAFFC03F934D2
          9A0A158099D279DAA908141CF2FCF7604A1C4766F3E6F6D24B2FB8DE3A65FDCD
          A79CF2ACA74C77E053D601CC85EDD57D5EEEE08E6FDF72527EE7F6FFCEFED74D
          1B0AF561897A05380DEAB3391AFDED28A351254842D3C197988ABEB2FAA41C2F
          11D7209190925D61E2230A8D406768859D5E7F0741C78CED908A3D0573E1EC44
          B5FEB88A2C25AC09B5BA4FCD7972FD2574009691A8B2ADD05CEA2E0D6F6A48BB
          3351A8621596A2064ACF47BA785D79BEFC43FEEE20CBF391E7D73291C0F8028A
          F2D594857FA01DE0C16A1D5BE6E6B063B62A694C1EA5A115185836841583FDE8
          F35CF8B52A9AF5B618BFE4D461436C44D20CA203972A36452D26126528841643
          CF1772EA147A7A7B3537DFBB77AFEEC5776B024FD441C3A7C1D3C1F0B5890688
          408C4499445E2FA342A554E475282926E94743BEA667672425A8EB65E45E7FD6
          CAA294DAE2D4A899E8AA137793167AE5DE94B3165694B2585F9474A3AF8001F9
          9DD3F6E5DAE62527289AFE2A8B2A46B11878AA7A091D415FCDCB52471CBD407D
          A604F92430A91A5180DCEC723EAF0547BB4547E3A8FC5B4552B291952B71D24B
          5FFEFE73AFBAE67D6EA9EF478EFD67B1E329EB00E2D661777AE4F073ADBB1EFC
          44F5B3372E5DD13E08AF270B2B10C36B3B62240E2276DD750B76304494D4AFD3
          AE3DB6F2B2F2ADF03BA71D8051DA92DFB36BCC42C5E072F9D9886DD0505CEE0B
          521488862E8F4FEDC8404EED36EB54FC294FCDE69FC4D62E350312D28E72B5A9
          0B68BC4F4D55DD21A3506A26D92872C9C2212BF56C1F66BF003A94E2744ED942
          419D8542E54211F54C013B662AB873CF7E6CAB547188CEADD483952BD6E064C9
          AF1DF97CA32387C49867512C67E1E4C5A165224537715BF25B2F2F084422AB38
          B672B988B9CAAC189FA7ECC0344A76DEB121873B053F4887E1B147777BB0DB5C
          345F4404148273FC591D011B9B74D02A463D8A341DF3F2391D9EB2B95B42182F
          E7DFEEF468C8DDC672B994EB8B79ACEDE9C5EA7EF91C690385A8228FF535D23B
          6EBF5CFBB20603B211E5C551B22F8082248EF64D588AEA2CD6023A7A898534EE
          2000535AC8E4B39D544E9C8038EC66D0C2E15680BB6B4D942FBB1CBFF6FBEFDD
          34B8E2A46DC7DB461ECFF194750053F77EF37D93FFFAD9772D7D7897787789DC
          8E442A2AAC5498FB1625CF7551E7BC3E29B9135315A6D11A61CE44B7F748C043
          F8ECD80535EA30AA2BAC64DE17D4EACA2CEB8716B51F555042D5773C5FF7DBFC
          988D3E62AC194A5EC922CD5A2AF6E1C1E8C69306DA65BE48BD7716032906AAEA
          3CA98A492A2AA110A5389F3430DB7BBC1BD96CC6D0881361D8265D71E53C3C89
          760DB2068AD3C9B310165070D4151C5AC4A43CF73B87C770EB81510CCBF957C5
          A1F4F52EC5291B4F465E606FA55641B35D07D90853BB2DD72190F72D0B9C15E8
          6A8B21C9426FD4ABC8E6331A7D73D99CEED733FA531ACC887F3C3907530F2281
          EE2E43771B90C6E8C9672F184E53D4499C42079A31EDD716EB2ACCA92231D2B8
          8D1EF974ABC5784FEB1BC07AF95AED6651A42A505C15C337BA00898AAE96E579
          45F06273C43847DD03760B44A11AB9ED18CD04EA24BA4E46BF8AF23E1EB75FD9
          3CC5426B411063DE45DBADA01AFA18AD34B163BC8A1D2D1FCF7AD94BF0DBEFFB
          C0694B97AE7FF878DBC8E3399E320EA012FA43BD5E76FCDE7FFE6B77EDF2F5EF
          CDDFF5EDB727B77D43C05CA486484A68FA6987C62AC6DF16E36FB053474C52BB
          F9106AC1C74FDA663FDDB1758F88D45D6123516817860DCD333D7124448285E5
          2BE08A21A51959346CABA581644BB04960C1A77BA6C167EFF05E4C4E8DE9620A
          E7AAF0C5607AC490F2640E6ACC690AE0C9633D8F4E865D7601B202B58B61AFD6
          246A951ACA12B1987A3405EA967BFA25DF97737623C52D6E92851B523884C948
          884C1AE9A265C9B12DFFB6B34534C5496C9FABE0BFF71FC2CE26B58A243A4A0E
          BB64CD5AAC5EBF11338D1A26A6476581B7E0DA026963713E19C971FD5469BA73
          85ACCA85F7F70F68F59D7BF28CFEECCAA381FEA073068FFB58D0D340BAF0B26D
          8AA60D8F913ED6AE3FF639B0189765F1CF17038D9A78C660191BE4FEAC2EF6A0
          24C8AFD8629A136B74B749E6C3F90E975B9CDC99302986467C0906192AB2331D
          482D5552765455591C005180BC422E16A7C8CD41794EE859A889B31F8B25EA37
          0E624490D79EE9362A690655714C975FF712BCF1D77EA578EAA6739E126DC14F
          0907301D04038E95AEE9F15B072A77DEFDFEDA3FFEC31B9607B392C3CE21ACFB
          02C964D10A140C98E7314FD74A7E2A28407B6D043E5381C797282046C3B65C8E
          EC9A8AA078F61845A7073DC53272450F5E498CBF3C007F680DAC15CB612D5B09
          777005E22583C0DAE5B033193D27C5145D84CE0B69060410D76A08053DB8F2F3
          E19111CCEEDB87F6F66D78F0CE3B91CCCD6279AE809C441B32FD78D9B21608FD
          664B6171A0545C593360E4262A29AE1B0194F89685EBA9A478A48A4216770724
          A23525FAB169A5EC484A2086BC2B0870FBC414B61F9E455590454D8C213B3884
          A1134F444172E1D1916D68D727D05F1AD201A5965CBFDEDE3EF40FF6A350CA6B
          CA422E7F0EF1B00EF04331FA450E2604BCD225C7C873D718EC2927EE9A511F47
          1C173900D6E47A70427F1927F516D0CF1D142DCA32627BDA12CC1A82F119A6C2
          1F2766D4DAD2190B9A77AA03C4AE6D190460A7BA2DEBD896EE03A42AEEEA21C7
          2DC35C1E0DF9FD3E71EA0F4F1EC281CA14A6023937B9F6B15B40431EFBDA5F7E
          C3DE9F7BFD2F9CB6F284B58F4D64F023703C251C008FF6D8C13392BD7BBE38F3
          B1BF3F61E5C404FC25E2A56B2D89A8B68ECD525DA69A253F5F22697AA8E21BAC
          E61326C66CA74D4365F4E1768F97138F9E2FC229885F17C89D4B8B9DED9D403C
          BC2C8C420FDCC23260D912244B56C05EB21A583E8474BD388472115DED3DA3AC
          8323FD01766743A0BBE997A69DC6A00456AB2D30A68968FF011CFCEEFDD8F69D
          BB30BEFF0194E57CB22C44B1385D6FA2A750EEA8F9593A424C3191C48D758720
          239F95332DE40EE41BD141442C428A5194385CD4081014F2182DE6B06DAA8207
          778FE281461313F2BCB0D887DE55CB70E2C62181B2554C1D9ED121A3DE9E01F4
          09E2089310E353E3989D9AC1F4D4B4EE062C6CF4F9E11EE6627202AFE89080D4
          4753957E819C5C8F5EEA0F0A821A12833C518C7F556FBF7C7E395715200DB490
          6A3B19987E484B3FA7998B70CCD6AB2A12396AE86CC4F22C3A0068CD860EC0B2
          CC57561092322289036E484A37DDF671589CF57E89FAFBA7A731CD66B15C56D0
          9A3808411EAFFD85D76D5BBE7AF5CFBDE2E77FF6EEE36D2FFF9B2BFD23754409
          97BBA474296693305E9ACF7913D387F65DEFDFF43FEF4ABFF4E53307232AC4C8
          4D8B1DA5E9A2EA4EA254DD35184E9D0E734F62867658606331CC9605CE8A6DBE
          6C8829132FAB5AEE8EEAF8D9A61B87D2D6F29A96E4D5698FC486D52B60AD5C2D
          0E6015D2A5E200D6AE445AEC47B792CF0AA2DD65EDE9AA6EA6475FD585AA7D5D
          6D1EFD5DE023DCBD15DBBFFE75ECBDF516386363284AF4E6D9A4991272A1A506
          CFC9C43043E8DF60CE21C69851D3E0B60155795C89646EDED5FA4636929FC5F9
          B5E5717531ECC3F219BF307C10B70D0F633A7175DF7A70A08435EB9662A87740
          C94F0A8248D8E2BA7F642F460E1D42D0F23B854BD36B986AC762B2F0032CB288
          BA0223DD365EE3C0D2F94F7CF48AB38E799D74E11FE6A58B1C35C83C775428B1
          26E94F4FD645BFA4562BC4E8360D0E625DA98465CD3A5AAD50053E34A5D3938F
          D5C86DDE4BB62C8BA1A682242CF9995D964EA7DE42A8EF1135A04353C61E00CB
          1475958F8D2DD3F27AB37E0B07679BD8355DC588A457ACB108EE92B4A420C62F
          CEB7BF277ADDCFBFF6E657BCE2FA9F5B75D2893F69047A220E3F4EF24DF8A7F4
          DEB37D6CE6B6BB6E096FBFEDA4818CE4AFB539658065CF7C204EA0158971B8BE
          DCE83672BE405A71E94DC7D2715D9BB2DB92CBE5040D6449BA69990A3BF778D1
          E1DCA7F852DAEBE9E273D81DE8E491164A08972D07860690AE1A82B37A1DB062
          35D225CB64A11517A8EC7425B93B15621CDDE9D7358245A3A876BCA4DA829C8A
          039BBDF76EDCF7A91B116FDF83DE86A5E7EA128EF231691B71968CC47C5A4655
          89C4FB21E790739095F410752F10182A46D268A3CFF7D02CF7624C9C5DCD2BE3
          AECA346ED9B507C3631368B3E165D5122C1F5882A2A420892093EAC4411C1A3F
          A4109639B6951AF4C15D10F3391F5D964CC7954D99B5F3B371205D3932FE36EE
          AE36ED57B60C8A59B810D99DA9F72DD6F7D75E096E05CA133CF1E4031216D696
          CA58D753C2E9AB96A31CB6E089F1979A4DB404EA5B857E39DD8C71C89CC98812
          C33128869C3896A9F9C87D77E57A7AE2E8C913E0DA8648C4B46B5BBA05AAE7CD
          6D61F9AA891319ABCEE2506502C3336D8CB422CCB1EE5314C3777268CB7A597F
          E2C6B937FEF29B7EEB869F7FF5DF1D6F9BF97E8E1F290710A7A9279E589B2882
          A4BA21F6C3BF70FFE3ABCF0AFEFC136BBC351EFC6856093BADB82469B2DC2C89
          689CB00BE3C028EFCA4269B342AF4333897AFB4CC6937B4F2334B2DC2EA7CC6C
          C3D6ABCB322B6F979385CEEABBE479A144CD20934326BB12BE44D6A057DE6B48
          727F410058320827D38B194EBDD5E7B0FA945390E1641C17AAEE6D7BC6C15876
          47D1E7C8455E382083CECF491AE9E421B7B7327450351F63F76EC5D867FE0DB5
          871E10636E2A5AA9BB09DAEC03704C718A8D2F149D6421919CF9A92CE6C00ED5
          B6B855E9B2EE210B9EAF5D4C329814A3D9D90E71DFE131DCB27F370E72F6C191
          54A39D22270E24C7FE07CA9AE733624CA1996064FB32D32B1274C6815EAB4756
          26E844EF79714103A8F2A96981D6A1AAD4D44CD4EFF24CE3641E1AA85FD008EC
          EAEF9542853B1DCA8C1463A9DC8F334BBD38A57709D6168BCAF2E325FC0A512B
          C8354A72CABFE82679D357A1A999A7FBFC0611A4BA1B63A943216958CB745B0A
          52E0EE0C0BBF1C1C7073BD820468D8194CFB92EB93177066065579BF9A3CA42A
          77AAEAB491E4E5FCF279ACDFB8297DDEF3AF7DFD6FFDCEFFF9BFC7DB76BEDFE3
          47CA012C3CEA53C37F1DFCE367DE58D8B2CD4ADD0632E48B971CDF6ED2B317A1
          C3F73AE32D503862BE4FDD3D5F6E6FA82980C78EADD4E03CB67516E4FF19B675
          B241873DEAC5BCF6DB3B3E9F27EFD76E62CC1798D7AA633468604660F130F3BC
          B6AF8BC7CE661192B23A30537364FFB7581014085D9788B2FEF4D371F2A6D3B0
          72D56A6CD8B051C92EC890C32EB76CA770B8F0D02E3740B70ABBA23F8CBE8CF2
          9EBCF7DC376EC5E467FF1395ED0F6BCA636753C9CBAB62188E0A93B279C7EA38
          156E1732CE7A31078C25DF27AC4D22AD82D7BD1415A60EE5A5A809BAB97DCF1E
          DC7D602F76CFC962667F047BE4ED401C90189E189ADF6A2A8D79A80D319E5E2F
          B403C53AC923E700C60764CC3E7E1298BEFC5262304068A6F1CDB36DF3992D1D
          D14DE651019F47C9C49CDCC71EDD4A15E7C4B6DD72192B7A7BB15E529615F206
          459F5C8B6D793C85D402D4734D6404C665A282A02126504E6736C3D12E4F366C
          D9B62152A163CEB1F01BB791C6D4340CB47DDB610392DC47DF29A2D9B67070BA
          89914A0BC3B506B52394B485ACCF7251C5E18B6391B7996B0538E3C24B76DDF8
          C59B4F3EDEB6F2831C3F520E603CAEDA652BBB2C3B3AF233957FFEB70F78F7DC
          9F75B81516B5B44123DB4C557F9DB3E212022532C9D292DFD705F2895F40C36E
          29A30F422E7E818EE49FE7E82FA59FA32C8A8E407B8932FB6501ECB1DA38DC10
          433B3087C989494CB65B38200B629A82BC658900A9E4E8DA31040E1C2807A095
          919C30677245BE762051389668EC087268579BC8B999F9DD8152B9800D1B37E0
          A4134FC445175EA4249BA4CBE6BE370770547E4B603681886F99A9C00C9D0AC9
          4A38C92E39BD3D368AD9AFDD8A439FBF09CD9DDB9063A313B73BC3A0D330632B
          FD38390608A93D3917DA1E774332AC7948F46C7A942593C82EAF1E08E4AF4B0E
          BD6F6A1AF7EE3A80FB05DEEE217D9944B41C91443DD1A61716C01A9C9B9093A2
          5641D48A1E9B939C65949C69A249A2741E5C7529CDE7E7291519B06A208E9786
          A525FACEF3E56DA8F6B3DCF6B02C93C5BA817E6C58BA0C597E367948BE116A7B
          2F33B8D4318DDA7EC6D7E93D27CD6B1726F503783D18D95593493B35D3796294
          7C94418663D7A9A1654A997678AEAC9F148724BF3F24519F85BE59F653889308
          04FD94DA82BED8BC24AF9DEF91F7C9E5305E0B915FBBF6A3DF78E8C15F39DE76
          F3831C3F6A0EC02DEFDAFF6BB39FFE970F0C6CB9CFB3AD8618975CF0C4A55568
          5F7B3DCF0191B6C2FBA815A221C6301BB525EF37F2DBB43E5611B3ECC4A391E6
          48F821F99C58C6E86C13DFDE3B829D4113A3B2DA2A6EA2D96B44B64759ECAD8C
          A55D65CC072960C93682C88F49E56334ECE4F5DB76AC30BC48624F9F545879F8
          F2F7AC9B5327C5CEC058225320E7E44A046BB65A3A7443D65C4ED1B1C1E69A6B
          AEC1D5D75E8393369DAA8C3B6C55E46B9A1A62AAFD0C6EC774982678FB4750FF
          F7FFC4A16F7D0573936318ECEF45535002A39CE566B59BD10461797C14AA9C78
          87924022BB697B6E519E8CC8411E4FA1D259F9E4F70ABCFDE29EEDD8D7AA4AF4
          237D560E5E10A9F1444C4F6CB3C310854714841F6D2559D94E658D6826485415
          F9A8A7998C409C93A37822323DD19D4A3C50941FD7E573387D70086BCABD582A
          CE32A3033D81EA0164233A754FC7B469BC8E7CCEB6032DDCA66EA6835022A500
          71259571B4DF23360EC03128C0094A924214F5672290AA38CA3979FD89465D20
          7F05FBE57BB3988395CB8843E23C4180A58D002BFBFB3024F7B011D4D19635B9
          7FD6473CB4E2A35FDBF6C04F1CC0E339DA499CCDD98E7FECEFEB49920F3067E5
          FCC975E17F6CB972EE6BDFFEB3A199439E1B1F449AE3A867466E42094943964C
          9EE3AF21FC1EB66D4A265793885DAF612E6E89A1B3DE5332302F61AEE7C11743
          1E6DD6B0AD3A85076626B14B5285FD820E827C0931BBFD58BE93D597CC35746D
          B2C59691B424AF518862A50D230476B5CF3CD6A69B243585229BC6C72F3BA335
          275B5000DB7B6D57A2A75F5356E0D4EE1605ADA38A83EC7A5BB3760D9E75F619
          F8A5D7FD229E79E6D958BA748540514FD18395048A6C2887A58C804C779A6368
          DF7413A6050DCC0A84271AB105D21381B01199FBDCCCE32D4132198E34CB7937
          75533CD2A61AE2603E4ED0BE4441073325B61217B1B3DEC2ED237B71FBE14398
          12A71671228E1D9412F9EC4447A13A434E8FB6883ABC7B9D3E7A53E0FCDE9566
          3B46F8235196E48E141A4775E56B9938C7F5E2D8D6974B92E7F7A24C842306E8
          26B19E47C22FFA366EDF6573A6DEA16C280E42C7525E45BACE8C5CBB8C5C2FF6
          4BE8965EC701B0C0C8F429A2F15B65FD447392F6ED9F9D11B85FC1AC18FAA4BC
          D79C209E5065CB249008425C2AEFB741AEF59982DED62CEB472CAF77F79EFD38
          2479E3F92F79F91FBEF3C37FFE3B3F2C1B7A328E1F9A03682571216F3BDFD31D
          554FE28D08274F4F87B77EA1F1814F60A022CB540CC8769B6665B0EF9D6DAF6C
          F0B1B388D9F0233076266D8BD7AEA0D5F2E14B24CE95FA64ADE7D1CC855A1CDA
          5B6F628F44FCFB4647F1A0C0FDB90295796451D522145B8E18795EF78595B197
          5192B3E82C20BA1CCB65218A5187B58444C7409790BE5A162767F675ABB1C310
          3C3135898640C6A473354957A5FDFA91510926ECCC0A9CE5C199FA2E41A7EEB1
          4B782E48BAB1727005DEF2BAB7E0A75FFA720C2CEBD388A68BDEB694C7204DC4
          A85B7312DD25FD78700B0EFCE347D1D8B353CE53D047EA9AE9392AE788F770C2
          96C2FFC066ABAAE4C6B141113462BB33CECA16609FFBEBF2DC20251AF0F0ADC3
          A3F8FAE111EC698BD3CD1710D319B1DE2108C6517584471127ED6E7F2EFCB9B3
          B26878EAD432F67C418E4EDA8A28F09962481CD5FA5219270F2EC1BAC13E89F8
          8CF4B1DE439DAFF00C257BAA52A996722E3275D25169CA87C935694A9A18E64D
          21322B3EAB183B720DD898E577767EA0509FBB3FF54C0FEA6906B39519ECAF4C
          6177B38A196D1367A7654E0BA0E56A8CB218BD2B0E75859CDF4927AE9080D0D6
          DA4179E56AD40656A07CF233BE7DF1E53FF53327FDD485233F2C1B7A328EE39E
          024449E20577DEFAC189BFF9C8AFE5922696B56551874D64726266B644B4909E
          3FD6ADBF50166D5B6EFAE1A90AA69B7590F8BDD50CD014B8991F5822905D7277
          2FC0F0E1317C79640407650D54251F68978C8C971B5AE2D17388EB3E6A9CA717
          A7E0B2B027396EC6CAA2AFA70FABD6AEC68AD52BB172E5526C5C77824E7E914C
          63C5CAE59DB9F50EDF4CA7C967667616758914B5DA0C0E0854DFB5671FF6EEDD
          8FC9A95954AB351DA8E1D051577597E417D4DB23834D8B705B162F852E8BC8E2
          C2F32FC02FBEF9E7B0F9E2E7A077A0C76C54B248D06EC8C94E230DEB86F362EB
          6EB43EF1498C6EFF368272519CDF52D51DE41915254279A1AF2428143225BF00
          5B8C958E94C6D761C973381311125F94E53AF663AFA431F7CFCDE2D6C983D855
          ABC875739015A4D4929C983C7CB1A138D17BD6651EEAFEA44D358CBEBA9A52C3
          900C33FE7C64FAF1085B0F8D9A3B1A4B05B66FC89771CECA355845D561F90C19
          9DDE8A555F31F612CA2B0AB249D4A9727B503516947AC1D214A71890E82546C8
          3A2B7B22A8A7280EA01098365FB2FA72AB9764302D79C25C3DC2E44C0307E626
          311CB404F5883314A7CC89809C5C03128194E5BCFA5D172BC4E10F0DF623278E
          3A6E1AAA746BC58AF4B29F7DE517D69D7BEE2B976E3A23CADA4F6DD1D0E3EA00
          9203FB4F9BD93FFCFAE0BF6E7AC3F25D0F17D21E89BA954879F6B4EA133498C0
          1AEAAB0C0B7331265A0D4CCC365055E2488EAF161065729815A430D568E3C189
          511C9CAD60B744CE7AAE80AA5F9585249120A3C01D5E35442F877A64B1F46C5C
          2E5FAB34029FB2E6649C79CA26AC5DB506E59EB256C7955BAEA352C39974568B
          DDA4C3A09B9AA9FE5872548EB1E6589892C7B4256A36DA0166E66AD8BB6F4469
          AB76EEDCA1641BFC62F4A71350051C81B241D4842D9652B68BDA93DFBBB48C17
          6EBE0837FCE20D38EBC27391E915B82ACECE6ACD88639C43765ADE3790683FB3
          0FAD2FDF0CFF3BF7A341C69E22FB22DA725EDC166BCBC5A545C86B5A26D27377
          804645C662F64C781D09738109C8BA3D6220794C8B81EC9647DE2129C6BDE387
          312D51B42511B711A69ACEB056D145FA3CCCDEBEAD02288E3218188C60F6242C
          DD86E3E399DFF376F23B7BF37AE57C9717F23863ED3AACE1E4A138C29C1FA81C
          38110AB7FFD8E5180A1AE3C7D07988CEF5D69D0F76FD7576129842249DCE22A6
          656E27FDE3E40FB78AB9B3E28BB39B13273AD7A8626CA68AA97A5B3E6B825179
          32A5D94801D72BE94F4FB58E2149E9564B00181234B0D2CDA34E9D084A95AF59
          952E3FFB993BD69D7AEA1F5EF533D77FCE1E187C4AF4FA3FD671DC1C407BFAC0
          45F56FDDF1D9DA176E5A3ED4AE0BBC9A955C37505A66AB96E8D82E7BDF358C64
          0AB24E1DEC955C9E925A0D898AD48B8FEDBCE4BA59C9C75A7868EC1076FB75CC
          84E2A925B21D967421941B68CBCFAD4C035651229A2CD1FE868593972C93287B
          3E363FEF32AC3E75238AB9B2C0BDAC9930D308960ADA704CBC526A6FB2D5240A
          5D8DCCC7111E105BE1AFA4271CD0210A651F408728D48C1D1B0E7D4ED4DD73CF
          3DF8EA57BFAA0A3B24DCF0E3A6380159B002C393BAA3DDEF89389E526F88D3BD
          3C2E3AE534DCF0EB6FC2FAF3CF84539FD5DD88A45E5705A34072504B167272C7
          1D98B8E35B68B2372D0734AD0A7C1282C40581C73D70E57BACF420B6D6312CD7
          6C9FA65641CF2D69B79578842B21CC4A7A25D77A4ECE615B63067708A27968BA
          8ED128D1886E251DA6E32EADC17CD7A3F9C1B0201F59556435EACA767190B94F
          1CF2929E019C23A86BA5DCE71CDBA07995C98BA0CA9E8EF62E249DB169F60230
          BDB1589B49D3797215F3652A9F8D8C3860710859B683C76CFE256129272A05E9
          91023D0A704852C5D1FA1C26EB5571BE912A3AB5E4FDAB791715166E6599F5B2
          3D5CFEBE5A1CE6E9A79E8492CF1D891CE6C481D47AB2B3975D73F5DFBCE01DEF
          78D771B6D727FC382E0E20DDB37DD3A1EFDEF1F5E40B5F5AB6526E4CD010E35F
          B1049640B344B0A1D3080DF5964EC992D8AF2C113EC28323FB501378DB10A816
          947B10F50E62EBA1496C397810FB05198CCB32DD28117D55B68C3B470E484E4F
          8BF0E1442D2CCFE4F19CD39F85179E793E36AD5B8FC153D7A3BDB28C6AD151F1
          8E9823B8CA226B8C8174DFFC77C07E621D0D754D7B2C77093A73E3BAE9A08C39
          9DFE72CB74B475E1B191BB72741CB9BB0D45065E3A80FFFAAF2FE25BB7FF0FDA
          E2A01AB384BE25649C224A4B7A71C2E675D8FDC07751383C87979E76365EFF2B
          6FC68A67AE56A151AB5183DBAC40D54C52D61342D4EEBD0393F7DCA992640DA7
          2AAE409C6750463EE8335B63AA4B9068CF84E6DF2AA145E719EB16AB15B5553D
          8772E89C9DF0B90558CCE2A01FE19E8939FCD7EE11C99B4DDF42D069125C2859
          687A8098B064B56E9112153BE210DB05265C189007AE747338696008272D5F87
          B568C8DFAA4AC3AE1C8A2455B5ADCE77A3C4C4C3D52E4074D4960CD12A87A05C
          C75419B95DD9F222DDF1C904D0EDC0589C7EC0FE054101D302DB87C561EE12E7
          7BC86F8103D1057172AE389C96CF390A0B3981F9EC3D20755A589BD33983679D
          7C92A0BD1CA6DA09CEBCE0E2EA69D75E7AED652FB9EEB6E36DAC4FC6F1432C02
          86A5BCEDD51BDB766C0CB63C706BFB5F3EB96230471AE86925B7F4B85859F516
          1440661C47561A53FF30CBC25E1E7B262730323E26BF6385D743ADAF17C372CB
          BFB56B2FF634EA9893C53020C8E0D415CB70E5339F81EFD6A6F18D6D3B51AF36
          B16CF9323CFF0557E325D7BD0CAB2402E528EE4912481B4ABA116BC390DBD9A7
          8EB542ADB18B066E9B9661720430A4AB6E9F858E9CB5316C63F0DD6AFF915C57
          19662C937A2CD4D423FCAF54AAB8E3CEBBF1E9CF7C120F3FB84D598A4F3DED54
          BCF0E52FC09DF76CC5376FFE3C92B08562C6C3AA620FDEF3FA5FC265973E1B59
          F93C693407DB9B43D2AACB052A092A68A3BEE50E1CD8B70D81DBD01CBCD492DC
          B55142A520A88AB3F076A8CA4488F3CA7BEF885322C4263F02472653B21FABF1
          192D321AB52FF87B5C52933BA6AA78607A1A07057D4D0ABA884B86C0D3E11669
          93529CEC841C441815746F3FB4051D67241D495A2031EB19BD796CEE5F8A53BC
          5E949AA972307240CA618AA0A22AF6FCD6A76E416AF1139AEF6752D321C89E04
          937444AABCEC70E047CED7F549F11E23C71D91ACA47C194184818F7D8904847A
          13E3B32D444916CD86187FBE84B9681C96D74629A1347B8AC1520969B38132E5
          C8D9685D7070D5051763BFA46983975C72CBD5D7BCF8DD1BCF7DD62DC7DB509F
          ACE30975009156C852D7B5EDA30A23519C7869929E5041FBCCF4F6DB7ED7FFAB
          7F7CC60A4BF2D4E0102CF1C8A90E7A65B5D2ABFC79A9E9E56E07367CB9A1E3E3
          B3D82A1078DC8D51928816E51DEC6E46F8F6D82C1E98ADA12A50315B2EA22039
          DC09590F4B8B795CFCB29FC654AE88D96A0B575C7A09CE387313DC8C67C63BF5
          AC8E9EDA31437C1DE3D67F5BF386AE6CB03CB3D4D0CE5A5D07D0F9DBC2B6DF85
          175609262DFBC8EF3A4E803505F604F051872575F9F27F7F19BB77EFC69AD5AB
          71D7DDDFC183DFDD8226D57049A91DF91890173B6B6010BFFA9CE7E3B93F732D
          72F23BAB31A705BDD867A15490C0A143987CE8AB383077488C7139F2612F5A41
          8886DB9234430C4CAE3727E1981A3851AF44CAA8235F62B6D8A813C08F6C0A6E
          728D243D607765C3A58C760987259A6ED9BF1FDBA6275191EB3F49D14ECB322D
          D724E5400F58B1B3930025AB8E921760A9E424270E2DC3C69E1E0C79AEE4FE12
          EDFD36E2EE60407A649B74E197D62ABA0C8B9EA7D7CE4CF119E74A1416468683
          D1F52471CA8A110BA221FFC361BF2901611A7BFC060E8AB36CA948A8A0A1288B
          A56E591E338EB4D046BE90475F8F5C2371C46B970C21AD36D09A9C4628EF77F2
          3967CFBEE28D6FF8D6052FBAE63ACBCB45781A1F4F2A026825497FDEB6672713
          FF39D938BA38F7956F9CEEDFF4E59FC9CF4DCB8293FCD70B9540830D3E8EE718
          D10C74F8F3653532D797EC1D5BB63C2CD13E4063791F3C89060724A7BB6F7446
          9DC024ABDDE2249837F6B3C014B4D0E7D9D870EE3978EEAB5E8373CEBBA833A4
          631468BAEAB7DF73211619D839CAC871743FFFB17F5BECF5163EA6AB9F67AB92
          703C4F97DDE5C6E3ECFDDFFFFDDFE3339FF90C9A9226B0DD2D106791E1F00E79
          F3C450FB068BF8FD6BAFC7D5CFBD0CDECC9432FBB892E2A0C5281EC01FDB8D89
          AD0FA1DE966B98ED23510E7CC9F99D8C833025451DFB1C0A12F97A041574EBFA
          91F63F90159907D98BBA0E8088214AE4FA4AB44C04891D1618BD757A02DF397C
          18A3F2ECBA636A31DCAAB4E531798154A5D8C7124111272E915C7FE909E82F16
          901154E72481A62BE463B0C3B443AD8E459CA735FF2D112468650DDCF7425380
          65913051D2D64E8B714EDC8057C06C33C474B52D0E701A238D194C92F159AE77
          A6D80B951C90AF922DE9016A58BE61081B4FDA78EF0DAF7AD55FDC7EDBEDAFD9
          FEC0B6E7ECDBB1C35DB57C39962E1BBAE5CAAB9EFFC7D7FDFA6F7CE9C9B48D1F
          95E3494F01A693564FE6C08167D7EFBDED633D5FF8C6F2FCE418FC021B525CED
          A2D32DAA4A0519C1E5A91B180D3ECEC18BE7AE4631C666EBAAC13695CB604A0C
          E050AB86FBA7267160264445A26B94EB510247352431A23E81B5CF3C693D7EE5
          ED6FC79AD3CED0A8CFD659E6F08B69DAE945B0ACA386748E15BB78BC0E60A113
          59EC315DBE7DA6005DC65D9E77577C83241C37DF7C33FEE9139FD0F664E5ADF3
          1C339E2AC6905D52C2C96D0F1F7CCE4BB0F9D967235F9D03DA7558CD8AE4BDA1
          D608EC3D233834BC15B31E8B917D4A8041F20B3F6D1A0EC334274EA064B6EEE9
          70F57AC74A67A6E708235D9692744407AA240F8F04824BFAD3CEC93D91F3DDD3
          6A61BB44CE91B91A76CFCC60465EBF289F71505EF50C412AA70D2EC5AA721F86
          C8CB48DD430A9AD0D148426F655D2DDA6985F4D8FBD04158643AD1C2ABD38295
          6F719408B976C114F9E4CBE7386E4E60BD3C7422AA63BCE563B4D6C45CC3C75C
          5D22B93899800ACB8E8346439C67A9579BACB8CB72F269A74C5CFDE217FDF9B9
          679FF517173DE7F969DAAA277FF3E10F5F3459ADBC73F5096B872FBFE8923F59
          B176DD819EDE81A775E49FBFE64FC68BB6B4779754EE76BD3ABEEBDD53FF70E3
          7BCA77DF690D3A14E0682809A7D7284A78CAC84D7275715BA8CAEFDBE0CE1499
          F5D8A93759A961CBEE7D9890C8522B14B15B16C277A6C7B047224A48BE3E268A
          92FB39247FE00D6EB670FE3967E037DEFC3A9C7AFA19AA0C1B4964A31496518F
          09340ACF7FF84730F0C5FECEEF0B452E8FFDDB62CFEDFEADFBB5505D87FFA6E1
          779578D824C45E01CA6B7DEEF3FF890FFFE587C4094C1923E5B472398B3E3B8B
          423BC2C5857EFCEE8B5F8613D72F45666E06BE35A95298689760B75B98DD7E37
          C66A55B4FB8790D4D8CECB3666322245460C154576C89ABEFDC4E81AA86C5967
          9B4FB7E0484F4ABAB1D054D8397FD1E2969A38DB40522BCEC41F989CC5CED1C3
          A81772125D6331FA1C56160A582E5197EDBEDC3B4F9478D5E822B285D7720D4B
          4F57B4030B1CAE72F1A5B64EF22981AAD79455D450A493094A92BAB89A2A92C7
          714CEEE5285584C5098EB57D4C47A97240103DDA8278DA1EA9DD9866B968B525
          4D9294EB9537BC72E4F44DA7BFE9E77FF1D77E2CA2FBE3399E540410EEDEF6B3
          CD9BBEF2A9F6FF7CDD1AC81087B564817202AB24DEBDA8DB7520DF1C3B48C8C3
          CFE10B56A0B9AF2D0BE2E1BDC3D83E3583EAC052B4DD12EE3E7800DBED36F60B
          14753D817392026404FE91AC3397CBA39C2FE03DEF7927CE3FEF998882587712
          82A4ADFBF4DC23EE4A5A1F6BAC8BC1F82E02E81AF1FC055B60D08BFDFED8C71C
          FB1EDDDFF15CE808BA5A7A5DAD3D430D16E1739FF9777CF0837FA68EA25A9794
          40A2EF2A3F2BD09E1D8D4DBCC0EBC5FB5FF14A2C5B5E803577101947D0D3ACC0
          EC9238D66A0D0777EDC214373804F2AB6457D2D2EA3C9572E334A7FBE5DCC6A0
          5333A8AB3BCB9F6A959FC61A5B06AA87241E513DC144774BBA94D9419CEAF051
          DB213741AC5D88A4D9D6CF4474C6C2AA12B35AC63061D88F49CE82A3EE4147A6
          3C6346BCADC4A8FF44E401B25B2A8094D805796FF9EC8200A625D71FA9D43132
          358DA95A1D6CE4F629E3617B8A2CC8FE48F250379F8593CDA1D037507DC9CB7F
          FA9FAE7FD5CFFED6FA0DA738192FFBB4D8C37F228E27CD01C4B363CFA8FCC74D
          5FB3FEFD0B83BD031275C94B4F3AED962C14710011A35222B74D12555B79DA24
          D70C129D636F09E49D0B9BB86BEB561C960531B66C096A0D1BF7EDD98F07E576
          07ECD5CF97D0AC34B5573E2FC6DFD7D78FDF7CD35B70D50B7E4A893F33122DA3
          905B3DA68DD5C611235FE800BA867A2CF4EF1E0B1DC042B4B0F0790BFF76ACF1
          77FF7EAC23E93E67E1D17D6C2850358C7C7CEEB39FC35F09122069288B902B90
          47256FA12291715510E1F7369C8D1B9EF76C78ED69B9E05362B50299BDB25C9F
          1266C70EA37A7004B57CAFCA93A5543FB65B46EC2415C34833471C40C709B0EE
          426112A533488D84390D370803FD4E0AF32EF559DC19BEA21F091C3234A5DAB2
          CD022EFFC61D054A9C1855255B0BBCCAF2C3AD3D8A71A4C9C20F6EB649C985C8
          9FE944E2485F8BCD5756DE43455E73ACD1C0C1460BA3F51626EB3E666A3EDA24
          72C990E0B48C925B500D81C8A5788791805F7FC619EDE7BFF845BFF52BBFF9D6
          0FF3A5FD4092874CAEFD641BD653E5F8BE1CC068DA582B777472955D5C54FC20
          D8BDFD95E9B6873FD8FAC71B5796ADB6C27E9258F00687B270E9A91D5D38814E
          5CB14093C4AEEEA90702791BE2BD0F55E670DBD6073133B414FBC5D8F78CCE61
          78720E934A8669AB8007574B4EA01D8938DEFCE637E3152F7A2932850C6ACDBA
          C0EB9C597C5672442172B10B603DF22558CCA88F8DF28FE500787423FBC2E776
          7F7FEC6BE8EF3A4CB8F55A031FFEAB0FE333FF7A2322DF47569C64DB8BD1CAC7
          C836225C6917F1AE7336E39C334F946B382BD7650A992887D01AD43DEEE92D0F
          602A5B4483AC4316E7E003CDB349EF615B061928FCE7F666872C3356759ECEB9
          B3682ADFE2C0EF106D38DA11C8B6A0D4D5F2A1B223AB200A237EDAED8988B56A
          1F49E866C53F3154BEDA9E4CA10D8F05417D0C3A2C423AA4609C74A2BB498658
          459EEF53CC541CC6E1E60CF64ABAB357D2BC313F455DC554A14ABE25B9FF4579
          DD0CC953041DA290C5B235ABC72EBDF4B2DBAEBEEAEA3FBEE485D7DC733C8CEB
          A9703CA108602289CE2F4C4D6E6EFFD367DF9DDD72FF32A73101CFEAF0B395FB
          91487E6AF94D31F490DDA33A6EAAAC3391A7433ECC0D9B710BAD6C065B470FE0
          9ED1BD985AB11C3B05F63DB46F0CD392CBB1B21B4AAAC0F8E279AE0A5EBEF085
          D7E0B77FFBB751CC185EB816BBDB04FA8571DC29341BDEBE472B002E86001633
          FCC74200C73EE6D8F7793C079FDE6CB5512AF5E281FBEFC75B7FF3377060DF3E
          3548E6D3AA22245F27F6957095E4BEEF7AFE55185A2AB971B01F3926EAE910E2
          520995EDBB71300A51CBC6DA0C94650D44C94C380B5FECD4358C03483B0E4047
          AA9D8E88098CB2711A76C55054BD44E1BD364E75DAFE948D898CBB1D061E223A
          C6FA90AFAF3B7A368ED001D9EA8C2C9D4DECCE11750A8F1CD8E1D41ED305590F
          4D49E10ECA3DDC4709B4B1094C0A2AAA645D34C4393015604D351F16C1594DB2
          FB78921EB1C8F8D257BE7278D3B967BFFDFAD7DCF0EF3F1C337AEA1E4FA803A8
          DDFFC02F56FEE76BEF29DFFFF0AA72755AE07C036E8E39AA99244B52C9116D56
          75FD4E4B07F7E5335A99A6F80609179A02FD5BF91CEEDCF9B0187E0D233DBDB8
          6FAE85870F4EAA90077BF4B9E5653AED6CAC5F7F027EE777DE8933CF3A5310B0
          AFF3F52DB2F868745B4038794C149EBF008F62948B45F4639DC2A33980C55EEB
          711D027F495FA522A6B2CAFFF6E31FC3DFFDEDC714DE52F0B35FBCE7346B26AB
          F3D834D1C4BB4E3F032FBEFC0CC4D503B02B62E4F610FC7C19D1A169EC9C1B47
          D89B556A74B7CD1661492F2862EA1C4100496C044894A0C73652678CF4EA0CF9
          77F62E9098855C63BC676C5D4EC46993683435FA87CAF2931A29F05867F42D2D
          2A1AE622F65719B2132D2B789DAE49EDE777CC4C81ED2A892779FA92660D33D3
          3302F743EC1127C009C51981FE514650646F090D452C0EE10AB255A8D291D723
          69E0F241FCEC0DAFFEE22FBCEE75AFE95B365879826DE569797C5F0E2089EB1E
          DB630594AEF1807DAE6DA7ADC33BFE8F7DE357DF8B2F7FCD0D872CB87E05B644
          314BF232C7372496B049CF2D50D50E8C64779255ED3D1D56093B3A70F29B9A44
          F9DB76EC909B9F6257A6803B46673053F7956C820CB895FA6C674FDDC2AB5EF5
          2ABCFEF5BF28B9A2AB90D2325D3A6C3E326DAF8B6CCD7DCF4538069A3F52D1EF
          D89F1F2DC22FDC46ECFEFDD82DC3473A1CCDC9CD408D2B286778DF6EBCE36D6F
          C57DF29D13906B6A124583160E0CC6E817E37B697610EF7DFEF3B11475351E47
          9C6A9C2F209CAA62C7E44104E5BCE6C399B699AD67076064658FDCCF8EA74C55
          D62C3D7A6FBEABDA4B04A0D4631D38CF744069FDD85AEC21AB24AC86373060C9
          873C0BB6290832DF7754263D31C33B6ED0D98254E544DDD1B198B2B939CC840D
          8CD60E63647A4A72FE04B3761E934ABCE2C12BE630D76AA8AC5BB95046B3DA44
          3E264B938713CF39AB7DC11597BDFFB5AF7DED9F9CB061BD8F9F1C8FEBF8FE1C
          40525F238B735D1BF9874AB63DD7DE7AEF86D63DDFF94EFE0B370D7AA9AF6418
          56DE56465B92C191A537DBF674D8873B01118C0348A8E8AABD681DC516897C91
          2C1EF22ADFB6630F76C51E763A79DCB67F0281E05E8FD1C109240298093C16A7
          7EFDD7DF8257BFFA55BA9D65CD4FA8D84711541F4DCEBDC84538C6A88FDD2958
          CCF81F2DA22FACEC1F6BF48F8620E60B86067C775F0C71D8C6DF7CE443F8C8BF
          DF8848529BBEF116960B2C3F946DA39603CE8AF3F8DBCB5E88CD4B7AE4E64CCB
          352797420EADA91AF6CE8CA291CB4ABE6C2113B2022FCE45AC90842169679AC7
          9AAF91744079DAFD5CD6822D4272EA730BB5D39CDFC9DDF515C4E1B0679F3B3A
          7C3C1D0C59B7548AABD3244DF6624EFB919537424B9D83E5B99A2690A6D397AF
          A956881D7353D8DE9CC6541AE9366E1878284BFA18369A68FA6DADF170CB976F
          DF6E47185A3684CB9EF7BC2D2FBEFEBAF79D7FC5733E7B3C8CE8A97C7C5F0EA0
          9584546CF2B3B617A4871F7E65F09D07FE28F9E467D779396EF589F15723F5E8
          7EAB8EAC271E5E8CD62545546C72BD283533E3AADBC74115DE687A7231E22003
          4CC9A2B8551CC06E490DEE979574CFA18A46749684426EFA485A41685C2CE6F1
          FBEFF97D5C76D965F2736066C6F50CED051FEF911DC0B14CBD8F66D4C71AEEE3
          81F48BF5182CAC0F3C521761C7ACE6C75F5D89DAF7DD73177EF5DDEFC1742D44
          3C5347491CA92F91D4CF5858D64AF1A1B32FC68B379C28CF9C12236B493E459E
          C210FB678731E779E2405D64025BA371AC053C438482F97732D74D997D74F2CE
          3802AD3774983BAD745EF9649E901438228B1047B1165D5531890ECD3EE24B78
          EF3DC9203CEECCC89A48C95528E7312BCE6DDA8F31566D61746216D3821AC725
          4DE14092470151D2798BA3083891C8E125B657B3D6637B38FBEC73E79E7DD595
          1F7AC1352F78FFF2934EFD49D4FF3E8E475DC18792E4CC5E60B868DBB585BF9F
          4BE2957DB6732819DFF5F2A9CF7FFED385BBEE75AD7603B9862C15C17AB1E49F
          4E2010B1250BD19134206EC84A300C912C1E059D4E50D5EB55FE395B1D009B45
          7C2FD5CEB25B76ECC6C31259EEAA45D8560D0D977C5893D78F74DB8A8BEEDC73
          CF1507F07B58B17C85A001BF63EAD602E189053CD58F75211E476BEFB1C6FB58
          0E602102E8A282474A21161E7147B3AEEBBAB2D4009C9AC45BDFFA2EDC75DF0E
          541341505643877C9D9C8B1EB9A0BFB7E124BCEEB4D3247F9FD30ABB8322FC30
          C5C8DC8844534BEB2D990E49063BF2740037493B4EB33B1D6199612898797BD3
          974F286F7764D0BA8EA16BD9DDF34FD47144A441B3BA31DFD2D65D03326C153F
          E5E095D67D49C9264E60B659C1BE8971ECAFD631D210474016A02CA7403308DB
          924A8843E1AE07B23672AC59B0A5991396826E9EFD9C2BEF7AFD1BDEF4F6B3CE
          3BFFD627D3409EEEC7A3AEE099241994803C23303F8D92C4915C5FEB35B5245A
          E31D3C7056EDD3377EACF0D07757E7923AA2C0D7997AB6AD5996E473CD403BBB
          04A8C9026A9A748019814A76D19BDB863946A01E9D027BCEC9DB1FD201C8F36E
          797817765A797C55A2FF08F572D81BDEAE9A02157BCB6521FCD44FFD147EF777
          7F77DED07E5009AB8545BFA32ED23129C0233D6EE1E317EB324C749EFEB19D07
          A722496AC94FE3DB0EF272BD8AB539FCE9BBDF8FFFFCE66D18490430BBE4F40F
          517362D5CF7B7D6929DEFBAC67C0CBD695D6CA0B2505906879B03A83B1C037DB
          6FBEE12D08C50150CB4019BA121B8ED511F6E8CC01E8F91E35A063CFB3FBA2F3
          D7853C872AE461B37AE36B0D80DB856C107063BBC39ED06108721DEDF4ACC81A
          99693571684A8C7F7C0AA37E802931EEA8E0A944574660A08A96922CB59CC15C
          B386FEFE41D424E53BE51967F9D7BDEA55FF79EAA64DAFD97CC1C54F69369E1F
          85E371A70012751DA7E3001A5BEF7D5374DBB7DFE7FDCFAD034EB18928ACC29B
          F161F7F7216E72FACA5484ADC4D79E72EE1B33F74C34FF4B3ABCAD962A6227DA
          252E0E20B275222D12483B0DE300B6450EBE39D5C270E81AB659E6B6EC59972F
          56FB2FBFFC72FCCEEF3C7E4EC6472AD43DD2DF17FBF9F13889C5760FBAC33F8F
          E53CF4BC2C5BA5C41964D9F49497D4A8A751C5BFFCF9DFE0135FB8090F0535B8
          0557B7F59A9C8F97C75C9BE4F0B18B2F466FC934EDB871063531A6B15A05E341
          5B5E8B8F4FF5CA875EACD2E28EE6F5462433E93880EF591EA975F4CF3832C3D3
          AD1DF0B791CDAE00C348EC91BD97DBBA724E74F691E748BEE8A061A72AB3B577
          AE8E3D8268269B75D443711B82F89A5E46507D56A5C01AB34D09FA59F882080A
          FD4584021B72BD7DE9739E7BE5EEABAEBDE6F79E7DED0B3FFD6418C38FE3F198
          0EA092242F88D3E4EE01C71DE7CFC9DD0F179BDFB9EB01F7B69B3638E4DAABCE
          A930A7569069C444002967C4D86C45076D6B01892D9A6C7F559E59DBC869D101
          D0FC19B142894EA1E483695EA283FCFD1B5B77E021818177B76CECA885CAF746
          418844054122E5D6BFF2CA2BF18E77BC43CFB3DBE6CBE3D802DE62F977F7718B
          3DA77B2CD604746C047F3C8D40DDA38B001E2B0520ECE68E08232EDB690B8278
          06250A7EFD1337E2037FF70FB82F21718A854C3B5228CD56E80B25BFFFD42597
          63A81CEB782FFBE6C9663359AF635A47676D64C3441D809FE1FCB5273E559C40
          E2CCB3FA1A2153B32CE6CF4CCB275D3AAEF98B7ACCF95BDAD3A18C4392ABBBED
          54508BA41C6E8FF2F0B18B6F5A62C748630E7B260FE321BF81C351CBF0315082
          2FA67A53419B7A8256A85FE4092894E5675943E5A5FD73973CF7CABFFDB38F7E
          F41DC7CD529EA6C7633A80B92439C1937B54B4EDDDC9F09E15ADDBB6DC18FCC7
          CD97968BB3D04DA08681B6E4CBE74DB794ABD937ADBF71A8DD5CDC32E25088B6
          9C76A3BFB2EF7404A7586C92C599481E1F6524377433B87DE71E6CA9F9B8A76D
          E3A18A6FE8A1125F5306EACCD0D8AEBEFA6ABCFBDDEF36EDAC14005D90062CDA
          61B7489BEEE32DE42DE608160E083D92F12FFCF7B129C0233B0068AEAE62A702
          D50B725D069B33B8E5D39FC3EFFFF5C771BF727B4BAE5C0F90B07F5EFE3B4F8C
          EE13175D82A19E58BB243D414F5557D054B385E990ECB88200222DD5A39DA1B3
          A4302A19760DDB6EB719878D3898AFA318A623CCCFE1CF7F2823CED2FD5C8A1E
          AC4E1B2F9D97ADA9452C295C435E68948A4B9519EC989AC0E17A0D2365A04E11
          1FB9FB05F102055F529628032F539614D1D686A0BADF46BEA7842BAE7CF6DC92
          C1FE77BCF7AFFEE26F8FB7B13C1D8FC7950224F566DFD88EFB2E28DFB5F5E3DE
          77B6ACB51AE3F02846D912535E32889640D14253FEED87A46935CC39BE6F1A3F
          28A11C9BADA4B853FDE7408A525E77F698B5079D135BE23062818A739902B68C
          8EE18EC353B84B1CCCB646A40B346B716B88032D6652F3A28B2EC21FFDD11FCD
          0FD5CC7FA84788F08B19E7A3D50D169BF87BBC23C28BF5F91FFBFC4774001D46
          21F6D3B156520A5BE89D1DC3973E7D23FEF01F3E859DECA463D79B5CFF289713
          637470B95CFFBF3EEF7CF4F5CAEF48B219B063CEC68CE4FF9528D23C9F74DB64
          5A6E655824CC18E5646DF1ED28F92AD9BE633E4F97832FED90811EB55ACC4463
          7705998E415B39FAD34C16714EF276493BF6379B189D9DC348AD86E14A1DE364
          2ECE8853284668094A24CA2944CCF95D6424FADB5EDE88B188E33AF3FCCD78E9
          75AFF8E455D75CF35B7D4B07C78EAF993C7D8FC7740051127BF1F0AE17CC7EEA
          3FFFB4F4E0F68D055424EA3460BB39ADDE936A133536FCA4687B213212F939CD
          6571223836FBCA9118B68E83EA58A865E49B646193F833E928B3C62D591096C9
          17ABD922B64F57F1F53DC3B8B31663470015DDC82B6555825ADCD41460707010
          1FFDE847F5BB3A9245AAFE568796BAABD2BB58744E8F84B67921CF6E4391D5A1
          F5320F4CE7E1EF13E1001EE960938C125FA803B05016B85C1C3F80BFFBF047F1
          C9AF7F137B584949A1EAC02D9DC4B3F1DC46883F3EE71C144B81528EE75AA4D1
          72311B05A8A786E22C43F973C9D58900380CD4450006F777C433384563991A8E
          6DBA83F46B6129C0B20CDF61974129E9E812A6F22E4D39970931EEE1EA14BE5B
          9B150750C5AC78FD9A389CC8CE4940C80AE4AF4BCA57570AAE2C3FA7F2100A42
          29F468C078DE8BAE1DBEF08A2BDEF9F257DFF0935CFF493E1ED30124A3FBD64D
          FECFCDBBFB77ED709DF17158339388F334FC9C4A63D99AF3C73ACEAB7B3C41CB
          BC2C955E393A1A5A2A02E15B817C25DC13D0A89674E4B1591F20EB6B1C567577
          89449E41A61FA312D1BEF2E056DC576FE28ED8879B78E897C551CD8468C8A22E
          178A4A87F5D18F7C04276F3A1D411ACFB7B65A5A2F4875EFD9EDC45253B8FA5E
          D89D5A47BA04B4DE6D759A89B4D7D89EFF3DF5E3B5FFC55E7CDAEF918C7FB186
          9FC59A8DBA7F4B3B46958D1DAD8DB49D584529B2FB0FE303BFF7FBF8AF3DF761
          8CADBC029BAD529F20A2003D710B2F94C8FAF64D67A12459735B22BD45AE3C31
          52DD32A473ECECDCE956BEFA1E33FDC7C86D6931D08C4CEB8E8A65F403B4FF5F
          493E5DADE6A74A1A6278FB3DCB86690C7434ADCBC5594C4A3A72A055C381B183
          D83E398A07221B1571DAADB2A09442099120B99CFC2E335753F14F722A4AE24F
          FE0838F922B2034B5ACFBAF8922FDD70C30DEFBCFCD957EC3CDEC6F1E3703CAA
          03F0E3B018DFF6ED3F0EF76EFFE59278F3E8D0B0246F93F0C625FFB74BDA8CA1
          AB2AE6BE745B873C9CA82324197673464B5969422BD529343A00558A25EC8C12
          9801328E7FB675710602057D79ED969BC737B66DC71D7373F84A7546F9ED7BDD
          0C6A695B21622A2943D6F1F0965FFD55BCECBAEB78AECA2A1BE908A961144EA3
          588B4C0B5301FB98DC35E9FCCEEA18B60EC570416A220E650AD6E7C96B785DE2
          507C6F2BEFA319FFA3F516748F85C348DC19C92893BEA3D3914589DCB5FBB7E3
          EDEF7C076E9DDC8FA028AF5797D7CE95B46EB244D2A257AD5C85D7AE5D27B974
          034162FC71A4ADD5A999EE23C9263FA3D3A93FE8DD30033A166371E2748CDC52
          07407152D7EE201E8EE9727A8F74229DFC9F7C8396381DAA1845A18BBAA46AF7
          B75BD8D510D83F3681D17A058D9238AEC13E1C6A88C1178BF0AB2D0CE67BE036
          D8DD182971079DB92FAF79D21967ECB8E4B24BFEE23D1FF8C0C78FB751FC381D
          8FEA00E289F1CDD1ECCC7F7B997420DE370267E71E2473C3C081BDB06B4D2A2E
          188E688614DB74813189B3590BF03B8C4A64DF25B4375DC1C601682390A5B502
          C3FFC72DB2400D983CFF11F9FEED0CB64D4CE0BF470FE2E6E9494CB1B556996D
          12E5DDF748F0D1F271FDCBAFC39BDEF8461581A093617B295B849917F3F5DDF9
          F6603C62E4559AEFCEDC803A053A00A214ABE324389ECA856FD98F0AFDF5B516
          18FBA315FB1EADF818095ACA7214D68FB5EDB52897F5EECF7F09EFFD93F7E361
          7F1649413D25AC6C1E8EE4F8436D1FAFDDB0112F59B5421C424D9103957695DF
          4FC94D53355A733EE6B64BDC3588203523BA3AB2AB7A87FC9C749CBE5CE3480B
          84AE23688F6C4669A423C93AD6CD4EC35C1E5571BC3313D3D82E08E51E417FA3
          61ACB521CE1EB48BD02EBE7A18A2542E0A6A218129EF4911AE9CFB6CB386A175
          6B71E2999BFEED9537DCF007D7BEE0EA878EB741FCB81D8FEA005AD393B75A3D
          C54B08F740118A0307E1ECDF8DF6F05DC81DD88A70B201B23649C8566E7D526B
          D3B0D50190F947C51E6CDD228AC4FCF91BB68A0469A7CCC5AA746272632D1282
          FEC4D5DC97DB5493B2706E191FC31787F7E3414A69F5B8CA42CBFD2385F8F2F2
          1BD69E805F7FCB5B70DEE6CDB2E862CD615B7E1B9E975152093BB58EFA9047F5
          E653769AB4D38C87AD36EB1DEA48542ECC312D31AC8CC74A576522DFB15BE58F
          353ABCD880D1C2E72ED6C0140BACCF64B22A6291CF163035328A0FFFE11FE3F6
          5B6FC558DA84D39B15E7102115F89C9313DA2821FFB51B4FC1F9BD45447143A1
          BCA39789B2DA8E715CEC2DB03A421B64CDB7FC8E12B1AD0E8372B966FA9F0A3F
          BE38A0101912784A7E4EB28D24EEE8F1F175C50154BD2C46E49A6D9B1CC78E99
          198CCF55B02F2BA99E00973EB93FAE9C5718C967F003948A05B47D1F996C4697
          1C093CF3BDBD38FB820B269FFFD32F79EB39E76EFED449676DFAC1BAB87E727C
          5FC7233A80D9E15DAF710796FC5D5AEACD96621DDB97DCD247696C1CD1EE7B60
          1DBC17F108D3812AACE906D266203EC0D5286EA99146E8369B73869D239B8C48
          14E154E67985E8892EAA44852A581B48BA9CDC1AB99A12057735DBF8EACE7DB8
          796E0A077B19F964D9360C79642EC731E210575C7E05DEF69BBF89DEBE3E8DD8
          A1CA788923896233DE6259F3D0FD5807A0BCF364996DB6E494C561643D640A79
          9DB73744175007A0C66A591D7190471F145A6C8270E177FD848B0C0BCD3F2636
          83326D4A63CB5B7DFE339FC5C73FFAD7B0DB3126FC0A3C3A8020409CB1D0239F
          F192BE41BCE4848D58C9462987D2D8B6CA82B3AB3293782A6DEE2821976D3879
          C41178469CFB480DC4EEF0A1A764E8A7F107203F8F45C34FF202120A48C580AB
          724E3312DDB7CFCC6277A58A7B0F4F6138F57434BBB134AB44217DAD44C78E49
          17938A1353A74D118E9E1E4CB6EA1858B31AE75F78D15FBEE5AD6FFBD8BA4D9B
          761C6F23F8713E16750093FBF695E3FADC97979C74EA85B69D45E22666EE9B56
          6BFB62F08711EDDB05485AE0ED1D463ABC0FC9CC84445BCEB1BB9DDE11EDF315
          D817694F38A13F8142D7017411801539BADD45868044955FD8E91768040B64D1
          CDCA02BE6BEF21FCCBD830B6D0138516A26AAC52CF5D432C148AF8DD77BF1B17
          9EBB5907485A126DF8BDDBC09276F6A9BB4677D4412740489C68B95FA79653ED
          C54FB502DF4D03F4625986260B8B741076BF2F66FC8B1184A0738D169294F2E0
          635DF1B6F550ACC7B5303936863FFC83F7E1EEEF7E57217440628FBC91D7267A
          5F1559B866C37A5CB87205F27313825E288E29C646420EFE3B7555D484C6EF99
          BABF3A0037EE4CFD726745EF5B47DE2471357A8BFB513D3E3BC94A16D7A35388
          E34913BBE53E3F303D8187E7AA2AAB351713D56525E58851293BEA567ADA6606
          A05790422AF79F021C1CE0B1FACBB8E2C5D7B6CFBBF492F79C7EE6991F3CF1B4
          337E2C98777F948FEF7100B369FB7AEFF62D175A49FC96DCB9674A542F829DB8
          7CA03BAF0917216ECEC2DA2729C10E71043BB7211D7918496D0A8EE4E5549949
          254F4F422AEF8602B3036DF70C6C233B15A51D07101B04408D7BBF23428DB425
          8BAEA143299EDB2F0BBD8C2D62D05F3AB007DF9C18C70159F851D4695BA5CDCA
          EBE605EEAF59BE1C6F7BC73BF1CC673C038D7A438C24A7BB904A731DB1A0458A
          EAF02834605E42FEA326816D7577C3BA1A3F475D24ABBB85B7E02FC73A947903
          EF1414B100352CE63098F4643455318D4C7C3D72E0652C128386AA4AF46FFFFE
          19FCE55F7E087EBBAD9F23E99C4751DEA34F9CE9594BF2B8F4E413B0460CB7A7
          CE1669470C5F22B83C37C71D1ADB54EBC902EC76DA7E956E8BD919F5F734E1B2
          B44F8017401D218C7EA0634BAEEF945075CA9811D83E3C7110F74DEDC743F50A
          6A2532045B5A38CC07C6A9B7A86D6815D5C16464CD1429E202A8469F532EA597
          3FEFB99F79D9F52F7FCFE6CB9FBDED782FFC9F1CE6F81E0790FAF515AD2F7CE5
          41CF4E07E393D7C15BB9565C79AF2C46CF8C75A4DDFFC9AD6D0BE49C3C0CEC11
          14F7D0FD480F1C403A3986A03E0397C5402AC5A49E8A4E68E4B74C612A48B1A0
          06602B6964978F9E5C02716ADA88DD9618833B88FDC52CB635AAB8F9FEAD7888
          52DC303B0A5C741C0266A18CC8E3E20BCFC76B5FF31A9C71DAE92ACBED643CAD
          E2A75DF12E46F438C151C926FFEEDA46EF6EC1457192233F75A9AB8C03E85E03
          731CDB2434CFFF67DB479EB3E8EC00E6750138DA4C0D41E538083A7A79824CBE
          7BCFDDF8F0873F22406B3F1AADA6D99263E34C9862A9FC7B5DCEC2E6F583D8B4
          7A08A58AE4D5B33E06078A880B26F5C9468E4A9931C5715323AA411740F4E499
          066065EA73E6FB1C3895C9EBE172165707B45A760E5B27A7313C3D89E1B1518C
          FB4DD4C4F0E382FCDD4954C5C74968E6369ABE7C864C3FB225091A8216223F46
          B9AF1FA581FE99175DF7F2AFBEE9B77FEB678EF782FFC971F4F13D0E20BEFDAE
          B755FEF5F37F525C5DB430D40F67C306A4FFBFBD2F818FABBECEFDEE3677F619
          69B4AF962CC92BB6C106CC167693400C8494EC6B9B8447DABED2BED7364DD2BE
          B6AFAF4B5E5F096D9292908686928584B086B084C79204305EC0BB254B96256B
          5F679FB973E72EEF9CFF1D199CA6796D1A220C73F809DBB234BA737DCF77CEF9
          9F73BEAFB51B52A209326BDC2BDEC827D7A625D16B33A1A667A11C1D024646E1
          0C1D853D350C8DD244F00CBFADA1C034544CD6CC1159917FAA0DA854E6493CBD
          38E6A3372A94D4C112A5A2A61F198AE626FDEC270FF5E3B1132338C14CB5F44D
          0C13942BD07505C5CA2AEBCAF576AFC4473FF4615C7CE145E200CA13FA54447D
          FF33DFB9986AF152FD57C4C22AA97EC54EB20BFC3C0078D5A82C3B9490058357
          56E0670140E53F3EFC14BAF34231C812D199750B773EFF02BE78EBE731D07F44
          6432BC3AED44C28C7814E94BE8A1FBB8B5AB01AB9A036072063D6DA39ED2F5DA
          08956CBAB749A830B8C223DFF49A7CB2B817CC94A48AC34F079A60FB75051D37
          5F95A90460F923485269313493C4C0DC2C46CD2CA68A59A4E9E7CA4E90BE8E17
          77E8BB3593AE95323E2A0B19301597BE973E4466408F4F7D7BA7D9D6D2F2E577
          BDFB3DDFBC78FB35C3FE507076B91FF8AA9D6AFF0A00C63FF357DF6E3C30F06E
          A749123C6B686982D3D90BB97B0DDCA66638B561B81A67032A2A6321625F5DCA
          A6614E4E403B4CA5C0C8412823FDC0E4221F19C3A0DAB5C411814B574D454944
          61C93B231045363D88AC09EFD0D7912314641E80A1D452F5C13F5B16E3AA6A30
          8883A5221E494E63E7540A33D9A4507BCDF2969D260BF92B5F2080423687CD9B
          B7E0B73EF949ACEAE9150F7FC930E1A31A7689DE4AAA0C074915C778F5DD38B9
          F6AAFE1B7BFCE293AF7CCBCF020059B40B2B2ECEBFFE8C833E51FFF37949E590
          11E2CFBC1455C213CF3E83FBEEBD17470F1D1242212CA6214A02CAC4B8BFDF49
          A9D479B535D8D412416D804A837C0E09278A767F9C4A03CEF54DC1CB27A83965
          D73BBB712AACBB82F4D3BB1E3E28D49959D7F1C44F25CAF20C59C750328397A7
          E7713895C244B980055F9980C1473732482F1DA2EA4C13A069FB585198322D39
          27D47EDCB28C50B411D38534366CDD34FA819B6FFEEBED37DC70FB723FE455FB
          B7ED1400700D43DAF181DFFCDE9A5CFA1DE1880589524C89A34E532BD0B11276
          6313A49E15905B9A017F0CA8083D2CAD8D3BCCCA337202F6C87EC88307210D8F
          414A16E09253968B1914ADB2E0FD37C5028D2C4423F8C45B0CDE501A5F16B302
          1E9BACA1F1AA988EC0A2893057AA4609F3E120F68535FCE4E8145E1E1FC65839
          8F24D38493C3F999538EB7E034551CDA757675E183EFFF002EBFF41218454F1A
          CC6BB7BD6A9C9779EA961CC3F1E8C35DA932C724BBAF38F652F49696CA815337
          0C25E995CE8068BB574A00F1F795F9819FB58320F6FDE87E70DDEF96E97D1050
          3EF0DDEFE1AEBBEEA2689B156D4D26C5D008084D7AFF5290F5F71CAC0F4470C5
          8A4EB4EA3C30948644A0D11DEB40DCF5C1C7A2296A59AC555B94CA2BECF0F41A
          0CB662ED67A93C611A6E66E991BD115EBA43C8D2D71D9D98C7D1C5451C26409F
          B00CE45509A590B7AEAD1403943904046107B74B6DCDA6CCCBA4F7C7BD600BAA
          1E8416AAC55BAEDA76E86DDBB7FDFE5BAEBEFAD1E57EC0ABF6F3ED540098590C
          3DFED93F9BAE193E105EADB9940ADA8847A370759D80A016686C83D9D20E65ED
          5AA83DDD4030EA1DF6E1249B1CD5D80402A931E0C400EC7D87E1F60F439E9982
          9C378434578A6A594968E1798780420E9C3302DE04E34324510E58829CD2B6BC
          693647B511289A623E6E3191C068C6C0E3C78EE087531398F3F929AD8DF00C31
          C24E9AC707902127E07D832DE79C8D9B6EBA09AD1D1D50A9A665C7B33D695AA1
          CE5B669A6C310757A98F15458047C9322BBCF47265D67DE914A19231BCAA0D78
          F2847FE91E8AD3524538B6981F70215A8DAF9E0A14AA40ECF49AD766E47A9F77
          21F6EFD88DBBEFF81A060F1C149950864FE8E9BA554AE5552A87A2B285562A87
          D6C712D8D2540FADB088B056423C18429DBF165172CC5099D271D7105461864F
          F5FAFEBCA2CBAD41491507A17CEFFD9429C8CCAD47DF3B47F7FF58BE80C394EE
          1F185FC4025DD3223976DA2C087115EEA884996D399BA72C851CDFE283435EE0
          D1055927774E4A52099D6B5615B69C77F1DF5E73FDF5B79D7DC1D6C5E57EB8AB
          F6FFB75301E0F864E4CE4FFF49C67DE945AC0BA9883504D14AB537150250023A
          DCDA04EC9A06B86D9405F4F440696B8753DF04371CF5525EDEF4E39A9279018B
          69B8C34390E861C6D0109CD945B80BF33053B382D7DFE0345FF27B51B8EC88E5
          145BE10516571C2E09765A1B15251B5E32B2859316D9E1FC510C1090FC60E818
          5E9C4FE178C946C91F4258A27498EAFE2065031B7AFA70FED95B30393B211662
          2EBFFE5A74AE5E057F30289CB85432C43986E67A1B8BBC94C4BF2E39A8AA2895
          93FCA55D815768467F5609F00AFD6505049827DFF5C68A39CA8A769FEBCD3758
          624E817E962E09503C3AD08F1FFEE031C8F43EBA5A3BF0CC934FE0E8F16358E0
          AE4524223625839401745176B3B9A50DEBA235A8E57559DB4034A6A136164188
          EFA5E122CCE49F9415955587A517C581A24D9917B7FD022C9F45805DB63DFA2E
          93EA7816191F4965B1636202FB33492C2A7EFABCEAEDF75BA668E1D586A242CB
          21954EC1EFF709AA315E2F16EB02AA8E446B2B369F7FF64FCE38FBACAF7EF8E6
          DFFEFA723FD455FBF7DB29005038381CF9D6DFDD9639F6DDFB10A7E8DFDC1E43
          6F4D045DE40C611F3DE8114EF128F50FC4E1523620B775C0ED222058B912A0C8
          0C56E215A4125E65AD14B270C646E08C1E833C7C0232FD1E932370D373307836
          40E2811B1D0EA7E894FEF22977911E5A53F30EE5F86049F4902D47CCA20B9A69
          1E062C5928A901CC502DFCA3B1493C383E826321C91B33A570B4B6B51B6B9ADA
          B1989CC34BC70E0A9DC15843032ED87639D69F7106366FDC8440D0EF1DC2E559
          3453112D374924C95E4456B47F2D25F6B3FAF827DB80AFFA2B21054E598EC6D1
          D1F24EC8F9F0CD5B7D76E10F04303F3F872307F663E7CE17F1F29E3D8491C710
          A71A7FC3191B10AFAFC1D8F0308E1E3B8645BA3E3F41CB992D0D584DA97F3B39
          6823DDAB467AADA678087A48834F57C5728E6BB194B82A6A7B5BF0F8B3284B59
          5C0B58B6CB74844E4389C06781CA861399140E8D4F62742183194AFF677CB2E8
          ED7347C5AF8A8561717EC0E507B77E1595FE4CEF294FF73F56DF80246504175E
          72C9F4B6EDD77C67FB75D7FE69A0AE21B9DC0F74D5FE6376CA137DF0B167AEB9
          F7F3FFF8FD434F3E890CD575A1E620CE6C4E6093A2A1939EA1845F4582EA3C1F
          AFFA46C9E11314FD9BDB81BE55707B7B2077B4C18A86C518AFE8103B1EA18455
          C8401E3D0EF7F041484347E08E8DC25D4C4329C9E0EA31572C8AAF75B8DE64E7
          9721868778A0451C14721940CECFD384FC9F524AD1C3CE297A04B3B21FBBA856
          7D707C087BE79342B43240C0A2941C11E50D4A9B593B8E578FF3F42037D4D662
          C39AD5B8F8F24B71E6D9E7A0265A27C687C5619CEDD19679A7F73F9F2D68C97E
          BA04F076E5BD093FA73209C9A5052FE1F08462269BC3E0D0201E7AE821ECDBB5
          1B8BF30B04148A38BBC8D1FBD0C27E217A112730351652224B59D7D4844DB535
          20C84588C092EE3AD636D423AE335B6E49487409E24E7AEF1AFFE778D4DDDC53
          F1F1A216AB28F1211E954BB394111C49CEE2C8F81C8E2FA6306F9729ABD290A3
          1221AFB228AB2D002444D710E4C3577ADD2CFDFB28AAC71A94A45205C1006A5A
          5B70F1B6AB0EBCEDEAAB3F75F1D5D754D5764F533B05001EF9CA3FDFF2C857EF
          BEF528A5ED47C8C972BA8D73DA5A712ED5806B82329A7517EDF48F5F4F756988
          1751B49048C7B92430577641EDEE82DCB906527D3D7DDEE7ED09B9152A29A708
          50CD8EFE43708E1C8133741CEA6C1A76B988B29113B52947FE22E5E4BC15C8BC
          72FEB226CEE6C498B0C2C2A104024E89EADC9C181F663D410B21A47D010C6432
          78766E013B67A670941C1DB1A8A092E6D284875BCA6649F012C8E4E44102048D
          6ADFAEDE5E6CBB6C1B7AFB56A2B9B901114AB73D821F49C873FDF41A2FDB4F4B
          889DCC002A2BC44B9F1359006F25D29F1793494C4E4DE2D091C37871D72EECDF
          BF8F80202B8680CA14CD45A790A26F492E0BD51CB944519C227F07DDC3F6682D
          CE6C6A417D21870845F1969A18BAE211D4EBAC7E69909F73B9A48811EC92E83E
          A8A2C527843C7879C7F296AC1C02E545BABEDD0B33D8353789E18C8545C38415
          20C061111154A63B78F598EE5BB8CC441D9E5C585168004A6257C2A65270CD39
          5B106F6CFCD3FFFA077FF0B76B379D995FEE87B86ABFB89D0A005FFECA2D0F7F
          ED1BB70EF41FC7CE620A054A93E3450B67D23FFAFA44009DF53A9A280B682510
          68A734B6896A6D3F4769E6E9A7145B21B0B0BA37415BD909A7AD094E342A4ED8
          BDC514992213A5C37373C0F141028101B883C390E6A6281B9885444E5B962842
          3A86A83F55FE8F852E794AAE32AC03E6BFE395544A5F4BB237D0231B3CFAAA8B
          53EAE3E470BB8C0CBE3F3586FDE90CB225E619F01468248AA84C5C29AB9C2EEB
          C221D8D9C3941EC7A341028004D6AD5B8B0D1B36A1BD630542F41E9974847BF4
          3CAC536286A30A05187F689A76CA0A709945316C4FF7BE4C35772E97C7D4E424
          FAA9BEDFBB772F0659AE7B7E5EB4F5DC0AC186C4E700AA22D89039D4CBB2B70B
          113325740755F450CADFE80BA15D0B52DA6FA2AD2181BABA18822CC56DE6A1D1
          CFE3AD41CF7BE94E333B10656BDCF6E4190D974082095A33F4BD130B69EC1F9F
          C6EEE40246E9DF21174888033DA1C940D19D0F097C7C8EC100C0078779131A65
          00259605E3D28EEE3F33FA5E79DDF6E225DBAEF8547D4BF397CEBBFCCAEA28EF
          696EA700C00FBEF2855BEEFFF2D76F3D3634891DD9148CDA3A28A93C3A9D32EA
          558A3E0D41F4B624D016A25A949C7F054585568A3271BF0699A2124F0C5ACD2D
          905BDB80AE1E489DBD901A5A050D945BE9BE33F987934BC23A31027B60002AFD
          2A4F4CC0393105A59047811CD8A6545F6CE3F903A29CB06C4F887289D8C31103
          340614AB08BD6C0B2AFB2239438EA2598AD2DC23E922F68CCEE0F0DC22166D1B
          29BAC6147D5131240BF55B58AC23EFF3369C782F5D32C54013A7E2F19A5AFAA8
          432D45DAE6E666F1D1D2D222168F9626F7EA29C30910004E4F4F23954A79D37C
          F473E6E66631363686097A3F730474E9741A59CA4CBCEE884D994EC91B0B46A5
          B3C8E50E0149890043A3943D4E9713A76BE8D465F484836823E78E5039D3E80B
          635DA201413F732E328B528EA2BC2956AE0982E9BA03B065053A95008E697B13
          92213F3294244CA453189C9EC1C85C1223C902C60910932A7D5D3081A0495916
          4FFF29045EAA01B79C25F028C0A7EB6232B1C89C0B9429E9C120F418651D6D2D
          F7BCFDDAED9FFEE82DB70C2FF7835BB55F8E9D02004FDF79FB2DF7FCC31DB71E
          39328CBDF420642221C45C155BA8D68FCA268AE602FCC502EA08187A630DE8A6
          3AB99D1CB12920A33616843F14841CA38794EA6AD4F301E13A60F599705BDA21
          D103CD032DA2EDC5A41D5601CEC2AC7740C8ADC223C781991980C0C1A19F5D26
          E72EF8586B9EE3127D58AE88E6DC5E3315158A5D84562E08A25093528CB420B0
          D0E05723F410FB902A2918A7EFDC9F9DC3BEC9710C50049CF3538941CE65B2FE
          9845258AE5E9DCD9A50C3DF07C56C0629CDE7872801C9EF70C4EA6F23C69A872
          5E2223C89D11028024393FCFE87BAA9A10938766C910A50F4FCA0575BF7788C6
          077002A82CD172549606903873907806826E57C88715F4335BC8F19AFD2E5AE9
          F51BB500EA4235688AD42250B6C4E41E83A342654280EEA55276E93ECA822CA5
          C4DA8862C28F1CD7763149517E80EEE56E02A413F319B0B64AC165CA2E2A9BB8
          3C736308100004791683BB274A96B28792688116793A91B29F0C9750542E5D79
          E595994D1B37DD76F1DBAFFAE28A556B4CBF4FAF1EF6BD41EC140078F64BB7DF
          F2E0ED5FBB7517D5E983720973E4540D6E001736F742370BC8CA19C432250C2B
          166AF430CE8AD5632545BFE6B04AA5818C065D434DDCDBA707456FBBB60556EB
          2A68DDEB81DE95909BEA85665D85A382C0804FA6C989E92195F61D803B4E59C1
          F838E4C924A48514A5A73964B9DBC463AB96E41186A8B2A0B11212E3AE297806
          B83460020ADE25F091537359C06704E59086BCCFC544A18083930B18A0B4B69F
          329A298AC49C165BE42CBCFDEE23472FB28601392DF308E8042485624E488F33
          0858B6C732C4915EE54103FA5C8EB21595CB124EF9D9C12B52DA1A0345D42F24
          CEDC7C511024CB8A9F326C2A5D289D0E308050A4D609D8FC749FE201050172C0
          96808656CA745A6C0D0D61199D9479C439A5E76B103FA3248042A57BCCCC4432
          B706655D8C123375B845AFC57DFF857401C3E30B38B490C4005DE398C975BD26
          0458B95B20F94A302CCAC0CC18BDD70824BA269F9DA1D7CC0BC68602BD8F4022
          8E0C6F10D6D4A367EDEADB3EF5479FFA978D1B36BDA4AABEEACEFE1BCC4E0180
          87FEE67F7FE1A97FFED66FBE4C35FA000CCCBB65745044BDB0A18BEAF41994F5
          023AFC61FCB0B048756419ABA9463FCB17C3A6FA4674D0039820C7688C4B040E
          1A023C7ACBAC31C1187C5DBD90FBD600AB56027DDD421A4A4CA5099E0157B0CF
          606E12C5D1412A0B06113A3201F9D8145C8ACC6589223C3923AF10DA14114B82
          EEAB28F6D685F83CEB85D8428F46741038E22AB6D7FE7224A62AB3509083C8CB
          2124251FFA1733184C2631383B8509AAC7C7281C17282D71589E9CE5A63D1650
          E42AEBCC3A39BD70BECA728F50CF1199812D9CEF2467BEAC0AED3CA62D572204
          72410D2E2F2495557A1F32D5D316A214A199D62C4125140FD68422E4F0E4E441
          A38866AAB37BC335E808C4E8EB28F516FC8A059135F8F4102C87C0CAE5A11C49
          B0238332315EEE2D1198B8749F7374CD1CF10F8F4F6170621EA305834A802065
          07F562DC5A1C5AAA25BAF60CDDAB3C81698C802928DEA36617846C3BAF1A3B04
          D00502DCB6D5EB71C3FBDE7FA6507AAF000027ED49444154DBA6CD677FF69CAD
          E7E696FB41ADDA6B63A700C053B7DF71F07B7FF7857503E9793C9F9C8113D1D1
          480FF065CD5D149D4A509502A285325E2893132D522431B97655D15E93C0C6F6
          7634536ABC921EAE667AD5153E05B1203D9C548B4AF128DC0497042B60AD590D
          AD6715E4DA4631E5C6933EDE2ABA05BBB8086BFC04B4C131380787A09C18A592
          60165281221639AB099DEA555D9075F0B4A0D01B747892B0EC49550B3149C913
          A8E4B5393EF567396C3EEC62AA310280225D6F9200622A9FC6C2DC02265259BC
          9037B028F1849B8B2CBDE602B71B4B15810E3E3CE45D450EF6BCB5C7DCA73C33
          A07A53855C44B8CE123BEED24DF516818214912304162172D830BD560345F928
          D5F835941D85082063BE0056104036D3AF09BF4E115D859F557DE81EFB15474C
          F431D039929FAE9D977008901456F92B0AF255879C3F1F0C6392AE6BDFC21C76
          12888EA673C8179836C18F12974F04D2F0F838A8E230E9BEE408AC4CC87A1465
          4785AED3EB5A3CF157841A0D53E6A262CDA64DC5B76DBFF6731DDD2BFFFCC24B
          2E73FE83CF54D54E233B05005EF8DA5D07BFFCBFFE66DDA1EC3C86292A676C13
          81BC85ADE4ACD7AFEEC3DAA61A38C726F1E4C2245E9C5AC09162564879D75064
          DE5CD38CBE582D3AA2363AE855BBC9F13A830AA2D100244AC5DD701DA43A9E1B
          E880D4DD07AC5983727B331C8A6E829B9E077FD88B4D43740A0A87FAE13B7018
          EED47128C94938D924D5EAECD42A45C298C77A2915C9F9F8C3142224AAAB896D
          43939CACCCAD31F65A5B161C7BDC3DE041183E4750C9D95875D6289B74FD0E26
          281ACF1A32F2A922A6298A8E1B29CC4D655020C73238C3A0A85B522022306B5E
          F3C4E0D270B0C3D37AB6A0D313A0C013107EBAB43045DD1AAAE36B823ED4A82E
          223E19757E0D8920D5F5D1286A4261C4C8D9839479E81CA129137104D53EB3F8
          50A941915FA3F7250962122AAB4231D88641D79FA7C8ED5197A5E9128E5376F2
          726A013B92F338661460D0FBF55B01712F3C4253D3832341E8E2097C880FCA1A
          54CA364CBA865C66117E026A10985CF79E77FEF0CCB3CFFCF4F61B6EDCBDDC0F
          67D55E7B3B05009EFFF677EEF8BBCFFCF1C786B3298A2419C8F40097B219B4FB
          745C4B00F09E8B2F4053D2C1BDC70FE1C1FE03D8995C449A1E32DE3B6F746434
          D103D49DF0A393A2481F3DD0DDCC5813F6A3361AA2072C025F380E259C00EA5A
          80DE5EA0A703566F17214882FC9A078E55D18AE2B417794A53474E10E01C0546
          07E0CE8DC19D99849AA16865A842208477D13942DA82768A33775B38111350B0
          F82555DD14A555D10F77DDB298094085EF5E74EFE9CFCCBA4BF15068D1DBCC4F
          4F0EC74B38C98C812245F822395941E2AF536030D1A54220C36C3C6EE5A36CD1
          F5F241218458874A7F1FA352823F986F304029759065AE54FE80A0D91204A31C
          CD1D03AA05B1776012C8B06AAFE00260420DFABC9F0FF95854853D5797C5A425
          F7FA93F4F959C3C2A1E919EC9F9FC671AAF517C97F73BC83400015296B4298D3
          96F9B5CC9352DF9258DEF2C08097AF7CD15A649868C43571C9B6CB53EDBD6B3E
          7DF3EFDCF2DD70CC3FBFDC0F66D57E35761200D24EA92DFFE2CBE5DDCFEF78FC
          5FBE7DCF86E1E171692E93127F17A474B4894A80AD9D6D382BD48AFD3E03FF77
          EC288EA472543FCB22B2B243F1E9771D65F5CD548BAF8FF8B0311646A7EE2360
          085256A0231689C11788420BC6A92CA0DA34510B65558F3820C49A55B078E61C
          8A20C416D2E1960D757616387A0838D10F7B60BF582C423E2B68A5795A801306
          C754854089A9E6456620B87D05C32F0B8EF2B980CF1B28529994C4166BC76243
          4E62D24C9B1C8D978F3CCA327E4D16CB28D175F348331F9EB9543A78BFAA152A
          F18AA2110341B92CF619345E24F2F18E3C4B794922B273C783671A64061F2190
          5AF628D0E154E230CFEDA9620CD9D22521ABA632202954EC50E9153058328BB9
          F90D28212A4F08004E5046B67F3A830353298C158A18B78B423FCF4F59569A49
          4EE93E842C45640EA6986BF6794029D927E5C651E1052C10C844EAEB70D1656F
          F9E6C73EF1B13BD69CB3F599E57E20ABF6ABB57FC50760E40B91C7EE7DE0BF3F
          76FF439F7C79D78B7533DCAAE303374A97EBFD2A9AEAC362436F68268F29EEAD
          73438B1D906AD432535AE9298A6C0EA5BB3256D544B03E18C15A1F0101D5A4ED
          54F3B7067C08715910A5343CA08B7162A7730570F616485DBD90627582F6FB24
          8927938B6616A8141881D37F10F2F1E394098C030B94A1B03866B18802A5C182
          6454F6A22E4766169E2C8B895EC95326763D6D421EC7155B7E821FDF119D0416
          B57405BD151FE4694228236BE63D0D3CC5631B8250306627AEECF92F71032CFD
          AFD2DC57C4CA70454E8B077E6C4FB188078AC4AA3201074FD4F1D0106BE87904
          1D8AE002D044AAEEC2D24A14F96521EFC5D79FD5CB980A14717C6101FB47E6B0
          7BBA8831CA950C6E55FAA9EC2897E02B9644AAAFA83EC1F0CBEECE806CF1FE44
          85FA8C331E2EE81D71B9AAA0E4BE68DB157FDCD1B3F2EF7FFD376ECA2CF7C358
          B55FBDFD9BACC02FFEE0C90F3CF1E0C3373FFAE003E74FCD4D635EB150F47BC3
          2AD112902AB948F9F861F2212047A93E9704D517853F2FDA950A489053ADA67A
          776D6D1DD650CDBA82F2E43672C486A0829A78083E5E570DD2F726EA80D53D5E
          A7A0B30F72633B402503A7C2DC602B313D58398BC0E40470849987A82C189B21
          1048C24E2D52169015EA44CC24C4ED424D70D3B1F418A7E7B60760DE299848DF
          25B92287ED78A3AE7C68C820C0598210BFE1A93A8D0B7259B0E77081CF119B67
          FB55563E965E190DE6651F9E15704F2E0A790B428A52E116AA28EF5424F64E32
          0109E96F55824FF6A8CE55DEE2733DE65E9552F874883201BADF3281DB74298F
          C72787309ECB6376DEC42C651706D5F005062C1FDD7FBB4CD942516C3A1608E0
          9807C0142CCE169524F47A9439F028AF5884E62E0A81CEC5975C3EBA61D3A6CF
          7CF8B77EEB073EDD5FEDEBBF49EDE7EA024C0C8F9EFFE09DDFF8F4EEA79FBDE6
          F9837B30E6A411A8090A555A833E4CBF46898144E9AA2E36D138F9B6B9D0E549
          17234F51AC04726334C762585713C2FA7008BDE4575D1A7D8EF2FC3A7A1083E1
          28A49A18FD210A3436C36D5B05AC3A13520FFD1A8B9073AA62049523A3460FB7
          3D370B796288CA8111C8236390A6C7612D4C413172F4C01B42124B478022BA26
          CE0978C24F445C11F525910588EC42F674B218041828844AB1E3E91488957EC9
          279CDF1337AAB01DF0E08EAFEC1179547604986A8C5F8315B7E54A37800786C4
          88AF684E2A9E56A238845B92E2F200C0501DC1C6132080100B56822F9DD7796B
          30173771424FE2F8F404F60C4FE160B18C2C9722A605D32C8A16246F153AF43E
          795640A75244E41ABA863C5D5389EAFF10812F939164A85408C4A34866B388D7
          D7E3E2B75CFC2F5BB66CF91FEFBFE9E6E3CBFD00566D79EDE70240A6545A21CF
          66A6EEFEF21DBF3D717CF877F7ECDCD932323785D95C9A3C841C2CC8C20F367C
          05070125803C45A23CF7DF1900A8DE0DC33BF42A52580DFB156C6CAAC3FA801F
          7D3E19DD14ADDBE8CBEAE231841211CAC879EC94BE23DE0AA7632DDCF51BA0AE
          A792A0A61EF0853D27AC28D1F2C82AC667200DD2F33B3C089C1806A626E16693
          900A0443962CFAF5DCD7E602DD1269B7E3D1707134945E59E9E794BC5C61E7E1
          AD431613E121254DF6442C9634059D25C25FE7151A6FFEFC520620F40364EF75
          79BB9035121C4F69D46314E64338D7D31794977ECF9D0F8AFEBAA4C263EAA7C8
          4D60314F20399A9EC1DECC040E14F21858A47B6AC50900753103E04386309633
          765B005991B2800295577285F4D4304D842311A4F339C1B214AD4B206518D874
          F6D9F98D676EBA6BEDEAD5BFF3AE0F7DB4BCDC0F5FD596DFFE5DF2E06C03CF3C
          BFF985C79E7EFB813DFBFFDBB3CF3F1799010B4418308A058AF28AE88717E881
          E4D93C5BB4F45CD4723A4B0F68923FEF97514B51B1991CB937E8C7E69A5AACF2
          05514F512C1AD610D3CA688D86A1F186612801ABA905F219AB51EEE982DCDD0B
          993EC7752B84BC380FEDD0C39FCDC11D3E0669C8D328C02401C2E23C01410A16
          D5F0BC9B238E14A58ACE1F3C9112B742FD25DC9E0F05B90300B99201D85EFD2E
          BD8A0F6029E56727A7FC6289F86389D9973FA40A5BB2D8795079FDB7A22328A4
          B5ED93442227DB70AEB7F1C8EBB60A39709EEAF649C3C464DEC0EEC5498C8DCF
          61AC60231989A3A485E12E96A84CA0F2824A31BFBF4CF7890A231EA716938001
          21AACA63C63665023CA6CCCB49AE228B83CD96EE2E6CDBBEFD276D9D9D9F7CEF
          073F7260B91FBAAABD7EECE74B833976A726C963AA247471397D961FB8F5CE2D
          4F3EF5EC1D4FEC786E431A061693B36277BD48353FF7CAF9304DC8CC992E1216
          A7D212523A4B87F361A123065D5AFD3AD6C512E85543E8F687D118F6A12660A1
          AB46472D3B379369D0E7A58676D85D9D50D66D84D4D605B4351390E862FB8F5B
          FC0C043C11274F4F79D9C0E8113137E04C0D51FAB20895F5F3B2B21027E5755B
          3EFC33AD322A1BBF1E0DB900061E95F558815C2133EE88D73FC90324BDFA4E59
          FFEAE689A8EFBA1510107440E2FCC2D325F7444638F40B2952C97B7D7112EF68
          42FC83F90F47AD125E9C99C6BEA9791CCB1691A3B24AD6DBE8AB0230B30B9491
          E4E1734B4281CDA5D2CBA5EF2957C455159B0098DB9DBCA548F7A76899A86DAC
          C7F18931BCF51DD7BA175D76E9DF53F4FFF3351BCFAAD27455ED14FBF9EAC08E
          1354B854157BAA1E00D02FEE4B3FDCBDF2B9BD3BEE7CF4E1872EDCBF7BA798A5
          4F1A59A1EEA353AA5F26672F1994AAF2908B689FC90415B618CB55FC12EA2221
          D451686A2CF0BC403DFADA9B100EA5D11235D140A540A3E6478D3F42356E146E
          34066945379CEE1E481B37C06D6985146E10B4E14EA59FAF962D94E753504746
          A934188433B21FD2F831C8E92CEC244FB999154A2E4D28E70ABEDCB229DA85B6
          8F47777CA2FD27E430244B908E0887E6452189078964C1ADEFE3082CE60F3CF0
          10F19ED58C58D7900939081C1496CE764214AD436240C971738407A67074A63A
          E3D55F9E2414375256312335E3C8C228FAA74E602069E0187D4F4A0B12A0726B
          318280E413C581E316C4E4A3181812190C6BFD117019BCF32F0B7253FA16F86B
          6BE05269364F59D0BBDEF7DEF4B66D577DF0E2B75DFDF0723F68557B7DDABFBB
          04F869CBA5F2817FBEE3ABD7EF7FE1C53B9F7BE6293D974D8B34392995C5F41C
          4B878765728282E5F1ED215FE1FE079A5BEB91F0C7513C9112ADAFA680863363
          3ADAEB64447C065A2960F6451388C64282820AF11A58CD1D7056AC86BE7215DC
          D5AB20C76AE030CB0D330E54B8BCDD524E48982BC303700FEC83324459C1428A
          1CAD2C22B09D2D88C3333E05F726F81CBA4C4DD4EE4C47668B3162AFEE5744CB
          5E127374CC64CC80E02B7B2A3A4EA5C526BAF9953A5F9CEF4B62A4885E9BDBA2
          01FA39162C3B2B4A00E600E4494289958078D988128921238C03733E1C981CC2
          E4C23452F063DE5F821683A05D67D934715EE094C56E832C79F4A48E605991F9
          98057E5587992F8AB45F0D87C55D0E266AB066E3190FAC5DB3FA8F7EF78F3ED3
          BFDC0F59D55EBFF60B03C092FDE8C1C7CE7BE2E1876F3CF2D2DEDF3DB8EF6564
          98D98627F17888A6C45B6C5C672B0823830845B23045CA9A68540877C6F4309A
          28FAE7A726114DE610AD0B201253B05AD1D1A7FAD1561F458C320A7F88527ECA
          08CA35AD909B3A61AFED83DED947C5ED0AD129583A7CE39C406519EBC524DCA3
          47210D5329304625C1DC0CEC855948C939A142089612E77EBECD3A787CBD062C
          CDF278085D1F644BAD0080D0E1A0BF932AAF4DB5B7ED8DD88A433F71F72A44E1
          CCDCCBC33694A69BA592E838684149889D300F8ACCD37E0477598AFA0B962B76
          F40FCE6631BC60225D2E0A4E80B2E247DE6FA3C4DA7FDC12A4EC4912E7188EC7
          94BCF42E45E9C2938BFCB3E9DE86436241498B44D1D6D377E4DC0B2EBC3D128B
          7EF5239FF84461B91FB0AABDBEED3F0D006CC96323D2334F3EF59B2FBCB0E3AF
          1F7FFCFBA12439C042A180484D8252D19CA8D5153B8F9051460B39DC3A8A50E7
          AFE94598D2708B1C816BF4039934864D43C8616F8A37A14BE24599209A03365A
          222E7D5E8116AE1154E44E633B95022BE0F6AC85B27E2DDCE6040CAA55028E8A
          9314FD0503589C863946403038028D958BC68720E5E78553DA7C9A6F6942FEDA
          A2ACA3AC1ADE208FADD387E6010953890182A9D866A96CEEAB33853997000ABC
          BE3A1F4CF211A8ED136582C612E39C3728ACEDC7F3079AA03337551F26C8F1F7
          CCCD632F652587A6E790E43480577C15BF18E231059BAF778EE265369E74B937
          A0E060096F0400704B53521161A6660285603C8AF77FF8A37726EA1A3E73DDBB
          DF3BB5DC0F56D54E0FFBA500C0923D7CF7373A87068E7CF3C1C71E3D777A7E5E
          999A9A4191A297A9F1EA2FA5D0A532EAC8393BFD2ADE7BE1166CAEAF81343A81
          A3C323C8343560B4E4A0FFD804E4B28C15F15674056368894A680D96D11870D1
          180E2214A468E7AB05A254EBB6B4011BD7435ADF47BFAF83A4C7C4811E1FD309
          8E5FA6E94A91C38F8DC31D188074AC1FF2EC18904D0AD55A94BC515E96D4F6C6
          652B9E2D127041462898884CC51B16926D5630F41C9B494A3DB45184A2AEEBF8
          8416A266F1980F136C9882E6BCE4D3B140AF389AC962CFD43C5E9E4962D47050
          60E2525787AE661150A328164D14CB69D13D9075D93B2370BD330E7104EB7AB5
          3F7F82018235166502C854B184AD175DE05E77C375FFE79CADE7FFC9CA55EB8A
          CBFD5055EDF4B15F2A002CD9FFFE8BFF75E3C0DE83DFD9F1C3A7B0985E10D37C
          99A02AFAED3A3DC1B5F410AFA114766B288A1B366F8164143130318E643C8051
          8AA013938BC84C26D1DEDC8A445847831F68561CF486FD68D475447D61F87856
          9F1C00DD5D70FA7AA0AC5B2B68C810662153EF6C400CF5F038AE59843B3501E7
          E0412164EA4E9D809C4A412E6608045859C7F5F27916DF5429BDE7A0CE2938CF
          133069080B8A308B11B3FB28ECFC65B164C3A700BC37C01F0A671F16952A8E0E
          9BCA09932E2DAFF931972F613F95212F4D4E61847EC60CDD8102CB6D13584819
          2A8BFCB3084A31E40A260A4E8E008179FCC2F0BA8EDEB422BF0F85B50B643E90
          64961E1545BA1ECBAFE38C73CED97BFD0D377CEEFD1FFEC8B796FB61AADAE967
          AF0900A427E7E5FE3D2F9FF5D037EEF9FEBEE7763426A767316DE75020A75DE0
          A93C4A67138E89954C2012D070FDE6CD38D71FC4C4D4711CB54D4C4B3A92390B
          03274628D2EBE86B6EC44A0AB8BD141DEB023E74C41B90F041085AB9544E582D
          EDE4FCBD28F7F622D8D50534B6C0D543C2793990F3361DAFD6627206EED05138
          A31ED7803B330A3B431947B604D9A84CFBF928D2EA0ECA7A405093CBAC5CCC72
          E4548F2B8A0F163B21EB1C92B3F2A9BCCE14E8BC78C0F5BA1C2220F023ADB998
          F099185D4C62F7E4040E2DCE2269D8C8B25CB61BA2D43E22DA7B399D093A5262
          3A90CF2915C7804F663E3E02897C8EF088AE8569C4E8E7C62271640B79B1A968
          EB2A126DAD58B771C33F5E73DD755FDE7EE38DFB96FB41AADAE969AF09002CD9
          4FEE7FF4EADD4FFDE8B2C91363BFF7CC8E17A4E9640625D79BD1B70910629415
          3015768B2AE3E3EBFAB039510B236320B960216F4838989FC31164315DC8A183
          52E98D3575680A04D1E70FA0292823AE96A91288420AC581583D397E2BD0D606
          87454157F6404E3470634E2CE7A862BB9052F8421A9819877CF4183034086762
          18126F1C26F3B00D13B2CA9259541A1020894337B1F1074F8740F18B56A2EB52
          8A8F024569E6E7D3513658DE48179A08B9A48941CA688EE4D33834780CFDF92C
          F23C182479B45C7C1068A99A38C42338A0F288F7102CF80864B89DC79908E309
          F3FDC7621118A592A799487FEFF7F9C42CFFD9975C347AE6795BFFB6B9B3E3AE
          77DCF06BD5259EAAFDC2F69A02C0923DF99DFBAF7879FFD0DF3DFDFD47CF9838
          DC4F0FB74975B18939727E66DC09940CF46832FA6241BCA5BB1BE737AC406E6C
          0603C9594C8554EC750BD8373A8E562D8CB3126DE8D40BA80FFAD14091B03312
          46033946D41700023C4A1C87D3D90D77FD7A60F56A380D0D00938EC05B867184
          247611F2E22230320E676808F2E408303E0E7B210990F34A6583A23273ED8BC5
          5F6F7D8787766C55B406B9252706F7154730179B94EA673409538B29F4EF3B86
          C772F3382CD988A42C2A7722C84B0A66C8A98BD180A0290BD8CC666C8A25219E
          90E4D288F5FF789189CF1CFC04883CE750E6B6A4A6206FD3DF5346C2CCC4D75C
          7DF5BD6FBDFAEACF5D70D555BB96FBE1A9DAE96FBF120060DBF9F4EE86E9A1C1
          0FDF77F79D9FDDFBD24BD1897C1E2989F7E003F091136956019A99C11A5DC655
          D17ABCF38C4D70C9194FA4B27822338F07296AA72982AE08D7A18F52F015E104
          56856BD01BD0D142BE9F08CB204C80A4FA20C71B21ADE885DBDD07A97B25ACEE
          2EA891283C5E2F780769BC264BD1D5A532433931001C1BF4360C67E6814C5A10
          88306929D381F104A1466939FBBDE59604E7209F07F07443C1E717E29A872752
          7861740C63D91C8E05252C52F511A66C80DB8A2E37402953606E7D49C9131825
          0960A824B1291BD079824F1664A602002899F0051564E8BD2BB1104F6161A160
          E29A6BAF335A9B9A3EB479E38607AF7FCFFBCCE57E70AAF6C6B05F19002CD9F3
          4F3F76D3138FFDE0F6FBEE790053E373C8330790EAA7482AA1841C6A341B6D69
          039736D5E16DABD6A32198C07777EEC2E3D9791C324B62E3A655F2A1C75F8733
          238D585713414DD0444DAD8C55F4BD5461430F8480682D4AF5CDD07AFAE0F4AE
          84D6DD09B4B4C294B45776F9C964BB00796112383E4C1F13C0F028DCB1139028
          7587651008E5C5AA31786D57E1D15D765C47CC219B8E8AA1F914761D1F45FF6C
          19FB280B982720CA9A45045D6E5DAA98E079002B8A9A12653A79FA5EB900C39F
          43D96F8B43439B5F53D078A94207516C2086556498F32F44E505953E97BDF5AD
          3FB9FCCAAB7EEFDDEFFCB56AD4AFDA2FD57EE50030971C538F1EEEEF3BFCD291
          6FDFF78D6F9F7178F77E4FBA8B22FFAC6AC0A62C5E2B3B48E4CB582BFBB1A96B
          35FC35B5F8CE8BCFE3844D35B3EBF5C72354D577F9A2D8D2D28C8E306B1602EB
          145B4C15364542540D44E070AB30D100291A87D2B302F6E6F5B05B3BC8890382
          DF5FF29A6D6278C76526CDA919B847FB610D1E813232067B7E0E4A3623C67BA1
          50BACE2C42BA069900663A95C31EFA9A9FD0C709A38494A2224DE9BC4AC090A1
          D2C0A2DF87C9A179204A72746FAB90BB063C81582A0ADA3353F1418F1350D1FB
          F5CB3E4F3538E8C3422E0783328FE6952BF0CEF7DCF8859EBE557F7CE33BDF95
          5AEE87A56A6F3CFB9503C092FDE4D9A7C38F3EF2C835F95CEED6671F7BBCD948
          A7B198CB420AAA62302844F571C092442D9CA8AFC7F0D8248A12D7C34E6502CF
          1513FC5D54179F45757F5F308446DD421B95042BA261B4EA418483616F7848D6
          E0B634C159B71AD2CA3EC86DED407D2D1CEEB95359C1DC79DCE197CD3294E42C
          8C9101E8478FC126E756E616202F26452960533D3E9FCAE3D8DC3C5E9E9EC78E
          E9198CD12DCCE83AE14311AE5442A0C46EEE139C84CC4EC4C37ABCC5E7567607
          5C163B65811396EBD6FC70A88408C66B8400A72118964CF84331AC5EBF6EFABC
          8BCEFBCAF6775C7B5B5FCFAAEA124FD55E135B360058B25D3B76D5DF77D75DEF
          DFFFC20BB7666767303E370D291240AE6808DE3F83A2294FE4A9A62BEAFB146F
          F349FE0A0B978D1815E64DB284764D46578D86EE700CF53551AC727C68D1FDA8
          A3DF8798FF3E1825A76F82D5DE01A78F750ABAA0B184592824867CC4CC1D9F12
          BA0ECC1245FD494F9BC03E310EA79486B5E728760EEFC581A9310C4ECD639A9C
          7C9AF2888C5E21F4544A54C71708B47871471734E4CCF1C967057665B5D89B52
          AC108FF0702FFD3C4DD585AE813F1A110B53ADDD1D38F7924BFEAC6DC58A2F7C
          FCE31FAF927356ED35B5650700B6BFFCD4A728F0ABBF3E3B367EEBB38F3F1161
          E5DC12D5CEC79D1CB4283313537A9EA7AC40F3A1685AE2A49CA7ECD41073DA97
          A099CC3CE4A0416609730D7D5DCDB8500AA28D00A4A13186562D84287DC85A84
          802006B7B303120100D6F402BD9D402C444E1A10A588582A625D0026E19D4DC1
          B6F228CC4F62FF6FFF35BE34F08CD8D737CB0A6C7F1C39DE20642250855E56CA
          4137B3F0B9A2A90756ED932BFBFFF6129189B8E31E11086F042A041285128F0D
          6B82C26BF3F9E7EE3BEB9CB33EFBB18F7FFC8978534BF5A0AF6AAFB9BD2E0080
          CD348A35DFFBC72FFBD2A9F47D3F7CF891F37997FD607286EA6D55B0EEE8AA26
          566333A9AC68E7B118A6148C88856096C8E631DD8020F330D1501FC4D5AC5844
          801189312BB1828E70144D089183523D5E5303ABAD01F2CA4EC86B7AE8D72ED8
          F5ED9008243CE65C9B120145EC0C18F9240EFCC96DF8A7DB3F8F81680999B28F
          7E6200AA14422E4BE0A3A9626E20C0704080C5EBC13639B64D00207804999148
          F258801D1EED158AC0045E94CDD865894A8A34C2743D576DDFBE77F3D99B6FF9
          E0273EF6EC72FF5B54EDCD63AF1B0058B2C591E3B5FF74C757AF181E1EBEE7D1
          FB1F14538305D78229A8ED6538962338EFBC53F92064C927A23633FF3217A16D
          1B14510D6CA0DA7E6B2281B6A6389A7C0E3A82BC611846237DBD8F8541626148
          F5F5703A5AA1AEED81DDD103A97185000793B9FBF962F279FCF8D6AFE01B5FFC
          070C176691F5DB95797F1F95249AD82550C5BA1EB30A9BB054D3131CA6F4C12E
          AB6295992A11218AAA1018F1F00F1F26FA820141349ACB1651D7D48C8B2FBBFC
          6FDFFBA10FDDB676C3FAF1E5BEFF557B73D9EB0E00D806FB0F4AC70EF55FBFF3
          A91FDDB6E3A9A7DB8F1E3B8A144B7CA91EBB6ED6342BA3B921C4A275300A4594
          4A45CA0A4CAABB590AAC8C187D5D63D08715B11AACA6F8BB321EC4DA9A083A35
          0D0DF411D629458FC481DA38DC7A8AFCBC47B0621DD0B31A76631DEC621607FF
          E95E7CEE2FFF27C68A0B9856CA88102A44CAAE47E55552BD3303021D8BF7FE35
          0925029A32770A6D1D6A392096924A5285729C57909936DD1F403A97172CBD67
          AC3FE3C52BAED8F6F977BCEB5DF776F7F559FFD9FB56B5AAFD47ED7509006C96
          E368C7F6EF6F7CEE81872F193872E4EBCFBEB4531E9C9E4491956C283DB76D45
          9CB6CBAA5F2CEA383CA5231908B19A0F9FB8B350A84F42BC04AC7364B44554AC
          698E63553C801504242DAA8E4430015F280C3944D945B41676731F9C0DE74059
          D587DD777E1377FED35731E32BC34A6630A51AE2549F69B9B85F2F9724A18462
          FB5C983E472817973487378C293BD0E12F0544B4E7F55E5EDD356D47ACEE8ECF
          CEA177CD1AF7DCF3CEFDFB442271DBEF7FFA8F8F5389A3A8AA6A2FF73DAFDA9B
          CF5EB700F06AFBFDDFFC647D48D3BFBEF3A967DFD67FF800B216AFE4EAE46911
          14C96D0CDE2D60427FA9205880997E4B56E34C958172C1408D9B45836CA39D9C
          7F4D6D187D9419741300B48763688E0410535D7172EFD6B4C1D7D586B1F414FE
          FAAE07F0B24F85C183F8C52494B04C2FEF4227A061C253B9A20ACC3FCBD3FA91
          906530D00924D23202450D76D807D7CF9A453EA49D32B2F4556FB9F2CAF9CBAE
          BCE2773EF8818F3CA8697A7EB9EF6DD5DEDC765A0000DB67FFCBCD7250F7FFC5
          8B3B76FCE1DEFE43723E6B40E73D7ACB46DE2909792CDEE95745CDCD5B80AC8A
          4BB53E2B0BE91664AAD103543A7481D790C338538FA1235E87BA4418BD711F22
          920C395A8FACAEE1C1E79FC5D792F398A112C1218469942418D90CFC0628DAF3
          E9802D0E1D6591E4DB82204417B4445C0E406C054A6A90C0A98C9C6D80BE0DB5
          AD2DEEF5EF7FCF406777F73B3EF0E1DFA8D27455ED7561A70D00986629E4F3E9
          F9BFFAEC676E9C9E9BFFD263F77FBF4EA53260616181EA6C8BD27E4AD579D65F
          10755060664E0066CA65A51CCDE3F9607E1F9ECEEB24D75DABC6B0B67D25DA9A
          6AD1A3E6D06267505B5787FE7C01DFDB7300BB1C07597158A7422310318D1205
          7B661CF2A2BF2216781CD825137EAEEF2953A8D10328140BC8844358F4EB427B
          A494C9E2CC73CEC5E5575DF9C5FFFA877FF45BCB7D1FAB56B557DB690300AFB6
          6FDDF52F0D23FD837FB877C7EEDF3BB86F2FB2A53C72E5A23813701C43A8F588
          315F89B9FFCAF0BAF154AF2BACCCEB224881BB590DA1B3B6052BE211AC091858
          A56591A80D61772687EF0F4C506641A9BDEAA0A4C882BD97BF9F998134C71000
          C03C012A1FF19728DDD742827FDF25E70F07829439E818A4EB898442387FDDC6
          97AFBFE6DA4F9D7BDED6A7FBD6AFAF8A7154ED7565A72500B0A5A7E642FBF6BC
          74E99E3DBB3EF7C0FDF7AD3974E820BD1B1FCC3297D5948AF30EBDA0D2744FBE
          4D86019DD279BF2B3AF9F01340C455563256B125E622A25AD85B30B0BBC86C3E
          4144E9B56C99D37D0D81324FFCD904086645F0837709FC82CECBC89685529262
          9B425720130D21DADB43917FF367AFDB76C5C3575C75CDFEE5BE5F55ABDACFB2
          D3160096ECF9A79FEE78E1C7CFFDC58FFFEFB31F3C7A6400C9D40C644D422A5F
          4291D57E24EEE9331519F9A82BE83B3D6E3D4D45C9B505A7FFEAB0864BEBC3A8
          A1E8DE9F2B61889C3AE386D050584459A2886FE9F013289443DE0AB05BD10A70
          04153853786948174B08D744912DE6B072ED86272E7AEBD57FF0B14FDE34108F
          C78DE5BE4755ABDABF65A73D00B03DF3E00FA4F189C9F70C1D3C78FB3DDFFE56
          3410F06378721C39F0149EC743E87724A1002C8EED18057495527C57106F2682
          B5786B6D1DEA91C158218B21868B6204A1720AAA9561CE50482695025A0065D5
          AAA80A29629988C538F803FE20FCD128AEBA7ADBDD04409FFD8BCF7D7ED4B22C
          95ACDADFAFDAEBD6DE1000B064777FFE8BB1FEA1A37FB36BE7AE9BB8244817F2
          ACA90359D4F02E393C4B987B4D3BB109ACC954D3FB100FD6E36D35F5A8731631
          594CE3284B6D9523D0EC34FC04002AAB125B0A747F02866A40F07492F3E7CB36
          100A62219747E7AAD5B866FB75779D73CED9BF7EC9DBB6557BFA553B2DEC0D05
          00B95251B50CA3EF917BEFDFFAC8F7EEFFEADE3D2F4925A384794ACB594F8F89
          3A98F517AEE0FB06A38056D2D0106DC6B5F58D08E7C7316B1A38C68789262F07
          A584122FB7FBCA040A65DB0735E813629EC9421119CB42A2A31DAB376E38B4F5
          828BFEF29C73B6DEB7E5FCADD594BF6AA78DBDA100E0D536DE3FD875EF77BFF3
          3F1FFAFEC3EFEF1F1844811C3B4F0060BB4B9A7ECCF729C14719406BBC056F4F
          D420929BC04CD1C0881C42B9CCD4E269C84A56CC17B88A0FFE701D329902F450
          0833D90CCEBDEC525CB5FDED9F7EDF6F7CFCAF96FBFD56AD6ABF88BD610180ED
          FE7BBEABCFCCCF5D737CE8D8DD0FDCF39D805B32B1B8302FCA0283253E544FA1
          B72996C0B57531447393982D9A388E08457B3F1C390328394AF7E96B5D0DB22F
          064D0F8BD2E2ADD75D3B77C9E597BF77CBD6739E6AEAEC7697FBBD56AD6ABF88
          BDA10160C9BEFA0FFF98C827939F79E0CEBB7F37353583C552160BAE89824E25
          808FA5C903D89E08A3263F8DB9828D618461DA6102802C397F5E1C1A3A5210BA
          BF0E96E6C3F5BFF66B3BDB3BDA3FFC919B6EAE4EF455EDB4B6370500B0ED79E2
          E9E0F181C16F3E74EF7DD7EDD8B903592A098A04023A650189908EB7B4241032
          F398CA963061ABB0A4002C8B05400CA1BA9B73656CBDF44AB3BD73C527DEFDEE
          F73CBA66C3C6D9E57E4F55ABDA7FD6DE3400C036333256FFDC8F7E7CC5E197F7
          7DE9917B1F882F4C4D40774CD4EA123674365339E0E2F8420A46208812B7F94C
          1B81006502011D1B2EBAA0FFBA0FBDEFA3175F78F18EE57E1F55ABDA2FCBDE54
          00C06697CAD2F1A3830D3B9FF9F12777BEF0FCCDCF3CF2607D4272B0B1B509BA
          AC607061110BB20443D5A90C70D1B77A8D71F995DBFEA1BDA7E7D6AB6EB8AEAA
          BA5BB53794BDE900E0D5F6C53FFDB32645939FFBE137EEEEEEF0F9313F350DD4
          2530905E841588E0D26D571EDF74E659377EF0631FDB333F35D752D75C3FB9DC
          D75CB5AAFD32ED4D0D006C879EFF71CBC891235F7FE8CEAF5F514C6771747606
          AB2FD86A5EBEFDBA4713B5B51FBAFABAEBABDA7B557BC3DA9B1E00D8FA7FFC74
          E3CCCCDCAF0F1CEEFF4B2D123DAA45431FFAC06F7CFCC5E5BEAEAA55EDB5B6FF
          071E5EF38077341A140000000049454E44AE4260822800000030000000600000
          0001002000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000007873863B3F426DDA4D4E638C9192980A00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00A3A1AB094C4954810D0E15FA141546FF0D103BFF30324ED073737E2E000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000807C89
          2F302D3BCD040208FF060515FF1A2572FF0A123AFF091039FF1A193FF35F6067
          6BADAEB502000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000A3A3B40551516177110E18
          F70C0304FF101030FF2F38B5FF858DF7FF53557EFF060B3AFF030C39FF0E0F32
          FF3B3E4BB585838C1B0000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000007F838A2A353544C10F132DFF08040D
          FF1C1E65FF4F55DCFFB9B9FBFFE7EBFCFF8F94F5FF292D98FF0D103DFF0E1031
          FF0D0D32FF28233EE56162695000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000B8B4BD015D556E6C1E172DF1212466FF24247DFF2C30A1
          FF757EF3FFDDE0FBFFC4CAFCFF5C6BFCFF4152FBFF404EF8FF3942D8FF1D206F
          FF130F33FF0E0E32FF151333FD4241569788888E0C0000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00FDFEFA01A199A21E363444B80C090CFF111336FF1F2384FF404AD7FFA7ADFA
          FFE7E9FBFF8E98FBFF4251F9FF3C4DF4FF3D4BF0FF3949EFFF3A48EEFF3747EF
          FF2A37B1FF141352FF101030FF0C1132FF33334CD561616F3700000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000CECBD4
          0175708464212130EA0B0406FF090B1FFF242D98FF6473EFFFD3D8FBFFC7CDFC
          FF626AF9FF3E48F5FF3B47EEFF3746E6FF3944E4FF3B46E3FF3743E1FF3B47E3
          FF3C45E5FF4041E0FF2A298FFF0C0B41FF0B0B36FF1B1D39F74648587AADAFB2
          0400000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000706D93
          5615132FFE1D2162FF191751FF3744CEFF9EA3FAFFE4E8FAFF9699FBFF4752F3
          FF3846ECFF3747E3FF333EC3FF222C87FF1A1E60FF1C1E52FF191C52FF21216B
          FF2B319BFF3D42CFFF3D43E9FF353DCFFF18226AFF110C36FF130F34FF3C3A54
          BC7F828B20000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000057517F
          54151130FF2B369CFF6672F0FFD0D4FCFFCCD1FCFF616BF6FF3D49EBFF3A48E3
          FF2F3CC0FF191C52FF0F1114FF403E3FFF6A6A6AFF7B7A7AFF707071FF505150
          FF16151CFF091022FF212882FF3841D7FF4045E7FF3233B2FF191151FF120C33
          FF232143EB61617658B4B5C00100000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000857BC7
          3E4850D7FFA3AAFAFFECEDFCFF9CA7FBFF4553EFFF3E44E3FF3F45DAFF3033A1
          FF0D0E1AFF57575FFFABADABFFC4C3C6FFC5C5C5FFC6C6C5FFC8C8C8FFCCCCCA
          FFC3C4C2FF797B7CFF131317FF23216AFF373ECAFF3944DCFF3841D6FF23278D
          FF0C0E3BFF130D31FE423F59A37F7C8A14000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000BAB5F3
          13D6D7F8E8E4E9FBFF7885FCFF404DFAFF3A48E6FF3941DCFF3239BEFF06091C
          FF4E4E4EFFC0C0C1FFC2C2C2FFC3C3C3FFC5C6C3FFC6C6C5FFC8C8C8FFCCCCCC
          FFCFCFCFFFD1D1D1FF767777FF070911FF253297FF2D3FC4FF3540D2FF3641DA
          FF3439C2FF181969FF0B102FFF282745E268687C4A0000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00CDD1F7656270FBFE4855FCFF404BFCFF3B49E8FF3642DEFF211F6BFF070707
          FFB4B5B3FFC3C4C2FFC4C4C4FFC5C5C5FFC6C7C6FFC9C9C9FFCCCCCCFFD0D0D0
          FFD2D2D2FFD3D3D3FFCBCAD1FF14191FFF1F2572FF3238CAFF303BC8FF363CCA
          FF3440D2FF3841D4FF2D309EFF0D1541FF10122BFE39394C9A89889210000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00F8F9F20A999AF67E4D57FAFF434FFDFF3C4AF3FF3946E1FF18184DFF110E0E
          FFC5C5C5FFC5C5C5FFC6C6C6FFC7C7C7FFC9C9C9FFCECECEFFD0D0D0FFD4D4D4
          FFD5D5D5FFD7D7D7FFD4D5D9FF222434FF20277BFF3943DEFF2E39C4FF333BC5
          FF333BC5FF343BC6FF333DC5FF3436BAFF1B236BFF0A0D34FF25213DDE575A68
          4400000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00FDFDED01F6FBF9078D93F6874B53FAFE3D4BFAFF4046ECFF1E1F67FF070407
          FFACAEAFFFC9C9C9FFCACACAFFCBCBCBFFCECECEFFD2D2D2FFD5D5D5FFD7D7D7
          FFDADADAFFDBDBDBFFBBBBBDFF0D0E12FF3541B1FF3C49E1FF2D3BC4FF2F3ABF
          FF2E3ABDFF2E39B9FF3136B8FF2E38B2FF2B34B5FF252E99FF0E1652FF11152B
          FC4E495C91A9A8B1090000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000F4FEE401EAECF8019A9FF3864D55FAFD444BF9FF2B32B3FF0B0E25
          FF3D3737FFC2C2C5FFCCCCCCFFCDCDCDFFCFCFCFFFD3D3D3FFD6D6D6FFD9D9D9
          FFDBDBDBFFCFCFCFFF3B3B3BFF2A2A54FF5A6AF8FF3440D6FF2F3DC6FF3039C0
          FF2B36BAFF2A31A3FF1F287DFF2D33A3FF2C32A3FF2A31A7FF2735A4FF1C2677
          FF0E0F37FF212436D77A7D85368487961DBEC0CE010000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000FBFCF505949AF27B4455F9FC3D48F1FF26309F
          FF13133BFF35353DFF888998FFC2C5C6FFCFD0CEFFD2D3D1FFD2D5D6FFCBCCCC
          FF929392FF3C393BFF484A5EFF9FA8ECFF4C5EE4FF313DCEFF373DC9FF3239C0
          FF212877FF050914FF080205FF0E0C28FF26237FFF2B299CFF2B2D9BFF272E9E
          FF272E9AFF201D5FFF13123AFA191A44FA5C5A95948C8CB30B00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000F3F4F901A8AFF16E4B58F9FB414AED
          FF343DC6FF242C8CFF171942FF151524FF2A2D33FF393C41FF2F2C2FFF1F1F1F
          FF4C4C4CFFB2B3B4FFE2E5F5FF616EE0FF3340CFFF2F3DCBFF343BB5FF1A1846
          FF050405FF000000FF000201FF000201FF010406FF141542FF272A89FF282998
          FF2B2D98FF272EA2FF272B93FF13164EFF15154DFF474A82CA00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000FEFEFB01B6B7F460545AF8
          F6414AF1FF3B45E8FF404BF4FF4F59F3FF7D83DBFFC4C6D4FFDBDBDDFFF2F3F5
          FFDBDCF0FF9296D5FF4444C6FF353CC2FF333CC4FF2F318BFF25252EFF191A1C
          FF030201FF000000FF000000FF000002FF000000FF000001FF070412FF1B1D5D
          FF242993FF2B2A99FF2C2FA1FF2B32AEFF28278DFF161644FE5955655B000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000F9FAEF02A3ACED
          3E5361F2E94144EBFF3940D9FF353DCBFF4346C1FF5855BDFF4A54B4FF3B43AF
          FF2836ADFF2B32B2FF2F36B5FF2F37ACFF1F2254FF312A31FF252D26FF323232
          FF181818FF000000FF000000FF000000FF010101FF0D0D0DFF121218FF080909
          FF110A26FF1D2176FF252D9AFF292FA8FF3036B5FF3339BCFF424C90E1DEE5EA
          0200000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00BCC1EF27656BEAD63E44E2FF343BCBFF2D37B5FF2933ABFF2B32A5FF2832A1
          FF25319EFF2730A2FF25287CFF090A1CFF0A0709FF2A2D2BFF323534FF171717
          FF030303FF0C0C0CFF0A0A0AFF010101FF1B1B1BFF303130FF212121FF323435
          FF030302FF030308FF15153FFF222C96FF2E2FACFF292DA0FF5E5F7B8D000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000A9ACDB0F7376DDB8393FD4FF323ABEFF2C35ADFF3031A3FF272E9B
          FF2D2B8EFF13164AFF020305FF000000FF000000FF010101FF020202FF010101
          FF2D2D2DFF212121FF2F2F2FFF1C1C1CFF101010FF343434FF292929FF171717
          FF010102FF0E050FFF2E3168FF26369FFF3334B5FF5C5BAFC657596822000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000F2F2F00A898ADA90373FC8FC313AB5FF2D32A6FF272C9D
          FF171A4EFF030504FF010003FF000000FF000000FF000000FF000000FF010101
          FF2A2A2AFF2D2D2DFF1B1B1BFF1A1A1AFF19191AFF19191AFF050308FF0A0507
          FF18172DFF3A3A8CFF2D2D92FF323A9EF95B5E9A7CCACED106000000009C9FA3
          0B00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000EAEAF2019695D85C3C48C0F02736AEFF2B2EA3
          FF272B93FF141952FF06040BFF000000FF000000FF000000FF000000FF0B0C0B
          FF1B1B1BFF0D0D0DFF060606FF313131FF0A0A0AFF2A2730FF181222FF2F2E60
          FF3639A2FF2F299EFF212585FF211C35F7818485288480931044416D9E23253B
          EC7271803E948CB021ECEEEA0500000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000A9A9D926565AC0CD2F33AC
          FF27339EFF262B98FF212679FF0A0A27FF050304FF0A0005FF161017FF464646
          FF333333FF444444FF040304FF1F2128FF212725FF292845FF3F4195FF2933A0
          FF2C32AAFF2A36B3FF2C37B4FF191243FF36384EC8353D71E1222582FF111548
          FF333879F02B3098FF31314AC671727B01000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000009B98C80A6D6ABD
          933039AFFC2830A7FF2331A1FF202E96FF141A50FF03060CFF130B0DFF373737
          FF262626FF262626FF010401FF0C050CFF2E2B5EFF4244ACFF2D33ADFF3137BE
          FF303CBCFF303DBCFF2F3ABCFF292F98FF1E1E65FF24257DFF202886FF292B8B
          FF2A309CFF2536A4FF181D52FC5B5A7826000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          008A89C448454BB5DC2F35B1FF2836A8FF2732A9FF23278AFF100D2FFF0A0307
          FF080106FF04050BFF12121DFF3E4492FF3640B7FF3238B9FF313ECBFF323EC6
          FF323DC3FF303BC3FF343AC8FF3545D2FF343595FF24267EFF24247EFF171746
          FF202583FF2834A7FF1B2271FF3E3D5A6B000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000B5B4DC146C6EC99C353AB9FC3136B9FF3039B4FF2A37B3FF212076
          FF0E0C25FF2B3155FF434BBAFF323BC3FF3D46ADE69091BF6D4248D2F93640CE
          FF323FCDFF2E41C9FF3E4AE0FF414AD7FF23268DFF1D1A62FF211D2DFF1C151B
          FF191750FF2B32A8FF272B9CFF383452BC000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000A5A9DC464C56C4D5333AC3FF353BC2FF2F3BC2
          FF2F3CBFFF5A5CC6E57B7DD3855658AB958889AA16F6FAF2027C7ED0A33540D6
          FF3744D9FF4550ECFF343AB2FF1D2178FF181643FF22202EFF43393CFF3A383A
          FF090B21FF2A31A9FF2A33B0FF1C1C4DFB9D9BA4150000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000FCFFF4018A89C3086D6BCF754648D1EF2F3FCB
          FF7776CDADAEA9DA1800000000000000009EA4AE024D5174762B2974F64246DE
          FF404DDFFF272C94FF1C1F62FF1C1A27FF312E2FFF423B3AFF4A3F40FF353132
          FF090B09FF232888FF2535B1FF1E1E6DFF564B695C0000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000009DA0E11E8F94DB
          49DBDDE4020000000000000000A4A3B60A3E4175BF1F2383FF242A84FF282A8A
          FF222883FF181646FF262727FF3D3838FF504547FF3C3637FF3C3334FF5F4E51
          FF383239FF1C1C5CFF2A37B3FF2A2A9AFF373655A90000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000009E9FBF142A3397F8232A99FF212C90FF232276
          FF1C1D33FF342E31FF4F4043FF4B4042FF302D2DFF403638FF645153FF514446
          FF373032FF110E25FF2A36B3FF3036B9FF1F224BF08E8D9C0D00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000BFC2E0014C4BA7D0272F9CFF1E1E56FF26272A
          FF3C3034FF392E2FFF433638FF392D2FFF372E30FF635456FF44403AFF60524C
          FFA08C86FF130E0DFF2B2F95FF333BBEFF1A1D65FF57566F4700000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000A9AED919535CB7B0293099FF211D3BFF383535FF373132
          FF392F30FF3B2F31FF3B2F31FF3C2E31FF303030FF41393AFF77625EFF8F7974
          FFAA908CFF513E3FFF212164FF333AC0FF282D96FF40425C9800000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000005255BDB93138B8FF1B1B69FF281F22FF3E3439FF3E3335
          FF3E3335FF3E3335FF383435FF393032FF544647FFA78C89FF87746EFF9B827F
          FF6B5759FF34272AFF0E1129FF3139BFFF3337BDFF272952E68E8F9D07000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000007576CC84353ABEFF2C309EFF140A0FFF3D363FFF3D3435
          FF3E3435FF3C3334FF483D3DFF93777BFF514748FF9B8381FF786963FF59524C
          FF393434FF655456FF0B0C0EFF2932A0FF343EC7FF1A1B5EFF5E587538000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000807ACB20353CC5FC323AC1FF120B25FF323239FF373837
          FF383930FF70625BFF887771FF947F7BFF4A3C3CFF3F3436FF3F3839FF3A3738
          FF615254FF332B2CFF030406FF1E2172FF3240C5FF2B2E94FF34365C85000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000EBEFF8015E62CECB353DC9FF1F1D61FF232027FF39393B
          FF373B34FF635854FF927E7CFFA08A89FF5B4D4EFF423637FF564B4DFF4E4244
          FF140B0BFF020102FF04060FFF23298CFF3B46CAFF363391FD54568768000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000006566CC73313FC7FF2932A2FF0B0B14FF3D3C44
          FF35373AFF56494BFF897678FF363737FF403537FF5E5356FF382F30FF060404
          FF070108FF0D112EFF3032ABFF3F42C4FF293384F264639E5FBFBCD301000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000BABCE01F3644C9F92D3EC6FF100A27FF35353C
          FF3D3639FF3C3637FF3A3738FF393737FF302E2DFF171916FF060203FF040409
          FF1D1E63FF363FC8FF393AABFF454587CFA5A0C0280000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000F3F6F6016A6ED5CA333ECAFF211B60FF25232A
          FF413638FF403537FF393536FF202020FF040407FF1E1B25FF171A34FF2E2F9E
          FF3D3FC9FF2D3192FC60609898B9BBCF0A000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000807ED56C3440CBFF2E2FA2FF130E13
          FF423943FF372F31FF161011FF010201FF050508FF1C2066FF363DC5FF363EBA
          FF353187E46962944FD4D3DD0100000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000C6C7EC173F43CDFC373FC7FF0E0A1B
          FF1E1A30FF040706FF040705FF0B0A27FF252D99FF3442CEFF28329CFE555791
          AA8B87B018000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000005D64D0BD353ECCFF1E1F5A
          FF05040BFF040306FF151B54FF333EC3FF333ABDFF3A338BEB746EA260ECECE8
          0400000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000008687D4603440C9FF28319E
          FF100E20FF242F8BFF3642CEFF31339EFE444285B1A9A7C32100000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000B1B3DD134146CCF5383FCA
          FF3A3FCBFF323AB7FF363787E16D6E9D57CBCBDE010000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000005E6CD3BA383FC9
          FF343296FB4E4D88969794B61300000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000B8B6E8237D7AAF
          738F8AB134000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000FFE1FF
          FFFFFF0000FF80FFFFFFFF0000FF003FFFFFFF0000FC001FFFFFFF0000F8000F
          FFFFFF0000E00003FFFFFF0000800001FFFFFF00000000007FFFFF0000000000
          3FFFFF00000000000FFFFF000000000007FFFF000000000003FFFF0000800000
          00FFFF0000800000007FFF0000800000001FFF0000C000000003FF0000F00000
          0001FF0000F800000001FF0000FC00000000FF0000FE000000007F0000FF8000
          0000FF0000FFC0000000FF0000FFE00000017F0000FFF00000000F0000FFFC00
          0000070000FFFE000000070000FFFF800000070000FFFFC00000070000FFFFF0
          0000030000FFFFF01800030000FFFFFE3000030000FFFFFFF000010000FFFFFF
          F000010000FFFFFFE000010000FFFFFFE000000000FFFFFFE000000000FFFFFF
          E000000000FFFFFFE000000000FFFFFFF000000000FFFFFFF000030000FFFFFF
          F000070000FFFFFFF8000F0000FFFFFFF8003F0000FFFFFFFC007F0000FFFFFF
          FC01FF0000FFFFFFFC03FF0000FFFFFFFE0FFF0000FFFFFFFE3FFF0000280000
          0020000000400000000100200000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00514D5E5A2F325BDF4D52655A00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000837F8C1534323E
          AB05050DFF171B56FF0A113BFF373650A27779810F0000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000005D5E6F4E13121AE60E0B22
          FF3F44B2FFA9AEE8FF202257FF080E35FF22243BDE605E6C3B00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000008781950F3934499F1E1F5AFF21226EFF747AE2
          FFCFD2FBFF7581FCFF414EF2FF262C94FF110F3BFF151334FD3D3C518388898F
          0500000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000FCFCF6017B7383411C1A24DF0E1030FF363EB4FFAAB1F8FFB0B6FC
          FF4B57F8FF3B4AF0FF3A48ECFF3A47ECFF3241D0FF1D1E6AFF0F0E34FF2A2A46
          C963657126000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000524F696A171945FE18184FFF646CDBFFC7CCFBFF7881F7FF3B48ED
          FF3743D7FF26319EFF262B83FF242985FF2F34ABFF4043DDFF2C33B4FF12164D
          FF1A1738F34F4E64630000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000003F3A6A8A3940A5FFA4ACF7FFB4B9FAFF4F58EEFF3B46DEFF252B7E
          FF2F333DFF747373FF929291FF898A89FF58585AFF1A2139FF2E33A5FF3F43DC
          FF27278DFF100F3BFF363653AB77778914000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000A1A1F05FD7DCFBFF8894FCFF3D4AEDFF3842DAFF1E1E64FF575757
          FFC2C2C2FFC4C3C5FFC6C6C5FFC9C9C9FFCFCFCFFFAEAFB0FF171725FF2B38B0
          FF3441D2FF3239C5FF1C1966FF1D1E3CE7504E684E0000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000EFF1F9048C94F9C54752FCFF3D4AF0FF343ECBFF0C0911FFBDBDBC
          FFC4C4C4FFC6C5C6FFCACAC9FFCECECEFFD2D2D2FFD4D4D4FF535661FF262C95
          FF303AC6FF353DCAFF363FD0FF2A2E9CFF11173CFF2F2E44A066647210000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000FEFEEA01E2E6F713676EF8C93F4CF9FF343DCEFF0E0A12FFBBBCBC
          FFC9C8C8FFCBCBCBFFD0D0D0FFD4D4D4FFD8D8D8FFDADADAFF47484EFF3742BF
          FF2E3CC6FF2F3AC1FF303ABDFF3038BAFF2D34B0FF161D6DFF1E213CE2565163
          4400000000000000000000000000000000000000000000000000000000000000
          000000000000000000F5FEE501D5D7F70F7076F6C93E49F3FF191E65FF4E4C53
          FFC2C3C2FFCECECEFFD2D2D2FFD7D7D7FFD9D9D9FF8C8C8CFF36395EFF4D5DEC
          FF313DC8FF2E3ABEFF242B8AFF1C2062FF2B2F9CFF2B2FA4FF222D8EFF16194B
          FD403F5093595B7E53CFCCDD0100000000000000000000000000000000000000
          0000000000000000000000000000000000C5CBF30E717CF6BC3D48E5FF282D93
          FF22254EFF51535BFF696B6EFF5E5E61FF4F504FFF919195FF969FEAFF3443D2
          FF353CC1FF1C1D59FF010103FF010201FF08081AFF1F206DFF282C98FF2A2D9C
          FF1F2380FF15174AFF40427DAC00000000000000000000000000000000000000
          000000000000000000000000000000000000000000EDF0F70B7176F4A83F4AF0
          FF3C46E8FF4E56E3FFA0A0D3FFB9BCD7FFA6ABDCFF6265C9FF343BBFFF2C329E
          FF292939FF1D1E1EFF000000FF000000FF000000FF010003FF0F1032FF222481
          FF292D9EFF2C31ABFF232377FE4D506D5E000000000000000000000000000000
          00000000000000000000000000000000000000000000000000E4EEF202838BEE
          844145E4FE323AC5FF2B33ADFF2933A6FF2833A2FF2A32A2FF191C5AFF1A181B
          FF2E3231FF1A1A1AFF060606FF050505FF0C0C0CFF252625FF252628FF07040A
          FF15184DFF272EA0FF2D32ADFF6065966E000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          008A8CDF5C4046CFF83037B3FF2B30A1FF272782FF0A0C24FF000000FF000000
          FF010101FF0C0C0CFF292929FF292929FF080808FF212120FF161516FF08040A
          FF2B2D6BFF2A33A5FF5E60B0A45759680F000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00FEFEF301A5A7DE344751C4DF2933A9FF25288AFF0B0D2AFF010101FF000000
          FF000000FF0C0C0CFF202020FF1A1A1AFF1D1C1DFF26232CFF1B1733FF353490
          FF27278DFF3C3B60BFAFADBA07353557825B5C6B4EB1ACC41100000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000B5B4DD115457BCAE2A33A6FF272D99FF151A59FF06040A
          FF120C11FF3E3E3EFF3A3A3AFF08080AFF1D1D21FF363875FF3038A7FF2D36B2
          FF2C38B6FF1A184DFE363B73DA20247AFF282B74F823297EFF494B5D3F000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000007172BE66353EB1F02835A7FF232B8E
          FF110E31FF151013FF0C0B0EFF161729FF393E9EFF3238B8FF323CC6FF323DC0
          FF323BC4FF363FB6FF22247DFF222478FF1F2579FF2733A2FF292C4E91000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000A2A0D722575CC4BA3139BA
          FF2E39B7FF23237EFF2D326CFF3F46BFFC434BB0C18182CB743740D1FF3241CE
          FF3D49DDFF3237ABFF1A1A57FF2C2731FF151334FF2A32ABFF2D2B68DFCBCED7
          0100000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000F8FCF702686CCA
          584547CEE13543C7F57B7CCF72BBB9D211AAACC2035759816D3A3FC2FE3C48D5
          FF242881FF1E1D39FF343037FF483F3FFF151618FF252E9CFF20257EFF655C76
          3200000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00B1B4E70D9FA3E0210000000000000000484A8999212789FF262A8AFF1D2062
          FF2B272EFF443D3EFF3B3637FF514345FF443A3FFF20236FFF2B32A9FF323252
          7F00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000484DA795252C90FF202146FF352D2F
          FF46393BFF3B3031FF504345FF4A423EFF786863FF181637FF3239BDFF2F3266
          CE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000686EC06C2D3398F72B2634FF3B3336FF3C3132
          FF3B3132FF392F30FF4C4343FF8F7773FF8F7975FF34282CFF3036B2FF24287F
          FE78768D1F000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000005356C3BA2B2F9EFF251D23FF3D3436FF3E3435
          FF403838FF6E5C5FFF8D7675FF7D6D68FF4C4241FF3C3336FF202777FF2D33AB
          FF3635556E000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000006365CD5B343BC4FF18132EFF3B3B3CFF47443B
          FF86746FFF937D7BFF3E3335FF453F40FF463A3CFF181516FF14164EFF3842C8
          FF2E3267B1000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000009B9BD40F3C45C9F71C2066FF313139FF373838
          FF837172FF4B4343FF4E4345FF3C3335FF090407FF101136FF3338ADFF373D98
          E06A649D34000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000005D67D1AE2932A2FF25212BFF3F3538
          FF3B3737FF323030FF171819FF0A080DFF212172FF353BB7FF505195AFA5A0C0
          1200000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000008C8AD959363ECBFF18152EFF40373C
          FF282123FF050505FF17183CFF3037ACFF3738A4F35C58916BC9CCD401000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000C6C7EC0A4248CDF41F1E5EFF100E19
          FF030608FF191F6BFF333CBCFF494E9BC87672A5270000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000005D63D0A52A34A1FF111129
          FF2934A4FF363AA8F6655F9C7AB2A9C904000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000007175D34E373FCDFF3439B9
          FF444697BD6F709F270000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000D8DEEE0A6A6DC097635D96
          5BAEAAC601000000000000000000000000000000000000000000000000000000
          0000000000FE3FFFFFF80FFFFFF007FFFFC001FFFF0000FFFF00007FFF00001F
          FF00000FFF000003FF000001FF8000003FE000003FF000001FF800001FFE0000
          1FFE000007FF800003FFE00003FFF00001FFF80001FFFE6001FFFFE001FFFFC0
          00FFFFC000FFFFC000FFFFC000FFFFE001FFFFE003FFFFE00FFFFFF01FFFFFF0
          7FFFFFF0FF280000001000000020000000010020000000000000000000000000
          000000000000000000000000000000000000000000837F8C0527253081212651
          CE4242582C000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000433E522B242551CC6467ACFF6067CB
          FF181B50F72F2E476F88898F0100000000000000000000000000000000000000
          000000000000000000000000004140606B2A2C60F7888FE8FF5B66EEFF303CBF
          FF3039BBFF26288CFF212147B853526719000000000000000000000000000000
          000000000000000000000000007D80C1BA8791F6FF383FC3FF5B5E75FFA4A3A3
          FF9E9E9FFF44466DFF3138BBFF242570EA33334E520000000000000000000000
          00000000000000000000000000A6ADF8374A55F7F221236FFFC1C2C1FFCACACA
          FFD3D3D3FF929397FF2F39B8FF323CC6FF262C90FF222552A456516311000000
          0000000000000000000000000000000000878CF63A404ACCEE57587EFF97989A
          FF979898FF7A7D9AFF3A46D2FF1C2169FF141646FF252A8EFF262870E4333467
          8000000000000000000000000000000000000000008B90F42D4D55EAE05359CA
          FF6C73BFFF363BA1FF272949FF0F0F10FF040404FF171721FF1A1B5EFF292D9C
          FF575B843300000000000000000000000000000000000000009092E1174A50C5
          C2282D96FF060714FF000000FF181818FF1A1A1AFF1E1C25FF242364FF434794
          9A48486138BEBACC040000000000000000000000000000000000000000B5B4DD
          044A4FB385262E92FB131237FF262526FF1D1F3DFF3239A7FF2F39BBFF2A2D7D
          F6222678FD2A317CB40000000000000000000000000000000000000000000000
          00000000007074CB373D43C1CE3A409BD94F55BB744D52BDB8343EC0FF28285C
          FF28232FFF272C8BF76B627B0D00000000000000000000000000000000000000
          000000000000000000B1B4E703AAADE108484C984B23287AFF312B3EFF433A3B
          FF564A49FF252983FF30325E5300000000000000000000000000000000000000
          00000000000000000000000000000000004044ABC7322A31FF3D3334FF605152
          FF7A6864FF302E63FF323588A300000000000000000000000000000000000000
          0000000000000000000000000000000000444AC898282842FF625855FF5A4E4E
          FF342C2EFF1C1D52FF3A409DB100000000000000000000000000000000000000
          00000000000000000000000000000000006F74D442272972FF383134FF191922
          FF252673FC484AA387A5A0C00400000000000000000000000000000000000000
          0000000000000000000000000000000000C6C7EC03383DA5E613163CFF363A9B
          DB56599F3D000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000595FCB7B4547A6866F709F
          0A000000000000000000000000C3FFAC4180FFAC41007FAC41003FAC41000FAC
          418007AC41C003AC41E001AC41F001AC41FC00AC41FE00AC41FF80AC41FF80AC
          41FF80AC41FF83AC41FFC7AC41}
      end
      object imgExcelfw: TImage
        Left = 657
        Top = 282
        Width = 35
        Height = 35
        AutoSize = True
      end
      object Label23: TLabel
        Left = 313
        Top = 15
        Width = 281
        Height = 24
        Caption = 'Measurement calculation info'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'MS Reference Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object chkExcelfw: TCheckBox
        Left = 657
        Top = 354
        Width = 97
        Height = 17
        Caption = 'Send to Excel'
        Checked = True
        Enabled = False
        State = cbChecked
        TabOrder = 0
      end
      object chkOpenFilefw: TCheckBox
        Left = 657
        Top = 375
        Width = 69
        Height = 17
        Caption = 'Open file'
        TabOrder = 1
      end
      object btnOpenfw: TButton
        Left = 657
        Top = 323
        Width = 97
        Height = 25
        Caption = 'Open Excel'
        TabOrder = 2
        OnClick = btnOpenfwClick
      end
      object mem_meascalcinfo: TMemo
        Left = 263
        Top = 45
        Width = 380
        Height = 455
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Font.Quality = fqAntialiased
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 3
        OnChange = mem_meascalcinfoChange
      end
      object ListFirmware: TListView
        Left = 0
        Top = 599
        Width = 760
        Height = 109
        Align = alBottom
        Anchors = [akLeft, akTop, akRight]
        Columns = <
          item
            Caption = 'kVp (kV)'
          end
          item
            Caption = 'kV PPV (kV)'
          end
          item
            Caption = 'Dose (nGy)'
          end
          item
            Caption = 'Dose Ext. (nGy)'
          end
          item
            Caption = 'Doserate (nGy/s)'
          end
          item
            Caption = 'Doserate Ext. (nGy/s)'
          end
          item
            Caption = 'TFp (mm)'
          end
          item
            Caption = 'HVLp (mm)'
          end
          item
            Caption = 'Irradiation time (ms)'
          end
          item
            Caption = 'Irradiation time Ext. (ms)'
          end
          item
            Caption = 'Irradiation time MAS (ms)'
          end
          item
            Caption = 'Nbr Pulses'
          end
          item
            Caption = 'Nbr of pulses Ext.'
          end
          item
            Caption = 'Pulse Freq (Hz)'
          end
          item
            Caption = 'Pulse Freq Ext. (Hz)'
          end
          item
            Caption = 'Dose/Pulse (nGy/p)'
          end
          item
            Caption = 'Dose/Pulse Ext. (nGy/p)'
          end
          item
            Caption = 'Doserate/Pulse (nGy/sp)'
          end
          item
            Caption = 'Dosereate/Pulse (nGy/sp)'
          end
          item
            Caption = 'Pulse Width (ms)'
          end
          item
            Caption = 'Pulse Width Ext (ms)'
          end
          item
            Caption = 'Duty (%)'
          end
          item
            Caption = 'Duty Ext. (%)'
          end
          item
            Caption = 'Pulse Effective time (ms)'
          end
          item
            Caption = 'Pulse effective time Ext. (ms)'
          end
          item
            Caption = 'Tube charge (mAs)'
          end
          item
            Caption = 'Tube current (mA)'
          end
          item
            Caption = 'Tube charge/pulse'
          end
          item
            Caption = 'Tube current/pulse (mA/p)'
          end
          item
            Caption = 'Luminance (cd/m2)'
          end
          item
            Caption = 'Illuminance (lux)'
          end
          item
            Caption = 'Dose width ('#181'Gy*cm)'
          end
          item
            Caption = 'Dosrate width ('#181'Gy*cm/s)'
          end
          item
            Caption = ' '
          end
          item
            Caption = ' '
          end
          item
            Caption = 'kVp (kV)'
          end
          item
            Caption = 'kV PPV (kV)'
          end
          item
            Caption = 'Dose (nGy)'
          end
          item
            Caption = 'Dose Ext. (nGy)'
          end
          item
            Caption = 'Doserate (nGy/s)'
          end
          item
            Caption = 'Doserate Ext. (nGy/s)'
          end
          item
            Caption = 'TFp (mm)'
          end
          item
            Caption = 'TF PPV (mm)'
          end
          item
            Caption = 'HVLp (mm)'
          end
          item
            Caption = 'HVL (mm)'
          end
          item
            Caption = 'Irradiation time (ms)'
          end
          item
            Caption = 'Irradiation time Ext. (ms)'
          end
          item
            Caption = 'Irradiation time MAS (ms)'
          end
          item
            Caption = 'Nbr of pulses (-)'
          end
          item
            Caption = 'Nbr of pulses Ext. (-)'
          end
          item
            Caption = 'Nbr of pulses MAS (-)'
          end
          item
            Caption = 'Pulse freq (Hz)'
          end
          item
            Caption = 'Pulse freq Ext. (Hz)'
          end
          item
            Caption = 'Pulse freq MAS (Hz)'
          end
          item
            Caption = 'Dose/pulse (nGy/pulse)'
          end
          item
            Caption = 'Dose/pulse Ext. (nGy/pulse)'
          end
          item
            Caption = 'Dose rate/pulse (nGy/sp)'
          end
          item
            Caption = 'Dose rate/pulse Ext. (nGy/sp)'
          end
          item
            Caption = 'Pulse width (ms)'
          end
          item
            Caption = 'Pulse width Ext. (ms)'
          end
          item
            Caption = 'Pulse width MAS (ms)'
          end
          item
            Caption = 'Duty cycle (%)'
          end
          item
            Caption = 'Duty cycle Ext. (%)'
          end
          item
            Caption = 'Duty cycle MAS (%)'
          end
          item
            Caption = 'Pulse effective time (ms)'
          end
          item
            Caption = 'Pulse effective time Ext. (ms)'
          end
          item
            Caption = 'Pulse effective time MAS (ms)'
          end
          item
            Caption = 'Tube charge Ext. (mAs)'
          end
          item
            Caption = 'Tube charge MAS (mAs)'
          end
          item
            Caption = 'Tube current Ext. (mA)'
          end
          item
            Caption = 'Tube current MAS (mA)'
          end
          item
            Caption = 'Tube charge/pulse Ext. (mAs/pulse)'
          end
          item
            Caption = 'Tube charge/pulse MAS (mAs/pulse)'
          end
          item
            Caption = 'Tube current/pulse Ext. (mA/pulse)'
          end
          item
            Caption = 'Tube current/pulse MAS (mA/pulse)'
          end
          item
            Caption = 'Luminans (cd/m2)'
          end
          item
            Caption = 'Illuminance (lx)'
          end
          item
            Caption = 'Dose length (Gy*m))'
          end
          item
            Caption = 'Dose area (Gy*m2)'
          end
          item
            Caption = ' '
          end
          item
            Caption = ' '
          end
          item
            Caption = 'SUM1 (integ. ADC)'
          end
          item
            Caption = 'SUM2 (integ. ADC)'
          end
          item
            Caption = 'SUM3 (integ. ADC)'
          end
          item
            Caption = 'SUM4 (integ. ADC)'
          end
          item
            Caption = 'E1 (integ. ADC)'
          end
          item
            Caption = 'E2 (integ. ADC)'
          end
          item
            Caption = 'M1 (integ. ADC)'
          end
          item
            Caption = 'SUM1 (C)'
          end
          item
            Caption = 'SUM2 (C)'
          end
          item
            Caption = 'SUM3 (C)'
          end
          item
            Caption = 'SUM4 (C)'
          end
          item
            Caption = 'E1 (C)'
          end
          item
            Caption = 'E2 (C)'
          end
          item
            Caption = 'SUM1 I (A)'
          end
          item
            Caption = 'SUM2 I (A)'
          end
          item
            Caption = 'SUM3 I (A)'
          end
          item
            Caption = 'SUM4 I (A)'
          end
          item
            Caption = 'E1 I (A)'
          end
          item
            Caption = 'E2 I (A)'
          end
          item
            Caption = 'Sensivity'
          end
          item
            Caption = 'Sensitivity Ext.'
          end
          item
            Caption = ' '
          end
          item
            Caption = ' '
          end
          item
            Caption = 'S2/S1 (kV low)'
          end
          item
            Caption = 'S2/S3 (TF low)'
          end
          item
            Caption = 'S4/S2 (kV high)'
          end
          item
            Caption = 'S4/S3 (TF high)'
          end
          item
            Caption = 'kV low (kV)'
          end
          item
            Caption = 'TF low (mm)'
          end
          item
            Caption = 'kV high (kV)'
          end
          item
            Caption = 'TF high (mm)'
          end
          item
            Caption = 'Selected kV range'
          end
          item
            Caption = 'Peak level (%)'
          end
          item
            Caption = 'kVp low (kV)'
          end
          item
            Caption = 'TFp low (mm)'
          end
          item
            Caption = 'kVp high (kV)'
          end
          item
            Caption = 'TFp high (mm)'
          end
          item
            Caption = 'Selected kVp range'
          end
          item
            Caption = 'P1 method (PPV/PEAK)'
          end
          item
            Caption = 'Setting kV (Auto/PPV)'
          end
          item
            Caption = 'Charge S3 (pC)'
          end
          item
            Caption = 'Charge E1 (pC)'
          end
          item
            Caption = 'Charge E2 (pC)'
          end
          item
            Caption = 'Dose (pre energy comp) (mGy)'
          end
          item
            Caption = 'DoseCorr factor'
          end
          item
            Caption = 'Dose (post energy comp) (mGy)'
          end
          item
            Caption = ' '
          end
          item
            Caption = ' '
          end
          item
            Caption = 'S1  (integ. ADC)'
          end
          item
            Caption = 'S2  (integ. ADC)'
          end
          item
            Caption = 'S3  (integ. ADC)'
          end
          item
            Caption = 'S4  (integ. ADC)'
          end
          item
            Caption = 'S5  (integ. ADC)'
          end
          item
            Caption = 'S6  (integ. ADC)'
          end
          item
            Caption = 'S7  (integ. ADC)'
          end
          item
            Caption = 'S8  (integ. ADC)'
          end
          item
            Caption = ' '
          end
          item
            Caption = ' '
          end
          item
            Caption = 'Model'
          end
          item
            Caption = 'Serial #'
          end
          item
            Caption = 'FW version'
          end
          item
            Caption = 'Date, time'
          end>
        Groups = <
          item
            GroupID = 0
            State = [lgsNormal]
            HeaderAlign = taLeftJustify
            FooterAlign = taLeftJustify
            TitleImage = -1
          end>
        ReadOnly = True
        RowSelect = True
        PopupMenu = copyItemToClipBoard
        TabOrder = 4
        ViewStyle = vsReport
      end
      object chkEnableClipboard: TCheckBox
        Left = 657
        Top = 395
        Width = 121
        Height = 17
        Caption = 'Data to clipboard'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
      object btnDataHeaderCopy: TButton
        Left = 657
        Top = 444
        Width = 97
        Height = 25
        Caption = 'Copy data header'
        TabOrder = 6
        OnClick = btnDataHeaderCopyClick
      end
      object ClearData: TButton
        Left = 657
        Top = 475
        Width = 97
        Height = 25
        Caption = 'Clear Table'
        TabOrder = 7
        OnClick = ClearDataClick
      end
      object Panel_P1A_value: TPanel
        Left = 3
        Top = 3
        Width = 101
        Height = 24
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = '0 '
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 8
        DesignSize = (
          101
          24)
        object Panel1: TPanel
          Left = 1
          Top = -13
          Width = 25
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Caption = 'P1A'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
        end
      end
      object Panel_P1A_unit: TPanel
        Left = 3
        Top = 27
        Width = 101
        Height = 21
        Hint = 'Peak tube voltage'
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = 'kVp'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -18
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        DesignSize = (
          101
          21)
        object Panel_P1A_probe: TPanel
          Left = 0
          Top = 0
          Width = 29
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Color = clRed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold, fsItalic]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
          Visible = False
        end
      end
      object Panel_P2_value: TPanel
        Left = 3
        Top = 105
        Width = 101
        Height = 24
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = '0 '
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 10
        DesignSize = (
          101
          24)
        object Panel3: TPanel
          Left = 1
          Top = -12
          Width = 13
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Caption = 'P2'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
        end
      end
      object Panel_P2_unit: TPanel
        Left = 3
        Top = 129
        Width = 101
        Height = 21
        Hint = 'Dose'
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = 'Gy'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -18
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        DesignSize = (
          101
          21)
        object Panel_P2_probe: TPanel
          Left = 0
          Top = 0
          Width = 29
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Color = clTeal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold, fsItalic]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
          Visible = False
        end
      end
      object Panel_P4_value: TPanel
        Left = 3
        Top = 207
        Width = 101
        Height = 24
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = '0 '
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 12
        DesignSize = (
          101
          24)
        object Panel5: TPanel
          Left = 1
          Top = -4
          Width = 9
          Height = 13
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Caption = 'P4'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
        end
      end
      object Panel_P3_value: TPanel
        Left = 3
        Top = 156
        Width = 101
        Height = 24
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = '0 '
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 13
        DesignSize = (
          101
          24)
        object Panel4: TPanel
          Left = 1
          Top = -11
          Width = 9
          Height = 20
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Caption = 'P3'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
        end
      end
      object Panel_P5_value: TPanel
        Left = 3
        Top = 258
        Width = 101
        Height = 24
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = '0 '
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 15
        DesignSize = (
          101
          24)
        object Panel6: TPanel
          Left = 1
          Top = -3
          Width = 9
          Height = 12
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Caption = 'P5'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
        end
      end
      object Panel_P7_value: TPanel
        Left = 3
        Top = 360
        Width = 101
        Height = 24
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = '0 '
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 17
        DesignSize = (
          101
          24)
        object Panel8: TPanel
          Left = 1
          Top = -4
          Width = 14
          Height = 12
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Caption = 'P7'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
        end
      end
      object Panel_P7_unit: TPanel
        Left = 3
        Top = 384
        Width = 101
        Height = 21
        Hint = 'Number of pulses'
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = '# pulses'
        Color = 4692251
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -18
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 18
        DesignSize = (
          101
          21)
        object Panel_P7_probe: TPanel
          Left = 0
          Top = 0
          Width = 29
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Color = 4692251
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold, fsItalic]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
          Visible = False
        end
      end
      object Panel_P8_value: TPanel
        Left = 3
        Top = 411
        Width = 101
        Height = 24
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = '0 '
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 19
        DesignSize = (
          101
          24)
        object Panel9: TPanel
          Left = 1
          Top = -5
          Width = 14
          Height = 13
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Caption = 'P8'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
        end
      end
      object Panel_P8_unit: TPanel
        Left = 3
        Top = 435
        Width = 101
        Height = 21
        Hint = 'Pulse frequency'
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = 'Hz'
        Color = 7310596
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -18
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 20
        TabStop = True
        DesignSize = (
          101
          21)
        object Panel_P8_probe: TPanel
          Left = 0
          Top = 0
          Width = 29
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Color = 7310596
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold, fsItalic]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
          Visible = False
        end
      end
      object Panel_P9_value: TPanel
        Left = 3
        Top = 462
        Width = 101
        Height = 24
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = '0 '
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 21
        DesignSize = (
          101
          24)
        object Panel10: TPanel
          Left = 1
          Top = -15
          Width = 13
          Height = 23
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Caption = 'P9'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
        end
      end
      object Panel_P10_value: TPanel
        Left = 3
        Top = 513
        Width = 101
        Height = 24
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = '0 '
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 23
        DesignSize = (
          101
          24)
        object Panel11: TPanel
          Left = 1
          Top = -3
          Width = 18
          Height = 12
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Caption = 'P10'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
        end
      end
      object Panel_P11_value: TPanel
        Left = 123
        Top = 3
        Width = 101
        Height = 24
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = '0 '
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 25
        DesignSize = (
          101
          24)
        object Panel12: TPanel
          Left = 1
          Top = -4
          Width = 13
          Height = 12
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Caption = 'P11'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
        end
      end
      object Panel_P11_unit: TPanel
        Left = 123
        Top = 27
        Width = 101
        Height = 21
        Hint = 'Pulse width'
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = 'ms'
        Color = 2924681
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -18
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 26
        TabStop = True
        DesignSize = (
          101
          21)
        object Panel_P11_probe: TPanel
          Left = 0
          Top = 0
          Width = 29
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Color = 2924681
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold, fsItalic]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
          Visible = False
        end
      end
      object Panel_P12_value: TPanel
        Left = 123
        Top = 54
        Width = 101
        Height = 24
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = '0 '
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 27
        DesignSize = (
          101
          24)
        object Panel13: TPanel
          Left = 1
          Top = -3
          Width = 13
          Height = 12
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Caption = 'P12'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
        end
      end
      object Panel_P12_unit: TPanel
        Left = 123
        Top = 78
        Width = 101
        Height = 21
        Hint = 'Duty cycle'
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = '%'
        Color = 6280124
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -18
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 28
        DesignSize = (
          101
          21)
        object Panel_P12_probe: TPanel
          Left = 0
          Top = 0
          Width = 29
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Color = 6280124
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold, fsItalic]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
          Visible = False
        end
      end
      object Panel_P14_value: TPanel
        Left = 123
        Top = 156
        Width = 101
        Height = 24
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = '0 '
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 29
        DesignSize = (
          101
          24)
        object Panel15: TPanel
          Left = 1
          Top = -4
          Width = 13
          Height = 12
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Caption = 'P14'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
        end
      end
      object Panel_P14_unit: TPanel
        Left = 123
        Top = 180
        Width = 101
        Height = 21
        Hint = 'Tube charge'
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = 'mAs'
        Color = 2631720
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -18
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 30
        TabStop = True
        DesignSize = (
          101
          21)
        object Panel_P14_probe: TPanel
          Left = 0
          Top = 0
          Width = 29
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Color = 2631720
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold, fsItalic]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
          Visible = False
        end
      end
      object Panel_P15_value: TPanel
        Left = 123
        Top = 207
        Width = 101
        Height = 24
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = '0 '
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 31
        DesignSize = (
          101
          24)
        object Panel16: TPanel
          Left = 0
          Top = -4
          Width = 13
          Height = 12
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Caption = 'P15'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
        end
      end
      object Panel_P15_unit: TPanel
        Left = 123
        Top = 231
        Width = 101
        Height = 21
        Hint = 'Tube current'
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = 'mA'
        Color = 9211020
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -18
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 32
        DesignSize = (
          101
          21)
        object Panel_P15_probe: TPanel
          Left = 0
          Top = 0
          Width = 29
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Color = 9211020
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold, fsItalic]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
          Visible = False
        end
      end
      object Panel_P16_value: TPanel
        Left = 123
        Top = 258
        Width = 101
        Height = 24
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = '0 '
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 33
        DesignSize = (
          101
          24)
        object Panel17: TPanel
          Left = 1
          Top = -3
          Width = 21
          Height = 12
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Caption = 'P16'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
        end
      end
      object Panel_P19_value: TPanel
        Left = 123
        Top = 411
        Width = 101
        Height = 24
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = '0 '
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 35
        DesignSize = (
          101
          24)
        object Panel20: TPanel
          Left = 1
          Top = -2
          Width = 13
          Height = 12
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Caption = 'P19'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
        end
      end
      object Panel_P19_unit: TPanel
        Left = 123
        Top = 435
        Width = 101
        Height = 21
        Hint = 'Illuminance'
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = 'lux'
        Color = 9064961
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -18
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 36
        DesignSize = (
          101
          21)
        object Panel_P19_probe: TPanel
          Left = 0
          Top = 0
          Width = 29
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Color = 9064961
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold, fsItalic]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
          Visible = False
        end
      end
      object Panel_P6_value: TPanel
        Left = 3
        Top = 309
        Width = 101
        Height = 24
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = '0 '
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 37
        DesignSize = (
          101
          24)
        object Panel7: TPanel
          Left = 1
          Top = -3
          Width = 9
          Height = 12
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Caption = 'P6'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
        end
      end
      object Panel_P6_unit: TPanel
        Left = 3
        Top = 333
        Width = 101
        Height = 21
        Hint = 'Irradiation time'
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = 'ms'
        Color = 240181
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -18
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 38
        DesignSize = (
          101
          21)
        object Panel_P6_probe: TPanel
          Left = 0
          Top = 0
          Width = 29
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Color = 240181
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold, fsItalic]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
          Visible = False
        end
      end
      object Panel_P13_value: TPanel
        Left = 123
        Top = 105
        Width = 101
        Height = 24
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = '0 '
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 39
        DesignSize = (
          101
          24)
        object Panel14: TPanel
          Left = 1
          Top = -4
          Width = 13
          Height = 12
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Caption = 'P13'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
        end
      end
      object Panel_P13_unit: TPanel
        Left = 123
        Top = 129
        Width = 101
        Height = 21
        Hint = 'Effective time'
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = 'ms'
        Color = 7139468
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -18
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 40
        DesignSize = (
          101
          21)
        object Panel_P13_probe: TPanel
          Left = 0
          Top = 0
          Width = 29
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Color = 7139468
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold, fsItalic]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
          Visible = False
        end
      end
      object Panel_P17_value: TPanel
        Left = 123
        Top = 309
        Width = 101
        Height = 24
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = '0 '
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 41
        DesignSize = (
          101
          24)
        object Panel18: TPanel
          Left = 1
          Top = -4
          Width = 21
          Height = 12
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Caption = 'P17'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
        end
      end
      object Panel_P18_value: TPanel
        Left = 123
        Top = 360
        Width = 101
        Height = 24
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = '0 '
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 43
        DesignSize = (
          101
          24)
        object Panel19: TPanel
          Left = 2
          Top = -4
          Width = 21
          Height = 12
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Caption = 'P18'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
        end
      end
      object Panel_P18_unit: TPanel
        Left = 123
        Top = 384
        Width = 101
        Height = 21
        Hint = 'Luminance'
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = 'cd/m2'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -18
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 44
        DesignSize = (
          101
          21)
        object Panel_P18_probe: TPanel
          Left = 0
          Top = 0
          Width = 29
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Color = clRed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold, fsItalic]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
          Visible = False
        end
      end
      object Panel_P20_value: TPanel
        Left = 123
        Top = 462
        Width = 101
        Height = 24
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = '0 '
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 45
        DesignSize = (
          101
          24)
        object Panel21: TPanel
          Left = 1
          Top = -4
          Width = 21
          Height = 12
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Caption = 'P20'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
        end
      end
      object Panel_P20_unit: TPanel
        Left = 123
        Top = 486
        Width = 101
        Height = 21
        Hint = 'Dose width'
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = 'Gy'#8226'cm'
        Color = 13795841
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -18
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 46
        DesignSize = (
          101
          21)
        object Panel_P20_probe: TPanel
          Left = 0
          Top = 0
          Width = 29
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Color = 13795841
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold, fsItalic]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
          Visible = False
        end
      end
      object Panel_P21_value: TPanel
        Left = 123
        Top = 513
        Width = 101
        Height = 24
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = '0 '
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 47
        DesignSize = (
          101
          24)
        object Panel22: TPanel
          Left = 1
          Top = -4
          Width = 13
          Height = 12
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Caption = 'P21'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
        end
      end
      object Panel_P21_unit: TPanel
        Left = 123
        Top = 537
        Width = 101
        Height = 21
        Hint = 'Doserate width '
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = 'Gy'#8226'cm/s'
        Color = 16423425
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -18
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 48
        DesignSize = (
          101
          21)
        object Panel_P21_probe: TPanel
          Left = 0
          Top = 0
          Width = 29
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Color = 16423425
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold, fsItalic]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
          Visible = False
        end
      end
      object Panel_P1B_unit: TPanel
        Left = 3
        Top = 78
        Width = 101
        Height = 21
        Hint = 'Tube voltage'
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = 'kV'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -18
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 49
        DesignSize = (
          101
          21)
        object Panel_P1B_probe: TPanel
          Left = 0
          Top = 0
          Width = 29
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Color = clRed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold, fsItalic]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
          Visible = False
        end
      end
      object Panel_P3_unit: TPanel
        Left = 3
        Top = 180
        Width = 101
        Height = 21
        Hint = 'Dose rate'
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = 'Gy/s'
        Color = 9244765
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -18
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 51
        DesignSize = (
          101
          21)
        object Panel_P3_probe: TPanel
          Left = 0
          Top = 0
          Width = 29
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Color = 9244765
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold, fsItalic]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
          Visible = False
        end
      end
      object Panel_P4_unit: TPanel
        Left = 3
        Top = 231
        Width = 101
        Height = 21
        Hint = 'TF mm Al'
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = 'mmAlTF'
        Color = 23239
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -18
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 14
        DesignSize = (
          101
          21)
        object Panel_P4_probe: TPanel
          Left = 0
          Top = 0
          Width = 29
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Color = 23239
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold, fsItalic]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
          Visible = False
        end
      end
      object Panel_P9_unit: TPanel
        Left = 3
        Top = 486
        Width = 101
        Height = 21
        Hint = 'Dose/pulse'
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = 'nGy/p'
        Color = 11758081
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -18
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 22
        DesignSize = (
          101
          21)
        object Panel_P9_probe: TPanel
          Left = 0
          Top = 0
          Width = 29
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Color = 11758081
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold, fsItalic]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
          Visible = False
        end
      end
      object Panel_P17_unit: TPanel
        Left = 123
        Top = 333
        Width = 101
        Height = 21
        Hint = 'Tube current/pulse'
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = 'mA/p'
        Color = 11842740
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -18
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 42
        DesignSize = (
          101
          21)
        object Panel_P17_probe: TPanel
          Left = 0
          Top = 3
          Width = 29
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Color = 11842740
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold, fsItalic]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
          Visible = False
        end
      end
      object Panel_P10_unit: TPanel
        Left = 3
        Top = 537
        Width = 101
        Height = 21
        Hint = 'Dose rate/pulse'
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = 'Gy/s p'
        Color = 10043501
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -18
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 24
        DesignSize = (
          101
          21)
        object Panel_P10_probe: TPanel
          Left = 0
          Top = 0
          Width = 29
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Color = 10043501
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold, fsItalic]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
          Visible = False
        end
      end
      object Panel_P5_unit: TPanel
        Left = 3
        Top = 282
        Width = 101
        Height = 21
        Hint = 'HVL mm Al'
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = 'mmAlHVL'
        Color = 304071
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -18
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 16
        DesignSize = (
          101
          21)
        object Panel_P5_probe: TPanel
          Left = 0
          Top = 0
          Width = 26
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Color = 304071
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold, fsItalic]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
          Visible = False
        end
      end
      object Panel_P16_unit: TPanel
        Left = 123
        Top = 282
        Width = 101
        Height = 21
        Hint = 'Tube charge/pulse'
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = 'mAs/p'
        Color = 3947580
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -18
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 34
        DesignSize = (
          101
          21)
        object Panel_P16_probe: TPanel
          Left = 0
          Top = 0
          Width = 29
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Color = 3947580
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold, fsItalic]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
          Visible = False
        end
      end
      object Button3: TButton
        Left = 657
        Top = 45
        Width = 75
        Height = 25
        Caption = 'Clear Params'
        TabOrder = 52
        OnClick = ClearParamsClick
      end
      object Panel_P1B_value: TPanel
        Left = 3
        Top = 54
        Width = 101
        Height = 24
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = '0 '
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -23
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 50
        DesignSize = (
          101
          24)
        object Panel2: TPanel
          Left = 1
          Top = -13
          Width = 18
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Alignment = taLeftJustify
          Anchors = []
          BevelEdges = []
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          Caption = 'P1B'
          Color = clCaptionText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -7
          Font.Name = 'Tahoma'
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          Font.Quality = fqClearTypeNatural
          Locked = True
          ParentBiDiMode = False
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          VerticalAlignment = taAlignBottom
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'No update'
      ImageIndex = 7
      TabVisible = False
      object Label9: TLabel
        Left = 12
        Top = 48
        Width = 177
        Height = 20
        Caption = 'PPV               [kV]'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'MS Reference Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 246
        Top = 48
        Width = 176
        Height = 20
        Caption = 'kVP               [kV]'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'MS Reference Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 469
        Top = 48
        Width = 178
        Height = 20
        Caption = 'TF            [mm Al]'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'MS Reference Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 14
        Top = 152
        Width = 179
        Height = 20
        Caption = 'TFPeak      [mm Al]'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'MS Reference Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 246
        Top = 152
        Width = 177
        Height = 20
        Caption = 'Dose           [mGy]'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'MS Reference Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 469
        Top = 152
        Width = 179
        Height = 20
        Caption = 'Doserat     [mGy/s]'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'MS Reference Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 14
        Top = 256
        Width = 173
        Height = 20
        Caption = 'Radtime        [ms]'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'MS Reference Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 246
        Top = 256
        Width = 176
        Height = 20
        Caption = 'Irradtime       [ms]'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'MS Reference Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 469
        Top = 256
        Width = 171
        Height = 20
        Caption = 'HVL         [mm Al]'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'MS Reference Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 14
        Top = 360
        Width = 172
        Height = 20
        Caption = 'HVLPeak   [mm Al]'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'MS Reference Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object pnl_kv: TPanel
        Left = 12
        Top = 74
        Width = 175
        Height = 65
        BevelOuter = bvNone
        Caption = '0.0'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -37
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object pnl_kvpeak: TPanel
        Left = 246
        Top = 74
        Width = 175
        Height = 65
        BevelOuter = bvNone
        Caption = '0.0'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -37
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
      end
      object pnl_tf: TPanel
        Left = 469
        Top = 74
        Width = 175
        Height = 65
        BevelOuter = bvNone
        Caption = '0.0'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -37
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
      end
      object pnl_tfpeak: TPanel
        Left = 14
        Top = 178
        Width = 175
        Height = 65
        BevelOuter = bvNone
        Caption = '0.0'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -37
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
      end
      object pnl_dose: TPanel
        Left = 246
        Top = 178
        Width = 175
        Height = 65
        BevelOuter = bvNone
        Caption = '0.0'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -37
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 4
      end
      object pnl_doserat: TPanel
        Left = 469
        Top = 178
        Width = 175
        Height = 65
        BevelOuter = bvNone
        Caption = '0.0'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -37
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 5
      end
      object pnl_radtime: TPanel
        Left = 14
        Top = 282
        Width = 175
        Height = 65
        BevelOuter = bvNone
        Caption = '0.0'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -37
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 6
      end
      object pnl_irradtime: TPanel
        Left = 246
        Top = 282
        Width = 175
        Height = 65
        BevelOuter = bvNone
        Caption = '0.0'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -37
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 7
      end
      object pnl_hvl: TPanel
        Left = 469
        Top = 282
        Width = 175
        Height = 65
        BevelOuter = bvNone
        Caption = '0.0'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -37
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 8
      end
      object pnl_hvlpeak: TPanel
        Left = 14
        Top = 386
        Width = 175
        Height = 65
        BevelOuter = bvNone
        Caption = '0.0'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -37
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 9
      end
    end
    object DetectorTestTab: TTabSheet
      Caption = 'Detector test'
      ImageIndex = 8
      object DetectorTestBox: TGroupBox
        Left = 18
        Top = 16
        Width = 393
        Height = 222
        Caption = 'Detector test'
        Color = clMoneyGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        object TriggSignal: TLabel
          Left = 185
          Top = 132
          Width = 68
          Height = 14
          Caption = 'Trigg signal'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object DetectorTest: TButton
          Left = 288
          Top = 171
          Width = 75
          Height = 25
          Caption = 'Store'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = DetectorTestClick
        end
        object Signal2: TComboBox
          Left = 27
          Top = 87
          Width = 145
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = 'S2'
          OnChange = Signal2Change
          Items.Strings = (
            'S1'
            'S2'
            'S3'
            'S4'
            'S5'
            'S6'
            'S7'
            'S8')
        end
        object Signal3: TComboBox
          Left = 27
          Top = 125
          Width = 145
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = 'S3'
          Items.Strings = (
            'S1'
            'S2'
            'S3'
            'S4'
            'S5'
            'S6'
            'S7'
            'S8')
        end
        object Signal4: TComboBox
          Left = 27
          Top = 162
          Width = 145
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Text = 'S4'
          Items.Strings = (
            'S1'
            'S2'
            'S3'
            'S4'
            'S5'
            'S6'
            'S7'
            'S8')
        end
        object Signal1: TComboBox
          Left = 27
          Top = 49
          Width = 145
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 4
          Text = 'S1'
          Items.Strings = (
            'S1'
            'S2'
            'S3'
            'S4'
            'S5'
            'S6'
            'S7'
            'S8')
        end
      end
    end
    object TabSheet10: TTabSheet
      Caption = 'Simlulated measurement'
      ImageIndex = 9
      object GroupBox11: TGroupBox
        Left = 19
        Top = 335
        Width = 462
        Height = 218
        Caption = 'Simulated values'
        Color = clMoneyGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        object Label33: TLabel
          Left = 9
          Top = 48
          Width = 17
          Height = 16
          Caption = 'S1'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label36: TLabel
          Left = 9
          Top = 88
          Width = 17
          Height = 16
          Caption = 'S2'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label37: TLabel
          Left = 9
          Top = 128
          Width = 17
          Height = 16
          Caption = 'S3'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label38: TLabel
          Left = 9
          Top = 168
          Width = 17
          Height = 16
          Caption = 'S4'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object S1SimValEdit: TEdit
          Left = 32
          Top = 40
          Width = 121
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          TabOrder = 0
        end
        object S2SimValEdit: TEdit
          Left = 32
          Top = 80
          Width = 121
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          TabOrder = 1
        end
        object S3SimValEdit: TEdit
          Left = 32
          Top = 119
          Width = 121
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          TabOrder = 2
        end
        object S4SimValEdit: TEdit
          Left = 32
          Top = 160
          Width = 121
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          TabOrder = 3
        end
        object btnClrVal: TButton
          Left = 224
          Top = 94
          Width = 75
          Height = 25
          Caption = 'Clear'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = btnClrValClick
        end
        object btnSimVal: TButton
          Left = 224
          Top = 46
          Width = 75
          Height = 25
          Caption = 'Simulate'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = btnSimValClick
        end
      end
      object GroupBox12: TGroupBox
        Left = 19
        Top = 15
        Width = 462
        Height = 302
        Caption = 'Simulated waveform'
        Color = clMoneyGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        object Label39: TLabel
          Left = 58
          Top = 236
          Width = 57
          Height = 16
          Caption = 'Filename'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label30: TLabel
          Left = 24
          Top = 33
          Width = 91
          Height = 16
          Caption = 'Files on Cobia'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object FileNameWf: TEdit
          Left = 131
          Top = 233
          Width = 318
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object btnSaveWf: TButton
          Left = 334
          Top = 263
          Width = 115
          Height = 25
          Caption = 'Save waveform'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnSaveWfClick
        end
        object btnUpdate: TButton
          Left = 23
          Top = 55
          Width = 92
          Height = 25
          Caption = 'Update '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = 16
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnUpdateClick
        end
        object Button15: TButton
          Left = 23
          Top = 86
          Width = 92
          Height = 25
          Caption = 'Delete File'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = 16
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = btnDeleteFileClick
        end
      end
      object btnSimWf: TButton
        Left = 353
        Top = 208
        Width = 115
        Height = 25
        Caption = 'Simulate'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btnSimWfClick
      end
      object lBoxWfFiles: TListBox
        Left = 150
        Top = 49
        Width = 318
        Height = 153
        ItemHeight = 13
        TabOrder = 3
      end
    end
    object TabSheet9: TTabSheet
      Caption = 'Dose calibration'
      ImageIndex = -1
      object GroupBox8: TGroupBox
        Left = 18
        Top = 16
        Width = 393
        Height = 185
        Caption = 'Dose value'
        Color = clMoneyGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        object lbDoseS3Val: TLabel
          Left = 56
          Top = 88
          Width = 68
          Height = 16
          Caption = 'Charge S3'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object lbDoseChargeUnit: TLabel
          Left = 288
          Top = 88
          Width = 17
          Height = 16
          Caption = 'pC'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object edtDoseChargeValue: TEdit
          Left = 152
          Top = 80
          Width = 121
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '-'
        end
        object DoseStoring: TButton
          Left = 152
          Top = 136
          Width = 75
          Height = 25
          Caption = 'Copy'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = DoseStoringClick
        end
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'MAS Calibration'
      ImageIndex = 11
      object Label69: TLabel
        Left = 615
        Top = 24
        Width = 26
        Height = 13
        Caption = 'Serial'
      end
      object Label95: TLabel
        Left = 615
        Top = 56
        Width = 35
        Height = 13
        Caption = 'Version'
      end
      object GroupBox13: TGroupBox
        Left = 16
        Top = 87
        Width = 727
        Height = 306
        Caption = 'Internal MAS'
        Color = 8767480
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        object Label49: TLabel
          Left = 244
          Top = 98
          Width = 108
          Height = 16
          Caption = 'ADC Mean (raw)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Label130: TLabel
          Left = 191
          Top = 32
          Width = 5
          Height = 16
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label32: TLabel
          Left = 84
          Top = 76
          Width = 46
          Height = 16
          Caption = '75 mA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label48: TLabel
          Left = 108
          Top = 98
          Width = 86
          Height = 16
          Caption = 'Current (mA)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label50: TLabel
          Left = 27
          Top = 213
          Width = 75
          Height = 16
          Caption = 'Mean value'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label51: TLabel
          Left = 29
          Top = 243
          Width = 73
          Height = 16
          Caption = 'Gain factor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label52: TLabel
          Left = 404
          Top = 76
          Width = 55
          Height = 16
          Caption = '750 mA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label53: TLabel
          Left = 423
          Top = 98
          Width = 86
          Height = 16
          Caption = 'Current (mA)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label54: TLabel
          Left = 575
          Top = 98
          Width = 108
          Height = 16
          Caption = 'ADC Mean (raw)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object lblMASAdjustFailure: TLabel
          Left = 230
          Top = 30
          Width = 106
          Height = 36
          Caption = 'Adjustment failure!'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
          WordWrap = True
        end
        object lblMASAdjustStorageFailure: TLabel
          Left = 244
          Top = 30
          Width = 70
          Height = 36
          Caption = 'Storage failure!'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
          WordWrap = True
        end
        object lblMASAdjustmentWorking: TLabel
          Left = 13
          Top = 46
          Width = 90
          Height = 23
          Caption = 'Working'
          Color = clBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
          Visible = False
          WordWrap = True
        end
        object Label60: TLabel
          Left = 252
          Top = 270
          Width = 231
          Height = 13
          Caption = 'Gain factors are increased with 0.75 %  '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object lblMASAdjustStorageOk: TLabel
          Left = 257
          Top = 24
          Width = 155
          Height = 36
          Caption = 'Gains factors are stored correctly'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
          WordWrap = True
        end
        object edtMASAdjustADCMean75mA_1: TEdit
          Left = 244
          Top = 120
          Width = 121
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object btMASAdjustmentStart: TButton
          Left = 11
          Top = 15
          Width = 113
          Height = 25
          Caption = 'Start Adjustment'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btMASAdjustmentStartClick
        end
        object edtMASAdjustADCMean75mA_2: TEdit
          Left = 244
          Top = 150
          Width = 121
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object edtMASAdjustADCMean75mA_3: TEdit
          Left = 244
          Top = 180
          Width = 121
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object edtMASAdjustCurrent75mA_3: TEdit
          Left = 108
          Top = 180
          Width = 121
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object edtMASAdjustCurrent75mA_2: TEdit
          Left = 108
          Top = 150
          Width = 121
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object edtMASAdjustCurrent75mA_1: TEdit
          Left = 108
          Top = 120
          Width = 121
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object edtMASAdjustCurrent75mA_MeanVal: TEdit
          Left = 108
          Top = 210
          Width = 121
          Height = 24
          Color = clSkyBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object edtMASAdjustADCMean75mA_MeanVal: TEdit
          Left = 244
          Top = 210
          Width = 121
          Height = 24
          Color = clSkyBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object edtMASAdjustGainFactor75mA: TEdit
          Left = 108
          Top = 240
          Width = 121
          Height = 24
          Color = clYellow
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object edtMASAdjustCurrent750mA_1: TEdit
          Left = 423
          Top = 120
          Width = 121
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object edtMASAdjustCurrent750mA_2: TEdit
          Left = 423
          Top = 150
          Width = 121
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object edtMASAdjustCurrent750mA_3: TEdit
          Left = 423
          Top = 180
          Width = 121
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
        end
        object edtMASAdjustADCMean750mA_2: TEdit
          Left = 575
          Top = 150
          Width = 121
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
        end
        object edtMASAdjustADCMean750mA_1: TEdit
          Left = 575
          Top = 120
          Width = 121
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 14
        end
        object edtMASAdjustADCMean750mA_3: TEdit
          Left = 575
          Top = 180
          Width = 121
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 15
        end
        object edtMASAdjustCurrent750mA_MeanVal: TEdit
          Left = 423
          Top = 210
          Width = 121
          Height = 24
          Color = clSkyBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 16
        end
        object edtMASAdjustADCMean750mA_MeanVal: TEdit
          Left = 575
          Top = 210
          Width = 121
          Height = 24
          Color = clSkyBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 17
        end
        object edtMASAdjustGainFactor750mA: TEdit
          Left = 423
          Top = 240
          Width = 121
          Height = 24
          Color = clYellow
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 18
        end
      end
      object GroupBox19: TGroupBox
        Left = 16
        Top = 3
        Width = 593
        Height = 78
        Caption = 'Offset'
        Color = 8767480
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        object lblMASOffsetWorking: TLabel
          Left = 11
          Top = 45
          Width = 90
          Height = 23
          Caption = 'Working'
          Color = clBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
          Visible = False
          WordWrap = True
        end
        object Label70: TLabel
          Left = 143
          Top = 32
          Width = 59
          Height = 16
          Caption = 'High sens.'
        end
        object Label71: TLabel
          Left = 308
          Top = 32
          Width = 57
          Height = 16
          Caption = 'Low sens.'
        end
        object lblMASOffsetFailure: TLabel
          Left = 486
          Top = 30
          Width = 62
          Height = 36
          Caption = 'Offset failure!'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
          WordWrap = True
        end
        object btMASOffsetResetStart: TButton
          Left = 11
          Top = 16
          Width = 113
          Height = 25
          Caption = 'Offset Reset'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btMASOffsetResetStartClick
        end
        object edtMASCalibOffsetHigh: TEdit
          Left = 208
          Top = 29
          Width = 81
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object edtMASCalibOffsetLow: TEdit
          Left = 371
          Top = 29
          Width = 73
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
      end
      object edtMasSerialNumber: TEdit
        Left = 656
        Top = 21
        Width = 89
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
      object edtMasVersion: TEdit
        Left = 656
        Top = 51
        Width = 89
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
      object GroupBox20: TGroupBox
        Left = 16
        Top = 399
        Width = 729
        Height = 265
        Caption = 'Calibration (Check)'
        Color = 8767480
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 4
        object lblMASCalibrationWorking: TLabel
          Left = 13
          Top = 49
          Width = 90
          Height = 23
          Caption = 'Working'
          Color = clBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
          Visible = False
          WordWrap = True
        end
        object Label65: TLabel
          Left = 153
          Top = 65
          Width = 92
          Height = 12
          Caption = 'Reference (mA)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label101: TLabel
          Left = 267
          Top = 65
          Width = 112
          Height = 12
          Caption = 'Meas. Current (mA)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label68: TLabel
          Left = 385
          Top = 65
          Width = 81
          Height = 12
          Caption = 'Deviation (%)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label96: TLabel
          Left = 395
          Top = 76
          Width = 41
          Height = 12
          Caption = #177'2.0 %'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label98: TLabel
          Left = 483
          Top = 65
          Width = 54
          Height = 12
          Caption = 'Pass/Fail'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label102: TLabel
          Left = 114
          Top = 96
          Width = 24
          Height = 13
          Caption = '5 mA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label104: TLabel
          Left = 108
          Top = 120
          Width = 30
          Height = 13
          Caption = '75 mA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label105: TLabel
          Left = 102
          Top = 148
          Width = 36
          Height = 13
          Caption = '250 mA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label106: TLabel
          Left = 102
          Top = 173
          Width = 36
          Height = 13
          Caption = '750 mA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object btMASCalibrationStart: TButton
          Left = 11
          Top = 18
          Width = 113
          Height = 25
          Caption = 'Start Calibration'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btMASCalibrationStartClick
        end
        object btMasCalibrationExportRTIIS: TButton
          Left = 13
          Top = 224
          Width = 105
          Height = 25
          Caption = 'Export to RTIIS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btMasCalibrationExportRTIISClick
        end
        object edtMasCalibrationRefCur5mA: TEdit
          Left = 153
          Top = 91
          Width = 100
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object edtMasCalibrationRefCur75mA: TEdit
          Left = 153
          Top = 117
          Width = 100
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object edtMasCalibrationRefCur250mA: TEdit
          Left = 153
          Top = 143
          Width = 100
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object edtMasCalibrationRefCur750mA: TEdit
          Left = 153
          Top = 169
          Width = 100
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object edtMasCalibrationMeasCur5mA: TEdit
          Left = 267
          Top = 91
          Width = 100
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object edtMasCalibrationMeasCur75mA: TEdit
          Left = 267
          Top = 117
          Width = 100
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object edtMasCalibrationMeasCur250mA: TEdit
          Left = 267
          Top = 143
          Width = 100
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object edtMasCalibrationMeasCur750mA: TEdit
          Left = 267
          Top = 169
          Width = 100
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object edtMasCalibrationDev5mA: TEdit
          Left = 386
          Top = 91
          Width = 55
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object edtMasCalibrationDev75mA: TEdit
          Left = 386
          Top = 117
          Width = 55
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object edtMasCalibrationDev250mA: TEdit
          Left = 386
          Top = 143
          Width = 55
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
        end
        object edtMasCalibrationDev750mA: TEdit
          Left = 386
          Top = 169
          Width = 55
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
        end
        object edtMasCalibrationPass5mA: TEdit
          Left = 483
          Top = 95
          Width = 55
          Height = 19
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          BevelEdges = []
          BorderStyle = bsNone
          Color = 8767480
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 14
          Text = 'Pass'
        end
        object edtMasCalibrationPass75mA: TEdit
          Left = 483
          Top = 121
          Width = 55
          Height = 19
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          BevelEdges = []
          BorderStyle = bsNone
          Color = 8767480
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 15
          Text = 'Pass'
        end
        object edtMasCalibrationPass250mA: TEdit
          Left = 483
          Top = 147
          Width = 55
          Height = 19
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          BevelEdges = []
          BorderStyle = bsNone
          Color = 8767480
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 16
          Text = 'Pass'
        end
        object edtMasCalibrationPass750mA: TEdit
          Left = 483
          Top = 173
          Width = 55
          Height = 19
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          BevelEdges = []
          BorderStyle = bsNone
          Color = 8767480
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 17
          Text = 'Pass'
        end
      end
    end
    object TabSheet11: TTabSheet
      Margins.Top = 0
      Caption = 'Electrometer Calibration (E1)'
      ImageIndex = 12
      object Label92: TLabel
        Left = 615
        Top = 24
        Width = 26
        Height = 13
        Caption = 'Serial'
      end
      object Label93: TLabel
        Left = 615
        Top = 55
        Width = 35
        Height = 13
        Caption = 'Version'
      end
      object GroupBox15: TGroupBox
        Left = 11
        Top = 312
        Width = 743
        Height = 386
        Caption = 'Calibration (Check)'
        Color = clMoneyGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        object Label63: TLabel
          Left = 141
          Top = 64
          Width = 69
          Height = 22
          Caption = 'Current'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -18
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label64: TLabel
          Left = 141
          Top = 209
          Width = 65
          Height = 22
          Caption = 'Charge'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -18
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label67: TLabel
          Left = 156
          Top = 92
          Width = 59
          Height = 12
          Caption = 'Reference'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label75: TLabel
          Left = 244
          Top = 92
          Width = 84
          Height = 12
          Caption = 'Measured (pA)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label76: TLabel
          Left = 492
          Top = 92
          Width = 54
          Height = 12
          Caption = 'Pass/Fail'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label79: TLabel
          Left = 159
          Top = 237
          Width = 59
          Height = 12
          Caption = 'Reference'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label80: TLabel
          Left = 244
          Top = 240
          Width = 82
          Height = 12
          Caption = 'Measured (pC)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label81: TLabel
          Left = 492
          Top = 240
          Width = 54
          Height = 12
          Caption = 'Pass/Fail'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label88: TLabel
          Left = 159
          Top = 110
          Width = 50
          Height = 12
          Caption = '750,0 pA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label91: TLabel
          Left = 159
          Top = 128
          Width = 50
          Height = 12
          Caption = '7,500 nA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label94: TLabel
          Left = 159
          Top = 146
          Width = 50
          Height = 12
          Caption = '75,00 nA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label97: TLabel
          Left = 159
          Top = 164
          Width = 50
          Height = 12
          Caption = '750,0 nA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label100: TLabel
          Left = 159
          Top = 182
          Width = 50
          Height = 12
          Caption = '7500  nA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label112: TLabel
          Left = 159
          Top = 266
          Width = 51
          Height = 12
          Caption = '750,0 pC'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label113: TLabel
          Left = 159
          Top = 284
          Width = 51
          Height = 12
          Caption = '7,500 nC'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label114: TLabel
          Left = 159
          Top = 302
          Width = 51
          Height = 12
          Caption = '75,00 nC'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label115: TLabel
          Left = 159
          Top = 320
          Width = 51
          Height = 12
          Caption = '750,0 nC'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label116: TLabel
          Left = 159
          Top = 338
          Width = 51
          Height = 12
          Caption = '7500  nC'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label103: TLabel
          Left = 385
          Top = 85
          Width = 81
          Height = 12
          Caption = 'Deviation (%)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label66: TLabel
          Left = 400
          Top = 247
          Width = 41
          Height = 12
          Caption = #177'0.5 %'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label78: TLabel
          Left = 385
          Top = 237
          Width = 81
          Height = 12
          Caption = 'Deviation (%)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label82: TLabel
          Left = 400
          Top = 95
          Width = 41
          Height = 12
          Caption = #177'0.5 %'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object lblEmCalibrationWorking: TLabel
          Left = 11
          Top = 59
          Width = 113
          Height = 29
          Caption = 'Working'
          Color = clBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clBtnHighlight
          Font.Height = -24
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
          Visible = False
        end
        object Label86: TLabel
          Left = 122
          Top = 28
          Width = 218
          Height = 16
          Caption = 'Lemo connector shall be CLOSED'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object btEmCalibrationStart: TButton
          Left = 11
          Top = 25
          Width = 105
          Height = 25
          Caption = 'Start Calibration'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btEmCalibrationStartClick
        end
        object btEmCalibrationExportRTIIS: TButton
          Left = 11
          Top = 352
          Width = 105
          Height = 25
          Caption = 'Export to RTIIS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btEmCalibrationExportRTIISClick
        end
        object edtEmCalibrationCurrVal750pA: TEdit
          Left = 244
          Top = 110
          Width = 100
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object edtEmCalibrationCurrVal7nA: TEdit
          Left = 244
          Top = 128
          Width = 100
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object edtEmCalibrationCurrVal75nA: TEdit
          Left = 244
          Top = 146
          Width = 100
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object edtEmCalibrationCurrVal750nA: TEdit
          Left = 244
          Top = 164
          Width = 100
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object edtEmCalibrationCurrVal7500nA: TEdit
          Left = 244
          Top = 182
          Width = 100
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object edtEmCalibrationCurrDev750pA: TEdit
          Left = 385
          Top = 110
          Width = 55
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object edtEmCalibrationCurrDev7nA: TEdit
          Left = 385
          Top = 128
          Width = 55
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object edtEmCalibrationCurrDev75nA: TEdit
          Left = 385
          Top = 146
          Width = 55
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object edtEmCalibrationCurrDev750nA: TEdit
          Left = 385
          Top = 164
          Width = 55
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
        end
        object edtEmCalibrationCurrDev7500nA: TEdit
          Left = 385
          Top = 182
          Width = 55
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object edtEmCalibrationCurrPass750pA: TEdit
          Left = 492
          Top = 110
          Width = 55
          Height = 19
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          BevelEdges = []
          BorderStyle = bsNone
          Color = clMoneyGreen
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
          Text = 'Pass'
        end
        object edtEmCalibrationCurrPass7nA: TEdit
          Left = 492
          Top = 128
          Width = 55
          Height = 11
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          BevelEdges = []
          BorderStyle = bsNone
          Color = clMoneyGreen
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
          Text = 'Pass'
        end
        object edtEmCalibrationCurrPass75nA: TEdit
          Left = 492
          Top = 146
          Width = 55
          Height = 11
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          BevelEdges = []
          BorderStyle = bsNone
          Color = clMoneyGreen
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 14
          Text = 'Pass'
        end
        object edtEmCalibrationCurrPass750nA: TEdit
          Left = 492
          Top = 164
          Width = 55
          Height = 11
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          BevelEdges = []
          BorderStyle = bsNone
          Color = clMoneyGreen
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 15
          Text = 'Pass'
        end
        object edtEmCalibrationCurrPass7500nA: TEdit
          Left = 492
          Top = 182
          Width = 55
          Height = 11
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          BevelEdges = []
          BorderStyle = bsNone
          Color = clMoneyGreen
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 16
          Text = 'Pass'
        end
        object edtEmCalibrationChargeVal750pC: TEdit
          Left = 243
          Top = 266
          Width = 100
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 17
        end
        object edtEmCalibrationChargeVal7nC: TEdit
          Left = 243
          Top = 284
          Width = 100
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 18
        end
        object edtEmCalibrationChargeVal75nC: TEdit
          Left = 243
          Top = 302
          Width = 100
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 19
        end
        object edtEmCalibrationChargeVal750nC: TEdit
          Left = 243
          Top = 320
          Width = 100
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 20
        end
        object edtEmCalibrationChargeVal7500nC: TEdit
          Left = 243
          Top = 338
          Width = 100
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 21
        end
        object edtEmCalibrationChargeDev750pC: TEdit
          Left = 385
          Top = 266
          Width = 55
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 22
        end
        object edtEmCalibrationChargeDev7nC: TEdit
          Left = 385
          Top = 284
          Width = 55
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 23
        end
        object edtEmCalibrationChargeDev75nC: TEdit
          Left = 385
          Top = 302
          Width = 55
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 24
        end
        object edtEmCalibrationChargeDev750nC: TEdit
          Left = 385
          Top = 320
          Width = 55
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 25
        end
        object edtEmCalibrationChargeDev7500nC: TEdit
          Left = 385
          Top = 338
          Width = 55
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 26
        end
        object edtEmCalibrationChargePass750pC: TEdit
          Left = 492
          Top = 266
          Width = 55
          Height = 19
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          BevelEdges = []
          BorderStyle = bsNone
          Color = clMoneyGreen
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 27
          Text = 'Pass'
        end
        object edtEmCalibrationChargePass7nC: TEdit
          Left = 492
          Top = 284
          Width = 55
          Height = 19
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          BevelEdges = []
          BorderStyle = bsNone
          Color = clMoneyGreen
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 28
          Text = 'Pass'
        end
        object edtEmCalibrationChargePass75nC: TEdit
          Left = 492
          Top = 302
          Width = 55
          Height = 19
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          BevelEdges = []
          BorderStyle = bsNone
          Color = clMoneyGreen
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 29
          Text = 'Pass'
        end
        object edtEmCalibrationChargePass750nC: TEdit
          Left = 492
          Top = 320
          Width = 55
          Height = 19
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          BevelEdges = []
          BorderStyle = bsNone
          Color = clMoneyGreen
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 30
          Text = 'Pass'
        end
        object edtEmCalibrationChargePass7500nC: TEdit
          Left = 492
          Top = 338
          Width = 55
          Height = 19
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          TabStop = False
          BevelEdges = []
          BorderStyle = bsNone
          Color = clMoneyGreen
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 31
          Text = 'Pass'
        end
      end
      object GroupBox18: TGroupBox
        Left = 11
        Top = 3
        Width = 598
        Height = 78
        Caption = 'Offset'
        Color = clMoneyGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        object Label84: TLabel
          Left = 120
          Top = 20
          Width = 201
          Height = 16
          Caption = 'Lemo connector shall be OPEN'
        end
        object Label89: TLabel
          Left = 151
          Top = 47
          Width = 68
          Height = 16
          Caption = 'High sens.'
        end
        object Label90: TLabel
          Left = 349
          Top = 47
          Width = 66
          Height = 16
          Caption = 'Low sens.'
        end
        object lblEmOffsetWorking: TLabel
          Left = 11
          Top = 47
          Width = 90
          Height = 23
          Caption = 'Working'
          Color = clBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnHighlight
          Font.Height = -19
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
          Visible = False
        end
        object lblEmOffsetFailure: TLabel
          Left = 522
          Top = 32
          Width = 62
          Height = 36
          Caption = 'Offset failure!'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
          WordWrap = True
        end
        object btEmOffsetReset: TButton
          Left = 11
          Top = 16
          Width = 94
          Height = 25
          Caption = 'Offset reset'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btEmOffsetResetClick
        end
        object edtEmOffsetHigh: TEdit
          Left = 227
          Top = 45
          Width = 84
          Height = 24
          NumbersOnly = True
          ReadOnly = True
          TabOrder = 1
        end
        object edtEmOffsetLow: TEdit
          Left = 421
          Top = 45
          Width = 84
          Height = 24
          NumbersOnly = True
          ReadOnly = True
          TabOrder = 2
        end
      end
      object GroupBox14: TGroupBox
        Left = 11
        Top = 84
        Width = 743
        Height = 225
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Caption = 'Adjustment (Calibration)'
        Color = clMoneyGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 2
        object edtCal80nC_1: TEdit
          Left = 89
          Top = 77
          Width = 72
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object edtCal80nC_2: TEdit
          Left = 89
          Top = 107
          Width = 72
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object edtCal80nC_3: TEdit
          Left = 89
          Top = 137
          Width = 72
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object edtCal10uC_1: TEdit
          Left = 202
          Top = 77
          Width = 71
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object edtCal10uC_2: TEdit
          Left = 202
          Top = 107
          Width = 71
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object edtCal10uC_3: TEdit
          Left = 202
          Top = 137
          Width = 71
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object edtGain80nC: TEdit
          Left = 89
          Top = 192
          Width = 72
          Height = 24
          Color = 8454143
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object edtGain10uC: TEdit
          Left = 202
          Top = 192
          Width = 71
          Height = 24
          Color = 8454143
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          NumbersOnly = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object GroupBox16: TGroupBox
          Left = 0
          Top = 16
          Width = 740
          Height = 287
          Caption = 'Calibration'
          Color = clMoneyGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 8
          object Edit2: TEdit
            Left = 89
            Top = 77
            Width = 72
            Height = 24
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            NumbersOnly = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object Edit3: TEdit
            Left = 89
            Top = 107
            Width = 72
            Height = 24
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            NumbersOnly = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object Edit4: TEdit
            Left = 89
            Top = 137
            Width = 72
            Height = 24
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            NumbersOnly = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object Edit5: TEdit
            Left = 202
            Top = 77
            Width = 71
            Height = 24
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            NumbersOnly = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object Edit6: TEdit
            Left = 202
            Top = 107
            Width = 71
            Height = 24
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            NumbersOnly = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object Edit7: TEdit
            Left = 202
            Top = 137
            Width = 71
            Height = 24
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            NumbersOnly = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object Edit8: TEdit
            Left = 89
            Top = 192
            Width = 72
            Height = 24
            Color = 8454143
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            NumbersOnly = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
          end
          object Edit9: TEdit
            Left = 202
            Top = 192
            Width = 71
            Height = 24
            Color = 8454143
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            NumbersOnly = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
          end
          object Button5: TButton
            Left = 462
            Top = 232
            Width = 105
            Height = 25
            Caption = 'Start Calibration'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
          end
          object GroupBox17: TGroupBox
            Left = -3
            Top = -20
            Width = 743
            Height = 254
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            ParentCustomHint = False
            BiDiMode = bdLeftToRight
            Color = clMoneyGreen
            Ctl3D = True
            DoubleBuffered = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            ParentBackground = False
            ParentBiDiMode = False
            ParentColor = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 9
            object Label57: TLabel
              Left = 397
              Top = 54
              Width = 110
              Height = 16
              Caption = 'Low Sensitivity'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label58: TLabel
              Left = 222
              Top = 54
              Width = 113
              Height = 16
              Caption = 'High sensitivity'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label59: TLabel
              Left = 522
              Top = 97
              Width = 15
              Height = 13
              Caption = 'pA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label61: TLabel
              Left = 522
              Top = 127
              Width = 15
              Height = 13
              Caption = 'pA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label62: TLabel
              Left = 522
              Top = 157
              Width = 15
              Height = 13
              Caption = 'pA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label73: TLabel
              Left = 357
              Top = 97
              Width = 15
              Height = 13
              Caption = 'pA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label74: TLabel
              Left = 357
              Top = 127
              Width = 15
              Height = 13
              Caption = 'pA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label83: TLabel
              Left = 357
              Top = 157
              Width = 15
              Height = 13
              Caption = 'pA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label87: TLabel
              Left = 137
              Top = 202
              Width = 63
              Height = 13
              Caption = 'Gain factor'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label55: TLabel
              Left = 263
              Top = 70
              Width = 33
              Height = 13
              Caption = '50 nA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object Label56: TLabel
              Left = 441
              Top = 70
              Width = 33
              Height = 13
              Caption = '10 '#181'A'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object lblEmAdjustmentFailure: TLabel
              Left = 13
              Top = 127
              Width = 101
              Height = 36
              BiDiMode = bdLeftToRight
              Caption = 'Adjustment failure!'
              Color = clMoneyGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clRed
              Font.Height = -16
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentColor = False
              ParentFont = False
              Visible = False
              WordWrap = True
            end
            object lblEmAdjustmentWorking: TLabel
              Left = 11
              Top = 67
              Width = 113
              Height = 29
              Caption = 'Working'
              Color = clBlue
              Font.Charset = ANSI_CHARSET
              Font.Color = clBtnHighlight
              Font.Height = -24
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Transparent = False
              Visible = False
            end
            object Label85: TLabel
              Left = 125
              Top = 35
              Width = 218
              Height = 16
              Caption = 'Lemo connector shall be CLOSED'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object lblEmAdjustmentStorageFailure: TLabel
              Left = 13
              Top = 160
              Width = 70
              Height = 36
              BiDiMode = bdLeftToRight
              Caption = 'Storage failure!'
              Color = clMoneyGreen
              Font.Charset = ANSI_CHARSET
              Font.Color = clRed
              Font.Height = -16
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentColor = False
              ParentFont = False
              Visible = False
              WordWrap = True
            end
            object lblEmStorageOk: TLabel
              Left = 11
              Top = 102
              Width = 155
              Height = 36
              Caption = 'Gains factors are stored correctly'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -16
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
              WordWrap = True
            end
            object edtEmAdjustmentHsCurrent_1: TEdit
              Left = 224
              Top = 93
              Width = 127
              Height = 24
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Verdana'
              Font.Style = []
              NumbersOnly = True
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object edtEmAdjustmentHsCurrent_2: TEdit
              Left = 224
              Top = 123
              Width = 127
              Height = 24
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Verdana'
              Font.Style = []
              NumbersOnly = True
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object edtEmAdjustmentHsCurrent_3: TEdit
              Left = 224
              Top = 153
              Width = 127
              Height = 24
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Verdana'
              Font.Style = []
              NumbersOnly = True
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object edtEmAdjustmentLsCurrent_1: TEdit
              Left = 397
              Top = 93
              Width = 119
              Height = 24
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Verdana'
              Font.Style = []
              NumbersOnly = True
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object edtEmAdjustmentLsCurrent_2: TEdit
              Left = 397
              Top = 123
              Width = 119
              Height = 24
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Verdana'
              Font.Style = []
              NumbersOnly = True
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
            end
            object edtEmAdjustmentLsCurrent_3: TEdit
              Left = 397
              Top = 153
              Width = 119
              Height = 24
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Verdana'
              Font.Style = []
              NumbersOnly = True
              ParentFont = False
              ReadOnly = True
              TabOrder = 5
            end
            object edEmAdjustmenttHsGain: TEdit
              Left = 224
              Top = 196
              Width = 127
              Height = 24
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Verdana'
              Font.Style = []
              NumbersOnly = True
              ParentFont = False
              ReadOnly = True
              TabOrder = 6
            end
            object edEmAdjustmenttLsGain: TEdit
              Left = 397
              Top = 196
              Width = 119
              Height = 24
              Color = 8454143
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Verdana'
              Font.Style = []
              NumbersOnly = True
              ParentFont = False
              ReadOnly = True
              TabOrder = 7
            end
            object btEmAdjustmentStart: TButton
              Left = 11
              Top = 30
              Width = 105
              Height = 25
              Caption = 'Start Adjustment'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
              OnClick = btEmAdjustmentStartClick
            end
          end
        end
      end
      object edtEmSerialNumber: TEdit
        Left = 656
        Top = 21
        Width = 89
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
      object edtEmVersion: TEdit
        Left = 656
        Top = 51
        Width = 89
        Height = 21
        ReadOnly = True
        TabOrder = 4
      end
    end
    object T: TTabSheet
      Caption = 'Electrometer (E1)'
      ImageIndex = 10
      object GroupBox10: TGroupBox
        Left = 18
        Top = 16
        Width = 411
        Height = 401
        Caption = 'External Probe E1 Electrometer'
        Color = clMoneyGreen
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        object Charge: TLabel
          Left = 138
          Top = 93
          Width = 46
          Height = 16
          Caption = 'Charge'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label34: TLabel
          Left = 325
          Top = 98
          Width = 17
          Height = 16
          Caption = 'pC'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label41: TLabel
          Left = 14
          Top = 144
          Width = 171
          Height = 16
          Caption = 'Electrom. mean raw value'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label43: TLabel
          Left = 135
          Top = 193
          Width = 49
          Height = 16
          Caption = 'Current'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label45: TLabel
          Left = 153
          Top = 241
          Width = 31
          Height = 16
          Caption = 'Time'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label46: TLabel
          Left = 325
          Top = 241
          Width = 18
          Height = 16
          Caption = 'ms'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label47: TLabel
          Left = 100
          Top = 289
          Width = 85
          Height = 16
          Caption = '# of samples'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 325
          Top = 193
          Width = 17
          Height = 16
          Caption = 'pA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object edtElectrometerVal: TEdit
          Left = 190
          Top = 90
          Width = 121
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = '-'
        end
        object Button2: TButton
          Left = 176
          Top = 344
          Width = 97
          Height = 25
          Caption = 'Copy Current'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnCurrentClick
        end
        object edtElectrometerRaw: TEdit
          Left = 191
          Top = 136
          Width = 121
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          Text = '-'
        end
        object edtCurrent: TEdit
          Left = 190
          Top = 185
          Width = 121
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Text = '-'
        end
        object edtTime: TEdit
          Left = 190
          Top = 233
          Width = 121
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          Text = '-'
        end
        object edtSamples: TEdit
          Left = 191
          Top = 281
          Width = 121
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          Text = '-'
        end
        object btnCharge: TButton
          Left = 40
          Top = 344
          Width = 105
          Height = 25
          Caption = 'Copy Charge'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnClick = Button2Click
        end
        object Button4: TButton
          Left = 304
          Top = 344
          Width = 83
          Height = 25
          Caption = 'Clear'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnClick = Button4Click
        end
      end
    end
    object ChinakVDoseAdjustmentTabSheet: TTabSheet
      Caption = 'kV/dose adjustment'
      ImageIndex = 13
      object GroupBox21: TGroupBox
        Left = 16
        Top = 16
        Width = 673
        Height = 409
        Caption = 'kV/dose adjustment for China market'
        Color = clMoneyGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        object Label107: TLabel
          Left = 97
          Top = 75
          Width = 40
          Height = 19
          Caption = 'kV = '
        end
        object Label108: TLabel
          Left = 231
          Top = 75
          Width = 12
          Height = 19
          Caption = '+'
        end
        object Label109: TLabel
          Left = 328
          Top = 75
          Width = 32
          Height = 19
          Caption = '* kV'
        end
        object Label110: TLabel
          Left = 415
          Top = 75
          Width = 58
          Height = 19
          Caption = 'Unit: kV'
        end
        object Label111: TLabel
          Left = 80
          Top = 155
          Width = 57
          Height = 19
          Caption = 'Dose = '
        end
        object Label117: TLabel
          Left = 231
          Top = 155
          Width = 12
          Height = 19
          Caption = '+'
        end
        object Label118: TLabel
          Left = 328
          Top = 155
          Width = 49
          Height = 19
          Caption = '* Dose'
        end
        object Label119: TLabel
          Left = 415
          Top = 155
          Width = 68
          Height = 19
          Caption = 'Unit: '#181'Gy'
        end
        object ChinakVAdjReset: TButton
          Left = 364
          Top = 264
          Width = 185
          Height = 57
          Caption = 'Reset'
          TabOrder = 0
          OnClick = ChinakVAdjResetClick
        end
        object edtChinakV_k0: TEdit
          Left = 143
          Top = 72
          Width = 82
          Height = 27
          TabOrder = 1
        end
        object edtChinakV_k1: TEdit
          Left = 249
          Top = 72
          Width = 73
          Height = 27
          TabOrder = 2
        end
        object edtChinaDose_d0: TEdit
          Left = 143
          Top = 152
          Width = 82
          Height = 27
          TabOrder = 3
        end
        object edtChinaDose_d1: TEdit
          Left = 249
          Top = 152
          Width = 73
          Height = 27
          TabOrder = 4
        end
        object ChinakVAdjSet: TButton
          Left = 143
          Top = 264
          Width = 185
          Height = 57
          Caption = 'Set'
          TabOrder = 5
          OnClick = ChinakVAdjSetClick
        end
      end
    end
    object autoTest: TTabSheet
      Caption = 'Automatic Test'
      ImageIndex = 14
      ExplicitLeft = 3
      ExplicitTop = 23
      object atCmdTxt: TEdit
        Left = 112
        Top = 160
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object atSendCmd: TButton
        Left = 112
        Top = 208
        Width = 109
        Height = 25
        Caption = 'Send Command'
        TabOrder = 2
        OnClick = atSendCmdClick
      end
      object atLogs: TMemo
        Left = 112
        Top = 256
        Width = 185
        Height = 200
        TabStop = False
        Lines.Strings = (
          'atLogs')
        ParentShowHint = False
        ScrollBars = ssVertical
        ShowHint = False
        TabOrder = 1
      end
      object atCmdCounter: TEdit
        Left = 272
        Top = 160
        Width = 33
        Height = 21
        TabOrder = 3
      end
      object atOpenTC: TButton
        Left = 120
        Top = 504
        Width = 101
        Height = 25
        Caption = 'Open Test Case'
        TabOrder = 4
        OnClick = atOpenTCClick
      end
      object atSaveTC: TButton
        Left = 272
        Top = 504
        Width = 97
        Height = 25
        Caption = 'Save Test Case'
        TabOrder = 5
        OnClick = atSaveTCClick
      end
    end
  end
  object Panel23: TPanel
    Left = 0
    Top = 737
    Width = 768
    Height = 24
    Align = alBottom
    TabOrder = 1
    object ConnectionStatus: TPanel
      Left = 629
      Top = -9
      Width = 134
      Height = 41
      Caption = 'Cobia connection'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object gpibConnectionStatus: TPanel
      Left = 467
      Top = -9
      Width = 161
      Height = 41
      Caption = 'Calibrator connection'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object pnlFlukeConnected: TPanel
      Left = 344
      Top = -9
      Width = 128
      Height = 41
      Caption = 'FLUKE connection'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object ApplicationEvents: TApplicationEvents
    OnMessage = ApplicationEventsMessage
    Left = 960
    Top = 104
  end
  object ImageList1: TImageList
    Left = 952
    Top = 40
    Bitmap = {
      494C010102000800840410001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C1C0
      C65AC0C1C85A0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000092929200929292009292
      9200929292009292920092929200929292009292920092929200929292009292
      92009292920092929200929292000000000000000000000000002A2930E63F44
      B2FF202257FF3E4054DE00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000092929200C6C6C500C6C6C500C6C6
      C500C6C6C500C6C6C500C6C6C500C6C6C500C6C6C500C6C6C500C6C6C500C6C6
      C500C6C6C500C6C6C500C6C6C50092929200DDDBDF410E1030FFAAB1F8FF4B57
      F8FF3A48ECFF3241D0FF0F0E34FFE7E8E9260000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000092929200C6C6C500E9E9E9009292
      9200929292009292920092929200929292009292920092929200929292009292
      920092929200DFDFDF00C6C6C500929292003940A5FFB4B9FAFF3B46DEFF2F33
      3DFF929291FF58585AFF2E33A5FF27278DFF78788BAB00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000092929200C6C6C500EBEBEB009292
      9200E9E9E900E9E9E900E8E8E800CD671D00E6E6E600E5E5E500E4E4E400E3E3
      E300E2E2E200E1E1E100C6C6C50092929200A6ACFAC53D4AF0FF0C0911FFC4C4
      C4FFCACAC9FFD2D2D2FF535661FF303AC6FF363FD0FF11173CFFF5F5F6100000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000092929200C6C6C500EEEEEE009292
      9200ECECEC00EBEBEB00EAEAEA00E9E9E900E8E8E800E7E7E700E6E6E6001515
      B300E4E4E400E3E3E300C6C6C50092929200FEFEFE018E93F7C9191E65FFC2C3
      C2FFD2D2D2FFD9D9D9FF36395EFF313DC8FF242B8AFF2B2F9CFF222D8EFF9090
      9A93FEFEFE010000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000092929200C6C6C500F0F0F0009292
      9200EEEEEE00EDEDED00ECECEC001515B300EAEAEA00CD671D00E8E8E800E7E7
      E700E6E6E600E5E5E500C6C6C500929292000000000000000000A1A4F7A83C46
      E8FFA0A0D3FFA6ABDCFF343BBFFF292939FF000000FF000000FF0F1032FF292D
      9EFF232377FE0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000092929200C6C6C500F2F2F2009292
      9200F0F0F0001515B300EEEEEE00EDEDED00ECECEC00EBEBEB00EAEAEA00CD67
      1D00E9E9E900E8E8E800C6C6C50092929200000000000000000000000000D4D5
      F35C3037B3FF272782FF000000FF010101FF292929FF080808FF161516FF2B2D
      6BFF9798CCA40000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000092929200C6C6C500F4F4F4009292
      9200F2F2F200F1F1F100F0F0F000EFEFEF00EFEFEF001515B300EDEDED00ECEC
      EC00EBEBEB00EAEAEA00C6C6C500929292000000000000000000000000000000
      0000FAFAFC112A33A6FF151A59FF120C11FF3A3A3AFF1D1D21FF3038A7FF2C38
      B6FF535787DA2D3077F8D2D2D63F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000092929200C6C6C500F6F6F6009292
      9200F5F5F500CD671D00F3F3F300F2F2F200F1F1F100F0F0F000EFEFEF00EEEE
      EE00EDEDED00ECECEC00C6C6C500929292000000000000000000000000000000
      000000000000000000008488D3BA2E39B7FF2D326CFF7076C3C13740D1FF3D49
      DDFF1A1A57FF151334FF47457ADF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000092929200C6C6C500FBFBFB009292
      9200F7F7F700F6F6F600F5F5F500F4F4F400F3F3F300F2F2F200F1F1F100F0F0
      F000EFEFEF00EEEEEE00C6C6C500929292000000000000000000000000000000
      0000000000000000000000000000FBFBFD0D000000009192B899262A8AFF2B27
      2EFF3B3637FF443A3FFF2B32A9FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000092929200C6C6C500C6C6C500C6C6
      C500C6C6C500C6C6C500C6C6C500C6C6C500C6C6C500C6C6C500C6C6C500C6C6
      C500C6C6C500C6C6C500C6C6C500929292000000000000000000000000000000
      0000000000000000000000000000000000000000000033399BF73B3336FF3B31
      32FF4C4343FF8F7975FF3036B2FFEEEEF11F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000092929200C6C6C500D5D5D500D5D5
      D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5D500D5D5
      D500D5D5D500D5D5D500C6C6C500929292000000000000000000000000000000
      00000000000000000000000000000000000000000000343BC4FF3B3B3CFF8674
      6FFF3E3335FF463A3CFF14164EFF6D7095B10000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000092929200C6C6C500C6C6C500C6C6
      C500C6C6C500C6C6C500C6C6C500C6C6C500C6C6C500C6C6C500C6C6C500C6C6
      C500C6C6C500C6C6C500C6C6C500929292000000000000000000000000000000
      000000000000000000000000000000000000000000009097DFAE25212BFF3B37
      37FF171819FF212172FF8687B6AF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000092929200929292009292
      9200929292009292920092929200929292009292920092929200929292009292
      9200929292009292920092929200000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCFCFE0A1F1E5EFF0306
      08FF333CBCFFEAE9F12700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000373FCDFF7475
      B1BD000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFE7FF000000008001C3FF00000000
      000000FF000000000000007F000000000000001F000000000000000700000000
      0000C007000000000000E007000000000000F001000000000000FC0100000000
      0000FE81000000000000FF80000000000000FF80000000000000FF8100000000
      8001FF8300000000FFFFFFCF0000000000000000000000000000000000000000
      000000000000}
  end
  object imglstExcel: TImageList
    BkColor = 14653050
    DrawingStyle = dsTransparent
    Height = 34
    Width = 34
    Left = 896
    Top = 240
    Bitmap = {
      494C0101020004007404220022007A96DF00FF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000880000002200000001002000000000004048
      0000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A008080800080808000DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A000000000080808000DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A008080800080808000DF96
      7A007B6C4C00685735005A471F0055421C0055421C0055421C00473718003D3F
      21001C9F790011BA910011BA910011BA910011BA910011BA910011BA910011BA
      910011BA910011BA910011BA910011BA910011BA910011BA910011BA910011BA
      910011B48C0010AD870010A6810039A78C00DF967A00DF967A00DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A008080
      8000000000000000000000000000DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A008080800080808000DF96
      7A0085785D0066593D00544525004F3D1A004F3D1A004F3D1A00392D13002663
      440010AD870010AD870010AD870010AD870010AD870010AD870010AD870010AD
      870010AD870010AD870010AD870010AD870010AD870010AD870010AD870010AD
      870010A681000E9876000E98760054A69100DF967A00DF967A00DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A0080808000000000000000
      000000000000DF967A000000000080808000DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A008080800080808000DF96
      7A0085785D0066593D005445250047371800473718004737180032271000258A
      6B003EB699003EB699003EB699003EB699003EB699003EB699003EB699003EB6
      99003EB699003EB699003EB699003EB6990038B395001DA8870010A6810010A6
      81000EA07C000C8C6D000C8C6D0094BEB200DF967A00DF967A00DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A0080808000000000000000000000000000DF96
      7A00C0C0C000C0C0C0000000000000000000DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A008080800080808000DF96
      7A0081745B0066593D00544525004737180047371800473718002E2A130051BA
      9F0092D5C50092D5C50092D5C50092D5C50092D5C50092D5C50092D5C50092D5
      C50092D5C50092D5C50092D5C50092D5C50092D5C50092D5C5000EA07C000EA0
      7C000E9876000C8C6D000C846700DF967A00DF967A00DF967A00DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A0080808000000000000000000000000000DF967A00C0C0C000C0C0
      C000DF967A00DF967A00DF967A000000000080808000DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A008080800080808000DF96
      7A0081745B0066593D00544525004737180047371800473718002740280066C5
      AE0092D5C50092D5C50092D5C50092D5C50092D5C50092D5C50092D5C50092D5
      C50092D5C50092D5C50092D5C50092D5C50092D5C50092D5C50010A6810010A6
      81000E9876000C8C6D001D886E00DF967A00DF967A00DF967A00DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A008080
      8000000000000000000000000000DF967A00C0C0C000C0C0C000DF967A008000
      000080000000C0C0C000C0C0C0000000000000000000DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A008080800080808000DF96
      7A0081745B006C5E4200594928004F3D1A00473718003F3215002553380093DA
      C90010A6810010A6810010A6810010A6810010A6810093DAC90093DAC90010A6
      810010A6810010A6810010A6810010A6810093DAC90093DAC90018AD890010A6
      81000E9876000C8C6D002D8E7600DF967A00DF967A00DF967A00DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A0080808000000000000000
      000000000000DF967A00C0C0C000C0C0C000DF967A0080000000800000000000
      FF000000FF00DF967A00DF967A00DF967A0000000000DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A008080800080808000DF96
      7A0081745B006C5E4200594928004F3D1A004F3D1A0047371800235C400093DA
      C90010AD870010AD870010AD870010AD870010AD870093DAC90093DAC90010AD
      870010AD870010AD870010AD870010AD870093DAC90093DAC90018B48E0010AD
      87000EA07C000C8C6D0040968000DF967A00DF967A00DF967A00DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00DF967A00DF96
      7A00DF967A00DF967A00808080000000000000000000DF967A00C0C0C000C0C0
      C000DF967A00DF967A0080000000FF00FF00FF00FF00FF000000FF0000008080
      80000000FF000000FF00DF967A00DF967A00DF967A0080808000DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A008080800080808000DF96
      7A0085785D00726547005F4F2C0055421C004F3D1A0047371800236E4F0096E1
      CE0033C29F0033C29F0033C29F0033C29F0033C29F0096E1CE0096E1CE003FC6
      A50033C29F0033C29F003FC6A5003FC6A50096E1CE0096E1CE0018BB930011B4
      8C000EA07C000C8C6D004E9C8800DF967A00DF967A00DF967A00DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00DF967A00DF96
      7A0080808000000000000000000000000000C0C0C000C0C0C000DF967A00DF96
      7A00DF967A00C0C0C000C0C0C000FF00FF00FF00FF00C0C0C000FF000000FF00
      00000000FF000000FF0080808000C0C0C000C0C0C00000000000DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A008080800080808000DF96
      7A00897D6400726547005F4F2C0055421C0055421C00473718002663440096E1
      CE0096E1CE0096E1CE0096E1CE0096E1CE0096E1CE0096E1CE0096E1CE0096E1
      CE0096E1CE0096E1CE0096E1CE0096E1CE0096E1CE0096E1CE0019BF970011BA
      910010A681000C8C6D0040968000DF967A00DF967A00DF967A00DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00000000000000
      0000000000000000000080808000C0C0C000DF967A00DF967A00DF967A00C0C0
      C000C0C0C000DF967A00DF967A00DF967A00C0C0C000C0C0C000FF000000FF00
      0000DF967A000000FF000000FF00DF967A00DF967A000000000080808000DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A008080800080808000DF96
      7A008F81650076684B0065532E0055421C0055421C004F3D1A002A5B3D008FE3
      CE0094E6D20094E6D20094E6D20094E6D20094E6D20094E6D20094E6D20094E6
      D20094E6D20094E6D20094E6D20094E6D20094E6D20094E6D20019C59B0011C2
      970010AD8700109574002D8E7600DF967A00DF967A00DF967A00DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00808080000000
      0000C0C0C000C0C0C000C0C0C00080808000DF967A00C0C0C000C0C0C000DF96
      7A00DF967A00DF967A00C0C0C000C0C0C000DF967A00DF967A00DF967A00C0C0
      C000C0C0C0000000FF000000FF00DF967A00C0C0C0000000000000000000DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A008080800080808000DF96
      7A008F8165007B6C4C0065532E005A471F0055421C004F3D1A002F4F32008FE3
      CE0011C2970011C2970011C2970011C2970011C2970094E6D20094E6D20011C2
      970011C2970011C2970011C2970011C2970094E6D20094E6D20019C59B0011C2
      970011B48C000E9876001D886E00DF967A00DF967A00DF967A00DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00DF967A000000
      000000000000C0C0C000C0C0C00080808000C0C0C000DF967A00DF967A00DF96
      7A00C0C0C000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C000DF967A00C0C0C000C0C0C000DF967A00DF967A00000000008080
      8000DF967A00DF967A00DF967A00DF967A00DF967A008080800080808000DF96
      7A008F8165007B6C4C0065532E005A471F005A471F004F3D1A00353A1F0083E1
      CA0012C89B0012C89B0012C89B0012C89B0012C89B0094E6D20094E6D20012C8
      9B0012C89B0012C89B0012C89B0012C89B0094E6D20094E6D20019CB9F0012C8
      9B0011BA91000EA07C000C846700DF967A00DF967A00DF967A00DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000808080008080800080808000808080008080800080808000DF96
      7A00C0C0C000C0C0C000DF967A00DF967A00DF967A00C0C0C000000000000000
      0000DF967A00DF967A00DF967A00DF967A00DF967A008080800080808000DF96
      7A008F8165007B6C4C0065532E005A471F005A471F0055421C003F32150066D0
      B50012C89B0012C89B0012C89B0012C89B0012C89B0094E6D20094E6D20012C8
      9B0012C89B0012C89B0012C89B0012C89B0094E6D20094E6D20019CB9F0012C8
      9B0011C2970010A681000C8C6D009FC1B600DF967A00DF967A00DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A0000000000FFFF
      0000808080008080800080808000808080008080800080808000808080000000
      000080800000FFFF0000FFFF0000FFFF0000DF967A0000000000C0C0C000C0C0
      C000DF967A00DF967A00DF967A00C0C0C000C0C0C000DF967A00DF967A000000
      000080808000DF967A00DF967A00DF967A00DF967A008080800080808000DF96
      7A008F8165007B6C4C0065532E005A471F005A471F0055421C003F32150048A2
      83005BDABB0040D4B00040D4B00040D4B00040D4B00094E6D20094E6D2004BD7
      B40040D4B00040D4B0004BD7B4004BD7B40094E6D20094E6D20019CB9F0012C8
      9B0011C2970010AD87000C8C6D006AA99800DF967A00DF967A00DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00DF967A000000
      0000FFFF00008080000080800000808000008080000080800000000000008080
      0000FFFF0000FFFF0000FFFF0000DF967A0000000000C0C0C000DF967A00DF96
      7A00DF967A00C0C0C000C0C0C000DF967A00DF967A00C0C0C000C0C0C0000000
      000000000000DF967A00DF967A00DF967A00DF967A008080800080808000DF96
      7A008F8165007B6C4C0065532E005A471F005A471F005A471F003F3215002F60
      400094E6D20094E6D20094E6D20094E6D20094E6D20094E6D20094E6D20094E6
      D20094E6D20094E6D20094E6D20094E6D20094E6D20094E6D20019CB9F0012C8
      9B0011C2970011B48C000E9876002D8E7600DF967A00DF967A00DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00DF967A00DF96
      7A0000000000FFFF00008080000080800000808000000000000080800000FFFF
      0000FFFF0000FFFF0000DF967A000000000000000000DF967A00DF967A00C0C0
      C000C0C0C000DF967A00DF967A00DF967A00C0C0C000DF967A00DF967A00DF96
      7A000000000000000000DF967A00DF967A00DF967A008080800080808000DF96
      7A008F8165007B6C4C0065532E005A471F005A471F005A471F00473718003C34
      18006EDDC20094E6D20094E6D20094E6D20094E6D20094E6D20094E6D20094E6
      D20094E6D20094E6D20094E6D20094E6D20094E6D20094E6D20019CB9F0012C8
      9B0012C89B0011BA91000EA07C000C846700BECFC700DF967A00DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00DF967A00DF96
      7A00DF967A0000000000FFFF0000808000000000000080800000FFFF0000FFFF
      0000FFFF0000DF967A0000000000808000008080000000000000C0C0C000DF96
      7A00DF967A00DF967A00C0C0C000C0C0C000DF967A00DF967A00C0C0C000C0C0
      C0000000000000000000DF967A00DF967A00DF967A008080800080808000DF96
      7A008F8165007B6C4C0065532E005A471F005A471F005A471F00473718003C34
      18001F97700012C89B0012C89B0012C89B0012C89B0012C89B0012C89B0012C8
      9B0012C89B0012C89B0012C89B0012C89B0012C89B0012C89B0012C89B0012C8
      9B0012C89B0011C2970010A681000C8C6D0081B4A500DF967A00DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00DF967A00DF96
      7A00DF967A00DF967A0000000000FFFF000080800000FFFF0000FFFF0000FFFF
      0000DF967A000000000000000000000000000000000000000000DF967A00DF96
      7A00C0C0C000C0C0C000DF967A00DF967A00DF967A00C0C0C000DF967A00DF96
      7A00DF967A000000000080808000DF967A00DF967A008080800080808000DF96
      7A00897D6400726547005F4F2C005A471F005A471F005A471F004F3D1A004145
      25002F6C4B0019CB9F0019CB9F0019CB9F0019CB9F0019CB9F0019CB9F0019CB
      9F0019CB9F0019CB9F0019CB9F0019CB9F0019CB9F0019CB9F0019CB9F0019CB
      9F0019CB9F0019C59B0011B48C00109574004E9C8800DF967A00DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00DF967A00DF96
      7A00DF967A00DF967A008080800000000000FFFF0000FFFF0000FFFF0000DF96
      7A0000000000C0C0C000C0C0C000DF967A00DF967A00DF967A00C0C0C000C0C0
      C000DF967A00DF967A00DF967A00C0C0C000C0C0C000DF967A00DF967A008080
      8000808080000000000000000000DF967A00DF967A008080800080808000DF96
      7A00897D6400A59E8F005B4F35004D3F24005445250059492800594928004B4C
      30003F5137001FC39B001FC39B001FC39B001FC39B0020CBA20020CBA20020CB
      A20020CBA20020CBA20020CBA20020CBA20020CBA20020CBA20020CBA20020CB
      A20020CBA20020CBA2001EBB95001CA08000238B7200DF967A00DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00DF967A00DF96
      7A00DF967A00DF967A000000000080800000FFFF0000FFFF0000DF967A000000
      00008080800000000000DF967A00DF967A00C0C0C000C0C0C000DF967A00DF96
      7A00DF967A00C0C0C000C0C0C000DF967A00DF967A008080800080808000C0C0
      C000C0C0C000C0C0C0000000000080808000DF967A008080800080808000DF96
      7A00897D6400ACA59700DF967A0097928700433822004D3F240054472B004B4C
      300042392800229D7F00229D7F00229D7F0026AB8A0028BE99002BCCA4002CD0
      A8002CD0A8002CD0A8002CD0A8002CD0A8002CD0A8002CD0A8002CD0A8002CD0
      A8002CD0A8002CD0A8002BC39E0026AB8A0027927800B2CCC400DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00DF967A00DF96
      7A00DF967A000000000080800000FFFF0000FFFF0000DF967A00000000008080
      0000808000008080800000000000C0C0C000DF967A00DF967A00DF967A00C0C0
      C000C0C0C000DF967A00DF967A00DF967A0080808000C0C0C000C0C0C000C0C0
      C00000000000000000000000000000000000DF967A008080800080808000DF96
      7A00988D7600756C5800817C7200DF967A00DF967A00B7B5B000423928004239
      2800362F2300316556006D958B00DF967A00498D7C002E9E820039C1A0003DD0
      AC0040D4B00040D4B00040D4B00040D4B00040D4B00040D4B00040D4B00040D4
      B00040D4B0003DD0AC003DD0AC003EB69900379C840094BEB200DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00DF967A00DF96
      7A000000000080800000FFFF0000FFFF0000DF967A0000000000FFFF00008080
      000080800000808000008080800000000000DF967A00C0C0C000C0C0C000DF96
      7A00DF967A00DF967A008080800080808000C0C0C000C0C0C000000000000000
      00000000000080808000DF967A00DF967A00DF967A008080800080808000DF96
      7A00AAA08D00908771006D644E005B524200DBDBD900DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00357363003FA189004CC4
      A60053D3B30054D8B80054D8B80054D8B80054D8B80054D8B80054D8B80054D8
      B80054D8B80054D8B80053D3B30052C1A60050AB950089BAAC00DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00DF967A000000
      000080800000FFFF0000FFFF0000FFFF000000000000C0C0C00000000000FFFF
      00008080000080800000808000008080800000000000DF967A00DF967A00DF96
      7A008080800080808000C0C0C000C0C0C000C0C0C00000000000000000008080
      8000DF967A00DF967A00DF967A00DF967A00DF967A008080800080808000DF96
      7A00B9B0A000AAA08D0090877100756C58008C887F0099969000EEECEA00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A003A6E61004E9C
      88005CBCA40066D0B5006BD9BF006EDDC2006EDDC2006EDDC2006EDDC2006EDD
      C2006EDDC2006EDDC2006BD9BF006BCBB40069B8A50089BAAC00DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A0000000000DF96
      7A00DF967A00DF967A00DF967A00DF967A000000000000000000C0C0C0000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000808080008080
      8000C0C0C000C0C0C000C0C0C000000000000000000080808000DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A008080800080808000DF96
      7A00C6BFB100BCB5A400ACA390009C927F008B8271007A72630087827900A7A5
      A2008E8C88005068600039625900BEC8C600DF967A00DF967A00DF967A00829D
      96004D85780061A695006EBCA90075C9B5007BD2BD007FDAC40083E1CA0085E4
      CD0085E4CD0085E4CD0083E1CA0084D5C10083C3B40094BEB200DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A000000000000000000C0C0
      C000C0C0C000808080008080800080808000C0C0C000C0C0C000C0C0C0000000
      0000000000000000000080808000DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A008080800080808000DF96
      7A00DBD8D000D5D2CA00CCC6BA00B6B1A600C2BFBA009E9C97008C887F008C88
      7F008C887F00809C920076998F0067877F005C7871005068600095A3A000DF96
      7A00DF967A00DF967A00DF967A00F1F4F400CDDEDA00AFD5CC00AEE3D600B7ED
      E000B7EDE000B7EDE000B7EDE000B7E5DA00B7DBD200A6CAC000DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A008080800000000000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00000000000000000000000
      000080808000DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A008080800080808000DF96
      7A00E7E5DF00E2DFD900D5D2CA00BFBBB300DBDBD900DF967A00B7B5B000918F
      8D00A1A09E00ACB5B300ACB5B300DF967A0095A3A0005E706C00697975006A7E
      7900708680007D918C0099ADA800B0C4BF00B2CCC400B7DBD200C6EBE200CEF3
      E900CEF3E900CEF3E900CEF3E900CBEBE300CDE7E000B2CCC400DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00000000000000
      0000C0C0C000C0C0C000C0C0C00000000000000000000000000080808000DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A008080800080808000DF96
      7A00EEECEA00EBE9E400E2DFD900D5D2CA00B7B5B0009E9C9700DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00EDEEEE00697975007785
      82008697920095A3A0009FB3AE00B0C4BF00BFD6D000CDE7E000D4F4EC00DCF6
      EF00DCF6EF00DCF6EF00DCF6EF00DBEFEA00DBEFEA00C5D4CE00DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00808080000000
      0000C0C0C00000000000000000000000000080808000DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A008080800080808000DF96
      7A00EBE9E400E7E5DF00E2DFD900DBD8D000CBC8C100B7B5B0009E9C9700BCBB
      BA00ACAEAC0095A3A0007D918C0069797500E9EBEB00DF967A00DF967A00F9F9
      F900BEC8C600ACBEBA00B7CEC800C0DCD600CBEBE300CEF3E900D4F4EC00D4F4
      EC00D4F4EC00D4F4EC00D4F4EC00D4EDE600C4E0D900DF967A00DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A000000
      0000000000000000000080808000DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A008080800080808000DF96
      7A00CCC6BA00C6BFB100BCB5A400B9B0A000B9B0A000B2A99A00958E82008782
      7900809C92007BB8A9007BB8A90076AFA100699C90006D958B009FB3AE00D9E1
      DF00E3EAE800BFD6D000AFD5CC009AD5C70096E1CE009BE6D4009CE8D6009BE6
      D4009BE6D4009BE6D4009CDDCD009AD5C70099C7BA00DF967A00DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A000000
      000080808000DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A008080800080808000DF96
      7A00988D76008F816500837455007F7051007F7051007F70510076684B006D64
      4E004DB3960046CCAB0046CCAB0046C5A60041BB9E003CAC9100379C84003496
      7F00379C840039A78C003EB6990046C5A60046CCAB0048D1B00048D1B00048D1
      B00048D1B00046CCAB0046C5A6005CBCA400DF967A00DF967A00DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A008080800080808000DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF96
      7A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A00DF967A008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000088000000220000000100010000000000A80200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      000000007FFFFFFF9FFFFFFFE000000000000000000000007FFFF9FF90000000
      E000000000000000000000007FFFE1FF90000000E00000000000000000000000
      7FFF84FF90000000E000000000000000000000007FFE10FF90000001E0000000
      00000000000000007FF84E7F90000001E000000000000000000000007FE1207F
      90000001E000000000000000000000007F84877F90000001E000000000000000
      000000007C4C03BF90000001E000000000000000000000007038003F90000001
      E0000000000000000000000040E7099F90000001E00000000000000000000000
      409CE11F90000001E00000000000000000000000607004CF90000001E0000000
      00000000000000004000138F90000000E0000000000000000000000040008E67
      90000000E000000000000000000000006001398790000000E000000000000000
      00000000700267739000000060000000000000000000000078041CC390000000
      6000000000000000000000007C0833B990000000600000000000000000000000
      7C11CE61900000006000000000000000000000007C2339809200000020000000
      00000000000000007840E7009181000020000000000000000000000070809C03
      907F80002000000000000000000000006000700F901FC0002000000000000000
      000000005F00003F9000E0002000000000000000000000007F8001FF90001E00
      2000000000000000000000007F8007FF90410000200000000000000000000000
      7FC01FFF903F80002000000000000000000000007FC07FFF9000600060000000
      00000000000000007FE1FFFF900000006000000000000000000000007FE7FFFF
      90000000E000000000000000000000007FFFFFFF9FFFFFFFE000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000}
  end
  object OpenDialog1: TOpenDialog
    Left = 912
    Top = 176
  end
  object SaveDialog1: TSaveDialog
    Left = 872
    Top = 312
  end
  object mnuSend_N: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = btnCopyClick
    Left = 888
    Top = 112
    object Send1: TMenuItem
      Caption = 'Send'
      OnClick = Send1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuCommands: TMenuItem
      Caption = 'Commands'
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Edit1: TMenuItem
      Caption = 'Edit...'
      OnClick = Edit1Click
    end
  end
  object tiSDTests: TTimer
    OnTimer = tiSDTestsTimer
    Left = 896
    Top = 48
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 892
    Top = 65533
  end
  object copyItemToClipBoard: TPopupMenu
    Left = 888
    Top = 408
    object Copytoclipboad1: TMenuItem
      Caption = 'Copy to clip board'
      OnClick = Copytoclipboard1Click
    end
  end
  object Timer1: TTimer
    Interval = 30000
    OnTimer = Timer1Timer
    Left = 768
    Top = 48
  end
  object Timer2: TTimer
    OnTimer = OnTimerEventMessage1s
    Left = 824
    Top = 48
  end
  object Timer3: TTimer
    Interval = 10
    OnTimer = ReadCobiaData
    Left = 776
    Top = 112
  end
  object Timer4: TTimer
    Interval = 200
    OnTimer = OnTimerEventMessage200ms
    Left = 816
    Top = 112
  end
  object atLoadTestCase: TOpenTextFileDialog
    Left = 168
    Top = 584
  end
  object atSaveTestCase: TSaveTextFileDialog
    Left = 304
    Top = 584
  end
end
