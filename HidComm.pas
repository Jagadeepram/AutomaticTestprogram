unit HidComm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, JwaWinUser, AppEvnts, StrUtils;

type
  HidComObject = Class(TObject)

  function Callback_WM_INPUT(
    hRawInput : Cardinal;
    var inputstring : string) :
    Boolean;
  function SearchForDevice() :
    Boolean;
  function Send(
    txmsg : string) :
    Boolean;
    function CheckIfConnected()
  : Boolean;
  private
    _DevHIDPath   : string;
  public
    _error        : string;
    constructor Register(hWnd : Cardinal; var Result : Boolean);
  end;

implementation

constructor HidComObject.Register(hWnd : Cardinal; var Result : Boolean);
var
  rid          : RAWINPUTDEVICE;
begin
  rid.usUsagePage := $FFA0;
  rid.usUsage     := $0001;
  rid.dwFlags     := RIDEV_INPUTSINK;
  rid.hwndTarget  := hWnd;

  if (RegisterRawInputDevices(@rid,
                           1,
                           SizeOf(rid))) then
  Result := True
 else begin
   _error := 'Failed to register raw input devices!';
  Result := False;
 end;
end;

function HidComObject.Callback_WM_INPUT(
  hRawInput   : Cardinal;
  var inputstring : string) :
  Boolean;
var
    indata        : array[1..1000] of byte;
    Input         : PRAWINPUT;
    I, BufferSize : Cardinal;
begin
  Result := False;
  I := GetRawInputData( hRawInput,
                        RID_INPUT,
                        nil,
                        BufferSize,
                        SizeOf(RAWINPUTHEADER));
  if I = 0 then begin
    SetLength(inputstring, BufferSize + 1);
    I := GetRawInputData( hRawInput,
                          RID_INPUT,
                          @indata,
                          BufferSize,
                          SizeOf(RAWINPUTHEADER));
    Input := @indata;
    if  I = BufferSize then begin
       if Input.Header.dwType = RIM_TYPEHID then begin
         inputstring := '';
         I := 1;
         while ((Input.hid.bRawData[I] <> 0) And (I < Input.hid.dwSizeHid)) do begin
           inputstring := inputstring + Chr(Input.hid.bRawData[I]);
           Inc(I);
         end;
//         inputstring := inputstring + Chr(0);
         Result := True;
       end else begin
          _error := 'Raw input data not HID type.';
       end;
    end else begin
      _error := 'Failed to retrieve the raw input data.';
    end;
  end else begin
    _error := 'Failed to retrieve number of bytes for raw input.';
  end;
end;

function HidComObject.CheckIfConnected()
  : Boolean;
var
  I, nDevices, datalen, datasize : UINT;
  DeviceList: array of RAWINPUTDEVICELIST;
  DeviceListEntry: RAWINPUTDEVICELIST;
  pData : RID_DEVICE_INFO;
begin
  Result := FALSE;
  I := GetRawInputDeviceList(nil, nDevices, SizeOf(RAWINPUTDEVICELIST));
  if I <> 0 then
    _error := 'Error fetching device list'
  else begin
    SetLength(DeviceList, nDevices);
    GetRawInputDeviceList(@DeviceList[0], nDevices, SizeOf(RAWINPUTDEVICELIST));
    for I := Low(DeviceList) to High(DeviceList) do begin
      DeviceListEntry := DeviceList[I];
      datasize := SizeOf(RID_DEVICE_INFO);
      pData.cbSize := SizeOf(RID_DEVICE_INFO);
      pData.dwType := 2;
      GetRawInputDeviceInfo(DeviceListEntry.hDevice,
                            RIDI_DEVICEINFO,
                            @pData,
                            datasize);

        //Only establish connection with µX
      if (pData.hid.dwVendorId = $16C0) and (pData.hid.dwProductId = $0674) Then begin
          _error := 'Cobia found';
          Result := TRUE;
      end;
    end;
  end;
end;

function HidComObject.SearchForDevice()
  : Boolean;
var
  I, nDevices, datalen, datasize : UINT;
  DeviceList: array of RAWINPUTDEVICELIST;
  DeviceListEntry: RAWINPUTDEVICELIST;
  pData : RID_DEVICE_INFO;
begin
  Result := FALSE;
  I := GetRawInputDeviceList(nil, nDevices, SizeOf(RAWINPUTDEVICELIST));
  if I <> 0 then
    _error := 'Error fetching device list'
  else begin
    SetLength(DeviceList, nDevices);
    GetRawInputDeviceList(@DeviceList[0], nDevices, SizeOf(RAWINPUTDEVICELIST));
    for I := Low(DeviceList) to High(DeviceList) do begin
      DeviceListEntry := DeviceList[I];
      datasize := SizeOf(RID_DEVICE_INFO);
      pData.cbSize := SizeOf(RID_DEVICE_INFO);
      pData.dwType := 2;
      GetRawInputDeviceInfo(DeviceListEntry.hDevice,
                            RIDI_DEVICEINFO,
                            @pData,
                            datasize);

      //Only establish connection with µX
      if (pData.hid.dwVendorId = $16C0) and (pData.hid.dwProductId = $0674) Then begin
        //if pData.hid.dwProductId = $0672 Then begin
        //  _error := 'Barracuda found';
        //end else if pData.hid.dwProductId = $0673 Then begin
        //  _error := 'Piranha found';
        //end else if pData.hid.dwProductId = $0674 Then begin
          _error := 'Cobia found';
        //end else begin
        //  _error := 'Unknown RTI device found';
        //end;
        datasize := 0;
        datalen := GetRawInputDeviceInfo( DeviceListEntry.hDevice,
                                          RIDI_DEVICENAME,
                                          nil,
                                          datasize);
        if datalen = 0 then begin
          if datasize > 10 then begin
            Result := TRUE;
            SetLength(_DevHIDPath, datasize);
            datalen := GetRawInputDeviceInfo( DeviceListEntry.hDevice,
                                              RIDI_DEVICENAME,
                                              @_DevHIDPath[1],
                                              datasize);
            _DevHIDPath[2] := '\';

          end;
        end;
      end;
    end;
  end;
  if Result = FALSE Then
    _error := 'Device disconnected'
end;

function HidComObject.Send(txmsg : string) : Boolean;
var
  byteswritten : Cardinal;
  I, len : UINT;
  buffer : array[1..66] of Byte;
  device : HWND;
begin
  buffer[1] := 0;
  buffer[2] := $FF;
  len := Length(txmsg);
  I := 0;
  while (I<63) do begin
    if (I<len) then begin
      buffer[I + 3] := Ord(txmsg[I+1]);
    end else if (I = len) then begin
      buffer[I + 3] := $0D;
    end else begin
      buffer[I + 3] := 0;
    end;
    Inc(I);
  end;

  device := CreateFile( @_DevHIDPath[1],
                          GENERIC_READ Or GENERIC_WRITE,
                          FILE_SHARE_READ Or FILE_SHARE_WRITE,
                  				nil,
                  				OPEN_EXISTING,
        		  		        0,
                  				0);
  if (device = INVALID_HANDLE_VALUE) then begin
    Result := FALSE;
    _error := 'Invalid write handle to device.';
  end else begin
    Result := WriteFile(
          device,
          buffer,
          65,
          byteswritten,
          nil);
    if (Result = FALSE) then
      _error := 'Error writing to device.'
  end;
  CloseHandle(device);
end;

end.
