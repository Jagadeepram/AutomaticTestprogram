unit uPolynomials;

interface
uses
Classes, SysUtils;

type
EPolyType = (DoseCorr, kVLow, kVHigh, TfLow, TfHigh);
  CPoly = class(TObject)
  private
    ePolyType: EPolyType;
    dC5: Extended;
    dC4: Extended;
    dC3: Extended;
    dC2: Extended;
    dC1: Extended;
    dC0: Extended;
    dTFnom: Extended;
    dKvMin: Extended;
    dKvMax: Extended;
  protected
  public
    constructor Create(dC5_in, dC4_in, dC3_in, dC2_in, dC1_in, dC0_in, dTFnom_in, dKvMin_in, dKvMax_in: Extended; ePolyType_in: EPolyType);
    destructor Destroy(); override;
  end;

  CHvlPoly = class(TObject)
  private
    dC6: Extended;
    dC5: Extended;
    dC4: Extended;
    dC3: Extended;
    dC2: Extended;
    dC1: Extended;
    dC0: Extended;
    dKvLimitLo: Extended;
    dKvLimitHi: Extended;
    dTfLimitLo: Extended;
    dTfLimitHi: Extended;
  protected
  public
    constructor Create(dC6_in, dC5_in, dC4_in, dC3_in, dC2_in, dC1_in, dC0_in, dKvLimitLo_in, dKvLimitHi_in, dTfLimitLo_in, dTfLimitHi_in: Extended);
    destructor Destroy(); override;
  end;

  CBq = class(TObject)
  private
    pr_lstKvLow: TList;
    pr_lstKvHigh: TList;
    pr_lstTfLow: TList;
    pr_lstTfHigh: TList;
    pr_lstDoseCorr: TList;
    pr_lstHvl: TList;
  protected
    sType: string;
  public
    constructor Create(sType_in: string);
    destructor Destroy(); override;
  end;


  CPolynomials = class(TObject)
  private
    pr_lstBq: TList;
    sAppPath: string;
    iBqIndex: Integer;
    sLog: string;
    function SafeFloatConvert(sValue_in: String): Extended;
    function AddBq(sType_in: string): integer;
    procedure ReadPolynomialFiles();
    procedure AddPolyFromFile(pBq_in: CBq; sFileName_in: string; lst_in: TList; ePolyType_in: EPolyType);

    function FindPolyForSetTf(dTf_in: Extended; bLowKvRange_in: Boolean; dKvRatio_in: Extended; var lst_out: TList; var lstTf_out: TList): Integer;
    function FindTfLowAndHigh(KvLst_in: TList; dTf1_in: Extended; var dTfLow_out: extended; var dTfHigh_out: extended): Boolean;
    function FindKvLowAndHigh(TfLst_in: TList; dKv1_in: Extended; var dkVLow_out: extended; var dKvHigh_out: extended): Boolean;
    function CalcKvFromPoly(lst_in: TList; iPolyIndex_in: Integer; dKvRatio_in: Extended): Extended;
    function CalcTfFromPoly(lst_in: TList; dKv_in, dTfRatio_in: Extended; var iErr_out: integer): Extended;
    function CalcKvFromPoly2(lst_in: TList; dTf_in, dKvRatio_in: Extended; var iErr_out: Integer): Extended;

    function FindHvlLowAndHigh(HvlLst_in: TList; dKv_in: Extended; var iLow_out: Integer; var iHigh_out: Integer): Boolean;
    function CalcHvlFromPoly(lst_in: TList; iPolyIndex_in: Integer; dTf_in: Extended): Extended;
  protected
  public
    constructor Create(sAppPath_in: string);
    destructor Destroy(); override;

    function BqCount(): Integer;
    function Bq(iIndex_in: Integer): string;
    procedure SetBq(iIndex_in: Integer);

    function CalcKv_Tf(sTf_in: string; bLowKvRange_in: Boolean; dKvRatio_in, dTfRatio_in: Extended; var dTf_out: Extended): Extended;
    function CalcDose(dDose_in, dTf_in, dKv_in: Extended): Extended;
    function CalcHvl(dTf_in, dKv_in: Extended): Extended;
    function GetLastLog(): string;
  end;

implementation
uses
Dialogs, strUtils, JwaWinUser, Math;

