unit ElectroMeterCal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TElectroMeterCalibration = class(TForm)
    ElectroMeterEdit: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ElectroMeterCalibration: TElectroMeterCalibration;

implementation

{$R *.dfm}

end.
