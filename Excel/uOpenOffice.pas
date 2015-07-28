{*===================== Delphi Unit Header v1 =======================
COPYRIGHT....: © RTI Electronics AB, 2005
FILENAME.....: uOpenOffice
CREATED/SIGN.: 2005-08-19/DA
COMPILER/ENV.: D2005


DESCRIPTION
--------------
Contains a class for usinng Open Office in a Delphi prog.
==================================================================|*}
unit uOpenOffice;

interface
uses
Classes, SysUtils, uBaseApp, Dialogs, controls{needed for dialogs};

type  COpenOffice = class(CBaseApp)
  private
  protected
    prSaveDlg: TSaveDialog;
    function ConvertToURL(sPath_in: string):  String;
    function IsSpreadsheetDoc(): Boolean;

    function CoorToStrCoor(iCol_in,iRow_in:integer):string; override;
    procedure StrCoorToCoor(sCoor_in: string; var iCol_out,iRow_out: integer); override;

    function GetCellCoord(): TActiveCell; reintroduce; overload; override;
    Procedure GetCellCoord(var iRow_out: Integer; var iCol_out: Integer); reintroduce; overload; override;

    function HasMethod(varObj_in: Variant; sMethodName_in: string): Boolean;
    function CreateDummyArray(): Variant;
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
Variants, ComObj;

constructor COpenOffice.Create();
begin
  inherited Create();
  sApp:='com.sun.star.ServiceManager';
  CreateApp(true);
end;

destructor COpenOffice.Destroy();
begin
  if CloseAppWhenDestroy then
    CloseApp(true);

  inherited Destroy();
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.CheckIfAccessable
RETURNED.....: Boolean
PARAMETERS...: 

DESCRIPTION
--------------
Checks if Open Office is accessable or not

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
function COpenOffice.CheckIfAccessable(): Boolean;
begin
  Result := InstanceOK(prvarApp);
  if Result then
  begin
    try
      GetCellValue();
    except
      Result := False;
    end;
  end;
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.CreateApp
RETURNED.....: None
PARAMETERS...: bVisible_in: Boolean

DESCRIPTION
--------------
Creates an instance of Open Office

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
procedure COpenOffice.CreateApp(bVisible_in: Boolean);
begin
  try
    prvarApp := CreateOleObject(sApp);
  except
    prvarApp := Unassigned();
  end;
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.CreateDoc
RETURNED.....: None
PARAMETERS...: sName_in: string

DESCRIPTION
--------------
Creates a document to use.
If parameter sName_in is passed in then will it open the specified
document.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
procedure COpenOffice.CreateDoc(sName_in: string);
var
  StarDesktop: Variant;
begin
  try
    if InstanceOK(prvarApp) then
    begin
      StarDesktop := prvarApp.createInstance('com.sun.star.frame.Desktop');
      if sName_in <> '' then
        prvarDoc := StarDesktop.LoadComponentFromURL(ConvertToURL(sName_in), '_blank', 0, VarArrayCreate([0, - 1], varVariant))
      else
        prvarDoc := StarDesktop.LoadComponentFromURL('private:factory/scalc', '_blank', 0, VarArrayCreate([0, - 1], varVariant));
    end;
  except
    prvarDoc := Unassigned;
  end;
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.HasMethod
RETURNED.....: Boolean
PARAMETERS...: varObj_in: Variant; sMethodName_in: string

DESCRIPTION
--------------
Checks if the supplied sMethodName_in exists in the supplied varObj_in.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
function COpenOffice.HasMethod(varObj_in: Variant; sMethodName_in: string): Boolean;
var
  varIntrospection, varObjInfo, varMethods, varMethod: Variant;
  sMethodInterfaceName: string;
  i: Integer;
begin
  try
    Result := False;
    // Get the Introspection service.
    varIntrospection := prvarApp.createInstance('com.sun.star.beans.Introspection');
    // Now inspect the object to learn about it.
    varObjInfo := varIntrospection.inspect( varObj_in );

    // Get an array describing all methods.
    varMethods := varObjInfo.getMethods(-1);

    //Compare each found method with the one supplied
    for i := 0 To VarArrayHighBound(varMethods, 1) do
    begin
      varMethod := varMethods[i];
      sMethodInterfaceName := varMethod.Name;
      If sMethodInterfaceName = sMethodName_in Then
      begin
        Result := true;
        Break;
      end;
    end;
  except
    Result := false;
  end;
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.CreateDummyArray
RETURNED.....: Variant
PARAMETERS...:

