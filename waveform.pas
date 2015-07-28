unit waveform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls;

type
  TfrmWaveform = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    imgWaveform1: TImage;
    lblMaxDetVal: TLabel;
    lblMinDetVal: TLabel;
    cbxWF1S1: TCheckBox;
    cbxWF1S3: TCheckBox;
    cbxWF1S4: TCheckBox;
    cbxWF1S2: TCheckBox;
    cbxWF1S5: TCheckBox;
    cbxWF1S6: TCheckBox;
    cbxWF1S7: TCheckBox;
    cbxWF1S8: TCheckBox;
    imgDetBGS1_wf1: TImage;
    imgDetBGS2_wf1: TImage;
    imgDetBGS3_wf1: TImage;
    imgDetBGS4_wf1: TImage;
    imgDetBGS5_wf1: TImage;
    imgDetBGS6_wf1: TImage;
    imgDetBGS7_wf1: TImage;
    imgDetBGS8_wf1: TImage;
    lblTimeEnd: TLabel;
    lblTimeStart: TLabel;
    cbxSeparateScales: TCheckBox;
    cbxBlock: TCheckBox;
    btnCalVal: TButton;
    imgDetBGkV: TImage;
    imgDetBGS5_ext: TImage;
    cbxWF1kV: TCheckBox;
    cbxWF1dose: TCheckBox;
    imgDetBGDose: TImage;
    cbxWF1Ext: TCheckBox;
    imgDetBGExt: TImage;
    cbxWF1Tf: TCheckBox;
    imgDetBGMas: TImage;
    cbxWF1Mas: TCheckBox;
    imgDetBGTf: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure cbxWF1S1Click(Sender: TObject);
    procedure AdjustSamplesToFitPlotWindow();
    procedure btnCalValClick(Sender: TObject);
  private
    _DetValues : Array of Array of Integer;
    _NumDetValues : Integer;
    _detcolorsS : array [0..12] of TColor;
    bgcolor : TColor;
    _IsPlotActive : Boolean;
    _plotType : Integer;
    minOverallValue, maxOverallValue : Extended;
    samples, adjsamples : Array of Array of Extended;
    numsamples, adjnumsamples : Integer;
    procedure FindMaxMinValue();
    const RAW_DATA = 0;
    const CALIBRATED_DATA = 1;
  public
    maxValues : array [0..11] of Extended;
    minValues : array [0..11] of Extended;
    _wfIndexTrigStart : Integer;
    _wfIndexTrigEnd : Integer;
    _wfIndexTrigStartIntSide : Integer;
    _offsets : array of Array of Integer;
    procedure ResetDetectorArray();
    procedure AddDetectorArray(s : array of integer);
    procedure Plot();
    procedure FillTestData();
    procedure AddSample(vals : array of Extended);
    procedure PaintAPrettyPicture();
  end;

var
  frmWaveform: TfrmWaveform;

implementation

uses main;

{$R *.dfm}

procedure TfrmWaveform.FillTestData();
var
  I, J : Integer;
  samps : array [0..11] of Extended;

begin
  for I := 0 to 100 do begin
    for J := 0 to 10 do begin
    samps[J] := 130 * Random - 30;
    end;
    AddSample(samps);
  end;
  PaintAPrettyPicture();
end;

procedure TfrmWaveform.FindMaxMinValue();
var
  signal, samp, startIndex, endIndex : Integer;
begin

if (_plotType = RAW_DATA) then begin
  startIndex := 0;
  endIndex := 5;
end else begin
  startIndex := 6;
  endIndex := 10;
end;
  // Set start values for searching max / min
  for signal := startIndex to endIndex do begin
    minValues[signal] := minOverallValue;
    maxValues[signal] := maxOverallValue;
  end;

  // Find max / min values in wf data
  for samp := 0 to (numsamples-1) do begin
    for signal := startIndex to endIndex do begin
      if (samples[signal][samp] < minValues[signal]) then begin
        minValues[signal] := samples[signal][samp];
      end;
      if (samples[signal][samp] > maxValues[signal]) then begin
        maxValues[signal] := samples[signal][samp];
      end;
    end;
   end;
  end;

procedure TfrmWaveform.AdjustSamplesToFitPlotWindow();
var
  I, J : Integer;
  K, nummeanx, startIndex, endIndex    : Integer;
  actualDeltax, z : Extended;
begin
  actualDeltax := (Self.imgWaveform1.Width - 20);
  actualDeltax := actualDeltax / (numsamples - 1);
  actualDeltax := (1 /  actualDeltax) + 1;
  nummeanx := Trunc(actualDeltax);
  z := Int(actualDeltax);

  if (nummeanx = 0) then nummeanx := 100;

  adjnumsamples := numsamples Div nummeanx;
//  adjnumsamples := adjnumsamples;     // Why???

if (_plotType = RAW_DATA) then begin
  startIndex := 0;
  endIndex := 5;
end else begin
  startIndex := 6;
  endIndex := 10;
