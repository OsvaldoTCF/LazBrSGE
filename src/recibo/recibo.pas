unit recibo;

{$mode objfpc}{$H+}

Interface

Uses
 Forms,LCLIntf, SysUtils,LCLtype, StdCtrls,LResources,Classes,Controls, Grids,sqldb, Buttons, EditBtn, Process;

type

  PTreeData = ^TTreeData;
  TTreeData = record
    Column0: String;
    Column1: String;
    Column2: String;
  end;

      {TFrm_recibo}
  TFrm_recibo = class(TForm)
    CheckBox1: TCheckBox;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Edit1: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit19: TEdit;
    NFantasiaIDEdit: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit2: TEdit;
    PrintBtn: TSpeedButton;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    SQLQuery: TSQLQuery;
    procedure Edit13Click(Sender: TObject);
    procedure Edit13KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit17Click(Sender: TObject);
    procedure Edit17KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit18Change(Sender: TObject);
    procedure Edit19Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure RadioButton2Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure criagrid(controleDesc, controleId: TEdit;
      sql, campoID, campoDesc: string);
    procedure Seleciona(Sender: TObject; aCol, aRow: integer);
    procedure click(Sender: TObject);
    procedure bclica(Sender: TObject);
    procedure MsgError(const AClassName, AMsg: string);
  end;

var
  Frm_recibo: TFrm_recibo;
  arquivo:string;
  textoID, textodesc, idpecas, idserv: string;
  mgrid: TStringGrid;
  mbotao: TButton;
  LookupSQLQuery: TSQLQuery;
  contrDesc, contrId: TEdit;

implementation

uses
Extenso,MainFrm;

procedure TFrm_recibo.FormCreate(Sender: TObject);
Begin
dateedit1.Date:=date;
dateedit2.Date:=date;
mgrid := TStringGrid.Create(Frm_recibo);
  mbotao := TButton.Create(mgrid);
  mbotao.Hide;
  mgrid.Hide;
  LookupSQLQuery := TSQLQuery.Create(Frm_recibo);
  LookupSQLQuery.DataBase := MainForm.MainSQLConnector;
  LookupSQLQuery.Transaction := MainForm.MainSQLTransaction;
  LookupSQLQuery.PacketRecords := -1;
  SQLQuery := TSQLQuery.Create(Frm_recibo);
  SQLQuery.DataBase := MainForm.MainSQLConnector;
  SQLQuery.Transaction := MainForm.MainSQLTransaction;
  SQLQuery.PacketRecords := -1;
end;

procedure TFrm_recibo.Edit13Click(Sender: TObject);
begin
  Edit13.Clear;
  criagrid(Edit13,NFantasiaIDEdit,
    'select *  from cadastro where apelido like :parametro  order by apelido',
    'codigo', 'apelido');
end;

procedure TFrm_recibo.Edit13KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    criagrid(Edit13, NFantasiaIDEdit,
    'select *  from cadastro where (apelido like :parametro) or ' +
    '(nome like :parametro)or (cnpj like :parametro) or ' +
    '(inscricao_estadual like :parametro)or (tipo_cadastro like :parametro)' +
    'or (fax like :parametro) or (UPPER(site) like :parametro) ' +
    ' order by apelido',
    'codigo', 'apelido');
end;

procedure TFrm_recibo.Edit17Click(Sender: TObject);
begin
 Edit17.Clear;
  criagrid(Edit17,Edit19,
    'select *  from empresa where razao_social like :parametro  order by codigo',
    'codigo', 'razao_social');
end;

procedure TFrm_recibo.Edit17KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  criagrid(Edit17,Edit19,
    'select *  from empresa where razao_social like :parametro  order by codigo',
    'codigo', 'razao_social');
end;

procedure TFrm_recibo.Edit18Change(Sender: TObject);
begin
    if NFantasiaIDEdit.Text <> '' then
  begin
    MainForm.MainSQLTransaction.StartTransaction;
    try
      SQLQuery.SQL.Text := 'select * from cadastro where codigo = :pcodigo';
      SQLQuery.ParamByName('pcodigo').AsInteger :=
        StrToInt(NFantasiaIDEdit.Text);
      SQLQuery.Open;
      Edit2.Text := SQLQuery.FieldByName('nome').AsString;
      Edit4.Text :='End.:'+ SQLQuery.FieldByName('endereco').AsString+ ' ,Bairro:' +  SQLQuery.FieldByName('BAIRRO').AsString+' ,Cidade: ' +  SQLQuery.FieldByName('CIDADE').AsString+' - ' +  SQLQuery.FieldByName('UF').AsString + ' ,CEP:'+ SQLQuery.FieldByName('CEP').AsString ;
      Edit5.Text := SQLQuery.FieldByName('cnpj').AsString;
      Edit3.Text := SQLQuery.FieldByName('inscricao_estadual').AsString;
      MainForm.MainSQLTransaction.Commit;
      Edit13.Clear;
    except
      on E: Exception do
      begin
        MainForm.MainSQLTransaction.Rollback;
        MsgError(E.ClassName, E.Message);
      end;
    end;
  end;
