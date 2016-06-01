program LazBrSGE;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces,SysUtils, mainfrm, // this includes the LCL widgetset
  Forms;

{$R *.res}

begin
  Application.Title := 'LazBrSGE';
  RequireDerivedFormResource := True;
  DefaultFormatSettings.DateSeparator := '/';
  DefaultFormatSettings.DecimalSeparator := ',';
  DefaultFormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  DefaultFormatSettings.ThousandSeparator := '.';
  DefaultTextLineBreakStyle := tlbsCRLF;
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.

