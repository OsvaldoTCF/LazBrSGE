program LazBrSGE;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, SysUtils, mainfrm, recibo, produtos, cadastro, // this includes the LCL widgetset
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
  Application.CreateForm(Tcad_prod, cad_prod);
  Application.CreateForm(TFrm_recibo, Frm_recibo);
  Application.Run;
end.