end;

procedure TFrm_recibo.Edit19Change(Sender: TObject);
begin
    if Edit19.Text <> '' then
  begin
    MainForm.MainSQLTransaction.StartTransaction;
    try
      SQLQuery.SQL.Text := 'select * from empresa where codigo = :pcodigo';
      SQLQuery.ParamByName('pcodigo').AsInteger :=StrToInt(Edit19.Text);
      SQLQuery.Open;
      Edit16.Text := SQLQuery.FieldByName('razao_social').AsString;
      Edit14.Text := SQLQuery.FieldByName('cnpj').AsString;
      Edit15.Text := SQLQuery.FieldByName('ie').AsString;
      MainForm.MainSQLTransaction.Commit;
      Edit17.Clear;
    except
      on E: Exception do
      begin
        MainForm.MainSQLTransaction.Rollback;
        MsgError(E.ClassName, E.Message);
      end;
    end;
  end;
end;


procedure TFrm_recibo.Edit1Exit(Sender: TObject);
var
  extenso:TACBrExtenso;
begin
if (edit1.Text<>'')then
    begin
    edit1.Text:=FormatFloat('#0.00', strtofloat(edit1.Text));
    Extenso:=TACBrExtenso.Create(nil);
    Extenso.Valor:=StrToFloat(edit1.Text);
    edit12.text:=Extenso.Texto;
    Extenso.Free;
    end;
end;

procedure TFrm_recibo.FormDestroy(Sender: TObject);
begin
    DeleteFile(arquivo);
end;

procedure TFrm_recibo.PrintBtnClick(Sender: TObject);
var
Memo: TStringList;
vl_est:string;
HTML:TStringList;
texto:string;
cnpj,Vcnpj,raz_soc,ie,Vie,dateext,logo:string;
AProcess: TProcess;

begin
if RadioButton1.Checked then
    begin
    vcnpj:='CNPJ: ';
    vie:='I.E.:';
    end;
if RadioButton2.Checked then
    begin
    vcnpj:='CPF: ';
    vie:='R.G.:';
    end;
  cnpj:=Edit14.Text;
  raz_soc:=Edit16.Text;
  ie:= Edit15.Text;
  dateext:=FormatDateTime('dd " de " mmmm" de "yyyy',DateEdit1.Date) ;

  vl_est:= '          ' + Edit6.text +' '+ Edit2.text +' '+ Edit7.text +' '+Edit1.text +' ('+ edit12.text +') ' + Edit8.text + ' ' + Edit11.text + ' '+Edit9.text + ' '+ datetostr(DateEdit2.Date) +' .';
if CheckBox1.Checked then
logo := ExtractFilePath(ParamStr(0)) +'logo.jpg'
else
logo := '' ;

texto:=

//   '<?xml version="1.0" encoding="utf-8"?>' + sLineBreak +
    '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">' + sLineBreak +
    '<html xmlns="http://www.w3.org/1999/xhtml">' + sLineBreak +
    '  <head>' + sLineBreak +
    '    <title>' + 'RECIBO' + '</title>' + sLineBreak +
    ' <meta http-equiv="content-type" content="text/html; charset=UTF-8">' + LineEnding +
    '  </head>' + sLineBreak +
    '  <body leftmargin="0" topmargin="0"' + LineEnding +
    'style="color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" alink="#000000" link="#000000" marginheight="0" marginwidth="0" ' + LineEnding +
   ' vlink="#000000"> <p> </p> <table align="center" bgcolor="#ffffff" border="1" cellpadding="1" ' + LineEnding +