end;

  SetLength(adjsamples, 12);
  for J := 0 to 10 do begin
    SetLength(adjsamples[J], adjnumsamples + 5);  // Make length some samples greater for secure
  end;

  K := 0;
  for J := startIndex to endIndex do begin
    adjsamples[J][K] := 0;
  end;
  for I := 0 to numsamples-1 do begin
    for J := startIndex to endIndex do begin
      adjsamples[J][K] := adjsamples[J][K] + samples[J][I];
    end;
    if ((nummeanx = 1) Or
        ((I > 0)  And (((I+1) Mod (nummeanx)) = 0))) then begin
      for J := startIndex to endIndex do begin
        adjsamples[J][K] := adjsamples[J][K] / z;
      end;
      Inc(K);
      for J := startIndex to endIndex do begin
        adjsamples[J][K] := 0;
      end;
    end;
  end;
end;

procedure TfrmWaveform.btnCalValClick(Sender: TObject);
begin
  if (btnCalVal.Caption = 'Calibrated data') then begin
    _plotType := CALIBRATED_DATA;
    btnCalVal.Caption := 'Raw data';
    cbxWF1S1.Visible := False;
    cbxWF1S2.Visible := False;
    cbxWF1S3.Visible := False;
    cbxWF1S4.Visible := False;
    cbxWF1S5.Visible := False;
    cbxWF1S6.Visible := False;
    cbxWF1kV.Visible := True;
    cbxWF1Dose.Visible := True;
    cbxWF1Ext.Visible := True;
    cbxWF1Tf.Visible := True;
    cbxWF1Mas.Visible := True;
    imgDetBGkV.Visible := True;
    imgDetBGDose.Visible := True;
    imgDetBGExt.Visible := True;
    imgDetBGTf.Visible := True;
    imgDetBGMas.Visible := True;
    imgDetBGS1_wf1.Visible := False;
    imgDetBGS2_wf1.Visible := False;
    imgDetBGS3_wf1.Visible := False;
    imgDetBGS4_wf1.Visible := False;
    imgDetBGS5_wf1.Visible := False;
    imgDetBGS6_wf1.Visible := False;
  end else if (btnCalVal.Caption = 'Raw data') then begin
    _plotType := RAW_DATA;
    btnCalVal.Caption := 'Calibrated data';
    imgDetBGTf.Visible := False;
    imgDetBGMas.Visible := False;
    imgDetBGkV.Visible := False;
    imgDetBGDose.Visible := False;
    imgDetBGExt.Visible := False;
    imgDetBGS1_wf1.Visible := True;
    imgDetBGS2_wf1.Visible := True;
    imgDetBGS3_wf1.Visible := True;
    imgDetBGS4_wf1.Visible := True;
    imgDetBGS5_wf1.Visible := True;
    imgDetBGS6_wf1.Visible := True;
    cbxWF1S1.Visible := True;
    cbxWF1S2.Visible := True;
    cbxWF1S3.Visible := True;
    cbxWF1S4.Visible := True;
    cbxWF1S5.Visible := True;
    cbxWF1S6.Visible := True;
    cbxWF1kV.Visible := False;
    cbxWF1Dose.Visible := False;
    cbxWF1Ext.Visible := False;
    cbxWF1Tf.Visible := False;
    cbxWF1Mas.Visible := False;
  end;
  PaintAPrettyPicture();
end;

procedure TfrmWaveform.PaintAPrettyPicture();
var
  I, J, x, deltax, icurry, colour       : Integer;
  nummeanx, useyval, timelines  : Integer;
  y, y0, ys, deltay             :  Int64;
  prevy : array [0..11] of Integer;
  sumy : array [0..11] of Integer;
  t, lclMin, lclMax             : Extended;
  actualDeltax                  : Extended;
  gridcolor                     : TColor;
  rc                            : TRect;
begin

   // Disable Externa detector and MAS if not exist in WF data. (i.e. not Flex)
  if  ((maxValues[4] = 1) And
       (minValues[4] = 0) And
       (maxValues[5] = 1) And
       (minValues[5] = 0)) then begin
     cbxWF1S5.Checked := false;
     cbxWF1S6.Checked := false;
     cbxWF1Ext.Checked := false;
     cbxWF1Mas.Checked := false;
  end;

if (_plotType <> CALIBRATED_DATA) then begin

  y0 := 0;

  // Find max / min values of the wf signal
  FindMaxMinValue();

  for J := 0 to 5 do begin
    if (maxValues[J] = 0) then begin
      maxValues[J] := 1;
    end;
  end;

  AdjustSamplesToFitPlotWindow();
  gridcolor := RGB(192, 192, 192);
  Self.imgWaveform1.canvas.pen.Style := psSolid;
  actualDeltax := (Self.imgWaveform1.Width - 10);
  actualDeltax := actualDeltax / (adjnumsamples - 1);
//  t := (1 /  actualDeltax) + 1;
  deltax := (Self.imgWaveform1.Width - 10) Div (adjnumsamples - 1);
  if deltax = 0 then begin
    deltax := 1;