constructor CPolynomials.Create(sAppPath_in: string);
begin
  inherited Create();
  sAppPath:=sAppPath_in;
  pr_lstBq := TList.Create();
  ReadPolynomialFiles();
  iBqIndex:=-1;
end;

destructor CPolynomials.Destroy();
begin
  inherited Destroy();
  pr_lstBq.Free();
end;

function CPolynomials.BqCount(): Integer;
begin
  Result:=pr_lstBq.Count;
end;

function CPolynomials.Bq(iIndex_in: Integer): string;
var
  pBq: CBq;
begin
  pBq:=pr_lstBq.Items[iIndex_in];
  Result:=pBq.sType;
end;

function CPolynomials.GetLastLog(): string;
begin
  Result:=sLog;
end;

function CPolynomials.CalcKv_Tf(sTf_in: string; bLowKvRange_in: Boolean; dKvRatio_in, dTfRatio_in: Extended; var dTf_out: Extended): Extended;
var
  iPolyIndex, iLoops, iErrLow, iErrHigh: Integer;
  dTfSet, dKv1, dKv2, dKvLow1, dKvHigh1, dTf1, dTfLow, dTfHigh, dTfLow1, dTfHigh1, dKvLow2, dKvHigh2: Extended;
  aKvLst, aTfLst: TList;
begin
  sLog:='-1';
  Result:=-1; dTf_out:=-1;

  dTfSet:=SafeFloatConvert(sTf_in);
  iPolyIndex:=FindPolyForSetTf(dTfSet, bLowKvRange_in, dKvRatio_in, aKvLst, aTfLst);
  if bLowKvRange_in then
    sLog:='Set TF='+sTf_in+#9+'kV range=Low'+#9+'kV ratio='+Format('%3.2f', [dKvRatio_in])+#9+'TF ratio='+Format('%3.2f', [dTfRatio_in])+#13+#10
  else
    sLog:='Set TF='+sTf_in+#9+'kV range=High'+#9+Format('%3.2f', [dKvRatio_in])+#9+Format('%3.2f', [dTfRatio_in])+#13+#10;

  if iPolyIndex > -1 then //4.1
  begin
    dKv1 := CalcKvFromPoly(aKvLst, iPolyIndex, dKvRatio_in);
    sLog:=sLog+'First kV = '+ Format('%3.2f', [dKv1]) + #13+#10;
    Result:=dKv1;
    for iLoops := 1 to 20 do
    begin //4.2 Loop from here, From the last calculated kV value find the nearest below and above in the TF list
      sLog:=sLog+'<<<<<< Loop: ' + IntToStr(iLoops)+' >>>>>>'+#13+#10;

      if not FindKvLowAndHigh(aTfLst, Result, dKvLow1, dKvHigh1)then
      begin
        sLog:=sLog+'kV Low1 = '+ Format('%3.2f', [dKvLow1]) + #13+#10;
        sLog:=sLog+'kV High1 = '+ Format('%3.2f', [dKvHigh1]) + #13+#10;
        sLog:=sLog+'Error -3' + #13+#10;
        Result:=-3; Break;
      end
      else
      begin
        sLog:=sLog+'kV Low1 = '+ Format('%3.2f', [dKvLow1]) + #13+#10;
        sLog:=sLog+'kV High1 = '+ Format('%3.2f', [dKvHigh1]) + #13+#10;
        //4.3 Use the two kV values foun din 4.2
        //TfLow is called low because it is calculated from KvLow but it is actually high and vice versa for TfHigh
        dTfLow:=CalcTfFromPoly(aTfLst, dKvLow1, dTfRatio_in, iErrLow);
        dTfHigh:=CalcTfFromPoly(aTfLst, dKvHigh1, dTfRatio_in, iErrHigh);
        sLog:=sLog+'TF Low = '+ Format('%3.2f', [dTfLow]) + #13+#10;
        sLog:=sLog+'TF High = '+ Format('%3.2f', [dTfHigh]) + #13+#10;
        if (iErrLow=-1) and (iErrHigh=-1) then
        begin
          sLog:=sLog+'Error -2' + #13+#10;
          Result:=-2;Break;
        end;
        //4.4 interpolation
        dTf1:=(dTfLow*((dKvHigh1-Result)/(dKvHigh1-dKvLow1)))+(dTfHigh*((Result-dKvLow1)/(dKvHigh1-dKvLow1)));
        sLog:=sLog+'TF calced = '+ Format('%3.2f', [dTf1]) + #13+#10;
        dTf_out:=dTf1;
        //4.5
        if not FindTfLowAndHigh(aKvLst, dTf1, dTfLow1, dTfHigh1)then
        begin
          sLog:=sLog+'TF Low1 = '+ Format('%3.2f', [dTfLow1]) + #13+#10;
          sLog:=sLog+'TF High1 = '+ Format('%3.2f', [dTfHigh1]) + #13+#10;
          sLog:=sLog+'Error -3' + #13+#10;
          Result:=-3; Break;
        end
        else
        begin
          //4.6  //Low is high and high is low
          sLog:=sLog+'TF Low1 = '+ Format('%3.2f', [dTfLow1]) + #13+#10;
          sLog:=sLog+'TF High1 = '+ Format('%3.2f', [dTfHigh1]) + #13+#10;
          dKvLow2:=CalcKvFromPoly2(aKvLst, dTfLow1, dKvRatio_in, iErrLow);
          dKvHigh2:=CalcKvFromPoly2(aKvLst, dTfHigh1, dKvRatio_in, iErrHigh);
          sLog:=sLog+'kV Low2 = '+ Format('%3.2f', [dKvLow2]) + #13+#10;
          sLog:=sLog+'kV High2 = '+ Format('%3.2f', [dKvHigh2]) + #13+#10;
          if (iErrLow=-1) and (iErrHigh=-1) then
          begin
            sLog:=sLog+'Error -3' + #13+#10;
            Result:=-3;Break;
          end;
          //4.7 interpolation
          dKv2:=(dKvLow2*((dTfHigh1-dTf1)/(dTfHigh1-dTfLow1)))+(dKvHigh2*((dTf1-dTfLow1)/(dTfHigh1-dTfLow1)));
          sLog:=sLog+'kV calced = '+ Format('%3.2f', [dKv2]) + #13+#10;
          //4.8
          Result:=dKv2;
        end;
      end;
    end; //4.8 loop 20 times
  end;
