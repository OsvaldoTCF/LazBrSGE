unit mainfrm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, StdCtrls, ExtCtrls, Buttons,fileutil,
  ComCtrls, Menus, sqldb, Dialogs,LCLType, inifiles, PQConnection;

type

  { TMainForm }

  TMainForm = class(TForm)
    Button1: TButton;
    MainSQLConnector: TSQLConnector;
    MainSQLTransaction: TSQLTransaction;
    MainPagecontrol: TPageControl;
    MenuImageList: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MainPagecontrolCloseTabClicked(Sender: TObject);
  public
    procedure CreatePageForm(const AFormClass: TFormClass;
      var APageControl: TPageControl; const ACaption: TCaption = '';
      const AIndex: integer = 9999);
    function PageFormExists(const APageName: TComponentName;
      var APageControl: TPageControl): boolean;
    procedure ClosePageForm(const APageName: TComponentName;
      var APageControl: TPageControl);
    const   Usuario:string = 'postgres';
    const   Senha:string = 'senha';
  end;

var
  MainForm: TMainForm;
  VPage: TTabSheet;
  VForm: TForm;
  IndiceImagem: integer;


implementation

{$R *.lfm}
uses
   cadastro,pag_rec{, orcamentos, defeitos, boleto, recibo,consultas_ol,
  produtos, es_nf, sendmail, loja, outros,nfe};

{ TMainForm }

procedure TMainForm.FormCreate(Sender: TObject);
var
  sServidor, ArquivoIni, sBase, sconector,s: string;
  ArqIni: TIniFile;
begin
  ArquivoIni := ExtractFilePath(ParamStr(0)) + 'config.ini';
  ArqIni := TIniFile.Create(ArquivoIni);
  sServidor := ArqIni.ReadString('DataBase', 'servidor', '');
  sbase := ArqIni.ReadString('DataBase', 'base', '');
  sconector := ArqIni.ReadString('DataBase', 'conector', '');
  MainSQLConnector.Close;
  MainSQLConnector.ConnectorType := sconector;
  MainSQLConnector.DatabaseName := sbase;
  MainSQLConnector.HostName := sServidor;
  MainSQLConnector.UserName := usuario;
  // if (sServidor = '192.168.1.2') then
  MainSQLConnector.Password := senha;
  // else
  //   MainSQLConnector.Password := 'postgres';
  MainSQLConnector.Open;
  MainSQLTransaction.DataBase := MainSQLConnector;
  ArqIni.Free;



end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin

   if MessageDlg('Pergunta', 'Apagar arquivos pasta temp?', mtConfirmation,
   [mbYes, mbNo],0) = mrYes
  then
  DeleteDirectory(ExtractFilePath(Application.ExeName) + '/temp',true); // somente conteudo


end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  // CreatePageForm(TForm_boletos, MainPagecontrol,'',1);
  CreatePageForm(Tfrm_cadastro, MainPagecontrol,'',0);
  CreatePageForm(TContasPagRecForm, MainPagecontrol,'',8);
 // CreatePageForm(TConsultasOlFrm, MainPagecontrol,'',9);
 // CreatePageForm(TTF_ES_NF, MainPagecontrol,'',5);
 // CreatePageForm(Tcad_prod, MainPagecontrol,'',4);
//  CreatePageForm(TFrmdefeitos, MainPagecontrol,'',3);
 // CreatePageForm(TOrcamentosForm, MainPagecontrol,'',6);

end;

procedure TMainForm.MainPagecontrolCloseTabClicked(Sender: TObject);
begin
  ClosePageForm(TPage(Sender).Caption, MainPagecontrol);
end;


procedure TMainForm.CreatePageForm(const AFormClass: TFormClass;
  var APageControl: TPageControl; const ACaption: TCaption = '';
  const AIndex: integer = 9999);

begin
  VPage := TTabSheet.Create(APageControl);
  VForm := AFormClass.Create(VPage);
  if not PageFormExists(VForm.Caption, APageControl) then
  begin
    if ACaption = EmptyStr then
      VPage.Caption := VForm.Caption
    else
      VPage.Caption := ACaption;
    if( AIndex<>9999) then
    VPage.ImageIndex := AIndex;
    VPage.Parent := APageControl;
    VForm.Align := alClient;
    VForm.BorderStyle := bsNone;
    VForm.WindowState := wsMaximized;
    VForm.Parent := VPage;
    VForm.Show;
    APageControl.PageIndex := VPage.PageIndex;
  end
  else
  begin
    VForm.Free;
    VPage.Free;
  end;
end;

function TMainForm.PageFormExists(const APageName: TComponentName;
  var APageControl: TPageControl): boolean;
var
  I: integer;
begin
  Result := False;
  for I := 0 to Pred(APageControl.PageCount) do
  begin
    if APageControl.Page[I].Caption = APageName then
    begin
      Result := True;
      APageControl.TabIndex := i;
      Break;
    end;
  end;
end;

procedure TMainForm.ClosePageForm(const APageName: TComponentName;
  var APageControl: TPageControl);
var
  I: integer;
begin
  for I := 0 to Pred(APageControl.PageCount) do
  begin
    if APageControl.Page[I].Caption = APageName then
    begin
      APageControl.Page[I].Free;
      Break;
    end;
  end;
end;

//initialization
// {$I mainfrm.lrs}

end.
