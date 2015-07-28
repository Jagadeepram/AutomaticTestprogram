object shortcuttools: Tshortcuttools
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Commands'
  ClientHeight = 553
  ClientWidth = 436
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 436
    Height = 553
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Parameters'
      object Label1: TLabel
        Left = 16
        Top = 6
        Width = 135
        Height = 13
        Caption = 'Sensitivity Internal Detector'
      end
      object lblFwVersion: TLabel
        Left = 164
        Top = 11
        Width = 54
        Height = 13
        Caption = 'FW version'
      end
      object lblSerial: TLabel
        Left = 306
        Top = 11
        Width = 17
        Height = 13
        Caption = 'S/N'
      end
      object grbxSDMemoryTest: TGroupBox
        Left = 224
        Top = 35
        Width = 185
        Height = 95
        Caption = 'SD Memory test'
        TabOrder = 17
        object lblSDTestTime: TLabel
          Left = 44
          Top = 66
          Width = 68
          Height = 13
          Caption = 'Pause time (s)'
        end
        object Label12: TLabel
          Left = 74
          Top = 31
          Width = 39
          Height = 13
          Caption = 'File text'
        end
        object edtFileText: TEdit
          Left = 119
          Top = 29
          Width = 54
          Height = 21
          Alignment = taRightJustify
          TabOrder = 0
        end
        object edtSDTestTime: TEdit
          Left = 118
          Top = 64
          Width = 54
          Height = 21
          Alignment = taRightJustify
          NumbersOnly = True
          TabOrder = 1
          Text = '5'
        end
      end
      object cmbSensitivity: TComboBox
        Left = 16
        Top = 25
        Width = 102
        Height = 21
        TabOrder = 0
        OnChange = cmbSensitivityChange
        Items.Strings = (
          'High'
          'Low')
      end
      object btnReset: TButton
        Left = 16
        Top = 94
        Width = 169
        Height = 25
        Caption = 'Reset'
        TabOrder = 1
        OnClick = btnResetClick
      end
      object btnGetIntVals: TButton
        Left = 16
        Top = 187
        Width = 169
        Height = 25
        Caption = 'Get Integration Values'
        TabOrder = 2
        OnClick = btnGetIntValsClick
      end
      object btnGetOffsets: TButton
        Left = -4
        Top = 322
        Width = 169
        Height = 25
        Caption = 'Get Offsets'
        TabOrder = 3
        Visible = False
        OnClick = btnGetOffsetsClick
      end
      object GroupBox2: TGroupBox
        Left = 224
        Top = 136
        Width = 185
        Height = 193
        Caption = ' Trig '
        Color = clBtnFace
        ParentBackground = False
        ParentColor = False
        TabOrder = 4
        object Label2: TLabel
          Left = 16
          Top = 17
          Width = 35
          Height = 13
          Caption = 'Trig On'
        end
        object Label3: TLabel
          Left = 16
          Top = 107
          Width = 37
          Height = 13
          Caption = 'Trig Off'
        end
        object cmbTrigOn: TComboBox
          Left = 16
          Top = 36
          Width = 97
          Height = 21
          TabOrder = 0
          Text = 'peak'
          OnChange = cmbTrigOnChange
          Items.Strings = (
            'peak'
            'manual')
        end
        object btnTrigOn: TButton
          Left = 16
          Top = 63
          Width = 81
          Height = 25
          Caption = 'Trig On'
          Enabled = False
          TabOrder = 1
          OnClick = btnTrigOnClick
        end
        object cmbTrigOff: TComboBox
          Left = 16
          Top = 126
          Width = 97
          Height = 21
          TabOrder = 2
          Text = 'peak'
          OnChange = cmbTrigOffChange
          Items.Strings = (
            'peak'
            'timed'
            'manual')
        end
        object btnTrigOff: TButton
          Left = 16
          Top = 153
          Width = 81
          Height = 25
          Caption = 'Trig Off'
          Enabled = False
          TabOrder = 3
          OnClick = btnTrigOffClick
        end
      end
      object GroupBox3: TGroupBox
        Left = 224
        Top = 350
        Width = 185
        Height = 160
        Caption = ' Time settings'
        Color = clBtnFace
        ParentBackground = False
        ParentColor = False
        TabOrder = 5
        object Label5: TLabel
          Left = 14
          Top = 30
          Width = 62
          Height = 13
          Caption = 'Window (ms)'
        end
        object Label4: TLabel
          Left = 16
          Top = 108
          Width = 70
          Height = 13
          Caption = 'Pre Delay (ms)'
        end
        object Label11: TLabel
          Left = 24
          Top = 160
          Width = 49
          Height = 13
          Caption = 'Sensitivity'
          Visible = False
        end
        object edtTrigOffTime: TEdit
          Left = 15
          Top = 49
          Width = 73
          Height = 21
          Alignment = taRightJustify
          NumbersOnly = True
          TabOrder = 0
          Text = '80'
          OnKeyPress = edtTrigOffTimeKeyPress
        end
        object edtPreDelay: TEdit
          Left = 16
          Top = 127
          Width = 73
          Height = 21
          Alignment = taRightJustify
          NumbersOnly = True
          TabOrder = 1
          Text = '5'
          OnKeyPress = edtPreDelayKeyPress
        end
        object cbxSensNew: TComboBox
          Left = 16
          Top = 179
          Width = 169
          Height = 21
          TabOrder = 2
          Visible = False
          OnChange = cbxSensNewChange
          Items.Strings = (
            'High'
            'Low')
        end
        object cbxInfWindow: TCheckBox
          Left = 22
          Top = 76
          Width = 97
          Height = 17
          Caption = 'Infinite Window'
          TabOrder = 3
          OnClick = cbxInfWindowClick
        end
      end
      object cbAutoRange: TCheckBox
        Left = 19
        Top = 52
        Width = 142
        Height = 17
        Caption = 'Auto sensitivity'
        TabOrder = 6
        OnClick = cbAutoRangeClick
      end
      object btnReadWaveform: TButton
        Left = 16
        Top = 218
        Width = 169
        Height = 25
        Caption = 'Get Waveform'
        TabOrder = 7
        OnClick = btnReadWaveformClick
      end
      object GroupBox4: TGroupBox
        Left = 16
        Top = 627
        Width = 430
        Height = 74
        Caption = ' Approximation polynom '
        Color = clBtnFace
        ParentBackground = False
        ParentColor = False
        TabOrder = 8
        Visible = False
        object Label7: TLabel
          Left = 22
          Top = 31
          Width = 20
          Height = 13
          Caption = 'y = '
        end
        object Label8: TLabel
          Left = 115
          Top = 33
          Width = 34
          Height = 13
          Caption = 'x^2 + '
        end
        object Label9: TLabel
          Left = 217
          Top = 33
          Width = 20
          Height = 13
          Caption = 'x + '
        end
        object edtCoeffA2: TEdit
          Left = 48
          Top = 28
          Width = 67
          Height = 21
          TabOrder = 0
          Text = '0'
        end
        object edtCoeffA1: TEdit
          Left = 237
          Top = 28
          Width = 61
          Height = 21
          TabOrder = 1
          Text = '0'
        end
        object edtCoeffA0: TEdit
          Left = 147
          Top = 28
          Width = 64
          Height = 21
          TabOrder = 2
          Text = '0'
        end
        object btnApplyPoly: TButton
          Left = 312
          Top = 37
          Width = 101
          Height = 25
          Caption = 'Apply Coefficients'
          TabOrder = 3
          OnClick = btnApplyPolyClick
        end
        object btnGetCoeffs: TButton
          Left = 312
          Top = 13
          Width = 101
          Height = 25
          Caption = 'Read Coefficients'
          TabOrder = 4
          OnClick = btnGetCoeffsClick
        end
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 261
        Width = 193
        Height = 249
        Caption = 'Test signal'
        TabOrder = 9
        object Label6: TLabel
          Left = 9
          Top = 30
          Width = 41
          Height = 13
          Caption = 'Duration'
        end
        object Label10: TLabel
          Left = 115
          Top = 29
          Width = 13
          Height = 13
          Caption = 'ms'
        end
        object edtTestSignalDuration: TEdit
          Left = 64
          Top = 30
          Width = 38
          Height = 21
          Alignment = taRightJustify
          BorderStyle = bsNone
          NumbersOnly = True
          ReadOnly = True
          TabOrder = 0
          Text = '0'
          OnKeyPress = edtTrigOffTimeKeyPress
        end
        object memTestSignalChargeLabel: TMemo
          Left = 3
          Top = 57
          Width = 142
          Height = 37
          BorderStyle = bsNone
          Lines.Strings = (
            'Number of Charge packets'
            'Each packet is 11 pC')
          ReadOnly = True
          TabOrder = 2
        end
        object Memo1: TMemo
          Left = 3
          Top = 113
          Width = 62
          Height = 34
          BorderStyle = bsNone
          Lines.Strings = (
            'Number of '
            'pulses')
          ReadOnly = True
          TabOrder = 4
        end
        object edtTestSignalChargePacketSize: TEdit
          Left = 3
          Top = 86
          Width = 56
          Height = 21
          Alignment = taRightJustify
          NumbersOnly = True
          TabOrder = 1
          Text = '10'
          OnExit = edtTestSignalChargePacketSizeExit
        end
        object edtOccurences: TEdit
          Left = 3
          Top = 145
          Width = 56
          Height = 21
          Alignment = taRightJustify
          NumbersOnly = True
          TabOrder = 5
          Text = '1'
          OnExit = edtOccurencesExit
        end
        object Memo2: TMemo
          Left = 91
          Top = 129
          Width = 62
          Height = 34
          BorderStyle = bsNone
          Lines.Strings = (
            'Low Time')
          ReadOnly = True
          TabOrder = 6
        end
        object edtDownTime: TEdit
          Left = 91
          Top = 145
          Width = 56
          Height = 21
          Alignment = taRightJustify
          NumbersOnly = True
          TabOrder = 7
          Text = '90'
          OnExit = edtDownTimeKeyExit
        end
        object cb_tst_ch_int: TCheckBox
          Left = 6
          Top = 181
          Width = 125
          Height = 17
          Caption = 'Int'
          Checked = True
          State = cbChecked
          TabOrder = 9
        end
        object cb_tst_ch_ext: TCheckBox
          Left = 6
          Top = 201
          Width = 125
          Height = 17
          Caption = 'Ext'
          TabOrder = 10
        end
        object cb_tst_ch_mas: TCheckBox
          Left = 6
          Top = 221
          Width = 125
          Height = 17
          Caption = 'mAs'
          TabOrder = 11
        end
        object btnSendTestSignal: TButton
          Left = 80
          Top = 212
          Width = 103
          Height = 25
          Caption = 'Send Test Signal'
          TabOrder = 3
          OnClick = btnSendTestSignalClick
        end
        object cbDebugTestSignal: TCheckBox
          Left = 65
          Top = 181
          Width = 125
          Height = 17
          Caption = 'Debug FW test signal'
          TabOrder = 8
          OnClick = cbDebugTestSignalClick
        end
      end
      object btnRestart: TButton
        Left = 16
        Top = 125
        Width = 169
        Height = 25
        Caption = 'Restart'
        TabOrder = 10
        OnClick = btnRestartClick
      end
      object btnDebugInvoke: TButton
        Left = 143
        Top = 341
        Width = 75
        Height = 25
        Caption = 'Debug'
        TabOrder = 11
        Visible = False
        OnClick = btnDebugInvokeClick
      end
      object btnGetCalcValues: TButton
        Left = 16
        Top = 156
        Width = 169
        Height = 25
        Caption = 'Get Calc Values'
        TabOrder = 12
        OnClick = btnGetCalcValuesClick
      end
      object cbDebugPrintout: TCheckBox
        Left = 19
        Top = 71
        Width = 97
        Height = 17
        Caption = 'Debug printout'
        TabOrder = 13
        OnClick = cbDebugPrintoutClick
      end
      object edtFWVersion: TEdit
        Left = 224
        Top = 8
        Width = 76
        Height = 21
        ReadOnly = True
        TabOrder = 14
        Text = '-'
      end
      object edtSerial: TEdit
        Left = 329
        Top = 8
        Width = 80
        Height = 21
        ReadOnly = True
        TabOrder = 15
        Text = '-'
      end
      object cbSDLongTest: TCheckBox
        Left = 233
        Top = 52
        Width = 57
        Height = 17
        Caption = 'Enable'
        TabOrder = 16
        OnClick = cbSDLongTestClick
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 25000
    OnTimer = Timer1Timer
    Left = 832
    Top = 56
  end
end