//    nummeanx := Trunc(t);
    nummeanx := 1;
  end else begin
    nummeanx := 1;
  end;
  x := 5;
  icurry := 1;

  if adjnumsamples <= 600 then begin
    timelines := 30;
  end else if adjnumsamples <= 3000 then begin
    timelines := 300;
  end else begin
    timelines := 600;
  end;

  lclMin := minOverallValue;
  lclMax := maxOverallValue;
  if Not(cbxSeparateScales.Checked) then begin
    for J := 0 to 5 do begin        // Note: Only displays 6 signals
      if (((J = 0) And (cbxWF1S1.Checked)) Or
          ((J = 1) And (cbxWF1S2.Checked)) Or
          ((J = 2) And (cbxWF1S3.Checked)) Or
          ((J = 3) And (cbxWF1S4.Checked)) Or
          ((J = 4) And (cbxWF1S5.Checked)) Or            // Ext. prob
          ((J = 5) And (cbxWF1S6.Checked)) ) then begin  // MAS
        if maxValues[J] > lclMax then begin
          lclMax := maxValues[J];
        end;
        if minValues[J] < lclMin then begin
          lclMin := minValues[J];
        end;
      end;
    end;

    if ((lclMin < 0) And (lclMax > 0))then begin
      y0 := Round(lclMax);
      y0 := y0 * (Self.imgWaveform1.Height - 16);
      y0 := y0 Div Round((lclMax - lclMin));
      Self.imgWaveform1.canvas.pen.Color := gridcolor;
      Self.imgWaveform1.canvas.pen.Width := 1;
      Self.imgWaveform1.Canvas.MoveTo(0, y0 + 8);
      Self.imgWaveform1.Canvas.LineTo(Self.imgWaveform1.Width, y0 + 8);
    end else begin
      y0 := Self.imgWaveform1.Height - 16;
    end;
  end;

  for J := 0 to 5 do begin
    prevy[J] := 0;
    sumy[J] := 0;
  end;


  for I := 0 to adjnumsamples-1 do begin
    for J := 0 to 5 do begin     // Note only displays 6 signals
      if (J = 2) Or (J = 3) Or (J = 4) Or (J = 5) then begin
        Self.imgWaveform1.canvas.pen.Width := 1;
      end else begin
        Self.imgWaveform1.canvas.pen.Width := 2;
      end;
      if (((J = 0) And (cbxWF1S1.Checked)) Or
          ((J = 1) And (cbxWF1S2.Checked)) Or
          ((J = 2) And (cbxWF1S3.Checked)) Or
          ((J = 3) And (cbxWF1S4.Checked)) Or
          ((J = 4) And (cbxWF1S5.Checked)) Or              // Ext Prob
          ((J = 5) And (cbxWF1S6.Checked)) ) then begin    // MAS

         Self.imgWaveform1.canvas.pen.Color   := _detcolorsS[7-J];
         Self.imgWaveform1.canvas.Brush.Color := _detcolorsS[7-J];

         if cbxSeparateScales.Checked then begin
           y := Round(maxValues[J]);
         end else begin
           y := Round(lclMax);
         end;

         useyval := Round(adjsamples[J][I]);

         if adjsamples[J][I] > maxValues[J] then begin
           useyval := Round(maxValues[J]);
         end;
         if adjsamples[J][I] < minValues[J] then begin
           useyval := Round(minValues[J]);
         end;

         y := y - useyval;
         y := y * (Self.imgWaveform1.Height - 16);

         if cbxSeparateScales.Checked then begin
           y := y Div Round((maxValues[J] - minValues[J]));
         end else begin
           y := y Div Round((lclMax - lclMin));
         end;

         if cbxBlock.Checked then begin
           if y < y0 then begin
             deltay := y0 - y;
             ys := y;
           end else begin
              deltay := y - y0;
              ys := y0;
           end;
           rc.Left := x;
           rc.Top := ys + 8;
           rc.Right := x + deltax;
           if cbxSeparateScales.Checked then begin
             rc.Bottom := ys + 4 + 8;
           end else begin
              rc.Bottom := ys + deltay + 8;
           end;
           Self.imgWaveform1.Canvas.FillRect(rc);

         end else begin

         sumy[J] := sumy[J] + y;
         if icurry = nummeanx then begin

          sumy[J] := sumy[J] div nummeanx;
          if I = 0 then begin
            Self.imgWaveform1.Canvas.MoveTo(x, sumy[J] + 6);
          end else begin
            Self.imgWaveform1.Canvas.MoveTo(x-deltax, prevy[J] + 8);
          end;
           Self.imgWaveform1.Canvas.LineTo(x, sumy[J] + 8);
         end;

         prevy[J] := y;
         end;

      end;
    end;
    Self.imgWaveform1.canvas.Brush.Style := bsSolid;
    if ((I Mod timelines) = 0) then begin
      Self.imgWaveform1.canvas.pen.Width := 1;
      Self.imgWaveform1.canvas.pen.Color := gridcolor;