end;

function CPolynomials.CalcDose(dDose_in, dTf_in, dKv_in: Extended): Extended;
begin
//
end;

function CPolynomials.CalcHvl(dTf_in, dKv_in: Extended): Extended;
var
  aHvlLst: TList;
  aBq: CBq;
  iPolyLow, ipolyHigh: Integer;
  dHvlLow, dHvlHigh: Extended;
  aHvlPolyLow, aHvlPolyHigh: CHvlPoly;
begin
  Result:=-1;
  if (iBqIndex >= 0) then
  begin
    aBq:=pr_lstBq.Items[iBqIndex];
    if Assigned(aBq) then
      aHvlLst:=aBq.pr_lstHvl;

    if Assigned(aHvlLst) then
    begin
      if FindHvlLowAndHigh(aHvlLst, dKv_in, iPolyLow, iPolyHigh)then
      begin
        dHvlLow:=CalcHvlFromPoly(aHvlLst, iPolyLow, dTf_in);
        dHvlHigh:=CalcHvlFromPoly(aHvlLst, iPolyHigh, dTf_in);

        aHvlPolyLow:=aHvlLst.Items[iPolyLow];
        aHvlPolyHigh:=aHvlLst.Items[iPolyHigh];

		    if (dHvlLow<>dHvlHigh) and ( (dHvlLow>-1) and (dHvlHigh>-1) ) then
			    Result := dHvlHigh + ((dHvlLow - dHvlHigh) *
            (aHvlPolyHigh.dKvLimitHi - dKv_in)
            /(aHvlPolyHigh.dKvLimitHi-aHvlPolyLow.dKvLimitLo));
      end;
    end;
  end;
end;

function CPolynomials.FindHvlLowAndHigh(HvlLst_in: TList; dKv_in: Extended; var iLow_out: Integer; var iHigh_out: Integer): Boolean;
var
  aPoly: CHvlPoly;
  i: Integer;
