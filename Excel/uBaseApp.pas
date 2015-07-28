{*===================== Delphi Unit Header v1 =======================
COPYRIGHT....: © RTI Electronics AB, 2005
FILENAME.....: uBaseApp
CREATED/SIGN.: 2005-08-19/DA
COMPILER/ENV.: D2005

DESCRIPTION
--------------
Base class containing virtal method and functions making it possible
to declare a BaseApp variable and still be working with specific
Open office or Excel functions.
==================================================================|*}
unit uBaseApp;

interface
uses
Classes, SysUtils;

const
  csInvalidCoordinate='Invalid coordinate';
  ciMaxExcelColumns=256;
  ciLastExcelRow=65535;
  csLastExcelColumn='IV';


type TActiveCell = record
    iRow: Integer;
    iCol: Integer;
  end;

type
  CBaseApp = class(TObject)
  private
  protected
    prbCloseAppWhenDestry: Boolean;
    prvarApp: Variant;
    prvarDoc: Variant;
    sApp: string;
    function CoorToStrCoor(iCol_in,iRow_in:integer):string; virtual;
    procedure StrCoorToCoor(sCoor_in: string; var iCol_out,iRow_out: integer); virtual;



    procedure ShowBasicVariantType(varVar: Variant);

    function GetCellCoord(): TActiveCell;  overload; virtual; abstract;
    Procedure GetCellCoord(var iRow_out: Integer; var iCol_out: Integer);  overload; virtual; abstract;
  public
    constructor Create();
    destructor Destroy(); override;

    property ActiveCell: TActiveCell read GetCellCoord;
    property CloseAppWhenDestroy: Boolean read prbCloseAppWhenDestry write prbCloseAppWhenDestry;

    function InstanceOK(varInstance_in: Variant): Boolean;

    function CheckIfAccessable(): Boolean; virtual; abstract;

    function GetVersion(): string; virtual; abstract;
    procedure CreateApp(bVisible_in: Boolean); virtual; abstract;
    procedure CloseApp(bDispAlert_in: Boolean); virtual; abstract;
    procedure CreateDoc(sName_in: string); virtual; abstract;
    procedure NewFile(); virtual; abstract;
    procedure OpenFile(sFileName_in: string); virtual; abstract;
    function SaveFile(sFileName_in: string): Boolean; virtual; abstract;

    Function GetCellValue(): string; overload; virtual; abstract;
    Function GetCellValue(iRow_in, iCol_in: Integer): string; overload; virtual; abstract;
    Function GetCellValue(sSheet_in: string): string; overload; virtual; abstract;
    Function GetCellValue(sSheet_in: string; iRow_in, iCol_in: Integer): string; overload; virtual; abstract;

    //As string
    Function SetCellValue(Value: string): Boolean; overload; virtual; abstract;
    Function SetCellValue(iRow_in, iCol_in: Integer; Value: string): Boolean; overload; virtual; abstract;
    Function SetCellValue(sSheet_in, Value: string): Boolean; overload; virtual; abstract;
    Function SetCellValue(sSheet_in: string; iRow_in, iCol_in: Integer; Value: string): Boolean; overload; virtual; abstract;
    //As number
    Function SetCellValue(dValue_in: double): Boolean; overload; virtual; abstract;
    Function SetCellValue(iRow_in, iCol_in: Integer; dValue_in: double): Boolean; overload; virtual; abstract;
    Function SetCellValue(sSheet_in: string; dValue_in: double): Boolean; overload; virtual; abstract;
    Function SetCellValue(sSheet_in: string; iRow_in, iCol_in: Integer; dValue_in: double): Boolean; overload; virtual; abstract;

    Function FindFirst(sString_in: string; bWholeWord_in: Boolean; sSheet_in: string; var iRow_out: Integer; var iCol_out: Integer): Variant;  overload; virtual; abstract;
    Function FindNext(sString_in: string; bWholeWord_in: Boolean; sSheet_in: string; varCell_in: Variant; var iRow_out: Integer; var iCol_out: Integer): Variant;  overload; virtual; abstract;
    Function FindFirst(sString_in: string; bWholeWord_in: Boolean; var iRow_out: Integer; var iCol_out: Integer): Variant; overload; virtual; abstract;
    Function FindNext(sString_in: string; bWholeWord_in: Boolean; varCell_in: Variant; var iRow_out: Integer; var iCol_out: Integer): Variant; overload; virtual; abstract;

    Function ExcelSelectCell(iRow_in, iCol_in: Integer): Boolean; virtual; abstract;
  end;


implementation
uses
Dialogs, Variants;

constructor CBaseApp.Create();
begin
  inherited Create();
  prvarApp := Unassigned();
  prvarDoc := Unassigned();
  prbCloseAppWhenDestry:=false;
end;

destructor CBaseApp.Destroy();
begin
  inherited Destroy();
end;

