unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PlatformDefaultStyleActnCtrls, ActnList, ActnMan, StdCtrls, ComCtrls,
  //JwaWinUser,
   AppEvnts, StrUtils, HidComm, shortcuttoolbar, waveform, ElectroMeterCal,
  ClipBrd, Rtti, ExtCtrls, ImgList, uBaseApp, uExcel, uOpenOffice, Menus, uPolynomials,
  JvExControls, JvArrowButton, pngimage, Data.Bind.EngExt,
  Data.Bind.Components, Vcl.Bind.DBEngExt, JvProgressDialog, JvGradientCaption,
  Registry, uCRC16, uCRC32, Vcl.ExtDlgs,
  //XML related
  XMLIntf, XMLDoc;

const
   CHINA_KV_ADJUSTMENT  = 0;     // Set to 1 if compile as the China kV/Dose adjustment version. Otherwise 0
   ENCRYPT_KEY_ADVANCED = $6A;   // Encryption key

   (* GPIB Status Word Conditions.                      *)
   ERR   = $8000;   (* Error detected                   *)
   TIMO  = $4000;   (* Timeout                          *)
   EEND  = $2000;   (* EOI or EOS detected              *)
   SRQI  = $1000;   (* SRQ detected by CIC              *)
   RQS   = $800;    (* Device needs service             *)
   SPOLL = $400;    (* Board has been serially polled   *)
   EVENT = $200;    (* An event has occurred            *)
   CMPL  = $100;    (* I/O completed                    *)
   LOK   = $80;     (* Local lockout state              *)
   REM   = $40;     (* Remote state                     *)
   CIC   = $20;     (* Controller-in-Charge             *)
   ATN   = $10;     (* Attention asserted               *)
   TACS  = $8;      (* Talker active                    *)
   LACS  = $4;      (* Listener active                  *)
   DTAS  = $2;      (* Device trigger state             *)
   DCAS  = $1;      (* Device clear state               *)

   (* Error messages returned in global variable IBERR: *)
   EDVR =  0;(* System error                            *)
   ECIC =  1;(* Function requires GPIB board to be CIC  *)
   ENOL =  2;(* Write function detected no Listeners    *)
   EADR =  3;(* Interface board not addressed correctly *)
   EARG =  4;(* Invalid argument to function call       *)
   ESAC =  5;(* Function requires GPIB board to be SAC *)
   EABO =  6;(* I/O operation aborted                   *)
   ENEB =  7;(* Non-existent interface board            *)
   EDMA =  8;(* Error performing DMA                    *)
   EOIP = 10;(* I/O operation started before previous   *)
             (* operation completed                    *)
   ECAP = 11;(* No capability for intended operation    *)
   EFSO = 12;(* File system operation error             *)
   EBUS = 14;(* Command error during device call        *)
   ESTB = 15;(* Serial poll status byte lost            *)
   ESRQ = 16;(* SRQ remains asserted                    *)
   ETAB = 20;(* The return buffer is full               *)
   ELCK = 21;(* Address or board is locked              *)

   (* Values for the 488.2 Send command                                        *)

   NULLend = 00;                (* do nothing at the end of a transfer      *)
   NLend   = 01;                (* send NL with EOI after a transfer        *)
   DABend  = 02;                (* send EOI with the last DAB               *)

   (* This value is used by the 488.2 Receive command.                         *)

   STOPend = $0100;              (* stop the read on EOI                    *)

   (* This value is used to terminate a 488.2 address list.  It should be      *)
   (* assigned to the pad field of the last entry.                             *)

   NOADDR = -1;

   T10s = 13;

   BDINDEX = 0; (* Board Index                      *)
   PRIMARY_ADDR_OF_DMM = 8; (* Primary address of device        *)
   NO_SECONDARY_ADDR = 0; (* Secondary address of device      *)
   TIMEOUT = T10s; (* Timeout value = 10 seconds        *)
   EOTMODE = 1; (* Enable the END message            *)
   EOSMODE = 0; (* Disable the EOS mode              *)

   // End GPIB

   MAX_DEVIATION_ERROR_EMM_CAL = 0.5;  // Max deviation when electrometer calibration
   MAX_DEVIATION_ERROR_MAS_CAL = 2.0;  // Max deviation when electrometer calibration
   RTIIS_REP_SEP               = #29;  // Separator between repetetive fields in RTIIS report
   LF_SEP                      = #10;  // LineFeed
type
  // GPIB Globals
  Tibsta  = function : integer; stdcall;
  Tiberr  = function : integer; stdcall;
  Tibcntl = function : Longint; stdcall;

  Tibdev = function (ud:integer;
                    pad:integer;
                    sad:integer;
                    tmo:integer;
                    eot:integer;
                    eos:integer)  :  integer;  stdcall;

   AddrList = array [0..31] of SmallInt;

   (* Type declarations for exported NI-488.2 routines.*)
    Tibrd = function(ud: integer;
                     var rdbuf;
                     cnt: Longint): integer; stdcall;

    Tibwrt = function(ud: integer;
                      var wrtbuf;
                      cnt: longint): integer; stdcall;

   TibDevClear = procedure (boardID: integer;
		                        address: word); stdcall;

   TibEnableRemote = procedure (boardID: integer;
                                padlist: AddrList); stdcall;

   TibFindLstn = procedure (boardID:    integer;
                            padlist:    AddrList;
                            resultlist: AddrList;
                            limit:      integer); stdcall;

   Tibonl = function (ud: integer;
                      v:  integer) : integer; stdcall;

   TibReadStatusByte = procedure (boardID:    integer;
                                  address:    word;
	                                var result: integer); stdcall;

   TibReceive = procedure (boardID:     integer;
        	                 address:     word;
	                         var buffer;
	                         cnt:         longint;
        	                 termination: integer); stdcall;

   TibSend = procedure (boardID: integer;
	                    address: word;
                      var buffer;
                      datacnt: longint;
	                    eotmode: integer); stdcall;

   TibSendIFC = procedure (boardID: integer); stdcall;

   TibWaitSRQ = procedure (boardID:    integer;
                         var result: integer); stdcall;
   // End GPIB

  TfrmMain = class(TForm)
    ApplicationEvents: TApplicationEvents;
    ImageList1: TImageList;
    imglstExcel: TImageList;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    mnuSend_N: TPopupMenu;
    Send1: TMenuItem;
    N1: TMenuItem;
    Edit1: TMenuItem;
    mnuCommands: TMenuItem;
    N2: TMenuItem;
    tiSDTests: TTimer;
    BindingsList1: TBindingsList;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    lvOffsetR0_3: TListView;
    lvOffsetR4_7: TListView;
    TabSheet3: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lvRing: TListView;
    btnCopy: TButton;
    btnEraseLast: TButton;
    btnEraseAll: TButton;
    lvValues: TListView;
    TabSheet5: TTabSheet;
    GroupBox3: TGroupBox;
    GroupBox2: TGroupBox;
    Label20: TLabel;
    Label28: TLabel;
    CalibrationUnit: TLabel;
    btnSaveNormFactor: TButton;
    edtDoseNormFactor: TEdit;
    GroupBox4: TGroupBox;
    Label18: TLabel;
    btnSavePolynomCoeffs: TButton;
    memNormFactorPrix: TMemo;
    memNormationCoeffs: TMemo;
    GroupBox5: TGroupBox;
    Label19: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label22: TLabel;
    Label21: TLabel;
    edtCalDateYear: TEdit;
    edtCalDateMonth: TEdit;
    edtCalDateDay: TEdit;
    edtCalLab: TEdit;
    btnSaveCalMetaData: TButton;
    btnReadFactors: TButton;
    GroupBox1: TGroupBox;
    Label17: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    edtSerialNum: TEdit;
    btnSaveSerial: TButton;
    edtVersion: TEdit;
    edtModelNo: TEdit;
    edtModelType: TEdit;
    GroupBox7: TGroupBox;
    cbxPerms_PTBSystem: TCheckBox;
    cbxPerms_CustomerSystem: TCheckBox;
    cBxSelectModelType: TComboBox;
    GroupBox9: TGroupBox;
    lowElChargeCalValLabel: TLabel;
    highElChargeCalValLabel: TLabel;
    lowElChargeCalValEdit: TEdit;
    highElChargeCalValEdit: TEdit;
    lowElChargeCalValSave: TButton;
    EMLowStart: TButton;
    TabSheet6: TTabSheet;
    Command: TLabel;
    Label1: TLabel;
    lblSend_N: TLabel;
    JvArrowButton1: TJvArrowButton;
    edtCommand: TEdit;
    btnSendCommand: TButton;
    edtCommLog: TMemo;
    btnClearLog: TButton;
    btnCopyLog: TButton;
    TabSheet7: TTabSheet;
    Shape1: TShape;
    Bevel2: TBevel;
    imgExcel: TImage;
    imgOverFlow: TImage;
    lstMeasure: TListView;
    pnlExcel: TPanel;
    Bevel1: TBevel;
    lblFileName: TLabel;
    Label2: TLabel;
    chkOO: TCheckBox;
    chkCloseApp: TCheckBox;
    btnSave: TButton;
    edtCol: TEdit;
    edtRow: TEdit;
    btnActiveCell: TButton;
    btnSetValue: TButton;
    edtCellValue: TEdit;
    chkUseActiveCell: TCheckBox;
    optCellValue: TRadioButton;
    optCellString: TRadioButton;
    btnGetValue: TButton;
    btnFindCell: TButton;
    edtSheetName: TLabeledEdit;
    chkActiveSheet: TCheckBox;
    chkExcel: TCheckBox;
    btnOpen: TButton;
    pnlKVcalcCont: TPanel;
    lblKVcalc: TLabel;
    pnlKVcalc: TPanel;
    chkKVcalc: TCheckBox;
    pnlTFcalcCont: TPanel;
    lblTFcalc: TLabel;
    pnlTFcalc: TPanel;
    chkTFcalc: TCheckBox;
    pnlDoseCont: TPanel;
    lblDose: TLabel;
    pnlDose: TPanel;
    chkDose: TCheckBox;
    pnlKVratioCont: TPanel;
    lblKVratio: TLabel;
    pnlKVratio: TPanel;
    chkKVratio: TCheckBox;
    pnlTFratioCont: TPanel;
    lblTFratio: TLabel;
    pnlTFratio: TPanel;
    chkTFratio: TCheckBox;
    pnlTimeCont: TPanel;
    lblTime: TLabel;
    pnlTime: TPanel;
    chkTime: TCheckBox;
    pnlS1Cont: TPanel;
    lblS1: TLabel;
    chkS1: TCheckBox;
    pnlS1: TPanel;
    pnlS2Cont: TPanel;
    lblS2: TLabel;
    chkS2: TCheckBox;
    pnlS2: TPanel;
    pnlS3Cont: TPanel;
    lblS3: TLabel;
    chkS3: TCheckBox;
    pnlS3: TPanel;
    pnlS4Cont: TPanel;
    lblS4: TLabel;
    chkS4: TCheckBox;
    pnlS4: TPanel;
    btnDumpGrid: TButton;
    optLowKVRange: TRadioButton;
    optHighKVRange: TRadioButton;
    pnlS1ContCu: TPanel;
    lblS1Cu: TLabel;
    chkS1Cu: TCheckBox;
    pnlS1Cu: TPanel;
    pnlS2ContCu: TPanel;
    lblS2Cu: TLabel;
    chkS2Cu: TCheckBox;
    pnlS2Cu: TPanel;
    pnlS3ContCu: TPanel;
    lblS3Cu: TLabel;
    chkS3Cu: TCheckBox;
    pnlS3Cu: TPanel;
    pnlS4ContCu: TPanel;
    lblS4Cu: TLabel;
    chkS4Cu: TCheckBox;
    pnlS4Cu: TPanel;
    chkOpenFile: TCheckBox;
    cmbBq: TComboBox;
    Button1: TButton;
    edtTfSet: TLabeledEdit;
    pnlHvlCont: TPanel;
    lblHvl: TLabel;
    pnlHvl: TPanel;
    chkHvl: TCheckBox;
    edtKvHidden: TLabeledEdit;
    edtTfHidden: TLabeledEdit;
    btnTest: TButton;
    TabSheet1: TTabSheet;
    Image1: TImage;
    imgExcelfw: TImage;
    Label23: TLabel;
    chkExcelfw: TCheckBox;
    chkOpenFilefw: TCheckBox;
    btnOpenfw: TButton;
    mem_meascalcinfo: TMemo;
    ListFirmware: TListView;
    chkEnableClipboard: TCheckBox;
    btnDataHeaderCopy: TButton;
    TabSheet4: TTabSheet;
    Label9: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label15: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label10: TLabel;
    Label16: TLabel;
    pnl_kv: TPanel;
    pnl_kvpeak: TPanel;
    pnl_tf: TPanel;
    pnl_tfpeak: TPanel;
    pnl_dose: TPanel;
    pnl_doserat: TPanel;
    pnl_radtime: TPanel;
    pnl_irradtime: TPanel;
    pnl_hvl: TPanel;
    pnl_hvlpeak: TPanel;
    TabSheet9: TTabSheet;
    GroupBox8: TGroupBox;
    lbDoseS3Val: TLabel;
    lbDoseChargeUnit: TLabel;
    edtDoseChargeValue: TEdit;
    DoseStoring: TButton;
    DetectorTestTab: TTabSheet;
    DetectorTestBox: TGroupBox;
    DetectorTest: TButton;
    Signal2: TComboBox;
    Signal3: TComboBox;
    Signal4: TComboBox;
    Signal1: TComboBox;
    EMHighStart: TButton;
    ClearData: TButton;
    Panel_P1A_value: TPanel;
    Panel_P1A_unit: TPanel;
    Panel_P2_value: TPanel;
    Panel_P2_unit: TPanel;
    Panel_P4_value: TPanel;
    Panel_P3_value: TPanel;
    Panel_P4_unit: TPanel;
    Panel_P5_value: TPanel;
    Panel_P5_unit: TPanel;
    Panel_P7_value: TPanel;
    Panel_P7_unit: TPanel;
    Panel_P8_value: TPanel;
    Panel_P8_unit: TPanel;
    Panel_P9_value: TPanel;
    Panel_P9_unit: TPanel;
    Panel_P10_value: TPanel;
    Panel_P10_unit: TPanel;
    Panel_P11_value: TPanel;
    Panel_P11_unit: TPanel;
    Panel_P12_value: TPanel;
    Panel_P12_unit: TPanel;
    Panel_P14_value: TPanel;
    Panel_P14_unit: TPanel;
    Panel_P15_value: TPanel;
    Panel_P15_unit: TPanel;
    Panel_P16_value: TPanel;
    Panel_P16_unit: TPanel;
    Panel_P19_value: TPanel;
    Panel_P19_unit: TPanel;
    Panel_P6_value: TPanel;
    Panel_P6_unit: TPanel;
    Panel_P13_value: TPanel;
    Panel_P13_unit: TPanel;
    Panel_P17_value: TPanel;
    Panel_P17_unit: TPanel;
    Panel_P18_value: TPanel;
    Panel_P18_unit: TPanel;
    Panel_P20_value: TPanel;
    Panel_P20_unit: TPanel;
    Panel_P21_value: TPanel;
    Panel_P21_unit: TPanel;
    TabSheet10: TTabSheet;
    GroupBox11: TGroupBox;
    Label33: TLabel;
    S1SimValEdit: TEdit;
    S2SimValEdit: TEdit;
    S3SimValEdit: TEdit;
    S4SimValEdit: TEdit;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    GroupBox12: TGroupBox;
    btnSaveWf: TButton;
    FileNameWf: TEdit;
    Label39: TLabel;
    TriggSignal: TLabel;
    btnClrVal: TButton;
    btnSimVal: TButton;
    btnSimWf: TButton;
    copyItemToClipBoard: TPopupMenu;
    Copytoclipboad1: TMenuItem;
    pnlSend_N: TPanel;
    Memo1: TMemo;
    Panel_P1B_unit: TPanel;
    Panel_P1B_value: TPanel;
    Panel_P3_unit: TPanel;
    Panel_P1B_probe: TPanel;
    Panel_P1A_probe: TPanel;
    Panel_P2_probe: TPanel;
    Panel_P3_probe: TPanel;
    Panel_P6_probe: TPanel;
    Panel_P7_probe: TPanel;
    Panel_P8_probe: TPanel;
    Panel_P11_probe: TPanel;
    Panel_P12_probe: TPanel;
    Panel_P13_probe: TPanel;
    Panel_P14_probe: TPanel;
    Panel_P15_probe: TPanel;
    Panel_P18_probe: TPanel;
    Panel_P19_probe: TPanel;
    Panel_P20_probe: TPanel;
    Panel_P21_probe: TPanel;
    Panel_P5_probe: TPanel;
    Panel_P4_probe: TPanel;
    Panel_P10_probe: TPanel;
    Panel_P9_probe: TPanel;
    Panel_P16_probe: TPanel;
    Panel_P17_probe: TPanel;
    T: TTabSheet;
    GroupBox10: TGroupBox;
    Charge: TLabel;
    Label34: TLabel;
    edtElectrometerVal: TEdit;
    Button2: TButton;
    edtElectrometerRaw: TEdit;
    Label41: TLabel;
    Label43: TLabel;
    edtCurrent: TEdit;
    Label45: TLabel;
    edtTime: TEdit;
    Label46: TLabel;
    Label47: TLabel;
    edtSamples: TEdit;
    edtFirmwareVersion: TEdit;
    Label40: TLabel;
    GroupBox6: TGroupBox;
    lowMasCalValLabel: TLabel;
    highMasCalValLabel: TLabel;
    Label42: TLabel;
    Label44: TLabel;
    lowMasCalValEdit: TEdit;
    highMasCalValEdit: TEdit;
    lowMasCalValSave: TButton;
    Button3: TButton;
    Timer1: TTimer;
    Timer2: TTimer;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel1: TPanel;
    Label26: TLabel;
    btnCharge: TButton;
    Panel23: TPanel;
    ConnectionStatus: TPanel;
    lBoxWfFiles: TListBox;
    Label30: TLabel;
    btnUpdate: TButton;
    Button4: TButton;
    TabSheet8: TTabSheet;
    GroupBox13: TGroupBox;
    Label49: TLabel;
    TabSheet11: TTabSheet;
    CheckBox1: TCheckBox;
    edtMASAdjustADCMean75mA_1: TEdit;
    Label31: TLabel;
    Label35: TLabel;
    Label72: TLabel;
    Button11: TButton;
    gpibConnectionStatus: TPanel;
    GroupBox15: TGroupBox;
    Label63: TLabel;
    Label64: TLabel;
    Label67: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label88: TLabel;
    Label91: TLabel;
    Label94: TLabel;
    Label97: TLabel;
    Label100: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    btEmCalibrationStart: TButton;
    Button15: TButton;
    btEmCalibrationExportRTIIS: TButton;
    btMASAdjustmentStart: TButton;
    Label130: TLabel;
    Label103: TLabel;
    edtEmCalibrationCurrVal750pA: TEdit;
    edtEmCalibrationCurrVal7nA: TEdit;
    edtEmCalibrationCurrVal75nA: TEdit;
    edtEmCalibrationCurrVal750nA: TEdit;
    edtEmCalibrationCurrVal7500nA: TEdit;
    edtEmCalibrationCurrDev750pA: TEdit;
    edtEmCalibrationCurrDev7nA: TEdit;
    edtEmCalibrationCurrDev75nA: TEdit;
    edtEmCalibrationCurrDev750nA: TEdit;
    edtEmCalibrationCurrDev7500nA: TEdit;
    Label66: TLabel;
    edtEmCalibrationCurrPass750pA: TEdit;
    edtEmCalibrationCurrPass7nA: TEdit;
    edtEmCalibrationCurrPass75nA: TEdit;
    edtEmCalibrationCurrPass750nA: TEdit;
    edtEmCalibrationCurrPass7500nA: TEdit;
    edtEmCalibrationChargeVal750pC: TEdit;
    edtEmCalibrationChargeVal7nC: TEdit;
    edtEmCalibrationChargeVal75nC: TEdit;
    edtEmCalibrationChargeVal750nC: TEdit;
    edtEmCalibrationChargeVal7500nC: TEdit;
    Label78: TLabel;
    Label82: TLabel;
    edtEmCalibrationChargeDev750pC: TEdit;
    edtEmCalibrationChargeDev7nC: TEdit;
    edtEmCalibrationChargeDev75nC: TEdit;
    edtEmCalibrationChargeDev750nC: TEdit;
    edtEmCalibrationChargeDev7500nC: TEdit;
    edtEmCalibrationChargePass750pC: TEdit;
    edtEmCalibrationChargePass7nC: TEdit;
    edtEmCalibrationChargePass75nC: TEdit;
    edtEmCalibrationChargePass750nC: TEdit;
    edtEmCalibrationChargePass7500nC: TEdit;
    lblEmCalibrationWorking: TLabel;
    Label86: TLabel;
    GroupBox18: TGroupBox;
    btEmOffsetReset: TButton;
    Label84: TLabel;
    GroupBox14: TGroupBox;
    edtCal80nC_1: TEdit;
    edtCal80nC_2: TEdit;
    edtCal80nC_3: TEdit;
    edtCal10uC_1: TEdit;
    edtCal10uC_2: TEdit;
    edtCal10uC_3: TEdit;
    edtGain80nC: TEdit;
    edtGain10uC: TEdit;
    GroupBox16: TGroupBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Button5: TButton;
    GroupBox17: TGroupBox;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label83: TLabel;
    Label87: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    lblEmAdjustmentFailure: TLabel;
    lblEmAdjustmentWorking: TLabel;
    Label85: TLabel;
    edtEmAdjustmentHsCurrent_1: TEdit;
    edtEmAdjustmentHsCurrent_2: TEdit;
    edtEmAdjustmentHsCurrent_3: TEdit;
    edtEmAdjustmentLsCurrent_1: TEdit;
    edtEmAdjustmentLsCurrent_2: TEdit;
    edtEmAdjustmentLsCurrent_3: TEdit;
    edEmAdjustmenttHsGain: TEdit;
    edEmAdjustmenttLsGain: TEdit;
    btEmAdjustmentStart: TButton;
    edtEmOffsetHigh: TEdit;
    edtEmOffsetLow: TEdit;
    Label89: TLabel;
    Label90: TLabel;
    lblEmOffsetWorking: TLabel;
    lblEmOffsetFailure: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    edtEmSerialNumber: TEdit;
    edtEmVersion: TEdit;
    lblEmAdjustmentStorageFailure: TLabel;
    Label32: TLabel;
    edtMASAdjustADCMean75mA_2: TEdit;
    edtMASAdjustADCMean75mA_3: TEdit;
    edtMASAdjustCurrent75mA_3: TEdit;
    edtMASAdjustCurrent75mA_2: TEdit;
    edtMASAdjustCurrent75mA_1: TEdit;
    Label48: TLabel;
    edtMASAdjustCurrent75mA_MeanVal: TEdit;
    edtMASAdjustADCMean75mA_MeanVal: TEdit;
    Label50: TLabel;
    edtMASAdjustGainFactor75mA: TEdit;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    edtMASAdjustCurrent750mA_1: TEdit;
    edtMASAdjustCurrent750mA_2: TEdit;
    edtMASAdjustCurrent750mA_3: TEdit;
    edtMASAdjustADCMean750mA_2: TEdit;
    edtMASAdjustADCMean750mA_1: TEdit;
    edtMASAdjustADCMean750mA_3: TEdit;
    edtMASAdjustCurrent750mA_MeanVal: TEdit;
    edtMASAdjustADCMean750mA_MeanVal: TEdit;
    edtMASAdjustGainFactor750mA: TEdit;
    lblMASAdjustFailure: TLabel;
    lblMASAdjustStorageFailure: TLabel;
    lblMASAdjustmentWorking: TLabel;
    pnlFlukeConnected: TPanel;
    GroupBox19: TGroupBox;
    btMASOffsetResetStart: TButton;
    lblMASOffsetWorking: TLabel;
    edtMASCalibOffsetHigh: TEdit;
    edtMASCalibOffsetLow: TEdit;
    Label70: TLabel;
    Label71: TLabel;
    lblMASOffsetFailure: TLabel;
    Label69: TLabel;
    Label95: TLabel;
    edtMasSerialNumber: TEdit;
    edtMasVersion: TEdit;
    GroupBox20: TGroupBox;
    btMASCalibrationStart: TButton;
    lblMASCalibrationWorking: TLabel;
    btMasCalibrationExportRTIIS: TButton;
    Label65: TLabel;
    Label101: TLabel;
    Label68: TLabel;
    Label96: TLabel;
    Label98: TLabel;
    edtMasCalibrationRefCur5mA: TEdit;
    edtMasCalibrationRefCur75mA: TEdit;
    edtMasCalibrationRefCur250mA: TEdit;
    edtMasCalibrationRefCur750mA: TEdit;
    edtMasCalibrationMeasCur5mA: TEdit;
    edtMasCalibrationMeasCur75mA: TEdit;
    edtMasCalibrationMeasCur250mA: TEdit;
    edtMasCalibrationMeasCur750mA: TEdit;
    edtMasCalibrationDev5mA: TEdit;
    edtMasCalibrationDev75mA: TEdit;
    edtMasCalibrationDev250mA: TEdit;
    edtMasCalibrationDev750mA: TEdit;
    edtMasCalibrationPass5mA: TEdit;
    edtMasCalibrationPass75mA: TEdit;
    edtMasCalibrationPass250mA: TEdit;
    edtMasCalibrationPass750mA: TEdit;
    Label60: TLabel;
    lblMASAdjustStorageOk: TLabel;
    lblEmStorageOk: TLabel;
    cbxPerm_Ocean: TComboBox;
    Label77: TLabel;
    Label99: TLabel;
    edtOceanLicensLimit: TEdit;
    Timer3: TTimer;
    Timer4: TTimer;
    Label102: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    ChinakVDoseAdjustmentTabSheet: TTabSheet;
    GroupBox21: TGroupBox;
    ChinakVAdjReset: TButton;
    edtChinakV_k0: TEdit;
    edtChinakV_k1: TEdit;
    edtChinaDose_d0: TEdit;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    edtChinaDose_d1: TEdit;
    ChinakVAdjSet: TButton;
    autoTest: TTabSheet;
    atSendCmd: TButton;
    atCmdTxt: TEdit;
    atLogs: TMemo;
    atCmdCounter: TEdit;
    atLoadTestCase: TOpenTextFileDialog;
    atSaveTestCase: TSaveTextFileDialog;
    atOpenTC: TButton;
    atSaveTC: TButton;

    procedure ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
    function  SendAdvancedModeMessage() : boolean;
    procedure OnTimerEventMessage1s(Sender: TObject);
    procedure OnTimerEventMessage200ms(Sender: TObject);
    procedure btnSendCommandClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure btnReadValuesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnEraseLastClick(Sender: TObject);
    procedure btnEraseAllClick(Sender: TObject);
    procedure chkOOClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOpenClick(Sender: TObject);
    procedure btnActiveCellClick(Sender: TObject);
    procedure btnSetValueClick(Sender: TObject);
    procedure btnGetValueClick(Sender: TObject);
    procedure btnFindCellClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure chkCloseAppClick(Sender: TObject);
    procedure chkKVcalcClick(Sender: TObject);
    procedure chkTFcalcClick(Sender: TObject);
    procedure chkDoseClick(Sender: TObject);
    procedure chkKVratioClick(Sender: TObject);
    procedure chkTFratioClick(Sender: TObject);
    procedure chkTimeClick(Sender: TObject);
    procedure chkS1Click(Sender: TObject);
    procedure chkS2Click(Sender: TObject);
    procedure chkS3Click(Sender: TObject);
    procedure chkS4Click(Sender: TObject);
    procedure edtCommandKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkS1CuClick(Sender: TObject);
    procedure chkS2CuClick(Sender: TObject);
    procedure chkS3CuClick(Sender: TObject);
    procedure chkS4CuClick(Sender: TObject);
    procedure btnDumpGridClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure optLowKVRangeClick(Sender: TObject);
    procedure optHighKVRangeClick(Sender: TObject);
    procedure btnSend_n_OkClick(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Send1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cmbBqSelect(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure InputReaction_m_get_val(words : array of string; numwords : Integer);
    procedure btnTestClick(Sender: TObject);
    procedure btnOpenfwClick(Sender: TObject);
    procedure btnReadFactorsClick(Sender: TObject);
    procedure btnSaveSerialClick(Sender: TObject);
    procedure ClearExcelClick(Sender: TObject);
    procedure btnSavePolynomCoeffsClick(Sender: TObject);
    procedure btnSaveCalMetaDataClick(Sender: TObject);
    procedure edtModelNoChange(Sender: TObject);
    procedure btnClearLogClick(Sender: TObject);
    procedure btnCopyLogClick(Sender: TObject);
    procedure DoseStoringClick(Sender: TObject);
    procedure DetectorTestClick(Sender: TObject);
    procedure btnDataHeaderCopyClick(Sender: TObject);
    procedure tiSDTestsTimer(Sender: TObject);
    procedure ElectrometerCheckBoxClick(Sender: TObject);
    procedure lowMasCalValSaveClick(Sender: TObject);
    procedure highElChargeCalValSaveClick(Sender: TObject);
    procedure EMLowStartClick(Sender: TObject);
    procedure GroupBox9Click(Sender: TObject);
    procedure Signal2Change(Sender: TObject);
    procedure EMHighStartClick(Sender: TObject);
    procedure ClearParamsClick(Sender: TObject);
    procedure btnClrValClick(Sender: TObject);
    procedure btnSimWfClick(Sender: TObject);
    procedure btnSaveWfClick(Sender: TObject);
    procedure btnSimValClick(Sender: TObject);
    procedure Copytoclipboard1Click(Sender: TObject);
    procedure StoreLogToFile(setup: boolean);
    procedure cbMasCalibrationClick(Sender: TObject);
    procedure ClearDataClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ClearParams();
    procedure mem_meascalcinfoChange(Sender: TObject);
    procedure highMasCalValSaveClick(Sender: TObject);
    procedure lowElChargeCalValSaveClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnCurrentClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BtMASCopyADCMeanClick(Sender: TObject);
    procedure btMASOffsetResetStartClick(Sender: TObject);
    procedure btMASAdjustmentStartClick(Sender: TObject);
    procedure btMASCalibrationStartClick(Sender: TObject);
    procedure BtMASCopyCurrentClick(Sender: TObject);
    procedure BtMASClearClick(Sender: TObject);
    procedure btnSetAuto(Sender: TObject);
    procedure loadDLL;
    procedure BtCalibElectrOffsetClick(Sender: TObject);
    procedure MakeMASTrig();
    procedure ClearMASOffsetView;
    procedure ClearMASAdjustmentView();
    procedure ClearMASCalibrationView();
    procedure ClearEmOffsetView();
    procedure ClearEmCalibrationView();
    procedure ClearEmAdjustmentView();
    procedure CalcExtProbeOffset();
    procedure CalcMasOffset();
    procedure AskForOffset();
    procedure MakeFwOffsetResetForMASCalibration();
    procedure MakeFwOffsetResetForCalibration();
    procedure btEmAdjustmentStartClick(Sender: TObject);
    procedure BtCheckElectrOffsetClick(Sender: TObject);
    procedure btEmCalibrationStartClick(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure btnDeleteFileClick(Sender: TObject);
    procedure btEmCalibrationExportRTIISClick(Sender: TObject);
    procedure btMasCalibrationExportRTIISClick(Sender: TObject);
    procedure btEmOffsetResetClick(Sender: TObject);
    procedure ReadCobiaData(Sender: TObject);
    procedure ChinakVAdjResetClick(Sender: TObject);
    procedure ChinakVAdjSetClick(Sender: TObject);
    procedure atSendCmdClick(Sender: TObject);
    procedure atOpenTCClick(Sender: TObject);
    procedure atSaveTCClick(Sender: TObject);

type
  TCobiaComSource = (NONE, USB_HID, USB_CDC);    // Cources for communication to Cobia
  TTrigMode = (TRIG_PEAK, TRIG_DISABLE, TRIG_MANUAL, TRIG_WINDOW, TRIG_ON, TRIG_OFF);

const
  MAX_LEN_INPUT_STRING        = 1000;  // Number of strings in ringbuffert for incoming strings from Cobia (large to get rid of waveform data)
  EM_WAITING_FOR_HIGH_SENS_PULSE = 1;
  EM_WAITING_FOR_LOW_SENS_PULSE  = 2;
  EM_COMPLETE                    = 3;
  CHARGE_CONV_FACTOR             = 1;
  LOW_SENSITIVITY                = 0;
  HIGH_SENSITIVITY               = 1;
  rxBufSize                      = 1000;  // Size of buffer for COM port communication
  txBufSize                      = 256;
private
    _s : array [1..4] of Extended;
//    _wfS : array [1..8] of Integer;
    _wfCurrentSample : array [1..20] of Integer;
    _wfCurrentSampleIndex : Integer;
    _wfNumSamples : Integer;
    _wfCurrentIndex : Integer;
    _burstReadyMode : Boolean;
    _wfCurrentLine : Integer;
    _tracealyzerStarted : Boolean;
    _traceIndex : Integer;
    _signal           : Integer;
    _electroMeterCalibrationSm : Integer;
    _calFactorExt : Extended;
    _calFactorInt : Extended;
    _intSensorSensitivity : Integer;

    _fileNameRTIIS    : string;

    // Variables for Excel strings

    // GUI variables
    _sP1A_gui             : string;
    _sP1B_gui             : string;
    _sP2_gui              : string;
    _sP2E_gui             : string;
    _sP3_gui              : string;
    _sP3E_gui             : string;
    _sP4_gui              : string;
    _sP5_gui              : string;
    _sP6_gui              : string;
    _sP6E_gui             : string;
    _sP6M_gui             : string;
    _sP7_gui              : string;
    _sP7E_gui             : string;
    _sP8_gui              : string;
    _sP8E_gui             : string;
    _sP9_gui              : string;
    _sP9E_gui             : string;
    _sP9_gui_unit         : string;
    _sP10_gui             : string;
    _sP10E_gui            : string;
    _sP10_gui_unit        : string;
    _sP11_gui             : string;
    _sP11E_gui            : string;
    _sP11_gui_unit        : string;
    _sP12_gui             : string;
    _sP12E_gui            : string;
    _sP13_gui             : string;
    _sP13E_gui            : string;
    _sP13_gui_unit        : string;
    _sP14EM_gui           : string;
    _sP14EM_gui_unit      : string;
    _sP15EM_gui           : string;
    _sP16EM_gui           : string;
    _sP16EM_gui_unit      : string;
    _sP17EM_gui           : string;
    _sP18E_gui            : string;
    _sP18E_gui_unit       : string;
    _sP19E_gui            : string;
    _sP19E_gui_unit       : string;
    _sP20E_gui            : string;
    _sP20E_gui_unit       : string;
    _sP21E_gui            : string;
    _sP21E_gui_unit       : string;

    // Calc variables
    _sP1A             : string;
    _sP1B             : string;
    _sP2              : string;
    _sP2E             : string;
    _sP3              : string;
    _sP3E             : string;
    _sP4A             : string;
    _sP4              : string;
    _sP5A             : string;
    _sP5              : string;
    _sP6              : string;
    _sP6E             : string;
    _sP6M             : string;
    _sP7              : string;
    _sP7E             : string;
    _sP7M             : string;
    _sP8              : string;
    _sP8E             : string;
    _sP8M             : string;
    _sP9              : string;
    _sP9E             : string;
    _sP10             : string;
    _sP10E            : string;
    _sP11             : string;
    _sP11E            : string;
    _sP11M            : string;
    _sP12             : string;
    _sP12E            : string;
    _sP12M            : string;
    _sP13             : string;
    _sP13E            : string;
    _sP13M            : string;
    _sP14E            : string;
    _sP14M            : string;
    _sP15E            : string;
    _sP15M            : string;
    _sP16E            : string;
    _sP16M            : string;
    _sP17E            : string;
    _sP17M            : string;
    _sP18E            : string;
    _sP19E            : string;
    _sP20             : string;
    _sP21             : string;

    // Raw parameters
    _sS1_int           : string;     // SUM1 = S1
    _sS2_int           : string;     // SUM2
    _sS3_int           : string;     // SUM3 = S3
    _sS4_int           : string;     // SUM4
    _sE1_int           : string;
    _sE2_int           : string;
    _sM1_int           : string;
    _sS1               : string;
    _sS2               : string;
    _sS3               : string;
    _sS4               : string;
    _sE1               : string;
    _sE2               : string;
    _sS1_I             : string;
    _sS2_I             : string;
    _sS3_I             : string;
    _sS4_I             : string;
    _sE1_I             : string;
    _sE2_I             : string;
    _sSensitivity      : string;
    _sSensitivity_Ext  : string;
    _sS2_S2_Field      : string;       // S2
    _sS2_S5_Field      : string;       // S5
    _sS2_S6_Field      : string;       // S6
    _sS4_S4_Field      : string;       // S4
    _sS4_S7_Field      : string;       // S7
    _sS4_S8_Field      : string;       // S8

    // Intermediate results
    _sS2_S1_ratio        : string;
    _sS2_S3_ratio        : string;
    _sS4_S2_ratio        : string;
    _sS4_S3_ratio        : string;
    _skVLow              : string;
    _sTfLow              : string;
    _skVHigh             : string;
    _sTfHigh             : string;
    _sSelectedkVRange    : string;
    _sPeakLevel          : string;
    _skVpLow             : string;
    _skVpHigh            : string;
    _sTfpLow             : string;
    _sTfpHigh            : string;
    _sP1_Method          : string;
    _sSetting_kV         : string;
    _sChargeS3           : string;
    _sChargeE1           : string;
    _sChargeE2           : string;
    _sDosePreEnergyComp  : string;
    _sDosePostEnergyComp : string;
    _sDoseCorrFactor     : string;

    // Info
    _sMeasureTime        : string;   // Time for measurement*

    _skV                 : string;
    _sTF                 : string;
    _skVp                : string;
    _sTfp                : string;
    _sPeakPPV            : string;   // Peak or PPV selected
    _sRange              : string;
    _sHVL                : string;
    _sDose               : string;
    _sDoseExt            : string;
    _sDoseUnit           : string;
    _sDoseRate           : string;
    _sDoseRateUnit       : string;
    _sSTime              : string;
    _sExpTimeUnit        : string;
    _sS1Cu               : string;
    _sS2Cu               : string;
    _sS3Cu               : string;
    _sS4Cu               : string;

    //_sMeasureTime        : string;   // Time for measurement*

    //_skVRatioLow         : string;
    _sTfRatioLow         : string;
 //   _skVRatioHigh        : string;
//    _sTfRatioHigh        : string;
    //_sNbrPulses          : string;
    _sPulseFreq          : string;
    _sDosePerPulse       : string;
    _sDoseRatePerPulse   : string;
    //_sPulseWidth         : string;
    _sPulseIntermittens  : string;
    _sPulseEffectiveTime : string;

    _sTubeCharge         : string;
    _sTubeCurrent        : string;
    _sTubeChargePerPulse : string;
    _sTubeCurrentPerPulse : string;

    // Variables for SD storage
    _iNbrSDTest       : Integer;
    _sSDFile          : string;
    _sSDMaxTime       : string;
    _sSDMaxTimeInd    : string;
    _sSDSecMaxTime    : string;
    _sSDSecMaxTimeInd : string;
    _sSDMinTime       : string;
    _sSDMinTimeInd    : string;
    _sSDNbrMissSamp   : string;
    _sSDLogFilename   : string;

    // Variables for offset storing of external probe
    _sExtOffsetHighSideA   : string;
    _sExtOffsetHighSideB   : string;
    _sExtOffsetLowSideA    : string;
    _sExtOffsetLowSideB    : string;
    _bHighSide             : Boolean;
    _normalizeFactLowSideA : Extended;  // Normalize factors for the external capacitors for the external probes
    _normalizeFactLowSideB : Extended;

    // Variables for automaticaly storing log-file
    _sLogToFileFilename  : string;
 //   _iSavedLines         : Integer;

    // Ring buffer that stores incoming strings from Cobia
    _sInputStrings : Array[1..MAX_LEN_INPUT_STRING] of string;
    _traceBuffer : Array[1..10000] of ShortInt;
    _iWriteIndexInputStrings : Integer;
    _iReadIndexInputStrings  : Integer;
    _bReadInputStrings       : bool;       // Used for permit timerTick read too fast
    _traceFile               : File;
    _CobiaComFileHndl        : THandle;   // Handle for the communication to Cobia via RS232
    _CobiaComSource          : TCobiaComSource;  // Source of Cobia communication
    _CobiaTmpInputString     : string;
    _CobiaLastComTime        : cardinal;

    _Gpib32Lib         : THandle;
    _EmAdjust          : Integer;
    _EmCalibr          : Integer;
    _EmChargeAct       : Boolean;
    _EmCalibratorFound : Boolean;
    _FinalCalc         : Boolean;
//    _IntMasMeanADC  : Extended;
    _EmOffsetMeasured    : Boolean;
    _MasOffsetMeasured   : Boolean;
    _MasAdjust        : Integer;
    _MasCalib         : Integer;
    _MasCalib5mA_1, _MasCalib5mA_2, _MasCalib5mA_3 : Extended;
    _FlukeComFileHndl : THandle;  // Handle for the communication to FLUKE 189
    _FlukeComSetupFinished : Boolean;

    iTimeSDTest  : Integer;

    MyApp: CBaseApp;

    function SetupCobiaComPort() : boolean;
    procedure CloseCobiaComPort();
    procedure ReadCobiaComPort();
    function  SendCobiaCommandCom(cmd : string) : boolean;
    procedure PutRecStringInRingbuf(inputString : String);

    function GetFileNameRTIIS(): String;

    procedure SetBitmapToImage(var img_out: TImage; iIndex_in: Integer);
    procedure DefaultExcelCompValues();

    function IsCobiaString(inString : string) : Boolean;
    procedure IntepretInputStringsCobia();
    procedure CheckPassFail(maxDevError, deviation : Extended; edt : TEdit);
    procedure ParseInput(input : string);
    procedure InitiateLastExp();
    function SetErrorCaption(input : string) : string;

    procedure InputReaction_wf_read(line : string);
    procedure ExtractDetectorSamples(samples : array of integer);
    function HexStrToInt(str : string) : Integer;

    procedure EvaluatePolynomialTFLowSignal();
    procedure EvaluatePolynomialkVLowSignal();
    procedure EvaluatePolynomialTFHighSignal();
    procedure EvaluatePolynomialkVHighSignal();

    procedure SendToExcel();
    procedure SendToExcel_fw( inputStr : string );
    procedure HandleDisplayCheck(pnl_In:TPanel; chk_In:TCheckBox);
    procedure AddToList(dS1_in, dS2_in, dS3_in, dS4_in, dTime_in: Extended);
    procedure AddToPanel(chk_in:TCheckBox; pnl_in: TPanel; dS1_in, dS2_in, dS3_in, dS4_in, dTime_in: Extended);
    function KVRatio(dS1_in, dS2_in, dS3_in, dS4_in: Extended): Extended;
    function TFRatio(dS1_in, dS2_in, dS3_in, dS4_in: Extended): Extended;
    function KV_TfCalc(dkVRatio_in, dTfRatio_in: Extended; var dTf_out: Extended): Extended;
    function TFCalc(dTFRatio_in: Extended): Extended;
    function Hvl_Calc(dkVCalc_in, dTFCalc_in: Extended): Extended;
    function Dose(dS3_in: Extended): Extended;
    function Ch2Cu(dCh_in, dTime_in: Extended): Extended;
    function AdaptValue(valueString : string) : string;

    function  CalcRatioBetweenHighLow(value1, value2, value3 : Extended) : Extended;
    function  ExtractNumberInString( sChaine: String ): String ;
    procedure MASFlukeCommunicationSetup();
    procedure AddCommandFiles();
    function  ConvertPointToComma(inputString : string) : string;
    function  ConvertCommaToPoint(inputString : string) : string;
    procedure makeFirmwareExcelString();
    procedure clearFirmwareExcelString();
    procedure CommandItemClick ( Sender : TObject );
    function  ReadCurrentFromFluke(): Extended;
    function  CalcDeviation(reference, measValue : Extended) : Extended;
    function  CheckValidCurrent(reference, measValue : Extended) : Integer;
    procedure MASAdjust(measuredADCMeanValue : string);
    procedure MASCalib(measuredCurrentValue : string);
    procedure MASCheckCalibStorage();
    procedure EmCheckCalibStorage();
    procedure EmAdjust(measuredCurrentValue : string);
    procedure EmCalib(measuredCurrentChargeValue : string);
    procedure ChinaAdjustment_SetDefault();
    function SendCommand_EraseCalCRC() : boolean;

    // Function of Automatic testing module
    procedure ParseAutoTestCases(FileName: string; Encoding: TEncoding );

  public
    pPolys: CPolynomials;
    _numsamples : Integer;
    _hid : HidComObject;
    _command : string;
    _subitems : Integer;
    _firstTrig : Boolean;
    iSensitivity: Integer;
    procedure Print(txt:string);
    procedure Delay(Num: longint);
    procedure EvaluatePolynomials();
    function SafeFloatConvert(sValue_in: String): Extended;
    procedure ResetDisplays();
    procedure StartSDTests();
    function SendExternalProtocolCommand(cmd : AnsiString) : boolean;
    function SendCommand(cmd : string) : boolean;
    procedure SendTrigCommand(trigMode : TTrigMode; windowTimeMs : Integer);
  end;

var
  frmMain: TfrmMain;

  // GPIB functions
  AddrIbsta  : Tibsta;
  AddrIberr  : Tiberr;
  AddrIbcntl : Tibcntl;
  Pibsta : ^integer;
  Piberr  : ^integer;
  Pibcntl : ^Longint;
  IbDev   : Tibdev;
  IbWrt   : Tibwrt;
  IbRd    : Tibrd;

  (* Declarations for the NI-488.2 GPIB calls
                              *)
  IbDevClear      : TibDevClear;
  IbEnableRemote  : TibEnableRemote;
  IbFindLstn      : TibFindLstn;
  IbReadStatusByte: TibReadStatusByte;
  IbReceive       : TibReceive;
  IbSend          : TibSend;
  IbSendIFC       : TibSendIFC;
  IbWaitSRQ       : TibWaitSRQ;

(* Declaration for the NI-488 GPIB call                                  *)
  Ibonl: Tibonl;

implementation
uses
math, shellapi;
{$R *.dfm}

procedure TfrmMain.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  shortcuttools.Left := self.Left + self.Width;
  shortcuttools.top := self.Top + 10;
  frmWaveform.Left := self.Left + self.Width;
  frmWaveform.top := shortcuttools.Top + shortcuttools.Height - 200;
//  shortcuttools.BringToFront();
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Close the Com bort used for communication to the Cobia
  CloseCobiaComPort();
  if MyApp <> nil then
  begin
    FreeAndNil(MyApp);
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  encodings : TStrings;
begin
  iSensitivity:=0;

  _iReadIndexInputStrings  := 1;  // Read and write indexes for ringbuf of incoming strings
  _iWriteIndexInputStrings := 1;
  _bReadInputStrings       := false;
  _CobiaComSource          := NONE;

  pPolys := CPolynomials.Create(ExtractFilePath(Application.Exename));

    // Add selections for model types
  cBxSelectModelType.AddItem('1001; Smart R/F - kV', nil);
  cBxSelectModelType.AddItem('1002; Smart R/F - Dose', nil);
  cBxSelectModelType.AddItem('1003; Smart R/F - kV & Dose', nil);
  cBxSelectModelType.AddItem('1004; Smart R/F - kV + MAS', nil);
  //cBxSelectModelType.AddItem('2001; Flex R/F - kV', nil);
  //cBxSelectModelType.AddItem('2002; Flex R/F - Dose', nil);
  cBxSelectModelType.AddItem('2003; Flex R/F - kV & Dose', nil);
  cBxSelectModelType.AddItem('2004; Flex R/F - kV & Dose + MAS', nil);
  cBxSelectModelType.AddItem('3001; Sense - Without communication', nil);
  cBxSelectModelType.AddItem('3002; Sense - With communication', nil);
  cBxSelectModelType.AddItem('4001; Dental Intraor. - kV', nil);
  cBxSelectModelType.AddItem('4002; Dental Intraor. - Dose', nil);
  cBxSelectModelType.AddItem('4003; Dental Intraor. - kV & Dose', nil);

  // Add selections for Ocean licens support
  cbxPerm_Ocean.AddItem('No Ocean', nil);
  cbxPerm_Ocean.AddItem('Display', nil);
  cbxPerm_Ocean.AddItem('Connect', nil);
  cbxPerm_Ocean.AddItem('Professional', nil);

  // Create Instance for load and save file dilogs.
  atLoadTestCase := TOpenTextFileDialog.Create(Self);
  atSaveTestCase := TSaveTextFileDialog.Create(Self);

  // create a new string list that holds encoding info
  encodings := TStringList.Create();

  // add some encodings to the list
  encodings.AddObject('ASCII', TEncoding.ASCII);
  encodings.AddObject('UNICODE', TEncoding.Unicode);
  encodings.AddObject('UTF8', TEncoding.UTF8);

  atLoadTestCase.Encodings.Assign(encodings);
  atSaveTestCase.Encodings.Assign(encodings);

  atLoadTestCase.Filter := 'Text files (*.txt)|*.TXT|XML files (*.xml)|*.XML|Any file (*.*)|*.*';
  atSaveTestCase.Filter := 'Text files (*.txt)|*.TXT|XML files (*.xml)|*.XML|Any file (*.*)|*.*';

end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  pPolys.Free();
  CloseHandle(_FlukeComFileHndl);
end;

procedure TfrmMain.FormShow(Sender: TObject);
   function  GetAppVersion:string;
   var
    Size, Size2: DWord;
    Pt, Pt2: Pointer;
   begin
     Size := GetFileVersionInfoSize(PChar (ParamStr (0)), Size2);
     if Size > 0 then
     begin
       GetMem (Pt, Size);
       try
          GetFileVersionInfo (PChar (ParamStr (0)), 0, Size, Pt);
          VerQueryValue (Pt, '\', Pt2, Size2);
          with TVSFixedFileInfo (Pt2^) do
          begin
            Result:= ' v'+
                     IntToStr (HiWord (dwFileVersionMS)) + '.' +
                     IntToStr (LoWord (dwFileVersionMS)) + '.' +
                     IntToStr (HiWord (dwFileVersionLS)) + '.' +
                     IntToStr (LoWord (dwFileVersionLS));
          end;
       finally
         FreeMem (Pt);
       end;
     end;
   end;
var
  I : Integer;
  status : Boolean;
  padlist : AddrList;
  resultlist : AddrList;
  buffer : packed array[0..40] of char;
begin

  for I:=0 to pPolys.BqCount()-1 do
  begin
    cmbBq.Items.Add(pPolys.Bq(I));
    if I=0 then
    begin
      cmbBq.ItemIndex:=0;
      cmbBqSelect(self);
    end;
  end;

  AddCommandFiles();
  DefaultExcelCompValues();

  if (CHINA_KV_ADJUSTMENT = 1) then begin
    frmMain.Caption := 'Cobia - kV / Dose adjustment tool for China market'
  end else begin
    frmMain.Caption := 'Cobia - Test Program'
  end;
  frmMain.Caption := frmMain.Caption + GetAppVersion;   // Add version number
  PageControl1.ActivePageIndex := 5;  // Set focus on Firmware sheet
  _burstReadyMode := False;
  for I := 1 to 20 do begin
    _wfCurrentSample[I] := 0;
  end;
  _wfNumSamples := 0;
  _wfCurrentSampleIndex := 1;
  _wfCurrentIndex := 1;
  _wfCurrentLine := 0;
  _firstTrig := True;
  _subitems := 1;
  _numsamples := 0;
  _FlukeComSetupFinished := false;
  status := false;

  if (CHINA_KV_ADJUSTMENT = 1) then begin
    Print('Welcome to the Cobia kV / Dose adjustment tool for China market. Version: ' + GetAppVersion);
  end else begin
    Print('Welcome to the Cobia Measurement tool. Version: ' + GetAppVersion);
  end;
//    lstItem.SubItems.Add(frmMain.Caption);                                              // PC sw version
//  lstItem.SubItems.Add(edtEmVersion.Text);

   _EmOffsetMeasured  := False;   // Set offset measured done as false
   _MasOffsetMeasured := false;
   _EmCalibratorFound := false;  // No Em Calibrator found yet

  // Prepare the GPIB communication
  frmMain.gpibConnectionStatus.Font.Color := clRed;
  frmMain.gpibConnectionStatus.Caption := 'Calibrator: Disconnected';
  TabSheet11.TabVisible := False;
  _Gpib32Lib := LoadLibrary('GPIB-32.DLL');
  if (_Gpib32Lib > 0) then begin
    Print('GPIB drivers installed');
    loaddll();
    //REMOTE708
    IbSendIfc(0);
    if (Pibsta^ and ERR) <> 0 then begin
      Print('GPIB: SendIFC Error');
      frmMain.gpibConnectionStatus.Font.Color := clRed;
      frmMain.gpibConnectionStatus.Caption := 'Calibrator: Disconnected';
      TabSheet11.TabVisible := False;
     end
     else begin
        // Ifc is sent correctly
        Print('GPIB: SendIFC OK');
        // Find the calibrator (address 8)

        padlist[0] := PRIMARY_ADDR_OF_DMM;
        padlist[1] := NOADDR;
        IbFindLstn(BDINDEX, padlist, resultlist, 2);
        if (Pibcntl^) <> 0 then begin
            // The calibrator is found!

            // Set it as default value. Activate Ampere
            Print('GPIB: Calibrator found');
            IbEnableRemote(BDINDEX, padlist);
            IbDevClear(BDINDEX, PRIMARY_ADDR_OF_DMM);
            buffer := 'F1X';                  // Ampere
            IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 5, NLend);

            // Set the electrometer calibrator sheet as visible and in focus
            _EmCalibratorFound := true;
            _EmChargeAct := false;
            ClearMASOffsetView();
            ClearMASAdjustmentView();
            ClearMASCalibrationView();
            ClearEmOffsetView();
            ClearEmAdjustmentView();
            ClearEmCalibrationView();
            TabSheet11.TabVisible := True;
            PageControl1.ActivePageIndex := 11;
            frmMain.gpibConnectionStatus.Font.Color := clGreen;
            frmMain.gpibConnectionStatus.Caption := 'Calibrator: Connected';

            // Disable the shortcuttools and Waveform screen. Move the frmMain to the middle of the screen
            self.Left := (screen.WorkAreaWidth - self.Width) div 2;
            shortcuttools.Visible := false;
            frmWaveform.Visible   := false;

            // Remove some sheets and the waveform and shortcut forms
            DetectorTestTab.TabVisible := False;
            TabSheet10.TabVisible      := False;
            T.TabVisible               := False;
            frmMain.BringToFront();
        end
     end;

   end else begin
     Print('GPIB not drivers found');
     frmMain.gpibConnectionStatus.Font.Color := clRed;
     frmMain.gpibConnectionStatus.Caption := 'Calibrator: Disconnected';
     TabSheet11.TabVisible := False;
  end;

  // Setup communication to the FLUKE instrument (for MAS calibration)
  pnlFlukeConnected.Caption    := 'FLUKE: Disconnected';
  pnlFlukeConnected.Font.Color := clRed;
  MASFlukeCommunicationSetup();

  // Readup the RTIIS filename from ini file
  _fileNameRTIIS := '';
  _fileNameRTIIS := GetFileNameRTIIS();

  // Change active dir to Logs. Do this after MASFlukeCommunicationSetup()
  CreateDir('Logs');
  SetCurrentDir('Logs');

  // Setup communication to the Cobia
  _hid := HidComObject.Register(Self.Handle, status);
  if status then begin
    Print('Device HID registered');
    Print('Checking connection...');
   end;
  // Do this at OnTimerEventMessage1s instead
//    if _hid.SearchForDevice() then begin
//      Print('Cobia attached');
//      StoreLogToFile(true);  // Setup a file to store the log
//      frmMain.ConnectionStatus.Caption := 'Cobia: Disconnected';
//      frmMain.ConnectionStatus.Font.Color := clGreen;
//     SendCommand('debug_printout;1'); // Activate debug printout. Need to send command if checkbox below already checked
//     shortcuttools.cbDebugPrintout.Checked := True; // Activate debug printout
      //btnReadValuesClick(Sender);
//    end else begin
//      Print(_hid._error);
//      frmMain.ConnectionStatus.Caption := 'Cobia: Disconnected';
//      frmMain.ConnectionStatus.Font.Color := clRed;
//    end;
//  end else begin
//    Print(_hid._error)
//  end;

   // If the China kV/Dose adjustment version, then remove all other sheets
   ChinakVDoseAdjustmentTabSheet.TabVisible := False;  // Do not display the kV/dose adjustment sheet in normal case
   if (CHINA_KV_ADJUSTMENT = 1) then begin

     // Set China adjustment screen as active
     ChinakVDoseAdjustmentTabSheet.TabVisible := True;
     PageControl1.ActivePageIndex := 13;

     // Resize the main screen to better fit the kV/dose adjustment sheet
     frmMain.ClientHeight := 550;
//     frmMain.ClientWidth  := 767;

     // Disable the shortcuttools and Waveform screen. Move the frmMain to the middle of the screen
     self.Left := (screen.WorkAreaWidth - self.Width) div 2;
//screen.DesktopWidth;
//screen.MonitorCount;
//screen.Monitors[0].Width;
//screen.Monitors[1].Width;
     shortcuttools.Visible := false;
     frmWaveform.Visible   := false;

     // Remove the FLKE and Calibrator connection symbols
     pnlFlukeConnected.Visible    := False;
     gpibConnectionStatus.Visible := False;

     // Remove some sheets
     DetectorTestTab.TabVisible := False;
     TabSheet10.TabVisible      := False;
     T.TabVisible               := False;
     TabSheet1.Visible          := False;   // Firmware
     TabSheet1.TabVisible       := False;
     TabSheet6.Visible          := False;   // Log
     TabSheet6.TabVisible       := False;
     TabSheet8.Visible          := False;   // MAS calibration
     TabSheet8.TabVisible       := False;
     TabSheet11.Visible         := False;   // EM calibration
     TabSheet11.TabVisible      := False;
     TabSheet9.Visible          := False;   // Dose calibration
     TabSheet9.TabVisible       := False;
     TabSheet10.Visible         := False;   // Simulated measurement
     TabSheet10.TabVisible      := False;
     TabSheet5.Visible          := False;   // Calibration
     TabSheet5.TabVisible       := False;
     frmMain.BringToFront();

   end
  // If The Em Calibrator not found, activate the shurtcuttools and frmWaveform screens
  else if (_EmCalibratorFound = false) then begin
    shortcuttools.Left    := self.Left + self.Width;
    shortcuttools.top     := self.Top + 30;
    frmWaveform.Left      := self.Left + self.Width;
    frmWaveform.top       := shortcuttools.Top + shortcuttools.Height - 200;
    frmWaveform.Visible   := true;
    shortcuttools.Visible := true;
  end;
end;

// Put a received string into the input ring buffer
procedure TfrmMain.PutRecStringInRingbuf(inputString : String);
begin
  // Check if valid Cobia string
  if (IsCobiaString(inputString)) then begin
    // Store the input string in a ring buffert
    _sInputStrings[_iWriteIndexInputStrings] := inputString;
    // Increase the write pointer
    Inc(_iWriteIndexInputStrings);
    if (_iWriteIndexInputStrings >= MAX_LEN_INPUT_STRING)  then
      _iWriteIndexInputStrings := 1;
  end;
end;

// Read data from Cobia
procedure TfrmMain.ReadCobiaData(Sender: TObject);
begin
  if (_CobiaComSource = USB_CDC) then begin
    ReadCobiaComPort();
  end else if (_CobiaComSource = USB_HID) then begin
    // Do nothing here, is handled by application events instead
  end;
end;

// Setup the Com bort used for communication to the Cobia
function TfrmMain.SetupCobiaComPort() : boolean;
var
  deviceName     : Array[0..80] of Char;
  DCB            : TDCB;
  config         : String;
  commTimeouts   : TCommTimeouts;
  comPortNbr     : Integer;
  comPortStr     : String;
  searchStr      : String;
  indexComPort   : Integer;
  setupCorrect   : boolean;
  finishSearch   : boolean;
  numberOfBytes  : dword;
  txString       : AnsiString;
  rxBuffer       : array[0..rxBufSize] of Ansichar;
  tmpString      : AnsiString;
  reg            : TRegistry;
  regComNameList : Tstrings;
  regComName     : AnsiString;
  regComPort     : String;
  regComIndex    : Integer;
  regStatus      : boolean;
begin

  setupCorrect      := false;
  Result            := false;
  finishSearch      := false;
  _CobiaComFileHndl := INVALID_HANDLE_VALUE;
  txString          := '[CobiaC-0000XXXX-SystemInfo]'; //'[CobiaC-0000XXXX-CobiaAdvCDC]';

  // Find all active Com ports  from the Register
  reg            := TRegistry.Create;
  regComNameList := TstringList.Create;
  reg.RootKey    := HKEY_LOCAL_MACHINE;
  regStatus      := reg.OpenKeyReadOnly('hardware\devicemap\serialcomm');
  if (regStatus) then begin
    reg.GetValueNames(regComNameList);
  end;

  // Go through all Com ports in the Register, and try to connect to the Cobia
  // Note only USB com port (not Bluetooth - to not conflict with Cobia with both communications)
  for regComIndex := 0 to regComNameList.Count - 1 do begin

    // Check if correct port already found
    if (finishSearch = false) then begin

      // Only accept Com ports via USB - to not conflict with Cobia with BT communications
      // By this also Serial0 (COM1) is not accepted - that never is used
      regComName := regComNameList.strings[regComIndex];
      if (AnsiContainsText(regComName, 'USBSER') = true) then begin

        // Found the Com port number from Data part of the Register.
        // Copy the digits number, the Data part of the Register can of some reasen sometimes
        // contain non-digit characters both before and after the the digit values
//        regComPort := reg.GetDataAsString(regComNameList.strings[regComIndex], false);
        regComPort := reg.Readstring(regComNameList.strings[regComIndex]); // Read the Data as a string, like reg.GetDataAsString
        regComPort := ExtractNumberInString(regComPort);
        comPortNbr := StrToInt(regComPort);

        // Build the COM port string to open
        if (comPortNbr < 10) then begin
          comPortStr := 'COM' + IntToStr(comPortNbr);
        end else begin
          comPortStr := '\\.\COM' + IntToStr(comPortNbr);
        end;
        StrPCopy(deviceName, comPortStr);

        // Open communication to the Cobia instrument
        _CobiaComFileHndl := CreateFile(deviceName,
                                        GENERIC_READ or GENERIC_WRITE,
                                        0, Nil,
                                        OPEN_EXISTING,
                                        FILE_ATTRIBUTE_NORMAL, 0);

        if (_CobiaComFileHndl <> INVALID_HANDLE_VALUE) then begin
          if (SetupComm(_CobiaComFileHndl, rxBufSize, txBufSize)) then begin
            if GetCommState(_CobiaComFileHndl, DCB) then begin
              // Confure the RS232 port
              config := 'baud=9600 parity=n data=8 stop=1' + #0;
              if BuildCommDCB(@config[1], DCB) then begin
                if SetCommState(_CobiaComFileHndl, DCB) then begin
                  with commTimeouts do
                  begin
                    ReadIntervalTimeout         := 0;
                    ReadTotalTimeoutMultiplier  := 0;
                    ReadTotalTimeoutConstant    := 1;
                    WriteTotalTimeoutMultiplier := 300;
                    WriteTotalTimeoutConstant   := 300;
                  end;
                  if SetCommTimeouts(_CobiaComFileHndl, commTimeouts) then begin
                    // Setup is done correctly. Try the communication and see if a Cobia is connected
                    if (WriteFile(_CobiaComFileHndl,
                                  txString[1],
                                  Length(txString),
                                  numberOfBytes, nil) = true) then  begin
                      // Wait a while and wait for the response
                      Sleep(1000);
                      if (ReadFile(_CobiaComFileHndl, rxBuffer, sizeof(rxBuffer),
                                   numberOfBytes, nil) = true) then begin
                        if (numberOfBytes > 1) then begin
                          tmpString := rxBuffer;
                          if AnsiContainsStr(tmpString, '<CobiaR CobiaC="SystemInfo"') then begin
                            // The Com port for the Cobia is found!
                            Print('COM port for Cobia: Setup correctly');
                            Print('COM port for Cobia: Com port : ' + Format('%d', [comPortNbr]));
                            setupCorrect      := true;
                            Result            := true;
                            finishSearch      := true;
                            _CobiaLastComTime := gettickcount;  // Get the time of the last Com usage
                          end;
                        end;
                      end;
                    end;
                  end else
                    Print('COM port for Cobia: Not setup correctly');;
                end else
                  Print('COM port for Cobia: Cannot set DCB');
              end else
                Print('COM port for Cobia: Cannot build DCB');
            end else
              Print('COM port for Cobia: Cannot read DCB');
          end else
            Print('COM port for Cobia: Cannot set buf sizes');
        end;
      end;
    end;
  end;

  // Close port again if not setup correctly
  if (setupCorrect = false) then begin
    if (_CobiaComFileHndl <> INVALID_HANDLE_VALUE) then begin
      CloseCobiaComPort();
    end;
  end;

  // Free registry memory
  regComNameList.Free;
  reg.CloseKey;
  reg.Free;
end;

// Close the Com bort used for communication to the Cobia
procedure TfrmMain.CloseCobiaComPort();
begin
  if (_CobiaComFileHndl <> INVALID_HANDLE_VALUE) then begin
    SendCommand('[CobiaC-0000XXXX-CobiaUser]');
    Sleep(1000);
    CloseHandle(_CobiaComFileHndl);
  end;
  _CobiaComFileHndl := INVALID_HANDLE_VALUE;
  _CobiaComSource   := NONE;
  _CobiaLastComTime := gettickcount;  // Get the time of the last Com usage
  Print('COM port for Cobia: COM port is closed');
end;

// Read the Com port used for communication to the Cobia
procedure TfrmMain.ReadCobiaComPort();
var
 inputString       : string;
 numberOfBytesRead : dword;
 buffer            : array[0..rxBufSize] of Ansichar;
 i                 : Integer;
begin
  if (_CobiaComSource = USB_CDC) then begin
    if (_CobiaComFileHndl <> INVALID_HANDLE_VALUE) then begin
      if (ReadFile(_CobiaComFileHndl, buffer, sizeof(buffer),
                    numberOfBytesRead, nil) = true) then begin
        if (numberOfBytesRead > 1) then begin
          inputString       := _CobiaTmpInputString;
          _CobiaLastComTime := gettickcount;  // Get the time of the last Com usage
          for i := 0 to (NumberOfBytesRead - 1) do begin
            // Do not copy CR and LF
            if (buffer[i] <> #$D) and (buffer[i] <> #$A)  then begin
              inputString := inputString + buffer[i];
            // Check CR or LF if many lines within one string
            end else begin
              // Line finished -> put it in ring buffer
              if (Length(inputString) > 1) then
                PutRecStringInRingbuf(inputString);

              inputString := '';  // Start with a new line
            end;
          end;
          // Store the rest string (contains the beginning of next string)
          _CobiaTmpInputString := inputString;
        end;
      end;
    end;
  end;
end;

// Send a command to the Cobia via the Com port
function TfrmMain.SendCobiaCommandCom(cmd : string) : boolean;
var
  numberOfByteswritten : dword;
  txString             : AnsiString;
begin
  result := false;

  // Write the command via the Com port
  if (_CobiaComSource = USB_CDC) then begin
    if (_CobiaComFileHndl <> INVALID_HANDLE_VALUE) then begin
      txString := PChar(cmd);
      if (WriteFile(_CobiaComFileHndl,
                    txString[1],
                    Length(txString),
                    numberOfByteswritten, nil) = true) then  begin
          result            := true;
          _CobiaLastComTime := gettickcount;  // Get the time of the last Com usage
        end else begin
//          CloseCobiaComPort();  // Cannot write -> close the port - do this in the general com check function instead
        end;
      end;
  end;
end;

function TfrmMain.ExtractNumberInString( sChaine: String ): String;
var
  i               : Integer;
  firstDigitFound : Boolean;
  lastDigitFound  : Boolean;
begin
  Result := '' ;
  firstDigitFound := false;
  lastDigitFound  := false;
  for i := 1 to length( sChaine ) do
  begin
    if (sChaine[ i ] in ['0'..'9', '.', '+', '-', 'E']) and (lastDigitFound = false) then begin
      // Only include '.' and 'E' if not first digit
      if sChaine[i] in ['.', 'E'] then begin
        if firstDigitFound = true then
          Result := Result + sChaine[ i ];
      end else begin
        Result := Result + sChaine[ i ] ;
        firstDigitFound := true;
      end;
    end else if (firstDigitFound) then begin  // Has last digit been found?
      lastDigitFound := true;
    end;

  end;
end;

 // BF: 7461 - Send command to remove CRC check file - to prevent CRC error
function TfrmMain.SendCommand_EraseCalCRC() : boolean;
begin
  // BF: 7461 - Send command to remove CRC check file - to prevent CRC error
  Result := SendExternalProtocolCommand('[CobiaC-0000    -EraseCalCRC]');
end;

// Return the filename if the file for RTIIS export
function TfrmMain.GetFileNameRTIIS(): String;
var
  searchStr   : String;
  iniFilename : String;
  iniTextLn   : String;
  iniFile     : TextFile;
  pos         : Integer;
  fileNameStr : String;
begin
  Result := '';
  iniFilename := 'measConfig.ini';
  if (FileExists(iniFilename)) then begin
    AssignFile(iniFile, iniFilename);
    Reset(iniFile);
    searchStr := 'RTIIS export file:';
    while not (ContainsText(iniTextLn, searchStr)) and
          not (Eof(iniFile)) do begin
      ReadLn(iniFile, iniTextLn);
    end;
    CloseFile(iniFile);

    // Readup the filename (if exists)
    if ContainsText(iniTextLn, searchStr) then begin
      pos := AnsiPos('"', iniTextLn);
      fileNameStr := AnsiRightStr(iniTextLn, Length(iniTextLn) - pos);
      Result := AnsiReplaceStr(fileNameStr, '"', '');  // Remove all " char
    end;
  end;
end;

procedure TfrmMain.AddCommandFiles();
procedure ListFileDir(Path: string; FileList: TStrings);
var
  SR: TSearchRec;
begin
  if FindFirst(Path + '*.*', faAnyFile, SR) = 0 then
  begin
    repeat
      if (SR.Attr <> faDirectory) then
      begin
        FileList.Add(SR.Name);
      end;
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;
end;
var
  sLst: TStringList;
  SubItem: TMenuItem;
  i, iFiles: Integer;
begin
  if DirectoryExists(ExtractFilePath(Application.Exename)+'Commands') then
  begin
    sLst := TStringList.Create();
    ListFileDir(ExtractFilePath(Application.Exename)+'Commands\', sLst);

    for iFiles := 0 to sLst.Count-1 do
    begin
      SubItem := nil;

      if SubItem = nil then
      begin
        SubItem := TMenuItem.Create(mnuCommands);
        SubItem.Caption := sLst.Strings[iFiles];
        Subitem.Name := 'mnuOption'+IntToStr(iFiles);
        SubItem.OnClick := CommandItemClick;
        //assign it a custom integer value..
        SubItem.Tag := iFiles;
        mnuCommands.Add(SubItem);
      end;
    end;
    //ShowMessage(sLst.text);
    sLst.Free();
  end;
end;

Procedure TfrmMain.CommandItemClick (Sender : TObject);
Var
  menuItem : TMenuItem;
  sFile: TStringList;
Begin
  menuItem := TMenuItem(sender);
  if FileExists(ExtractFilePath(Application.Exename)+'Commands\'+menuItem.Caption) then
  begin
    sFile := TStringList.Create();
    sFile.LoadFromFile(ExtractFilePath(Application.Exename)+'Commands\'+menuItem.Caption);
    memo1.Text:=sFile.Text;
    sFile.Free();
    lblSend_N.Caption:=menuItem.Caption;
  end;
End;

procedure TfrmMain.DefaultExcelCompValues();
begin
  MyApp:=nil;
  SetBitmapToImage(imgExcel, 0);
  SetBitmapToImage(imgExcelfw, 0);
  chkCloseApp.Checked := false;
  chkCloseApp.Enabled := false;
  btnSave.Enabled := false;
end;

procedure TfrmMain.SetBitmapToImage(var img_out: TImage; iIndex_in: Integer);
var
  Bitmap: TBitmap;
begin
  Bitmap := TBitmap.Create;
  self.imglstExcel.GetBitmap(iIndex_in, Bitmap);
  img_out.Picture.Bitmap.Assign(Bitmap);
  Bitmap.Free;
end;

procedure TfrmMain.chkCloseAppClick(Sender: TObject);
begin
  if MyApp <> nil then
    MyApp.CloseAppWhenDestroy := chkCloseApp.Checked;
end;

procedure TfrmMain.chkDoseClick(Sender: TObject);
begin
  HandleDisplayCheck(pnlDose, chkDose);
end;

procedure TfrmMain.chkOOClick(Sender: TObject);
begin
  if chkOO.Checked then
    SetBitmapToImage(imgExcel, 1)
  else
    SetBitmapToImage(imgExcel, 0);
end;

procedure TfrmMain.chkS1Click(Sender: TObject);
begin
  HandleDisplayCheck(pnlS1, chkS1);
end;

procedure TfrmMain.chkS1CuClick(Sender: TObject);
begin
  HandleDisplayCheck(pnlS1Cu, chkS1Cu);
end;

procedure TfrmMain.chkS2Click(Sender: TObject);
begin
  HandleDisplayCheck(pnlS2, chkS2);
end;

procedure TfrmMain.chkS2CuClick(Sender: TObject);
begin
  HandleDisplayCheck(pnlS2Cu, chkS2Cu);
end;

procedure TfrmMain.chkS3Click(Sender: TObject);
begin
  HandleDisplayCheck(pnlS3, chkS3);
end;

procedure TfrmMain.chkS3CuClick(Sender: TObject);
begin
  HandleDisplayCheck(pnlS3Cu, chkS3Cu);
end;

procedure TfrmMain.chkS4Click(Sender: TObject);
begin
  HandleDisplayCheck(pnlS4, chkS4);
end;

procedure TfrmMain.chkS4CuClick(Sender: TObject);
begin
  HandleDisplayCheck(pnlS4Cu, chkS4Cu);
end;

procedure TfrmMain.chkTFcalcClick(Sender: TObject);
begin
  HandleDisplayCheck(pnlTFcalc, chkTFcalc);
end;

procedure TfrmMain.chkTFratioClick(Sender: TObject);
begin
  HandleDisplayCheck(pnlTFratio, chkTFratio);
end;

procedure TfrmMain.chkTimeClick(Sender: TObject);
begin
  HandleDisplayCheck(pnlHvl, chkHvl);
end;

procedure TfrmMain.cmbBqSelect(Sender: TObject);
begin
  pPolys.SetBq(cmbBq.ItemIndex);
end;

procedure TfrmMain.Print(txt: string);
begin
  edtCommLog.Lines.Add(txt);
end;

//Checks if the incoming string is a valid 'Cobia'string. I.e. not including any 'Baracuda-header'.
function TfrmMain.IsCobiaString(inString : string) : Boolean;
var
  cobiaString : bool;
  i           : Integer;
begin
  cobiaString := true;
  i := 1;
  while (i < (Length(inString) - 1)) do begin
    if not (inString[i] in ['A'..'Z',
                            'a'..'z',
                            '0'..'9',
                            ';', ':', ',', '.', ' ',
                            '-', '+', '*', '/', '%', '>', '<', '=',
                            '�', '�', '�', '�', '�', '�',
                            '?', '!', '_', '[', ']', '(', ')', '{', '}',
                            '"', '&', '\', '#', '@', #9, #13, #0    // 9=TAB, 13=CR, 0=NULL
                            ]) then
      cobiaString := false;
     Inc(i);
  end;

  Result := cobiaString;
end;


procedure TfrmMain.ApplicationEventsMessage(
    var Msg: tagMSG;
    var Handled: Boolean);
var
    instring: string;
begin
  // Handle input from USB_HID (from Cobia)
  if (Msg.message = WM_INPUT) then begin
    if (_CobiaComSource = USB_HID) then begin
      // Take care of input strings from USB port
      if _hid.Callback_WM_INPUT(Msg.lParam, instring) then begin
        // A message via USB_HID is received
        Self.ApplicationEvents.CancelDispatch();   // Prevents other TApplicationEvents object to receive this event
        // Line finished -> put it in ring buffer
        PutRecStringInRingbuf(instring);
    end else
      Print(_hid._error)
    end;
  end;
end;

procedure TfrmMain.OnTimerEventMessage200ms(Sender: TObject);
begin

   IntepretInputStringsCobia();
end;

// Read and intepret new incoming messages from Cobia
procedure TfrmMain.IntepretInputStringsCobia();
var
  inpString      : string;
  newCommastring : string;
begin
  // Check if any new messages
  while (_iReadIndexInputStrings <> _iWriteIndexInputStrings) do begin
     // Take care of the new string

     // Read the input string and increase the index
    inpString := _sInputStrings[_iReadIndexInputStrings];
        // Increase the read pointer
    Inc(_iReadIndexInputStrings);
    if (_iReadIndexInputStrings >= MAX_LEN_INPUT_STRING) then
      _iReadIndexInputStrings := 1;

    // Convert '.' to ','
    newCommastring := AnsiReplaceStr(inpString, '.', ',');

    // Printout the ','-use string in log-window
    Print('< ' + newCommastring);

    // Parse the input string (the original - with '.')
    ParseInput(inpString);
  end;
end;

function TfrmMain.SendAdvancedModeMessage() :  boolean;
var
  txString           : AnsiString;
  rxBuffer           : array[0..rxBufSize] of Ansichar;
  snString           : AnsiString;
  systVerString      : AnsiString;
  protVerString      : AnsiString;
  protVersion        : Extended;
  numberOfBytes      : dword;
  xmlFlagPosStart    : Integer;
  xmlFlagPosEnd      : Integer;
  encryptSN          : AnsiString;
//  transmCommand    : array[1..txBufSize] of Byte;
  byBuffer           : array[1..txBufSize] of Byte;
  snByte             : Byte;
//  count            : Integer;
  i                  : Integer;
  crc16Val           : Word;
  crc16SysVerString  : AnsiString;
  crc16SNString      : AnsiString;
  crc16CommandString : AnsiString;
  rxBufString        : AnsiString;
begin
  result := false;

  // Read serialnumber and system version of the Cobia
  txString := '[CobiaC-0000XXXX-SystemInfo]';
  if (WriteFile(_CobiaComFileHndl,
                txString[1],
                Length(txString),
                numberOfBytes, nil) = true) then  begin
    // Wait a while and wait for the response
    Sleep(1000);
    if (ReadFile(_CobiaComFileHndl, rxBuffer, sizeof(rxBuffer),
                 numberOfBytes, nil) = true) then begin
      if (numberOfBytes > 10) then begin
        rxBufString := AnsiLeftStr(rxBuffer, numberOfBytes-2);  // Read all new bytes. Remove CR+LF

        // Read Protocol version
        xmlFlagPosStart := AnsiPos('<ProtocolVersion>', rxBufString);
        xmlFlagPosEnd   := AnsiPos('</ProtocolVersion>', rxBufString);
        protVersion := 0;
        if (xmlFlagPosStart > 0) and (xmlFlagPosStart < xmlFlagPosEnd) and
           (xmlFlagPosEnd > 0) then begin
          protVerString := AnsiLeftStr(rxBufString, xmlFlagPosEnd - 1);
          protVerString := AnsiRightStr(protVerString, Length(protVerString) - (xmlFlagPosStart+Length('<ProtocolVersion>') - 1));
          protVersion   := SafeFloatConvert(protVerString);
        end;

        // If old protocol version -> send old Advanced mode command
        if (protVersion < 1.1) then begin
          // Old version of external protocol -> send old advanced mode command
          if (SendCommand('[CobiaC-0000XXXX-CobiaAdvCDC]') = true) then
            result := true;
        end else begin
          // New version of external protocol -> send new Advanced mode command

          // Read serial number
          xmlFlagPosStart := AnsiPos('<SN>', rxBufString);
          xmlFlagPosEnd   := AnsiPos('</SN>', rxBufString);
          if (xmlFlagPosStart > 0) and (xmlFlagPosStart < xmlFlagPosEnd) and
             (xmlFlagPosEnd > 0) then begin
            snString := AnsiLeftStr(rxBufString, xmlFlagPosEnd - 1);
            snString := AnsiRightStr(snString, Length(snString) - (xmlFlagPosStart+Length('<SN>') - 1));

            // Read system version
            xmlFlagPosStart := AnsiPos('<SystemVersion>', rxBufString);
            xmlFlagPosEnd   := AnsiPos('</SystemVersion>', rxBufString);
            if (xmlFlagPosStart > 0) and (xmlFlagPosStart < xmlFlagPosEnd) and
               (xmlFlagPosEnd > 0) then begin
              systVerString := AnsiLeftStr(rxBufString, xmlFlagPosEnd - 1);
              systVerString := AnsiRightStr(systVerString, Length(systVerString) - (xmlFlagPosStart+Length('<SystemVersion>') - 1));

              // Calculate CRC16 of S/N (not encrypted
              for i:=1 to Length(snString) do
                byBuffer[i] := ord(snString[i]);
              crc16Val := CalcCRC16(@byBuffer[1], Length(snString), 0);
              crc16SNString := IntToHex(crc16Val, 4);

              // Calculate CRC16 of system version
              for i:=1 to Length(systVerString) do
                byBuffer[i] := ord(systVerString[i]);
              crc16Val := CalcCRC16(@byBuffer[1], Length(systVerString), 0);
              crc16SysVerString := IntToHex(crc16Val, 4);

              // Xor the S/N with ENCRYPT_KEY_ADVANCED
              encryptSN := '';
              for i:=1 to Length(snString) do begin
                snByte := ord(snString[i]);
                snByte := snByte Xor ENCRYPT_KEY_ADVANCED;
                encryptSN := encryptSN + IntToHex(snByte, 2);
              end;

              // Build the Advanced command, calc CRC
              txString := '[CobiaC-0000    -CobiaAdv;' +
                           crc16SNString +
                           encryptSN +
                           crc16SysVerString +
                           ']';
              for i:=1 to Length(txString) do
                byBuffer[i] := ord(txString[i]);
              crc16Val := CalcCRC16(@byBuffer[1], Length(txString), 0);
              crc16CommandString := IntToHex(crc16Val, 4);
              txString := AnsiReplaceStr(txString, '    ', crc16CommandString); // Replace '    ' with the CRC

              // Read input to empty the file
              ReadFile(_CobiaComFileHndl, rxBuffer, sizeof(rxBuffer), numberOfBytes, nil);

               // Send command
              if (SendCommand(txString) = true) then begin
                // Wait a while and wait for the response
                Sleep(1000);
                // Check if ok response
                if (ReadFile(_CobiaComFileHndl, rxBuffer, sizeof(rxBuffer),
                  numberOfBytes, nil) = true) then begin
                  if (numberOfBytes > 10) then begin
                    rxBufString := AnsiLeftStr(rxBuffer, numberOfBytes-2);  // Remove CR+LF
                    Print('< ' + rxBufString);
                    if (AnsiContainsStr(rxBufString, 'CobiaAdv') = true) and
                       (AnsiContainsStr(rxBufString, '>OK</CobiaR>') = true) then begin
                      result := true;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.OnTimerEventMessage1s(Sender: TObject);
var
  comJustStarted : Boolean;
  comJustStoped  : Boolean;
  okConnected    : Boolean;
begin

  comJustStarted := false;
  comJustStoped  := false;
  okConnected    := false;

  // Try to setup communication to the Cobia, if the communication is down
  // Check also that the setup of Fluke communication is done, can otherwise disturb each other
  if (_CobiaComSource = NONE) and (_FlukeComSetupFinished = true) then begin
    if (SetupCobiaComPort()) then begin
      comJustStarted  := true;
      _CobiaComSource := USB_CDC;    // Set USB_CDC as active
    end
    else if _hid.SearchForDevice() then begin
      comJustStarted  := true;
      _CobiaComSource := USB_HID;    // Set USB_HID as active
    end;
  end;

  // Check the connection to the Cobia (when it is time for check)
  if ((gettickCount - _CobiaLastComTime) > 5000) then begin  // Kolla var 5 s mellan ordinarie kommunikation
    _CobiaLastComTime := gettickcount;  // Get the time of the last Com usage
    if (_CobiaComSource = USB_CDC) then begin
      // Try te send 1 char - get false back if not ok
 //     if (SendCommand('[CobiaC-0000XXXX-Alive]') = false) then begin
      if (SendCommand(' ') = false) then begin
        CloseCobiaComPort();
        _CobiaComSource := NONE;
        comJustStoped   := true;
      end;
    end
    else
    if (_CobiaComSource = USB_HID) then begin
      if (_hid.CheckIfConnected() = FALSE) then begin
        _CobiaComSource := NONE;
        comJustStoped   := true;
      end;
    end;
  end;

   // Do if communication just started
   if (comJustStarted = true) then begin
     // Wait a while before start of communication, so the Cobia is ready
     Sleep(1000);
     // Acivate advanced communication mode
     if (_CobiaComSource = USB_CDC) then begin
       if (SendAdvancedModeMessage() = true) then
         okConnected := true;
     end else if (_CobiaComSource = USB_HID) then begin
       SendCommand('[CobiaC-0000XXXX-CobiaAdvHID]');
       okConnected := true;
     end;

     if (okConnected = true) then begin
       // Ok answer from Cobia -> ok connected -> startup
       Print('Cobia attached');
       StoreLogToFile(true);  // Setup a file to store the log
       frmMain.ConnectionStatus.Caption := 'Cobia: Connected';
       frmMain.ConnectionStatus.Font.Color := clGreen;

       SendCommand('debug_printout;1'); // Activate debug printout. Need to send command if checkbox below already checked
       Sleep(500);

       btnReadValuesClick(Sender);
       Sleep(50);
       shortcuttools.cbDebugPrintout.Checked := True; // Activate debug printout
       _EmOffsetMeasured := False;   // Set offset measured done as false
       _EmAdjust    := 0;        // Reset calibration
       _EmCalibr    := 0;        // Reset check
       _EmChargeAct := false;
       ClearEmOffsetView();  // Clear the Electrometer calibration view
       ClearEmAdjustmentView();
       ClearEmCalibrationView();
       _MasOffsetMeasured := False;
       _MasAdjust := 0;
       _MasCalib  := 0;
       ClearMasOffsetView();
       ClearMasAdjustmentView();
       ClearMASCalibrationView();
       shortcuttools.cbAutoRange.Checked      := True;
       shortcuttools.cmbSensitivity.ItemIndex := 0;

       SendCommand('m_reset');  // Send a reset command. Sometimes the offset reset is bad after connection to the test sw.
     end else begin
       // No correct answer from Cobia -> not connected -> close communication
       Print('Cobia not answer correct');
       CloseCobiaComPort();
       _CobiaComSource := NONE;
     end;

     // Move this to FW-version reading (SendTrigCommand needs FW version)
(*
     if (_EmCalibratorFound = true) then begin
       // If em-calibration active -> disable trig, i.e. set manual trig and make a reset to stop any ongoing trig
       Sleep(1500);
       SendTrigCommand(TRIG_MANUAL, 0);
       SendCommand('m_reset');
     end;
*)
   end;

   // Do if communication just stoped
   if (comJustStoped = true) then begin
     frmMain.ConnectionStatus.Caption := 'Cobia: Disconnected';
     frmMain.ConnectionStatus.Font.Color := clRed;
     _EmOffsetMeasured  := False;   // Set offset measured done as false
     _MasOffsetMeasured := false;
     edtEmSerialNumber.Text  := '';
     edtEmVersion.Text       := '';
     edtMasSerialNumber.Text := '';
     edtMasVersion.Text      := '';
   end;
end;

procedure TfrmMain.btnSaveCalMetaDataClick(Sender: TObject);
var
    cmd: String;
begin
  cmd := 'nvmem;set;caldate;' +
          edtCalDateYear.Text + ';' +
          edtCalDateMonth.Text + ';' +
          edtCalDateDay.Text;
  SendCommand(cmd);

  cmd := 'nvmem;set;callab;' + edtCalLab.Text;
  SendCommand(cmd);

  // Send command to remove CRC check file - to prevent CRC error
  SendCommand_EraseCalCRC();
end;

procedure TfrmMain.btnSaveClick(Sender: TObject);
begin
  if MyApp = nil then Exit;
  if not MyApp.CheckIfAccessable() then
  begin
    MessageDlg(format('"%s" is not accessable.', [Label2.Caption]), mtError, [mbOK], 0);
    Exit;
  end;

  if chkOO.Checked then
    SaveDialog1.Filter := 'Open Office calc files (*.sxc)|*.SXC|Any files (*.*)|*.*'
  else
    SaveDialog1.Filter := 'Microsoft Excel files (*.xls)|*.XLS|Any files (*.*)|*.*';

  SaveDialog1.FilterIndex := 1;
  if SaveDialog1.Execute() then
    MyApp.SaveFile(SaveDialog1.FileName);
end;

procedure TfrmMain.ClearExcelClick(Sender: TObject);
var
  normFactor       : Extended;
  normFactorString : String;
  commaPos         : Integer;

begin
  // Convert to *10^3 Gy/C
  normFactor := SafeFloatConvert(edtDoseNormFactor.Text);
  normFactor := normFactor * 1000;
  normFactorString := FloatToStr(normFactor);

  // Convert ',' to '.'
  commaPos := AnsiPos(',', normFactorString);
  if (commaPos > 0) then
    normFactorString[commaPos] := '.';

  SendCommand(('nvmem;set;calib;8;' + normFactorString));
  Sleep(100);

  // Send command to remove CRC check file - to prevent CRC error
  SendCommand_EraseCalCRC();
end;

procedure TfrmMain.btnSavePolynomCoeffsClick(Sender: TObject);
var
  I, commaPos : Integer;
  str         : string;
begin
  for I := 0 to 7 do begin
    str := memNormationCoeffs.Lines[I];
    // Convert ',' to '.'
    commaPos := AnsiPos(',', str);
    if (commaPos > 0) then
      str[commaPos] := '.';

    SendCommand(('nvmem;set;calib;' + IntToStr(I) + ';' + str));
    Sleep(100);
  end;

  // Send command to remove CRC check file - to prevent CRC error
  SendCommand_EraseCalCRC();
end;

procedure TfrmMain.btnSaveSerialClick(Sender: TObject);
var
  I              : Integer;
  cmd            : String;
  modelIndex     : Integer;
  modelStr       : String;
  oceanPermIndex : Integer;
  permVal        : Integer;
  fwVersion      : Extended;
begin

  // Send model type
  modelIndex :=  cBxSelectModelType.ItemIndex;
  if Not (modelIndex = -1) then begin
    modelStr := cBxSelectModelType.Items.Strings[modelIndex];
    // Send the 4 first characters (model number) to the Cobia
    cmd := 'nvmem;set;prodmodel;';
    for I := 1 to 4 do
      cmd := cmd + modelStr[I];

    SendCommand(cmd);
    Sleep(100);
  end;

  cmd := 'nvmem;set;serial;' + edtSerialNum.Text;
  SendCommand(cmd);
  Sleep(100);
  cmd := 'nvmem;set;prodversion;' + edtVersion.Text;
  SendCommand(cmd);
  Sleep(100);
//  cmd := 'nvmem;set;prodmodel;' + edtModelNo.Text; // Already sent
//  SendCommand(cmd);
//  Sleep(100);

  cmd := 'nvmem;set;prodpermissions;';
  fwVersion := SafeFloatConvert(AnsiLeftStr(edtFirmwareVersion.Text, 3));
  if (fwVersion >= 5.2) then begin
    // FW > 5.1
    // Sent as nvmem;prodpermissions;PTB;CustomerSystem;OceanLicens;EndDateForOceanLicens_Year;EndDateForOceanLicens_Month;
    //   where
    //      PTB            : 1 if PTB, 0 otherwise
    //      CustomerSystem : 1 if Customer system, 0 if Demo system
    //      OceanLicens    : 11b Oregistrerad      (Enligt spec fr�n Baracuda/Pirahna)
    //                       10b Display
    //                       01b Connect
    //                       00b Professional
    //      EndDateForOceanLicens_Year : Year when ocean licens stops. Format: YYYY (ex 2014)
    //      EndDateForOceanLicens_Month: Month when ocean licens stops. Format: MM (ex 01 for January)
    if (cbxPerms_PTBSystem.Checked) then begin
      cmd := cmd + '1;';
    end else begin
      cmd := cmd + '0;';
    end;
    if (cbxPerms_CustomerSystem.Checked) then begin
      cmd := cmd + '1;';
    end else begin
      cmd := cmd + '0;';
    end;
    oceanPermIndex := cbxPerm_Ocean.ItemIndex;
    if (oceanPermIndex = 1) then begin
      cmd := cmd + '2;';   // Display (QuickCheck)
    end else if (oceanPermIndex = 2) then begin
      cmd := cmd + '1;';   // Connect
    end else if (oceanPermIndex = 3) then begin
      cmd := cmd + '0;';   // Profesional
    end else begin        // No Ocean or error -> send No Ocean support
      cmd := cmd + '3;';   // No Ocean.
    end;
      cmd := cmd + '2043;01';    // Note send always license date to max (as Ocean does): 2043-01
  end else begin
    // FW < 5.2
    permVal := 0;
    if (cbxPerms_PTBSystem.Checked) then
        permVal := permVal or $80;
    if (cbxPerms_CustomerSystem.Checked) then
        permVal := permVal or $01;
    // Set no Ocean support!
    permVal := permVal or $60;
    cmd := cmd + IntToStr(permVal);
  end;
  SendCommand(cmd);
  Sleep(100);

  // Send command to remove CRC check file - to prevent CRC error
  SendCommand_EraseCalCRC();
end;

procedure TfrmMain.btnSaveWfClick(Sender: TObject);
begin
  FileNameWf.ReadOnly := True;
  btnSaveWf.Enabled := False;
  btnSimWf.Enabled := False;
  SendCommand('wf_copy;' + FileNameWf.Text);
  Timer1.Enabled := True;
  Screen.Cursor := crHourglass;
end;

procedure TfrmMain.btnSendCommandClick(Sender: TObject);
begin
  SendCommand(edtCommand.Text);
end;

procedure TfrmMain.btnSend_n_OkClick(Sender: TObject);
begin
  pnlSend_N.Visible:=false;
end;

procedure TfrmMain.btnSetAuto(Sender: TObject);
begin
  sendCommand('ms_range_ext;auto;0');  // Set to Auto sensitivity
end;

procedure TfrmMain.btnSetValueClick(Sender: TObject);
var
  iRow, iCol: Integer;
begin
  if MyApp = nil then Exit;

  if not MyApp.CheckIfAccessable() then
  begin
    MessageDlg(format('"%s" is not accessable.', [Label2.Caption]), mtError, [mbOK], 0);
    Exit;
  end;

  if chkUseActiveCell.Checked then
  begin

    if optCellValue.Checked then
      MyApp.SetCellValue(SafeFloatConvert(edtCellValue.Text))
    else
      MyApp.SetCellValue(edtCellValue.Text);
  end
  else
  begin
    iRow := StrToInt(edtRow.Text);
    iCol := StrToInt(edtCol.Text);
    if chkActiveSheet.Checked then
    begin
      if optCellValue.Checked then
        MyApp.SetCellValue(iRow,iCol, SafeFloatConvert(edtCellValue.Text))
      else
        MyApp.SetCellValue(iRow,iCol, edtCellValue.Text);
    end
    else
    begin
      if optCellValue.Checked then
        MyApp.SetCellValue(edtSheetName.Text, iRow, iCol, SafeFloatConvert(edtCellValue.Text))
      else
        MyApp.SetCellValue(edtSheetName.Text, iRow, iCol, edtCellValue.Text);
    end;
  end;
end;

procedure TfrmMain.btnSimValClick(Sender: TObject);
begin
  SendCommand('debug_s1s4_val;' + S1SimValEdit.Text + ';' +
    S2SimValEdit.Text + ';' + S3SimValEdit.Text +';' + S4SimValEdit.Text);
end;

procedure TfrmMain.btnSimWfClick(Sender: TObject);
begin
  FileNameWf.ReadOnly := True;
  btnSimWf.Enabled := False;
  btnSaveWf.Enabled := False;
  SendCommand('debug_sim_ddc_val;' + lBoxWfFiles.Items.Strings[lBoxWfFiles.ItemIndex]);
  Timer1.Enabled := True;
  Screen.Cursor := crHourglass;
end;

function GetTempDirectory: String;
var
  tempFolder: array[0..MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @tempFolder);
  result := StrPas(tempFolder);
end;

procedure TfrmMain.btnTestClick(Sender: TObject);
var
  sString: TStringList;
  sFile: string;
  dKv, dTf: Extended;
begin
  sString := TStringList.Create();
  dKv:=KV_TfCalc(SafeFloatConvert(edtKvHidden.Text), SafeFloatConvert(edtTfHidden.Text), dTf);
  sString.Text := pPolys.GetLastLog();
  sFile:=GetTempDirectory() + '\LastLog.txt';
  sString.SaveToFile(sFile);
  sString.Free();
  ShellExecute(Handle,'open', 'c:\windows\notepad.exe',PWideChar(sFile), nil, SW_SHOWNORMAL)
end;

procedure TfrmMain.Button10Click(Sender: TObject);
begin
  // Export To RTIIS
end;

procedure TfrmMain.Button1Click(Sender: TObject);
var
  dkV, dTf: Extended;
  sString: TStringList;
  sKv, sTf: string;
begin
  sString := TStringList.Create();

  optLowKVRange.Checked:=true;
  //Low

  dKv:=KV_TfCalc(1.040548, 1.61116, dTf); //85.4; 3
  sString.Text := pPolys.GetLastLog();
  sString.SaveToFile('C:\Source\mikroXTestprogram\LastLog.txt');
  sString.Text := '';

  sString.Add('Low kV range');
  sKv:=Format('%3.2f', [dKv]); sTf:=Format('%3.2f', [dTf]);
  sString.Add('kV='+sKv+' (85.4)' + #9 + 'TF='+sTf+' (3)');

  MessageDlg('HVL 85 kV 3 mm Al' + #13+#10 + Format('%3.5f', [Hvl_Calc(dTf, dKv)]), mtInformation, [mbOK], 0);

  dKv:=KV_TfCalc(1.104639, 3.293257, dTf); //69.3; 23mm
  sKv:=Format('%3.2f', [dKv]); sTf:=Format('%3.2f', [dTf]);
  sString.Add('kV='+sKv+' (69.3)' + #9 + 'TF='+sTf+' (23)');


  optHighKVRange.Checked:=true;
  sString.Add('');
  sString.Add('High kV range');
  //High
  {dKv:=KV_TfCalc(0.464142, 2.365197, dTf);
  MessageBox(0, PWideChar('kV='+Format('%3.2f', [dKv])+#13+#10+'TF='+Format('%3.2f', [dTf])), PWideChar('kV calc'), MB_ICONINFORMATION or MB_OK);

  dKv:=KV_TfCalc(0.514769, 2.25272, dTf);
  MessageBox(0, PWideChar('kV='+Format('%3.2f', [dKv])+#13+#10+'TF='+Format('%3.2f', [dTf])), PWideChar('kV calc'), MB_ICONINFORMATION or MB_OK);

  dKv:=KV_TfCalc(0.460218, 1.325329, dTf);
  MessageBox(0, PWideChar('kV='+Format('%3.2f', [dKv])+#13+#10+'TF='+Format('%3.2f', [dTf])), PWideChar('kV calc'), MB_ICONINFORMATION or MB_OK);
  }
  dKv:=KV_TfCalc(0.48889, 2.54938, dTf); //120; 12
  sKv:=Format('%3.2f', [dKv]); sTf:=Format('%3.2f', [dTf]);
  sString.Add('kV='+sKv+' (120)' + #9 + 'TF='+sTf+' (12)');

  MessageBox(0, PWideChar(sString.Text), PWideChar('Test'), MB_ICONINFORMATION or MB_OK);
  sString.Free();
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
 Clipboard.AsText := edtElectrometerVal.Text;
end;

procedure TfrmMain.Button4Click(Sender: TObject);
begin
  edtElectrometerVal.Text := '' ;
  edtElectrometerRaw.Text := '' ;
  edtCurrent.Text := '' ;
  edtTime.Text := '' ;
  edtSamples.Text := '' ;
end;

 // Prase function of Automatic test unit.
 // Read the xml file, store node information in structure.

procedure ParseAutoTestCases(FileName: string; Encoding: TEncoding );
  XMLDoc: IXMLDocument;
  XMLNode: IXMLNode;
begin

end;

procedure TfrmMain.atOpenTCClick(Sender: TObject);
var
  Encoding : TEncoding;
  EncIndex : Integer;
  Filename : String;
begin
  if atLoadTestCase.Execute(Self.Handle) then
    begin
    //selecting the filename and encoding selected by the user
    Filename := atLoadTestCase.FileName;

    EncIndex := atLoadTestCase.EncodingIndex;
    Encoding := atLoadTestCase.Encodings.Objects[EncIndex] as TEncoding;

    //checking if the file exists
    if FileExists(Filename) then
    begin
      //display the contents in a memo based on the selected encoding
      atLogs.Lines.LoadFromFile(FileName, Encoding);
      ParseAutoTestCases(FileName,Encoding);
    end
    else
      raise Exception.Create('File does not exist.');
    end;
end;

procedure TfrmMain.atSaveTCClick(Sender: TObject);
var
  Encoding : TEncoding;
  EncIndex : Integer;
  Filename : String;
begin
  if atSaveTestCase.Execute(Self.Handle) then
    begin
    //selecting the filename and encoding selected by the user
    Filename := atSaveTestCase.FileName;

    EncIndex := atSaveTestCase.EncodingIndex;
    Encoding := atSaveTestCase.Encodings.Objects[EncIndex] as TEncoding;

    //checking if the file exists
   { if FileExists(Filename) then
      raise Exception.Create('File already exists.')
    else  }
      //save to file based on the selected encoding
      atLogs.Lines.SaveToFile(FileName, Encoding);
    end;

end;

procedure TfrmMain.atSendCmdClick(Sender: TObject);
var
  counter:integer;
  i: integer;
begin
  For i := 0 to StrToInt(atCmdCounter.Text) do
  SendCommand(atCmdTxt.Text);
end;

procedure TfrmMain.BtMASCopyCurrentClick(Sender: TObject);
begin
//  Clipboard.AsText := edtTubeCurrent.Text;
end;

procedure TfrmMain.BtMASCopyADCMeanClick(Sender: TObject);
begin
  Clipboard.AsText := edtMASAdjustCurrent75mA_1.Text;
end;

procedure TfrmMain.btMASOffsetResetStartClick(Sender: TObject);
begin
  ClearMASOffsetView();
  lblMASOffsetWorking.Visible := true;
  frmMain.Update();               // Update the form

    // Set manual trig for trig on, to no get an trig when switching the CUR box
  // Do not set trig off as manual yet, to be able to trig off if an ongoing trig
  //SendCommand('ms_trig on manual');
  //  Sleep(100);
  SendTrigCommand(TRIG_MANUAL, 0);

  // View dialog that set power off 75 mA
  MessageDlg('Set the CUR box to Power OFF.' + #13#10 +
                           'Press OK button when ready.', mtInformation, [mbOK], 0);
  MakeFwOffsetResetForMASCalibration();
end;

procedure TfrmMain.btMASAdjustmentStartClick(Sender: TObject);
var
  buttonSelected   : Integer;
begin
  // Check if offset calculation is done or failure, if not present warning dialoge
  if (_MasOffsetMeasured = False) or (lblMasOffsetFailure.Visible = true) then  begin
      buttonSelected := MessageDlg('Offset reset not done or failure! Proceed?', mtError, [mbYes, mbNo], 0);
  end else
    buttonSelected := mrYes; // If offset done, do the adjustment

  if (buttonSelected = mrYes) then begin
    ClearMASAdjustmentView();
    ClearMASCalibrationView();
    lblMASAdjustmentWorking.Visible := true;
    frmMain.Update();          // Update the form

    // Set manual trig for trig on, to no get an trig when switching the CUR box
    // Let trig off still be peak
//    SendCommand('ms_trig on manual');
//    Sleep(200);
//    SendCommand('ms_trig off peak');
//    Sleep(200);
    SendTrigCommand(TRIG_MANUAL, 0);

    // Set default calibration factor 1 for iMAS
    SendCommand('nvmem;set;calibmas;0;+1.0');
    Sleep(100);
    SendCommand('nvmem;set;calibmas;1;+1.0');
    Sleep(300);

    // Do not update the offset, needed for the MAS calibration
    SendCommand('debug_offset_update;off');
    Sleep(200);

    // View dialog that set power on 75 mA
    MessageDlg('Connect to the 400 mA input at the FLUKE instrument.' + #13#10 +
               'Set the CUR box to 75 mA.' + #13#10 +
               'Set the CUR box to Power ON.' + #13#10 +
               'Wait until the current value in the FLUKE instrument is stable.' + #13#10  +
               'Press OK button when ready.', mtInformation, [mbOK], 0);

    // Wait a while before set trig off as manual, to be able to trig off if an ongoing trig
    Sleep(2500);
//    SendCommand('ms_trig off manual');
//    Sleep(200);

    // Activate the first MAS trig measurement
    _MasAdjust := 6;   // 6 number of measurements
    _MasCalib  := -1;  // No MAS calibration
    MakeMASTrig();
  end;
end;

procedure TfrmMain.btMASCalibrationStartClick(Sender: TObject);
var
  buttonSelected   : Integer;
begin
  // Check if offset calculation is done or failure, if not present warning dialoge
  if (_MasOffsetMeasured = False) or (lblMasOffsetFailure.Visible = true) then  begin
      buttonSelected := MessageDlg('Offset reset not done or failure! Proceed?', mtError, [mbYes, mbNo], 0);
  end else
    buttonSelected := mrYes; // If offset done, do the adjustment

  if (buttonSelected = mrYes) then begin
    ClearMASCalibrationView();
    lblMASCalibrationWorking.Visible := true;
    frmMain.Update();          // Update the form

    // Set manual trig for trig on, to no get an trig when switching the CUR box
    // Let trig off still be peak
//    SendCommand('ms_trig on manual');
//    Sleep(200);
//    SendCommand('ms_trig off peak');
//    Sleep(200);
    SendTrigCommand(TRIG_MANUAL, 0);

    // Do not update the offset, needed for the MAS calibration
    SendCommand('debug_offset_update;off');
    Sleep(200);

    // View dialog that set power on 5 mA
    buttonSelected := MessageDlg('Connect to the 400 mA input at the FLUKE instrument.' + #13#10 +
                                 'Set the CUR box to 5 mA.' + #13#10 +
                                 'Set the CUR box to Power ON.' + #13#10 +
                                 'Wait until the current value in the FLUKE instrument is stable.' + #13#10  +
                                 'Press OK button when ready.', mtInformation, [mbOK], 0);

    // Wait a while before set trig off as manual, to be able to trig off if an ongoing trig
    Sleep(2500);
//    SendCommand('ms_trig off manual');
//    Sleep(200);

    // Ask for calibration factors
    SendCommand(('nvmem;get;calibmas'));
    Sleep(100);

    // Ask for offset, if not already done
    if (_MasOffsetMeasured = false) then begin
      ClearMasOffsetView();
      AskForOffset();
      Sleep(2000);
    end;

    // Activate the first MAS trig measurement
    _MasCalib  := 6;  // 6 number of measurements (5 mA mean value of 3 measurements, bug 6633)
    _MasAdjust := -1; // No MAS calibration
    MakeMASTrig();
  end;
end;

// Build the EM calibration report file to RTIIS
procedure TfrmMain.btEmCalibrationExportRTIISClick(Sender: TObject);
var
  rtiisFile   : TextFile;
  lstItem     : TListItem;
  str         : AnsiString;
  i           : Integer;
  modelIndex  : Integer;
  modelStr    : String;
  modelNbrStr : String;
  artStr      : String;
  modelNbr    : Integer;
begin

  // Build artickel number, depends on model
  artStr := 'Cobia ';
  modelIndex :=  cBxSelectModelType.ItemIndex;
  if Not (modelIndex = -1) then begin
    modelStr := cBxSelectModelType.Items.Strings[modelIndex];
    // Read model number, in the first 4 characters
    for i := 1 to 4 do
      modelNbrStr := modelNbrStr + modelStr[i];
    modelNbr := StrToInt(modelNbrStr);

    // Add correct model text
    if (modelNbr >= 2000) and (modelNbr < 3000) then
      artStr := artStr + 'Flex';
    if (modelNbr >= 3000) and (modelNbr < 4000) then
      artStr := artStr + 'Sense';
  end;

  // Build all items in the file
  lstItem:=ListFirmware.Items.Add();
  lstItem.Caption := artStr;                          // Artikelben�mning
  lstItem.SubItems.Add(edtEmSerialNumber.Text);       // SN
  lstItem.SubItems.Add('');                           // SN2
  lstItem.SubItems.Add('1');                          // Kanal
  lstItem.SubItems.Add(edtEmOffsetHigh.Text);         // Offset high
  lstItem.SubItems.Add(edtEmOffsetLow.Text);          // Offset low
  lstItem.SubItems.Add(Format('%s'+RTIIS_REP_SEP+'%s'+RTIIS_REP_SEP+'%s',           // Inm�tning f�r ber�kning kalibrering: high
                               [AnsiReplaceStr(edtEmAdjustmentHsCurrent_1.Text, '+', ''),
                                AnsiReplaceStr(edtEmAdjustmentHsCurrent_2.Text, '+', ''),
                                AnsiReplaceStr(edtEmAdjustmentHsCurrent_3.Text, '+', '')]));
  lstItem.SubItems.Add(Format('%s'+RTIIS_REP_SEP+'%s'+RTIIS_REP_SEP+'%s',           // Inm�tning f�r ber�kning kalibrering: low
                               [AnsiReplaceStr(edtEmAdjustmentLsCurrent_1.Text, '+', ''),
                                AnsiReplaceStr(edtEmAdjustmentLsCurrent_2.Text, '+', ''),
                                AnsiReplaceStr(edtEmAdjustmentLsCurrent_3.Text, '+', '')]));
  lstItem.SubItems.Add(Format('%.6f', [_normalizeFactLowSideA]));                // Normeringsfaktor sida A
  lstItem.SubItems.Add(Format('%.6f', [_normalizeFactLowSideB]));                // Normeringsfaktor sida B
  lstItem.SubItems.Add(AnsiReplaceStr(highElChargeCalValEdit.text, '+', ''));    // Kalibreringsfaktor high
  lstItem.SubItems.Add(AnsiReplaceStr(lowElChargeCalValEdit.text, '+', ''));     // Kalibreringsfaktor low
  lstItem.SubItems.Add('');                                                      // Intern kalibreringsfaktor
  lstItem.SubItems.Add('750,0'+RTIIS_REP_SEP+'7,500'+RTIIS_REP_SEP+'75,00'+
                       RTIIS_REP_SEP+'750,0'+RTIIS_REP_SEP+'7500,0'+RTIIS_REP_SEP);     // Laddnings referens
  lstItem.SubItems.Add('pC'+RTIIS_REP_SEP+'nC'+RTIIS_REP_SEP+'nC'+RTIIS_REP_SEP+
                       'nC'+RTIIS_REP_SEP+'nC'+RTIIS_REP_SEP);                          // Enhet laddning
  lstItem.SubItems.Add(Format('%.1f'+RTIIS_REP_SEP+'%.3f'+RTIIS_REP_SEP+'%.2f'+
                              RTIIS_REP_SEP+'%.1f'+RTIIS_REP_SEP+'%.0f'+ RTIIS_REP_SEP, // Laddning uppm�tt
                               [SafeFloatConvert(edtEmCalibrationChargeVal750pC.Text),
                                SafeFloatConvert(edtEmCalibrationChargeVal7nC.Text)    / 1000,
                                SafeFloatConvert(edtEmCalibrationChargeVal75nC.Text)   / 1000,
                                SafeFloatConvert(edtEmCalibrationChargeVal750nC.Text)  / 1000,
                                SafeFloatConvert(edtEmCalibrationChargeVal7500nC.Text) / 1000]));
  lstItem.SubItems.Add('750,0'+RTIIS_REP_SEP+'7,500'+RTIIS_REP_SEP+'75,00'+RTIIS_REP_SEP+
                       '750,0'+RTIIS_REP_SEP+'7500,0'+RTIIS_REP_SEP);                        // Str�m referens
  lstItem.SubItems.Add('pA'+RTIIS_REP_SEP+'nA'+RTIIS_REP_SEP+'nA'+RTIIS_REP_SEP+
                       'nA'+RTIIS_REP_SEP+'nA'+RTIIS_REP_SEP);                                // Enhet str�m
  lstItem.SubItems.Add(Format('%.1f'+RTIIS_REP_SEP+'%.3f'+RTIIS_REP_SEP+
                              '%.2f'+RTIIS_REP_SEP+'%.1f'+RTIIS_REP_SEP+'%.0f'+RTIIS_REP_SEP, // Str�m uppm�tt
                               [SafeFloatConvert(edtEmCalibrationCurrVal750pA.Text),
                                SafeFloatConvert(edtEmCalibrationCurrVal7nA.Text)    / 1000,
                                SafeFloatConvert(edtEmCalibrationCurrVal75nA.Text)   / 1000,
                                SafeFloatConvert(edtEmCalibrationCurrVal750nA.Text)  / 1000,
                                SafeFloatConvert(edtEmCalibrationCurrVal7500nA.Text) / 1000]));
  lstItem.SubItems.Add(frmMain.Caption);                                              // PC sw version
  lstItem.SubItems.Add(edtEmVersion.Text);                                            // Product version

  // The values shall have ',' as separator in RTIIS, convert all values (the two last shall shall not be changed)
  i := 0;
  while (i < (lstItem.SubItems.Count - 2)) do begin
    lstItem.SubItems.Strings[i] := ConvertPointToComma(lstItem.SubItems.Strings[i]);
    Inc(i);
  end;

  // Make the string that shall be sent to RTIIS - TAB separated
  str := lstItem.Caption + #9;
  i := 0;
  while (i < lstItem.SubItems.Count) do begin
    str := str + lstItem.SubItems.Strings[i];
    str := str + #9;  // Tab
    Inc(i);
  end;

  // Create the file and store the data there
  AssignFile(rtiisFile, _fileNameRTIIS);
  ReWrite(rtiisFile);
  WriteLn(rtiisFile, str);
  CloseFile(rtiisFile);
end;

// Build the MAS calibration report file to RTIIS
procedure TfrmMain.btMasCalibrationExportRTIISClick(Sender: TObject);
var
  rtiisFile     : TextFile;
  lstItem       : TListItem;
  str           : AnsiString;
  i             : Integer;
  modelIndex    : Integer;
  modelStr      : String;
  modelNbrStr   : String;
  artStr        : String;
  modelNbr      : Integer;
begin

  // Build artickel number, depends on model
  artStr := 'Cobia ';
  modelIndex :=  cBxSelectModelType.ItemIndex;
  if Not (modelIndex = -1) then begin
    modelStr := cBxSelectModelType.Items.Strings[modelIndex];
    // Read model number, in the first 4 characters
    for i := 1 to 4 do
      modelNbrStr := modelNbrStr + modelStr[i];
    modelNbr := StrToInt(modelNbrStr);

    // Add correct model text
    if (modelNbr >= 2000) and (modelNbr < 3000) then
      artStr := artStr + 'Flex MAS';
    if (modelNbr = 1004) then
      artStr := artStr + 'Smart';
  end;

  // Build all items in the file
  lstItem:=ListFirmware.Items.Add();
  lstItem.Caption := artStr;                          // Artikelben�mning
  lstItem.SubItems.Add(edtMasSerialNumber.Text);      // SN
  lstItem.SubItems.Add('');                           // SN2
  lstItem.SubItems.Add('1');                          // Kanal
  lstItem.SubItems.Add(edtMASCalibOffsetHigh.Text);   // Offset high sensitivity
  lstItem.SubItems.Add(edtMASCalibOffsetLow.Text);    // Offset low  sensitivity
  lstItem.SubItems.Add(Format('%s'+RTIIS_REP_SEP+'%s'+RTIIS_REP_SEP+'%s',           // Inm�tning f�r ber�kning kalibrering: high sens
                               [AnsiReplaceStr(edtMASAdjustADCMean75mA_1.Text, '+', ''),
                                AnsiReplaceStr(edtMASAdjustADCMean75mA_2.Text, '+', ''),
                                AnsiReplaceStr(edtMASAdjustADCMean75mA_3.Text, '+', '')]));
  lstItem.SubItems.Add(Format('%s'+RTIIS_REP_SEP+'%s'+RTIIS_REP_SEP+'%s',           // Inm�tning f�r ber�kning kalibrering: low sens
                               [AnsiReplaceStr(edtMASAdjustADCMean750mA_1.Text, '+', ''),
                                AnsiReplaceStr(edtMASAdjustADCMean750mA_2.Text, '+', ''),
                                AnsiReplaceStr(edtMASAdjustADCMean750mA_3.Text, '+', '')]));
  lstItem.SubItems.Add('');                                                         // Normeringsfaktor sida A
  lstItem.SubItems.Add('');                                                         // Normeringsfaktor sida B
  lstItem.SubItems.Add(AnsiReplaceStr(highMasCalValEdit.text, '+', ''));   // Kalibreringsfaktor high sens
  lstItem.SubItems.Add(AnsiReplaceStr(lowMasCalValEdit.text, '+', ''));    // Kalibreringsfaktor low sens
  lstItem.SubItems.Add('');                                                         // Intern kalibreringsfaktor
  lstItem.SubItems.Add('');                                                         // Laddnings referens
  lstItem.SubItems.Add('');                                                         // Enhet laddning
  lstItem.SubItems.Add('');                                                         // Laddning uppm�tt
  lstItem.SubItems.Add(Format('%.2f'+RTIIS_REP_SEP+'%.2f'+RTIIS_REP_SEP+
                              '%.1f'+RTIIS_REP_SEP+'%.1f'+RTIIS_REP_SEP,                 // Str�m referens
                               [SafeFloatConvert(edtMasCalibrationRefCur5mA.Text),
                                SafeFloatConvert(edtMasCalibrationRefCur75mA.Text),
                                SafeFloatConvert(edtMasCalibrationRefCur250mA.Text),
                                SafeFloatConvert(edtMasCalibrationRefCur750mA.Text)]));
  lstItem.SubItems.Add('mA'+RTIIS_REP_SEP+'mA'+RTIIS_REP_SEP+'mA'+RTIIS_REP_SEP+
                       'mA'+RTIIS_REP_SEP);                                              // Enhet str�m
  lstItem.SubItems.Add(Format('%.2f'+RTIIS_REP_SEP+'%.2f'+RTIIS_REP_SEP+
                              '%.1f'+RTIIS_REP_SEP+'%.1f'+RTIIS_REP_SEP,                 // Str�m uppm�tt
                               [SafeFloatConvert(edtMasCalibrationMeasCur5mA.Text),
                                SafeFloatConvert(edtMasCalibrationMeasCur75mA.Text),
                                SafeFloatConvert(edtMasCalibrationMeasCur250mA.Text),
                                SafeFloatConvert(edtMasCalibrationMeasCur750mA.Text)]));
  lstItem.SubItems.Add(frmMain.Caption);                                              // PC sw version
  lstItem.SubItems.Add(edtEmVersion.Text);                                            // Product version

  // The values shall have ',' as separator in RTIIS, convert all values (the two last shall shall not be changed)
  i := 0;
  while (i < (lstItem.SubItems.Count - 2)) do begin
    lstItem.SubItems.Strings[i] := ConvertPointToComma(lstItem.SubItems.Strings[i]);
    Inc(i);
  end;

  // Make the string that shall be sent to RTIIS - TAB separated
  str := lstItem.Caption + #9;
  i := 0;
  while (i < lstItem.SubItems.Count) do begin
    str := str + lstItem.SubItems.Strings[i];
    str := str + #9;  // Tab
    Inc(i);
  end;

  // Create the file and store the data there
  AssignFile(rtiisFile, _fileNameRTIIS);
  ReWrite(rtiisFile);
  WriteLn(rtiisFile, str);
  CloseFile(rtiisFile);
end;

procedure TfrmMain.BtMASClearClick(Sender: TObject);
begin
//  Clipboard.AsText := edtMasTime.Text;
end;

procedure TfrmMain.ClearMASOffsetView();
begin
  edtMASCalibOffsetHigh.Text := '';
  edtMASCalibOffsetLow.Text  := '';

  lblMASOffsetFailure.Visible := false;
  lblMASOffsetWorking.Visible := false;

  frmMain.Update();  // Update the form

  _MasAdjust := 0;   // Stop MasAdjust
end;

procedure TfrmMain.ClearMASAdjustmentView();
begin
  edtMASAdjustCurrent75mA_1.Text       := '';
  edtMASAdjustCurrent75mA_2.Text       := '';
  edtMASAdjustCurrent75mA_3.Text       := '';
  edtMASAdjustADCMean75mA_1.Text       := '';
  edtMASAdjustADCMean75mA_2.Text       := '';
  edtMASAdjustADCMean75mA_3.Text       := '';
  edtMASAdjustCurrent75mA_MeanVal.Text := '';
  edtMASAdjustADCMean75mA_MeanVal.Text := '';
  edtMASAdjustGainFactor75mA.Text      := '';
  edtMASAdjustGainFactor75mA.Color     := clYellow;

  edtMASAdjustCurrent750mA_1.Text       := '';
  edtMASAdjustCurrent750mA_2.Text       := '';
  edtMASAdjustCurrent750mA_3.Text       := '';
  edtMASAdjustADCMean750mA_1.Text       := '';
  edtMASAdjustADCMean750mA_2.Text       := '';
  edtMASAdjustADCMean750mA_3.Text       := '';
  edtMASAdjustCurrent750mA_MeanVal.Text := '';
  edtMASAdjustADCMean750mA_MeanVal.Text := '';
  edtMASAdjustGainFactor750mA.Text      := '';
  edtMASAdjustGainFactor750mA.Color     := clYellow;

  lblMASAdjustFailure.Visible        := false;
  lblMASAdjustStorageFailure.Visible := false;
  lblMASAdjustmentWorking.Visible    := false;
  lblMASAdjustStorageOk.Visible      := false;

  frmMain.Update();  // Update the form

  _MasAdjust := 0;
end;

procedure TfrmMain.ClearMASCalibrationView();
begin
  edtMasCalibrationRefCur5mA.Text   := '';
  edtMasCalibrationRefCur75mA.Text  := '';
  edtMasCalibrationRefCur250mA.Text := '';
  edtMasCalibrationRefCur750mA.Text := '';

  edtMasCalibrationMeasCur5mA.Text   := '';
  edtMasCalibrationMeasCur75mA.Text  := '';
  edtMasCalibrationMeasCur250mA.Text := '';
  edtMasCalibrationMeasCur750mA.Text := '';

  edtMasCalibrationDev5mA.Text   := '';
  edtMasCalibrationDev75mA.Text  := '';
  edtMasCalibrationDev250mA.Text := '';
  edtMasCalibrationDev750mA.Text := '';

  edtMasCalibrationPass5mA.Text   := '';
  edtMasCalibrationPass75mA.Text  := '';
  edtMasCalibrationPass250mA.Text := '';
  edtMasCalibrationPass750mA.Text := '';

  lblMASCalibrationWorking.Visible := false;

  frmMain.Update();  // Update the form

  _MasCalib := 0;
end;

procedure TfrmMain.ClearEmOffsetView();
begin
  // Reset the used external probe offset variables
  _sExtOffsetHighSideA       := '';
  _sExtOffsetHighSideB       := '';
  _sExtOffsetLowSideA        := '';
  _sExtOffsetLowSideB        := '';
  _normalizeFactLowSideA     := 1.0;
  _normalizeFactLowSideB     := 1.0;
  edtEmOffsetHigh.Text       := '';
  edtEmOffsetLow.Text        := '';
  edtEmOffsetHigh.Color      := clWindow;
  edtEmOffsetLow.Color       := clWindow;
  lblEmOffsetFailure.Visible := false;
  lblEmOffsetWorking.Visible := false;

  frmMain.Update();  // Update the form
end;

procedure TfrmMain.SendTrigCommand(trigMode : TTrigMode; windowTimeMs : Integer);
var
  fwVersion    : Extended;
  windTimeS    : Extended;
  windTimeStr  : String;
begin
  // Find FW version
  fwVersion := SafeFloatConvert(AnsiLeftStr(edtFirmwareVersion.Text, 3));

  // Use old (ms_trig) or newer (external protoool) commands, depending of FW version
  if (fwVersion < 5.5) then begin
    // Older FW version, use old commands ms_trig
    if (trigMode = TRIG_PEAK) then begin
      SendCommand('ms_trig on peak');
      Sleep(100);
      SendCommand('ms_trig off peak');
      Sleep(100);
    end;
    if (trigMode = TRIG_MANUAL) then begin
      SendCommand('ms_trig on manual');
      Sleep(100);
      // Let trig off still be peak for a while if an ongoing trig
      SendCommand('ms_trig off peak');
      Sleep(600);
      SendCommand('ms_trig off manual');
      Sleep(100);
    end;
    if (trigMode = TRIG_WINDOW) then begin
      SendCommand('ms_trig on window');
      Sleep(100);
      SendCommand('ms_trig off window');
      Sleep(100);
    end;
    if (trigMode = TRIG_ON) then begin
      SendCommand('ms_trig on trig');
    end;
    if (trigMode = TRIG_OFF) then begin
      SendCommand('ms_trig off trig');
    end;
    if (trigMode = TRIG_DISABLE) then begin
      SendCommand('ms_trig off trig');
    end;
  end else begin
    // Newer FW version, use the new external protocol
    if (trigMode = TRIG_PEAK) then begin
      SendCommand('[CobiaC-0000XXXX-Trig;set;normalOn]');
    end;
    if (trigMode = TRIG_MANUAL) then begin
      SendCommand('[CobiaC-0000XXXX-Trig;set;off]');   // Will stop peak trig
    end;
    if (trigMode = TRIG_WINDOW) then begin
      windTimeS := windowTimeMs / 1000;
      windTimeStr := FloatToStrF(windTimeS, ffGeneral, 8, 3);
      SendCommand('[CobiaC-0000XXXX-Trig;set;timeOn;' + windTimeStr + ']');
    end;
    if (trigMode = TRIG_ON) then begin
      SendCommand('[CobiaC-0000XXXX-Trig;set;manualOn]');
    end;
    if (trigMode = TRIG_OFF) then begin
      SendCommand('[CobiaC-0000XXXX-Trig;set;off]');
    end;
    if (trigMode = TRIG_DISABLE) then begin
      SendCommand('[CobiaC-0000XXXX-Trig;set;disable]');
    end;
  end;

end;

// Activate a MAS trig measurement (manual trig enabled)
procedure  TfrmMain.MakeMASTrig();
begin
  Sleep(500);
//  SendCommand('ms_trig on trig');   // Trig on for Cobia
  SendTrigCommand(TRIG_ON, 0);
  Sleep(2100);                      // Measure in about 2 seconds
//  SendCommand('ms_trig off trig');  // Trig off for Cobia
  SendTrigCommand(TRIG_OFF, 0);
  Sleep(300);
end;

procedure TfrmMain.ClearEmAdjustmentView();
begin
    // Reset the value boxes
    edtEmAdjustmentLsCurrent_1.Text       := '';
    edtEmAdjustmentLsCurrent_2.Text       := '';
    edtEmAdjustmentLsCurrent_3.Text       := '';
    edtEmAdjustmentHsCurrent_1.Text       := '';
    edtEmAdjustmentHsCurrent_2.Text       := '';
    edtEmAdjustmentHsCurrent_3.Text       := '';
    edEmAdjustmenttHsGain.Text            := '';
    edEmAdjustmenttLsGain.Text            := '';
    edEmAdjustmenttHsGain.Color           := $0080FFFF;  // Set original color
    edEmAdjustmenttLsGain.Color           := $0080FFFF;  // Set original color
    lblEmAdjustmentFailure.Visible        := false;  // Don't display the calibration failure text
    lblEmAdjustmentStorageFailure.Visible := false;
    lblEmAdjustmentWorking.Visible        := false;
    lblEmStorageOk.Visible                := false;

    frmMain.Update();  // Update the form
end;

procedure TfrmMain.ClearEmCalibrationView();
begin
    // Reset the value boxes
    edtEmCalibrationCurrVal750pA.Text   := '';
    edtEmCalibrationCurrVal7nA.Text     := '';
    edtEmCalibrationCurrVal75nA.Text    := '';
    edtEmCalibrationCurrVal750nA.Text   := '';
    edtEmCalibrationCurrVal7500nA.Text  := '';
    edtEmCalibrationCurrDev750pA.Text   := '';
    edtEmCalibrationCurrDev7nA.Text     := '';
    edtEmCalibrationCurrDev75nA.Text    := '';
    edtEmCalibrationCurrDev750nA.Text   := '';
    edtEmCalibrationCurrDev7500nA.Text  := '';
    edtEmCalibrationCurrPass750pA.Text  := '';
    edtEmCalibrationCurrPass7nA.Text    := '';
    edtEmCalibrationCurrPass75nA.Text   := '';
    edtEmCalibrationCurrPass750nA.Text  := '';
    edtEmCalibrationCurrPass7500nA.Text := '';

    edtEmCalibrationChargeVal750pC.Text   := '';
    edtEmCalibrationChargeVal7nC.Text     := '';
    edtEmCalibrationChargeVal75nC.Text    := '';
    edtEmCalibrationChargeVal750nC.Text   := '';
    edtEmCalibrationChargeVal7500nC.Text  := '';
    edtEmCalibrationChargeDev750pC.Text   := '';
    edtEmCalibrationChargeDev7nC.Text     := '';
    edtEmCalibrationChargeDev75nC.Text    := '';
    edtEmCalibrationChargeDev750nC.Text   := '';
    edtEmCalibrationChargeDev7500nC.Text  := '';
    edtEmCalibrationChargePass750pC.Text  := '';
    edtEmCalibrationChargePass7nC.Text    := '';
    edtEmCalibrationChargePass75nC.Text   := '';
    edtEmCalibrationChargePass750nC.Text  := '';
    edtEmCalibrationChargePass7500nC.Text := '';

    lblEmCalibrationWorking.Visible := false;

    frmMain.Update();  // Update the form
end;

procedure TfrmMain.CalcMasOffset();
var
  offsetHigh     : Extended;
  offsetLow      : Extended;
  buttonSelected : Integer;
begin
  // Check Mas offset - only if ongoing MasAdjustment / MasCalibration
  if (lblMASOffsetWorking.Visible = true) then begin
    if (edtMASCalibOffsetHigh.Text <> '') and
       (edtMASCalibOffsetLow.Text <> '') then begin
      // Both Mas offset values have been received -> check valid

      offsetHigh := SafeFloatConvert(edtMASCalibOffsetHigh.Text);
      offsetLow  := SafeFloatConvert(edtMASCalibOffsetLow.Text);

      // Check if valid offset values
      if (offsetHigh < 2) or (offsetHigh > 20) or
         (offsetLow < 20) or (offsetLow > 60) then begin
        lblMASOffsetFailure.Visible := true;
      end;

      lblMASOffsetWorking.Visible := false;
      frmMain.Update();                     // Update the form
    end;
  end;
end;

// Calculate external probe offset and norm.factors for the external probes
procedure TfrmMain.CalcExtProbeOffset();
var
  offsetMeanHigh     : Extended;
  offsetMeanLow      : Extended;
  offsetHighSideA    : Extended;
  offsetHighSideB    : Extended;
  offsetLowSideA     : Extended;
  offsetLowSideB     : Extended;
  normFactHighSideA  : Extended;
  normFactHighSideB  : Extended;
begin
  // If all offset values have recieved -> calculate mean offset
  if ( (lblEmOffsetWorking.Visible = true) and
       (_sExtOffsetHighSideA <> '') and
       (_sExtOffsetHighSideB <> '') and
       (_sExtOffsetLowSideA  <> '') and
       (_sExtOffsetLowSideB  <> '') ) then begin

   offsetHighSideA := SafeFloatConvert(_sExtOffsetHighSideA);
   offsetHighSideB := SafeFloatConvert(_sExtOffsetHighSideB);
   offsetLowSideA  := SafeFloatConvert(_sExtOffsetLowSideA);
   offsetLowSideB  := SafeFloatConvert(_sExtOffsetLowSideB);

    // Build mean value of the offset
    offsetMeanHigh := (offsetHighSideA + offsetHighSideB) / 2;
    offsetMeanLow  := (offsetLowSideA + offsetLowSideB) / 2;

    // Calculate normalized factors for the side A and B of external capacitors (low sensitivity)
    _normalizeFactLowSideA := 1.0;
    _normalizeFactLowSideB := 1.0;
    normFactHighSideA      := 1.0;
    normFactHighSideB      := 1.0;
    if (offsetMeanLow > 0) then begin
      _normalizeFactLowSideA := offsetLowSideA / offsetMeanLow;
      _normalizeFactLowSideB := offsetLowSideB / offsetMeanLow;
    end;
    if (offsetMeanHigh > 0) then begin
      normFactHighSideA := offsetHighSideA / offsetMeanHigh;
      normFactHighSideB := offsetHighSideB / offsetMeanHigh;
    end;

    // Fill the viewed offset boxes
    edtEmOffsetHigh.Text := Format('%.0f', [offsetMeanHigh]);
    edtEmOffsetLow.Text  := Format('%.0f', [offsetMeanLow]);

    // Check valid values
    if (offsetHighSideA < 3500) or (offsetHighSideA > 4500) or
       (offsetHighSideB < 3500) or (offsetHighSideB > 4500) or
       (normFactHighSideA < 0.97) or (normFactHighSideA > 1.03) or
       (normFactHighSideB < 0.97) or (normFactHighSideB > 1.03) then begin
       edtEmOffsetHigh.Color      := clRed;
       lblEmOffsetFailure.Visible := true;
    end;
    if (offsetLowSideA < 3500) or (offsetLowSideA > 4500) or
       (offsetLowSideB < 3500) or (offsetLowSideB > 4500) or
       (_normalizeFactLowSideA < 0.97) or (_normalizeFactLowSideA > 1.03) or
       (_normalizeFactLowSideB < 0.97) or (_normalizeFactLowSideB > 1.03) then begin
       edtEmOffsetLow.Color       := clRed;
       lblEmOffsetFailure.Visible := true;
    end;

    lblEmOffsetWorking.Visible := false;  // Remove the Em-Working label
    frmMain.Update();                     // Update the form
  end;
end;

// Ask for current offset
procedure TfrmMain.AskForOffset();
begin
  SendCommand('m_get_val;offset');
end;

procedure TfrmMain.MakeFwOffsetResetForMASCalibration();
begin
  // Activate manual trig for on
//  SendCommand('ms_trig on manual');
//  Sleep(100);
//  SendCommand('ms_trig off manual');
  SendTrigCommand(TRIG_MANUAL, 0);
  Sleep(500);

  // Activate offset update and make a reset with new offset measurement
  SendCommand('debug_offset_update;on');
  Sleep(100);
  SendCommand('m_reset');
  Sleep(9000);            // Wait for resetting

  // Do not update the offset, needed for the MAS calibration
  SendCommand('debug_offset_update;off');

  // Ask for offset
  AskForOffset();

  _MasOffsetMeasured := True;
end;

procedure TfrmMain.MakeFwOffsetResetForCalibration();
var
  buffer : packed array[0..40] of char;
begin
  // Activate manual trig for on and off.
//  SendCommand('ms_trig on manual');
//  Sleep(100);
//  SendCommand('ms_trig off manual');
  SendTrigCommand(TRIG_MANUAL, 0);
  Sleep(500);

  // The Calibrator shouln't be connected to the Cobia, but if so set the Calibrator in a mode with low noise
  buffer := 'O0X';       // Operate off
  IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 5, NLend);
  buffer := 'F1X';       // Ampere
  IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 5, NLend);
  buffer := 'R0X';       // Range Auto
  IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 5, NLend);
  buffer := 'V7.5E-12X';  // Value 75 pA
  IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 20, NLend);
  Sleep(500);

  // Activate offset update and make a reset with new offset measurement
  SendCommand('debug_offset_update;on');
  Sleep(100);
  SendCommand('m_reset');
  Sleep(9000);                      // Wait for resetting

  // Do not update the offset, needed for the electrometer calibration
  SendCommand('debug_offset_update;off');

  // Ask for offset
  AskForOffset();

  lblEmOffsetWorking.Visible := true;   // Let this still be true, is set to false in AskForOffset
  frmMain.Update();                     // Update the form

  Sleep(2000);

  _EmOffsetMeasured := True;
end;

// Make offset measurement when electrometer calibration
procedure TfrmMain.BtCalibElectrOffsetClick(Sender: TObject);
begin
  lblEmAdjustmentWorking.Visible := true;
  frmMain.Update();          // Update the form

  MakeFwOffsetResetForCalibration();

  lblEmAdjustmentWorking.Visible := false;
  frmMain.Update();          // Update the form
end;

// Make offset measurement when electrometer check measurement
procedure TfrmMain.BtCheckElectrOffsetClick(Sender: TObject);
begin
  lblEmCalibrationWorking.Visible := true;
  frmMain.Update();          // Update the form

  MakeFwOffsetResetForCalibration();

  lblEmCalibrationWorking.Visible := false;
  frmMain.Update();          // Update the form
end;

// Make offset measurement when electrometer measurement
procedure TfrmMain.btEmOffsetResetClick(Sender: TObject);
begin
  ClearEmOffsetView();
  lblEmOffsetWorking.Visible := true;
  frmMain.Update();          // Update the form

  // View dialog that set power on 75 mA
  MessageDlg('Connect the Cobia EM calibration probe to the Cobia.' + #13#10 +
             'Let the Lemo connector be DISCONNECTED.' + #13#10 +
             'Press OK button when ready.', mtInformation, [mbOK], 0);

  MakeFwOffsetResetForCalibration();

//  lblEmOffsetWorking.Visible := false;  // Wait until reset value have received
//  frmMain.Update();          // Update the form
end;

procedure TfrmMain.btEmAdjustmentStartClick(Sender: TObject);
var
  buffer           : packed array[0..40] of char;
  padlist          : AddrList;
  buttonSelected   : Integer;
begin
  // Start with electrometer calibration

  // Check if offset calculation is done or failure, if not present warning dialoge
  if (_EmOffsetMeasured = False) or (lblEmOffsetFailure.Visible = true) then  begin
      buttonSelected := MessageDlg('Offset reset not done or failure! Proceed?', mtError, [mbYes, mbNo], 0);
  end else
    buttonSelected := mrYes; // If offset done, do the adjustment

  if (buttonSelected = mrYes) then begin

    ClearEmAdjustmentView();
    lblEmAdjustmentWorking.Visible := true;
    frmMain.Update();          // Update the form

    // Enable manual trig to prevent trig when preparing the calibrator
    // Note do not set manual trigOff - to be able for the Cobia to trig off by the signal
//    SendCommand('ms_trig on manual');
    SendTrigCommand(TRIG_MANUAL, 0);
    Sleep(400);

    MessageDlg('Let the Lemo connector be CONNECTED.' + #13#10 +
               'Press OK button when ready.', mtInformation, [mbOK], 0);

    // Prepare the Calibrator to default
    padlist[0] := PRIMARY_ADDR_OF_DMM;
    padlist[1] := NOADDR;
    IbEnableRemote(BDINDEX, padlist);
    IbDevClear(BDINDEX, PRIMARY_ADDR_OF_DMM);
    buffer := 'O0X';                  // Operate off
    IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 5, NLend);
    buffer := 'F1X';                  // Ampere
    IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 5, NLend);
    Sleep(500);     // Wait for pulse to disapeare

    // Activate manual trig for on and off.
//    SendCommand('ms_trig on manual');
//    Sleep(100);
//    SendCommand('ms_trig off manual');
//    Sleep(100);
    SendTrigCommand(TRIG_MANUAL, 0);

    // Switch off autorange
    // Start with high sensibility
    // Disable offset updateing
    // Set default calibration values (so the signals not are affected by an old calibration)
    SendCommand('ms_range_ext;auto;0');
    Sleep(100);
    SendCommand('ms_range_ext;1');
    Sleep(100);
    SendCommand('debug_offset_update;off');
    Sleep(100);
    SendCommand('nvmem;set;calibext;0;+1.000000');
    Sleep(100);
    SendCommand('nvmem;set;calibext;1;+1.000000');

    // Start with 50 nA
    buffer := 'F1X';     // Ampere
    IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 5, NLend);
    buffer := 'R0X';     // Range Auto
    IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 5, NLend);
    buffer := 'V5.0E-8X'; // Value 50 nA
    IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 20, NLend);
    Sleep(200);

    // Activate the pulse and measure in 2 seconds
    buffer := 'O1X';                  // Calibrator: Set operate ON
    IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 5, NLend);
    Sleep(500);                       // Wait a while to be sure that Calibrator has rised the signal
//    SendCommand('ms_trig on trig');   // Trig on for Cobia
    SendTrigCommand(TRIG_ON, 0);
    Sleep(2100);                      // Measure in about 2 secons
    // Need to switch on/off signal all times if fw version 5.0A, due to manual trig not works correctly
    if (AnsiContainsStr(edtFirmwareVersion.Text, '5.0A') = true) then begin
        buffer := 'O0X';                  // Calibrator: Set operate OFF
        IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 5, NLend);
        Sleep(300);
    end;
//    SendCommand('ms_trig off trig');  // Trig off for Cobia
    SendTrigCommand(TRIG_OFF, 0);

    _EmAdjust    := 6;
    _EmCalibr    := -1;    // No check meas
    _EmChargeAct := false;
    lblEmCalibrationWorking.Visible := false;
    lblEmOffsetWorking.Visible      := false;
  end;
end;

procedure TfrmMain.btEmCalibrationStartClick(Sender: TObject);
var
  buffer           : packed array[0..40] of char;
  padlist          : AddrList;
  buttonSelected   : Integer;
begin
  // Start with electrometer check

  if (_EmOffsetMeasured = False) or (lblEmOffsetFailure.Visible = true) then  begin
      buttonSelected := MessageDlg('Offset reset not done or failure! Proceed?', mtError, [mbYes, mbNo], 0);
  end else
    buttonSelected := mrYes; // If offset done, do the adjustment

  if (buttonSelected = mrYes) then begin

    ClearEmCalibrationView();
    lblEmCalibrationWorking.Visible := true;
    frmMain.Update();  // Update the form

    // Enable manual trig to prevent trig when preparing the calibrator
    // Note do not set manual trigOff - to be able for the Cobia to trig off by the signal
//    SendCommand('ms_trig on manual');
    SendTrigCommand(TRIG_MANUAL, 0);
    Sleep(400);

    MessageDlg('Let the Lemo connector be CONNECTED.' + #13#10 +
               'Press OK button when ready.', mtInformation, [mbOK], 0);

    // Prepare the Calibrator to default
    padlist[0] := PRIMARY_ADDR_OF_DMM;
    padlist[1] := NOADDR;
    IbEnableRemote(BDINDEX, padlist);
    IbDevClear(BDINDEX, PRIMARY_ADDR_OF_DMM);
    buffer := 'O0X';     // Operate off
    IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 5, NLend);
    buffer := 'F1X';     // Ampere
    IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 5, NLend);
    Sleep(500);     // Wait for pulse to disapeare

    // Activate manual trig for on and off.
//    SendCommand('ms_trig on manual');
//    Sleep(100);
//    SendCommand('ms_trig off manual');
//    Sleep(100);
    SendTrigCommand(TRIG_MANUAL, 0);

    // Switch on autorange
    // Start with high sensibility (as usually)
    // Disable offset updateing
    SendCommand('ms_range_ext;auto;1');
    Sleep(100);
    SendCommand('ms_range_ext;1');
    Sleep(100);
    SendCommand('debug_offset_update;off');
    Sleep(100);

    // Ask for calibration factors
    SendCommand(('nvmem;get;calibext'));
    Sleep(100);

    // Ask for offset, if not already done
    if (_EmOffsetMeasured = false) then begin
      ClearEmOffsetView();
      AskForOffset();
      Sleep(2000);
    end;

    // Start with 750 pA
    buffer := 'F1X';     // Ampere
    IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 5, NLend);
    buffer := 'R0X';     // Range Auto
    IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 5, NLend);
    buffer := 'V7.5E-10X'; // Value 750 pA
    IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 20, NLend);
    Sleep(100);

    // Activate the pulse and measure in 2 seconds
    buffer := 'O1X';                  // Calibrator: Set operate ON
    IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 5, NLend);
    Sleep(500);                       // Wait a while to be sure that Calibrator has rised the signal
//    SendCommand('ms_trig on trig');   // Trig on for Cobia
    SendTrigCommand(TRIG_ON, 0);
    Sleep(2100);                      // Measure in about 2 secons
//    SendCommand('ms_trig off trig');  // Trig off for Cobia
    SendTrigCommand(TRIG_OFF, 0);

    _EmCalibr    := 10;
    _EmAdjust    := -1;  // No calibration
    _EmChargeAct := false;
    lblEmOffsetWorking.Visible := false;
  end;
end;

procedure TfrmMain.btnUpdateClick(Sender: TObject);
begin
  SendCommand('wf_list_files');
end;

procedure TfrmMain.cbMasCalibrationClick(Sender: TObject);
begin
    //lowMasCalValLabel.Enabled := cbMasCalibration.Checked;
    //lowMasCalValEdit.Enabled := cbMasCalibration.Checked;
    //lowMasCalValSave.Enabled := cbMasCalibration.Checked;
    //highMasCalValLabel.Enabled := cbMasCalibration.Checked;
    //highMasCalValEdit.Enabled := cbMasCalibration.Checked;
    //MASLowStart.Enabled := cbMasCalibration.Checked;
    //MasHighStart.Enabled := cbMasCalibration.Checked;


end;

procedure TfrmMain.ClearParamsClick(Sender: TObject);
begin
  ClearParams();
end;

procedure TfrmMain.ClearParams();
begin
  panel_P1A_value.Caption := '-';
  panel_P1A_value.Font.Size := 14;
  panel_P1A_value.Font.Color := RGB(99, 99, 99);
  panel_P1A_value.Alignment :=  taRightJustify;
  panel_P1A_unit.Font.Color := RGB(99,99,99);
  Panel_P1A_probe.Visible := false;

  panel_P1B_value.Caption := '-';
  panel_P1B_value.Font.Size := 14;
  panel_P1B_value.Font.Color := RGB(99,99,99);
  panel_P1B_value.Alignment :=  taRightJustify;
  panel_P1B_unit.Font.Color := RGB(99,99,99);
  Panel_P1B_probe.Visible := false;

  panel_P2_value.Caption := '-';
  panel_P2_value.Font.Size := 14;
  panel_P2_value.Font.Color := RGB(99,99,99);
  panel_P2_value.Alignment :=  taRightJustify;
  panel_P2_unit.Font.Color := RGB(99,99,99);
  Panel_P2_probe.Visible := false;

  panel_P3_value.Caption := '-';
  panel_P3_value.Font.Size := 14;
  panel_P3_value.Font.Color := RGB(99,99,99);
  panel_P3_value.Alignment :=  taRightJustify;
  panel_P3_unit.Font.Color := RGB(99,99,99);
  Panel_P3_probe.Visible := false;

  panel_P4_value.Caption := '-';
  panel_P4_value.Font.Size := 14;
  panel_P4_value.Font.Color := RGB(99,99,99);
  panel_P4_value.Alignment :=  taRightJustify;
  panel_P4_unit.Font.Color := RGB(99,99,99);
  Panel_P4_probe.Visible := false;

  panel_P5_value.Caption := '-';
  panel_P5_value.Font.Size := 14;
  panel_P5_value.Font.Color := RGB(99,99,99);
  panel_P5_value.Alignment :=  taRightJustify;
  panel_P5_unit.Font.Color := RGB(99,99,99);
  Panel_P5_probe.Visible := false;

  panel_P6_value.Caption := '-';
  panel_P6_value.Font.Size := 14;
  panel_P6_value.Font.Color := RGB(99,99,99);
  panel_P6_value.Alignment :=  taRightJustify;
  panel_P6_unit.Font.Color := RGB(99,99,99);
  Panel_P6_probe.Visible := false;

  panel_P7_value.Caption := '-';
  panel_P7_value.Font.Size := 14;
  panel_P7_value.Font.Color := RGB(99,99,99);
  panel_P7_value.Alignment :=  taRightJustify;
  panel_P7_unit.Font.Color := RGB(99,99,99);
  Panel_P7_probe.Visible := false;

  panel_P8_value.Caption := '-';
  panel_P8_value.Font.Size := 14;
  panel_P8_value.Font.Color := RGB(99,99,99);
  panel_P8_value.Alignment :=  taRightJustify;
  panel_P8_unit.Font.Color := RGB(99,99,99);
  Panel_P8_probe.Visible := false;

  panel_P9_value.Caption := '-';
  panel_P9_value.Font.Size := 14;
  panel_P9_value.Font.Color := RGB(99,99,99);
  panel_P9_value.Alignment :=  taRightJustify;
  panel_P9_unit.Font.Color := RGB(99,99,99);
  Panel_P9_probe.Visible := false;

  panel_P10_value.Caption := '-';
  panel_P10_value.Font.Size := 14;
  panel_P10_value.Font.Color := RGB(99,99,99);
  panel_P10_value.Alignment :=  taRightJustify;
  panel_P10_unit.Font.Color := RGB(99,99,99);
  Panel_P10_probe.Visible := false;

  panel_P11_value.Caption := '-';
  panel_P11_value.Font.Size := 14;
  panel_P11_value.Font.Color := RGB(99,99,99);
  panel_P11_value.Alignment :=  taRightJustify;
  panel_P11_unit.Font.Color := RGB(99,99,99);
  Panel_P11_probe.Visible := false;

  panel_P12_value.Caption := '-';
  panel_P12_value.Font.Size := 14;
  panel_P12_value.Font.Color := RGB(99,99,99);
  panel_P12_value.Alignment :=  taRightJustify;
  panel_P12_unit.Font.Color := RGB(99,99,99);
  Panel_P12_probe.Visible := false;

  panel_P13_value.Caption := '-';
  panel_P13_value.Font.Size := 14;
  panel_P13_value.Font.Color := RGB(99,99,99);
  panel_P13_value.Alignment :=  taRightJustify;
  panel_P13_unit.Font.Color := RGB(99,99,99);
  Panel_P13_probe.Visible := false;

  panel_P14_value.Caption := '-';
  panel_P14_value.Font.Size := 14;
  panel_P14_value.Font.Color := RGB(99,99,99);
  panel_P14_value.Alignment :=  taRightJustify;
  panel_P14_unit.Font.Color := RGB(99,99,99);
  Panel_P14_probe.Visible := false;

  panel_P15_value.Caption := '-';
  panel_P15_value.Font.Size := 14;
  panel_P15_value.Font.Color := RGB(99,99,99);
  panel_P15_value.Alignment :=  taRightJustify;
  panel_P15_unit.Font.Color := RGB(99,99,99);
  Panel_P15_probe.Visible := false;

  panel_P16_value.Caption := '-';
  panel_P16_value.Font.Size := 14;
  panel_P16_value.Font.Color := RGB(99,99,99);
  panel_P16_value.Alignment :=  taRightJustify;
  panel_P16_unit.Font.Color := RGB(99,99,99);
  Panel_P16_probe.Visible := false;

  panel_P17_value.Caption := '-';
  panel_P17_value.Font.Size := 14;
  panel_P17_value.Font.Color := RGB(99,99,99);
  panel_P17_value.Alignment :=  taRightJustify;
  panel_P17_unit.Font.Color := RGB(99,99,99);
  Panel_P17_probe.Visible := false;

  panel_P18_value.Caption := '-';
  panel_P18_value.Font.Size := 14;
  panel_P18_value.Font.Color := RGB(99,99,99);
  panel_P18_value.Alignment :=  taRightJustify;
  panel_P18_unit.Font.Color := RGB(99,99,99);
  Panel_P18_probe.Visible := false;

  panel_P19_value.Caption := '-';
  panel_P19_value.Font.Size := 14;
  panel_P19_value.Font.Color := RGB(99,99,99);
  panel_P19_value.Alignment :=  taRightJustify;
  panel_P19_unit.Font.Color := RGB(99,99,99);
  Panel_P19_probe.Visible := false;

  panel_P20_value.Caption := '-';
  panel_P20_value.Font.Size := 14;
  panel_P20_value.Font.Color := RGB(99,99,99);
  panel_P20_value.Alignment :=  taRightJustify;
  panel_P20_unit.Font.Color := RGB(99,99,99);
  Panel_P20_probe.Visible := false;

  panel_P21_value.Caption := '-';
  panel_P21_value.Font.Size := 14;
  panel_P21_value.Font.Color := RGB(99,99,99);
  panel_P21_value.Alignment :=  taRightJustify;
  panel_P21_unit.Font.Color := RGB(99,99,99);
  Panel_P21_probe.Visible := false;

end;

procedure TfrmMain.ClearDataClick(Sender: TObject);
begin
  ListFirmware.Clear();
end;

procedure TfrmMain.btnReadFactorsClick(Sender: TObject);
var I : Integer;
begin
  Sleep(50);
  SendCommand(('nvmem;get;calib'));
  Sleep(50);
  SendCommand(('nvmem;get;serial'));
  Sleep(50);
  SendCommand(('nvmem;get;caldate'));
  Sleep(50);
  SendCommand(('nvmem;get;callab'));
  Sleep(50);
  SendCommand(('nvmem;get;fwversion'));
  Sleep(50);
  SendCommand(('nvmem;get;prodversion'));
  Sleep(50);
  SendCommand(('nvmem;get;prodmodel'));
  Sleep(50);
  SendCommand(('nvmem;get;prodpermissions'));
  Sleep(50);
  SendCommand(('nvmem;get;calibext'));
  Sleep(50);
  SendCommand(('nvmem;get;calibmas'));
  Sleep(50);
  SendCommand(('nvmem;get;vinnova'));
  Sleep(50);
  SendCommand(('wf_list_files'));
end;

procedure TfrmMain.btnReadValuesClick(Sender: TObject);
begin
  Sleep(50);
//  SendCommand('ms_range ?');    // Do not ask for this
  Sleep(50);
  SendCommand('ms_trig window ?');
  Sleep(50);
  SendCommand('ms_trig predelay ?');
  Sleep(50);
  SendCommand('ms_trig on ?');
  Sleep(50);
  SendCommand('ms_trig off ?');
  Sleep(50);
//  SendCommand('ms_range;auto;?');
  Sleep(50);
  SendCommand('nvmem;get;fwversion;?');  // Ask for FW version
  Sleep(50);
  SendCommand(('nvmem;get;prodmodel'));  // Ask for production model
  Sleep(50);
  SendCommand(('nvmem;get;serial'));     // Ask for serial number
  Sleep(50);
  SendCommand(('nvmem;get;prodversion'));
  Sleep(50);
  SendCommand(('nvmem;get;calib'));
  Sleep(50);
  SendCommand(('nvmem;get;caldate'));
  Sleep(50);
  SendCommand(('nvmem;get;callab'));
  Sleep(50);
  SendCommand(('nvmem;get;calibext'));
  Sleep(50);
  SendCommand(('nvmem;get;calibmas'));
  Sleep(50);
  SendCommand(('nvmem;get;prodpermissions'));
  Sleep(50);
  SendCommand(('nvmem;get;vinnova'));
  Sleep(50);
  SendCommand('tst_cadc;dur;' + shortcuttools.edtTestSignalChargePacketSize.Text);
  Sleep(50);
  Sendcommand(('tst_cadc;occ;' + shortcuttools.edtOccurences.Text));
  Sleep(50);
  Sendcommand(('tst_cadc;dwn;') + shortcuttools.edtDownTime.Text);
  Sleep(50);
  SendCommand(('wf_list_files'));
  Sleep(50);
  // China market adjustment of kV and Dose (to pass the Chinese administrative authority)
  if (CHINA_KV_ADJUSTMENT = 0) then begin
    ChinaAdjustment_SetDefault(); // Set default values if compiled as normal PC-test-sw
  end else begin
    SendCommand('china_adjustment;get'); // Ask for current value if compiled as China adjustment PC-sw
  end;
end;

// China market adjustment of kV and Dose (to pass the Chinese administrative authority).
// Set default values of the adjustment
procedure TfrmMain.ChinaAdjustment_SetDefault();
begin
  SendCommand('china_adjustment;set;0;1;0;1'); // Set default values

  // Ask for the value
  Sleep(100);
  SendCommand('china_adjustment;get');
end;

// China market adjustment of kV and Dose (to pass the Chinese administrative authority).
// Set current values of the adjustment
procedure TfrmMain.ChinakVAdjSetClick(Sender: TObject);
var
  stringToSend : String;
begin
  stringToSend := 'china_adjustment;set;' +
                  edtChinakV_k0.Text + ';' +
                  edtChinakV_k1.Text + ';' +
                  edtChinaDose_d0.Text + ';' +
                  edtChinaDose_d1.Text;

  stringToSend := AnsiReplaceStr(stringToSend, ',','.') ; // Convert , to .
  SendCommand(stringToSend);

  // Ask for the value
  Sleep(100);
  SendCommand('china_adjustment;get');
end;

// China market adjustment of kV and Dose (to pass the Chinese administrative authority).
// Set default values of the adjustment
procedure TfrmMain.ChinakVAdjResetClick(Sender: TObject);
begin
  ChinaAdjustment_SetDefault();
end;

procedure TfrmMain.EvaluatePolynomials();
begin
  EvaluatePolynomialTFLowSignal();
  EvaluatePolynomialkVLowSignal();
  EvaluatePolynomialTFHighSignal();
  EvaluatePolynomialkVHighSignal();
end;

procedure TfrmMain.HandleDisplayCheck(pnl_In:TPanel; chk_In:TCheckBox);
begin
  pnl_In.Enabled := chk_In.Checked;
  if chk_In.Checked then
  begin
    if (pnl_In.Name = 'pnlS1') or (pnl_In.Name = 'pnlS2') or (pnl_In.Name = 'pnlS3') or (pnl_In.Name = 'pnlS4') then
      pnl_In.Font.Color := clWhite
    else
      pnl_In.Font.Color := clLime;
  end
  else
    pnl_In.Font.Color := clGray;
end;

procedure TfrmMain.EvaluatePolynomialTFLowSignal();
const
  pcoff : array[0..4] of array[0..3] of Extended  = (
    (205.79,	-128.03,	113.49,	32.67),
    (202.89,	-151.32,	110.60,	31.66),
    (152.02,	-108.92,	90.02,	32.75),
    (150.50,	-134.86,	95.69,	30.59),
    (290.48,	-460.22,	301.90,	-14.09)
  );
var
  I, J, deg : Integer;
  q, y, xf : Extended;
begin
  if _s[1] <> 0 then
    q := _s[2]/_s[1]
  else
    q := 1;

  deg := Length(pcoff[0]) - 1;

  for I := 0 to 4 do begin
    y := 0;
    xf := 1;
    for J := 0 to deg do begin
      y := y + xf*pcoff[I][deg-J];
      xf := xf * q;
    end;
  end;
end;

procedure TfrmMain.EvaluatePolynomialkVLowSignal();
const
  pcoff : array[0..5] of array[0..3] of Extended  = (
    (-3186324,	157755,	-1207.64,	5.51),
    (1086.47,	-309.81,	119.39,	-2.12),
    (12.826,	10.669,	28.74,	-1.23),
    (9.758,	-7.417,	23.26,	-2.74),
    (6.196,	-7.966,	18.51,	-3.29),
    (5.030,	-8.679,	17.77,	-4.37)
  );
var
  I, J, deg : Integer;
  q, y, xf : Extended;
begin
  if _s[3] <> 0 then
    q := _s[2]/_s[3]
  else
    q := 1;

  deg := Length(pcoff[0]) - 1;

  for I := 0 to 5 do begin
    y := 0;
    xf := 1;
    for J := 0 to deg do begin
      y := y + xf*pcoff[I][deg-J];
      xf := xf * q;
    end;
  end;
end;

procedure TfrmMain.EvaluatePolynomialTFHighSignal();
const
  pcoff : array[0..4] of array[0..3] of Extended  = (
    (1364.08,	-532.27,	224.82,	47.29),
    (1233.13,	-534.45,	221.77,	46.33),
    (1014.57,	-445.96,	201.06,	46.54),
    (814.36,	-386.99,	181.28,	46.56),
    (465.76,	-223.83,	132.30,	48.60)
  );
var
  I, J, deg : Integer;
  q, y, xf : Extended;
begin
  if _s[2] <> 0 then
    q := _s[4]/_s[2]
  else
    q := 1;

  deg := Length(pcoff[0]) - 1;

  for I := 0 to 4 do begin
    y := 0;
    xf := 1;
    for J := 0 to deg do begin
      y := y + xf*pcoff[I][deg-J];
      xf := xf * q;
    end;
    
  end;
end;

procedure TfrmMain.EvaluatePolynomialkVHighSignal();
const
  pcoff : array[0..6] of array[0..3] of Extended  = (
    (23078,	-1238.6,	494.47,	-1.035),
    (1296.4,	-544.87,	223.05,	-5.115),
    (81.161,	-10.532,	67.091,	-1.893),
    (21.127,	8.9926,	39.280,	-2.099),
    (8.2500,	9.6316,	26.801,	-2.091),
    (2.1108,	9.7771,	14.392,	-2.159),
    (1.0714,	7.5866,	9.601,	-2.276)
  );
var
  I, J, deg : Integer;
  q, y, xf : Extended;
begin
  if _s[3] <> 0 then
    q := _s[4]/_s[3]
  else
    q := 1;

  deg := Length(pcoff[0]) - 1;

  for I := 0 to 6 do begin
    y := 0;
    xf := 1;
    for J := 0 to deg do begin
      y := y + xf*pcoff[I][deg-J];
      xf := xf * q;
    end;

  end;
end;

procedure TfrmMain.btnActiveCellClick(Sender: TObject);
begin
  if MyApp = nil then Exit;

  if not MyApp.CheckIfAccessable() then
  begin
    MessageDlg(format('"%s" is not accessable.', [Label2.Caption]), mtError, [mbOK], 0);
    Exit;
  end;
  edtRow.Text := IntToStr(MyApp.ActiveCell.iRow);//IntToStr(iRow);
  edtCol.Text := IntToStr(MyApp.ActiveCell.iCol);
end;

procedure TfrmMain.btnClearLogClick(Sender: TObject);
begin
    StoreLogToFile(false);
    edtCommLog.Lines.Clear();
    StoreLogToFile(true);
    mem_meascalcinfo.Lines.Clear();
end;

procedure TfrmMain.btnClrValClick(Sender: TObject);
begin
  S1SimValEdit.Text := '';
  S2SimValEdit.Text := '';
  S3SimValEdit.Text := '';
  S4SimValEdit.Text := '';
  SendCommand('debug_s1s4_val;off');
end;

procedure TfrmMain.btnCopyClick(Sender: TObject);
var
  I, J  : Integer;
  str   : string;
begin
  str := '';
  for I := 0 to (lvRing.Items.Count - 1) do begin
    {
    str := str +
        lvRing.Items.Item[I].Caption + #9;
    }
    for J := 0 to _subitems do begin
      str := str +
        lvRing.Items.Item[I].SubItems[J] + #9;
    end;
      str := str + AnsiString(#13#10);

  end;
  Clipboard.AsText := str;
  Print(str);
end;

procedure TfrmMain.btnCopyLogClick(Sender: TObject);
begin
  Clipboard.AsText := edtCommLog.Lines.Text;
end;

procedure TfrmMain.btnCurrentClick(Sender: TObject);
begin
  Clipboard.AsText := edtCurrent.Text;
end;

// Copy the columns name of ListFirmware to the clipboard. Tab-separated
procedure TfrmMain.btnDataHeaderCopyClick(Sender: TObject);
var
  i   : Integer;
  str : string;
begin
  str := '';
  i   := 0;
  while (i < ListFirmware.Columns.Count) do begin
    str := str + ListFirmware.Columns[i].Caption;
    str := str + #9;            // Tab between each caption
    Inc(i);
  end;

  Clipboard.AsText := str;
end;

procedure TfrmMain.btnDeleteFileClick(Sender: TObject);
begin
  SendCommand('wf_delete_file;'+ lBoxWfFiles.Items.Strings[lBoxWfFiles.ItemIndex]);
end;

procedure TfrmMain.btnDumpGridClick(Sender: TObject);
procedure SetFromList(sVal_in: string);
var
iCol: Integer;
begin
  edtCellValue.Text := sVal_in;
  btnSetValueClick(self);

  iCol:=StrToInt(edtCol.Text);
  Inc(iCol);
  edtCol.Text:=IntToStr(iCol);
end;
var
i, iRow, iCol: Integer;
begin
  if chkExcel.Checked = false then Exit;
  chkUseActiveCell.Checked:=true;
  btnActiveCellClick(self);
  iCol:=StrToInt(edtCol.Text);

  for i:=0 to lstMeasure.Items.Count-1 do
  begin
    //kV calc
    SetFromList(lstMeasure.Items.Item[i].Caption);
    chkUseActiveCell.Checked:=false;
    //TF calc
    SetFromList(lstMeasure.Items.Item[i].SubItems[0]);
    //Dose
    SetFromList(lstMeasure.Items.Item[i].SubItems[1]);
    //kV ratio
    SetFromList(lstMeasure.Items.Item[i].SubItems[2]);
    //TF ratio
    SetFromList(lstMeasure.Items.Item[i].SubItems[3]);
    //Time
    SetFromList(lstMeasure.Items.Item[i].SubItems[4]);
    //S1
    SetFromList(lstMeasure.Items.Item[i].SubItems[5]);
    //S2
    SetFromList(lstMeasure.Items.Item[i].SubItems[6]);
    //S3
    SetFromList(lstMeasure.Items.Item[i].SubItems[7]);
    //S4
    SetFromList(lstMeasure.Items.Item[i].SubItems[8]);
    //S1Cu
    SetFromList(lstMeasure.Items.Item[i].SubItems[9]);
    //S2Cu
    SetFromList(lstMeasure.Items.Item[i].SubItems[10]);
    //S3Cu
    SetFromList(lstMeasure.Items.Item[i].SubItems[11]);
    //S4Cu
    SetFromList(lstMeasure.Items.Item[i].SubItems[12]);

    iRow:=StrToInt(edtRow.Text);
    Inc(iRow);
    edtRow.Text:=IntToStr(iRow);

    edtCol.Text:=IntToStr(iCol);
  end;

  if Assigned(MyApp) then
    MyApp.ExcelSelectCell(StrToInt(edtRow.Text), StrToInt(edtCol.Text));
end;

procedure TfrmMain.btnEraseAllClick(Sender: TObject);
begin
  while (_subitems > 1) do begin
    btnEraseLastClick(Sender);
  end;
  InitiateLastExp();
  _firstTrig := True;
end;

procedure TfrmMain.btnEraseLastClick(Sender: TObject);
var
  I : Integer;
begin
  if _subitems > 1 then begin
    for I := 0 to (lvRing.Items.Count - 1) do begin
      lvRing.Items.Item[I].SubItems.Delete(_subitems);
    end;
    _subitems := _subitems - 1;
  end else begin
    InitiateLastExp();
    _firstTrig := True;
  end;
end;

procedure TfrmMain.btnFindCellClick(Sender: TObject);
var
  iRow, iCol: Integer;
  varCell: Variant;
begin
  if MyApp = nil then Exit;

  if not MyApp.CheckIfAccessable() then
  begin
    MessageDlg(format('"%s" is not accessable.', [Label2.Caption]), mtError, [mbOK], 0);
    Exit;
  end;

  if chkActiveSheet.Checked then
    varCell:=MyApp.FindFirst(edtCellValue.Text, false, iRow, iCol)
  else
    varCell:=MyApp.FindFirst(edtCellValue.Text, false, edtSheetName.Text, iRow, iCol);

  edtRow.Text := IntToStr(iRow);
  edtCol.Text := IntToStr(iCol);
  if MyApp.InstanceOK(varCell) then
  begin
    if MessageDlg(format('Found "%s" at Row:%d Col:%d', [edtCellValue.Text, iRow, iCol]) + #13+#10+'Do you want to search more cells?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      while MyApp.InstanceOK(varCell) do
      begin
        if chkActiveSheet.Checked then
          varCell:=MyApp.FindNext(edtCellValue.Text, false, varCell, iRow, iCol)
        else
          varCell:=MyApp.FindNext(edtCellValue.Text, false, edtSheetName.Text, varCell, iRow, iCol);

        if MyApp.InstanceOK(varCell) = false then Break;
        edtRow.Text := IntToStr(iRow);
        edtCol.Text := IntToStr(iCol);
        if MessageDlg(format('Found "%s" at Row:%d Col:%d', [edtCellValue.Text, iRow, iCol]) + #13+#10+'Do you want to search more cells?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
          Break;
      end;
    end;
  end
  else
    MessageDlg(format('Could not find "%s"', [edtCellValue.Text]), mtInformation, [mbOK], 0);
end;

procedure TfrmMain.btnGetValueClick(Sender: TObject);
var
  iRow, iCol: Integer;
begin
  if MyApp = nil then Exit;

  if not MyApp.CheckIfAccessable() then
  begin
    MessageDlg(format('"%s" is not accessable.', [Label2.Caption]), mtError, [mbOK], 0);
    Exit;
  end;

  if chkUseActiveCell.Checked then
    edtCellValue.Text := MyApp.GetCellValue()
  else
  begin
    iRow := StrToInt(edtRow.Text);
    iCol := StrToInt(edtCol.Text);
    if chkActiveSheet.Checked then
      edtCellValue.Text := MyApp.GetCellValue(iRow,iCol)
    else
      edtCellValue.Text := MyApp.GetCellValue(edtSheetName.Text, iRow,iCol);
  end;

end;

procedure TfrmMain.btnOpenClick(Sender: TObject);
begin
  if MyApp = nil then
  begin
    if chkOO.Checked then
      MyApp := COpenOffice.Create()
    else
      MyApp := CExcel.Create();
  end;

  chkCloseApp.Enabled := true;
  chkCloseApp.Checked := MyApp.CloseAppWhenDestroy;
  btnSave.Enabled := true;
  Label2.Caption:=Label2.Caption + ' v' + MyApp.GetVersion();
  lblFileName.Caption := '';
  chkExcel.Enabled:=true;

  chkOO.Enabled:=False;
  btnOpen.Enabled:=false;
  btnDumpGrid.Enabled:=true;

  if chkOO.Checked then
    OpenDialog1.Filter := 'Open Office calc files|*.SXC|Any files|*.*'
  else
    OpenDialog1.Filter := 'Microsoft Excel files|*.xls;*.xlsx|Any files|*.*';

  OpenDialog1.FilterIndex := 1;
  if (chkOpenfile.Checked)  and (OpenDialog1.Execute()) then
  begin
    MyApp.OpenFile(OpenDialog1.FileName);
    lblFileName.Caption := OpenDialog1.FileName;
  end
  else
    MyApp.NewFile();
end;

procedure TfrmMain.btnOpenfwClick(Sender: TObject);
begin
  if MyApp = nil then
  begin
    if chkOO.Checked then
      MyApp := COpenOffice.Create()
    else
      MyApp := CExcel.Create();
  end;

  chkCloseApp.Enabled := true;
  chkCloseApp.Checked := MyApp.CloseAppWhenDestroy;
  btnSave.Enabled := true;
  Label2.Caption:=Label2.Caption + ' v' + MyApp.GetVersion();
  lblFileName.Caption := '';


  chkOO.Enabled:=False;

  //btnDumpGrid.Enabled:=true;

  if chkOO.Checked then
    OpenDialog1.Filter := 'Open Office calc files|*.SXC|Any files|*.*'
  else
    OpenDialog1.Filter := 'Microsoft Excel files|*.xls;*.xlsx|Any files|*.*';

  OpenDialog1.FilterIndex := 1;
  if (chkOpenfilefw.Checked)  and (OpenDialog1.Execute()) then
  begin
    MyApp.OpenFile(OpenDialog1.FileName);
    lblFileName.Caption := OpenDialog1.FileName;
  end
  else
    MyApp.NewFile();

  btnOpenfw.Enabled:=false;
  chkExcelfw.Enabled:=true;
end;

procedure TfrmMain.chkKVcalcClick(Sender: TObject);
begin
  HandleDisplayCheck(pnlkVcalc, chkKVcalc);
end;

procedure TfrmMain.chkKVratioClick(Sender: TObject);
begin
  HandleDisplayCheck(pnlKVratio, chkKVratio);
end;

procedure TfrmMain.Delay(Num: longint);
var
tc: longint;
begin
tc :=GetTickCount;
repeat
Application.ProcessMessages;
until ((GetTickCount-tc) >= Num);
end;

procedure TfrmMain.StoreLogToFile(setup: boolean);
var
  logFile      : TextFile;
  fileExists   : boolean;
  fileIndex    : Integer;
  i            : Integer;
  str          : string;
begin
      if (setup = true) then begin
          // Find a filename that doesn't exist
          fileExists := true;
          fileIndex  := 0;
          while fileExists do begin
             _sLogToFileFilename :=  shortcuttools.edtSerial.Text + ' LogFile ' +
                                IntToStr(fileIndex) +
                               '.txt';
             if SysUtils.FileExists(_sLogToFileFilename, False) then
                 Inc(fileIndex)    // Filename exists, increase the number
             else
                 fileExists := false;    // Filename doesn't exist, use this filename
          end;

          // Create the file
          AssignFile(logFile, _sLogToFileFilename);
          ReWrite(logFile);
          CloseFile(logFile);

          // write the excel data header in the log
          str := '';
          i   := 0;
          while (i < ListFirmware.Columns.Count) do begin
              str := str + ListFirmware.Columns[i].Caption;
              str := str + #9;            // Tab between each caption
              Inc(i);
          end;
          Print(' ');
          Print('--Data header: ' + str);
          Print(' ');

          Clipboard.AsText := str;

      end else begin
          // Store the log data string in the file
          AssignFile(logFile, _sLogToFileFilename);
          Append(logFile);
          Write(logFile, edtCommLog.Lines.Text);
          CloseFile(logFile);

          // Clear the log
          //edtCommLog.Lines.Clear();
      end;
end;


procedure TfrmMain.GroupBox9Click(Sender: TObject);
begin

end;

{
 A - 1  - Measuring error
 B - 2  - Negative signal
 C - 3  - Low signal
 D - 4  - High signal
 E - 5  - Low voltage
 F - 6  - High voltage
 G - 7  - Low tf
 H - 8  - High tf
 I - 9  - Low HVL
 J - 10 - High HVL
 K - 11 - Exposure < delay
}
function TfrmMain.SetErrorCaption(input : string) : string;
begin
  if input = 'A' then begin
    SetErrorCaption := 'Measuring error';
  end else if input = 'B' then begin
    SetErrorCaption := 'Negative signal';
  end else if input = 'C' then begin
    SetErrorCaption := 'Low signal';
  end else if input = 'D' then begin
    SetErrorCaption := 'High signal';
  end else if input = 'E' then begin
    SetErrorCaption := 'Low voltage';
  end else if input = 'F' then begin
    SetErrorCaption := 'High voltage';
  end else if input = 'G' then begin
    SetErrorCaption := 'Low tf';
  end else if input = 'H' then begin
    SetErrorCaption := 'High tf';
  end else if input = 'I' then begin
    SetErrorCaption := 'Low HVL';
  end else if input = 'J' then begin
    SetErrorCaption := 'High HVL';
  end else if input = 'K' then begin
    SetErrorCaption := 'Exposure < delay';
  end else if input = 'M' then begin
    SetErrorCaption := 'Field Error';
  end;
end;

procedure TfrmMain.Signal2Change(Sender: TObject);
begin

end;

// Convert '.' to ','
function TfrmMain.ConvertPointToComma(inputString : string) : string;
begin
  // Convert '.' to ','
  ConvertPointToComma := AnsiReplaceStr(inputString, '.', ',')
end;

// Convert ',' to '.'
function TfrmMain.ConvertCommaToPoint(inputString : string) : string;
begin
  // Convert '.' to ','
  ConvertCommaToPoint := AnsiReplaceStr(inputString, ',', '.')
end;

procedure TfrmMain.Copytoclipboard1Click(Sender: TObject);
var
  i,j   : Integer;
  str : string;
begin
  i   := 0;
      str :=  ListFirmware.Items.Item[ListFirmware.Selected.Index].Caption + #9;
      while (i < ListFirmware.Columns.Count-1) do begin
        str := str + ListFirmware.Selected.SubItems[i];
        str := str + #9;            // Tab between each caption
        Inc(i);
     end;
  Clipboard.AsText := str;
end;

procedure TfrmMain.CheckPassFail(maxDevError, deviation : Extended; edt : TEdit);
begin
  if (deviation < (-1.0*maxDevError)) or
     (deviation > maxDevError) then begin
      // Deviation outside limit -> FAIL
      edt.text       := 'Fail';
      edt.font.Color := clRed;
  end else begin
      // Deviation inside limit -> PASS
      edt.text       := 'Pass';
      edt.font.Color := clGreen;
  end;
end;

 // Calulate a Ratio value between the highest and lowest if the 3 values
function TfrmMain.CalcRatioBetweenHighLow(value1, value2, value3 : Extended) : Extended;
var
  valueHighest : Extended;
  valueLowest  : Extended;
begin
  // Find highest and lowest values and calculate ratio between
  Result := 0;
  if (value1 > value2) then begin
    valueHighest := value1;
    valueLowest  := value2;
  end else begin
    valueHighest := value2;
    valueLowest  := value1;
  end;
  if (value3 > valueHighest) then
    valueHighest := value3;
  if (value3 < valueLowest) then
    valueLowest := value3;
  // Calculate Ratio between highest and lowest
  if (valueLowest <> 0) then
    Result := valueHighest / valueLowest;
end;

// Setup communication to the FLUKE instrument (for MAS calibration)
procedure TfrmMain.MASFlukeCommunicationSetup();
var
  deviceName     : Array[0..80] of Char;
  DCB            : TDCB;
  config         : String;
  commTimeouts   : TCommTimeouts;
  iniFile        : TextFile;
  iniTextLn      : String;
  iniFilename    : String;
  comPortNbr     : Integer;
  comPortStr     : String;
  searchStr      : String;
  indexSearch    : Integer;
  finishSearch   : Boolean;
  flukeModelStr  : String;
  flukeModel     : Integer;
  comPortNameReg : String;    // comPortName in registry
  pos            : Integer;
  okToTryPort    : Boolean;

  rxString       : array[1..80] of Ansichar;
  txString       : Ansistring;
  nbrBytes       : dword;

  reg            : TRegistry;
  regComNameList : Tstrings;
  regComName     : AnsiString;
  regComPort     : String;
  regComIndex    : Integer;
  regStatus      : boolean;
begin
  _FlukeComFileHndl := INVALID_HANDLE_VALUE;
  finishSearch      := false;

// Changed! Do not read COM port from ini-file. Instead read available COM
// ports from the Registry and try each of them
  // Read which comport to use form .ini file
//  iniFilename := 'measConfig.ini';
//  StrPCopy(deviceName, '');
//  comPortNbr := 0;
//  if (FileExists(iniFilename)) then begin
//    AssignFile(iniFile, iniFilename);
//    Reset(iniFile);
//    searchStr := 'Com port FLUKE instrument:';
//    while not (ContainsText(iniTextLn, searchStr)) and
//          not (Eof(iniFile)) do begin
//      ReadLn(iniFile, iniTextLn);
//    end;
//    CloseFile(iniFile);
//    // If search text is found, read the Com port number
//    if (ContainsText(iniTextLn, searchStr)) then begin
//      indexComPort := AnsiPos(':', iniTextLn);
//      if (indexComPort <> 0) then  begin
//         comPortStr   := AnsiRightStr(iniTextLn, Length(iniTextLn) - indexComPort);
//         comPortNbr   := StrToIntDef(comPortStr, 0);
//         Print('COM port for FLUKE: COM' + Format('%d', [comPortNbr]));

//         // Build the COM port string to open
//         if (comPortNbr < 10) then begin
//           comPortStr := 'COM' + IntToStr(comPortNbr);
//         end else begin
//           comPortStr := '\\.\COM' + IntToStr(comPortNbr);
//         end;
//         StrPCopy(deviceName, comPortStr);
//      end;
//    end;
//  end else begin
//    Print('Config file with Fluke com port does not exists: ' + iniFilename);
//  end;

  // Read FLUKE model number and Com Port Name from .ini file
  flukeModel     := 189;  // Default model
  comPortNameReg := '';   // Default com port name
  iniFilename := 'measConfig.ini';
  if (FileExists(iniFilename)) then begin
      AssignFile(iniFile, iniFilename);
    Reset(iniFile);
    //ComPortName
    searchStr := 'FLUKE instrument - ComPortName:';
    iniTextLn := '';
    while not (ContainsText(iniTextLn, searchStr)) and
          not (Eof(iniFile)) do begin
      ReadLn(iniFile, iniTextLn);
    end;
    // If search text is found, read the Com port name
    if (ContainsText(iniTextLn, searchStr)) then begin
      pos := AnsiPos('"', iniTextLn);
      comPortNameReg := AnsiRightStr(iniTextLn, Length(iniTextLn) - pos);
      comPortNameReg := AnsiReplaceStr(comPortNameReg, '"', '');  // Remove all " char
    end else begin
      Print('Cannot read FLUKE ComPortName from ini file');
    end;
    // Fluke model
    Reset(iniFile);
    searchStr := 'FLUKE instrument - Model:';
    iniTextLn := '';
    while not (ContainsText(iniTextLn, searchStr)) and
          not (Eof(iniFile)) do begin
      ReadLn(iniFile, iniTextLn);
    end;
    CloseFile(iniFile);
    // If search text is found, read the Fluke model
    if (ContainsText(iniTextLn, searchStr)) then begin
      indexSearch := AnsiPos(':', iniTextLn);
      if (indexSearch <> 0) then  begin
         flukeModelStr := AnsiRightStr(iniTextLn, Length(iniTextLn) - indexSearch);
         flukeModel    := StrToIntDef(flukeModelStr, 0);
         Print('Read FLUKE model: ' + Format('%d', [flukeModel]));
      end else begin
        Print('Cannot read FLUKE model from ini file, error 1');
      end;
    end else begin
      Print('Cannot read FLUKE model from ini file, error 2');
    end;
  end;
  Print('Used FLUKE model: ' + Format('%d', [flukeModel]));
  Print('Used Com port name for FLUKE: ' + comPortNameReg);

  // Find all active Com ports  from the Register
  reg            := TRegistry.Create;
  regComNameList := TstringList.Create;
  reg.RootKey    := HKEY_LOCAL_MACHINE;
  regStatus      := reg.OpenKeyReadOnly('hardware\devicemap\serialcomm');
  if (regStatus) then begin
    reg.GetValueNames(regComNameList);
  end;

  // Open communication to the FLUKE instrument, if a valid COM port extists
  // Go through all Com ports in the Register, and try to connect to the Fluke insrument
  for regComIndex := 0 to regComNameList.Count - 1 do begin
     // Check if correct port already found
    if (finishSearch = false) then begin

      // Look for the specific Com port name in Registry.
      // Or if no specific name is set, look that it not is Cobia port or BT port
      regComName := regComNameList.strings[regComIndex];
      okToTryPort := false;
      if (Length(comPortNameReg) > 0) then begin
        if (AnsiContainsText(regComName, comPortNameReg) = true) then
          okToTryPort := true;
      end else begin
        // No specific com port name is set, check all ports without BT or Cobia ports
        if (AnsiContainsText(regComName, 'USBSER') = false) and
           (AnsiContainsText(regComName, 'Bth') = false) then
          okToTryPort := true;
      end;

      if (okToTryPort = true) then begin

        Print('COM port for FLUKE: "' + comPortNameReg + '" type COM port in registry found: ' +
               reg.Readstring(regComNameList.strings[regComIndex]) +
               '. Try to setup the port and start communication to the instrument');

        // Found the Com port number from Data part of the Register.
        // Copy the digits number, the Data part of the Register can of some reasen sometimes
        // contain non-digit characters both before and after the the digit values
//        regComPort := reg.GetDataAsString(regComNameList.strings[regComIndex], false);
        regComPort := reg.Readstring(regComNameList.strings[regComIndex]); // Read the Data as a string, like reg.GetDataAsString
        regComPort := ExtractNumberInString(regComPort);
        comPortNbr := StrToInt(regComPort);

        // Build the COM port string to open
        if (comPortNbr < 10) then begin
          comPortStr := 'COM' + IntToStr(comPortNbr);
        end else begin
          comPortStr := '\\.\COM' + IntToStr(comPortNbr);
        end;
        StrPCopy(deviceName, comPortStr);

        _FlukeComFileHndl := CreateFile(deviceName,
                                        GENERIC_READ or GENERIC_WRITE,
                                        0, Nil,
                                        OPEN_EXISTING,
                                        FILE_ATTRIBUTE_NORMAL, 0);

        if (_FlukeComFileHndl <> INVALID_HANDLE_VALUE) then begin
          if (SetupComm(_FlukeComFileHndl, rxBufSize, txBufSize)) then begin
            if GetCommState(_FlukeComFileHndl, DCB) then begin

              // Configure the RS232 port. Baudrate depends in FLUKE model
              if (flukeModel < 200) then begin
                config := 'baud=9600 parity=n data=8 stop=1' + #0;   // Model 187 / 189
              end else begin
                config := 'baud=115200 parity=n data=8 stop=1' + #0; // Model 287 / 289
              end;
              Print('COM port for FLUKE: Port configuration: ' + config);
              if BuildCommDCB(@config[1], DCB) then begin
                if SetCommState(_FlukeComFileHndl, DCB) then begin
                  with commTimeouts do
                  begin
                    ReadIntervalTimeout         := 0;
                    ReadTotalTimeoutMultiplier  := 0;
                    ReadTotalTimeoutConstant    := 1000;
                    WriteTotalTimeoutMultiplier := 300;
                    WriteTotalTimeoutConstant   := 300;
                  end;

                  if SetCommTimeouts(_FlukeComFileHndl, commTimeouts) then begin
                    Print('COM port for FLUKE: Port setup correctly');

                    // Check if a FLUKE instrument is connected
                    if (_FlukeComFileHndl <> INVALID_HANDLE_VALUE) then begin
                      txString := 'ID' + #13;
                      Print('COM port for FLUKE; write command: ' + txString);
                      if not WriteFile(_FlukeComFileHndl, txString[1], Length(txString), nbrBytes, Nil) then
                        Print('COM port for FLUKE: Cannot write');
                      Sleep(300);
                      if (ReadFile(_FlukeComFileHndl, rxString, sizeof(rxString), nbrBytes, Nil)) then begin
                        if (nbrBytes > 1) then begin
                          Print('COM port for FLUKE; read answer: ' + rxString);
                          if AnsiContainsText(rxString, 'FLUKE') then begin
                            Print('COM port for FLUKE: FLUKE instrument is connected');
                            Print('COM port for FLUKE: Com port : ' + Format('%d', [comPortNbr]));
                            pnlFlukeConnected.Caption    := 'FLUKE: Connected';
                            pnlFlukeConnected.Font.Color := clGreen;
                            finishSearch := true;
                          end else
                            Print('COM port for FLUKE: Instrument not responses with FLUKE');
                        end else
                          Print('COM port for FLUKE: Too short answer');
                      end else
                        Print('COM port for FLUKE: No answer from FLUKE');
                    end;
                  end;
                end;
              end else begin
                Print('COM port for FLUKE: Not setup correctly');
              end;
            end;
          end;
        end else begin
          Print('COM port for FLUKE: is NOT valid');
        end;
      end else begin
        Print('COM port for FLUKE: Is NOT "' + comPortNameReg + '" type in registry: ' +
               reg.Readstring(regComNameList.strings[regComIndex]) +
               '. Not correct port for FLUKE');
      end;
    end;
  end;

    // Close port again if not setup correctly
  if (finishSearch = false) then begin
    if (_FlukeComFileHndl <> INVALID_HANDLE_VALUE) then
      CloseHandle(_FlukeComFileHndl);
    _FlukeComFileHndl := INVALID_HANDLE_VALUE;
    Print('COM port for FLUKE: FLUKE instrument is not connected!');
  end;

  // Free registry memory
  regComNameList.Free;
  reg.CloseKey;
  reg.Free;

  _FlukeComSetupFinished := true;
end;

// Read usedCurrent from the FLUKE instrument. Return current in unit A
function TfrmMain.ReadCurrentFromFluke(): Extended;
var
  rxString         : array[1..80] of Ansichar;
  txString         : Ansistring;
  nbrBytes         : dword;
  valueString      : Ansistring;
  subString        : Ansistring;
begin
  Result := 0;
  if (pnlFlukeConnected.Font.Color = clGreen) then begin
    // Ask Fluke instrument for displayed value
    txString := 'QM' + #13;
    Print('FLUKE: Write command: ' + txString);
    if not WriteFile(_FlukeComFileHndl, txString[1], Length(txString), nbrBytes, Nil) then
      Print('FLUKE: Cannot write command');
    Sleep(300);
    // Read and interpret the answer
    if ReadFile(_FlukeComFileHndl, rxString, sizeof(rxString), nbrBytes, Nil) then begin
      if (nbrBytes > 3) then begin
        Print('FLUKE: Read answer: ' + rxString);
        subString := AnsiLeftStr(rxString, nbrBytes);
        // Sometimes the first character is the digit '0', remove it then
        if (subString[1] in ['0']) then
          subString := AnsiRightStr(subString, nbrBytes - 2);
        Print('FLUKE: subString: ' + subString);
        valueString := ExtractNumberInString(subString);
        // The value is detected, convert to unit float (in unit A)
        Result      := SafeFloatConvert(valueString);
        Print('FLUKE: valueString: ' + valueString);
        Print('FLUKE: Result before prefix adjustment : ' + FloatToStr(Result));
        // Adjust value depending of unit prefix
        if (AnsiContainsStr(subString, 'mA')) then
          Result := Result * 1e-3;
        if (AnsiContainsStr(subString, 'uA')) then
          Result := Result * 1e-6;
        Print('FLUKE: Result after prefix adjustment : ' + FloatToStr(Result));
      end else
         Print('FLUKE: Too short answer');
    end else
       Print('FLUKE: No answer received');
  end;
end;

// Calibrate adjustment iMAS inut
procedure TfrmMain.MASAdjust(measuredADCMeanValue : string);
var
  buttonSelected   : Integer;
  gainFactor       : Extended;
  meanCobiaValue, meanFlukeValue        : Extended;
  valueCobia1, valueCobia2, valueCobia3 : Extended;
  valueFluke1, valueFluke2, valueFluke3 : Extended;
  calcMAVal        : Extended;
  valueRatioCobia, valueRatioFluke : Extended;
  storingCalString : String;
  usedCurrent      : Extended;
  validCurrent     : Integer;
begin
  // iMAS calibration adjustment
  if ( ((_FinalCalc = True) and (_MasAdjust > 0) ) or (_MasAdjust = 0)) then begin

    // Read usedCurrent from the FLUKE instrument
    usedCurrent := ReadCurrentFromFluke();  // Get current in unit A
    usedCurrent := usedCurrent * 1000;      // Changed unit to mA

    if (_MasAdjust = 6) then begin      // 75 mA
      edtMASAdjustADCMean75mA_1.Text := measuredADCMeanValue;
      edtMASAdjustCurrent75mA_1.Text := Format('%.2f', [usedCurrent]);
      frmMain.Update();  // Update the form

      // Check if correct current value is set (mA)
      validCurrent := CheckValidCurrent(75, usedCurrent);
    end;
    if (_MasAdjust = 5) then begin      // 75 mA
      edtMASAdjustADCMean75mA_2.Text := measuredADCMeanValue;
      edtMASAdjustCurrent75mA_2.Text := Format('%.2f', [usedCurrent]);
      frmMain.Update();  // Update the form

      // Check if correct current value is set (mA)
      validCurrent := CheckValidCurrent(75, usedCurrent);
    end;
    if (_MasAdjust = 4) then begin       // 75 mA
      edtMASAdjustADCMean75mA_3.Text := measuredADCMeanValue;
      edtMASAdjustCurrent75mA_3.Text := Format('%.2f', [usedCurrent]);

      // Check if correct current value is set (mA)
      validCurrent := CheckValidCurrent(75, usedCurrent);

      if (validCurrent = 0) then begin

        // Last value; calculate gain

        valueCobia1 := SafeFloatConvert(edtMASAdjustADCMean75mA_1.Text);
        valueCobia2 := SafeFloatConvert(edtMASAdjustADCMean75mA_2.Text);
        valueCobia3 := SafeFloatConvert(edtMASAdjustADCMean75mA_3.Text);
        valueFluke1 := SafeFloatConvert(edtMASAdjustCurrent75mA_1.Text);
        valueFluke2 := SafeFloatConvert(edtMASAdjustCurrent75mA_2.Text);
        valueFluke3 := SafeFloatConvert(edtMASAdjustCurrent75mA_3.Text);

        // Calculate mean value of the measured values.
        meanCobiaValue := (valueCobia1 + valueCobia2 + valueCobia3) / 3;  // Mean value of Cobia output
        edtMASAdjustADCMean75mA_MeanVal.Text := Format('%4.4f', [meanCobiaValue]);
        meanFlukeValue := (valueFluke1 + valueFluke2 + valueFluke3) / 3;  // Mean value of Fluke output
        edtMASAdjustCurrent75mA_MeanVal.Text := Format('%4.3f', [meanFlukeValue]);

        // Calculate calibration factor for input 75 mA
        // Note: Increase the gain factor with 0.75% due to non-linear problem, see bugg 6632
        calcMAVal := meanCobiaValue * (3.1 / 1024) * 1000;    // Calculate corresponding mA value
        gainFactor := 0;
        if (calcMAVal > 0) then
          gainFactor := meanFlukeValue / calcMAVal;   // Gain factor from input current  75 mA
        gainFactor := gainFactor * 1.0075;   // Increase the gain factor with 0.75% due to non-linear problem, see bugg 6632
        edtMASAdjustGainFactor75mA.Text := Format('%1.6f', [gainFactor]);

        // Calulate a Ratio value between the highest and lowest if the 3 values
        valueRatioCobia := CalcRatioBetweenHighLow(valueCobia1, valueCobia2, valueCobia3);
        valueRatioFluke := CalcRatioBetweenHighLow(valueFluke1, valueFluke2, valueFluke3);

        // Check if the gain factor is ok, within 30%
        // Check that the different Cobia values not differ more than 2 %
        // Check that the different FLUKE values not differ more than 1 %
        // Check that the  calculated Cobia-mA value is 75 mA within 10%
        // Check that the  calculated mean value from FLUKE is 75 mA within 10%
        if ((gainFactor > 0.039) or (gainFactor < 0.021))         or
           ((valueRatioCobia < 0.98) or (valueRatioCobia > 1.02)) or
           ((valueRatioFluke < 0.91) or (valueRatioFluke > 1.01)) or
           ((calcMAVal < 75*0.9) or (calcMAVal < 75*1.1))         or
           ((meanFlukeValue < 75*0.9) or (meanFlukeValue > 75*1.1)) then begin
          lblMASAdjustFailure.Visible      := true;
          edtMASAdjustGainFactor75mA.Color := clRed;
        end;

        frmMain.Update();  // Update the form

        // View dialog that set power on 750 mA
        buttonSelected := MessageDlg('Connect to the 10 A input at the FLUKE instrument.' + #13#10 +
                                     'Set the CUR box to 750 mA.' + #13#10 +
                                     'Wait until the current value in the FLUKE instrument is stable.' + #13#10  +
                                     'Press OK button when ready.', mtInformation, [mbOK], 0);
      end;
    end;
    if (_MasAdjust = 3) then begin      // 750 mA
      edtMASAdjustADCMean750mA_1.Text := measuredADCMeanValue;
      edtMASAdjustCurrent750mA_1.Text := Format('%.1f', [usedCurrent]);
      frmMain.Update();  // Update the form

      // Check if correct current value is set (mA)
      validCurrent := CheckValidCurrent(750, usedCurrent);
    end;
    if (_MasAdjust = 2) then begin      // 750 mA
      edtMASAdjustADCMean750mA_2.Text := measuredADCMeanValue;
      edtMASAdjustCurrent750mA_2.Text := Format('%.1f', [usedCurrent]);
      frmMain.Update();  // Update the form

      // Check if correct current value is set (mA)
      validCurrent := CheckValidCurrent(750, usedCurrent);
    end;
    if (_MasAdjust = 1) then begin       // 750 mA
      edtMASAdjustADCMean750mA_3.Text := measuredADCMeanValue;
      edtMASAdjustCurrent750mA_3.Text := Format('%.1f', [usedCurrent]);

      // Check if correct current value is set (mA)
      validCurrent := CheckValidCurrent(750, usedCurrent);

      if (validCurrent = 0) then begin

        // Last value; calculate gain

        valueCobia1 := SafeFloatConvert(edtMASAdjustADCMean750mA_1.Text);
        valueCobia2 := SafeFloatConvert(edtMASAdjustADCMean750mA_2.Text);
        valueCobia3 := SafeFloatConvert(edtMASAdjustADCMean750mA_3.Text);
        valueFluke1 := SafeFloatConvert(edtMASAdjustCurrent750mA_1.Text);
        valueFluke2 := SafeFloatConvert(edtMASAdjustCurrent750mA_2.Text);
        valueFluke3 := SafeFloatConvert(edtMASAdjustCurrent750mA_3.Text);

        // Calculate mean value of the measured values.
        meanCobiaValue := (valueCobia1 + valueCobia2 + valueCobia3) / 3;  // Mean value of Cobia output
        edtMASAdjustADCMean750mA_MeanVal.Text := Format('%4.4f', [meanCobiaValue]);
        meanFlukeValue := (valueFluke1 + valueFluke2 + valueFluke3) / 3;  // Mean value of Fluke output
        edtMASAdjustCurrent750mA_MeanVal.Text := Format('%4.2f', [meanFlukeValue]);

        // Calculate calibration factor for input 750 mA
        // Note: Increase the gain factor with 0.75% due to non-linear problem, see bugg 6632
        calcMAVal := meanCobiaValue * (3.1 / 1024) * 1000;    // Calculate corresponding mA value
        gainFactor := 0;
        if (calcMAVal > 0) then
          gainFactor := meanFlukeValue / calcMAVal;   // Gain factor from input current  750 mA
        gainFactor := gainFactor * 1.0075;   // Increase the gain factor with 0.75% due to non-linear problem, see bugg 6632
        edtMASAdjustGainFactor750mA.Text := Format('%1.6f', [gainFactor]);

        // Calulate a Ratio value between the highest and lowest if the 3 values
        valueRatioCobia := CalcRatioBetweenHighLow(valueCobia1, valueCobia2, valueCobia3);
        valueRatioFluke := CalcRatioBetweenHighLow(valueFluke1, valueFluke2, valueFluke3);

        // Check if the gain factor is ok, within 30%
        // Check that the different Cobia values not differ more than 2%
        // Check that the different FLUKE values not differ more than 1%
        // Check that the  calculated Cobia-mA value is 750 mA within 10%
        // Check that the  calculated mean value from FLUKE is 750 mA within 10%
        if ((gainFactor > 0.39) or (gainFactor < 0.21))           or
           ((valueRatioCobia < 0.98) or (valueRatioCobia > 1.02)) or
           ((valueRatioFluke < 0.91) or (valueRatioFluke > 1.01)) or
           ((calcMAVal < 750*0.9) or (calcMAVal < 750*1.1))       or
           ((meanFlukeValue < 750*0.9) or (meanFlukeValue > 750*1.1)) then begin
          lblMASAdjustFailure.Visible       := true;
          edtMASAdjustGainFactor750mA.Color := clRed;
        end;

        // Last adjust iMAS value -> check gain and write to Cobia
        if (lblMASAdjustFailure.Visible = False) then begin
          storingCalString := 'nvmem;set;calibmas;0;' + edtMASAdjustGainFactor750mA.Text;
          SendCommand(storingCalString);
          Sleep(400);
          storingCalString := 'nvmem;set;calibmas;1;' + edtMASAdjustGainFactor75mA.Text;
          SendCommand(storingCalString);
          Sleep(800);

          // Send command to remove CRC check file - to prevent CRC error
          SendCommand_EraseCalCRC();
          Sleep(100);

          // Readup stored data, to verify
          highMasCalValEdit.Text := '';
          lowMasCalValEdit.Text  := '';
          SendCommand(('nvmem;get;calibmas'));
        end;

        frmMain.Update();  // Update the form
        _MasAdjust := 0;   // Stop adjustment
      end;
    end;

    // User give Cancel
    if (validCurrent = 2) then begin
       _MasAdjust := 0;
    end;

    if (_MasAdjust = 0) then begin
      // End of MAS adjustment


      // Activate peak on/off trig again
      // Do not activate peak on/off trig until MAS Calibration is done
//      SendCommand('ms_trig on peak');
//      Sleep(100);
//      SendCommand('ms_trig off peak');
//      Sleep(100);

      validCurrent := 0;
      lblMASAdjustmentWorking.Visible := false;
      frmMain.Update();  // Update the form
    end;

    if (_MasAdjust >= 0) then begin
      frmMain.Update();  // Update the form
      if (_MasAdjust > 0) then
        MakeMASTrig();     // Do next trig
    end;

    if (_MasAdjust > -1) and (validCurrent = 0) then
       _MasAdjust := _MasAdjust - 1;
  end;
end;

// Returns 1000 % if error (devision by 0)
function TfrmMain.CalcDeviation(reference, measValue : Extended) : Extended;
begin
  Result := 1000;
  if (measValue > 0) then begin
     Result := (1.0 - (reference / measValue)) * 100.0;
  end;
end;

// Check if the set current is "same" as the read value in FLUKE
// Returns 0 if no error, 1 if error but redo the measurement, 2 if cancel
function TfrmMain.CheckValidCurrent(reference, measValue : Extended) : Integer;
var
  deviation      : Extended;
  buttonSelected : Integer;
begin
  CheckValidCurrent := 0;

  // Calculate the deviation
  deviation := CalcDeviation(reference, measValue);

  // The deviation mus be as most 10 %
  if (deviation >  20) or
     (deviation < -20) then begin
     // Current setting not ok
     buttonSelected := MessageDlg('Error Wrong current set!' + #13#10 +
                                  'Set the CUR box to ' + Format('%.0f', [reference]) + ' mA.' + #13#10 +
                                  'Wait until the current value in the FLUKE instrument is stable.' + #13#10  +
                                  'Press OK button when ready or Cancel to stop.', mtError, [mbOK, mbCancel], 0);
     if (buttonSelected = mrOk) then begin
       CheckValidCurrent := 1;
     end else begin
       CheckValidCurrent := 2;
     end;
   end;
end;

procedure TfrmMain.MASCalib(measuredCurrentValue : string);
var
  buttonSelected   : Integer;
  usedCurrent      : Extended;
  deviation        : Extended;
  meanValue        : Extended;
  validCurrent     : Integer;
begin
         // iMAS calibration adjustment
  if ( ((_FinalCalc = True) and (_MasCalib > 0) ) or (_MasCalib = 0)) then begin

    validCurrent := 0;

    // Read usedCurrent from the FLUKE instrument
    usedCurrent := ReadCurrentFromFluke();  // Get current in unit A
    usedCurrent := usedCurrent * 1000;      // Current in mA

    if (_MasCalib = 6) then begin      // 5 mA, first time, bug 6633
        edtMasCalibrationMeasCur5mA.Text := measuredCurrentValue;
        edtMasCalibrationRefCur5mA.Text  := Format('%.3f', [usedCurrent]);
        _MasCalib5mA_1                   := SafeFloatConvert(measuredCurrentValue);
    end;
    if (_MasCalib = 5) then begin      // 5 mA, second time, bug 6633
      edtMasCalibrationMeasCur5mA.Text := measuredCurrentValue;
      edtMasCalibrationRefCur5mA.Text  := Format('%.3f', [usedCurrent]);
      _MasCalib5mA_2                   := SafeFloatConvert(measuredCurrentValue);
    end;
    if (_MasCalib = 4) then begin      // 5 mA, third time, bug 6633
      _MasCalib5mA_3 := SafeFloatConvert(measuredCurrentValue);
      // Last time with 5 mA, calculate meanValue
      meanValue := (_MasCalib5mA_1 + _MasCalib5mA_2 + _MasCalib5mA_3) / 3;

      edtMasCalibrationMeasCur5mA.Text := Format('%.4f', [meanValue]);
      edtMasCalibrationRefCur5mA.Text  := Format('%.3f', [usedCurrent]);

      // Check if correct current value is set (mA)
      validCurrent := CheckValidCurrent(5, usedCurrent);

      if (validCurrent = 0) then begin
        // Calculate deviation
        deviation := CalcDeviation(usedCurrent, SafeFloatConvert(measuredCurrentValue));
        edtMasCalibrationDev5mA.Text := Format('%.1f', [deviation]);

        // Check pass/fail criteria
        CheckPassFail(MAX_DEVIATION_ERROR_MAS_CAL, deviation, edtMasCalibrationPass5mA);

        // Prepare for next current (75 mA)
        buttonSelected := MessageDlg('Connect to the 400 mA input at the FLUKE instrument.' + #13#10 +
                                     'Set the CUR box to 75 mA.' + #13#10 +
                                     'Set the CUR box to Power ON.' + #13#10 +
                                     'Wait until the current value in the FLUKE instrument is stable.' + #13#10  +
                                     'Press OK button when ready.', mtInformation, [mbOK], 0);
      end;
    end;
    if (_MasCalib = 3) then begin      // 75 mA
      edtMasCalibrationMeasCur75mA.Text := measuredCurrentValue;
      edtMasCalibrationRefCur75mA.Text  := Format('%.2f', [usedCurrent]);

      // Check if correct current value is set (mA)
      validCurrent := CheckValidCurrent(75, usedCurrent);

      if (validCurrent = 0) then begin
        // Calculate deviation
        deviation := (1.0 - (usedCurrent / SafeFloatConvert(measuredCurrentValue))) * 100.0;
        edtMasCalibrationDev75mA.Text := Format('%.1f', [deviation]);

        // Check pass/fail criteria
        CheckPassFail(MAX_DEVIATION_ERROR_MAS_CAL, deviation, edtMasCalibrationPass75mA);

        // Prepare for next current (250 mA)
        buttonSelected := MessageDlg('Connect to the 400 mA input at the FLUKE instrument.' + #13#10 +
                                     'Set the CUR box to 250 mA.' + #13#10 +
                                     'Set the CUR box to Power ON.' + #13#10 +
                                     'Wait until the current value in the FLUKE instrument is stable.' + #13#10  +
                                     'Press OK button when ready.', mtInformation, [mbOK], 0);
      end;
    end;
    if (_MasCalib = 2) then begin      // 250 mA
      edtMasCalibrationMeasCur250mA.Text := measuredCurrentValue;
      edtMasCalibrationRefCur250mA.Text  := Format('%.2f', [usedCurrent]);

            // Check if correct current value is set (mA)
      validCurrent := CheckValidCurrent(250, usedCurrent);

      if (validCurrent = 0) then begin
        // Calculate deviation
        deviation := CalcDeviation(usedCurrent, SafeFloatConvert(measuredCurrentValue));
        edtMasCalibrationDev250mA.Text := Format('%.1f', [deviation]);

        // Check pass/fail criteria
        CheckPassFail(MAX_DEVIATION_ERROR_MAS_CAL, deviation, edtMasCalibrationPass250mA);

        // Prepare for next current (750 mA)
        buttonSelected := MessageDlg('Connect to the 10 A input at the FLUKE instrument.' + #13#10 +
                                     'Set the CUR box to 750 mA.' + #13#10 +
                                     'Set the CUR box to Power ON.' + #13#10 +
                                     'Wait until the current value in the FLUKE instrument is stable.' + #13#10  +
                                     'Press OK button when ready.', mtInformation, [mbOK], 0);
      end;
    end;
    if (_MasCalib = 1) then begin      // 750 mA
      edtMasCalibrationMeasCur750mA.Text := measuredCurrentValue;
      edtMasCalibrationRefCur750mA.Text  := Format('%.1f', [usedCurrent]);

            // Check if correct current value is set (mA)
      validCurrent := CheckValidCurrent(750, usedCurrent);

      if (validCurrent = 0) then begin
        // Calculate deviation
        deviation := CalcDeviation(usedCurrent, SafeFloatConvert(measuredCurrentValue));
        edtMasCalibrationDev750mA.Text := Format('%.1f', [deviation]);

        // Check pass/fail criteria
        CheckPassFail(MAX_DEVIATION_ERROR_MAS_CAL, deviation, edtMasCalibrationPass750mA);

        _MasCalib := 0;     // Stop the calibration
      end;
    end;

    // User give Cancel
    if (validCurrent = 2) then begin
       _MasCalib := 0;
    end;

    if (_MasCalib = 0) then begin
      // End of MAS adjustment
      // Activate peak on/off trig again
//      SendCommand('ms_trig on peak');
//      Sleep(100);
//      SendCommand('ms_trig off peak');
//      Sleep(100);
    SendTrigCommand(TRIG_PEAK, 0);

      validCurrent := 0;
      lblMASCalibrationWorking.Visible := false;
    end;

    if (_MasCalib >= 0) then begin
      frmMain.Update();  // Update the form
      if (_MasCalib > 0) then
        MakeMASTrig();     // Do next trig
    end;

    if (_MasCalib > -1) and (validCurrent = 0) then
       _MasCalib := _MasCalib - 1;
  end;
end;

// Check the storage of the iMAS calibration
procedure TfrmMain.MASCheckCalibStorage();
var
  storageHigh : string;
  storageLow  : string;
  readupHigh  : string;
  readupLow   : string;
begin
  // Check that all readup Electrometer cal factors are readup. Also check that EmAdjust is set->i.e. Em value are adjusted
  if ((highMasCalValEdit.Text <> '') and
      (lowMasCalValEdit.Text <> '') and
      (edtMASAdjustGainFactor75mA.Text <> '') and
      (edtMASAdjustGainFactor750mA.Text <> '')) then begin
      // EmAdjust is done and the readup of electromter cal factors are done

      // Only check 5 decimals
      storageHigh := Format('%.4f', [SafeFloatConvert(edtMASAdjustGainFactor75mA.Text)]);
      storageLow  := Format('%.4f', [SafeFloatConvert(edtMASAdjustGainFactor750mA.Text)]);
      readupHigh  := Format('%.4f', [SafeFloatConvert(highMasCalValEdit.Text)]);
      readupLow   := Format('%.4f', [SafeFloatConvert(lowMasCalValEdit.Text)]);

      // Check if the readupdata is the same as the stored
      if (storageHigh <> readupHigh) or
         (storageLow <> readupLow) then begin
        lblMASAdjustStorageFailure.Visible := true;
      end else begin
        lblMASAdjustStorageOk.Visible := true;
      end;
  end;
end;

// Check the storage of the electrometer calibration
procedure TfrmMain.EmCheckCalibStorage();
var
  storageHigh : string;
  storageLow  : string;
  readupHigh  : string;
  readupLow   : string;
begin
  // Check that all readup Electrometer cal factors are readup. Also check that EmAdjust is set->i.e. Em value are adjusted
  if ((highElChargeCalValEdit.Text <> '') and
      (lowElChargeCalValEdit.Text <> '') and
      (edEmAdjustmenttHsGain.Text <> '') and
      (edEmAdjustmenttLsGain.Text <> '')) then begin
      // EmAdjust is done and the readup of electromter cal factors are done

      // Only check 5 decimals
      storageHigh := Format('%.5f', [SafeFloatConvert(edEmAdjustmenttHsGain.Text)]);
      storageLow  := Format('%.5f', [SafeFloatConvert(edEmAdjustmenttLsGain.Text)]);
      readupHigh  := Format('%.5f', [SafeFloatConvert(highElChargeCalValEdit.Text)]);
      readupLow   := Format('%.5f', [SafeFloatConvert(lowElChargeCalValEdit.Text)]);

      // Check if the readupdata is the same as the stored
      if (storageHigh <> readupHigh) or
         (storageLow <> readupLow) then begin
        lblEmAdjustmentStorageFailure.Visible := true;
      end else begin
        lblEmStorageOk.Visible := true;
      end;
  end;
end;

// Calibrate adjustment electrometer input
procedure TfrmMain.EmAdjust(measuredCurrentValue : string);
var
  buffer           : packed array[0..40] of char;
  gainFactor       : Extended;
  meanValue        : Extended;
  value1           : Extended;
  value2           : Extended;
  value3           : Extended;
  valueRatio       : Extended;
  storingCalString : String;
begin
  // Emm calibration
  if ( ((_FinalCalc = True) and (_EmAdjust > 0) ) or (_EmAdjust = 0)) then begin
    measuredCurrentValue := ConvertCommaToPoint(measuredCurrentValue); // Convert back to point
    if (_EmAdjust = 6) then
      edtEmAdjustmentHsCurrent_1.Text := measuredCurrentValue;
    if (_EmAdjust = 5) then
      edtEmAdjustmentHsCurrent_2.Text := measuredCurrentValue;
    if (_EmAdjust = 4) then begin
      // Calibration with low sensitivity finished
      edtEmAdjustmentHsCurrent_3.Text := measuredCurrentValue;

      value1 := SafeFloatConvert(edtEmAdjustmentHsCurrent_1.Text);
      value2 := SafeFloatConvert(edtEmAdjustmentHsCurrent_2.Text);
      value3 := SafeFloatConvert(edtEmAdjustmentHsCurrent_3.Text);

      // Calculate mean value of the measured values. Calculate calibration factor for input 50 nA
      meanValue := (value1 + value2 + value3) / 3;  // Mean value in pA
      gainFactor := 50E3 / meanValue;   // Gain factor from input current  50 nA
      edEmAdjustmenttHsGain.Text := Format('%.10f', [gainFactor] );
      highElChargeCalValEdit.Text := edEmAdjustmenttHsGain.Text;

      // Find highest and lowest values and calculate ratio between
      valueRatio := CalcRatioBetweenHighLow(value1, value2, value3);

      // Check if the gain factor is ok, within 3%
      // Check that the different values not differ more than 2 %
      if (gainFactor < 0.7) or (gainFactor > 1.3) or
         (valueRatio < 0.98) or (valueRatio > 1.02) then begin
        lblEmAdjustmentFailure.Visible := true;
        edEmAdjustmenttHsGain.Color    := clRed;
      end;

      frmMain.Update();  // Update the form

      // Switch to low sensitivity
      SendCommand('ms_range_ext;auto;0');
      Sleep(100);
      SendCommand('ms_range_ext;7');

      // Set 10 uA
      buffer := 'V1.0E-5X'; // Value 10 uA
      IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 20, NLend);
      Sleep(500);    // Wait a while so the signal has time to changed
    end;
    if (_EmAdjust = 3) then
      edtEmAdjustmentLsCurrent_1.Text := measuredCurrentValue;
    if (_EmAdjust = 2) then
      edtEmAdjustmentLsCurrent_2.Text := measuredCurrentValue;
    if (_EmAdjust = 1) then begin
      // The electrometer calibration if finnished.
      edtEmAdjustmentLsCurrent_3.Text := measuredCurrentValue;

      value1 := SafeFloatConvert(edtEmAdjustmentLsCurrent_1.Text);
      value2 := SafeFloatConvert(edtEmAdjustmentLsCurrent_2.Text);
      value3 := SafeFloatConvert(edtEmAdjustmentLsCurrent_3.Text);

      // Calculate mean value of the measured values. Calculate calibration factor for input 10 uA
      meanValue := (value1 + value2 + value3) / 3;  // Mean value in pA
      gainFactor := 10E6 / meanValue;   // Gain factor from input current  10 uA
      edEmAdjustmenttLsGain.Text := Format('%.10f', [gainFactor]);
      lowElChargeCalValEdit.Text := edEmAdjustmenttLsGain.Text;

      // Find highest and lowest values and calculate ratio between
      valueRatio := CalcRatioBetweenHighLow(value1, value2, value3);

      // Check if the gain factor is ok, within 3%
      // Check that the different values not differ more than 2 %
      if (gainFactor < 0.7) or (gainFactor > 1.3)  or
         (valueRatio < 0.98) or (valueRatio > 1.02) then begin
        lblEmAdjustmentFailure.Visible := true;
        edEmAdjustmenttLsGain.Color    := clRed;
      end;

     frmMain.Update();  // Update the form

      // Store the new calibration values to Cobia (if value ok)
      if (lblEmAdjustmentFailure.Visible = False) then begin
        storingCalString := 'nvmem;set;calibext;1;' + edEmAdjustmenttHsGain.Text;
        SendCommand(storingCalString);
        Sleep(400);
        storingCalString := 'nvmem;set;calibext;0;' + edEmAdjustmenttLsGain.Text;
        SendCommand(storingCalString);
        Sleep(800);

        // Send command to remove CRC check file - to prevent CRC error
        SendCommand_EraseCalCRC();
        Sleep(100);

        // Readup stored data, to verify
        lowElChargeCalValEdit.Text  := '';
        highElChargeCalValEdit.Text := '';
        SendCommand(('nvmem;get;calibext'));
      end;

      _EmAdjust := 0;   // End calibration
    end;
    if (_EmAdjust = 0) then begin
      // End calibration (and reset)

      // Only do the reset if Calibrator is found
      if (_EmCalibratorFound) then begin

          // Calibrator: Set operate OFF and set a mode with low noise
          buffer := 'O0X';
          IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 5, NLend);
          buffer := 'F1X';       // Ampere
          IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 5, NLend);
          buffer := 'V5.0E-8X';  // Value 50 nA
          IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 20, NLend);
          Sleep(500);

          // Activate peak on/off trig again
//          SendCommand('ms_trig on peak');
//          Sleep(100);
//          SendCommand('ms_trig off peak');
//          Sleep(100);
          SendTrigCommand(TRIG_PEAK, 0);

          // Switch on autorange and set high sensibility again. And enable offset update
          SendCommand('ms_range_ext;auto;1');
          Sleep(100);
          SendCommand('ms_range_ext;1');
          Sleep(100);
//     SendCommand('debug_offset_update;on');  // Do not enable offset update again during emm calibration / check

          lblEmAdjustmentWorking.Visible := false;
      end;
    end;
    _EmAdjust := _EmAdjust - 1;     // Will stop at -1
    frmMain.Update();          // Update the form
  end;
end;

// Check measurement of the electrometer input
procedure TfrmMain.EmCalib(measuredCurrentChargeValue : string);
var
  buffer    : packed array[0..40] of char;
  deviation : Extended;
begin
  // Emm check
  measuredCurrentChargeValue := ConvertCommaToPoint(measuredCurrentChargeValue); // Convert back to point
  if ( ((_FinalCalc = True) and (_EmCalibr > 0)) or (_EmCalibr = 0) ) then begin
    if (_EmCalibr = 10) then begin    // 750 pA
      edtEmCalibrationCurrVal750pA.Text := measuredCurrentChargeValue;

      // Calculate deviation (in pA)
      deviation := CalcDeviation(750, SafeFloatConvert(measuredCurrentChargeValue));
      edtEmCalibrationCurrDev750pA.Text := Format('%.1f', [deviation]);

      // Check pass/fail criteria
      CheckPassFail(MAX_DEVIATION_ERROR_EMM_CAL, deviation, edtEmCalibrationCurrPass750pA);

      frmMain.Update();  // Update the form

      // Set 7.5 nA
      buffer := 'V7.5E-9X';
      IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 20, NLend);
      Sleep(500);    // Wait a while so the signal has time to changed
    end;
    if (_EmCalibr = 9) then begin     // 7.5 nA
      edtEmCalibrationCurrVal7nA.Text := measuredCurrentChargeValue;

      // Calculate deviation (in pA)
      deviation := CalcDeviation(7.50e3, SafeFloatConvert(measuredCurrentChargeValue));
      edtEmCalibrationCurrDev7nA.Text := Format('%.1f', [deviation]);

      // Check pass/fail criteria
      CheckPassFail(MAX_DEVIATION_ERROR_EMM_CAL, deviation, edtEmCalibrationCurrPass7nA);

      frmMain.Update();  // Update the form

      // Set 75 nA
      buffer := 'V7.5E-8X';
      IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 20, NLend);
      Sleep(500);    // Wait a while so the signal has time to changed
    end;
    if (_EmCalibr = 8) then begin       // 75 nA
      edtEmCalibrationCurrVal75nA.Text := measuredCurrentChargeValue;

      // Calculate deviation (in pA)
      deviation := CalcDeviation(75.0e3, SafeFloatConvert(measuredCurrentChargeValue));
      edtEmCalibrationCurrDev75nA.Text := Format('%.1f', [deviation]);

      // Check pass/fail criteria
      CheckPassFail(MAX_DEVIATION_ERROR_EMM_CAL, deviation, edtEmCalibrationCurrPass75nA);

      frmMain.Update();  // Update the form

      // Set 750 nA
      buffer := 'V7.5E-7X';
      IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 20, NLend);
      Sleep(500);    // Wait a while so the signal has time to changed
    end;
    if (_EmCalibr = 7) then begin      // 750 nA
      edtEmCalibrationCurrVal750nA.Text := measuredCurrentChargeValue;

      // Calculate deviation (in pA)
      deviation := CalcDeviation(750e3, SafeFloatConvert(measuredCurrentChargeValue));
      edtEmCalibrationCurrDev750nA.Text := Format('%.1f', [deviation]);

      // Check pass/fail criteria
      CheckPassFail(MAX_DEVIATION_ERROR_EMM_CAL, deviation, edtEmCalibrationCurrPass750nA);

      frmMain.Update();  // Update the form

      // Set 7500 nA
      buffer := 'V7.5E-6X';
      IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 20, NLend);
      Sleep(500);    // Wait a while so the signal has time to changed
    end;
    if (_EmCalibr = 6) then begin      // 7500 nA
      edtEmCalibrationCurrVal7500nA.Text := measuredCurrentChargeValue;

      // Calculate deviation (in pA)
      deviation := CalcDeviation(7500e3, SafeFloatConvert(measuredCurrentChargeValue));
      edtEmCalibrationCurrDev7500nA.Text := Format('%.1f', [deviation]);

      // Check pass/fail criteria
      CheckPassFail(MAX_DEVIATION_ERROR_EMM_CAL, deviation, edtEmCalibrationCurrPass7500nA);

      frmMain.Update();  // Update the form

      //
      // Time for checking charge
      //

      _EmChargeAct := true;

      // Switch the calibrator to charge
      buffer := 'O0X';        // Operate = off
      IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 5, NLend);
      Sleep(100);
      buffer := 'V0.0X';      // 0 A
      IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 20, NLend);
      Sleep(100);
      buffer := 'F3X';        // Charge
      IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 5, NLend);
      Sleep(100);

      // Set 750 pC
      buffer := 'V7.5e-10X';
      IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 20, NLend);
      buffer := 'O1X';        // Operate = on, once without trig for prevent spike
      IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 5, NLend);
      Sleep(2000);

      // Activate peak off trig again and switch to autorange
      SendCommand('ms_range_ext;auto;1');
      Sleep(100);
      SendCommand('ms_range_ext;1');
      Sleep(2000);
//      SendCommand('ms_trig off peak');
      SendTrigCommand(TRIG_PEAK, 0);
      Sleep(100);
    end;
    if (_EmCalibr = 5) then begin      // 750 pC
      edtEmCalibrationChargeVal750pC.Text := measuredCurrentChargeValue;

      // Calculate deviation (in pC)
      deviation := CalcDeviation(750, SafeFloatConvert(measuredCurrentChargeValue));
      edtEmCalibrationChargeDev750pC.Text := Format('%.1f', [deviation]);

      // Check pass/fail criteria
      CheckPassFail(MAX_DEVIATION_ERROR_EMM_CAL, deviation, edtEmCalibrationChargePass750pC);

      frmMain.Update();  // Update the form

      // Set 7.5 nC
//      SendCommand('ms_trig on manual');    // To not self trig
      SendTrigCommand(TRIG_MANUAL, 0);
      Sleep(500);
      buffer := 'V7.5E-9X';
      IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 20, NLend);
      Sleep(500);    // Wait a while so the signal has time to changed
    end;
    if (_EmCalibr = 4) then begin      // 7,5 nC
      edtEmCalibrationChargeVal7nC.Text := measuredCurrentChargeValue;

      // Calculate deviation (in pC)
      deviation := CalcDeviation(7.50e3, SafeFloatConvert(measuredCurrentChargeValue));
      edtEmCalibrationChargeDev7nC.Text := Format('%.1f', [deviation]);

      // Check pass/fail criteria
      CheckPassFail(MAX_DEVIATION_ERROR_EMM_CAL, deviation, edtEmCalibrationChargePass7nC);

      frmMain.Update();  // Update the form

      // Set 75 nC
//      SendCommand('ms_trig on manual');    // To not self trig
      SendTrigCommand(TRIG_MANUAL, 0);
      Sleep(500);
      buffer := 'V75E-9X';
      IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 20, NLend);
      Sleep(500);    // Wait a while so the signal has time to changed
    end;
    if (_EmCalibr = 3) then begin      // 75 nC
      edtEmCalibrationChargeVal75nC.Text := measuredCurrentChargeValue;

      // Calculate deviation (in pC)
      deviation := CalcDeviation(75e3, SafeFloatConvert(measuredCurrentChargeValue));
      edtEmCalibrationChargeDev75nC.Text := Format('%.1f', [deviation]);

      // Check pass/fail criteria
      CheckPassFail(MAX_DEVIATION_ERROR_EMM_CAL, deviation, edtEmCalibrationChargePass75nC);

      frmMain.Update();  // Update the form

      // Set 750 nC
//      SendCommand('ms_trig on manual');    // To not self trig
      SendTrigCommand(TRIG_MANUAL, 0);
      Sleep(500);
      buffer := 'V750E-9X';
      IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 20, NLend);
      Sleep(500);    // Wait a while so the signal has time to changed
    end;
    if (_EmCalibr = 2) then begin      // 750 nC
      edtEmCalibrationChargeVal750nC.Text := measuredCurrentChargeValue;

      // Calculate deviation (in pC)
      deviation := CalcDeviation(750e3, SafeFloatConvert(measuredCurrentChargeValue));
      edtEmCalibrationChargeDev750nC.Text := Format('%.1f', [deviation]);

      // Check pass/fail criteria
      CheckPassFail(MAX_DEVIATION_ERROR_EMM_CAL, deviation, edtEmCalibrationChargePass750nC);

      frmMain.Update();  // Update the form

      // Set 7500 nC
//      SendCommand('ms_trig on manual');    // To not self trig
      SendTrigCommand(TRIG_MANUAL, 0);
      Sleep(500);
      // Due to noisy signal at this high calibrator range -> switch off autorange and set low sensibility.
      SendCommand('ms_range_ext;auto;0');
      Sleep(100);
      SendCommand('ms_range_ext;7');
      Sleep(200);
      buffer := 'V7500E-9X';
      IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 20, NLend);
      Sleep(500);    // Wait a while so the signal has time to changed
    end;
    if (_EmCalibr = 1) then begin      // 7500 nC
      edtEmCalibrationChargeVal7500nC.Text := measuredCurrentChargeValue;

      // Calculate deviation (in pC)
      deviation := CalcDeviation(7500e3, SafeFloatConvert(measuredCurrentChargeValue));
      edtEmCalibrationChargeDev7500nC.Text := Format('%.1f', [deviation]);

      // Check pass/fail criteria
      CheckPassFail(MAX_DEVIATION_ERROR_EMM_CAL, deviation, edtEmCalibrationChargePass7500nC);

      frmMain.Update();  // Update the form

      _EmCalibr := 0;  // Finnished
    end;

    if (_EmCalibr = 0) then begin
      // End EMM check and reset

      // Only do the reset if Calibrator is found
      if (_EmCalibratorFound) then begin
        // Calibrator: Set operate OFF and set a mode with low noise
        buffer := 'O0X';
        IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 5, NLend);
        buffer := 'F1X';       // Ampere
        IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 5, NLend);
        buffer := 'V5.0E-8X';  // Value 50 nA
        IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 20, NLend);
        Sleep(500);

        // Activate peak on/off trig again
//        SendCommand('ms_trig on peak');
//        Sleep(100);
//        SendCommand('ms_trig off peak');
//        Sleep(100);
        SendTrigCommand(TRIG_PEAK, 0);

        // Switch on autorange and set high sensibility again.
        SendCommand('ms_range_ext;auto;1');
        Sleep(100);
        SendCommand('ms_range_ext;1');
        Sleep(100);
//      SendCommand('debug_offset_update;on');  // Do not enable offset update again during emm calibration / check

        lblEmCalibrationWorking.Visible := false;
      end;
    end;
    _EmCalibr := _EmCalibr - 1;     // Will stop at -1
    frmMain.Update();          // Update the form
  end;
end;

function TfrmMain.AdaptValue(valueString : string) : string;
var
  tmpValue : AnsiString;
begin
    // Remove added 0 charachter at valueString start, that exists sometimes
    tmpValue := valueString;
    if (tmpValue[1] = '0') and
        not (tmpValue[2] = '.') then
    tmpValue[1] := ' ';
    tmpValue := Trim(tmpValue);

    Result := tmpValue;
end;


procedure TfrmMain.ParseInput(input : string);
var
  s                : string;
  I,J              : Integer;
  words            : array [0..20] of string;{ TODO : G�r om till en TStringList, den �r inte begr�nsad till 21 utan dynamisk. }
  vals             : array [0..10] of Extended;
  normFactor       : Extended;
  normFactorString : String;
  chargeVal        : String;
  errorMsg         : String;
  modelStr         : String;
  tmpStr           : String;
  buttonSelected   : Integer;
  chargeTime       : Bool;
  value            : Integer;
  sValue           : String;
  temp             : Extended;
  buffer           : packed array[0..40] of char;
  val              : Integer;
  fwVersion        : Extended;
begin

  FormatSettings.DecimalSeparator := '.';

  chargeTime := False;

  for I := 0 to 20 do begin
    words[I] := '';
  end;

   I := 1;
   J := 0;
   while (I <= Length(input)) do begin
    if (((input[I] = ' ') Or
         (input[I] = ';')) And
         (I > 1)) then begin
       Inc(J);
    end else begin
       words[J] := words[J] + input[I];
    end;
    Inc(I);
   end;

  if (words[0] = 'Tdata_') And (_tracealyzerStarted = True) then begin
    for i := 1 to 3 do begin
      if (Length(words[i]) = 8) then begin
          sValue := '0x' + words[i];
          value := StrToInt(sValue);
          for j := 1 to 4 do begin
                _traceBuffer[_traceIndex+j] := (value shr (8*(4-j))) And 255;
          end;
          _traceIndex := _traceIndex + 4;
      end;
  end;

  end else if AnsiPos('0001', input) = 3 then //ChargeTime
  begin
    words[7] := words[5];
    words[6] := words[4];
    words[5] := words[3];
    words[4] := words[2];
    words[3] := words[1];
    words[2] := AnsiMidStr(words[0], 9, Length(words[0])-4);
    words[1] := 'charge_time';
    words[0] := 'm_get_val';
    chargeTime := True;
  end;

   if (words[0] = 'm_get_val') then begin
     InputReaction_m_get_val(words, J);
     if chargeTime then
       makeFirmwareExcelString();
   end;

   // Take care of SD storage times. Note modified to handle two versions of strings
   if (words[0] = 'measResult') then begin
     if ((words[2] = 'Used') and (words[3] = 'file')) then
       _sSDFile := words[5];
     if ((words[2] = 'Max') and (words[3] = 'waveform')) then begin // Max version 1
       _sSDMaxTime    := words[9];
       _sSDMaxTimeInd := words[11];
     end;
     if ((words[2] = 'Max') and (words[3] = 'WF')) then begin   // Max version 2
       _sSDMaxTime    := words[7];
       _sSDMaxTimeInd := words[9];
     end;
     if ((words[2] = 'Next') and (words[3] = 'max')) then begin  // Next max version 1
       _sSDSecMaxTime    := words[10];
       _sSDSecMaxTimeInd := words[12];
     end;
     if ((words[2] = '2') and (words[3] = 'max')) then begin   // Next max version 2
       _sSDSecMaxTime    := words[8];
       _sSDSecMaxTimeInd := words[10];
     end;
     if ((words[2] = 'Min') and (words[3] = 'waveform')) then begin  // Min version 1
       _sSDMinTime    := words[9];
       _sSDMinTimeInd := words[11];
     end;
     if ((words[2] = 'Min') and (words[3] = 'WF')) then begin  // Min version 2
       _sSDMinTime    := words[7];
       _sSDMinTimeInd := words[9];
     end;
     if ((words[2] = 'Missed') and (words[3] = 'samples')) then
       _sSDNbrMissSamp := words[7];

     // Take care of "Missed samples in SD". Only if "SDLongTest not is ongoing
     if (shortcuttools.cbSDLongTest.Checked = False) then begin
       if ((words[2] = 'Missed') and (words[3] = 'samples')) then begin
         if (Not (words[7] = '0')) then begin
           // Shows an error dialog if "Missed samples in SD" > 0
           errorMsg := 'Missed waveform samples in SD memory!' + sLineBreak + 'Replace the SD memory.';
           buttonSelected := MessageDlg(errorMsg, mtError, [mbOK], 0);
           if buttonSelected = mrOK then
               ;  // Do nothing
         end;
       end;
     end;
   end;

   if (words[0] = 'calc') then begin
      if ( (words[1] = 'External') and (words[2] = 'probe') and (words[3] = 'electrometer') and
      (words[4] = 'value') and (words[5] = '[pC]') and (words[6] = '=') ) then begin
        edtElectrometerVal.Text := ConvertPointToComma(FloatToStr(StrToFloat(words[7])));
        if (_EmChargeAct = true) then
          EmCalib(edtElectrometerVal.Text);
//        if (_electroMeterCalibrationSM = EM_WAITING_FOR_LOW_SENS_PULSE) then begin
//          lowElChargeCalValEdit.Text := FloatToStr(StrToFloat(words[7])/100000000000);
//        end;
      end;

      if ( (words[1] = 'External') and (words[2] = 'probe') and (words[3] = 'electrometer') and
           (words[4] = 'value') and (words[5] = '[pC]') and (words[6] = '=') ) then begin
//          if (_electroMeterCalibrationsm = EM_WAITING_FOR_HIGH_SENS_PULSE) then begin
//              highElChargeCalValEdit.Text := FloatToStr(StrToFloat(words[7])/800000000000);
//              _electroMeterCalibrationSM := EM_COMPLETE;
              // Set back in low sensitivity range;
//          end;
      end;
      if ( (words[1] = 'External') and (words[2] = 'probe') and (words[3] = 'integrated') and
           (words[4] = 'total') and (words[5] = 'mean') and (words[6] = 'raw') ) then begin
           edtElectrometerRaw.Text :=  ConvertPointToComma(FloatToStr(StrToFloat(words[9])));
          // Set back in low sensitivity range;
      end;
      if ( (words[1] = 'External') and (words[2] = 'probe') and (words[3] = 'integration') and
           (words[4] = '#') and (words[5] = 'samples') and (words[6] = '=') ) then begin
          edtSamples.Text := FloatToStr(StrToFloat(words[7]));
          // Set back in low sensitivity range;
      end;
      if ( (words[1] = 'External') and (words[2] = 'probe') and (words[3] = 'measure') and
           (words[4] = 'time') and (words[5] = '[ms]') and (words[6] = '=') ) then begin
          edtTime.Text := ConvertPointToComma(FloatToStr(StrToFloat(words[7])));
          // Set back in low sensitivity range;
      end;
      if ( (words[1] = 'External') and (words[2] = 'probe') and (words[3] = 'mean') and
           (words[4] = 'current') and (words[5] = '[pA]') and (words[6] = '=') ) then begin
          edtCurrent.Text := ConvertPointToComma(words[7]);

          // Handle calibration adjustment of the electrometer input
          EmAdjust(edtCurrent.Text);

          // Handle check measurement of the electrometer input
          if (_EmChargeAct = false) then
              EmCalib(edtCurrent.Text);
      end;


//      if ( (words[1] = 'Int.') and (words[2] = 'MAS') and (words[3] = 'integ.') and
//      (words[4] = 'ADC') and (words[5] = 'window') and (words[6] = 'value') and
//      (words[7] = '[-]') and (words[8] = '=' )) then begin
//          edtAdcIntegration.Text := ConvertPointToComma(FloatToStr(StrToFloat(words[9])));
//      end;

      if ( (words[1] = 'Int.') and (words[2] = 'MAS') and (words[3] = 'mean') and
      (words[4] = 'ADC') and (words[5] = 'window') and (words[6] = 'value') and
      (words[7] = '[-]') and (words[8] = '=' )) then begin
          if (_MasAdjust > 0) then
            MASAdjust(words[9]);
//          _IntMasMeanADC := words[9];
      end;

//      if ( (words[1] = 'Int.') and (words[2] = 'MAS') and (words[3] = 'integ.') and
//      (words[4] = 'ADC') and (words[5] = 'window') and (words[6] = 'count') and
//      (words[7] = '[#]') and (words[8] = '=' )) then begin
//          edtAdcSamples.Text := ConvertPointToComma(FloatToStr(StrToFloat(words[9])));
//      end;

//      if ( (words[1] = 'Int.') and (words[2] = 'MAS') and (words[3] = 'mean') and
//      (words[4] = 'ADC') and (words[5] = 'window') and (words[6] = 'value') ) then begin
//          _IntMasMeanADC := StrToFloat(words[9]);
//      end;

//      if ( (words[1] = 'Int.') and (words[2] = 'MAS') and (words[3] = 'integ.') and
//      (words[4] = 'ADC') and (words[5] = 'window') and (words[6] = 'count') ) then begin
//        if (_IntMasMeanADC > 0) then
//          edtAdcMean.Text := ConvertPointToComma(FloatToStr(StrToFloat(words[9])/_IntMasMeanADC));
//      end;

      if (((words[1] = 'S1') or (words[1] = 'S2') or (words[1] = 'S3') or
        (words[1] = 'S4') or (words[1] = 'S5') or (words[1] = 'S6') or
        (words[1] = 'S7') or (words[1] = 'S8')) and (words[2] = '=') ) then begin
            ListFirmware.Columns[8+_signal].Caption := words[1] + ' (C)';
            ListFirmware.Columns[12+_signal].Caption := words[1] + ' Cu (A)';
            if (_signal = 0) then begin
              frmWaveform.cbxWF1S1.caption := words[1];
            end;
            if (_signal = 1) then begin
              frmWaveform.cbxWF1S2.caption := words[1];
            end;
            if (_signal = 2) then begin
              frmWaveform.cbxWF1S3.caption := words[1];
            end;
            if (_signal = 3) then begin
              frmWaveform.cbxWF1S4.caption := words[1];
            end;
            _signal := _signal +1;
      end;

    if ( (words[3] = 'Latest') and (words[4] = 'SUM1') and (words[5] = '=') ) then begin
      _sS1_int :=  words[6];
    end;
    if ( (words[3] = 'Latest') and (words[4] = 'SUM2') and (words[5] = '=') ) then begin
      _sS2_int :=  words[6];
    end;
    if ( (words[3] = 'Latest') and (words[4] = 'SUM3') and (words[5] = '=') ) then begin
      _sS3_int :=  words[6];
    end;
    if ( (words[3] = 'Latest') and (words[4] = 'SUM4') and (words[5] = '=') ) then begin
      _sS4_int :=  words[6];
    end;
    if ( (words[1] = 'Signals') and (words[2] = 'field') and (words[5] = 'S2') ) then begin
      _sS2_S2_Field :=  words[8];
    end;
    if ( (words[1] = 'Signals') and (words[2] = 'field') and (words[5] = 'S5') ) then begin
      _sS2_S5_Field :=  words[8];
    end;
    if ( (words[1] = 'Signals') and (words[2] = 'field') and (words[5] = 'S6') ) then begin
      _sS2_S6_Field :=  words[8];
    end;
    if ( (words[1] = 'Signals') and (words[2] = 'field') and (words[5] = 'S4') ) then begin
      _sS4_S4_Field :=  words[8];
    end;
    if ( (words[1] = 'Signals') and (words[2] = 'field') and (words[5] = 'S7') ) then begin
      _sS4_S7_Field :=  words[8];
    end;
    if ( (words[1] = 'Signals') and (words[2] = 'field') and (words[5] = 'S8') ) then begin
      _sS4_S8_Field :=  words[8];
    end;

    if ( (words[1] = 'IntegrationDose') and (words[2] = 'S3') and (words[3] = '=' ) ) then
    _sDosePreEnergyComp := words[4];

    if ( (words[1] = 'Dosefactor') and (words[2] = '=' ) ) then
    _sDoseCorrFactor := words[3];

    if ( (words[1] = 'Charge') and (words[2] = 'S3' ) and (words[4] = '=' ) ) then
    _sDosePostEnergyComp := words[5];

    if ( (words[1] = 'Peak') and (words[2] = 'level') ) then begin
    _sPeakLevel := words[5];
    end;

    if ( (words[1] = 'Final') and (words[2] = 'calculation') ) then begin
      clearFirmwareExcelString();
      _FinalCalc := True;
    end;

   if ( (words[1] = 'Forced') and (words[2] = 'intermediate') ) then begin
      _FinalCalc := False;
    end;

      if (words[1] = 'new') then begin
        //mem_meascalcinfo.Lines.Clear();
        clearFirmwareExcelString();
        _FinalCalc := False;
        _signal := 0;

       end else if (words[1] = 'gui') then begin
        //if (AnsiRightStr(words[4], 1) = 's') then begin
        //  words[5] := 's';
        //  words[4] := AnsiLeftStr(words[4], Length(words[4]) - 1);
        //end;

        if (words[2] = 'value') then begin

            if (words[3] = 'Vp') or (words[3] = 'kVp') then begin
              if ((Length(words[4]) = 1) And (Not(words[4] = '0')))  then begin
                panel_P1A_value.Caption :=
                  SetErrorCaption(words[4]);
                panel_P1A_value.Font.Size := 8;
                panel_P1A_value.Font.Color := RGB(255, 64, 64);
                panel_P1A_value.Alignment :=  taCenter;
                _sP1A_gui := words[4];
              end else begin
                panel_P1A_value.Caption := AdaptValue(words[4]);
                panel_P1A_value.Font.Size := 14;
                panel_P1A_value.Font.Color := RGB(255, 255, 255);
                panel_P1A_value.Alignment :=  taRightJustify;
              end;
              _sP1A_gui := panel_P1A_value.Caption;
              panel_P1A_unit.Caption := words[5];
              panel_P1A_unit.Font.Color := RGB(255, 255, 255);
              if (Length(words[6]) > 1) then begin
                Panel_P1A_probe.Caption := words[6];
                Panel_P1A_probe.Visible := true;
              end else begin
                Panel_P1A_probe.Visible := false;
              end;

          end else if (words[3] = 'V') or (words[3] = 'kV') then begin
            if ( ((Length(words[4]) = 1) or (Length(words[5]) = 1)) And (Not(words[4] = '0')))  then begin
              panel_P1B_value.Caption :=
                SetErrorCaption(words[4]);
              panel_P1B_value.Font.Size := 8;
              panel_P1B_value.Font.Color := RGB(255, 64, 64);
              panel_P1B_value.Alignment :=  taCenter;
            end else begin
              panel_P1B_value.Caption := AdaptValue(words[4]);
              panel_P1B_value.Font.Size := 14;
              panel_P1B_value.Font.Color := RGB(255, 255, 255);
              panel_P1B_value.Alignment :=  taRightJustify;
            end;
            _sP1B_gui := panel_P1B_value.Caption;
            panel_P1B_unit.Caption := words[5];
            panel_P1B_unit.Font.Color := RGB(255, 255, 255);
            if (Length(words[6]) > 1) then begin
              Panel_P1B_probe.Caption := words[6];
              Panel_P1B_probe.Visible := true;
            end else begin
              Panel_P1B_probe.Visible := false;
            end;

          end else if ((words[3] = 'Gy') Or (words[3] = 'R')) then begin
            if ((Length(words[4]) = 1) And (Not(words[4] = '0')))  then begin
              panel_P2_value.Caption :=
                SetErrorCaption(words[4]);
              panel_P2_value.Font.Size := 8;
              panel_P2_value.Font.Color := RGB(255, 16, 16);
              panel_P2_value.Alignment :=  taCenter;
            end else begin
              panel_P2_value.Caption := AdaptValue(words[4]);
              panel_P2_value.Font.Size := 14;
              panel_P2_value.Font.Color := RGB(255, 255, 255);
              panel_P2_value.Alignment :=  taRightJustify;
            end;
            panel_P2_unit.Caption := words[5];
            panel_P2_unit.Font.Color := RGB(255, 255, 255);
            _sDoseUnit := panel_P2_unit.Caption;
            if (Length(words[6]) > 0) then begin  // 0 to also fix '!'
              Panel_P2_probe.Caption := words[6];
              Panel_P2_probe.Visible := true;
              _sP2E_gui := panel_P2_value.Caption;
            end else begin
              Panel_P2_probe.Visible := false;
              _sP2_gui := panel_P2_value.Caption;
            end;
//< calc;gui;value;uGy;024,6;!
//< calc;gui;value;mGy/s;07,37;!
//< calc;gui;value;ms;3,33
          end else if ((words[3] = 'Gy/s') Or (words[3] = 'R/min'))then begin
            if ((Length(words[4]) = 1) And (Not(words[4] = '0')))  then begin
              panel_P3_value.Caption :=
                SetErrorCaption(words[4]);
              panel_P3_value.Font.Size := 8;
              panel_P3_value.Font.Color := RGB(255, 16, 16);
              panel_P3_value.Alignment :=  taCenter;
            end else begin
              panel_P3_value.Caption := AdaptValue(words[4]);
              panel_P3_value.Font.Size := 14;
              panel_P3_value.Font.Color := RGB(255, 255, 255);
              panel_P3_value.Alignment :=  taRightJustify;
              _sDoseRate := ConvertPointToComma(words[4]);
            end;
            panel_P3_unit.Caption := words[5];
            panel_P3_unit.Font.Color := RGB(255, 255, 255);
            _sDoseRateUnit := words[5];
            if (Length(words[6]) > 0) then begin  // 0 to also fix '!'
              Panel_P3_probe.Caption := words[6];
              Panel_P3_probe.Visible := true;
              _sP3E_gui         := panel_P3_value.Caption;
            end else begin
              Panel_P3_probe.Visible := false;
              _sP3_gui := panel_P3_value.Caption;
            end;

          end else if (words[3] = 'mmAL(TF)') then begin
            if ((Length(words[4]) = 1) And (Not(words[4] = '0')))  then begin
              panel_p4_value.Caption :=
                SetErrorCaption(words[4]);
              panel_p4_value.Font.Size := 8;
              panel_p4_value.Font.Color := RGB(255, 16, 16);
              panel_p4_value.Alignment :=  taCenter;
            end else begin
              panel_p4_value.Caption := AdaptValue(words[4]);
              panel_p4_value.Font.Size := 14;
              panel_p4_value.Font.Color := RGB(255, 255, 255);
              panel_p4_value.Alignment :=  taRightJustify;
              _sHVL := ConvertPointToComma(words[4]);
            end;
            _sP4_gui := panel_p4_value.Caption;
            panel_p4_unit.Caption := words[5];
            panel_P4_unit.Font.Color := RGB(255, 255, 255);
            if (Length(words[6]) > 1) then begin
              Panel_P4_probe.Caption := words[6];
              Panel_P4_probe.Visible := true;
            end else begin
              Panel_P4_probe.Visible := false;
            end;

          end else if (words[3] = 'mAl(HVL)') or (words[3] = 'mmAl(HVL)') or
                      (words[3] = 'mAl(HVL') or (words[3] = 'mmAl(HVL') then begin  // Sometimes missing the last ')'
            if ((Length(words[4]) = 1) And (Not(words[4] = '0')))  then begin
              panel_p5_value.Caption :=
                SetErrorCaption(words[4]);
              panel_p5_value.Font.Size := 8;
              panel_p5_value.Font.Color := RGB(255, 16, 16);
              panel_p5_value.Alignment :=  taCenter;
            end else begin
              panel_p5_value.Caption := AdaptValue(words[4]);
              panel_p5_value.Font.Size := 14;
              panel_p5_value.Font.Color := RGB(255, 255, 255);
              panel_p5_value.Alignment :=  taRightJustify;
              _sHVL := ConvertPointToComma(words[4]);
            end;
            _sP5_gui := panel_p5_value.Caption;
            panel_p5_unit.Caption := words[5];
            panel_p5_unit.Font.Color := RGB(255, 255, 255);
            if (Length(words[6]) > 1) then begin
              Panel_P5_probe.Caption := words[6];
              Panel_P5_probe.Visible := true;
            end else begin
              Panel_P5_probe.Visible := false;
            end;

          end else if (words[3] = 's') then begin
            if ((Length(words[4]) = 1) And (Not(words[4] = '0')))  then begin
              panel_P6_value.Caption :=
                SetErrorCaption(words[4]);
              panel_P6_value.Font.Size := 8;
              panel_P6_value.Font.Color := RGB(255, 16, 16);
              panel_P6_value.Alignment :=  taCenter;
            end else begin
              panel_P6_value.Caption := AdaptValue(words[4]);
              panel_P6_value.Font.Size := 14;
              panel_P6_value.Font.Color := RGB(255, 255, 255);
              panel_P6_value.Alignment :=  taRightJustify;
            end;
            panel_P6_unit.Caption := words[5];
            panel_P6_unit.Font.Color := RGB(255, 255, 255);
            _sExpTimeUnit := panel_P6_unit.Caption;

            if (Length(words[6]) > 1) then begin
              Panel_P6_probe.Caption := words[6];
              Panel_P6_probe.Visible := true;
              if (words[6] = 'EXT') then _sP6E_gui := panel_P6_value.Caption;
              if (words[6] = 'MAS') then _sP6M_gui := panel_P6_value.Caption;
            end else begin
              Panel_P6_probe.Visible := false;
              _sP6_gui := panel_P6_value.Caption;
            end;

          end else if (words[3] = '#') and (words[4] = 'pulses') then begin
            if (((Length(words[4]) = 1) or (Length(words[5]) = 1)) And (Not(words[4] = '0')))  then begin
              panel_P7_value.Caption :=
                SetErrorCaption(words[5]);
              panel_P7_value.Font.Size := 8;
              panel_P7_value.Font.Color := RGB(255, 64, 64);
              panel_P7_value.Alignment :=  taCenter;
            end else begin
              panel_P7_value.Caption := AdaptValue(words[5]);
              panel_P7_value.Font.Size := 14;
              panel_P7_value.Font.Color := RGB(255, 255, 255);
              panel_P7_value.Alignment :=  taRightJustify;
            end;
            panel_P7_unit.Caption := words[7];
            panel_P7_unit.Font.Color := RGB(255, 255, 255);
            if (Length(words[8]) > 1) then begin
              Panel_P7_probe.Caption := words[8];
              Panel_P7_probe.Visible := true;
              if (words[6] = 'EXT') then _sP7E_gui := panel_P7_value.Caption;
            end else begin
              Panel_P7_probe.Visible := false;
              _sP7_gui := panel_P7_value.Caption;
            end;

          end else if (words[3] = 'Hz') then begin
            if (((Length(words[4]) = 1) or (Length(words[5]) = 1)) And (Not(words[4] = '0')))  then begin
              panel_P8_value.Caption :=
                SetErrorCaption(words[4]);
              panel_P8_value.Font.Size := 8;
              panel_P8_value.Font.Color := RGB(255, 64, 64);
              panel_P8_value.Alignment :=  taCenter;
            end else begin
              panel_P8_value.Caption := AdaptValue(words[4]);
              panel_P8_value.Font.Size := 14;
              panel_P8_value.Font.Color := RGB(255, 255, 255);
              panel_P8_value.Alignment :=  taRightJustify;
            end;
            panel_P8_unit.Caption := words[5];
            panel_P8_unit.Font.Color := RGB(255, 255, 255);
            if (Length(words[6]) > 1) then begin
              Panel_P8_probe.Caption := words[6];
              Panel_P8_probe.Visible := true;
              if (words[6] = 'EXT') then _sP8E_gui := panel_P8_value.Caption;
            end else begin
              Panel_P8_probe.Visible := false;
              _sP8_gui := panel_P8_value.Caption;
            end;

          end else if (words[3] = 'Gy/p') then begin
            if (((Length(words[4]) = 1) or (Length(words[5]) = 1)) And (Not(words[4] = '0')))  then begin
              panel_P9_value.Caption :=
                SetErrorCaption(words[4]);
              panel_P9_value.Font.Size := 8;
              panel_P9_value.Font.Color := RGB(255, 64, 64);
              panel_P9_value.Alignment :=  taCenter;
            end else begin
              panel_P9_value.Caption := AdaptValue(words[4]);
              panel_P9_value.Font.Size := 14;
              panel_P9_value.Font.Color := RGB(255, 255, 255);
              panel_P9_value.Alignment :=  taRightJustify;
            end;
            panel_P9_unit.Caption := words[5];
            panel_P9_unit.Font.Color := RGB(255, 255, 255);
            _sP9_gui_unit := panel_P9_unit.Caption;
            if (Length(words[6]) > 0) then begin   // 0 to also fix '!'
              Panel_P9_probe.Caption := words[6];
              Panel_P9_probe.Visible := true;
              if (words[6] = 'EXT') then _sP9E_gui := panel_P9_value.Caption;
            end else begin
              Panel_P9_probe.Visible := false;
              _sP9_gui := panel_P9_value.Caption;
            end;

          end else if (words[3] = 'Gy/sp') then begin
            if (((Length(words[4]) = 1) or (Length(words[5]) = 1)) And (Not(words[4] = '0')))  then begin
              panel_P10_value.Caption :=
                SetErrorCaption(words[4]);
              panel_P10_value.Font.Size := 8;
              panel_P10_value.Font.Color := RGB(255, 64, 64);
              panel_P10_value.Alignment :=  taCenter;
            end else begin
              panel_P10_value.Caption := AdaptValue(words[4]);
              panel_P10_value.Font.Size := 14;
              panel_P10_value.Font.Color := RGB(255, 255, 255);
              panel_P10_value.Alignment :=  taRightJustify;
            end;
            panel_P10_unit.Caption := words[5];
            panel_P10_unit.Font.Color := RGB(255, 255, 255);
            _sP10_gui_unit := panel_P10_unit.Caption;
            if (Length(words[6]) > 0) then begin  // 0 to also fix '!'
              Panel_P10_probe.Caption := words[6];
              Panel_P10_probe.Visible := true;
              if (words[6] = 'EXT') then _sP10E_gui := panel_P10_value.Caption;
            end else begin
              Panel_P10_probe.Visible := false;
              _sP10_gui := panel_P10_value.Caption;
            end;

          end else if (words[3] = 's_pulseWidth') then begin
            if (((Length(words[4]) = 1) or (Length(words[5]) = 1)) And (Not(words[4] = '0')))  then begin
              panel_P11_value.Caption :=
                SetErrorCaption(words[4]);
              panel_P11_value.Font.Size := 8;
              panel_P11_value.Font.Color := RGB(255, 64, 64);
              panel_P11_value.Alignment :=  taCenter;
            end else begin
              panel_P11_value.Caption := AdaptValue(words[4]);
              panel_P11_value.Font.Size := 14;
              panel_P11_value.Font.Color := RGB(255, 255, 255);
              panel_P11_value.Alignment :=  taRightJustify;
            end;
            panel_P11_unit.Caption := AnsiLeftStr(words[5], Length(words[5])-Length('_pulseWidth'));
            panel_P11_unit.Font.Color := RGB(255, 255, 255);
            _sP11_gui_unit := panel_P11_unit.Caption;
            if (Length(words[6]) > 1) then begin
              Panel_P11_probe.Caption := words[6];
              Panel_P11_probe.Visible := true;
              if (words[6] = 'EXT') then _sP11E_gui := panel_P11_value.Caption;
            end else begin
              Panel_P11_probe.Visible := false;
              _sP11_gui := panel_P11_value.Caption;
            end;

          end else if (words[3] = '%duty') then begin
            if (((Length(words[4]) = 1) or (Length(words[5]) = 1)) And (Not(words[4] = '0')))  then begin
              panel_P12_value.Caption :=
                SetErrorCaption(words[4]);
              panel_P12_value.Font.Size := 8;
              panel_P12_value.Font.Color := RGB(255, 64, 64);
              panel_P12_value.Alignment :=  taCenter;
            end else begin
              panel_P12_value.Caption := AdaptValue(words[4]);
              panel_P12_value.Font.Size := 14;
              panel_P12_value.Font.Color := RGB(255, 255, 255);
              panel_P12_value.Alignment :=  taRightJustify;
            end;
            panel_P12_unit.Caption := words[5];
            panel_P12_unit.Font.Color := RGB(255, 255, 255);
            if (Length(words[6]) > 1) then begin
              Panel_P12_probe.Caption := words[6];
              Panel_P12_probe.Visible := true;
              if (words[6] = 'EXT') then _sP12E_gui := panel_P12_value.Caption;
            end else begin
              Panel_P12_probe.Visible := false;
              _sP12_gui := panel_P12_value.Caption;
            end;

          end else if (words[3] = 's_effTime') then begin
            if (((Length(words[4]) = 1) or (Length(words[5]) = 1)) And (Not(words[4] = '0')))  then begin
              panel_P13_value.Caption :=
                SetErrorCaption(words[4]);
              panel_P13_value.Font.Size := 8;
              panel_P13_value.Font.Color := RGB(255, 64, 64);
              panel_P13_value.Alignment :=  taCenter;
            end else begin
              panel_P13_value.Caption := AdaptValue(words[4]);
              panel_P13_value.Font.Size := 14;
              panel_P13_value.Font.Color := RGB(255, 255, 255);
              panel_P13_value.Alignment :=  taRightJustify;
            end;
            panel_P13_unit.Caption := AnsiLeftStr(words[5], Length(words[5])-Length('_effTime'));
            panel_P13_unit.Font.Color := RGB(255, 255, 255);
            _sP13_gui_unit := panel_P13_unit.Caption;
            if (Length(words[6]) > 1) then begin
              Panel_P13_probe.Caption := words[6];
              Panel_P13_probe.Visible := true;
              if (words[6] = 'EXT') then _sP13E_gui := panel_P13_value.Caption;
            end else begin
              Panel_P13_probe.Visible := false;
              _sP13_gui := panel_P13_value.Caption;
            end;

          end else if (words[3] = 'As') then begin
            if (((Length(words[4]) = 1) or (Length(words[5]) = 1)) And (Not(words[4] = '0')))  then begin
              panel_P14_value.Caption :=
                SetErrorCaption(words[4]);
              panel_P14_value.Font.Size := 8;
              panel_P14_value.Font.Color := RGB(255, 64, 64);
              panel_P14_value.Alignment :=  taCenter;
            end else begin
              panel_P14_value.Caption := AdaptValue(words[4]);
              panel_P14_value.Font.Size := 14;
              panel_P14_value.Font.Color := RGB(255, 255, 255);
              panel_P14_value.Alignment :=  taRightJustify;
 //             edtMASCalibCurrent75mA_1.Text := panel_P14_value.Caption;
            end;
            _sP14EM_gui := panel_P14_value.Caption;
            panel_P14_unit.Caption := words[5];
            panel_P14_unit.Font.Color := RGB(255, 255, 255);
            _sP14EM_gui_unit := panel_P14_unit.Caption;
            if (Length(words[6]) > 1) then begin
              Panel_P14_probe.Caption := words[6];
              Panel_P14_probe.Visible := true;
            end else begin
              Panel_P14_probe.Visible := false;
            end;

          end else if (words[3] = 'A') then begin
            if (((Length(words[4]) = 1) or (Length(words[5]) = 1)) And (Not(words[4] = '0')))  then begin
              panel_P15_value.Caption :=
                SetErrorCaption(words[4]);
              panel_P15_value.Font.Size := 8;
              panel_P15_value.Font.Color := RGB(255, 64, 64);
              panel_P15_value.Alignment :=  taCenter;
            end else begin
              panel_P15_value.Caption := AdaptValue(words[4]);
              panel_P15_value.Font.Size := 14;
              panel_P15_value.Font.Color := RGB(255, 255, 255);
              panel_P15_value.Alignment :=  taRightJustify;
//              edtMASAdjustCurrent75mA_1.Text := panel_P15_value.Caption;
            end;
            _sP15EM_gui := panel_P15_value.Caption;
            panel_P15_unit.Caption := words[5];
            panel_P15_unit.Font.Color := RGB(255, 255, 255);
            if (Length(words[6]) > 1) then begin
              Panel_P15_probe.Caption := words[6];
              Panel_P15_probe.Visible := true;
            end else begin
              Panel_P15_probe.Visible := false;
            end;

          end else if (words[3] = 'As/p') then begin
            if (((Length(words[4]) = 1) or (Length(words[5]) = 1)) And (Not(words[4] = '0')))  then begin
              panel_P16_value.Caption :=
                SetErrorCaption(words[4]);
              panel_P16_value.Font.Size := 8;
              panel_P16_value.Font.Color := RGB(255, 64, 64);
              panel_P16_value.Alignment :=  taCenter;
            end else begin
              panel_P16_value.Caption := AdaptValue(words[4]);
              panel_P16_value.Font.Size := 14;
              panel_P16_value.Font.Color := RGB(255, 255, 255);
              panel_P16_value.Alignment :=  taRightJustify;
            end;
            _sP16EM_gui := panel_P16_value.Caption;
            panel_P16_unit.Caption := words[5];
            panel_P16_unit.Font.Color := RGB(255, 255, 255);
            _sP16EM_gui_unit := panel_P16_unit.Caption;
            if (Length(words[6]) > 1) then begin
              Panel_P16_probe.Caption := words[6];
              Panel_P16_probe.Visible := true;
            end else begin
              Panel_P16_probe.Visible := false;
            end;

          end else if (words[3] = 'A/p') then begin
            if (((Length(words[4]) = 1) or (Length(words[5]) = 1)) And (Not(words[4] = '0')))  then begin
              panel_P17_value.Caption :=
                SetErrorCaption(words[4]);
              panel_P17_value.Font.Size := 8;
              panel_P17_value.Font.Color := RGB(255, 64, 64);
              panel_P17_value.Alignment :=  taCenter;
            end else begin
              panel_P17_value.Caption := AdaptValue(words[4]);
              panel_P17_value.Font.Size := 14;
              panel_P17_value.Font.Color := RGB(255, 255, 255);
              panel_P17_value.Alignment :=  taRightJustify;
            end;
            _sP17EM_gui := panel_P17_value.Caption;
            panel_P17_unit.Caption := words[5];
            panel_P17_unit.Font.Color := RGB(255, 255, 255);
            if (Length(words[6]) > 1) then begin
              Panel_P17_probe.Caption := words[6];
              Panel_P17_probe.Visible := true;
            end else begin
              Panel_P17_probe.Visible := false;
            end;

          end else if (words[3] = 'cd/m2') then begin
            if (((Length(words[4]) = 1) or (Length(words[5]) = 1)) And (Not(words[4] = '0')))  then begin
              panel_P18_value.Caption :=
                SetErrorCaption(words[4]);
              panel_P18_value.Font.Size := 8;
              panel_P18_value.Font.Color := RGB(255, 64, 64);
              panel_P18_value.Alignment :=  taCenter;
            end else begin
              panel_P18_value.Caption := AdaptValue(words[4]);
              panel_P18_value.Font.Size := 14;
              panel_P18_value.Font.Color := RGB(255, 255, 255);
              panel_P18_value.Alignment :=  taRightJustify;
            end;
            _sP18E_gui := panel_P18_value.Caption;
            panel_P18_unit.Caption := words[5];
            panel_P18_unit.Font.Color := RGB(255, 255, 255);
            _sP18E_gui_unit := panel_P18_unit.Caption;
            if (Length(words[6]) > 1) then begin
              Panel_P18_probe.Caption := words[6];
              Panel_P18_probe.Visible := true;
            end else begin
              Panel_P18_probe.Visible := false;
            end;

          end else if (words[3] = 'lx') then begin
            if (((Length(words[4]) = 1) or (Length(words[5]) = 1)) And (Not(words[4] = '0')))  then begin
              panel_P19_value.Caption :=
                SetErrorCaption(words[4]);
              panel_P19_value.Font.Size := 8;
              panel_P19_value.Font.Color := RGB(255, 64, 64);
              panel_P19_value.Alignment :=  taCenter;
            end else begin
              panel_P19_value.Caption := AdaptValue(words[4]);
              panel_P19_value.Font.Size := 14;
              panel_P19_value.Font.Color := RGB(255, 255, 255);
              panel_P19_value.Alignment :=  taRightJustify;
            end;
            _sP19E_gui := panel_P19_value.Caption;
            panel_P19_unit.Caption := words[5];
            panel_P19_unit.Font.Color := RGB(255, 255, 255);
            _sP19E_gui_unit := panel_P19_unit.Caption;
            if (Length(words[6]) > 1) then begin
              Panel_P19_probe.Caption := words[6];
              Panel_P19_probe.Visible := true;
            end else begin
              Panel_P19_probe.Visible := false;
            end;

          end else if (words[3] = 'Gycm') then begin
            if (((Length(words[4]) = 1) or (Length(words[5]) = 1)) And (Not(words[4] = '0')))  then begin
              panel_P20_value.Caption :=
                SetErrorCaption(words[4]);
              panel_P20_value.Font.Size := 8;
              panel_P20_value.Font.Color := RGB(255, 64, 64);
              panel_P20_value.Alignment :=  taCenter;
            end else begin
              panel_P20_value.Caption := AdaptValue(words[4]);
              panel_P20_value.Font.Size := 14;
              panel_P20_value.Font.Color := RGB(255, 255, 255);
              panel_P20_value.Alignment :=  taRightJustify;
            end;
            _sP20E_gui := panel_P20_value.Caption;
            panel_P20_unit.Caption := words[5];
            panel_P20_unit.Font.Color := RGB(255, 255, 255);
            _sP20E_gui_unit := panel_P20_unit.Caption;
            if (Length(words[6]) > 1) then begin
              Panel_P20_probe.Caption := words[6];
              Panel_P20_probe.Visible := true;
            end else begin
              Panel_P20_probe.Visible := false;
            end;

          end else if (words[3] = 'Gycm/s') then begin
            if (((Length(words[4]) = 1) or (Length(words[5]) = 1)) And (Not(words[4] = '0')))  then begin
              panel_P21_value.Caption :=
                SetErrorCaption(words[4]);
              panel_P21_value.Font.Size := 8;
              panel_P21_value.Font.Color := RGB(255, 64, 64);
              panel_P21_value.Alignment :=  taCenter;
            end else begin
              panel_P21_value.Caption := AdaptValue(words[4]);
              panel_P21_value.Font.Size := 14;
              panel_P21_value.Font.Color := RGB(255, 255, 255);
              panel_P21_value.Alignment :=  taRightJustify;
            end;
            _sP21E_gui := panel_P21_value.Caption;
            panel_P21_unit.Caption := words[5];
            panel_P21_unit.Font.Color := RGB(255, 255, 255);
            _sP21E_gui_unit := panel_P21_unit.Caption;
            if (Length(words[6]) > 1) then begin
              Panel_P21_probe.Caption := words[6];
              Panel_P21_probe.Visible := true;
            end else begin
              Panel_P21_probe.Visible := false;
            end;
          end;
        end;
      end else begin
        // Handle rest of 'calc;' data

        // Put kV, Tf and high/low range to Clipboard
        if ((words[3] = 'Low') and (words[4] = 'range')) then begin
           _sRange := 'Low range'
        end;
         if ((words[3] = 'High') and (words[4] = 'range')) then begin
           _sRange := 'High range'
        end;
        if (words[2] = 'kv') then begin
          // Convert '.' to ','
          _skV := ConvertPointToComma(words[4]);
           _sP1B := ConvertPointToComma(words[4]);
        end;
        if (words[2] = 'tf') then begin
          _sTF := ConvertPointToComma(words[4]);
        end;
        if (words[2] = 'kVp') then begin
          // Convert '.' to ','
          _skVp := ConvertPointToComma(words[5]);
          _sP1A := ConvertPointToComma(words[5]);
        end;
        if (words[2] = 'TFp') then begin
          // Convert '.' to ','
          _sTfp := ConvertPointToComma(words[5]);
        end;
        if (words[1] = 'Peak') and (words[2] = 'selected') then begin
          _sPeakPPV := words[1];
          _sP1_Method := words[1];
        end;
        if (words[1] = 'PPV') and (words[2] = 'selected') then begin
          _sPeakPPV := words[1];
          _sP1_Method := words[1];
        end;
        if (words[1] = 'Irradiation') and (words[3] = '(internal)') then begin
          _sP6 := ConvertPointToComma(words[6]);
        end;
        if (words[1] = 'Irradiation') and (words[3] = '(external)') then begin
          _sP6E := ConvertPointToComma(words[6]);
        end;
//        if (words[1] = 'Irradiation') and (words[3] = '(MAS)') then begin
//          _sP6M := ConvertPointToComma(words[6]);
//          edtMasTime.Text := _sP6M;
//        end;
        if (words[1] = 'End') and (words[2] = 'range') then begin
          _sSensitivity := words[3];
        end;
        if (words[1] = 'External') and (words[2] = 'End') and (words[3] = 'range') then begin
          _sSensitivity_Ext := words[5];
        end;
        if (words[5] = 'kV') and (words[6] = 'Low') then begin
          _skVLow := ConvertPointToComma(words[8]);
        end;
        if (words[5] = 'Tf') and (words[6] = 'Low') then begin
          _sTfLow := ConvertPointToComma(words[8]);
        end;
        if (words[5] = 'kV') and (words[6] = 'High') then begin
          _skVHigh := ConvertPointToComma(words[8]);
        end;
        if (words[5] = 'Tf') and (words[6] = 'High') then begin
          _sTfHigh := ConvertPointToComma(words[8]);
        end;
        if (words[1] = 'Pulse') and (words[2] = 'Total') and (words[3] = 'Count') then begin
          _sP7 := ConvertPointToComma(words[5]);
        end;
        if (words[1] = 'Pulse') and (words[2] = 'Per') and (words[3] = 'Second') then begin
          _sPulseFreq := ConvertPointToComma(words[6]);
        end;
        if (words[1] = 'Pulse') and (words[2] = 'Width') then begin
          _sP11 := ConvertPointToComma(words[5]);
        end;
        if (words[1] = 'Effective') and (words[2] = 'time') then begin
          _sPulseEffectiveTime := ConvertPointToComma(words[5]);
        end;
        if (words[1] = 'Pulse') and (words[2] = 'duty') then begin
          _sPulseIntermittens := ConvertPointToComma(words[5]);
        end;
        if (words[1] = 'Dose') and (words[2] = 'internal') and
            (words[3] = 'value') and (words[4] = '[mGy]') then begin
          _sDose := ConvertPointToComma(words[6]);
          _sP2 := ConvertPointToComma(words[6]);
        end;
        if (words[1] = 'Dose') and (words[2] = 'extern') and
          (words[3] = 'probe') and (words[4] = '[mGy]') then begin
          _sDoseExt := ConvertPointToComma(words[6]);
          _sP2E := ConvertPointToComma(words[6]);
        end;
        if (words[1] = 'Dose/pulse') and (words[2] = '[nGy/p]') then begin
          _sDosePerPulse := ConvertPointToComma(words[4]);
        end;
        if (words[1] = 'Doserate/pulse') and (words[2] = '[nGy/sp]') then begin
          _sDoseRatePerPulse := ConvertPointToComma(words[4]);
        end;
        if (words[2] = 'mAs') and (words[3] = '[uAs]') then begin
          _sTubeCharge := ConvertPointToComma(words[5]);
        end;
        if (words[2] = 'mA') and (words[3] = '[mA]') then begin
          _sTubeCurrent := ConvertPointToComma(words[5]);
          if (_MASCalib > 0) then
                MASCalib(words[5]);
        end;
        if (words[2] = 'mAs/p') and (words[3] = '[uAs/p]') then begin
          _sTubeChargePerPulse := ConvertPointToComma(words[5]);
        end;
        if (words[2] = 'mA/p') and (words[3] = '[uA/p]') then begin
          _sTubeCurrentPerPulse := ConvertPointToComma(words[5]);
        end;
        if (words[1] = 'Luminance') and (words[2] = '[cd/m2]') then begin
          _sP18E := ConvertPointToComma(words[4]);
        end;
        if (words[1] = 'Illuminance') and (words[2] = '[lux]') then begin
          _sP19E := ConvertPointToComma(words[4]);
        end;
        if (words[1] = 'Internal') and (words[2] = 'MAS') and
            (words[3] = 'integrated') and (words[4] = 'total') and
              (words[5] = 'value') then begin
          _sM1_int := ConvertPointToComma(words[8]);
        end;

        // Send 'Charge S3' to Dose calibration sheet
        if ((words[1] = 'Charge') and (words[2] = 'S3')) then begin
            // Convert '.' to ','
            chargeVal := ConvertPointToComma(words[5]);
            // Remove '+'
            chargeVal := AnsiReplaceStr(chargeVal, '+', '');

            // Update text on Dose calibration sheet
            edtDoseChargeValue.Text := ConvertPointToComma(chargeVal);
        end;

        // Send data to Firmware sheet
        s := '';
        for I := 1 to J+1 do begin
          s := s + words[I];
          s := s + ' ';
        end;
        mem_meascalcinfo.Lines.Append(s);
      end;
   end;
   if (words[0] = 'Done') then begin
      if (words[1] = 'reset') then begin
        for I := 1 to 8 do begin
          SendCommand('m_get_val offs ' + IntToStr(I));
          Delay(100);
        end;
//        SendCommand('ms_range ?');  Do not ask
      end;
   end;
   if (words[0] = 'ms_range') then begin
      if (words[1] = '1') then begin
        shortcuttools.cmbSensitivity.ItemIndex := 1;
        iSensitivity:=shortcuttools.cmbSensitivity.ItemIndex;
      end else if (words[1] = '0') then begin
        shortcuttools.cmbSensitivity.ItemIndex := 0;
        iSensitivity:=shortcuttools.cmbSensitivity.ItemIndex;
      end else if (words[1] = 'auto') then begin
        if words[2] = '1' then begin
          shortcuttools.cbAutoRange.Checked := True;
        end else begin
          shortcuttools.cbAutoRange.Checked := False;
        end;
      end;
   end;
   if (words[0] = 'Event') then begin
      if (words[1] = 'trigoff') then begin
        if _firstTrig then begin
          _firstTrig := False;
        end else begin
            lvRing.Columns.Add();
          for I := 0 to (lvRing.Items.Count - 1) do begin
            lvRing.Items.Item[I].SubItems.Add('new');
          end;
          _subitems := _subitems + 1;
          lvRing.Columns.Items[_subitems+1].Width := 75;
        end;

         iTimeSDTest := 0;     // Restart SD memory test

        //SendCommand('m_get_val;calc');
        Sleep(200);
        SendCommand('m_get_val filt');
        Sleep(100);
        SendCommand('2C0001XXm_get_val;charge_time');
        Sleep(100);

        // If EM calibration or check -> activate next calibration trig
        // Start measure pulse in 2 seconds
        if ((_EmAdjust > 0) or (_EmCalibr > 0)) then begin
            Sleep(1000);                      // Wait in 1 second so the Cobia is ready for next trig
            // Need to switch on/off signal all times if fw version 5.0A, due to manual trig not works correctly
            // Also switch operator on of charge signal is used
            if ((AnsiContainsStr(edtFirmwareVersion.Text, '5.0A') = true) or (_EmChargeAct = true)) then begin
                if (_EmChargeAct = true) then begin
                  // If charge measurement -> enable peak trig befor operate ON
//                  SendCommand('ms_trig on peak');
                  SendTrigCommand(TRIG_PEAK, 0);
                  Sleep(500);
                end;
                buffer := 'O1X';                  // Calibrator: Set operate ON
                IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 5, NLend);
                Sleep(500);                       // Sleep a while to be sure that tha Calibrator has rised the signal
            end;
            if (_EmChargeAct = false) then begin
//              SendCommand('ms_trig on trig');   // Trig on for Cobia
              SendTrigCommand(TRIG_ON, 0);
              Sleep(2100);                      // Measure in about 2 seconds
             end;
            // Need to switch on/off signal all times if fw version 5.0A, due to manual trig not works correctly
            if (AnsiContainsStr(edtFirmwareVersion.Text, '5.0A') = true) then begin
                buffer := 'O0X';                  // Calibrator: Set operate OFF
                IbSend(BDINDEX, PRIMARY_ADDR_OF_DMM, buffer, 5, NLend);
                Sleep(300);
            end;
            if (_EmChargeAct = false) then
//              SendCommand('ms_trig off trig');  // Trig off for Cobia
              SendTrigCommand(TRIG_OFF, 0);
        end;
      end else if (words[1] = 'start') then begin
        if (words[2] = 'done') then begin
          btnReadValuesClick(self);
          SendCommand('debug_printout;1'); // Activate debug printout. Need to send command if checkbox below already checked
          shortcuttools.cbDebugPrintout.Checked := True; // Activate debug printout
        end;
      end else if (words[1] = 'trigon') then begin
         ClearParams();
      end;
   end;
   if (words[0] = 'ms_trig') then begin
      if (words[1] = 'window') then begin
        shortcuttools.edtTrigOffTime.Text := words[2];
      end else if (words[1] = 'predelay') then begin
        shortcuttools.edtPreDelay.Text := words[2];
      end else if (words[1] = 'on') then begin
        if (words[2] = 'peak') then begin
          shortcuttools.cmbTrigOn.ItemIndex := 0;
          shortcuttools.btnTrigOn.Enabled := False;
        end else begin
          shortcuttools.cmbTrigOn.ItemIndex := 1;
          shortcuttools.btnTrigOn.Enabled := True;
        end;
      end else if (words[1] = 'off') then begin
        if (words[2] = 'peak') then begin
          shortcuttools.cmbTrigOff.ItemIndex := 0;
          shortcuttools.btnTrigOff.Enabled := False;
        end else if (words[2] = 'manual') then begin
          shortcuttools.cmbTrigOff.ItemIndex := 2;
          shortcuttools.btnTrigOff.Enabled := True;
        end else begin
          shortcuttools.cmbTrigOff.ItemIndex := 1;
          shortcuttools.btnTrigOff.Enabled := False;
        end;
      end;

   end;
   if (words[0] = 'wf_list_files') then begin
    if (words[1] =  '0') then begin
      lBoxWfFiles.Items.Clear();
    end;
   lBoxWfFiles.Items.Add(words[2]);
   end;


   if (words[0] = 'nvmem') then begin
       if (words[1] = 'vinnova') then begin
        Signal1.ItemIndex := HexStrToInt(Copy(words[2], 3, 2))-1;
        Signal2.ItemIndex := HexStrToInt(Copy(words[2], 5, 2))-1;
        Signal3.ItemIndex := HexStrToInt(Copy(words[2], 7, 2))-1;
        Signal4.ItemIndex := HexStrToInt(Copy(words[2], 9, 2))-1;
        if ((Signal1.ItemIndex > 7) or (Signal1.ItemIndex < 0)) then Signal1.ItemIndex:= 0;
        if ((Signal2.ItemIndex > 7) or (Signal2.ItemIndex < 0)) then Signal2.ItemIndex:= 0;
        if ((Signal3.ItemIndex > 7) or (Signal3.ItemIndex < 0)) then Signal3.ItemIndex:= 0;
        if ((Signal4.ItemIndex > 7) or (Signal4.ItemIndex < 0)) then Signal4.ItemIndex:= 0;
       end else if (words[1] = 'calib') then begin
       I := StrToInt(words[2]);
       if ((I>=0) And (I<8)) then begin
         Self.memNormationCoeffs.Lines[I] := words[3];
       end else if (I = 8) then begin
         // Convert to 10^6 Gy/C
         normFactor := SafeFloatConvert(words[3]);
         normFactor := normFactor / 1000;
         normFactorString := FloatToStr(normFactor);
         Self.edtDoseNormFactor.Text := normFactorString;
       end;
     end else if (words[1] = 'calibext') then begin
        I := StrToInt(words[2]);
        if (I=0)then begin
         lowElChargeCalValEdit.Text := words[3];
        end;
        if (I=1) then begin
         highElChargeCalValEdit.Text := words[3];
        end;
        EmCheckCalibStorage();
     end else if (words[1] = 'calibmas') then begin
        I := StrToInt(words[2]);
        if (I=0)then begin
         lowMasCalValEdit.Text := words[3];
        end;
        if (I=1) then begin
         highMasCalValEdit.Text := words[3];
        end;
        MASCheckCalibStorage();
     end else if (words[1] = 'serial') then begin
       Self.edtSerialNum.Text := words[2];
       shortcuttools.edtSerial.Text := edtSerialNum.Text;
       edtEmSerialNumber.Text  := edtSerialNum.Text;
       edtMasSerialNumber.Text := edtSerialNum.Text;
     end else if (words[1] = 'caldate') then begin
       edtCalDateYear.Text := words[2];
       edtCalDateMonth.Text := words[3];
       edtCalDateDay.Text := words[4];
     end else if (words[1] = 'callab') then begin
       edtCalLab.Text := words[2];
     end else if (words[1] = 'fwversion') then begin
       edtFirmwareVersion.Text := words[2];
       shortcuttools.edtFWVersion.Text := edtFirmwareVersion.Text;
       // If em-calibration active -> disable trig, i.e. set manual trig and make a reset to stop any ongoing trig
       if (_EmCalibratorFound = true) then begin
         Sleep(200);
         SendTrigCommand(TRIG_MANUAL, 0);
         Sleep(200);
         SendCommand('m_reset');
       end;
     end else if (words[1] = 'prodversion') then begin
       // Of any reason, the product version can include CR-carachters, remove them
       words[2] := AnsiReplaceStr(words[2], #13, '');
       edtVersion.Text    := words[2];
       edtEmVersion.Text  := edtVersion.Text;
       edtMasVersion.Text := edtVersion.Text;
     end else if (words[1] = 'prodmodel') then begin
       // Product model
       // Find which model number in dropdown list
       cBxSelectModelType.ItemIndex := -1;  // No selection
       for I:=0 to (cBxSelectModelType.GetCount-1) do begin
         modelStr := cBxSelectModelType.Items.Strings[I];
         tmpStr := '';
         for J := 1 to 4 do  // Read the model number
           tmpStr := tmpStr + modelStr[J];
          if (words[2] = tmpStr) then begin
            cBxSelectModelType.ItemIndex := I;
          end;
       end;

       // Set valid model number text
       edtModelType.Text := '-';
       edtModelNo.Text := words[2];
       if (words[2] = '1001') then begin
         edtModelType.Text  := 'Smart R/F - kV';
       end else if (words[2] = '1002') then begin
         edtModelType.Text  := 'Smart R/F - Dose';
       end else if (words[2] = '1003') then begin
         edtModelType.Text  := 'Smart R/F - kV & Dose';
       end else if (words[2] = '1004') then begin
         edtModelType.Text  := 'Smart R/F - kV + MAS';
       end else if (words[2] = '2003') then begin
         edtModelType.Text  := 'Flex R/F - kV & Dose';
       end else if (words[2] = '2004') then begin
         edtModelType.Text  := 'Flex R/F - kV & Dose + MAS';
       end else if (words[2] = '3001') then begin
         edtModelType.Text  := 'Sense - Without communication';
       end else if (words[2] = '3002') then begin
         edtModelType.Text  := 'Sense - With communication';
       end else if (words[2] = '4001') then begin
         edtModelType.Text  := 'Dental Intraoral - kV';
       end else if (words[2] = '4002') then begin
         edtModelType.Text  := 'Dental Intraoral - Dose';
       end else if (words[2] = '4003') then begin
         edtModelType.Text  := 'Dental Intraoral - kV & Dose';
       end;

     end else if (words[1] = 'lowElChargeCalVal') then begin
      lowElChargeCalValEdit.Text := words[2];
     end else if (words[1] = 'highElChargeCalVal') then begin
      highElChargeCalValEdit.Text := words[2];

     end else if (words[1] = 'prodpermissions') then begin
       fwVersion := SafeFloatConvert(AnsiLeftStr(edtFirmwareVersion.Text, 3));
       if (fwVersion >= 5.2) then begin
         // FW > 5.1
         // Received as nvmem;prodpermissions;PTB;CustomerSystem;OceanLicens;EndDateForOceanLicens_Year;EndDateForOceanLicens_Month;
         //   where
         //      PTB            : 1 if PTB, 0 otherwise
         //      CustomerSystem : 1 if Customer system, 0 if Demo system
         //      OceanLicens    : 11b Oregistrerad      (Enligt spec fr�n Baracuda/Pirahna)
         //                       10b Display
         //                       01b Connect
         //                       00b Professional
         //      EndDateForOceanLicens_Year : Year when ocean licens stops. Format: YYYY (ex 2014)
         //      EndDateForOceanLicens_Month: Month when ocean licens stops. Format: MM (ex 01 for January)
         val := StrToInt(words[2]);  // PTB flag
         if (val = 1)then begin
           cbxPerms_PTBSystem.Checked := True;
         end else begin
           cbxPerms_PTBSystem.Checked := False;
         end;
         val := StrToInt(words[3]);    // Customer system flag
         if (val = 1)then begin
           cbxPerms_CustomerSystem.Checked := True;
         end else begin
           cbxPerms_CustomerSystem.Checked := False;
         end;
         val := StrToInt(words[4]);    // Ocean Licens flags
         if (val = 0)then begin             // Profesional
           cbxPerm_Ocean.ItemIndex := 3;
         end else if (val = 1) then begin   // Connect
           cbxPerm_Ocean.ItemIndex := 2;
         end else if (val = 2) then begin   // Display (Quick Check)
           cbxPerm_Ocean.ItemIndex := 1;
         end else begin                     // No Ocean support
           cbxPerm_Ocean.ItemIndex := 0;
         end;
         edtOceanLicensLimit.Text := words[5] + ' - ' + words[6];
       end else begin
         // FW < 5.2
         cbxPerms_PTBSystem.Checked      := false;
         cbxPerms_CustomerSystem.Checked := false;
         cbxPerm_Ocean.ItemIndex         := 0;   // No Ocean support
         edtOceanLicensLimit.Text        := '-';
         val := StrToInt(words[2]);
         if ((val and $80) <> 0) then
           cbxPerms_PTBSystem.Checked := true;
         if ((val and $01) <> 0) then
           cbxPerms_CustomerSystem.Checked := true;
         // Do not check ocean support (always no Ocean support)
       end;
     end;
   end;
   if (words[0] = 'debug_sim_ddc_val') then begin
      if (words[1] = 'Completed') then begin
        FileNameWf.ReadOnly := False;
        btnSimWf.Enabled := True;
        btnSaveWf.Enabled := True;
        Timer1.Enabled := False;
        Screen.Cursor := crDefault;
      end;
   end;
   if (words[0] = 'wf_copy') then begin
      if (words[1] = 'Completed') then begin
        FileNameWf.ReadOnly := False;
        btnSimWf.Enabled := True;
        btnSaveWf.Enabled := True;
        Timer1.Enabled := False;
        Screen.Cursor := crDefault;
      end else if words[1] = 'ErrorFileExists' then begin
        FileNameWf.ReadOnly := False;
        btnSimWf.Enabled := True;
        btnSaveWf.Enabled := True;
        Timer1.Enabled := False;
        Screen.Cursor := crDefault;
        FileNameWf.Text := 'ERROR - File exists';
      end;
   end;
   if (words[0] = 'wf_read') then begin
      _burstReadyMode := True;
   end;
    if (Length(words[0]) = 64) then begin
        InputReaction_wf_read(words[0]);
    end;
   if (words[0] = 'wf') then begin
    if (words[1] = 'start') then begin
      //if (words[2] = 'high_sense') then begin
      //  _intSensorSensitivity := HIGH_SENSITIVITY;
      //end else if (words[2] = 'low_sense') then begin
      //  _intSensorSensitivity := LOW_SENSITIVITY;
      //end;
      //  _calFactorInt := StrToFloat(words[3]);
      //if (words[4] = 'high_sense') then begin
      //  _calFactorExt := StrToFloat(highElChargeCalValEdit.text);
      //end else if (words[4] = 'low_sense') then begin
      //  _calFactorExt := StrToFloat(lowElChargeCalValEdit.text);
      //end else begin
      //  _calFactorExt := 1;
      //end;


    // Do nothing
   end else if (words[1] = 'end') then begin
      frmWaveform.PaintAPrettyPicture();
      frmWaveform.BringToFront();
      Screen.Cursor := crDefault;
    end else if (words[1] = 'maxS1') then begin
      frmWaveform.maxValues[0] := SafeFloatConvert(words[2]);
    end else if (words[1] = 'maxS2') then begin
      frmWaveform.maxValues[1] := SafeFloatConvert(words[2]);
    end else if (words[1] = 'maxS3') then begin
      frmWaveform.maxValues[2] := SafeFloatConvert(words[2]);
    end else if (words[1] = 'maxS4') then begin
      frmWaveform.maxValues[3] := SafeFloatConvert(words[2]);
    end else if (words[1] = 'minS1') then begin
      frmWaveform.minValues[0] := SafeFloatConvert(words[2]);
    end else if (words[1] = 'minS2') then begin
      frmWaveform.minValues[1] := SafeFloatConvert(words[2]);
    end else if (words[1] = 'minS3') then begin
      frmWaveform.minValues[2] := SafeFloatConvert(words[2]);
    end else if (words[1] = 'minS4') then begin
      frmWaveform.minValues[3] := SafeFloatConvert(words[2]);
    end else if (words[1] = 'Total') then begin
    ;   // Do nothing
    end else if (words[1] = 'Samples') then begin
    ;   // Do nothing
    end else begin
      vals[0] := SafeFloatConvert(words[1]);   //S1
      vals[1] := SafeFloatConvert(words[2]);   //S2
      vals[2] := SafeFloatConvert(words[3]);   //S3
      vals[3] := SafeFloatConvert(words[4]);   //S4
      vals[4] := SafeFloatConvert(words[5]);   //Extern probe
      vals[5] := SafeFloatConvert(words[6]);   //MAS

      // Calibrated kV
      if (vals[2] <> 0) and (vals[1] <> 0) then begin
        if (_intSensorSensitivity = HIGH_SENSITIVITY) then begin
          vals[6] := (vals[4]/vals[2])*_calFactorInt;
        end else begin
          vals[6] := (vals[2]/vals[1])*_calFactorInt;
        end;
      end;

      // Calibrated Tf
      if (vals[3] <> 0) then begin
        if (_intSensorSensitivity = HIGH_SENSITIVITY) then begin
          vals[7] := (vals[4]/vals[3])*_calFactorInt;
        end else begin
          vals[7] := (vals[2]/vals[3])*_calFactorInt;
        end;
      end;

      // Calibrated Dose
      vals[8] := vals[3];

      // Calibrated Extern Probe
      vals[9] := vals[4]*_calFactorExt;

      // Calibrated MAS
      vals[10] := vals[5];

      frmWaveform.AddSample(vals);
    end;
   end;

   //if (words[0] = 'tracealyzer_read') then begin
   // if (words[1] = 'OK') then begin

      if (words[0] = 'trace') then begin
        if (words[1] = 'start') then begin
          _tracealyzerStarted := True;
        end else if (words[1] = 'end') then begin
          AssignFile(_traceFile, 'trace.bin');
          ReWrite(_traceFile, 128);
          BlockWrite(_traceFile, _traceBuffer, 600);
          CloseFile(_traceFile);
         _tracealyzerStarted := False;
        end;
    end;

    // Read external probe offset
    if (words[0] = 'm_get_val') and (words[1] = 'offset') then begin
      if (AnsiContainsStr(words[2], 'ExtProbe') = true) then  begin

        if (words[2] = 'ExtProbe') then begin
          if (words[3] = 'High') then
            _bHighSide := true;
          if (words[3] = 'Low') then
            _bHighSide := false;
        end;
        if (words[2] = 'ExtProbeSideA') then begin
          if (_bHighSide = true) then begin
            _sExtOffsetHighSideA := words[3];
          end else
            _sExtOffsetLowSideA := words[3];
        end;
        if (words[2] = 'ExtProbeSideB') then begin
          if (_bHighSide = true) then begin
            _sExtOffsetHighSideB := words[3];
          end else
            _sExtOffsetLowSideB := words[3];
        end;
        CalcExtProbeOffset();  // Calculate offset
      end;
      if (words[2] = 'MasProbeNormal') then
        edtMASCalibOffsetHigh.Text := words[3];
      if (words[2] = 'MasProbe10Power') then
        edtMASCalibOffsetLow.Text := words[3];
      CalcMasOffset();
    end;

    // China market adjustment of kV and Dose (to pass the Chinese administrative authority)
    if (words[0] = 'china_adjustment') and
       (words[1] = 'get')then begin

      edtChinakV_k0.Text   := Format('%.5s', [AnsiReplaceStr(words[2], '+','')]);
      edtChinakV_k1.Text   := Format('%.5s', [AnsiReplaceStr(words[3], '+','')]);
      edtChinaDose_d0.Text := Format('%.8s', [AnsiReplaceStr(words[4], '+','')]);
      edtChinaDose_d1.Text := Format('%.8s', [AnsiReplaceStr(words[5], '+','')]);
    end;
end;

// Make the Excel string in the ListFirmware view
procedure TfrmMain.makeFirmwareExcelString();
var
  lstItem                            : TListItem;
  dS1, dS2, dS3, dS4, dSTime         : Extended;
  dS1_int, dS2_int, dS3_int, dS4_int : Extended;
  eS2_S1_ratio, eS2_S3_ratio         : Extended;
  eS4_S2_ratio, eS4_S3_ratio         : Extended;
  kVTf, dSCu                         : Extended;
  doseScale, dDose, dDoseRate        : Extended;
  scale, tmpScale                    : Extended;
  str                                : string;
  i                                  : Integer;
begin

  dS1    := SafeFloatConvert(_sS1);
  dS2    := SafeFloatConvert(_sS2);
  dS3    := SafeFloatConvert(_sS3);
  dS4    := SafeFloatConvert(_sS4);
  dsTime := SafeFloatConvert(_sSTime);

   // Convert S1-S4 from unit pC to C
  dS1  := dS1 * 1.0E-12;
  str  := FloatToStr(dS1);
  _sS1 := ConvertPointToComma(str);
  dS2  := dS2 * 1.0E-12;
  str  := FloatToStr(dS2);
  _sS2 := ConvertPointToComma(str);
  dS3  := ds3 * 1.0E-12;
  str  := FloatToStr(dS3);
  _sS3 := ConvertPointToComma(str);
  dS4  := ds4 * 1.0E-12;
  str  := FloatToStr(dS4);
  _sS4 := ConvertPointToComma(str);

  dS1_int := SafeFloatConvert(_sS1_int);
  dS2_int := SafeFloatConvert(_sS2_int);
  dS3_int := SafeFloatConvert(_sS3_int);
  dS4_int := SafeFloatConvert(_sS4_int);

  // Calculate kV/Tf ratio

  // Calculate kV Low
  if (dS1_int > 0) and (dS2_int > 0) then begin
    kVTf := dS2_int / dS1_int;
    str := FloatToStr(kVTf);
    //_skVRatioLow := ConvertPointToComma(str);
  end;
    // Calculate Tf Low
  if (dS2_int > 0) and (dS3_int > 0) then begin
    kVTf := dS2_int / dS3_int;
    str := FloatToStr(kVTf);
    _sTfRatioLow := ConvertPointToComma(str);
  end;
    // Calculate kV High
  if (dS4_int > 0) and (dS2_int > 0) then begin
    kVTf := dS4_int / dS2_int;
    str := FloatToStr(kVTf);
    //_skVRatioHigh := ConvertPointToComma(str);
  end;
    // Calculate Tf High
  if (dS4_int > 0) and (dS3_int > 0) then begin
    kVTf := dS4_int / dS3_int;
    str := FloatToStr(kVTf);
    //_sTfRatioHigh := ConvertPointToComma(str);
  end;

  // Calculate S2/S1, S2/S3, S4/S2, S4/S3 ratios
  if (dS1_int > 0) and (dS2_int > 0) then begin
    eS2_S1_ratio := dS2_int / dS1_int;
    str := FloatToStr(eS2_S1_ratio);
    _sS2_S1_ratio := ConvertPointToComma(str);
  end;
  if (dS2_int > 0) and (dS3_int > 0) then begin
    eS2_S3_ratio := dS2_int / dS3_int;
    str := FloatToStr(eS2_S3_ratio);
    _sS2_S3_ratio := ConvertPointToComma(str);
  end;
  if (dS4_int > 0) and (dS2_int > 0) then begin
    eS4_S2_ratio := dS4_int / dS2_int;
    str := FloatToStr(eS4_S2_ratio);
    _sS4_S2_ratio := ConvertPointToComma(str);
  end;
  if (dS4_int > 0) and (dS3_int > 0) then begin
    eS4_S3_ratio := dS4_int / dS3_int;
    str := FloatToStr(eS4_S3_ratio);
    _sS4_S3_ratio := ConvertPointToComma(str);
  end;

  // Convert _sP2E from mGy to nGy
  if (Not (_sP2E = '-1'))then begin
    doseScale := 1.0E6;
    if (doseScale > 1.0) then begin
      dDose  := SafeFloatConvert(_sP2E);
      dDose  := dDose * doseScale;
      str    := FloatToStr(dDose);
      _sP2E := ConvertPointToComma(str);
    end;
  end;

  // Convert _sP3E from mGy/s to nGy/s
  if (Not (_sP2E = '-1'))then begin
    doseScale := 1.0E6;
    if (doseScale > 1.0) then begin
      dDose  := SafeFloatConvert(_sP2E);
      dDose  := dDose * doseScale;
      str    := FloatToStr(dDose);
      _sP2E := ConvertPointToComma(str);
    end;
  end;

   //Convert Dose (_sP2_gui) unit nGy
  if (Not (_sP2_gui = '-1'))then begin
    doseScale := 1.0;
    if (_sDoseUnit[1] = 'u') then
      doseScale := 1.0E3;
    if (_sDoseUnit[1] = 'm') then
      doseScale := 1.0E6;
    if (_sDoseUnit[1] = 'G') then // No prefix
      doseScale := 1.0E9;
    if (doseScale > 1.0) then begin
      dDose    := SafeFloatConvert(_sP2_gui);
      dDose    := dDose * doseScale;
      str      := FloatToStr(dDose);
      _sP2_gui := ConvertPointToComma(str);
    end;
  end;

    //Convert Dose (_sP2E_gui) unit nGy
  if (Not (_sP2E_gui = '-1'))then begin
    doseScale := 1.0;
    if (_sDoseUnit[1] = 'u') then
      doseScale := 1.0E3;
    if (_sDoseUnit[1] = 'm') then
      doseScale := 1.0E6;
    if (_sDoseUnit[1] = 'G') then // No prefix
      doseScale := 1.0E9;
    if (doseScale > 1.0) then begin
      dDose     := SafeFloatConvert(_sP2E_gui);
      dDose     := dDose * doseScale;
      str       := FloatToStr(dDose);
      _sP2E_gui := ConvertPointToComma(str);
    end;
  end;
//
  //Convert DoseRate (_sP3_gui) unit nGy/s
  if (Not (_sP3_gui = '-1'))then begin
    doseScale := 1.0;
    if (_sDoseRateUnit[1] = 'u') then
      doseScale := 1.0E3;
    if (_sDoseRateUnit[1] = 'm') then
      doseScale := 1.0E6;
    if (_sDoseRateUnit[1] = 'G') then // No presfix
      doseScale := 1.0E9;
    if (doseScale > 1.0) then begin
      dDoseRate  := SafeFloatConvert(_sP3_gui);
      dDoseRate  := dDoseRate * doseScale;
      str        := FloatToStr(dDoseRate);
      _sP3_gui   := ConvertPointToComma(str);
    end;
  end;

  //Convert DoseRate (_sP3_gui) unit nGy/s
  if (Not (_sP3E_gui = '-1'))then begin
    doseScale := 1.0;
    if (_sDoseRateUnit[1] = 'u') then
      doseScale := 1.0E3;
    if (_sDoseRateUnit[1] = 'm') then
      doseScale := 1.0E6;
    if (_sDoseRateUnit[1] = 'G') then // No presfix
      doseScale := 1.0E9;
    if (doseScale > 1.0) then begin
      dDoseRate   := SafeFloatConvert(_sP3E_gui);
      dDoseRate   := dDoseRate * doseScale;
      str         := FloatToStr(dDoseRate);
      _sP3E_gui   := ConvertPointToComma(str);
    end;
  end;

  //Convert Time (_sP6_gui) unit ms
  tmpScale := 0;
  if (_sExpTimeUnit <> '') then begin
    scale := 1.0E3;
    if (_sExpTimeUnit[1] = 'm') then
      scale := 1.0;
    if (scale > 1.0) then begin
      if not (_sP6_gui = '-1') then
        tmpScale   := SafeFloatConvert(_sP6_gui);
      if not (_sP6E_gui = '-1') then
        tmpScale   := SafeFloatConvert(_sP6E_gui);
      if not (_sP6M_gui = '-1') then
        tmpScale   := SafeFloatConvert(_sP6M_gui);
      tmpScale  := tmpScale * scale;
      str       := FloatToStr(tmpScale);
      if not (_sP6_gui = '-1') then
        _sP6_gui := ConvertPointToComma(str);
      if not (_sP6E_gui = '-1') then
        _sP6E_gui := ConvertPointToComma(str);
      if not (_sP6M_gui = '-1') then
        _sP6M_gui := ConvertPointToComma(str);
    end;
  end;

  //Convert Dose/pulse (_sP9_gui) unit nGy/p
  dDose := 0;
  if (_sP9_gui_unit <> '') then begin
    doseScale := 1.0;
    if (_sP9_gui_unit[1] = 'u') then
      doseScale := 1.0E3;
    if (_sP9_gui_unit[1] = 'm') then
      doseScale := 1.0E6;
    if (_sP9_gui_unit[1] = 'G') then // No prefix
      doseScale := 1.0E9;
    if (doseScale > 1.0) then begin
      if not (_sP9_gui = '-1') then
        dDose := SafeFloatConvert(_sP9_gui);
      if not (_sP9E_gui = '-1') then
        dDose := SafeFloatConvert(_sP9E_gui);
      dDose     := dDose * doseScale;
      str       := FloatToStr(dDose);
      if not (_sP9_gui = '-1') then
        _sP9_gui := ConvertPointToComma(str);
      if not (_sP9E_gui = '-1') then
        _sP9E_gui := ConvertPointToComma(str);
    end;
  end;

  //Convert Doserate/pulse (_sP10_gui) unit nGy/p
  if (_sP10_gui_unit <> '') then begin
    doseScale := 1.0;
    if (_sP10_gui_unit[1] = 'u') then
      doseScale := 1.0E3;
    if (_sP10_gui_unit[1] = 'm') then
      doseScale := 1.0E6;
    if (_sP10_gui_unit[1] = 'G') then // No prefix
      doseScale := 1.0E9;
    if (doseScale > 1.0) then begin
      if not (_sP10_gui = '-1') then
        dDose := SafeFloatConvert(_sP10_gui);
      if not (_sP10E_gui = '-1') then
        dDose := SafeFloatConvert(_sP10E_gui);
      dDose     := dDose * doseScale;
      str       := FloatToStr(dDose);
      if not (_sP10_gui = '-1') then
        _sP10_gui := ConvertPointToComma(str);
      if not (_sP10E_gui = '-1') then
        _sP10E_gui := ConvertPointToComma(str);
    end;
  end;

  //Convert PulseWidth (_sP11_gui) unit ms
  if (_sP11_gui_unit <> '') then begin
    scale := 1.0E3;
    if (_sP11_gui_unit[1] = 'm') then
      scale := 1.0;
    if (scale > 1.0) then begin
      if not (_sP11_gui = '-1') then
        tmpScale   := SafeFloatConvert(_sP11_gui);
      if not (_sP11E_gui = '-1') then
        tmpScale   := SafeFloatConvert(_sP11E_gui);
      tmpScale  := tmpScale * scale;
      str       := FloatToStr(tmpScale);
      if not (_sP11_gui = '-1') then
        _sP11_gui := ConvertPointToComma(str);
      if not (_sP11E_gui = '-1') then
        _sP11E_gui := ConvertPointToComma(str);
    end;
  end;

  //Convert Pulse Eff. time (_sP13_gui) unit ms
  if (_sP13_gui_unit <> '') then begin
    scale := 1.0E3;
    if (_sP13_gui_unit[1] = 'm') then
      scale := 1.0;
    if (scale > 1.0) then begin
      if not (_sP13_gui = '-1') then
        tmpScale   := SafeFloatConvert(_sP13_gui);
      if not (_sP13E_gui = '-1') then
        tmpScale   := SafeFloatConvert(_sP13E_gui);
      tmpScale  := tmpScale * scale;
      str       := FloatToStr(tmpScale);
      if not (_sP13_gui = '-1') then
        _sP13_gui := ConvertPointToComma(str);
      if not (_sP13E_gui = '-1') then
        _sP13E_gui := ConvertPointToComma(str);
    end;
  end;

  //Convert mAs (_sP14EM_gui) unit mAs
  if (_sP14EM_gui_unit <> '') then begin
    scale := 1.0;
    if (_sP14EM_gui_unit[1] = 'A') then  // No prefix
      scale := 1.0E3;
    if (scale > 1.0) then begin
      if not (_sP14EM_gui = '-1') then  begin
        tmpScale   := SafeFloatConvert(_sP14EM_gui);
        tmpScale  := tmpScale * scale;
        str       := FloatToStr(tmpScale);
        _sP14EM_gui := ConvertPointToComma(str);
      end;
    end;
  end;

  //Convert mAs/p (_sP16EM_gui) unit mAs/p
  if (_sP16EM_gui_unit <> '') then begin
    scale := 1.0;
    if (_sP16EM_gui_unit[1] = 'A') then  // No prefix
      scale := 1.0E3;
    if (scale > 1.0) then begin
      if not (_sP16EM_gui = '-1') then  begin
        tmpScale   := SafeFloatConvert(_sP16EM_gui);
        tmpScale  := tmpScale * scale;
        str       := FloatToStr(tmpScale);
        _sP16EM_gui := ConvertPointToComma(str);
      end;
    end;
  end;

  //Convert cd/m2 (_sP18E_gui) unit cd/m2
  if (_sP18E_gui_unit <> '') then begin
    scale := 1.0;
    if (_sP18E_gui_unit[1] = 'k') then
      scale := 1.0E3;
    if (scale > 1.0) then begin
      if not (_sP18E_gui = '-1') then  begin
        tmpScale   := SafeFloatConvert(_sP18E_gui);
        tmpScale  := tmpScale * scale;
        str       := FloatToStr(tmpScale);
        _sP18E_gui := ConvertPointToComma(str);
      end;
    end;
  end;

  //Convert lx (_sP19E_gui) unit lx
  if (_sP19E_gui_unit <> '') then begin
    scale := 1.0;
    if (_sP19E_gui_unit[1] = 'k') then
      scale := 1.0E3;
    if (scale > 1.0) then begin
      if not (_sP19E_gui = '-1') then  begin
        tmpScale   := SafeFloatConvert(_sP19E_gui);
        tmpScale  := tmpScale * scale;
        str       := FloatToStr(tmpScale);
        _sP19E_gui := ConvertPointToComma(str);
      end;
    end;
  end;

  //Convert Doselength (_sP20E_gui) unit uGy*m
  if (_sP20E_gui_unit <> '') then begin
    scale := 1.0;
    if (_sP20E_gui_unit[1] = 'm') then
      scale := 1.0E3;
    if (_sP20E_gui_unit[1] = 'G') then  // No prefix
      scale := 1.0E6;
    if (_sP20E_gui_unit[1] = 'k') then
      scale := 1.0E9;
    if (scale > 1.0) then begin
      if not (_sP20E_gui = '-1') then  begin
        tmpScale   := SafeFloatConvert(_sP20E_gui);
        tmpScale  := tmpScale * scale;
        str       := FloatToStr(tmpScale);
        _sP20E_gui := ConvertPointToComma(str);
      end;
    end;
  end;

  //Convert Doselength rate (_sP21E_gui) unit uGy*m/s
  if (_sP21E_gui_unit <> '') then begin
    scale := 1.0;
    if (_sP21E_gui_unit[1] = 'm') then
      scale := 1.0E3;
    if (scale > 1.0) then begin
      if not (_sP21E_gui = '-1') then  begin
        tmpScale   := SafeFloatConvert(_sP21E_gui);
        tmpScale  := tmpScale * scale;
        str       := FloatToStr(tmpScale);
        _sP21E_gui := ConvertPointToComma(str);
      end;
    end;
  end;

  // Convert '.' to ','
  _sS1 := ConvertPointToComma(_sS1);
  _sS2 := ConvertPointToComma(_sS2);
  _sS3 := ConvertPointToComma(_sS3);
  _sS4 := ConvertPointToComma(_sS4);

    _sP1A_gui             := ConvertPointToComma(_sP1A_gui);
    _sP1B_gui             := ConvertPointToComma(_sP1B_gui);
    _sP2_gui              := ConvertPointToComma(_sP2_gui);
    _sP2E_gui             := ConvertPointToComma(_sP2E_gui);
    _sP3_gui              := ConvertPointToComma(_sP3_gui);
    _sP3E_gui             := ConvertPointToComma(_sP3E_gui);
    _sP4_gui              := ConvertPointToComma(_sP4_gui);
    _sP5_gui              := ConvertPointToComma(_sP5_gui);
    _sP6_gui              := ConvertPointToComma(_sP6_gui);
    _sP6E_gui             := ConvertPointToComma(_sP6E_gui);
    _sP6M_gui             := ConvertPointToComma(_sP6M_gui);
    _sP7_gui              := ConvertPointToComma(_sP7_gui);
    _sP7E_gui             := ConvertPointToComma(_sP7E_gui);
    _sP8_gui              := ConvertPointToComma(_sP8_gui);
    _sP8E_gui             := ConvertPointToComma(_sP8E_gui);
    _sP9_gui              := ConvertPointToComma(_sP9_gui);
    _sP9E_gui             := ConvertPointToComma(_sP9E_gui);
    _sP10_gui             := ConvertPointToComma(_sP10_gui);
    _sP10E_gui            := ConvertPointToComma(_sP10E_gui);
    _sP11_gui             := ConvertPointToComma(_sP11_gui);
    _sP11E_gui            := ConvertPointToComma(_sP11E_gui);
    _sP12_gui             := ConvertPointToComma(_sP12_gui);
    _sP12E_gui            := ConvertPointToComma(_sP12E_gui);
    _sP13_gui             := ConvertPointToComma(_sP13_gui);
    _sP13E_gui            := ConvertPointToComma(_sP13E_gui);
    _sP14EM_gui           := ConvertPointToComma(_sP14EM_gui);
    _sP15EM_gui           := ConvertPointToComma(_sP15EM_gui);
    _sP16EM_gui           := ConvertPointToComma(_sP16EM_gui);
    _sP17EM_gui           := ConvertPointToComma(_sP17EM_gui);
    _sP18E_gui            := ConvertPointToComma(_sP18E_gui);
    _sP19E_gui            := ConvertPointToComma(_sP19E_gui);
    _sP20E_gui            := ConvertPointToComma(_sP20E_gui);
    _sP21E_gui            := ConvertPointToComma(_sP21E_gui);

    // Calc variables
    _sP1A             := ConvertPointToComma(_sP1A);
    _sP1B             := ConvertPointToComma(_sP1B);
    _sP2              := ConvertPointToComma(_sP2);
    _sP2E             := ConvertPointToComma(_sP2E);
    _sP3              := ConvertPointToComma(_sP3);
    _sP3E             := ConvertPointToComma(_sP3E);
    _sP4A             := ConvertPointToComma(_sP4A);
    _sP4              := ConvertPointToComma(_sP4);
    _sP5A             := ConvertPointToComma(_sP5A);
    _sP5              := ConvertPointToComma(_sP5);
    _sP6              := ConvertPointToComma(_sP6);
    _sP6E             := ConvertPointToComma(_sP6E);
    _sP6M             := ConvertPointToComma(_sS1);
    _sP7              := ConvertPointToComma(_sP7);
    _sP7E             := ConvertPointToComma(_sP7E);
    _sP7M             := ConvertPointToComma(_sP7M);
    _sP8              := ConvertPointToComma(_sP8);
    _sP8E             := ConvertPointToComma(_sP8E);
    _sP8M             := ConvertPointToComma(_sP8M);
    _sP9              := ConvertPointToComma(_sP9);
    _sP9E             := ConvertPointToComma(_sP9E);
    _sP10             := ConvertPointToComma(_sP10);
    _sP10E            := ConvertPointToComma(_sP10E);
    _sP11             := ConvertPointToComma(_sP11);
    _sP11E            := ConvertPointToComma(_sP11E);
    _sP11M            := ConvertPointToComma(_sP11M);
    _sP12             := ConvertPointToComma(_sP12);
    _sP12E            := ConvertPointToComma(_sP12E);
    _sP12M            := ConvertPointToComma(_sP12M);
    _sP13             := ConvertPointToComma(_sP13);
    _sP13E            := ConvertPointToComma(_sP13E);
    _sP13M            := ConvertPointToComma(_sP13M);
    _sP14E            := ConvertPointToComma(_sP14E);
    _sP14M            := ConvertPointToComma(_sP14M);
    _sP15E            := ConvertPointToComma(_sP15E);
    _sP15M            := ConvertPointToComma(_sP15M);
    _sP16E            := ConvertPointToComma(_sP16E);
    _sP16M            := ConvertPointToComma(_sP16M);
    _sP17E            := ConvertPointToComma(_sP17E);
    _sP17M            := ConvertPointToComma(_sP17M);
    _sP18E            := ConvertPointToComma(_sP18E);
    _sP19E            := ConvertPointToComma(_sP19E);
    _sP20             := ConvertPointToComma(_sP20);
    _sP21             := ConvertPointToComma(_sP21);

    // Raw parameters
    _sS1_int           := ConvertPointToComma(_sS1_int);
    _sS2_int           := ConvertPointToComma(_sS2_int);
    _sS3_int           := ConvertPointToComma(_sS3_int);
    _sS4_int           := ConvertPointToComma(_sS4_int);
    _sE1_int           := ConvertPointToComma(_sE1_int);
    _sE2_int           := ConvertPointToComma(_sE2_int);
    _sM1_int           := ConvertPointToComma(_sM1_int);
    _sS1               := ConvertPointToComma(_sS1);
    _sS2               := ConvertPointToComma(_sS2);
    _sS3               := ConvertPointToComma(_sS3);
    _sS4               := ConvertPointToComma(_sS4);
    _sE1               := ConvertPointToComma(_sE1);
    _sE2               := ConvertPointToComma(_sE2);
    _sS1_I             := ConvertPointToComma(_sS1_I);
    _sS2_I             := ConvertPointToComma(_sS2_I);
    _sS3_I             := ConvertPointToComma(_sS3_I);
    _sS4_I             := ConvertPointToComma(_sS4_I);
    _sE1_I             := ConvertPointToComma(_sE1_I);
    _sE2_I             := ConvertPointToComma(_sE2_I);
    _sSensitivity      := ConvertPointToComma(_sSensitivity);
    _sSensitivity_Ext  := ConvertPointToComma(_sSensitivity_Ext);
    _sS2_S2_Field      := ConvertPointToComma(_sS2_S2_Field);
    _sS2_S5_Field      := ConvertPointToComma(_sS2_S5_Field);
    _sS2_S6_Field      := ConvertPointToComma(_sS2_S6_Field);
    _sS4_S4_Field      := ConvertPointToComma(_sS4_S4_Field);
    _sS4_S7_Field      := ConvertPointToComma(_sS4_S7_Field);
    _sS4_S8_Field      := ConvertPointToComma(_sS4_S8_Field);

    // Intermediate results
    _sS2_S1_ratio        := ConvertPointToComma(_sS2_S1_ratio);
    _sS2_S3_ratio        := ConvertPointToComma(_sS2_S3_ratio);
    _sS4_S2_ratio        := ConvertPointToComma(_sS4_S2_ratio);
    _sS4_S3_ratio        := ConvertPointToComma(_sS4_S3_ratio);
    _skVLow              := ConvertPointToComma(_skVLow);
    _sTfLow              := ConvertPointToComma(_sTfLow);
    _skVHigh             := ConvertPointToComma(_skVHigh);
    _sTfHigh             := ConvertPointToComma(_sTfHigh);
    _sSelectedkVRange    := ConvertPointToComma(_sSelectedkVRange);
    _sPeakLevel          := ConvertPointToComma(_sPeakLevel);
    _skVpLow             := ConvertPointToComma(_skVpLow);
    _skVpHigh            := ConvertPointToComma(_skVpHigh);
    _sTfpLow             := ConvertPointToComma(_sTfpLow);
    _sTfpHigh            := ConvertPointToComma(_sTfpHigh);
    _sP1_Method          := ConvertPointToComma(_sP1_Method);
    _sSetting_kV         := ConvertPointToComma(_sSetting_kV);
    _sChargeS3           := ConvertPointToComma(_sChargeS3);
    _sChargeE1           := ConvertPointToComma(_sChargeE1);
    _sChargeE2           := ConvertPointToComma(_sChargeE2);
    _sDosePreEnergyComp  := ConvertPointToComma(_sDosePreEnergyComp);
    _sDosePostEnergyComp := ConvertPointToComma(_sDosePostEnergyComp);
    _sDoseCorrFactor     := ConvertPointToComma(_sDoseCorrFactor);

  // Remove all '+'
  _skV                 := AnsiReplaceStr(_skV, '+', '');
  _sTf                 := AnsiReplaceStr(_sTf, '+', '');
  _sHVL                := AnsiReplaceStr(_sHVL, '+', '');
  _sDose               := AnsiReplaceStr(_sDose, '+', '');
  _sDoseExt            := AnsiReplaceStr(_sDoseExt, '+', '');
  _sDoseRate           := AnsiReplaceStr(_sDoseRate, '+', '');
  _sS1                 := AnsiReplaceStr(_sS1, '+', '');
  _sS2                 := AnsiReplaceStr(_sS2, '+', '');
  _sS3                 := AnsiReplaceStr(_sS3, '+', '');
  _sS4                 := AnsiReplaceStr(_sS4, '+', '');
  _skVLow              := AnsiReplaceStr(_skVLow, '+', '');
  _sTfLow              := AnsiReplaceStr(_sTfLow, '+', '');
  _skVHigh             := AnsiReplaceStr(_skVHigh, '+', '');
  _sTfHigh             := AnsiReplaceStr(_sTfHigh, '+', '');
  _sPulseFreq          := AnsiReplaceStr(_sPulseFreq, '+', '');
  _sDosePerPulse       := AnsiReplaceStr(_sDosePerPulse, '+', '');
  _sDoseRatePerPulse   := AnsiReplaceStr(_sDoseRatePerPulse, '+', '');
  _sPulseIntermittens  := AnsiReplaceStr(_sPulseIntermittens, '+', '');
  _sPulseEffectiveTime := AnsiReplaceStr(_sPulseEffectiveTime, '+', '');
  _skVp                := AnsiReplaceStr(_skVp, '+', '');
  _sTfp                := AnsiReplaceStr(_sTfp, '+', '');

   // Calculate S1-S4 current
  dSCu   := Ch2Cu(dS1, dSTime);
  str    := FloatToStr(dSCu);
  _sS1Cu := ConvertPointToComma(str);
  dSCu   := Ch2Cu(dS2, dSTime);
  str    := FloatToStr(dSCu);
  _sS2Cu := ConvertPointToComma(str);
  dSCu   := Ch2Cu(dS3, dSTime);
  str    := FloatToStr(dSCu);
  _sS3Cu := ConvertPointToComma(str);
  dSCu   := Ch2Cu(dS4, dSTime);
  str    := FloatToStr(dSCu);
  _sS4Cu := ConvertPointToComma(str);

  // Get current date and time
  _sMeasureTime := DateTimeToStr(Now);

    lstItem:=ListFirmware.Items.Add();
    lstItem.Caption := _sP1A_gui             ;
    lstItem.SubItems.Add(_sP1B_gui)            ;
    lstItem.SubItems.Add(_sP2_gui)              ;
    lstItem.SubItems.Add(_sP2E_gui)             ;
    lstItem.SubItems.Add(_sP3_gui)              ;
    lstItem.SubItems.Add(_sP3E_gui)             ;
//    lstItem.SubItems.Add('')                    ;
    lstItem.SubItems.Add(_sP4_gui)              ;
//    lstItem.SubItems.Add('')                    ;
    lstItem.SubItems.Add(_sP5_gui)              ;
    lstItem.SubItems.Add(_sP6_gui)              ;
    lstItem.SubItems.Add(_sP6E_gui)             ;
    lstItem.SubItems.Add(_sP6M_gui)             ;
    lstItem.SubItems.Add(_sP7_gui)              ;
    lstItem.SubItems.Add(_sP7E_gui)             ;
    lstItem.SubItems.Add(_sP8_gui)              ;
    lstItem.SubItems.Add(_sP8E_gui)             ;
    lstItem.SubItems.Add(_sP9_gui)              ;
    lstItem.SubItems.Add(_sP9E_gui)             ;
    lstItem.SubItems.Add(_sP10_gui)             ;
    lstItem.SubItems.Add(_sP10E_gui)            ;
    lstItem.SubItems.Add(_sP11_gui)             ;
    lstItem.SubItems.Add(_sP11E_gui)            ;
    lstItem.SubItems.Add(_sP12_gui)             ;
    lstItem.SubItems.Add(_sP12E_gui)            ;
    lstItem.SubItems.Add(_sP13_gui)             ;
    lstItem.SubItems.Add(_sP13E_gui)            ;
    lstItem.SubItems.Add(_sP14EM_gui)           ;
    lstItem.SubItems.Add(_sP15EM_gui)           ;
    lstItem.SubItems.Add(_sP16EM_gui)           ;
    lstItem.SubItems.Add(_sP17EM_gui)           ;
    lstItem.SubItems.Add(_sP18E_gui)           ;
    lstItem.SubItems.Add(_sP19E_gui)            ;
    lstItem.SubItems.Add(_sP20E_gui)             ;
    lstItem.SubItems.Add(_sP21E_gui)             ;
    lstItem.SubItems.Add('')             ;
    lstItem.SubItems.Add('')             ;

    // Calc variables
    lstItem.SubItems.Add(_sP1A)             ;
    lstItem.SubItems.Add(_sP1B)             ;
    lstItem.SubItems.Add(_sP2)              ;
    lstItem.SubItems.Add(_sP2E)             ;
    lstItem.SubItems.Add(_sP3)              ;
    lstItem.SubItems.Add(_sP3E)             ;
    lstItem.SubItems.Add(_sP4A)             ;
    lstItem.SubItems.Add(_sP4)              ;
    lstItem.SubItems.Add(_sP5A)             ;
    lstItem.SubItems.Add(_sP5)              ;
    lstItem.SubItems.Add(_sP6)              ;
    lstItem.SubItems.Add(_sP6E)             ;
    lstItem.SubItems.Add(_sP6M)             ;
    lstItem.SubItems.Add(_sP7)              ;
    lstItem.SubItems.Add(_sP7E)             ;
    lstItem.SubItems.Add(_sP7M)             ;
    lstItem.SubItems.Add(_sP8)              ;
    lstItem.SubItems.Add(_sP8E)             ;
    lstItem.SubItems.Add(_sP8M)             ;
    lstItem.SubItems.Add(_sP9)              ;
    lstItem.SubItems.Add(_sP9E)             ;
    lstItem.SubItems.Add(_sP10)             ;
    lstItem.SubItems.Add(_sP10E)            ;
    lstItem.SubItems.Add(_sP11)             ;
    lstItem.SubItems.Add(_sP11E)            ;
    lstItem.SubItems.Add(_sP11M)            ;
    lstItem.SubItems.Add(_sP12)             ;
    lstItem.SubItems.Add(_sP12E)            ;
    lstItem.SubItems.Add(_sP12M)            ;
    lstItem.SubItems.Add(_sP13)             ;
    lstItem.SubItems.Add(_sP13E)            ;
    lstItem.SubItems.Add(_sP13M)            ;
    lstItem.SubItems.Add(_sP14E)           ;
    lstItem.SubItems.Add(_sP14M)           ;
    lstItem.SubItems.Add(_sP15E)           ;
    lstItem.SubItems.Add(_sP15M)           ;
    lstItem.SubItems.Add(_sP16E)           ;
    lstItem.SubItems.Add(_sP16M)           ;
    lstItem.SubItems.Add(_sP17E)           ;
    lstItem.SubItems.Add(_sP17M)           ;
    lstItem.SubItems.Add(_sP18E)           ;
    lstItem.SubItems.Add(_sP19E)            ;
    lstItem.SubItems.Add(_sP20)             ;
    lstItem.SubItems.Add(_sP21)             ;
    lstItem.SubItems.Add('')             ;
    lstItem.SubItems.Add('')             ;

    // Raw parameters
    lstItem.SubItems.Add(_sS1_int)           ;    // SUM1
    lstItem.SubItems.Add(_sS2_int)           ;    // SUM2
    lstItem.SubItems.Add(_sS3_int)           ;    // SUM3
    lstItem.SubItems.Add(_sS4_int)           ;    // SUM4
    lstItem.SubItems.Add(_sE1_int)           ;
    lstItem.SubItems.Add(_sE2_int)           ;
    lstItem.SubItems.Add(_sM1_int)           ;
    lstItem.SubItems.Add(_sS1)               ;
    lstItem.SubItems.Add(_sS2)               ;
    lstItem.SubItems.Add(_sS3)              ;
    lstItem.SubItems.Add(_sS4)               ;
    lstItem.SubItems.Add(_sE1)              ;
    lstItem.SubItems.Add(_sE2)               ;
    lstItem.SubItems.Add(_sS1_I)             ;
    lstItem.SubItems.Add(_sS2_I)             ;
    lstItem.SubItems.Add(_sS3_I)             ;
    lstItem.SubItems.Add(_sS4_I)             ;
    lstItem.SubItems.Add(_sE1_I)             ;
    lstItem.SubItems.Add(_sE2_I)            ;
    lstItem.SubItems.Add(_sSensitivity)     ;
    lstItem.SubItems.Add(_sSensitivity_Ext)  ;
    lstItem.SubItems.Add('')             ;
    lstItem.SubItems.Add('')             ;

    // Intermediate results
    lstItem.SubItems.Add(_sS2_S1_ratio)        ;
    lstItem.SubItems.Add(_sS2_S3_ratio)        ;
    lstItem.SubItems.Add(_sS4_S2_ratio)        ;
    lstItem.SubItems.Add(_sS4_S3_ratio)        ;
    lstItem.SubItems.Add(_skVLow)              ;
    lstItem.SubItems.Add(_sTfLow)             ;
    lstItem.SubItems.Add(_skVHigh)             ;
    lstItem.SubItems.Add(_sTfHigh)             ;
    lstItem.SubItems.Add(_sSelectedkVRange)    ;
    lstItem.SubItems.Add(_sPeakLevel)          ;
    lstItem.SubItems.Add(_skVpLow)             ;
    lstItem.SubItems.Add(_skVpHigh)            ;
    lstItem.SubItems.Add(_sTfpLow)             ;
    lstItem.SubItems.Add(_sTfpHigh)            ;
    lstItem.SubItems.Add(_sSelectedkVRange)    ;
    lstItem.SubItems.Add(_sP1_Method)          ;
    lstItem.SubItems.Add(_sSetting_kV)         ;
    lstItem.SubItems.Add(_sChargeS3)           ;
    lstItem.SubItems.Add(_sChargeE1)           ;
    lstItem.SubItems.Add(_sChargeE2)           ;
    lstItem.SubItems.Add(_sDosePreEnergyComp)  ;
    lstItem.SubItems.Add(_sDosePostEnergyComp) ;
    lstItem.SubItems.Add(_sDoseCorrFactor)     ;
    lstItem.SubItems.Add('')             ;
    lstItem.SubItems.Add('')             ;

    lstItem.SubItems.Add(_sS1_int)           ;        // S1
    lstItem.SubItems.Add(_sS2_S2_Field)      ;        // S2
    lstItem.SubItems.Add(_sS3_int)           ;        // S3
    lstItem.SubItems.Add(_sS4_S4_Field)      ;        // S4
    lstItem.SubItems.Add(_sS2_S5_Field)      ;        // S5
    lstItem.SubItems.Add(_sS2_S6_Field)      ;        // S6
    lstItem.SubItems.Add(_sS4_S7_Field)      ;        // S7
    lstItem.SubItems.Add(_sS4_S8_Field)      ;        // S8

    lstItem.SubItems.Add('')             ;
    lstItem.SubItems.Add('')             ;

    lstItem.SubItems.Add(edtModelType.Text)     ;
    lstItem.SubItems.Add(edtSerialNum.Text)     ;
    lstItem.SubItems.Add(edtFirmwareVersion.Text)     ;
    lstItem.SubItems.Add(_sMeasureTime)     ;


  // Make a string with the values, Tab-separated

  str := lstItem.Caption + #9;
  i := 0;
  while (i < lstItem.SubItems.Count) do begin
    str := str + lstItem.SubItems.Strings[i];
    str := str + #9;  // Tab
    Inc(i);
  end;

  // Put the string to Clipboard (if enabled)
  if chkEnableClipboard.Checked then
    Clipboard.AsText := str;

  // Send string to Excel
  SendToExcel_fw(str);

  // Put the string in the log
  Print(' ');
  Print('-- measData start');
  Print('-- ' + str);
  Print('-- measData end');
  Print(' ');

  StoreLogToFile(false);  // Store the log to the log-file
end;

procedure TfrmMain.mem_meascalcinfoChange(Sender: TObject);
begin

end;

// Clear the Excel string in the ListFirmware view
procedure TfrmMain.clearFirmwareExcelString();
begin
    _sP1A_gui             := '-1';
    _sP1B_gui             := '-1';
    _sP2_gui              := '-1';
    _sP2E_gui             := '-1';
    _sP3_gui              := '-1';
    _sP3E_gui             := '-1';
    _sP4_gui              := '-1';
    _sP5_gui              := '-1';
    _sP6_gui              := '-1';
    _sP6E_gui             := '-1';
    _sP6M_gui             := '-1';
    _sP7_gui              := '-1';
    _sP7E_gui             := '-1';
    _sP8_gui              := '-1';
    _sP8E_gui             := '-1';
    _sP9_gui              := '-1';
    _sP9E_gui             := '-1';
    _sP10_gui             := '-1';
    _sP10E_gui            := '-1';
    _sP11_gui             := '-1';
    _sP11E_gui            := '-1';
    _sP12_gui             := '-1';
    _sP12E_gui            := '-1';
    _sP13_gui             := '-1';
    _sP13E_gui            := '-1';
    _sP14EM_gui           := '-1';
    _sP15EM_gui           := '-1';
    _sP16EM_gui           := '-1';
    _sP17EM_gui           := '-1';
    _sP18E_gui            := '-1';
    _sP19E_gui            := '-1';
    _sP20E_gui            := '-1';
    _sP21E_gui            := '-1';

    // Calc variables
    _sP1A             := '-1';
    _sP1B             := '-1';
    _sP2              := '-1';
    _sP2E             := '-1';
    _sP3              := '-1';
    _sP3E             := '-1';
    _sP4A             := '-1';
    _sP4              := '-1';
    _sP5A             := '-1';
    _sP5              := '-1';
    _sP6              := '-1';
    _sP6E             := '-1';
    _sP6M             := '-1';
    _sP7              := '-1';
    _sP7E             := '-1';
    _sP7M             := '-1';
    _sP8              := '-1';
    _sP8E             := '-1';
    _sP8M             := '-1';
    _sP9              := '-1';
    _sP9E             := '-1';
    _sP10             := '-1';
    _sP10E            := '-1';
    _sP11             := '-1';
    _sP11E            := '-1';
    _sP11M            := '-1';
    _sP12             := '-1';
    _sP12E            := '-1';
    _sP12M            := '-1';
    _sP13             := '-1';
    _sP13E            := '-1';
    _sP13M           := '-1';
    _sP14E           := '-1';
    _sP14M           := '-1';
    _sP15E           := '-1';
    _sP15M           := '-1';
    _sP16E           := '-1';
    _sP16M           := '-1';
    _sP17E           := '-1';
    _sP17M           := '-1';
    _sP18E           := '-1';
    _sP19E            := '-1';
    _sP20             := '-1';
    _sP21             := '-1';

    // Raw parameters
    _sS1_int           := '-1';
    _sS2_int           := '-1';
    _sS3_int           := '-1';
    _sS4_int           := '-1';
    _sE1_int           := '-1';
    _sE2_int           := '-1';
    _sM1_int           := '-1';
    _sS1               := '-1';
    _sS2               := '-1';
    _sS3               := '-1';
    _sS4               := '-1';
    _sE1               := '-1';
    _sE2               := '-1';
    _sS1_I             := '-1';
    _sS2_I             := '-1';
    _sS3_I             := '-1';
    _sS4_I             := '-1';
    _sE1_I             := '-1';
    _sE2_I             := '-1';
    _sSensitivity      := '-1';
    _sSensitivity_Ext  := '-1';
    _sS2_S2_Field      := '-1';
    _sS2_S5_Field      := '-1';
    _sS2_S6_Field      := '-1';
    _sS4_S4_Field      := '-1';
    _sS4_S7_Field      := '-1';
    _sS4_S8_Field      := '-1';

    // Intermediate results
    _sS2_S1_ratio        := '-1';
    _sS2_S3_ratio        := '-1';
    _sS4_S2_ratio        := '-1';
    _sS4_S3_ratio        := '-1';
    _skVLow              := '-1';
    _sTfLow              := '-1';
    _skVHigh             := '-1';
    _sTfHigh             := '-1';
    _sSelectedkVRange    := '-1';
    _sPeakLevel          := '-1';
    _skVpLow             := '-1';
    _skVpHigh            := '-1';
    _sTfpLow             := '-1';
    _sTfpHigh            := '-1';
    _sP1_Method          := '-1';
    _sSetting_kV         := '-1';
    _sChargeS3           := '-1';
    _sChargeE1           := '-1';
    _sChargeE2           := '-1';
    _sDosePreEnergyComp  := '-1';
    _sDosePostEnergyComp := '-1';
    _sDoseCorrFactor     := '-1';



end;

procedure TfrmMain.InitiateLastExp();
var I : Integer;
begin
  for I := 0 to (lvRing.Items.Count - 1) do begin
    lvRing.Items.Item[I].SubItems[_subitems] := '0';
  end;
end;

procedure TfrmMain.Send1Click(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to memo1.Lines.Count-1 do
  begin
    SendCommand(memo1.Lines.Strings[i]);
    Delay(50);
  end;
end;

// Note the cmd shall have '    ' as the CRC value (not 'XXXX')
// This function will calculate a CRC16 value and replace the '    ' with this CRC value
function TfrmMain.SendExternalProtocolCommand(cmd : AnsiString) : boolean;
var
    byBuffer           : array[1..txBufSize] of Byte;
    i                  : Integer;
    crc16Val           : Word;
    crc16SysVerString  : AnsiString;
    crc16SNString      : AnsiString;
    crc16CommandString : AnsiString;
    txString           : AnsiString;
begin
    // Calculate CRC16 and put it in the commnd
    for i:=1 to Length(cmd) do
        byBuffer[i] := ord(cmd[i]);
    crc16Val := CalcCRC16(@byBuffer[1], Length(cmd), 0);
    crc16CommandString := IntToHex(crc16Val, 4);
    txString := AnsiReplaceStr(cmd, '    ', crc16CommandString); // Replace '    ' with the CRC

    // Send the command
    Result := SendCommand(txString);
end;

function TfrmMain.SendCommand(cmd : string) : boolean;
begin
   Result := false;

   if (_CobiaComSource = USB_CDC) then begin
     if SendCobiaCommandCom(cmd) then
       Result := true;
   end else if (_CobiaComSource = USB_HID) then begin
     if frmMain._hid.Send(cmd) then begin
       Result := true;
     end else
       frmMain.Print(frmMain._hid._error);
   end;

  // Print the message in log if sent ok
  if (Result) and (Length(cmd) > 1) then
     frmMain.Print('> ' + cmd);
end;

function TfrmMain.HexStrToInt(str : string) : Integer;
  function HexCharToInt(str : string) : Integer;
var
  value : Integer;
begin
  if (str[1] = 'A') then begin
    value := 10;
  end else if (str[1] = 'B') then begin
    value := 11;
  end else if (str[1] = 'C') then begin
    value := 12;
  end else if (str[1] = 'D') then begin
    value := 13;
  end else if (str[1] = 'E') then begin
    value := 14;
  end else if (str[1] = 'F') then begin
    value := 15;
  end else begin
    value := StrToInt(str[1]);
  end;
  HexCharToInt := value;
end;
var
  value : Integer;
begin
  value := HexCharToInt(AnsiMidStr(str, 2, 1));
  value := value + 16*HexCharToInt(AnsiMidStr(str, 1, 1));
  HexStrToInt := value;
end;

procedure TfrmMain.highElChargeCalValSaveClick(Sender: TObject);
begin
  SendCommand('nvmem;set;calibext;1;' +
      ConvertCommaToPoint(highElChargeCalValEdit.Text));
end;

procedure TfrmMain.highMasCalValSaveClick(Sender: TObject);
begin
  SendCommand('nvmem;set;calibmas;1;' +
      ConvertCommaToPoint(highMasCalValEdit.Text));
end;

procedure TfrmMain.ExtractDetectorSamples(samples : array of integer);
var
  I, pos : Integer;
  s : array [1..8] of Integer;
begin
  pos := 1;
  for I := 1 to 4 do begin
    s[2*I-1] := _wfCurrentSample[pos] * 4096;
    Inc(pos);
    s[2*I-1] := s[2*I-1] + _wfCurrentSample[pos] * 16;
    Inc(pos);
    s[2*I-1] := s[2*I-1] + _wfCurrentSample[pos] Div 16;
    s[2*I] := (_wfCurrentSample[pos] Mod 16) * 65536;
    Inc(pos);
    s[2*I] := s[2*I] + _wfCurrentSample[pos] * 256;
    Inc(pos);
    s[2*I] := s[2*I] + _wfCurrentSample[pos];
    Inc(pos);
  end;
  frmWaveform.AddDetectorArray(s);
end;

procedure TfrmMain.InputReaction_wf_read(line : string);
var
  I, pos, len: Integer;
begin
  pos := 0;
  len := Length(line);
  I := 0;

  while I < len do begin
    _wfCurrentSample[_wfCurrentSampleIndex] := HexStrToInt(AnsiMidStr(line, _wfCurrentIndex, 2));
    Inc(_wfCurrentSampleIndex);
    _wfCurrentIndex := _wfCurrentIndex + 2;
    I := I + 2;
    // A full sample byte array has been detected
    if (_wfCurrentSampleIndex = 21) then begin
      _wfCurrentSampleIndex := 1;
      ExtractDetectorSamples(_wfCurrentSample);
      Inc(_wfNumSamples);
    end;
    if (_wfNumSamples = 25) then begin
      _wfNumSamples := 0;
      pos := HexStrToInt(AnsiMidStr(line, 41, 2));
      if ((pos <> 255) And (frmWaveform._wfIndexTrigStart = 0)) then begin
        frmWaveform._wfIndexTrigStart := pos;
        pos := HexStrToInt(AnsiMidStr(line, 45, 2));
        frmWaveform._wfIndexTrigStartIntSide := pos;
        frmWaveform._wfIndexTrigEnd := 0;
      end;
      pos := HexStrToInt(AnsiMidStr(line, 43, 2));
      if (pos <> 255) then begin
        frmWaveform._wfIndexTrigEnd := frmWaveform._wfIndexTrigEnd + pos;
        frmWaveform.Plot();
      end else begin
        frmWaveform._wfIndexTrigEnd := frmWaveform._wfIndexTrigEnd + 25;
      end;
      I := len;
    end;
  end;
  _wfCurrentIndex := 1;
end;

// Write the string to the opened Excel document
procedure TfrmMain.SendToExcel_fw(inputStr : string); // inputStr has Tab separated values
procedure SetFromPanel(valueStr: string);
var
iCol       : Integer;
validFloat : bool;
fValue     : Extended;
begin
  FormatSettings.DecimalSeparator := ',';   // Here decimal separator is ','

   // Check if string is a valid float value
  validFloat := false;
  if (TryStrToFloat(valueStr, fValue)) then begin
    validFloat := true;           // String is a valid float
  end;

  if (validFloat) then begin
    optCellValue.Checked:=true;   // Digits -> float
  end else begin
    optCellValue.Checked:=false;    // Not digits -> string
  end;

  edtCellValue.Text := valueStr;
  btnSetValueClick(self);

  iCol:=StrToInt(edtCol.Text);
  Inc(iCol);
  edtCol.Text:=IntToStr(iCol);
end;
var
iRow, iColSave, index, oldIndex : Integer;
str : string;
begin
  if chkExcelfw.Checked = false then Exit;
  if chkExcelfw.Enabled = false then Exit;

  chkUseActiveCell.Checked:=true;

  btnActiveCellClick(self);
  iColSave:=StrToInt(edtCol.Text);

  // Go through the string and put each Tab-separated value to separated columns in Excel
  index    := 1;
  oldIndex := 1;
  while (index <= Length(inputStr)) do begin
    // Search for Tab-separates
    if ((inputStr[index] = #9) or (index = Length(inputStr))) then begin
       str := Copy(inputStr, oldIndex, (index-oldIndex));
       oldIndex := index  + 1;
       SetFromPanel(str);
       chkUseActiveCell.Checked := false;
    end;
    Inc(index);
  end;

  optCellValue.Checked:=true;
  //Move one row down and start from the beginning column again
  iRow:=StrToInt(edtRow.Text);
  Inc(iRow);
  edtRow.Text:=IntToStr(iRow);
  edtCol.Text:=IntToStr(iColSave);

  if Assigned(MyApp) then
    MyApp.ExcelSelectCell(StrToInt(edtRow.Text), StrToInt(edtCol.Text));
end;

procedure TfrmMain.SendToExcel();
procedure SetFromPanel(pnl_in: TPanel; chk_in: TCheckBox);
var
iCol: Integer;
begin
  if chk_in.Checked = false then Exit;

  edtCellValue.Text := pnl_in.Caption;
  btnSetValueClick(self);

  iCol:=StrToInt(edtCol.Text);
  Inc(iCol);
  edtCol.Text:=IntToStr(iCol);
end;
var
iRow, iCol, iColSave: Integer;
begin
  if chkExcel.Checked = false then Exit;
  if chkExcel.Enabled = false then Exit;
  chkUseActiveCell.Checked:=true;
  btnActiveCellClick(self);
  iColSave:=StrToInt(edtCol.Text);
  //kV calc
  SetFromPanel(pnlKVcalc, chkKVcalc);
  chkUseActiveCell.Checked:=false;
  //TF calc
  SetFromPanel(pnlTFcalc, chkTFcalc);
  //Dose
  SetFromPanel(pnlDose, chkDose);
  //HVL
  SetFromPanel(pnlHvl, chkHvl);
  //kV ratio
  SetFromPanel(pnlKVratio, chkKVratio);
  //TF ratio
  SetFromPanel(pnlTFratio, chkTFratio);
  //Time
  SetFromPanel(pnlTime, chkTime);
  //S1
  SetFromPanel(pnlS1, chkS1);
  //S2
  SetFromPanel(pnlS2, chkS2);
  //S3
  SetFromPanel(pnlS3, chkS3);
  //S4
  SetFromPanel(pnlS4, chkS4);
  //S1Cu
  SetFromPanel(pnlS1Cu, chkS1Cu);
  //S2Cu
  SetFromPanel(pnlS2Cu, chkS2Cu);
  //S3Cu
  SetFromPanel(pnlS3Cu, chkS3Cu);
  //S4Cu
  SetFromPanel(pnlS4Cu, chkS4Cu);
  //Sens
  edtCellValue.Text := 'High sens';
  if iSensitivity > 0 then
    edtCellValue.Text := 'Low sens';
  optCellString.Checked:=true;
  btnSetValueClick(self);

  iCol:=StrToInt(edtCol.Text);
  Inc(iCol);
  edtCol.Text:=IntToStr(iCol);
  //kV-range
  edtCellValue.Text := 'High kV Range';
  if optLowKvRange.Checked = true then
    edtCellValue.Text := 'Low kV Range';
  btnSetValueClick(self);

  iCol:=StrToInt(edtCol.Text);
  Inc(iCol);
  edtCol.Text:=IntToStr(iCol);

  optCellValue.Checked:=true;
  //Move one row down and start from the beginning column again
  iRow:=StrToInt(edtRow.Text);
  Inc(iRow);
  edtRow.Text:=IntToStr(iRow);
  edtCol.Text:=IntToStr(iColSave);

  if Assigned(MyApp) then
    MyApp.ExcelSelectCell(StrToInt(edtRow.Text), StrToInt(edtCol.Text));
end;

function TfrmMain.KVRatio(dS1_in, dS2_in, dS3_in, dS4_in: Extended): Extended;
begin
  Result:=-1.0;
  if (optLowKVRange.Checked) and (dS1_in<>0.0) then
  begin
    if dS1_in = -1 then Result := -1.0
    else if dS2_in = -1 then Result := -1.0
    else Result:=dS2_in/dS1_in;
  end
  else if (optHighKVRange.Checked) and (dS2_in<>0.0) then
  begin
    if dS2_in = -1 then Result := -1.0
    else if dS4_in = -1 then Result := -1.0
    else Result:=dS4_in/dS2_in;
  end;
end;

procedure TfrmMain.optHighKVRangeClick(Sender: TObject);
begin
  SendCommand('ms_kvrange;1');
end;

procedure TfrmMain.optLowKVRangeClick(Sender: TObject);
begin
  SendCommand('ms_kvrange;0');
end;

function TfrmMain.KV_TfCalc(dkVRatio_in, dTfRatio_in: Extended; var dTf_out: Extended): Extended;
begin
  Result := pPolys.CalcKv_Tf(edtTfSet.Text, optLowKvRange.Checked, dkVRatio_in, dTfRatio_in, dTF_out);
end;


procedure TfrmMain.lowElChargeCalValSaveClick(Sender: TObject);
begin
  SendCommand('nvmem;set;calibext;0;' +
    ConvertCommaToPoint(lowElChargeCalValEdit.Text));
  SendCommand('nvmem;set;calibext;1;' +
    ConvertCommaToPoint(highElChargeCalValEdit.Text));

  // Send command to remove CRC check file - to prevent CRC error
  SendCommand_EraseCalCRC();
end;

procedure TfrmMain.lowMasCalValSaveClick(Sender: TObject);
begin
  SendCommand('nvmem;set;calibmas;0;' +
    ConvertCommaToPoint(lowMasCalValEdit.Text));
  SendCommand('nvmem;set;calibmas;1;' +
    ConvertCommaToPoint(highMasCalValEdit.Text));

  // Send command to remove CRC check file - to prevent CRC error
  SendCommand_EraseCalCRC();
end;

function TfrmMain.TFCalc(dTFRatio_in: Extended): Extended;
begin
  Result:=-1.0;
  if (optLowKVRange.Checked) then
  begin
    if dTFRatio_in = -1.0 then Result := -1.0
    else Result:=dTFRatio_in;
  end
  else if (optHighKVRange.Checked) then
  begin
    if dTFRatio_in = -1.0 then Result := -1.0
    else Result:=dTFRatio_in;
  end;
end;

function TfrmMain.Hvl_Calc(dkVCalc_in, dTFCalc_in: Extended): Extended;
begin
  //Order in file:
  //(C*x6)+(C*x5)+(C*x4)+(C*x3)+(C*x2)+(C*x)+C, Lim_Hi, Lim_Lo, LimExt_Hi, LimExt_Lo
  Result := pPolys.CalcHvl(dkVCalc_in, dTFCalc_in);
end;

function TfrmMain.Dose(dS3_in: Extended): Extended;
begin
  Result:=0.0;
  if (optLowKVRange.Checked) then
    Result:=dS3_in
  else if (optHighKVRange.Checked) then
    Result:=dS3_in;
end;

procedure TfrmMain.DoseStoringClick(Sender: TObject);
begin
 Clipboard.AsText := edtDoseChargeValue.Text;
end;

procedure TfrmMain.DetectorTestClick(Sender: TObject);
var
  cmd        : String;
begin
  cmd := 'nvmem;set;vinnova;0x' +
    '0' + Copy(Signal1.Text, 2, 1)  +
    '0' + Copy(Signal2.Text, 2, 1)  + 
    '0' + Copy(Signal3.Text, 2, 1)  + 
    '0' + Copy(Signal4.Text, 2, 1);  
  SendCommand(cmd);
  Sleep(100);
end;

procedure TfrmMain.Edit1Click(Sender: TObject);
begin
  pnlSend_N.Width := 384;
  pnlSend_N.Height:=385;
  pnlSend_N.Top:=64;
  pnlSend_N.Left:=209;
  pnlSend_N.Visible:=true;
end;

procedure TfrmMain.edtCommandKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SendCommand(edtCommand.Text);
end;

procedure TfrmMain.edtModelNoChange(Sender: TObject);
begin
  edtModelType.Text := '-';
end;

function TfrmMain.TFRatio(dS1_in, dS2_in, dS3_in, dS4_in: Extended): Extended;
begin
  Result:=-1.0;
  if (optLowKVRange.Checked) and (dS3_in<>0.0) then
  begin
    if dS3_in = -1 then Result := -1.0
    else if dS2_in = -1 then Result := -1.0
    else Result:=dS2_in/dS3_in;
  end
  else if (optHighKVRange.Checked) and (dS3_in<>0.0) then
  begin
    if dS3_in = -1 then Result := -1.0
    else if dS4_in = -1 then Result := -1.0
    else Result:=dS4_in/dS3_in;
  end;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  FileNameWf.ReadOnly := False;
  btnSaveWf.Enabled := True;
  btnSimWf.Enabled := True;
  Screen.Cursor := crDefault;
end;

// Handle the testsignal generation for long-time testing of SD-card
// Is called each 1000 ms
procedure TfrmMain.tiSDTestsTimer(Sender: TObject);
var
  SDstring     : string;
  nbrTest      : string;
  sCurrentTime : string;
  sdLogFile    : TextFile;
begin
  // Only do this if SD memory test is activated
  if (shortcuttools.cbSDLongTest.Checked = True) then begin

    // Time to start new measurement?
    if (iTimeSDTest = (StrToInt(shortcuttools.edtSDTestTime.Text))) then begin

      // Save SD time mesurement in a file
      if (_iNbrSDTest > 0) then begin
        //Make the string to store
        nbrTest := IntToStr(_iNbrSDTest);
        sCurrentTime := DateTimeToStr(Now);
        SDstring := _sSDFile          + #9 +
                    _sSDMaxTime       + #9 +
                    _sSDMaxTimeInd    + #9 +
                    _sSDSecMaxTime    + #9 +
                    _sSDSecMaxTimeInd + #9 +
                    _sSDMinTime       + #9 +
                    _sSDMinTimeInd    + #9 +
                    _sSDNbrMissSamp   + #9 +
                    nbrTest           + #9 +
                    sCurrentTime;

        // Store the string in the file
        AssignFile(sdLogFile, _sSDLogFilename);
        Append(sdLogFile);
        WriteLn(sdLogFile, SDstring);
        CloseFile(sdLogFile);
      end;

      // Start next measurement
      Inc(_iNbrSDTest);   // Increase nbr of test counter
      SendCommand('tst_cadc;act;1');  // Send a 'Start a test measurement' message
    end;
    Inc(iTimeSDTest);  // Increase the counter
  end;
end;

function GetAppVersionStr: string;
var
  Exe: string;
  Size, Handle: DWORD;
  Buffer: TBytes;
  FixedPtr: PVSFixedFileInfo;
begin
  Exe := ParamStr(0);
  Size := GetFileVersionInfoSize(PChar(Exe), Handle);
  if Size = 0 then
    RaiseLastOSError;
  SetLength(Buffer, Size);
  if not GetFileVersionInfo(PChar(Exe), Handle, Size, Buffer) then
    RaiseLastOSError;
  if not VerQueryValue(Buffer, '\', Pointer(FixedPtr), Size) then
    RaiseLastOSError;
  Result := Format('%d.%d.%d.%d',
    [LongRec(FixedPtr.dwFileVersionMS).Hi,  //major
     LongRec(FixedPtr.dwFileVersionMS).Lo,  //minor
     LongRec(FixedPtr.dwFileVersionLS).Hi,  //release
     LongRec(FixedPtr.dwFileVersionLS).Lo]) //build
end;


procedure TfrmMain.StartSDTests();
var
  sdLogFile  : TextFile;
  header, fileHeader  : string;
  fileIndex  : Integer;
  fileExists : bool;
begin
  _iNbrSDTest       := 0;
  _sSDFile          := '';
  _sSDMaxTime       := '';
  _sSDMaxTimeInd    := '';
  _sSDSecMaxTime    := '';
  _sSDSecMaxTimeInd := '';
  _sSDMinTime       := '';
  _sSDMinTimeInd    := '';
  _sSDNbrMissSamp   := '';

  // Prepare a log file. Write a header at the beginning
  header := 'File'            + #9 +
            'MaxTime [ms]'    + #9 +
            'MaxTimeIndex'    + #9 +
            'SecMaxTime [ms]' + #9 +
            'SecMaxIndex'     + #9 +
            'MinTime [ms]'    + #9 +
            'MinTimeIndex'    + #9 +
            'Missed samples'  + #9 +
            'Test counter'    + #9 +
            'Date/Time';

  fileHeader :=   'Cobia SD-test' + #9 +
                  GetAppVersionStr() + #9 +
                  'Cobia S/N:' + #9 + shortcuttools.edtSerial.Text + #9 +
                  'Cobia model:' + #9 + edtModelType.Text + #9 +
                  'FW:' + #9 +  edtFirmwareVersion.Text;

  // Find a filename that doesn't exist
  fileExists := true;
  fileIndex := 0;

  while fileExists do begin
    _sSDLogFilename := shortcuttools.edtSerial.Text + ' ' + 'SD-test' + ' ' +
                  shortcuttools.edtFileText.Text + ' ' + IntToStr(fileIndex) +
                  '.txt';

    if SysUtils.FileExists(_sSDLogFilename, False) then
      Inc(fileIndex)    // Filename exists, increase the number
    else
      fileExists := false;    // Filename doesn't exist, use this filename
  end;
  // Create the file and write the header
  AssignFile(sdLogFile, _sSDLogFilename);
  ReWrite(sdLogFile);
  WriteLn(sdLogFile, fileHeader);
  WriteLn(sdLogFile, header);
  CloseFile(sdLogFile);

  Print('SD test log will be stored in file: ' + _sSDLogFilename);  // Display filename in the log-window

  // Make a long testsignal duration to make use of a large part of the SD-buffert
  SendCommand('tst_cadc;dur;15000'); // 15000 = 5 seconds measurement + 3 seconds RESTART_TRIGG (in normal case)

  Sleep(1500);  // Waite a while

  iTimeSDTest := StrToInt(shortcuttools.edtSDTestTime.Text);  // Start tests at once
end;

function TfrmMain.Ch2Cu(dCh_in, dTime_in: Extended): Extended;
begin
  Result:=-1.0;
  if dTime_in <> 0.0 then
  begin
    if dCh_in = -1.0 then Result:= -1.0
    else Result:=dCh_in/(dTime_in / 1000);
  end;
end;


procedure TfrmMain.EMHighStartClick(Sender: TObject);
begin
  _electroMeterCalibrationSM := EM_WAITING_FOR_HIGH_SENS_PULSE;
  sendCommand('ms_range_ext 1');  // Set to Low sensitivity
end;

procedure TfrmMain.EMLowStartClick(Sender: TObject);
begin
  //ElectroMeterCal.ElectroMeterCalibration.Visible := True;
  _electroMeterCalibrationSM := EM_WAITING_FOR_LOW_SENS_PULSE;
  sendCommand('ms_range_ext 7');  // Set to High sensitivity
end;

procedure TfrmMain.ElectrometerCheckBoxClick(Sender: TObject);
begin
    //ElectrometerCalibrationStart.Enabled := ElectroMeterCheckBox.Checked;
//    lowElChargeCalValLabel.Enabled := ElectroMeterCheckBox.Checked;
//    lowElChargeCalValEdit.Enabled := ElectroMeterCheckBox.Checked;
//    lowElChargeCalValSave.Enabled := ElectroMeterCheckBox.Checked;
//    highElChargeCalValLabel.Enabled := ElectroMeterCheckBox.Checked;
//    highElChargeCalValEdit.Enabled := ElectroMeterCheckBox.Checked;
//    EMLowStart.Enabled := ElectroMeterCheckBox.Checked;
//    EMHighStart.Enabled := ElectroMeterCheckBox.Checked;
end;

procedure TfrmMain.AddToList(dS1_in, dS2_in, dS3_in, dS4_in, dTime_in: Extended);
var
  lstItem: TListItem;
  dkVRatio, dTFRatio, dkVCalc, dTFCalc, dDose, dHvl, dS1Cu, dS2Cu, dS3Cu, dS4Cu: Extended;
begin
  dkVRatio:=KVRatio(dS1_in, dS2_in, dS3_in, dS4_in);
  dTFRatio:=TFRatio(dS1_in, dS2_in, dS3_in, dS4_in);
  dkVCalc:=KV_TfCalc(dkVRatio, dTFRatio, dTFCalc);
  dHvl:=Hvl_Calc(dkVCalc, dTFCalc);
  //dTFCalc:=TFCalc(dTFRatio);
  dDose:=Dose(dS3_in);
  dS1Cu:=Ch2Cu(dS1_in, dTime_in);
  dS2Cu:=Ch2Cu(dS2_in, dTime_in);
  dS3Cu:=Ch2Cu(dS3_in, dTime_in);
  dS4Cu:=Ch2Cu(dS4_in, dTime_in);

  lstItem:=lstMeasure.Items.Add();
  lstItem.Caption := Format('%3.5f', [dkVCalc]);
  lstItem.SubItems.Add(Format('%3.5f', [dTFCalc]));
  lstItem.SubItems.Add(Format('%3.5f', [dDose]));
  lstItem.SubItems.Add(Format('%3.5f', [dHvl]));
  lstItem.SubItems.Add(Format('%3.5f', [dkVRatio]));
  lstItem.SubItems.Add(Format('%3.5f', [dTFRatio]));
  lstItem.SubItems.Add(Format('%3.1f', [dTime_in]));
  lstItem.SubItems.Add(Format('%3.5f', [dS1_in]));
  lstItem.SubItems.Add(Format('%3.5f', [dS2_in]));
  lstItem.SubItems.Add(Format('%3.5f', [dS3_in]));
  lstItem.SubItems.Add(Format('%3.5f', [dS4_in]));
  lstItem.SubItems.Add(Format('%3.5f', [dS1Cu]));
  lstItem.SubItems.Add(Format('%3.5f', [dS2Cu]));
  lstItem.SubItems.Add(Format('%3.5f', [dS3Cu]));
  lstItem.SubItems.Add(Format('%3.5f', [dS4Cu]));
end;

procedure TfrmMain.ResetDisplays();
begin
  pnlS1.Caption := Format('%3.5f', [0.0]);
  pnlS2.Caption := Format('%3.5f', [0.0]);
  pnlS3.Caption := Format('%3.5f', [0.0]);
  pnlS4.Caption := Format('%3.5f', [0.0]);
  pnlKVcalc.Caption := Format('%3.2f', [0.0]);
  pnlTFcalc.Caption := Format('%3.2f', [0.0]);
  pnlDose.Caption := Format('%3.5f', [0.0]);
  pnlHvl.Caption := Format('%3.5f', [0.0]);
  pnlKVratio.Caption := Format('%3.5f', [0.0]);
  pnlTFratio.Caption := Format('%3.5f', [0.0]);
  pnlTime.Caption := Format('%3.1f', [0.0]);
  pnlS1Cu.Caption := Format('%3.5f', [0.0]);
  pnlS2Cu.Caption := Format('%3.5f', [0.0]);
  pnlS3Cu.Caption := Format('%3.5f', [0.0]);
  pnlS4Cu.Caption := Format('%3.5f', [0.0]);
  imgOverFlow.Visible:=false;
  frmMain.Invalidate();
end;

procedure TfrmMain.AddToPanel(chk_in:TCheckBox; pnl_in: TPanel; dS1_in, dS2_in, dS3_in, dS4_in, dTime_in: Extended);
var
  dkVRatio, dTFRatio, dkVCalc, dTFCalc, dDose, dHvl, dS1Cu, dS2Cu, dS3Cu, dS4Cu: Extended;
begin
  dkVRatio:=KVRatio(dS1_in, dS2_in, dS3_in, dS4_in);
  dTFRatio:=TFRatio(dS1_in, dS2_in, dS3_in, dS4_in);
  dkVCalc:=KV_TfCalc(dkVRatio, dTFRatio, dTFCalc);

  dHvl:=Hvl_Calc(dkVCalc, dTFCalc);
  //dTFCalc:=TFCalc(dTFRatio);
  dDose:=Dose(dS3_in);
  dS1Cu:=Ch2Cu(dS1_in, dTime_in);
  dS2Cu:=Ch2Cu(dS2_in, dTime_in);
  dS3Cu:=Ch2Cu(dS3_in, dTime_in);
  dS4Cu:=Ch2Cu(dS4_in, dTime_in);
  if chk_in.Checked then
  begin
    if pnl_in.Name = 'pnlS1' then pnl_in.Caption := Format('%3.5f', [dS1_in])
    else if pnl_in.Name = 'pnlS2' then pnl_in.Caption := Format('%3.5f', [dS2_in])
    else if pnl_in.Name = 'pnlS3' then pnl_in.Caption := Format('%3.5f', [dS3_in])
    else if pnl_in.Name = 'pnlS4' then pnl_in.Caption := Format('%3.5f', [dS4_in])
    else if pnl_in.Name = 'pnlKVcalc' then pnl_in.Caption := Format('%3.5f', [dkVCalc])
    else if pnl_in.Name = 'pnlTFcalc' then pnl_in.Caption := Format('%3.5f', [dTFCalc])
    else if pnl_in.Name = 'pnlDose' then pnl_in.Caption := Format('%3.5f', [dDose])
    else if pnl_in.Name = 'pnlHvl' then pnl_in.Caption := Format('%3.5f', [dHvl])
    else if pnl_in.Name = 'pnlKVratio' then pnl_in.Caption := Format('%3.5f', [dkVRatio])
    else if pnl_in.Name = 'pnlTFratio' then pnl_in.Caption := Format('%3.5f', [dTFRatio])
    else if pnl_in.Name = 'pnlTime' then pnl_in.Caption := Format('%3.1f', [dTime_in])
    else if pnl_in.Name = 'pnlS1Cu' then pnl_in.Caption := Format('%3.5f', [dS1Cu])
    else if pnl_in.Name = 'pnlS2Cu' then pnl_in.Caption := Format('%3.5f', [dS2Cu])
    else if pnl_in.Name = 'pnlS3Cu' then pnl_in.Caption := Format('%3.5f', [dS3Cu])
    else if pnl_in.Name = 'pnlS4Cu' then pnl_in.Caption := Format('%3.5f', [dS4Cu])
  end
  else
    pnl_in.Caption := Format('%3.5f', [0.0]);
end;

procedure TfrmMain.InputReaction_m_get_val(words : array of string; numwords : Integer);
var
  detector, side, sideoffset : Integer;
  value, mean, dS1, dS2, dS3, dS4, dTime : Extended;
//  s : String;
begin
  if (words[1] = 'samp') then begin
      _numsamples := StrToInt(words[2]);
  end
  else if (words[1] = 'charge_time') then
  begin
      //Store S1-S4 charge and charge time for Firmware list
    _sS1 := words[2];
    _sS2 := words[3];
    _sS3 := words[4];
    _sS4 := words[5];
    _sSTime := words[6];

    dS1 := SafeFloatConvert(_sS1);
    dS2 := SafeFloatConvert(_sS2);
    dS3 := SafeFloatConvert(_sS3);
    dS4 := SafeFloatConvert(_sS4);
    dTime := SafeFloatConvert(_sSTime);

    //iOverFlow:=0;
    //iOverFlow := StrToInt(words[7]);
    if ((dS1 = -1) Or (dS2 = -1) Or (dS3 = -1) or (dS4 = -1)) then
      imgOverFlow.Visible:=true
    else
      imgOverFlow.Visible:=false;
    frmMain.Invalidate();
    AddToPanel(chkS1, pnlS1, dS1, dS2, dS3, dS4, dTime);
    AddToPanel(chkS2, pnlS2, dS1, dS2, dS3, dS4, dTime);
    AddToPanel(chkS3, pnlS3, dS1, dS2, dS3, dS4, dTime);
    AddToPanel(chkS4, pnlS4, dS1, dS2, dS3, dS4, dTime);
    AddToPanel(chkKVcalc, pnlKVcalc, dS1, dS2, dS3, dS4, dTime);
    AddToPanel(chkTFcalc, pnlTFcalc, dS1, dS2, dS3, dS4, dTime);
    AddToPanel(chkDose, pnlDose, dS1, dS2, dS3, dS4, dTime);
    AddToPanel(chkHvl, pnlHvl, dS1, dS2, dS3, dS4, dTime);
    AddToPanel(chkKVratio, pnlKVratio, dS1, dS2, dS3, dS4, dTime);
    AddToPanel(chkTFratio, pnlTFratio, dS1, dS2, dS3, dS4, dTime);
    AddToPanel(chkTime, pnlTime, dS1, dS2, dS3, dS4, dTime);
    AddToPanel(chkS1Cu, pnlS1Cu, dS1, dS2, dS3, dS4, dTime);
    AddToPanel(chkS2Cu, pnlS2Cu, dS1, dS2, dS3, dS4, dTime);
    AddToPanel(chkS3Cu, pnlS3Cu, dS1, dS2, dS3, dS4, dTime);
    AddToPanel(chkS4Cu, pnlS4Cu, dS1, dS2, dS3, dS4, dTime);

    AddToList(dS1, dS2, dS3, dS4, dTime);

    // Try to send data to Excel sheet
//    SendToExcel(); //Don't do this
  end
  else if (words[1] = 'filt') then begin
      detector := StrToInt(words[2][2]);
      value := SafeFloatConvert(words[3]);
      if _numsamples > 0 then begin
        value := value / _numsamples;
      end else begin
        value := 0;
      end;
      lvRing.Items.Item[detector-1].SubItems[_subitems] := words[3];
      lvRing.Items.Item[detector-1+4].SubItems[_subitems] :=
        FloatToStrF(value, ffGeneral, 5, 8);
      {
      case detector of
        1: pnlS1.Caption := Format('%3.0f', [value]);
        2:
        begin
          pnlS2.Caption := Format('%3.0f', [value]);
          if SafeFloatConvert(pnlS1.Caption)<>0 then
            pnlKVratio.Caption := Format('%3.5f', [SafeFloatConvert(pnlS2.Caption)/SafeFloatConvert(pnlS1.Caption)])
          else
            pnlKVratio.Caption := Format('%3.5f', [0.0]);
        end;
        3: pnlS3.Caption := Format('%3.0f', [value]);
        4:
        begin
          pnlS4.Caption := Format('%3.0f', [value]);
          if SafeFloatConvert(pnlS1.Caption)<>0 then
            pnlTFratio.Caption := Format('%3.5f', [SafeFloatConvert(pnlS3.Caption)/SafeFloatConvert(pnlS4.Caption)])
          else
            pnlTFratio.Caption := Format('%3.5f', [0.0]);
        end;
      end;
      }

  end
  else if (words[1] = 'int') then begin
      detector := StrToInt(words[2][2]);
      lvValues.Items.Item[detector-1].SubItems[0] := words[3];
      value := SafeFloatConvert(words[3]);
      if _numsamples <> 0 then begin
        mean := value / _numsamples;
        lvValues.Items.Item[detector-1].SubItems[1] :=
          FloatToStrF(mean, ffGeneral, 4, 8);
      end;
      case detector of
        1 : _s[1] := value;
        2 : _s[2] := value;
        3 : _s[3] := value;
        4 : _s[4] := value;
        5 : _s[1] := _s[1] + value;
        6 : _s[2] := _s[2] + value;
        8 : _s[4] := _s[4] + value;
      end;
      if (detector = 8) then begin
        EvaluatePolynomials();
      end;
      // Moved to filt parsing instead
      //detector := (detector - 1) Mod 4;
      //lvRing.Items.Item[detector].SubItems[_subitems] := FloatToStr(_s[detector + 1]);

      if words[4] = '1' then begin
          lvValues.Items.Item[detector-1].SubItems[2] := 'OF';
      end else begin
          lvValues.Items.Item[detector-1].SubItems[2] := '-';
      end;
  end
  else if (words[1] = 'offs') then begin
      detector := StrToInt(words[4][2]);
      side := StrToInt(words[3][1]);
      if words[2] = 'A' then begin
        sideoffset := 0;
      end else begin
        sideoffset := 1;
      end;
      if (side < 4) then begin
        lvOffsetR0_3.Items.Item[detector-1].SubItems[2*side+sideoffset] := words[5];
      end else begin
        lvOffsetR4_7.Items.Item[detector-1].SubItems[2*(side-4)+sideoffset] := words[5];
      end;
      if (side = shortcuttools.cmbSensitivity.ItemIndex) then begin
        frmWaveform._offsets[sideoffset, detector-1] := StrToInt(words[5]);
      end;
  end;
end;

function TfrmMain.SafeFloatConvert(sValue_in: String): Extended;
var
  FormatSet : TFormatSettings;
  sTmp      : string;
  fValue    : Extended;
begin
  FormatSettings.DecimalSeparator := '.';  // Decimal separator shall be '.' here

  //English_United_States: 1033
  GetLocaleFormatSettings(1033, FormatSet);

  // Convert ',' to '.' and remove any space
  sTmp := AnsiReplaceStr(sValue_in, ',', '.');
  sTmp := AnsiReplaceStr(sTmp, ' ', '');

  // Needs a separate test if valid float string. The try-except below seems not allways work
  if Not (TryStrToFloat(sTmp, fValue)) then begin
    Result := 0;
    exit;
  end
  else begin
    if Length(sTmp) = 0 then
      sTmp := '0';
    try
      Result := strToFloat(sTmp, FormatSet);
    except
      Result := 0;
    end;
  end;
end;
   (* =====================================================================
 *                      Procedure loadDLL
 * This procedure loads the GPIB-32.DLL library. If the LoadLibrary
 * call is successful, the next step is to get the addresses of the
 * global status variables and functions using GetProcAddress. If the
 * GetProcAddress calls were successful, the procedure returns to the
 * main routine. Otherwise, it will free the library and HALT.
 *
 * The HALT function will terminate this program.
 * ===================================================================== *)
procedure TfrmMain.loadDLL;
var
  str : string;

  begin
  (* Load the GPIB-32.DLL library using the LoadLibrary function.        *)
//    _Gpib32Lib := LoadLibrary('GPIB-32.DLL');
//
//  (* Check to see if library loaded successfully. If the library could   *)
//  (* not be loaded, display an error message and then HALT the program.  *)
//    If _Gpib32Lib = 0 Then
//      Begin
//        str := 'LoadLibrary FAILED!';
//        MessageDlg(str, mtError, [mbOK], 0);
//        halt;
//      End;
  (* Get the addresses of the GPIB Global Variables.                     *)
    @AddrIbsta  := GetProcAddress(_Gpib32Lib, 'user_ibsta');
    @AddrIberr  := GetProcAddress(_Gpib32Lib, 'user_iberr');
    @AddrIbcntl := GetProcAddress(_Gpib32Lib, 'user_ibcnt');

  (* Get the addresses of the functions needed for this application.     *)
    @IbDev            := GetProcAddress(_Gpib32Lib, 'ibdev');
    @IbRd             := GetProcAddress(_Gpib32Lib, 'ibrd');
    @IbWrt            := GetProcAddress(_Gpib32Lib, 'ibwrt');
    @IbDevClear       := GetProcAddress(_Gpib32Lib, 'DevClear');
    @IbEnableRemote   := GetProcAddress(_Gpib32Lib, 'EnableRemote');
    @IbFindLstn       := GetProcAddress(_Gpib32Lib, 'FindLstn');
    @Ibonl            := GetProcAddress(_Gpib32Lib, 'ibonl');
    @IbReadStatusByte := GetProcAddress(_Gpib32Lib, 'ReadStatusByte');
    @IbReceive        := GetProcAddress(_Gpib32Lib, 'Receive');
    @IbSend           := GetProcAddress(_Gpib32Lib, 'Send');    //ibwrt
    @IbSendIFC        := GetProcAddress(_Gpib32Lib, 'SendIFC');
    @IbWaitSRQ        := GetProcAddress(_Gpib32Lib, 'WaitSRQ');

  (* Verify that addresses were obtained. If unable to get any one of    *)
  (* the addresses, then free the library, display an error message and  *)
  (* HALT the program.                                                   *)
    if (@AddrIbsta        = NIL) Or
       (@AddrIberr        = NIL) Or
       (@AddrIbcntl       = NIL) Or
       (@IbDev            = NIL) Or
       (@IbRd             = NIL) Or
       (@IbWrt            = NIL) Or
       (@IbDevClear       = NIL) Or
       (@IbEnableRemote   = NIL) Or
       (@IbFindLstn       = NIL) Or
       (@Ibonl            = NIL) Or
       (@IbReadStatusByte = NIL) Or
       (@IbReceive        = NIL) Or
       (@IbSend           = NIL) Or
       (@IbSendIFC        = NIL) Or
       (@IbWaitSRQ        = NIL) Then
       Begin
         str := 'GetProcAddresses FAILED!';
         MessageDlg(str, mtError, [mbOK], 0);
         (* Free the GPIB library.                                       *)
         FreeLibrary(_Gpib32Lib);
         halt;
       End;

  (* Initialize GPIB global pointers to point to address location        *)
       Pibsta  := @AddrIbsta;
       Piberr  := @AddrIberr;
       Pibcntl := @AddrIbcntl;
  end;
end.
