{*===================== Delphi Unit Header v1 =======================
COPYRIGHT....: © RTI Electronics AB, 2005
FILENAME.....: uExcel
CREATED/SIGN.: 2005-08-19/DA
COMPILER/ENV.: D2005

DESCRIPTION
--------------
Contains a class for usinng Excel in a Delphi prog.
==================================================================|*}
unit uExcel;

interface
uses
Classes, SysUtils, uBaseApp;

type  CExcel = class(CBaseApp)
  private
  protected
    pr_iFirstFoundRow: Integer;//These variables will hold the first found cell when using the find and findnext functions
    pr_iFirstFoundCol: Integer;//By storing the first found cell can we knkow when Excel starts the search once again.
    procedure CreateWorkBook(sSheetName_in: string='');

    function SheetName(sName_in:String):String;
    function GetSheetByName(sName_in: string): Variant;
    function GetActiveSheet(): Variant;

    function GetCellCoord(): TActiveCell; reintroduce; overload; override;
    Procedure GetCellCoord(var iRow_out: Integer; var iCol_out: Integer); reintroduce; overload; override;
  public
    constructor Create();
    destructor Destroy(); override;

    function CheckIfAccessable(): Boolean; reintroduce; override;

    Function GetVersion(): string; override;
    procedure CreateApp(bVisible_in: Boolean); override;
    procedure CreateDoc(sName_in: string); override;
    procedure CloseApp(bDispAlert_in: Boolean); override;
    procedure NewFile(); override;
    procedure OpenFile(sFileName_in: string); override;
    function SaveFile(sFileName_in: string): Boolean; override;

    Function GetCellValue(): string; reintroduce; overload; override;
    Function GetCellValue(iRow_in, iCol_in: Integer): string; reintroduce; overload; override;
    Function GetCellValue(sSheet_in: string): string; reintroduce; overload; override;
    Function GetCellValue(sSheet_in: string; iRow_in, iCol_in: Integer): string; reintroduce; overload; override;

    //As string
    Function SetCellValue(sValue_in: string): Boolean; reintroduce; overload; override;
    Function SetCellValue(iRow_in, iCol_in: Integer; sValue_in: string): Boolean; reintroduce; overload; override;
    Function SetCellValue(sSheet_in, sValue_in: string): Boolean; reintroduce; overload; override;
    Function SetCellValue(sSheet_in: string; iRow_in, iCol_in: Integer; sValue_in: string): Boolean; reintroduce; overload; override;
    //As number
    Function SetCellValue(dValue_in: double): Boolean; reintroduce; overload; override;
    Function SetCellValue(iRow_in, iCol_in: Integer; dValue_in: double): Boolean; reintroduce; overload; override;
    Function SetCellValue(sSheet_in: string; dValue_in: double): Boolean; reintroduce; overload; override;
    Function SetCellValue(sSheet_in: string; iRow_in, iCol_in: Integer; dValue_in: double): Boolean; reintroduce; overload; override;

    Function FindFirst(sString_in: string; bWholeWord_in: Boolean; sSheet_in: string; var iRow_out: Integer; var iCol_out: Integer): Variant; reintroduce; overload; override;
    Function FindNext(sString_in: string; bWholeWord_in: Boolean; sSheet_in: string; varCell_in: Variant; var iRow_out: Integer; var iCol_out: Integer): Variant; reintroduce; overload; override;
    Function FindFirst(sString_in: string; bWholeWord_in: Boolean; var iRow_out: Integer; var iCol_out: Integer): Variant; reintroduce; overload; override;
    Function FindNext(sString_in: string; bWholeWord_in: Boolean; varCell_in: Variant; var iRow_out: Integer; var iCol_out: Integer): Variant; reintroduce; overload; override;

    Function ExcelSelectCell(iRow_in, iCol_in: Integer): Boolean; reintroduce; override;
end;


implementation
uses
Windows, ComObj, Variants;


constructor CExcel.Create();
begin
  inherited Create();
  sApp:='Excel.Application';
  CreateApp(true);
end;

destructor CExcel.Destroy();
begin
  if CloseAppWhenDestroy then
    CloseApp(true);

  inherited Destroy();
end;