{*-===================================================================
FUNCTION NAME: CBaseApp.CoorToStrCoor
RETURNED.....: string
PARAMETERS...: iCol_in,iRow_in:integer

DESCRIPTION
--------------
Converts coordinates supplied into a string
Ex. CoorToStr(1,1) returns 'A1'
    CoorToStr(3,7) returns 'C7'

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
function CBaseApp.CoorToStrCoor(iCol_in,iRow_in:integer):string;

  function Conv(i:integer):string;
  begin
    if i<26 then
      result:=Char(Ord('A')+i)
      else
      result:=Char(Ord('@')+(i Div 26))+Char(Ord('A')+(i MOD 26));
  end;

begin
  if (iCol_in<1) or (iRow_in<1) then
    Result:='A1';

  Result:=Conv(iCol_in-1)+IntToStr(iRow_in);
end;

{*-===================================================================
FUNCTION NAME: CBaseApp.StrCoorToCoor
RETURNED.....: None
PARAMETERS...: sCoor_in: string; var iCol_out,iRow_out: integer

DESCRIPTION
--------------
Converts a string coordinate into a column value and a row value
Ex. StrCoorToCoor('A1', iCol, iRow); iCol=1, iRow=1
    StrCoorToCoor('C7', iCol, iRow); iCol=3, iRow=7

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
procedure CBaseApp.StrCoorToCoor(sCoor_in: string; var iCol_out,iRow_out: integer);

  function AlphaConv(c:Char):integer;
  begin
    if not (c in ['A'..'Z']) then
      Result:=1;

    Result:=Ord(c)-Ord('A');
  end;

var
  iDiv,i:integer;
  s:string;
begin
  if sCoor_in='' then
    sCoor_in:='A1';

  iDiv:=0;
  for i:=1 to Length(sCoor_in) do
    if sCoor_in[i] in ['0'..'9'] then
      begin
        iDiv:=i;
        break;
      end;

  if (Length(sCoor_in)=1) or (iDiv<2) then
    MessageDlg(csInvalidCoordinate, mtError, [mbOK], 0);

  s:=sCoor_in;
  Delete(s,1,iDiv-1);
  iRow_out:=StrToInt(s)-1;

  if (iRow_out<0) or (iRow_out>ciLastExcelRow) then
    MessageDlg(csInvalidCoordinate, mtError, [mbOK], 0);

  s:=UpperCase(sCoor_in);
  Delete(s,iDiv,255);

  if (Length(s)=2) and (s>csLastExcelColumn) then
    MessageDlg(csInvalidCoordinate, mtError, [mbOK], 0);

  if Length(s)=1 then
    iCol_out:=AlphaConv(s[1])
  else
  begin
    if Length(s)=2 then
      iCol_out:=(AlphaConv(s[1])+1)*26 + AlphaConv(s[2])
    else
      MessageDlg(csInvalidCoordinate, mtError, [mbOK], 0);
  end;

  inc(iCol_out);
  inc(iRow_out);
end;

{*-===================================================================
FUNCTION NAME: CBaseApp.InstanceOK
RETURNED.....: Boolean
PARAMETERS...: varInstance_in: Variant

DESCRIPTION
--------------
Checks whether an instance is OK to use or not

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
function CBaseApp.InstanceOK(varInstance_in: Variant): Boolean;
begin
  //ShowBasicVariantType(varInstance_in);
  Result := not VarIsEmpty(varInstance_in);
  if Result = true then
    Result := not VarIsNull(varInstance_in);
  if Result = true then
    Result := not VarIsClear(varInstance_in);
end;

{*-===================================================================
FUNCTION NAME: CBaseApp.ShowBasicVariantType
RETURNED.....: None
PARAMETERS...: varVar: Variant

DESCRIPTION
--------------
Shows the type of a variant.
NOTE! This is only intended to be used when debuggin or developing a
program, this is why it pops up a dialog window.

HISTORY
--------------
2005-08-19/DA
- Created
===============================================================DRH2-*}
procedure CBaseApp.ShowBasicVariantType(varVar: Variant);
var
  typeString : string;
  basicType  : Integer;
begin
  // Get the Variant basic type :
  // this means excluding array or indirection modifiers
  basicType := VarType(varVar) and VarTypeMask;

  // Set a string to match the type
  case basicType of
    varEmpty     : typeString := 'varEmpty';
    varNull      : typeString := 'varNull';
    varSmallInt  : typeString := 'varSmallInt';
    varInteger   : typeString := 'varInteger';
    varSingle    : typeString := 'varSingle';
    varDouble    : typeString := 'varDouble';
    varCurrency  : typeString := 'varCurrency';
    varDate      : typeString := 'varDate';
    varOleStr    : typeString := 'varOleStr';
    varDispatch  : typeString := 'varDispatch';
    varError     : typeString := 'varError';
    varBoolean   : typeString := 'varBoolean';
    varVariant   : typeString := 'varVariant';
    varUnknown   : typeString := 'varUnknown';
    varByte      : typeString := 'varByte';
    varWord      : typeString := 'varWord';
    varLongWord  : typeString := 'varLongWord';
    varInt64     : typeString := 'varInt64';
    varStrArg    : typeString := 'varStrArg';
    varString    : typeString := 'varString';
    varAny       : typeString := 'varAny';
    varTypeMask  : typeString := 'varTypeMask';
  end;

  // Show the Variant type
  MessageDlg('Variant type  = '+typeString, mtInformation, [mbOK], 0);
end;


end.