'cellspacing="1" width="600"> <tbody> <tr>  <td>  <div style="text-align: center;"> </div>' + LineEnding +
'<table align="center" border="1" cellpadding="0" cellspacing="0" width="600"> <tbody>  <tr> ' + LineEnding +
'<td align="left" bgcolor="#cccccc" valign="top">  <div style="text-align: center;"> </div>  <table ' + LineEnding +
'style="width: 616px; margin-left: 0px; height: 126px;" border="1" cellpadding="1" cellspacing="1"> <tbody>  <tr> ' + LineEnding +
'<td style="width: 460px; background-color: white;"  colspan="1" bgcolor="#ffffff">  <div style="text-align: center;"> ' + LineEnding +
'<div style="text-align: left;"><strong><font face="Verdana, Arial, Helvetica, sans-serif"><img style="width: 152px; height: 50px;" alt=""' + LineEnding +
'src="'+logo+'" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ' + LineEnding +
'<big><big>Recibo</big></big></font></strong><big><big><br>  </big></big></div>  <big><big><strong></strong></big></big></div>  ' + LineEnding +
'<strong><font  face="Verdana, Arial, Helvetica, sans-serif"><br>'+ raz_soc +'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + LineEnding +
'</font></strong><big style="font-weight: bold;">Via 1/2</big> <div style="text-align: left;"><big  style="font-weight: bold;"><font ' + LineEnding +
'face="Verdana, Arial, Helvetica, sans-serif" size="1"><big>'+Vcnpj+cnpj+' - '+Vie+ie+'</big></font>&nbsp;</big>&nbsp;  ' + LineEnding +
'&nbsp;&nbsp;<font face="Verdana, Arial, Helvetica, sans-serif" size="1"> </font></div>  </td>  </tr>   </tbody>   </table>    ' + LineEnding +
'</td> </tr>  </tbody>  </table>   </td>     </tr>     <tr>    <td align="left" bgcolor="#cccccc" valign="top">   ' + LineEnding +
'<div style="text-align: center;"> </div>  <table style="width: 620px; height: 274px;" border="1" ' + LineEnding +
'cellpadding="1" cellspacing="1">   <tbody>    <tr>   <td align="left" bgcolor="#ffffff" valign="top"><font ' + LineEnding +
'face="Arial, Helvetica, sans-serif" size="1"><br>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span   ' + LineEnding +
'style="font-weight: bold;">&nbsp;&nbsp;</span><big  style="font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ' + LineEnding +
 vl_est+'<br>  ' + LineEnding +
