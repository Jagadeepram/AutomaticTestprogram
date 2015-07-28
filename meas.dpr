program meas;

uses
  Forms,
  main in 'main.pas' {frmMain},
  HidComm in 'HidComm.pas',
  shortcuttoolbar in 'shortcuttoolbar.pas' {shortcuttools},
  waveform in 'waveform.pas' {frmWaveform},
  uBaseApp in 'Excel\uBaseApp.pas',
  uExcel in 'Excel\uExcel.pas',
  uOpenOffice in 'Excel\uOpenOffice.pas',
  uPolynomials in 'uPolynomials.pas',
  ElectroMeterCal in 'ElectroMeterCal.pas' {ElectroMeterCalibration},
  uCRC16 in 'uCRC16.pas',
  uCRC32 in 'uCRC32.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(Tshortcuttools, shortcuttools);
  Application.CreateForm(TfrmWaveform, frmWaveform);
  Application.CreateForm(TElectroMeterCalibration, ElectroMeterCalibration);
  Application.Run;
end.
