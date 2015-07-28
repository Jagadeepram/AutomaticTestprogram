object frmWaveform: TfrmWaveform
  Left = 0
  Top = 0
  Caption = 'Waveform'
  ClientHeight = 377
  ClientWidth = 676
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCanResize = FormCanResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 676
    Height = 377
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Waveform'
      DesignSize = (
        668
        349)
      object imgWaveform1: TImage
        Left = 92
        Top = 16
        Width = 533
        Height = 241
      end
      object lblMaxDetVal: TLabel
        Left = 13
        Top = 16
        Width = 73
        Height = 16
        Alignment = taRightJustify
        Caption = 'lblMaxDetVal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblMinDetVal: TLabel
        Left = 16
        Top = 209
        Width = 70
        Height = 16
        Alignment = taRightJustify
        Caption = 'lblMinDetVal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object imgDetBGS1_wf1: TImage
        Left = 3
        Top = 279
        Width = 55
        Height = 29
      end
      object imgDetBGS2_wf1: TImage
        Left = 64
        Top = 279
        Width = 53
        Height = 29
      end
      object imgDetBGS3_wf1: TImage
        Left = 123
        Top = 279
        Width = 54
        Height = 29
      end
      object imgDetBGS4_wf1: TImage
        Left = 183
        Top = 279
        Width = 55
        Height = 29
      end
      object imgDetBGS5_wf1: TImage
        Left = 244
        Top = 278
        Width = 101
        Height = 29
      end
      object imgDetBGS6_wf1: TImage
        Left = 351
        Top = 279
        Width = 74
        Height = 29
      end
      object imgDetBGS7_wf1: TImage
        Left = 538
        Top = 304
        Width = 39
        Height = 25
        Visible = False
      end
      object imgDetBGS8_wf1: TImage
        Left = 586
        Top = 304
        Width = 39
        Height = 25
        Visible = False
      end
      object lblTimeEnd: TLabel
        Left = 602
        Top = 257
        Width = 7
        Height = 16
        Alignment = taRightJustify
        Caption = '1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblTimeStart: TLabel
        Left = 105
        Top = 257
        Width = 28
        Height = 16
        Caption = '0 ms'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object imgDetBGS5_ext: TImage
        Left = 244
        Top = 278
        Width = 101
        Height = 29
      end
      object imgDetBGDose: TImage
        Left = 125
        Top = 314
        Width = 80
        Height = 29
        Visible = False
      end
      object imgDetBGExt: TImage
        Left = 244
        Top = 314
        Width = 101
        Height = 29
        Visible = False
      end
      object imgDetBGkV: TImage
        Left = 3
        Top = 314
        Width = 55
        Height = 29
        Visible = False
      end
      object imgDetBGTf: TImage
        Left = 64
        Top = 314
        Width = 55
        Height = 29
        Visible = False
      end
      object imgDetBGMas: TImage
        Left = 351
        Top = 314
        Width = 74
        Height = 29
        Visible = False
      end
      object cbxWF1S3: TCheckBox
        Left = 127
        Top = 284
        Width = 41
        Height = 17
        Caption = 'S3'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbChecked
        TabOrder = 2
        OnClick = cbxWF1S1Click
      end
      object cbxWF1S4: TCheckBox
        Left = 187
        Top = 284
        Width = 49
        Height = 17
        Caption = 'S4'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbChecked
        TabOrder = 3
        OnClick = cbxWF1S1Click
      end
      object cbxWF1S5: TCheckBox
        Left = 248
        Top = 284
        Width = 94
        Height = 17
        Caption = 'Ext. prob'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbChecked
        TabOrder = 4
        OnClick = cbxWF1S1Click
      end
      object cbxWF1S6: TCheckBox
        Left = 355
        Top = 284
        Width = 57
        Height = 17
        Caption = 'MAS'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbChecked
        TabOrder = 5
        OnClick = cbxWF1S1Click
      end
      object cbxWF1S7: TCheckBox
        Left = 544
        Top = 308
        Width = 33
        Height = 17
        Caption = 'S7'
        TabOrder = 6
        Visible = False
        OnClick = cbxWF1S1Click
      end
      object cbxWF1S8: TCheckBox
        Left = 592
        Top = 308
        Width = 33
        Height = 17
        Caption = 'S8'
        TabOrder = 7
        Visible = False
        OnClick = cbxWF1S1Click
      end
      object cbxSeparateScales: TCheckBox
        Left = 443
        Top = 296
        Width = 137
        Height = 17
        Caption = 'Separate scales'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnClick = cbxWF1S1Click
      end
      object cbxBlock: TCheckBox
        Left = 443
        Top = 278
        Width = 102
        Height = 17
        Caption = 'Histogram'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        OnClick = cbxWF1S1Click
      end
      object btnCalVal: TButton
        Left = 575
        Top = 319
        Width = 90
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Calibrated data'
        TabOrder = 10
        OnClick = btnCalValClick
      end
      object cbxWF1kV: TCheckBox
        Left = 9
        Top = 311
        Width = 49
        Height = 38
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'kV'
        Checked = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        State = cbChecked
        TabOrder = 11
        Visible = False
        OnClick = cbxWF1S1Click
      end
      object cbxWF1dose: TCheckBox
        Left = 133
        Top = 320
        Width = 70
        Height = 17
        Caption = 'Dose'
        Checked = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        State = cbChecked
        TabOrder = 12
        Visible = False
        OnClick = cbxWF1S1Click
      end
      object cbxWF1S1: TCheckBox
        Left = 13
        Top = 284
        Width = 49
        Height = 17
        Caption = 'S1'
        Checked = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        State = cbChecked
        TabOrder = 0
        OnClick = cbxWF1S1Click
      end
      object cbxWF1S2: TCheckBox
        Left = 68
        Top = 284
        Width = 49
        Height = 17
        Caption = 'S2'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbChecked
        TabOrder = 1
        OnClick = cbxWF1S1Click
      end
      object cbxWF1Tf: TCheckBox
        Left = 70
        Top = 311
        Width = 49
        Height = 38
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Tf'
        Checked = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        State = cbChecked
        TabOrder = 14
        Visible = False
        OnClick = cbxWF1S1Click
      end
      object cbxWF1Ext: TCheckBox
        Left = 248
        Top = 320
        Width = 94
        Height = 17
        Caption = 'Ext. prob'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbChecked
        TabOrder = 13
        Visible = False
        OnClick = cbxWF1S1Click
      end
      object cbxWF1Mas: TCheckBox
        Left = 356
        Top = 320
        Width = 57
        Height = 17
        Caption = 'MAS'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbChecked
        TabOrder = 15
        Visible = False
        OnClick = cbxWF1S1Click
      end
    end
  end
end