(*
      if cbxSeparateScales.Checked then begin
         y :=  Self.imgWaveform1.Height Div 2;
      end else begin
         y := Round(lclMax);
         y := y * (Self.imgWaveform1.Height - 16);
         y := y Div Round((lclMax - lclMin));
      end;
*)
      Self.imgWaveform1.Canvas.MoveTo(x-deltax, 4);
      Self.imgWaveform1.Canvas.LineTo(x-deltax, Self.imgWaveform1.Height - 4);
      Self.imgWaveform1.canvas.pen.Width := 2;
    end;
    if icurry = nummeanx then begin
      x := x + deltax;
      icurry := 1;

  for J := 0 to 7 do begin
    //prevy[J] := 0;
    sumy[J] := 0;
  end;
     end else begin
        icurry := icurry + 1;
     end;
  end;
  _IsPlotActive := True;
   if cbxSeparateScales.Checked then begin
    lblMaxDetVal.Visible := False;
    lblMinDetVal.Visible := False;
   end else begin
     // Print max/min values

     // Check if no max/min is found, set then default
     if (lclMax = maxOverallValue) And (lclMin = minOverallValue) then begin
       lclMax := 1;
       lclMin := -1;
     end;

     // Remove decimals if digits not fits
     if (lclMax >= 1e7) then
       lblMaxDetVal.Caption := Format('%3.0f', [lclMax])
     else
       lblMaxDetVal.Caption := Format('%3.1f', [lclMax]);
     if (lclMin <= -1e5) then
       lblMinDetVal.Caption := Format('%3.0f', [lclMin])
     else
       lblMinDetVal.Caption := Format('%3.1f', [lclMin]);
    lblMaxDetVal.Visible := True;
    lblMinDetVal.Visible := True;
   end;
   t := numsamples;
   t := t / 3.0;
   lblTimeEnd.Caption := Format('%3.1f', [t]);

   if ((lclMin < 0) And (lclMax > 0))then begin
      y := Round(lclMax);
      y := y * (Self.imgWaveform1.Height - 16);
      y := y Div Round((lclMax - lclMin));
      Self.imgWaveform1.canvas.pen.Color := RGB(64, 64, 64);
      Self.imgWaveform1.canvas.pen.Width := 1;
      Self.imgWaveform1.Canvas.MoveTo(4, y + 8);
      Self.imgWaveform1.Canvas.LineTo(Self.imgWaveform1.Width - 4, y + 8);
    end;
  Self.imgWaveform1.canvas.pen.Color := clWhite;
  Self.imgWaveform1.Canvas.Brush.Color := clWhite;
  Self.imgWaveform1.Canvas.Rectangle(x, 0, Self.imgWaveform1.Width, Self.imgWaveform1.Height);
  Self.lblTimeEnd.left := x + Self.imgWaveform1.Left - 10;
  {
  if (adjnumsamples > Self.imgWaveform1.Width) then begin
    Self.lblTimeEnd.left := Self.imgWaveform1.Width + Self.imgWaveform1.Left - 10;
  end else begin
    if adjnumsamples > 0 then begin
      I := Self.imgWaveform1.Width Div adjnumsamples;
      Self.lblTimeEnd.left := adjnumsamples*I + Self.imgWaveform1.Left - 20;
    end else begin
      Self.lblTimeEnd.left := Self.imgWaveform1.Width + Self.imgWaveform1.Left - 10;
    end;
  end;
  }
 end else if (_plotType = CALIBRATED_DATA) then begin
 y0 := 0;

  // Find max / min values of the wf signal
  FindMaxMinValue();

  for J := 6 to 10 do begin
    if (maxValues[J] = 0) then begin
      maxValues[J] := 1;
    end;
  end;

  AdjustSamplesToFitPlotWindow();
  gridcolor := RGB(192, 192, 192);
  Self.imgWaveform1.canvas.pen.Style := psSolid;
  actualDeltax := (Self.imgWaveform1.Width - 10);
  actualDeltax := actualDeltax / (adjnumsamples - 1);
//  t := (1 /  actualDeltax) + 1;
  deltax := (Self.imgWaveform1.Width - 10) Div (adjnumsamples - 1);
  if deltax = 0 then begin
    deltax := 1;