'</big></font>   <div style="text-align: left; font-weight: bold;"><font  face="Arial, Helvetica, sans-serif" size="1"><big>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + LineEnding +
'&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; '+Edit10.text+'</big></font><br>   </div>  ' + LineEnding +
'<font face="Arial, Helvetica, sans-serif" size="1"><big   style="font-weight: bold;"><br>  ' + LineEnding +
'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ' + LineEnding +
'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ' + LineEnding +
'&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  ' + LineEnding +
'&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;   ' + LineEnding +
'Linhares, '+dateext+'<br>   <br>   <br>    ' + LineEnding +
'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ' + LineEnding +
'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ' + LineEnding +
'&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ' + LineEnding +
'&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;   ' + LineEnding +
'_________________________________<br>  &nbsp;     <br>      ' + LineEnding +
'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ' + LineEnding +
'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  ' + LineEnding +
'&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; ' + LineEnding +
raz_soc+'      </big></font></td>    </tr>      </tbody>   </table> </td>' + LineEnding +
'</tr>     </tbody>    </table>  <table align="center" bgcolor="#ffffff" border="1" cellpadding="1"   cellspacing="1" width="600">' + LineEnding +
'<tbody>     <tr>   <td>     <div style="text-align: center;"> </div>   <table align="center" border="1" cellpadding="0" cellspacing="0"   width="600"> ' + LineEnding +
'<tbody>  <tr>   <td align="left" bgcolor="#cccccc" valign="top">  <div style="text-align: center;"> </div>  <table   ' + LineEnding +
'style="width: 616px; margin-left: 0px; height: 126px;" border="1"  cellpadding="1" cellspacing="1">  <tbody>  <tr> ' + LineEnding +
'<td style="width: 460px; background-color: white;"  colspan="1" bgcolor="#ffffff">   ' + LineEnding +
'<div style="text-align: center;"> <div style="text-align: left;"><strong><font   ' + LineEnding +
'face="Verdana, Arial, Helvetica, sans-serif"><img style="width: 152px; height: 50px;" alt=""  ' + LineEnding +
'src="'+logo+'" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + LineEnding +
'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  ' + LineEnding +
'<big><big>Recibo</big></big></font></strong><big><big><br> </big></big></div>     ' + LineEnding +
'<big><big><strong></strong></big></big></div> <strong><font face="Verdana, Arial, Helvetica, sans-serif"><br> ' + LineEnding +
raz_soc+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ' + LineEnding +
'</font></strong><big style="font-weight: bold;">Via 2/2</big>  <div style="text-align: left;"><big  ' + LineEnding +
'style="font-weight: bold;"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><big>CNPJ:  ' + LineEnding +
cnpj+' - I.E.:'+ie+'</big></font>&nbsp;</big>&nbsp;   ' + LineEnding +
'&nbsp;&nbsp;<font face="Verdana, Arial, Helvetica, sans-serif" size="1">    ' + LineEnding +
'</font></div> </td>  </tr> </tbody>  </table> </td>  </tr>   </tbody>  </table>   ' + LineEnding +
'</td> </tr> <tr> <td align="left" bgcolor="#cccccc" valign="top">    ' + LineEnding +
'<div style="text-align: center;"> </div> <table style="width: 619px; height: 261px;" border="1" ' + LineEnding +
'cellpadding="1" cellspacing="1">  <tbody>  <tr>   <td align="left" bgcolor="#ffffff" valign="top"><font  ' + LineEnding +
'face="Arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span  ' + LineEnding +
'style="font-weight: bold;">&nbsp;&nbsp;</span><big ' + LineEnding +
'style="font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp; <br> ' + LineEnding +
'&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;'+ vl_est+'<br>  </big></font>    ' + LineEnding +
'<div style="text-align: left; font-weight: bold;"><font    ' + LineEnding +
'face="Arial, Helvetica, sans-serif" size="1"><big>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  ' + LineEnding +
'&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;'+Edit10.text+'</big></font><br> </div> <font face="Arial, Helvetica, sans-serif" size="1"><big  ' + LineEnding +
'style="font-weight: bold;"><br>  ' + LineEnding +
'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ' + LineEnding +
'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ' + LineEnding +
'&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;   ' + LineEnding +
'&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;   ' + LineEnding +
'Linhares, '+dateext+'<br>  <br>  <br>    ' + LineEnding +
'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ' + LineEnding +
'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    ' + LineEnding +
'&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ' + LineEnding +
'&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ' + LineEnding +
'_________________________________<br>  &nbsp;  <br>  ' + LineEnding +
'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + LineEnding +
'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  ' + LineEnding +
'&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;   ' + LineEnding +
'       &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; '+raz_soc+'<br>  ' + LineEnding +
'       <br>  <br>   </big><br>   </font></td>  </tr>  </tbody>  </table> </td> </tr>  </tbody>  </table> ' + LineEnding +
 '     </body> ' + LineEnding +
 '      </html> ' + LineEnding;


 HTML:=TStringList.Create;
 HTML.Clear;
 HTML.Add( texto);
 arquivo:= ExtractFilePath(ParamStr(0)) +'recibo.html';
 HTML.SaveToFile(arquivo);
// OpenURL(arquivo);
    AProcess := TProcess.Create(nil);
   AProcess.CommandLine := 'firefox '+arquivo ;
   AProcess.Options := AProcess.Options + [poWaitOnExit];
   AProcess.Execute;
   AProcess.Free;
 HTML.Free;
 DeleteFile(arquivo);
 end;

procedure TFrm_recibo.RadioButton2Change(Sender: TObject);
begin
 if RadioButton1.Checked then
 begin
 Label10.Caption := 'CNPJ';
 Label11.Caption := 'IE';
 end;
  if RadioButton2.Checked then
 begin
 Label10.Caption := 'CPF';
 Label11.Caption := 'RG';
 end;
end;


procedure TFrm_recibo.SpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure TFrm_recibo.criagrid(controleDesc, controleId: TEdit; sql, campoID,
  campoDesc: string);