begin
  Result:=false;
  iHigh_out:=-1;
  iLow_out:=-1;
  if dKv_in <> -1 then
  begin
    for i := 0 to HvlLst_in.Count -1 do
    begin
      aPoly:=HvlLst_in.Items[i];
      if Assigned(aPoly) then
      begin
        if dKv_in >= aPoly.dKvLimitLo then
          iLow_out := i;
      end;
    end;

    for i := HvlLst_in.Count -1 downto 0 do
    begin
      aPoly:=HvlLst_in.Items[i];
      if Assigned(aPoly) then
      begin
        if dKv_in <= aPoly.dKvLimitHi then
          iHigh_out := i;
      end;
    end;

    if (iLow_out <> -1) and (iHigh_out <> -1) then
      Result:=true;
  end;
end;

function CPolynomials.CalcHvlFromPoly(lst_in: TList; iPolyIndex_in: Integer; dTf_in: Extended): Extended;
var
  aPoly: CHvlPoly;
begin
  Result:=-1.0;
  if dTf_in <> -1 then
  begin
    aPoly:=lst_in.Items[ipolyindex_in];
    if Assigned(aPoly) then
      Result:=(aPoly.dC6*Power(dTf_in, 6))+(aPoly.dC5*Power(dTf_in, 5))+(aPoly.dC4*Power(dTf_in, 4))+(aPoly.dC3*Power(dTf_in, 3))+(aPoly.dC2*Power(dTf_in, 2))+(aPoly.dC1*Power(dTf_in, 1))+aPoly.dC0;
  end;
end;

function CPolynomials.FindTfLowAndHigh(KvLst_in: TList; dTf1_in: Extended; var dTfLow_out: extended; var dTfHigh_out: extended): Boolean;
var
  aPoly: CPoly;
  i: Integer;
begin
  Result:=false;
  dTfHigh_out:=-1;
  dTfLow_out:=-1;
  if dTf1_in <> -1 then
  begin
    for i := 0 to KvLst_in.Count -1 do
    begin
      aPoly:=KvLst_in.Items[i];
      if Assigned(aPoly) then
      begin
        if dTf1_in >= aPoly.dTFnom then
          dTfLow_out := aPoly.dTFnom;
      end;
    end;

    for i := KvLst_in.Count -1 downto 0 do
    begin
      aPoly:=KvLst_in.Items[i];
      if Assigned(aPoly) then
      begin
        if dTf1_in <= aPoly.dTFnom then
          dTfHigh_out := aPoly.dTFnom;
      end;
    end;

    if (dTfLow_out <> -1) and (dTfHigh_out <> -1) then
      Result:=true;
  end;
end;

function CPolynomials.FindKvLowAndHigh(
  TfLst_in: TList;
  dKv1_in: Extended;
  var dkVLow_out: extended;
  var dKvHigh_out: extended): Boolean;
var
  aPoly: CPoly;
  i: Integer;
begin
  Result:=false;
  dKvHigh_out:=-1;
  dKvLow_out:=-1;
  if dKv1_in <> -1 then
  begin
    for i := 0 to TfLst_in.Count -1 do
    begin
      aPoly:=Tflst_in.Items[i];
      if Assigned(aPoly) then
      begin
        if dKv1_in >= aPoly.dTFnom then
          dKvLow_out := aPoly.dTFnom;
      end;
    end;

    for i := TfLst_in.Count -1 downto 0 do
    begin
      aPoly:=Tflst_in.Items[i];
      if Assigned(aPoly) then
      begin
        if dKv1_in <= aPoly.dTFnom then
          dKvHigh_out := aPoly.dTFnom;
      end;
    end;

    if (dKvLow_out <> -1) and (dKvHigh_out <> -1) then
      Result:=true;
  end;
end;

function CPolynomials.CalcKvFromPoly(lst_in: TList; iPolyIndex_in: Integer; dKvRatio_in: Extended): Extended;
var
  aPoly: CPoly;
begin
  Result:=-1.0;
  if dkVRatio_in <> -1 then
  begin
    aPoly:=lst_in.Items[ipolyindex_in];
    if Assigned(aPoly) then
      Result:=(aPoly.dC5*Power(dKvRatio_in, 5))+(aPoly.dC4*Power(dKvRatio_in, 4))+(aPoly.dC3*Power(dKvRatio_in, 3))+(aPoly.dC2*Power(dKvRatio_in, 2))+(aPoly.dC1*Power(dKvRatio_in, 1))+aPoly.dC0;
  end;
end;