//    nummeanx := Trunc(t);
    nummeanx := 1;
  end else begin
    nummeanx := 1;
  end;
  x := 5;
  icurry := 1;

  if adjnumsamples <= 600 then begin
    timelines := 30;
  end else if adjnumsamples <= 3000 then begin
    timelines := 300;
  end else begin
    timelines := 600;
  end;

  lclMin := minOverallValue;
  lclMax := maxOverallValue;
  if Not(cbxSeparateScales.Checked) then begin
    for J := 6 to 10 do begin        // Note: Only displays 6 signals
      if (((J = 6) And (cbxWF1kV.Checked)) Or
          ((J = 7) And (cbxWF1Tf.Checked)) Or
          ((J = 8) And (cbxWF1Dose.Checked)) Or
          ((J = 9) And (cbxWF1Ext.Checked)) Or             //Ext. probe
          ((J = 10) And (cbxWF1Mas.Checked)) ) then begin  // MAS
        if maxValues[J] > lclMax then begin
          lclMax := maxValues[J];
        end;
        if minValues[J] < lclMin then begin
          lclMin := minValues[J];
        end;
      end;
    end;

    if ((lclMin < 0) And (lclMax > 0))then begin
      y0 := Round(lclMax);
      y0 := y0 * (Self.imgWaveform1.Height - 16);
      y0 := y0 Div Round((lclMax - lclMin));
      Self.imgWaveform1.canvas.pen.Color := gridcolor;
      Self.imgWaveform1.canvas.pen.Width := 1;
      Self.imgWaveform1.Canvas.MoveTo(0, y0 + 8);
      Self.imgWaveform1.Canvas.LineTo(Self.imgWaveform1.Width, y0 + 8);
    end else begin
      y0 := Self.imgWaveform1.Height - 16;
    end;
  end;

  for J := 6 to 10 do begin
    prevy[J] := 0;
    sumy[J] := 0;
  end;


  for I := 0 to adjnumsamples-1 do begin
    for J := 6 to 10 do begin     // Note only displays 6 signals
      if (J = 6) Or (J = 7) Or (J = 8)  then begin
        Self.imgWaveform1.canvas.pen.Width := 1;
      end else begin
        Self.imgWaveform1.canvas.pen.Width := 2;
      end;
      colour := _detcolorsS[2];
      if (((J = 6) And (cbxWF1kV.Checked)) Or
          ((J = 7) And (cbxWF1Tf.Checked)) Or
          ((J = 8) And (cbxWF1Dose.Checked)) Or
          ((J = 9) And (cbxWF1Ext.Checked)) Or               // Ext Prob
          ((J = 10) And (cbxWF1Mas.Checked)) ) then begin    // MAS

         if (J = 6) then colour := _detcolorsS[7];
         if (J = 7) then colour := _detcolorsS[6];
         if (J = 8) then colour := _detcolorsS[5];
         if (J = 9) then colour := _detcolorsS[3];
         if (J = 10) then colour := _detcolorsS[2];

         Self.imgWaveform1.canvas.pen.Color   := colour;
         Self.imgWaveform1.canvas.Brush.Color := colour;

         if cbxSeparateScales.Checked then begin
           y := Round(maxValues[J]);
         end else begin
           y := Round(lclMax);
         end;

         useyval := Round(adjsamples[J][I]);

         if adjsamples[J][I] > maxValues[J] then begin
           useyval := Round(maxValues[J]);
         end;
         if adjsamples[J][I] < minValues[J] then begin
           useyval := Round(minValues[J]);
         end;

         y := y - useyval;
         y := y * (Self.imgWaveform1.Height - 16);

         if cbxSeparateScales.Checked then begin
           y := y Div Round((maxValues[J] - minValues[J]));
         end else begin
           y := y Div Round((lclMax - lclMin));
         end;

         if cbxBlock.Checked then begin
           if y < y0 then begin
             deltay := y0 - y;
             ys := y;
           end else begin
              deltay := y - y0;
              ys := y0;
           end;
           rc.Left := x;
           rc.Top := ys + 8;
           rc.Right := x + deltax;
           if cbxSeparateScales.Checked then begin
             rc.Bottom := ys + 4 + 8;
           end else begin
              rc.Bottom := ys + deltay + 8;
           end;
           Self.imgWaveform1.Canvas.FillRect(rc);

         end else begin

         sumy[J] := sumy[J] + y;
         if icurry = nummeanx then begin

          sumy[J] := sumy[J] div nummeanx;
          if I = 0 then begin
            Self.imgWaveform1.Canvas.MoveTo(x, sumy[J] + 6);
          end else begin
            Self.imgWaveform1.Canvas.MoveTo(x-deltax, prevy[J] + 8);
          end;
           Self.imgWaveform1.Canvas.LineTo(x, sumy[J] + 8);
         end;

         prevy[J] := y;
         end;

      end;
    end;
    Self.imgWaveform1.canvas.Brush.Style := bsSolid;
    if ((I Mod timelines) = 0) then begin
      Self.imgWaveform1.canvas.pen.Width := 1;
      Self.imgWaveform1.canvas.pen.Color := gridcolor;
 (*
      if cbxSeparateScales.Checked then begin
         y :=  Self.imgWaveform1.Height Div 2;
      end else begin
         y := Round(lclMax);
         y := y * (Self.imgWaveform1.Height - 16);
         y := y Div Round((lclMax - lclMin));
      end;
 *)
      Self.imgWaveform1.Canvas.MoveTo(x-deltax, 4);
      Self.imgWaveform1.Canvas.LineTo(x-deltax, Self.imgWaveform1.Height - 4);
      Self.imgWaveform1.canvas.pen.Width := 2;
    end;
    if icurry = nummeanx then begin
      x := x + deltax;
      icurry := 1;

  for J := 6 to 10 do begin
    //prevy[J] := 0;
    sumy[J] := 0;
  end;
     end else begin
        icurry := icurry + 1;
     end;
  end;
  _IsPlotActive := True;
   if cbxSeparateScales.Checked then begin
    lblMaxDetVal.Visible := False;
    lblMinDetVal.Visible := False;
   end else begin
     // Print max/min values

     // Check if no max/min is found, set then default
     if (lclMax = maxOverallValue) And (lclMin = minOverallValue) then begin
       lclMax := 1;
       lclMin := -1;
     end;

     // Remove decimals if digits not fits
     if (lclMax >= 1e7) then
       lblMaxDetVal.Caption := Format('%3.0f', [lclMax])
     else
       lblMaxDetVal.Caption := Format('%3.1f', [lclMax]);
     if (lclMin <= -1e5) then
       lblMinDetVal.Caption := Format('%3.0f', [lclMin])
     else
       lblMinDetVal.Caption := Format('%3.1f', [lclMin]);
    lblMaxDetVal.Visible := True;
    lblMinDetVal.Visible := True;
   end;
   t := numsamples;
   t := t / 3.0;
   lblTimeEnd.Caption := Format('%3.1f', [t]);

   if ((lclMin < 0) And (lclMax > 0))then begin
      y := Round(lclMax);
      y := y * (Self.imgWaveform1.Height - 16);
      y := y Div Round((lclMax - lclMin));
      Self.imgWaveform1.canvas.pen.Color := RGB(64, 64, 64);
      Self.imgWaveform1.canvas.pen.Width := 1;
      Self.imgWaveform1.Canvas.MoveTo(4, y + 8);
      Self.imgWaveform1.Canvas.LineTo(Self.imgWaveform1.Width - 4, y + 8);
    end;
  Self.imgWaveform1.canvas.pen.Color := clWhite;
  Self.imgWaveform1.Canvas.Brush.Color := clWhite;
  Self.imgWaveform1.Canvas.Rectangle(x, 0, Self.imgWaveform1.Width, Self.imgWaveform1.Height);
  Self.lblTimeEnd.left := x + Self.imgWaveform1.Left - 10;
 end;