{*-===================================================================
FUNCTION NAME: CExcel.CreateApp
RETURNED.....: None
PARAMETERS...: bVisible_in: Boolean

DESCRIPTION
--------------
Creates an instance of Excel. The bVisible_in tells if the instances
should be visible or not.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
procedure CExcel.CreateApp(bVisible_in: Boolean);
begin
  prvarApp := CreateOleObject(sApp);
  if InstanceOK(prvarApp) then
    prvarApp.Visible := bVisible_in;
end;

{*-===================================================================
FUNCTION NAME: CExcel.CreateWorkBook
RETURNED.....: None
PARAMETERS...: optional sSheetName_in: string=''

DESCRIPTION
--------------
Creates a workbook. If the paramter sSheetName_in is supplied will
this function:
1. See if it is a filepath, if so open the file into the workbook
2. If its not a filepath then will the function create a new workbook
   and set the newly created workbook's sheet name to the supplied param.
3. If th eoptional param not is suppplied will this function just create
   a new workbook with all default names that Excel tells it to.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
procedure CExcel.CreateWorkBook(sSheetName_in: string='');
var
  Workbook: Variant;
  sNewSheetName: string;
begin
  if InstanceOK(prvarApp) then
  begin
    if FileExists(sSheetName_in) then
    begin
      Workbook := prvarApp.Workbooks.Open(sSheetName_in);
    end
    else
    begin
      Workbook := prvarApp.Workbooks.Add({xlWBATWorksheet});
      if sSheetName_in <> '' then
      begin
        sNewSheetName := SheetName(sSheetName_in);
        Workbook.Sheets[1].Name := sNewSheetName;
      end;
    end;
  end;
end;

{*-===================================================================
FUNCTION NAME: CExcel.NewFile
RETURNED.....: None
PARAMETERS...: 

DESCRIPTION
--------------
A exported function that just creates a  new workbook.
See CExcel.CreateWorkBook

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
procedure CExcel.NewFile();
begin
  CreateWorkBook();
end;

{*-===================================================================
FUNCTION NAME: CExcel.OpenFile
RETURNED.....: None
PARAMETERS...: sFileName_in: string

DESCRIPTION
--------------
A exported function that just opens an existing file into a workbook.
See CExcel.CreateWorkBook

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
procedure CExcel.OpenFile(sFileName_in: string);
begin
  CreateWorkBook(sFileName_in);
end;

{*-===================================================================
FUNCTION NAME: CExcel.SaveFile
RETURNED.....: None
PARAMETERS...: sFileName_in: string

DESCRIPTION
--------------
Saves active workbook to a file specified by the parameter.
NOTE! File extention will always be xls.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
function CExcel.SaveFile(sFileName_in: string): Boolean;
var
  sFileName: string;
begin
  Result := false;
  if InstanceOK(prvarApp) then
  begin
    sFileName := ChangeFileExt(sFileName_in, 'xls');
    prvarApp.ActiveWorkbook.SaveAs(sFileName_in);
    Result := true;
  end;
end;

{*-===================================================================
FUNCTION NAME: CExcel.CreateDoc
RETURNED.....: None
PARAMETERS...: sName_in: string

DESCRIPTION
--------------
Adds a sheet to the active workbook. It also sets the sheet name to
the one supplied as parm.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
procedure CExcel.CreateDoc(sName_in: string);
var
  Sheet: Variant;
begin
  if InstanceOK(prvarApp) then
  begin
    Sheet := prvarApp.ActiveWorkbook.WorkSheets.Add;
    Sheet.Name := SheetName(sName_in)
  end;
end;

{*-===================================================================
FUNCTION NAME: CExcel.CloseApp
RETURNED.....: None
PARAMETERS...: bDispAlert_in: Boolean

DESCRIPTION
--------------
Closes the instances of Excel. If bDispAlert_in is true will Excel
pop up a dialog if the file was changed, asking user to save or not.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
procedure CExcel.CloseApp(bDispAlert_in: Boolean);
begin
  if InstanceOK(prvarApp) then
  begin
    prvarApp.DisplayAlerts := bDispAlert_in;
    prvarApp.Quit;
    prvarApp := Unassigned();
    prvarDoc := Unassigned();
  end;
end;

{*-===================================================================
FUNCTION NAME: CExcel.CheckIfAccessable
RETURNED.....: Boolean
PARAMETERS...: 

DESCRIPTION
--------------
Checks if Excel is accessable or not.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
function CExcel.CheckIfAccessable(): Boolean;
begin
  Result := InstanceOK(prvarApp);
  if Result then
  begin
    try
      prvarApp.Cells[1, 1];
    except
      Result := False;
    end;
  end;
end;

// used for making worksheet labels which are acceptable to Excel
// Excel sheet labels are not case sensitive
{*-===================================================================
FUNCTION NAME: CExcel.SheetName
RETURNED.....: String
PARAMETERS...: sName_in:String; bAssignNameIfBlank_in:boolean=true

DESCRIPTION
--------------
Makes a sheet name that Excel accepts.
If the sheet name contains non valid charactes will they just be deleted.
If the supplied sheet name is blank then will it be set to "Unnamed"

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
function CExcel.SheetName(sName_in:String):String;
var
  I:Integer;
begin
  try
    Result:=sName_in;
    if Result='' then
      Result:='Unnamed';
    For I:=Length(Result) downto 1 Do
      If Not (Result[I] In [' ','(',')','-','.','A'..'Z','0'..'9','a'..'z']) Then
        Delete(Result,I,1);
    if Length(Result)>31 then
      SetLength(Result,31);

    Result:=Trim(Result);
  except
    Result:='Unnamed';
  end;
end;

{*-===================================================================
FUNCTION NAME: CExcel.GetSheetByName
RETURNED.....: Variant
PARAMETERS...: sName_in: string

DESCRIPTION
--------------
Tries to find a sheet in the active workbook that matches the
supplied string. If it is found will a handle to that sheet be returned.
If its not found will the return value be "Unassigned"
You can use the function CExcel.InstanceOK to verify if it is a valid
handle or not.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
function CExcel.GetSheetByName(sName_in: string): Variant;
var
  i: Integer;
begin
  Result := Unassigned();
  if InstanceOK(prvarApp) then
  begin
    for i:=1 to prvarApp.ActiveWorkbook.Sheets.Count do
    begin
      if prvarApp.ActiveWorkbook.Sheets[i].Name = sName_in then
        Result := prvarApp.ActiveWorkbook.Sheets[i];
    end;
  end;
end;

{*-===================================================================
FUNCTION NAME: CExcel.GetActiveSheet
RETURNED.....: Variant
PARAMETERS...:

DESCRIPTION
--------------
Returns a handle of the active sheet.
You can use the function CExcel.InstanceOK to verify if it is a valid
handle or not.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
function CExcel.GetActiveSheet(): Variant;
begin
  Result := Unassigned();
  if InstanceOK(prvarApp) then
    Result := prvarApp.ActiveSheet;
end;

{*-===================================================================
FUNCTION NAME: CExcel.GetVersion
RETURNED.....: string
PARAMETERS...: 

DESCRIPTION
--------------
Returns the version of Excel.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
function CExcel.GetVersion(): string;
Var
  sVersion: string;//ShortString;
Begin
  Result := '';
  if InstanceOK(prvarApp) then
  begin
    Try
      sVersion := prvarApp.Version;
      Result := sVersion;
    Except
      Result := '';
    End;
  end;
End;

{*-===================================================================
FUNCTION NAME: CExcel.ExcelSelectCell
RETURNED.....: Boolean
PARAMETERS...: iRow_in, iCol_in: Integer

DESCRIPTION
--------------
Selects the cell specified by the row and column parameters.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function CExcel.ExcelSelectCell(iRow_in, iCol_in: Integer): Boolean;
Begin
  Result := False;
  if InstanceOK(prvarApp) then
  begin
    Try
      prvarApp.ActiveSheet.Cells[iRow_in, iCol_in].Select;
      Result := true;
    Except
      Result := False;
    End;
  end;
End;

{*-===================================================================
FUNCTION NAME: CExcel.GetCellValue
RETURNED.....: string
PARAMETERS...: 

DESCRIPTION
--------------
Returns the cell value of the selected cell in active sheet.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function CExcel.GetCellValue(): string;
var
  iRow, iCol: Integer;
begin
  GetCellCoord(iRow, iCol);
  Result := GetCellValue(iRow, iCol);
end;

{*-===================================================================
FUNCTION NAME: CExcel.SetCellValue
RETURNED.....: Boolean
PARAMETERS...: sValue_in: string

DESCRIPTION
--------------
Sets the active cell value in the active sheet to the supplied param.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function CExcel.SetCellValue(sValue_in: string): Boolean;
var
  iRow, iCol: Integer;
begin
  GetCellCoord(iRow, iCol);
  Result := SetCellValue(iRow, iCol, sValue_in);
end;

{*-===================================================================
FUNCTION NAME: CExcel.SetCellValue
RETURNED.....: Boolean
PARAMETERS...: dValue_in: double

DESCRIPTION
--------------
Sets the active cell value in the active sheet to the supplied param.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function CExcel.SetCellValue(dValue_in: double): Boolean;
var
  iRow, iCol: Integer;
begin
  GetCellCoord(iRow, iCol);
  Result := SetCellValue(iRow, iCol, dValue_in);
end;

{*-===================================================================
FUNCTION NAME: CExcel.GetCellValue
RETURNED.....: string
PARAMETERS...: iRow_in, iCol_in: Integer

DESCRIPTION
--------------
Gets the value in the specified cell in active sheet.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function CExcel.GetCellValue(iRow_in, iCol_in: Integer): string;
Begin
  Result := '';
  if InstanceOK(prvarApp) then
  begin
    Try
      Result := prvarApp.Cells[iRow_in, iCol_in].Value;
    Except
      Result := '';
    End;
  end;
End;

{*-===================================================================
FUNCTION NAME: CExcel.SetCellValue
RETURNED.....: Boolean
PARAMETERS...: iRow_in, iCol_in: Integer; sValue_in: string

DESCRIPTION
--------------
Sets the supplied value to the specified cell in the active sheet.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function CExcel.SetCellValue(iRow_in, iCol_in: Integer; sValue_in: string): Boolean;
Begin
  Result := false;
  if InstanceOK(prvarApp) then
  begin
    Try
      prvarApp.Cells[iRow_in, iCol_in].Value := sValue_in;
      Result := True;
    Except
      Result := False;
    End;
  end;
End;

{*-===================================================================
FUNCTION NAME: CExcel.SetCellValue
RETURNED.....: Boolean
PARAMETERS...: iRow_in, iCol_in: Integer; dValue_in: double

DESCRIPTION
--------------
Sets the supplied value to the specified cell in the active sheet.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function CExcel.SetCellValue(iRow_in, iCol_in: Integer; dValue_in: double): Boolean;
begin
  Result := false;
  if InstanceOK(prvarApp) then
  begin
    Try
      prvarApp.Cells[iRow_in, iCol_in].Value := dValue_in;
      Result := True;
    Except
      Result := False;
    End;
  end;
End;

{*-===================================================================
FUNCTION NAME: CExcel.GetCellValue
RETURNED.....: string
PARAMETERS...: sSheet_in: string

DESCRIPTION
--------------
Gets the value from the active cell in the specified sheet.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function CExcel.GetCellValue(sSheet_in: string): string;
var
  iRow, iCol: Integer;
  Sheet: Variant;
begin
  Result := '';
  GetCellCoord(iRow, iCol);
  Try
    Sheet := GetSheetByName(sSheet_in);
    Result := Sheet.Cells[iRow, iCol].Value;
  Except
    Result := '';
  End;
end;

{*-===================================================================
FUNCTION NAME: CExcel.SetCellValue
RETURNED.....: Boolean
PARAMETERS...: sSheet_in, sValue_in: string

DESCRIPTION
--------------
Sets the supplied value to the active cell in the specified sheet.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function CExcel.SetCellValue(sSheet_in, sValue_in: string): Boolean;
var
  iRow, iCol: Integer;
  Sheet: Variant;
begin
  GetCellCoord(iRow, iCol);
  try
    Sheet := GetSheetByName(sSheet_in);
    Sheet.Cells[iRow, iCol] := sValue_in;
    Result := true;
  except
    Result := false;
  end;
end;

{*-===================================================================
FUNCTION NAME: CExcel.SetCellValue
RETURNED.....: Boolean
PARAMETERS...: sSheet_in: string; dValue_in: double

DESCRIPTION
--------------
Sets the supplied value to the active cell in the specified sheet.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function CExcel.SetCellValue(sSheet_in: string; dValue_in: double): Boolean;
var
  iRow, iCol: Integer;
  Sheet: Variant;
begin
  GetCellCoord(iRow, iCol);
  try
    Sheet := GetSheetByName(sSheet_in);
    Sheet.Cells[iRow, iCol] := dValue_in;
    Result := true;
  except
    Result := false;
  end;
end;

{*-===================================================================
FUNCTION NAME: CExcel.GetCellValue
RETURNED.....: string
PARAMETERS...: sSheet_in: string; iRow_in, iCol_in: Integer

DESCRIPTION
--------------
Gets the value from the specified cell in the specified sheet.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function CExcel.GetCellValue(sSheet_in: string; iRow_in, iCol_in: Integer): string;
var
  Sheet: Variant;
begin
  Result := '';
  Try
    Sheet := GetSheetByName(sSheet_in);
    Result := Sheet.Cells[iRow_in, iCol_in].Value;
  Except
    Result := '';
  End;
end;

{*-===================================================================
FUNCTION NAME: CExcel.SetCellValue
RETURNED.....: Boolean
PARAMETERS...: sSheet_in: string; iRow_in, iCol_in: Integer; sValue_in: string

DESCRIPTION
--------------
Sets the specified value to the specified cell in the specified sheet.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function CExcel.SetCellValue(sSheet_in: string; iRow_in, iCol_in: Integer; sValue_in: string): Boolean;
var
  Sheet: Variant;
begin
  try
    Sheet := GetSheetByName(sSheet_in);
    Sheet.Cells[iRow_in, iCol_in] := sValue_in;
    Result := true;
  except
    Result := false;
  end;
end;

{*-===================================================================
FUNCTION NAME: CExcel.SetCellValue
RETURNED.....: Boolean
PARAMETERS...: sSheet_in: string; iRow_in, iCol_in: Integer; dValue_in: double

DESCRIPTION
--------------
Sets the specified value to the specified cell in the specified sheet.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function CExcel.SetCellValue(sSheet_in: string; iRow_in, iCol_in: Integer; dValue_in: double): Boolean;
var
  Sheet: Variant;
begin
  try
    Sheet := GetSheetByName(sSheet_in);
    Sheet.Cells[iRow_in, iCol_in] := dValue_in;
    Result := true;
  except
    Result := false;
  end;
end;

{*-===================================================================
FUNCTION NAME: CExcel.GetCellCoord
RETURNED.....: TActiveCell
PARAMETERS...: 

DESCRIPTION
--------------
Fills the ActiveCell property with info about the currently selected cell

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
function CExcel.GetCellCoord(): TActiveCell;
var
  MyActCell: TActiveCell;
begin
  GetCellCoord(MyActCell.iRow, MyActCell.iCol);
  result := MyActCell;
end;

{*-===================================================================
FUNCTION NAME: CExcel.GetCellCoord
RETURNED.....: None
PARAMETERS...: var iRow_out: Integer; var iCol_out: Integer

DESCRIPTION
--------------
Sets th esupplied iRow_out and iCol_out to the coordinates of the
currently selected cell.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Procedure CExcel.GetCellCoord(var iRow_out: Integer; var iCol_out: Integer);
begin
  iCol_out:=1;
  iRow_out:=1;
  if InstanceOK(prvarApp) then
  begin
    try
      iCol_out:=prvarApp.ActiveCell.Column;
      iRow_out:=prvarApp.ActiveCell.Row;
    except
      iCol_out:=1;
      iRow_out:=1;
    end;
  end;
end;

{*-===================================================================
FUNCTION NAME: CExcel.FindFirst
RETURNED.....: Variant
PARAMETERS...: sString_in: string; bWholeWord_in: Boolean; sSheet_in: string; var iRow_out: Integer; var iCol_out: Integer

DESCRIPTION
--------------
Find the first cell in specified sheet that contains sString_in.
If bWholeWord_in is True, then the cell must contain ONLY the text
as indicated.

Use the function CExcel.InstanceOK in order to check if the string was found.
The return value is also used in the FindNext function as a in parameter.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function CExcel.FindFirst(sString_in: string; bWholeWord_in: Boolean; sSheet_in: string; var iRow_out: Integer; var iCol_out: Integer): Variant;
var
  varSheet, varCellFound: variant;
  const xlValue = 2;
  const xlPart = 2;
begin
  //range.Find('searchstring', A1, xlValue, xlWhole{xlPart}, xlByRows, xlNext, false, false);
  //params
  //1: What (required) 	Object 	The data to find; can be a string or any Excel data type.
  //2: After 	Range 	The range after which you want the search to start (this cell is not included in the search); if you do not specify this cell, the search begins in the upper left corner of the range.
  //3: LookIn 	XlFindLookin (xlValue, xlComments, xlFormulas) 	The type of information to be searched; cannot be combined using the Or operator.
  //4: LookAt 	XlLookAt (xlWhole, xlPart) 	Determines whether the search matches entire cells or partial cells.
  //5: SearchOrder 	XlSearchOrder (xlByRows, xlByColumns) 	Determines the order for the search; xlByRows (the default) causes the search to go across and then down, and xlByColumns causes the search to go down and then across.
  //6: SearchDirection 	XlSearchDirection (xlNext, xlPrevious) 	Determines the direction of the search.
  //7: MatchCase 	Boolean 	Determines whether the search is case-sensitive.
  //8: MatchByte 	Boolean 	Determines whether double-byte characters match only double-byte characters (True) or equivalent single-byte characters (False); only applies if you have double-byte support.

  Result := Unassigned();
  varCellFound := Unassigned();
  varSheet := GetSheetByName(sSheet_in);
  if InstanceOK(varSheet) then
    varCellFound := varSheet.Cells.Find(sString_in,,xlValue, xlPart); //varSheet.FindNext(varCell_in);

  if InstanceOK(varCellFound) then
  begin
    Result := varCellFound;
    iRow_out:=varCellFound.Row;
    iCol_out:=varCellFound.Column;
    pr_iFirstFoundRow:=iRow_out;
    pr_iFirstFoundCol:=iCol_out;
  end;
end;

{*-===================================================================
FUNCTION NAME: CExcel.FindFirst
RETURNED.....: Variant
PARAMETERS...: sString_in: string; bWholeWord_in: Boolean; var iRow_out: Integer; var iCol_out: Integer

DESCRIPTION
--------------
Find the first cell in active sheet that contains sString_in.
If bWholeWord_in is True, then the cell must contain ONLY the text
as indicated.

Use the function CExcel.InstanceOK in order to check if the string was found.
The return value is also used in the FindNext function as a in parameter.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function CExcel.FindFirst(sString_in: string; bWholeWord_in: Boolean; var iRow_out: Integer; var iCol_out: Integer): Variant;
var
  varSheet, varCellFound: variant;
  const xlValue = 2;
  const xlPart = 2;
begin
  Result := Unassigned();
  varCellFound := Unassigned();
  varSheet := GetActiveSheet();
  if InstanceOK(varSheet) then
    varCellFound := varSheet.Cells.Find(sString_in,,xlValue, xlPart); //varSheet.FindNext(varCell_in);

  if InstanceOK(varCellFound) then
  begin
    Result := varCellFound;
    iRow_out:=varCellFound.Row;
    iCol_out:=varCellFound.Column;
    pr_iFirstFoundRow:=iRow_out;
    pr_iFirstFoundCol:=iCol_out;
  end;
end;

{*-===================================================================
FUNCTION NAME: CExcel.FindNext
RETURNED.....: Variant
PARAMETERS...: sString_in: string; bWholeWord_in: Boolean; sSheet_in: string; varCell_in: Variant; var iRow_out: Integer; var iCol_out: Integer

DESCRIPTION
--------------
Find the next cell in specified sheet that contains sString_in.
If bWholeWord_in is True, then the cell must contain ONLY the text
as indicated.

Use the function CExcel.InstanceOK in order to check if the string was found.
The return value is also used in the FindNext function as a in parameter.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function CExcel.FindNext(sString_in: string; bWholeWord_in: Boolean; sSheet_in: string; varCell_in: Variant; var iRow_out: Integer; var iCol_out: Integer): Variant;
var
  varSheet, varCellFound: variant;
begin
  //range.Find('searchstring', A1, xlValue, xlWhole{xlPart}, xlByRows, xlNext, false, false);
  //params
  //1: What (required) 	Object 	The data to find; can be a string or any Excel data type.
  //2: After 	Range 	The range after which you want the search to start (this cell is not included in the search); if you do not specify this cell, the search begins in the upper left corner of the range.
  //3: LookIn 	XlFindLookin (xlValue, xlComments, xlFormulas) 	The type of information to be searched; cannot be combined using the Or operator.
  //4: LookAt 	XlLookAt (xlWhole, xlPart) 	Determines whether the search matches entire cells or partial cells.
  //5: SearchOrder 	XlSearchOrder (xlByRows, xlByColumns) 	Determines the order for the search; xlByRows (the default) causes the search to go across and then down, and xlByColumns causes the search to go down and then across.
  //6: SearchDirection 	XlSearchDirection (xlNext, xlPrevious) 	Determines the direction of the search.
  //7: MatchCase 	Boolean 	Determines whether the search is case-sensitive.
  //8: MatchByte 	Boolean 	Determines whether double-byte characters match only double-byte characters (True) or equivalent single-byte characters (False); only applies if you have double-byte support.

  Result := Unassigned();
  varCellFound := Unassigned();
  varSheet := GetSheetByName(sSheet_in);
  //varSheet.Cells.Range('A1:M500'); //Set this t a proper range, including the whole sheet
  if InstanceOK(varSheet) then
    varCellFound := varSheet.Cells.FindNext(varCell_in);

  if not InstanceOK(varCell_in) then
    varCellFound := Unassigned();

  if InstanceOK(varCellFound) then
  begin
    if (pr_iFirstFoundRow <> varCellFound.Row) or (pr_iFirstFoundCol <> varCellFound.Column) then
    begin
      Result := varCellFound;
      iRow_out:=varCellFound.Row;
      iCol_out:=varCellFound.Column;
    end;
  end;
end;

{*-===================================================================
FUNCTION NAME: CExcel.FindNext
RETURNED.....: Variant
PARAMETERS...: sString_in: string; bWholeWord_in: Boolean; varCell_in: Variant; var iRow_out: Integer; var iCol_out: Integer

DESCRIPTION
--------------
Find the next cell in active sheet that contains sString_in.
If bWholeWord_in is True, then the cell must contain ONLY the text
as indicated.

Use the function CExcel.InstanceOK in order to check if the string was found.
The return value is also used in the FindNext function as a in parameter.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function CExcel.FindNext(sString_in: string; bWholeWord_in: Boolean; varCell_in: Variant; var iRow_out: Integer; var iCol_out: Integer): Variant;
var
  varSheet, varCellFound: variant;
begin
  //range.Find('searchstring', A1, xlValue, xlWhole{xlPart}, xlByRows, xlNext, false, false);
  //params
  //1: What (required) 	Object 	The data to find; can be a string or any Excel data type.
  //2: After 	Range 	The range after which you want the search to start (this cell is not included in the search); if you do not specify this cell, the search begins in the upper left corner of the range.
  //3: LookIn 	XlFindLookin (xlValue, xlComments, xlFormulas) 	The type of information to be searched; cannot be combined using the Or operator.
  //4: LookAt 	XlLookAt (xlWhole, xlPart) 	Determines whether the search matches entire cells or partial cells.
  //5: SearchOrder 	XlSearchOrder (xlByRows, xlByColumns) 	Determines the order for the search; xlByRows (the default) causes the search to go across and then down, and xlByColumns causes the search to go down and then across.
  //6: SearchDirection 	XlSearchDirection (xlNext, xlPrevious) 	Determines the direction of the search.
  //7: MatchCase 	Boolean 	Determines whether the search is case-sensitive.
  //8: MatchByte 	Boolean 	Determines whether double-byte characters match only double-byte characters (True) or equivalent single-byte characters (False); only applies if you have double-byte support.

  Result := Unassigned();
  varCellFound := Unassigned();
  varSheet := GetActiveSheet();
  //varSheet.Cells.Range('A1:M500'); //Set this t a proper range, including the whole sheet
  if InstanceOK(varSheet) then
    varCellFound := varSheet.Cells.FindNext(varCell_in);

  if not InstanceOK(varCell_in) then
    varCellFound := Unassigned();

  if InstanceOK(varCellFound) then
  begin
    if (pr_iFirstFoundRow <> varCellFound.Row) or (pr_iFirstFoundCol <> varCellFound.Column) then
    begin
      Result := varCellFound;
      iRow_out:=varCellFound.Row;
      iCol_out:=varCellFound.Column;
    end;
  end;
end;


end.