function CPolynomials.CalcKvFromPoly2(lst_in: TList; dTf_in, dKvRatio_in: Extended; var iErr_out: Integer): Extended;
var
  aPoly: CPoly;
  i: Integer;
begin
  iErr_out:=0;
  Result:=0;
  if dKvRatio_in <> -1 then
  begin
    for i := 0 to lst_in.Count-1 do
    begin
      aPoly:=lst_in.Items[i];
      if Assigned(aPoly) then
      begin
        if (aPoly.dTFnom = dTf_in) and ((dKvRatio_in > aPoly.dKvMax) or (dKvRatio_in < aPoly.dKvMin)) then
          iErr_out:=-1;
        if (aPoly.dTFnom = dTf_in) then
          Result:=(aPoly.dC5*Power(dKvRatio_in, 5))+(aPoly.dC4*Power(dKvRatio_in, 4))+(aPoly.dC3*Power(dKvRatio_in, 3))+(aPoly.dC2*Power(dKvRatio_in, 2))+(aPoly.dC1*Power(dKvRatio_in, 1))+aPoly.dC0;
      end;
    end;
  end;
end;

function CPolynomials.CalcTfFromPoly(lst_in: TList; dKv_in, dTfRatio_in: Extended; var iErr_out: integer): Extended;
var
  aPoly: CPoly;
  i: Integer;
begin
  iErr_out:=0;
  Result:=0;
  if dTfRatio_in <> -1 then
  begin
    for i := 0 to lst_in.Count-1 do
    begin
      aPoly:=lst_in.Items[i];
      if Assigned(aPoly) then
      begin
        if (aPoly.dTFnom = dKv_in) and ((dTfRatio_in > aPoly.dKvMax) or (dTfRatio_in < aPoly.dKvMin)) then
          iErr_out:=-1;
        if (aPoly.dTFnom = dKv_in) then
          Result:=(aPoly.dC5*Power(dTfRatio_in, 5))+(aPoly.dC4*Power(dTfRatio_in, 4))+(aPoly.dC3*Power(dTfRatio_in, 3))+(aPoly.dC2*Power(dTfRatio_in, 2))+(aPoly.dC1*Power(dTfRatio_in, 1))+aPoly.dC0;
      end;
    end;
  end;
end;

function CPolynomials.FindPolyForSetTf(
  dTf_in: Extended;
  bLowKvRange_in: Boolean;
  dKvRatio_in: Extended;
  var lst_out: TList;
  var lstTf_out: TList
  ): Integer;
var
  aBq: CBq;
  aPoly: CPoly;
  i: Integer;
begin
  Result:=-1;
  if (iBqIndex >= 0) then
  begin
    aBq:=pr_lstBq.Items[iBqIndex];
    if Assigned(aBq) then
    begin
      if bLowKvRange_in then
      begin
        lst_out:=aBq.pr_lstKvLow;
        lstTf_out:=aBq.pr_lstTfLow;
      end
      else
      begin
        lst_out:=aBq.pr_lstKvHigh;
        lstTf_out:=aBq.pr_lstTfHigh;
      end;

      if Assigned(lst_out) then
      begin
        for i := 0 to lst_out.Count-1 do
        begin
          aPoly:=lst_out.Items[i];
          if aPoly.dTFnom = dTf_in then
          begin
            if (dKvRatio_in >= aPoly.dKvMin) and
                (dKvRatio_in <= aPoly.dKvMax) then
              Result:=i
            else if dKvRatio_in < aPoly.dKvMin then
              Result:=-2
            else if dKvRatio_in > aPoly.dKvMax then
              Result:=-3;
            Break;
          end;
        end;
      end;

      if Result=-2 then //kV ratio was less then allowed
      begin
        for i := lst_out.Count-1 downto 0 do
        begin
          aPoly:=lst_out.Items[i];
          if aPoly.dTFnom < dTf_in then
          begin
            if (dKvRatio_in >= aPoly.dKvMin) and (dKvRatio_in <= aPoly.dKvMax) then
            begin
              Result:=i;
              Break;
            end;
          end;
        end;
      end;

      if Result=-3 then //kV ratio was higher then allowed
      begin
        for i := 0 to lst_out.Count-1 do
        begin
          aPoly:=lst_out.Items[i];
          if aPoly.dTFnom > dTf_in then
          begin
            if (dKvRatio_in >= aPoly.dKvMin) and (dKvRatio_in <= aPoly.dKvMax) then
            begin
              Result:=i;
              Break;
            end;
          end;
        end;
      end;

      if Result<-1 then result:=-1;

    end;
  end;