end;

procedure TfrmWaveform.AddSample(vals : array of Extended);
var
  I : Integer;
begin
  Inc(numsamples);

  // Read samples from 6 signals
  SetLength(samples, 11);
  for I := 0 to 10 do begin
    SetLength(samples[I], numsamples);
    if (I <= 10) then
      samples[I][numsamples - 1] := vals[I]
    else
      samples[I][numsamples - 1] := 0;   // Fill rest with 0
  end;
end;

procedure TfrmWaveform.cbxWF1S1Click(Sender: TObject);
begin
  if _IsPlotActive then begin
    Self.imgWaveform1.Canvas.Brush.Color := bgcolor;
    Self.imgWaveform1.canvas.pen.Color := RGB(255, 255, 255);
    Self.imgWaveform1.Canvas.Rectangle(1, 1, Self.imgWaveform1.Width, Self.imgWaveform1.Height);
    Self.imgWaveform1.Canvas.Brush.Color := clWhite;
    //Plot();
    PaintAPrettyPicture();
  end;
end;

procedure TfrmWaveform.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Self.imgWaveform1.Width := Self.PageControl1.Width - 90;
  Self.imgWaveform1.Height := Self.PageControl1.Height - 100;
  Self.imgWaveform1.picture.bitmap.width := Self.imgWaveform1.Width;
  Self.imgWaveform1.picture.bitmap.height := Self.imgWaveform1.Height;
  Self.imgWaveform1.Canvas.Brush.Color := bgcolor;
  Self.imgWaveform1.canvas.pen.Color := RGB(192, 192, 192);
  Self.imgWaveform1.Canvas.Rectangle(1, 1, Self.imgWaveform1.Width, Self.imgWaveform1.Height);
  Self.imgWaveform1.Canvas.Brush.Color := clWhite;
  Self.lblTimeEnd.left := Self.imgWaveform1.Width + Self.imgWaveform1.Left - 10;
  if _IsPlotActive then begin
    PaintAPrettyPicture();
  end;
  Self.cbxWF1S1.Top := Self.PageControl1.Height - 60;
  Self.cbxWF1S2.Top := Self.cbxWF1S1.Top;
  Self.cbxWF1S3.Top := Self.cbxWF1S1.Top;
  Self.cbxWF1S4.Top := Self.cbxWF1S1.Top;
  Self.cbxWF1S5.Top := Self.cbxWF1S1.Top;
  Self.cbxWF1S6.Top := Self.cbxWF1S1.Top;
  Self.cbxWF1S7.Top := Self.cbxWF1S1.Top;
  Self.cbxWF1S8.Top := Self.cbxWF1S1.Top;
  Self.imgDetBGS1_wf1.Top := Self.cbxWF1S1.Top - 6;
  Self.imgDetBGS2_wf1.Top := Self.cbxWF1S2.Top - 6;
  Self.imgDetBGS3_wf1.Top := Self.cbxWF1S3.Top - 6;
  Self.imgDetBGS4_wf1.Top := Self.cbxWF1S4.Top - 6;
  Self.imgDetBGS5_wf1.Top := Self.cbxWF1S5.Top - 6;
  Self.imgDetBGS6_wf1.Top := Self.cbxWF1S6.Top - 6;
  Self.imgDetBGS7_wf1.Top := Self.cbxWF1S7.Top - 6;
  Self.imgDetBGS8_wf1.Top := Self.cbxWF1S8.Top - 6;
  Self.lblMinDetVal.Top := Self.imgWaveform1.Height;
  Self.lblTimeEnd.Top   := Self.imgWaveform1.Height + 15;
  Self.lblTimeStart.Top := Self.imgWaveform1.Height + 15;
  Self.cbxSeparateScales.Top := Self.PageControl1.Height - 52;
  Self.cbxBlock.Top := Self.PageControl1.Height - 70;
end;