begin
   mgrid.Parent := controleDesc.Parent;
  contrId := controleId;
  contrDesc := controleDesc;
  mgrid.top := controleDesc.Top + 20;
  mgrid.Left := controleDesc.Left;
  mgrid.AnchorSideTop.Control:=controleDesc;
  mgrid.AnchorSideTop.Side :=asrRight;
  MainForm.MainSQLTransaction.StartTransaction;
  try
    LookupSQLQuery.SQL.Text := sql;
    LookupSQLQuery.ParamByName('parametro').AsString := '%' + controleDesc.Text + '%';
    LookupSQLQuery.Open;
  {  if LookupSQLQuery.IsEmpty then
    begin
      mgrid.RowCount := 1;
      ShowMessage('Erro ao carregar dados');
    end
    else }
    begin
      LookupSQLQuery.First;
      mgrid.BeginUpdate;
      try
        mgrid.Clear;
        mgrid.Options := mgrid.Options + [gorowselect];
        mgrid.FixedCols := 0;
        mgrid.FixedRows := 0;
        mgrid.ColCount := 2;
        mgrid.Height := 200;
        mgrid.ColWidths[0] := 250;
        mgrid.ColWidths[1] := 50;
        mgrid.RowCount := LookupSQLQuery.RecordCount + mgrid.FixedRows;
        while not LookupSQLQuery.EOF do
        begin
          mgrid.Cells[1, LookupSQLQuery.RecNo - 1] :=
            LookupSQLQuery.FieldByName(campoID).AsString;
          mgrid.Cells[0, LookupSQLQuery.RecNo - 1] :=
            LookupSQLQuery.FieldByName(campoDesc).AsString;
          LookupSQLQuery.Next;
        end;
      finally
        mgrid.EndUpdate;
      end;
    end;
    MainForm.MainSQLTransaction.Commit;
    mbotao.Parent := controleDesc.Parent;
    mbotao.Top := mgrid.Top + mgrid.Height;
    mbotao.Left := mgrid.Left;
    mbotao.Width := mgrid.Width;
    mbotao.AnchorSideTop.Control:=mgrid;
    mbotao.AnchorSideTop.Side := asrRight;
    mbotao.Caption := 'Cancelar';
    mbotao.OnClick := @bclica;
    mgrid.OnMouseLeave :=@bclica;
    mbotao.Visible := True;
    mgrid.OnSelection := @seleciona;
    mgrid.OnClick := @click;
  except
    on E: Exception do
    begin
      MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;
  mgrid.Show;
end;

procedure TFrm_recibo.Seleciona(Sender: TObject; aCol, aRow: integer);
begin
  textodesc := mGrid.Cells[0, aRow];
  textoID := mGrid.Cells[1, aRow];
end;

procedure TFrm_recibo.click(Sender: TObject);
begin
  mgrid.Hide;
  mbotao.Hide;
  if Assigned(contrDesc) then
    contrDesc.Text := textodesc;
  if Assigned(contrid) then
    contrid.Text := textoid;
 { begin
    MainForm.MainSQLTransaction.StartTransaction;
    try
      OrcamentoSQLQuery.SQL.Text := 'select * from cadastro where codigo = :pcodigo';
      OrcamentoSQLQuery.ParamByName('pcodigo').AsInteger :=
        StrToInt(NFantasiaIDEdit.Text);
      OrcamentoSQLQuery.Open;
      // NFantasiaEdit.Text := OrcamentoSQLQuery.FieldByName('apelido').AsString;
      EnderecoEdit.Text := OrcamentoSQLQuery.FieldByName('endereco').AsString +
        ',Nº:' + OrcamentoSQLQuery.FieldByName('numero').AsString +
        ',BAIRRO:' + OrcamentoSQLQuery.FieldByName('bairro').AsString +
        ',CEP:' + OrcamentoSQLQuery.FieldByName('cep').AsString +
        ',' + OrcamentoSQLQuery.FieldByName('cidade').AsString +
        '-' + OrcamentoSQLQuery.FieldByName('uf').AsString;
      RazaoSocialEdit.Text := OrcamentoSQLQuery.FieldByName('nome').AsString;
      TelefoneMaskEdit.Text :=
        StringReplace(OrcamentoSQLQuery.FieldByName('telefone_1').AsString,
        ' ', '', [rfReplaceAll]);
      MainForm.MainSQLTransaction.Commit;
    except
      on E: Exception do
      begin
        MainForm.MainSQLTransaction.Rollback;
        MsgError(E.ClassName, E.Message);
      end;
    end;
  end; }
end;

procedure TFrm_recibo.bclica(Sender: TObject);
begin
  mgrid.Hide;
  mbotao.Hide;
end;

procedure TFrm_recibo.MsgError(const AClassName, AMsg: string);
const
  CMsg = 'Error in class "%s": %s';
begin
  Application.MessageBox(PChar(Format(CMsg, [AClassName, AMsg])),
    PChar(Application.Title), MB_ICONERROR + MB_OK);
end;


initialization
  {$i recibo.lrs}


end.