end;

procedure CPolynomials.SetBq(iIndex_in: Integer);
begin
  iBqIndex:=iIndex_in;
end;

function CPolynomials.AddBq(sType_in: string): integer;
var
  aBq: CBq;
begin
  aBq := CBq.Create(sType_in);
  Result:=pr_lstBq.Add(aBq);
end;

function CPolynomials.SafeFloatConvert(sValue_in: String): Extended;
var
  FormatSet : TFormatSettings;
  sTmp      : string;
  fValue    : Extended;
begin
//  DecimalSeparator := '.';
  //English_United_States: 1033
  GetLocaleFormatSettings(1033, FormatSet);

  sTmp := AnsiReplaceStr(sValue_in, ',', '.');
  sTmp := AnsiReplaceStr(sTmp, ' ', '');

    // Needs a separate test if valid float string. The try-except below seems not allways work
  if not (TryStrToFloat(sTmp, fValue)) then begin
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

procedure CPolynomials.ReadPolynomialFiles();
procedure ListDirs(Path: string; FileList: TStrings);
var
  SR: TSearchRec;
begin
  if FindFirst(Path + '*.*', faDirectory, SR) = 0 then
  begin
    repeat
      if (SR.Attr = faDirectory) then
      begin
        if (SR.Name <> '.') and (SR.Name <> '..') then
          FileList.Add(SR.Name);
      end;
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;
end;
var
  sLstDirs: TStringList;
  aBq: CBq;
  iDirs, iBq: Integer;