procedure TfrmWaveform.FormShow(Sender: TObject);
begin
  SetLength(samples, 8);
  SetLength(adjsamples, 8);
  numsamples := 0;
  maxOverallValue := -3145725;
  minOverallValue := 3145725;
  SetLength(_offsets, 2);
  SetLength(_offsets[0], 8);
  SetLength(_offsets[1], 8);
  bgcolor := RGB(48, 32, 32);
  Self.imgWaveform1.Canvas.Brush.Color := bgcolor;
  Self.imgWaveform1.Canvas.Rectangle(1, 1, Self.imgWaveform1.Width, Self.imgWaveform1.Height);
  Self.imgWaveform1.Canvas.Brush.Color := clWhite;
  ResetDetectorArray();
  _detcolorsS[12] := RGB(192, 192, 192);
  _detcolorsS[11] := RGB(255, 0, 255);
  _detcolorsS[10] := RGB(255, 255, 255);
  _detcolorsS[9] := RGB(255, 96, 128);
  _detcolorsS[8] := RGB(128, 60, 220);
  _detcolorsS[7] := RGB(255, 96, 128);
  _detcolorsS[6] := RGB(128, 255, 96);
  _detcolorsS[5] := RGB(128, 192, 255);
  _detcolorsS[4] := RGB(192, 192, 192);
  _detcolorsS[3] := RGB(0, 255, 255);
  _detcolorsS[2] := RGB(255, 0, 255);
  _detcolorsS[1] := RGB(255, 255, 255);
  _detcolorsS[0] := RGB(128, 60, 220);
  Self.imgDetBGkV.Canvas.Brush.Color := _detcolorsS[7];
  Self.imgDetBGkV.Canvas.Rectangle(1, 1, Self.imgDetBGkV.Width, Self.imgDetBGkV.Height);
  //Self.imgDetBGS1_wf1.Canvas.Pen.Color := clWhite;
  Self.imgDetBGTf.Canvas.Brush.Color := _detcolorsS[6];
  Self.imgDetBGTf.Canvas.Rectangle(1, 1, Self.imgDetBGTf.Width, Self.imgDetBGTf.Height);
  //Self.imgDetBGS1_wf1.Canvas.Pen.Color := clWhite;
  Self.imgDetBGDose.Canvas.Brush.Color := _detcolorsS[5];
  Self.imgDetBGDose.Canvas.Rectangle(1, 1, Self.imgDetBGDose.Width, Self.imgDetBGDose.Height);
  //Self.imgDetBGS1_wf1.Canvas.Pen.Color := clWhite;
  Self.imgDetBGExt.Canvas.Brush.Color := _detcolorsS[3];
  Self.imgDetBGExt.Canvas.Rectangle(1, 1, Self.imgDetBGExt.Width, Self.imgDetBGExt.Height);
  //Self.imgDetBGS1_wf1.Canvas.Pen.Color := clWhite;
  Self.imgDetBGMas.Canvas.Brush.Color := _detcolorsS[2];
  Self.imgDetBGMas.Canvas.Rectangle(1, 1, Self.imgDetBGMas.Width, Self.imgDetBGMas.Height);
  //Self.imgDetBGS1_wf1.Canvas.Pen.Color := clWhite;
  Self.imgDetBGS1_wf1.Canvas.Brush.Color := _detcolorsS[7];
  //Self.imgDetBGS1_wf1.Canvas.Pen.Color := clWhite;
  Self.imgDetBGS1_wf1.Canvas.Rectangle(1, 1, Self.imgDetBGS1_wf1.Width, Self.imgDetBGS1_wf1.Height);
  Self.imgDetBGS2_wf1.Canvas.Brush.Color := _detcolorsS[6];
  //Self.imgDetBGS2_wf1.Canvas.Pen.Color := _detcolorsS[1];
  Self.imgDetBGS2_wf1.Canvas.Rectangle(1, 1, Self.imgDetBGS2_wf1.Width, Self.imgDetBGS2_wf1.Height);
  Self.imgDetBGS3_wf1.Canvas.Brush.Color := _detcolorsS[5];
  //Self.imgDetBGS3_wf1.Canvas.Pen.Color := _detcolorsS[2];
  Self.imgDetBGS3_wf1.Canvas.Rectangle(1, 1, Self.imgDetBGS3_wf1.Width, Self.imgDetBGS3_wf1.Height);
  Self.imgDetBGS4_wf1.Canvas.Brush.Color := _detcolorsS[4];
  //Self.imgDetBGS4_wf1.Canvas.Pen.Color := _detcolorsS[3];
  Self.imgDetBGS4_wf1.Canvas.Rectangle(1, 1, Self.imgDetBGS4_wf1.Width, Self.imgDetBGS4_wf1.Height);
  Self.imgDetBGS5_wf1.Canvas.Brush.Color := _detcolorsS[3];
  //Self.imgDetBGS5_wf1.Canvas.Pen.Color := _detcolorsS[4];
  Self.imgDetBGS5_wf1.Canvas.Rectangle(1, 1, Self.imgDetBGS5_wf1.Width, Self.imgDetBGS5_wf1.Height);
  Self.imgDetBGS6_wf1.Canvas.Brush.Color := _detcolorsS[2];
  //Self.imgDetBGS6_wf1.Canvas.Pen.Color := _detcolorsS[5];
  Self.imgDetBGS6_wf1.Canvas.Rectangle(1, 1, Self.imgDetBGS6_wf1.Width, Self.imgDetBGS6_wf1.Height);
  Self.imgDetBGS7_wf1.Canvas.Brush.Color := _detcolorsS[1];
  //Self.imgDetBGS7_wf1.Canvas.Pen.Color := _detcolorsS[6];
  Self.imgDetBGS7_wf1.Canvas.Rectangle(1, 1, Self.imgDetBGS7_wf1.Width, Self.imgDetBGS7_wf1.Height);
  Self.imgDetBGS8_wf1.Canvas.Brush.Color := _detcolorsS[0];
  //Self.imgDetBGS8_wf1.Canvas.Pen.Color := _detcolorsS[7];
  Self.imgDetBGS8_wf1.Canvas.Rectangle(1, 1, Self.imgDetBGS8_wf1.Width, Self.imgDetBGS8_wf1.Height);
  _IsPlotActive := False;
  Self.lblMaxDetVal.Caption := '1';
  Self.lblMinDetVal.Caption := '-1';
end;