DESCRIPTION
--------------
Creates an empty array for an empty list

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
function COpenOffice.CreateDummyArray(): Variant;
begin
  Result:= VarArrayCreate([0, -1], varVariant);
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.CloseApp
RETURNED.....: None
PARAMETERS...: bDispAlert_in: Boolean

DESCRIPTION
--------------
Closes the created instance of Open Office.
If bDisplayAlert_in is true and the document is modified will it
prompt you if you want to save the changes.

If it is a new document will it also prompt you to locate where to save
it and to specify a file name.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
procedure COpenOffice.CloseApp(bDispAlert_in: Boolean);
var
  sFileName: string;
  bNewFile: Boolean;
begin
  try
    bNewFile:=false;
    sFileName := prvarDoc.getURL;
    if sFileName = '' then bNewFile:=true;

    if (bDispAlert_in) and (prvarDoc.IsModified) then
    begin
      if MessageDlg(format('"%s" is modified, do you want to save changes?', [sFileName]), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        if bNewFile then
        begin
          prSaveDlg := TSaveDialog.Create(nil);
          prSaveDlg.Filter := 'Open Office calc files (*.sxc)|*.SXC|Any files (*.*)|*.*';
          prSaveDlg.FilterIndex := 1;
          if prSaveDlg.Execute() then
          begin
            sFileName := ConvertToURL(prSaveDlg.FileName);
            prvarDoc.storeAsURL(sFileName, CreateDummyArray());
          end;
          prSaveDlg.Free();
        end
        else
          prvarDoc.store;
      end;
    end;
  except
    on E : Exception do
    if MessageDlg('There was an error: ' + E.Message + #13+#10 + 'Do you want to continue closing the application?' + #13+#10+ 'Note! your changes may not be saved.' , mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Exit;
  end;

  if HasMethod(prvarDoc, 'close') then
    prvarDoc.Close(true)
  else
    prvarDoc.Dispose;

  prvarApp := Unassigned();
  prvarDoc := Unassigned();
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.NewFile
RETURNED.....: None
PARAMETERS...:

DESCRIPTION
--------------
Creates a new empty document

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
procedure COpenOffice.NewFile();
begin
  CreateDoc('');
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.OpenFile
RETURNED.....: None
PARAMETERS...: sFileName_in: string

DESCRIPTION
--------------
Opens the supplied file in a document.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
procedure COpenOffice.OpenFile(sFileName_in: string);
begin
  CreateDoc(sFileName_in);
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.SaveFile
RETURNED.....: Boolean, true if file is saved
PARAMETERS...: sFileName_in: string

DESCRIPTION
--------------
Saves current document as the supplied file name.
NOTE! The file extention will always be *.sxc

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
function COpenOffice.SaveFile(sFileName_in: string): Boolean;
var
  sFileName: string;
begin
  Result := false;
  sFileName := ChangeFileExt(sFileName_in, 'sxc');
  sFileName := ConvertToURL(sFileName);
  if InstanceOK(prvarDoc) then
  begin
    prvarDoc.storeAsURL(sFileName, CreateDummyArray());
    Result := true;
  end;
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.ConvertToURL
RETURNED.....: String
PARAMETERS...: sPath_in: string

DESCRIPTION
--------------
Converts a path to URL-format which Open Office uses

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
function COpenOffice.ConvertToURL(sPath_in: string):  String;
var
   sInstr: String;
begin
   sInstr := stringReplace(sPath_in, '\', '/', [rfReplaceAll]);
   Result := 'file:///' + sInstr;
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.IsSpreadsheetDoc
RETURNED.....: Boolean
PARAMETERS...:

DESCRIPTION
--------------
Checks if current document is a spreadsheet document

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
function COpenOffice.IsSpreadsheetDoc(): Boolean;
begin
  Result := false;
  if InstanceOK(prvarDoc) then
    Result := prvarDoc.SupportsService('com.sun.star.sheet.SpreadsheetDocument');
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.CoorToStrCoor
RETURNED.....: string
PARAMETERS...: iCol_in,iRow_in:integer

DESCRIPTION
--------------
See CBaseApp.CoorToStrCoor.
NOTE! Since Open Office uses 0 for the first col or row must we
increase the coordinates to return the correct string coordinate.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
function COpenOffice.CoorToStrCoor(iCol_in,iRow_in:integer):string;
begin
  Result := inherited CoorToStrCoor(iCol_in+1, iRow_in+1);
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.StrCoorToCoor
RETURNED.....: None
PARAMETERS...: sCoor_in: string; var iCol_out,iRow_out: integer

DESCRIPTION
--------------
See CBaseApp.StrCoorToCoor.
NOTE! Since Open Office uses 0 for the first col or row must we
decrease the coordinates to return the correct value coordinate.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
procedure COpenOffice.StrCoorToCoor(sCoor_in: string; var iCol_out,iRow_out: integer);
begin
  inherited StrCoorToCoor(sCoor_in, iCol_out, iRow_out);
  iCol_out:=iCol_out-1;
  iRow_out:=iRow_out-1;
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.GetCellValue
RETURNED.....: string
PARAMETERS...:

DESCRIPTION
--------------
Gets the value as a string from the selected cell in selected sheet
from the active document.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function COpenOffice.GetCellValue(): string;
var
  iRow, iCol: Integer;
begin
  GetCellCoord(iRow, iCol);
  Result := GetCellValue(iRow, iCol);
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.SetCellValue
RETURNED.....: Boolean
PARAMETERS...: sValue_in: string

DESCRIPTION
--------------
Sets the selected cell in selected sheet at active document to the
supplied value.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function COpenOffice.SetCellValue(sValue_in: string): Boolean;
var
  iRow, iCol: Integer;
begin
  GetCellCoord(iRow, iCol);
  Result := SetCellValue(iRow, iCol, sValue_in);
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.SetCellValue
RETURNED.....: Boolean
PARAMETERS...: dValue_in: double

DESCRIPTION
--------------
Sets the selected cell in selected sheet at active document to the
supplied value.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function COpenOffice.SetCellValue(dValue_in: double): Boolean;
var
  iRow, iCol: Integer;
begin
  GetCellCoord(iRow, iCol);
  Result := SetCellValue(iRow, iCol, dValue_in);
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.GetCellValue
RETURNED.....: string
PARAMETERS...: iRow_in, iCol_in: Integer

DESCRIPTION
--------------
Gets the value as a string from the specified cell in selected sheet
from the active document.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
function COpenOffice.GetCellValue(iRow_in, iCol_in: Integer): string;
var
  vSheet: Variant;
  vCell: Variant;
begin
  //a cell's contents can have one of the three following types:
  //vCell.getString;  //vCell.getValue;  //vCell.getFormula
  Result:='';
  if InstanceOK(prvarDoc) then
  begin
    iRow_in:=iRow_in-1;
    iCol_in:=iCol_in-1;
    try
      vSheet := prvarDoc.CurrentController.getActiveSheet;
      vCell:=vSheet.getCellByposition(iCol_in, iRow_in); //A1
      Result := vCell.getString;
    except
      Result:='';
    end;
  end;
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.SetCellValue
RETURNED.....: Boolean
PARAMETERS...: iRow_in, iCol_in: Integer; sValue_in: string

DESCRIPTION
--------------
Sets the specified cell in selected sheet at active document to the
supplied value.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
function COpenOffice.SetCellValue(iRow_in, iCol_in: Integer; sValue_in: string): Boolean;
var
  vSheet, vCell: Variant;
begin
//vCell.setValue(23658);
//vCell.NumberFormat:=2; //23658.00
//vCell.SetString('oops');
//vCell.setFormula('=FUNCTION()');
//vCell.IsCellBackgroundTransparent := true;
//vCell.CellBackColor := RGB(255,141,56);
  Result:=false;
  if InstanceOK(prvarDoc) then
  begin
    iRow_in:=iRow_in-1;
    iCol_in:=iCol_in-1;
    try
      vSheet := prvarDoc.CurrentController.getActiveSheet;
      vCell:=vSheet.getCellByPosition(iCol_in, iRow_in);// 'A1
      Result:=vCell.setString(sValue_in);
    except
      Result:=false;
    end;
  end;
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.SetCellValue
RETURNED.....: Boolean
PARAMETERS...: iRow_in, iCol_in: Integer; dValue_in: double

DESCRIPTION
--------------
Sets the specified cell in selected sheet at active document to the
supplied value.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
function COpenOffice.SetCellValue(iRow_in, iCol_in: Integer; dValue_in: double): Boolean;
var
  vSheet, vCell: Variant;
begin
  Result:=false;
  if InstanceOK(prvarDoc) then
  begin
    iRow_in:=iRow_in-1;
    iCol_in:=iCol_in-1;
    try
      vSheet := prvarDoc.CurrentController.getActiveSheet;
      vCell:=vSheet.getCellByPosition(iCol_in, iRow_in);// 'A1
      Result:=vCell.setValue(dValue_in);
    except
      Result:=false;
    end;
  end;
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.GetCellValue
RETURNED.....: string
PARAMETERS...: sSheet_in: string

DESCRIPTION
--------------
Gets the value as a string from the selected cell in specified sheet
from the active document.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function COpenOffice.GetCellValue(sSheet_in: string): string;
var
  vSheet: Variant;
  vCell: Variant;
  iRow, iCol: Integer;
begin
  Result:='';
  if InstanceOK(prvarDoc) then
  begin
    GetCellCoord(iRow, iCol);
    try
      vSheet:=prvarDoc.Sheets.getByName(sSheet_in);
      vCell:=vSheet.getCellByposition(iCol, iRow);
      Result := vCell.getString;
    except
      Result:='';
    end;
  end;
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.SetCellValue
RETURNED.....: Boolean
PARAMETERS...: sSheet_in, sValue_in: string

DESCRIPTION
--------------
Sets the value as a string to the selected cell in specified sheet
from the active document.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function COpenOffice.SetCellValue(sSheet_in, sValue_in: string): Boolean;
var
  vSheet, vCell: Variant;
  iRow, iCol: Integer;
begin
  Result:=false;
  if InstanceOK(prvarDoc) then
  begin
    GetCellCoord(iRow, iCol);
    try
      vSheet:=prvarDoc.Sheets.getByName(sSheet_in);
      vCell:=vSheet.getCellByPosition(iCol, iRow);
      Result:=vCell.setString(sValue_in);
    except
      Result:=false;
    end;
  end;
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.SetCellValue
RETURNED.....: Boolean
PARAMETERS...: sSheet_in: string; dValue_in: double

DESCRIPTION
--------------
Sets the value as a string to the selected cell in specified sheet
from the active document.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function COpenOffice.SetCellValue(sSheet_in: string; dValue_in: double): Boolean;
var
  vSheet, vCell: Variant;
  iRow, iCol: Integer;
begin
  Result:=false;
  if InstanceOK(prvarDoc) then
  begin
    GetCellCoord(iRow, iCol);
    try
      vSheet:=prvarDoc.Sheets.getByName(sSheet_in);
      vCell:=vSheet.getCellByPosition(iCol, iRow);
      Result:=vCell.setValue(dValue_in);
    except
      Result:=false;
    end;
  end;
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.GetCellValue
RETURNED.....: string
PARAMETERS...: sSheet_in: string; iRow_in, iCol_in: Integer

DESCRIPTION
--------------
Gets the value as a string from the specified cell in specified sheet
from the active document.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function COpenOffice.GetCellValue(sSheet_in: string; iRow_in, iCol_in: Integer): string;
var
  vSheet: Variant;
  vCell: Variant;
begin
  Result:='';
  if InstanceOK(prvarDoc) then
  begin
    iRow_in:=iRow_in-1;
    iCol_in:=iCol_in-1;
    try
      vSheet:=prvarDoc.Sheets.getByName(sSheet_in);
      vCell:=vSheet.getCellByposition(iCol_in, iRow_in);
      Result := vCell.getString;
    except
      Result:='';
    end;
  end;
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.SetCellValue
RETURNED.....: Boolean
PARAMETERS...: sSheet_in: string; iRow_in, iCol_in: Integer; sValue_in: string

DESCRIPTION
--------------
Sets the value as a string to the specified cell in specified sheet
from the active document.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function COpenOffice.SetCellValue(sSheet_in: string; iRow_in, iCol_in: Integer; sValue_in: string): Boolean;
var
  vSheet, vCell: Variant;
begin
  Result:=false;
  if InstanceOK(prvarDoc) then
  begin
    iRow_in:=iRow_in-1;
    iCol_in:=iCol_in-1;
    try
      vSheet:=prvarDoc.Sheets.getByName(sSheet_in);
      vCell:=vSheet.getCellByPosition(iCol_in, iRow_in);
      Result:=vCell.setString(sValue_in);
    except
      Result:=false;
    end;
  end;
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.SetCellValue
RETURNED.....: Boolean
PARAMETERS...: sSheet_in: string; iRow_in, iCol_in: Integer; dValue_in: double

DESCRIPTION
--------------
Sets the value as a string to the specified cell in specified sheet
from the active document.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function COpenOffice.SetCellValue(sSheet_in: string; iRow_in, iCol_in: Integer; dValue_in: double): Boolean;
var
  vSheet, vCell: Variant;
begin
  Result:=false;
  if InstanceOK(prvarDoc) then
  begin
    iRow_in:=iRow_in-1;
    iCol_in:=iCol_in-1;
    try
      vSheet:=prvarDoc.Sheets.getByName(sSheet_in);
      vCell:=vSheet.getCellByPosition(iCol_in, iRow_in);
      Result:=vCell.setValue(dValue_in);
    except
      Result:=false;
    end;
  end;
end;

Function COpenOffice.ExcelSelectCell(iRow_in, iCol_in: Integer): Boolean;
begin
  Result:=false;
end;


{*-===================================================================
FUNCTION NAME: COpenOffice.GetCellCoord
RETURNED.....: TActiveCell
PARAMETERS...:

DESCRIPTION
--------------
Used to fill the property ActiveCell

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
function COpenOffice.GetCellCoord(): TActiveCell;
var
  MyActCell: TActiveCell;
begin
  GetCellCoord(MyActCell.iRow, MyActCell.iCol);
  result := MyActCell;
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.GetCellCoord
RETURNED.....: None
PARAMETERS...: var iRow_out: Integer; var iCol_out: Integer

DESCRIPTION
--------------
Gets the coordinates for the selected cell in active sheet in
active document.
NOTE! Coordinate values are increased since Open Office uses 0 as
the first column- and row index. and Excel not.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Procedure COpenOffice.GetCellCoord(var iRow_out: Integer; var iCol_out: Integer);
var
  vSheet: Variant;
  vCell: Variant;
begin
  iCol_out:=1;
  iRow_out:=1;
  if InstanceOK(prvarDoc) then
  begin
    try
      vSheet := prvarDoc.getCurrentController;
      vCell := vSheet.getSelection;
      iCol_out:=vCell.CellAddress.Column;
      iRow_out:=vCell.CellAddress.Row;
      Inc(iCol_out);
      Inc(iRow_out);
    except
      iCol_out:=1;
      iRow_out:=1;
    end;
  end;
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.GetVersion
RETURNED.....: String
PARAMETERS...: 

DESCRIPTION
--------------
Retrieves th eversion of Open Office

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function COpenOffice.GetVersion(): String;
var
   SManager, CoreRef : Variant;
   A, Args, aSettings, aConfigProvider: Variant;
begin
  try
    Args := VarArrayCreate([0,0], varVariant);
    SManager := CreateOleObject('com.sun.star.ServiceManager');
    CoreRef :=  SManager.createInstance('com.sun.star.reflection.CoreReflection');
    CoreRef.forName('com.sun.star.beans.PropertyValue').createObject(A);
    A.Name := 'nodepath';
    A.Value := '/org.openoffice.Setup/Product';
    Args[0] := A;
    aConfigProvider := SManager.createInstance('com.sun.star.configuration.ConfigurationProvider');
    aSettings := aConfigProvider.createInstanceWithArguments('com.sun.star.configuration.ConfigurationAccess', Args);
    Result := aSettings.getByName('ooSetupVersion');
  except
    Result := '';
  end;
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.FindFirst
RETURNED.....: Variant
               Use the function COpenOffic.InstanceOK to check if
               the string was found.

PARAMETERS...: sString_in: string; bWholeWord_in: Boolean; sSheet_in: string; var iRow_out: Integer; var iCol_out: Integer

DESCRIPTION
--------------
Find the first cell in specified sheet that contains sString_in.
If bWholeWord_in is True, then the cell must contain ONLY the text
as indicated.

Use the function COpenOffic.InstanceOK in order to check if the string was found.
The return value is also used in the FindNext function as a in parameter.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function COpenOffice.FindFirst(sString_in: string; bWholeWord_in: Boolean; sSheet_in: string; var iRow_out: Integer; var iCol_out: Integer): Variant;
var
  varSheet, varDescriptor, varCellFound: variant;
begin
  Result := Unassigned();
  varCellFound := Unassigned();
  varSheet := Unassigned();
  if InstanceOK(prvarDoc) then
    varSheet:=prvarDoc.Sheets.getByName(sSheet_in);
  if InstanceOK(varSheet) then
  begin
    //Create a descriptor from a searchable document.
    varDescriptor := varSheet.createSearchDescriptor;
    // Set the text for which to search and other
    // http://api.openoffice.org/docs/common/ref/com/sun/star/util/SearchDescriptor.html
    varDescriptor.SearchString := sString_in;
    // These all default to false
    // SearchWords forces the entire cell to contain only the search string
    varDescriptor.SearchWords := bWholeWord_in;
    varDescriptor.SearchCaseSensitive := False;
    varDescriptor.SearchType := 1; // Do not search formulas only search words
    // Find the first one
    varCellFound := varSheet.findFirst(varDescriptor);
    Result := varCellFound;
  end;
  if InstanceOK(varCellFound) then
  begin
    iCol_out:=varCellFound.CellAddress.Column;
    iRow_out:=varCellFound.CellAddress.Row;
    Inc(iCol_out);
    Inc(iRow_out);
  end;
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.FindFirst
RETURNED.....: Variant
PARAMETERS...: sString_in: string; bWholeWord_in: Boolean; var iRow_out: Integer; var iCol_out: Integer

DESCRIPTION
--------------
Find the first cell in active sheet that contains sString_in.
If bWholeWord_in is True, then the cell must contain ONLY the text
as indicated.

Use the function COpenOffic.InstanceOK in order to check if the string was found.
The return value is also used in the FindNext function as a in parameter.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function COpenOffice.FindFirst(sString_in: string; bWholeWord_in: Boolean; var iRow_out: Integer; var iCol_out: Integer): Variant;
var
  varSheet, varDescriptor, varCellFound: variant;
begin
  Result := Unassigned();
  varCellFound := Unassigned();
  varSheet := Unassigned();
  if InstanceOK(prvarDoc) then
    varSheet := prvarDoc.CurrentController.getActiveSheet;
  if InstanceOK(varSheet) then
  begin
    //Create a descriptor from a searchable document.
    varDescriptor := varSheet.createSearchDescriptor;
    // Set the text for which to search and other
    // http://api.openoffice.org/docs/common/ref/com/sun/star/util/SearchDescriptor.html
    varDescriptor.SearchString := sString_in;
    // These all default to false
    // SearchWords forces the entire cell to contain only the search string
    varDescriptor.SearchWords := bWholeWord_in;
    varDescriptor.SearchCaseSensitive := False;
    varDescriptor.SearchType := 1; // Do not search formulas only search words
    // Find the first one
    varCellFound := varSheet.findFirst(varDescriptor);
    Result := varCellFound;
  end;
  if InstanceOK(varCellFound) then
  begin
    iCol_out:=varCellFound.CellAddress.Column;
    iRow_out:=varCellFound.CellAddress.Row;
    Inc(iCol_out);
    Inc(iRow_out);
  end;
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.FindNext
RETURNED.....: Variant
PARAMETERS...: sString_in: string; bWholeWord_in: Boolean; sSheet_in: string; varCell_in: Variant; var iRow_out: Integer; var iCol_out: Integer

DESCRIPTION
--------------
Find the next cell in specified sheet that contains sString_in.
If bWholeWord_in is True, then the cell must contain ONLY the text
as indicated.

Use the function COpenOffic.InstanceOK in order to check if the string was found.
The return value is also used in the FindNext function as a in parameter.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function COpenOffice.FindNext(sString_in: string; bWholeWord_in: Boolean; sSheet_in: string; varCell_in: Variant; var iRow_out: Integer; var iCol_out: Integer): Variant;
var
  varSheet, varDescriptor: Variant;
begin
  iRow_out:=0;
  iCol_out:=0;
  Result := Unassigned;
  varSheet := Unassigned();
  if InstanceOK(prvarDoc) then
    varSheet:=prvarDoc.Sheets.getByName(sSheet_in);
  if InstanceOK(varSheet) then
  begin
    //Create a descriptor from a searchable document.
    varDescriptor := varSheet.createSearchDescriptor;
    // Set the text for which to search and other
    // http://api.openoffice.org/docs/common/ref/com/sun/star/util/SearchDescriptor.html
    varDescriptor.SearchString := sString_in;
    // These all default to false
    // SearchWords forces the entire cell to contain only the search string
    varDescriptor.SearchWords := bWholeWord_in;
    varDescriptor.SearchCaseSensitive := False;
    varDescriptor.SearchType := 1; // Do not search formulas only search words

    if InstanceOK(varCell_in) then
    begin
      Result := varSheet.findNext(varCell_in, varDescriptor);
      if InstanceOK(Result) then
      begin
        iCol_out:=Result.CellAddress.Column;
        iRow_out:=Result.CellAddress.Row;
        Inc(iCol_out);
        Inc(iRow_out);
      end;
    end;
  end;
end;

{*-===================================================================
FUNCTION NAME: COpenOffice.FindNext
RETURNED.....: Variant
PARAMETERS...: sString_in: string; bWholeWord_in: Boolean; varCell_in: Variant; var iRow_out: Integer; var iCol_out: Integer

DESCRIPTION
--------------
Find the next cell in active sheet that contains sString_in.
If bWholeWord_in is True, then the cell must contain ONLY the text
as indicated.

Use the function COpenOffic.InstanceOK in order to check if the string was found.
The return value is also used in the FindNext function as a in parameter.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
Function COpenOffice.FindNext(sString_in: string; bWholeWord_in: Boolean; varCell_in: Variant; var iRow_out: Integer; var iCol_out: Integer): Variant;
var
  varSheet, varDescriptor: Variant;
begin
  iRow_out:=0;
  iCol_out:=0;
  Result := Unassigned;
  varSheet := Unassigned();
  if InstanceOK(prvarDoc) then
    varSheet := prvarDoc.CurrentController.getActiveSheet;
  if InstanceOK(varSheet) then
  begin
    //Create a descriptor from a searchable document.
    varDescriptor := varSheet.createSearchDescriptor;
    // Set the text for which to search and other
    // http://api.openoffice.org/docs/common/ref/com/sun/star/util/SearchDescriptor.html
    varDescriptor.SearchString := sString_in;
    // These all default to false
    // SearchWords forces the entire cell to contain only the search string
    varDescriptor.SearchWords := bWholeWord_in;
    varDescriptor.SearchCaseSensitive := False;
    varDescriptor.SearchType := 1; // Do not search formulas only search words

    if InstanceOK(varCell_in) then
    begin
      Result := varSheet.findNext(varCell_in, varDescriptor);
      if InstanceOK(Result) then
      begin
        iCol_out:=Result.CellAddress.Column;
        iRow_out:=Result.CellAddress.Row;
        Inc(iCol_out);
        Inc(iRow_out);
      end;
    end;
  end;
end;


end.