begin
  if DirectoryExists(sAppPath+'Polynomials') then
  begin
    sLstDirs := TstringList.Create();
    ListDirs(sAppPath+'Polynomials\', sLstDirs);

    for iDirs := 0 to sLstDirs.Count-1 do
    begin
      iBq:=AddBq(sLstDirs.Strings[iDirs]);
      aBq:=pr_LstBq.Items[iBq];
      if Assigned(aBq) then //For each found BQ
      begin
        AddPolyFromFile(aBq, '\EpolyS3.txt', aBq.pr_lstDoseCorr, DoseCorr);
        AddPolyFromFile(aBq, '\kVpolyL.txt', aBq.pr_lstKvLow, kVLow);
        AddPolyFromFile(aBq, '\kVpolyH.txt', aBq.pr_lstKvHigh, kVHigh);
        AddPolyFromFile(aBq, '\TFpolyL.txt', aBq.pr_lstTfLow, TfLow);
        AddPolyFromFile(aBq, '\TFpolyH.txt', aBq.pr_lstTfHigh, TfHigh);
        AddPolyFromFile(aBq, '\TF2HVL.txt', aBq.pr_lstHvl, TfHigh); //Last param doesn't matter in this case
      end;
    end;

    sLstDirs.Free();
  end;
end;

procedure CPolynomials.AddPolyFromFile(pBq_in: CBq; sFileName_in: string; lst_in: TList; ePolyType_in: EPolyType);
var
  sLstTmp, sFile: TStringList;
  iRows: integer;
  aPoly: CPoly;
  aHvlPoly: CHvlPoly;
procedure ParseDelimited(const sl : TStrings; const value : string; const delimiter : string) ;
var
   dx : integer;
   ns : string;
   txt : string;
   delta : integer;
begin
   delta := Length(delimiter) ;
   txt := value + delimiter;
   sl.BeginUpdate;
   sl.Clear;
   try
     while Length(txt) > 0 do
     begin
       dx := Pos(delimiter, txt) ;
       ns := Copy(txt,0,dx-1) ;
       sl.Add(ns) ;
       txt := Copy(txt,dx+delta,MaxInt) ;
     end;
   finally
     sl.EndUpdate;
   end;
end;
begin
  if FileExists(sAppPath+'Polynomials\'+pBq_in.sType+sFileName_in) then
  begin
    sFile := TstringList.Create();
    sFile.LoadFromFile(sAppPath+'Polynomials\'+pBq_in.sType+sFileName_in);
    for iRows := 0 to sFile.Count-1 do //For each poly in found file
    begin
      sLstTmp := TStringList.Create();
      ParseDelimited(sLstTmp,sFile.Strings[iRows],';');

      if sFileName_in = '\TF2HVL.txt' then
      begin
        if sLstTmp.Count = 11 then
        begin
          aHvlPoly:=CHvlPoly.Create(SafeFloatConvert(sLstTmp.Strings[0]), SafeFloatConvert(sLstTmp.Strings[1]), SafeFloatConvert(sLstTmp.Strings[2]),
            SafeFloatConvert(sLstTmp.Strings[3]), SafeFloatConvert(sLstTmp.Strings[4]), SafeFloatConvert(sLstTmp.Strings[5]), SafeFloatConvert(sLstTmp.Strings[6]),
            SafeFloatConvert(sLstTmp.Strings[7]), SafeFloatConvert(sLstTmp.Strings[8]), SafeFloatConvert(sLstTmp.Strings[9]), SafeFloatConvert(sLstTmp.Strings[10]));
          lst_in.Add(aHvlPoly); //Need to be the same as the file we are looking for
        end;
      end
      else
      begin
        if sLstTmp.Count = 9 then
        begin
          aPoly:=CPoly.Create(SafeFloatConvert(sLstTmp.Strings[0]), SafeFloatConvert(sLstTmp.Strings[1]), SafeFloatConvert(sLstTmp.Strings[2]),
            SafeFloatConvert(sLstTmp.Strings[3]), SafeFloatConvert(sLstTmp.Strings[4]), SafeFloatConvert(sLstTmp.Strings[5]), SafeFloatConvert(sLstTmp.Strings[6]),
            SafeFloatConvert(sLstTmp.Strings[7]), SafeFloatConvert(sLstTmp.Strings[8]), ePolyType_in);
          lst_in.Add(aPoly); //Need to be the same as the file we are looking for
        end;
      end;
      sLstTmp.Free();
    end;
    //MessageBox(0, PWideChar(sFile.Text), PWideChar(sFileName_in), MB_ICONINFORMATION or MB_OK);
    sFile.Free();
  end;
end;



constructor CBq.Create(sType_in: string);
begin
  inherited Create();
  sType:=sType_in;

  pr_lstKvLow:= TList.Create();
  pr_lstKvHigh:= TList.Create();
  pr_lstTfLow:= TList.Create();
  pr_lstTfHigh:= TList.Create();
  pr_lstDoseCorr:= TList.Create();
  pr_lstHvl := TList.Create();
end;

destructor CBq.Destroy();
begin
  pr_lstKvLow.Free();
  pr_lstKvHigh.Free();
  pr_lstTfLow.Free();
  pr_lstTfHigh.Free();
  pr_lstDoseCorr.Free();
  pr_lstHvl.Free();
  inherited Destroy();
end;

constructor CPoly.Create(dC5_in, dC4_in, dC3_in, dC2_in, dC1_in, dC0_in, dTFnom_in, dKvMin_in, dKvMax_in: Extended; ePolyType_in: EPolyType);
begin
  inherited Create();
  ePolyType:=ePolyType_in;
  dC5:=dC5_in;
  dC4:=dC4_in;
  dC3:=dC3_in;
  dC2:=dC2_in;
  dC1:=dC1_in;
  dC0:=dC0_in;
  dTFnom:=dTFnom_in;
  dKvMin:=dKvMin_in;
  dKvMax:=dKvMax_in;
end;

destructor CPoly.Destroy();
begin

end;

constructor CHvlPoly.Create(dC6_in, dC5_in, dC4_in, dC3_in, dC2_in, dC1_in, dC0_in, dKvLimitLo_in, dKvLimitHi_in, dTfLimitLo_in, dTfLimitHi_in: Extended);
begin
  inherited Create();
  dC6:=dC6_in;
  dC5:=dC5_in;
  dC4:=dC4_in;
  dC3:=dC3_in;
  dC2:=dC2_in;
  dC1:=dC1_in;
  dC0:=dC0_in;
  dKvLimitLo:=dKvLimitLo_in;
  dKvLimitHi:=dKvLimitHi_in;
  dTfLimitLo:=dTfLimitLo_in;
  dTfLimitHi:=dTfLimitHi_in;
end;

destructor CHvlPoly.Destroy();
begin

end;

end.