procedure TfrmWaveform.ResetDetectorArray();
var
  I : Integer;
begin
  numsamples := 0;
  for I := 0 to 7 do begin
    minValues[I] := minOverallValue;
    maxValues[I] := maxOverallValue;
  end;
  for I := 0 to 7 do begin
     SetLength(samples[I], numsamples);
  end;
  _NumDetValues := 0;
  SetLength(_DetValues, 0);
  _IsPlotActive := False;
     Self.imgWaveform1.Canvas.Brush.Color := bgcolor;
  Self.imgWaveform1.canvas.pen.Color := RGB(128, 128, 128);
  Self.imgWaveform1.Canvas.Rectangle(1, 1, Self.imgWaveform1.Width, Self.imgWaveform1.Height);
  _wfIndexTrigStart := 0;
  _wfIndexTrigEnd := 0;
end;

procedure TfrmWaveform.AddDetectorArray(s : array of integer);
var
  I : Integer;
begin
  Inc(_NumDetValues);
  SetLength(_DetValues, _NumDetValues);
  SetLength(_DetValues[_NumDetValues - 1], 8);
  for I := 0 to 7 do begin
    _DetValues[_NumDetValues - 1, I] := s[I];
  end;
end;

procedure TfrmWaveform.Plot();
var
  I, J, x, y, deltax, themax, themin, intside : Integer;
  _maxS, _minS, prevy : array [0..7] of Integer;
begin
  for J := 0 to 7 do begin
    _maxS[J] := 0;
    _minS[J] := 1048576;
  end;
  themax := 0;
  themin := 1048576;
  if _wfIndexTrigStartIntSide = 0 then begin
    intside := 0;
  end else begin
    intside := 1;
  end;

  lblTimeEnd.Caption := IntToStr((_wfIndexTrigEnd - _wfIndexTrigStart) Div 3) + ' ms';

  for I := (_wfIndexTrigStart - 1) to (_wfIndexTrigEnd - 1) do begin
    if (I < (_NumDetValues - 1)) then begin

    for J := 0 to 7 do begin

      if (((J = 0) And (cbxWF1S1.Checked)) Or
          ((J = 1) And (cbxWF1S2.Checked)) Or
          ((J = 2) And (cbxWF1S3.Checked)) Or
          ((J = 3) And (cbxWF1S4.Checked)) Or
          ((J = 4) And (cbxWF1S5.Checked)) Or
          ((J = 5) And (cbxWF1S6.Checked)) Or
          ((J = 6) And (cbxWF1S7.Checked)) Or
          ((J = 7) And (cbxWF1S8.Checked)))
       then begin

        if (Not(_IsPlotActive ))then begin
          if (Length(_offsets[0]) > J) then begin
            _DetValues[I, J] := _DetValues[I, J] -  _offsets[intside, J];
          end;
        end;

        if ((_DetValues[I, J] > themax))then begin
          themax := _DetValues[I, J];
//          themaxindex := J;
        end;
        if (_DetValues[I, J] < themin) then begin
          themin := _DetValues[I, J];
//          theminindex := J;
        end;
        if (_DetValues[I, J] > _maxS[J]) then begin
          _maxS[J] := _DetValues[I, J];
        end;
        if (_DetValues[I, J] < _minS[J]) then begin
          _minS[J] := _DetValues[I, J];
        end;
       end;
    end;
    if (intside = 1) then begin
      intside := 0;
    end else begin
      intside := 1;
    end;
    end;
  end;

  if ((_wfIndexTrigEnd - _wfIndexTrigStart) < Self.imgWaveform1.Width) then begin
    deltax := Self.imgWaveform1.Width Div (_wfIndexTrigEnd - _wfIndexTrigStart);
  end else begin
    deltax := 1;
  end;
  x := 0;
  Self.imgWaveform1.canvas.pen.Style := psSolid;
  for I := (_wfIndexTrigStart - 1) to (_wfIndexTrigEnd - 1) do begin
    if (I < Self.imgWaveform1.Width) then begin
      for J := 0 to 7 do begin

      if (((J = 0) And (cbxWF1S1.Checked)) Or
          ((J = 1) And (cbxWF1S2.Checked)) Or
          ((J = 2) And (cbxWF1S3.Checked)) Or
          ((J = 3) And (cbxWF1S4.Checked)) Or
          ((J = 4) And (cbxWF1S5.Checked)) Or
          ((J = 5) And (cbxWF1S6.Checked)) Or
          ((J = 6) And (cbxWF1S7.Checked)) Or
          ((J = 7) And (cbxWF1S8.Checked)))
       then begin

        Self.imgWaveform1.canvas.pen.Color := _detcolorsS[7-J];
        if ((themax - themin) <> 0) then begin
          y := (themax - _DetValues[I, J]) * Self.imgWaveform1.Height Div (themax - themin);
          if (x > 0) then begin
            Self.imgWaveform1.Canvas.MoveTo(x-deltax, prevy[J]);
          end else begin
            Self.imgWaveform1.Canvas.MoveTo(x, y+1);
          end;
          Self.imgWaveform1.Canvas.LineTo(x, y);
          prevy[J] := y;
        end;
       end;
      end;
      x := x + deltax;
    end;
  end;
  _IsPlotActive := True;
  lblMaxDetVal.Caption := IntToStr(themax);
  lblMinDetVal.Caption := IntToStr(themin);
end;

end.

