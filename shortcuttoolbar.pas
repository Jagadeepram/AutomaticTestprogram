unit shortcuttoolbar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls,
  JwaWinUser, AppEvnts, StrUtils, HidComm, waveform, ExtCtrls;

type
  Tshortcuttools = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    cmbSensitivity: TComboBox;
    Label1: TLabel;
    btnReset: TButton;
    btnGetIntVals: TButton;
    btnGetOffsets: TButton;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    cmbTrigOn: TComboBox;
    btnTrigOn: TButton;
    Label3: TLabel;
    cmbTrigOff: TComboBox;
    btnTrigOff: TButton;
    GroupBox3: TGroupBox;
    edtTrigOffTime: TEdit;
    Label5: TLabel;
    Label4: TLabel;
    edtPreDelay: TEdit;
    cbAutoRange: TCheckBox;
    btnReadWaveform: TButton;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtCoeffA2: TEdit;
    edtCoeffA1: TEdit;
    edtCoeffA0: TEdit;
    btnApplyPoly: TButton;
    btnGetCoeffs: TButton;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    edtTestSignalDuration: TEdit;
    edtTestSignalChargePacketSize: TEdit;
    memTestSignalChargeLabel: TMemo;
    btnSendTestSignal: TButton;
    Label10: TLabel;
    btnRestart: TButton;
    btnDebugInvoke: TButton;
    btnGetCalcValues: TButton;
    cbxSensNew: TComboBox;
    Label11: TLabel;
    cbxInfWindow: TCheckBox;
    Memo1: TMemo;
    edtOccurences: TEdit;
    Memo2: TMemo;
    edtDownTime: TEdit;
    cbDebugPrintout: TCheckBox;
    cbDebugTestSignal: TCheckBox;
    edtFWVersion: TEdit;
    lblFwVersion: TLabel;
    lblSerial: TLabel;
    edtSerial: TEdit;
    cbSDLongTest: TCheckBox;
    grbxSDMemoryTest: TGroupBox;
    lblSDTestTime: TLabel;
    edtFileText: TEdit;
    Label12: TLabel;
    cb_tst_ch_int: TCheckBox;
    cb_tst_ch_ext: TCheckBox;
    cb_tst_ch_mas: TCheckBox;
    Timer1: TTimer;
    edtSDTestTime: TEdit;
    procedure btnResetClick(Sender: TObject);
    procedure cmbSensitivityChange(Sender: TObject);

    procedure btnGetIntValsClick(Sender: TObject);
    procedure btnGetOffsetsClick(Sender: TObject);


    procedure cmbTrigOnChange(Sender: TObject);
    procedure cmbTrigOffChange(Sender: TObject);
    procedure btnTrigOnClick(Sender: TObject);
    procedure btnTrigOffClick(Sender: TObject);
    procedure btnApplyPolyClick(Sender: TObject);
    procedure btnGetCoeffsClick(Sender: TObject);
    procedure btnReadWaveformClick(Sender: TObject);
    procedure edtTrigOffTimeKeyPress(Sender: TObject; var Key: Char);
    procedure edtPreDelayKeyPress(Sender: TObject; var Key: Char);
    procedure btnSendTestSignalClick(Sender: TObject);
    procedure btnRestartClick(Sender: TObject);
    procedure btnDebugInvokeClick(Sender: TObject);
    procedure cbAutoRangeClick(Sender: TObject);
    procedure btnGetCalcValuesClick(Sender: TObject);
    procedure cbxSensNewChange(Sender: TObject);
    procedure cbxInfWindowClick(Sender: TObject);
    procedure cbDebugPrintoutClick(Sender: TObject);
    procedure cbDebugTestSignalClick(Sender: TObject);
    procedure cbSDLongTestClick(Sender: TObject);
    procedure edtTestSignalChargePacketSizeExit(Sender: TObject);
    procedure edtOccurencesExit(Sender: TObject);
    procedure edtDownTimeKeyExit(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
   procedure SendCommand(cmd : string);
  public
  end;

var
  shortcuttools: Tshortcuttools;

implementation

uses main, uPolynomials;

{$R *.dfm}

procedure Tshortcuttools.btnDebugInvokeClick(Sender: TObject);
//var
//  val : Extended;
//  words : array [0..7] of string;
begin
  {
  frmWaveform.Visible := True;
  frmWaveform.ResetDetectorArray();
  frmWaveform.FillTestData();
  }
  {
  words[1] := 'charge_time';
  words[2] := '+28884.5676';
  words[3] := '+27229.0456';
  words[4] := '+21526.4422';
  words[5] := '+5118.4102';
  words[6] := '+201.0';
  frmMain.InputReaction_m_get_val(words);
  }
//   val := frmMain.pPolys.CalcHvl(2.78, 69.5);
//   val := val * 1;
end;

procedure Tshortcuttools.btnGetCalcValuesClick(Sender: TObject);
begin
  SendCommand('m_get_val;calc');
end;

procedure Tshortcuttools.btnGetCoeffsClick(Sender: TObject);
begin
  SendCommand('polynom ?2');
  SendCommand('polynom ?1');
  SendCommand('polynom ?0');
end;

procedure Tshortcuttools.btnGetIntValsClick(Sender: TObject);
begin
  SendCommand('m_get_val int');
  SendCommand('m_get_val filt');
end;

procedure Tshortcuttools.btnGetOffsetsClick(Sender: TObject);
var I : Integer;
begin
  for I := 0 to 7 do begin
    SendCommand('m_get_val offs ' + IntToStr(I));
    frmMain.Delay(100);
  end;
end;


procedure Tshortcuttools.btnReadWaveformClick(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  frmWaveform.Visible := True;
  frmWaveform.ResetDetectorArray();
  SendCommand('wf_read');
  Timer1.Enabled := True;

end;


procedure Tshortcuttools.btnResetClick(Sender: TObject);
begin
  frmMain.ResetDisplays();
  SendCommand('m_reset');
end;

procedure Tshortcuttools.btnRestartClick(Sender: TObject);
begin
  SendCommand('m_reset');
end;

procedure Tshortcuttools.btnSendTestSignalClick(Sender: TObject);
var test_channels : Integer;
begin
  test_channels := 0;
  if cb_tst_ch_int.State = cbChecked then
    test_channels := test_channels or 1;
  if cb_tst_ch_ext.State = cbChecked then
    test_channels := test_channels or 2;
  if cb_tst_ch_mas.State = cbChecked then
    test_channels := test_channels or 4;

  SendCommand('tst_cadc;act;' + IntToStr(test_channels));
end;

procedure Tshortcuttools.btnTrigOffClick(Sender: TObject);
begin
  frmMain.SendTrigCommand(TRIG_OFF, 0);
//  SendCommand('ms_trig off trig');
end;

procedure Tshortcuttools.btnTrigOnClick(Sender: TObject);
var
  timeMs : Integer;
begin
  if (cmbTrigOff.ItemIndex = 2) then begin // Manual trig
    frmMain.SendTrigCommand(TRIG_ON, 0);
  end else if (cmbTrigOff.ItemIndex = 1) then begin
    timeMs := StrToInt(edtTrigOffTime.Text);
    frmMain.SendTrigCommand(TRIG_WINDOW, timeMs);
  end;

//  SendCommand('ms_trig on trig');
end;

procedure Tshortcuttools.btnApplyPolyClick(Sender: TObject);
begin
  SendCommand('polynom a2 ' + edtCoeffA2.Text);
  SendCommand('polynom a1 ' + edtCoeffA1.Text);
  SendCommand('polynom a0 ' + edtCoeffA0.Text);
end;

procedure Tshortcuttools.cbAutoRangeClick(Sender: TObject);
begin
  if cbAutoRange.Checked then begin
    SendCommand('ms_range;auto;1')
  end else begin
    SendCommand('ms_range;auto;0')
  end;
end;

procedure Tshortcuttools.cbDebugPrintoutClick(Sender: TObject);
begin
  if cbDebugPrintout.Checked then begin
    SendCommand('debug_printout;1')
  end else begin
    SendCommand('debug_printout;0')
  end;
end;

procedure Tshortcuttools.cbDebugTestSignalClick(Sender: TObject);
begin
  if cbDebugTestSignal.Checked then begin
    SendCommand('debug_test_signal;1')
  end else begin
    SendCommand('debug_test_signal;0')
  end;
end;

procedure Tshortcuttools.cbSDLongTestClick(Sender: TObject);
begin
  // Note: This function is handled by the main.pas module
  if cbSDLongTest.Checked then begin
    edtSDTestTime.enabled := false;  // Not ok to edit duration time during the test
    frmMain.StartSDTests();  // Prepare for SD long time test
  end else begin
     edtSDTestTime.enabled := true;
  end;
end;

procedure Tshortcuttools.cbxInfWindowClick(Sender: TObject);
begin
  if cbxInfWindow.Checked then begin
    edtTrigOffTime.Enabled := False;
    SendCommand('ms_trig;off;peak');
  end else begin
    edtTrigOffTime.Enabled := True;
    SendCommand('ms_trig;off;timed');
  end;
end;

procedure Tshortcuttools.cbxSensNewChange(Sender: TObject);
begin
  if cbxSensNew.ItemIndex = 0 then
    SendCommand('ms_range ' + Format('%d', [0]))
  else
    SendCommand('ms_range ' + Format('%d', [1]));

  frmMain.iSensitivity := cbxSensNew.ItemIndex;
end;

procedure Tshortcuttools.cmbSensitivityChange(Sender: TObject);
begin
  if cmbSensitivity.ItemIndex = 0 then
    SendCommand('ms_range ' + Format('%d', [1]))
  else
    SendCommand('ms_range ' + Format('%d', [7]));

  frmMain.iSensitivity := cmbSensitivity.ItemIndex;
end;

procedure Tshortcuttools.cmbTrigOffChange(Sender: TObject);
begin
//  SendCommand('ms_trig off ' + cmbTrigOff.Items[cmbTrigOff.ItemIndex]);
  if cmbTrigOff.ItemIndex = 2 then begin
    btnTrigOff.Enabled := True;
    edtTrigOffTime.Enabled := False;
  end else begin
      btnTrigOff.Enabled := False;
      if cmbTrigOff.ItemIndex = 1 then begin
        edtTrigOffTime.Enabled := True;
      end else begin
        edtTrigOffTime.Enabled := False;
      end;
  end;

(*  if cmbTrigOff.ItemIndex = 0 then begin
    frmMain.SendTrigCommand(TRIG_PEAK, 0);
  end else begin
    frmMain.SendTrigCommand(TRIG_OFF, 0);  // No Peak trig
  end;
*)

end;

procedure Tshortcuttools.cmbTrigOnChange(Sender: TObject);
begin
//  SendCommand('ms_trig on ' + cmbTrigOn.Items[cmbTrigOn.ItemIndex]);
  if cmbTrigOn.ItemIndex = 0 then begin
    btnTrigOn.Enabled := False;
    frmMain.SendTrigCommand(TRIG_PEAK, 0);
  end else begin
    btnTrigOn.Enabled := True;
    frmMain.SendTrigCommand(TRIG_DISABLE, 0);  // No Peak trig
  end;
end;

procedure Tshortcuttools.edtDownTimeKeyExit(Sender: TObject);
begin
    SendCommand('tst_cadc;dwn;' + edtDownTime.Text);
end;

procedure Tshortcuttools.edtOccurencesExit(Sender: TObject);
begin
     SendCommand('tst_cadc;occ;' + edtOccurences.Text);
end;

procedure Tshortcuttools.edtPreDelayKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SendCommand('ms_trig predelay ' + edtPreDelay.Text);
end;

procedure Tshortcuttools.edtTestSignalChargePacketSizeExit(Sender: TObject);
begin
     edtTestSignalDuration.Text :=
      FloatToStrF(main.frmMain.SafeFloatConvert(edtTestSignalChargePacketSize.Text) / 3, ffGeneral, 2, 8);
    SendCommand('tst_cadc;dur;' + edtTestSignalChargePacketSize.Text);
end;

procedure Tshortcuttools.edtTrigOffTimeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SendCommand('ms_trig window ' + edtTrigOffTime.Text);
end;

procedure Tshortcuttools.SendCommand(cmd : string);
begin
  frmMain.SendCommand(cmd);
end;

procedure Tshortcuttools.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Screen.Cursor := crDefault;
end;

end.
