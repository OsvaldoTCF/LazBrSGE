
unit cadastro;

{$mode objfpc}{$H+}

interface

uses
  LCLIntf, LCLType, LResources, Dialogs, StrUtils, Grids, sqldb, StdCtrls,
  Buttons, ExtCtrls, Process, Forms, SysUtils, Graphics,Clipbrd,
  MaskEdit, EditBtn, Classes, Controls;

type
  { Tfrm_cadastro }
  Tfrm_cadastro = class(TForm)
    BloqueadoCheckBox: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    CNPJMaskEdit: TMaskEdit;
    BairroEdit: TEdit;
    CidadeEdit: TEdit;
    ContatoEdit1: TEdit;
    ContatosStringGrid: TStringGrid;
    Edit1: TEdit;
    MaskEdit1: TEdit;
    Email1Edit: TEdit;
    TabelaComboBox: TComboBox;
    ComplementoEdit: TEdit;
    CaixaPostalEdit: TEdit;
    CadastroDateEdit: TDateEdit;
    CepMaskedit: TMaskEdit;
    SiteEdit: TEdit;
    FaxEdit: TEdit;
    UFEdit: TEdit;
    NumeroEdit: TEdit;
    EnderecoEdit: TEdit;
    SexoComboBox: TComboBox;
    IeEdit: TEdit;
    TipoComboBox: TComboBox;
    PessoaComboBox: TComboBox;
    CodigoEdit: TEdit;
    NFantasiaEdit: TEdit;
    NomeEdit: TEdit;
    Label1: TLabel;
    ObservacaoMemo: TMemo;
    Panel3: TPanel;
    Label3: TLabel;
    Label32: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    CnpjLabel: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    Panel1: TPanel;
    Label8: TLabel;
    Label10: TLabel;
    CadastroSQLQuery: TSQLQuery;
    SearchEdit: TEdit;
    QueryStringGrid: TStringGrid;
    Label11: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label27: TLabel;
    Label39: TLabel;
    Label30: TLabel;
    SpeedButton15: TSpeedButton;
    Label33: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    procedure BairroEditExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure CidadeEditExit(Sender: TObject);
    procedure CidadeEditKeyPress(Sender: TObject; var Key: char);
    procedure CNPJMaskEditExit(Sender: TObject);
    procedure CodigoEditChange(Sender: TObject);
    procedure ContatosStringGridDblClick(Sender: TObject);
    procedure ContatosStringGridSelectCell(Sender: TObject;
      aCol, aRow: integer; var CanSelect: boolean);
    procedure Edit1Change(Sender: TObject);
    procedure EnderecoEditExit(Sender: TObject);
    procedure NFantasiaEditExit(Sender: TObject);
    procedure NomeEditExit(Sender: TObject);
    procedure NomeEditKeyPress(Sender: TObject; var Key: char);
    procedure PessoaComboBoxChange(Sender: TObject);
    procedure PessoaComboBoxSelect(Sender: TObject);
    procedure QueryStringGridDblClick(Sender: TObject);
    procedure QueryStringGridSelection(Sender: TObject; aCol, aRow: integer);
    procedure SearchEditChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure UFEditKeyPress(Sender: TObject; var Key: char);
  private
    { Private declarations }
  public
    function vercpf(snrcpf: string): boolean;
    function VerCnpj(snrcnpj: string): boolean;
    procedure limpar;
    procedure atualiza;
    procedure search;
    procedure MsgError(const AClassName, AMsg: string);
    procedure cadbtnmodifica;
    procedure criagrid(controleDesc: TEdit; sql, campoID, campoDesc: string);
    procedure Seleciona(Sender: TObject; aCol, aRow: integer);
    procedure click(Sender: TObject);
    procedure bclica(Sender: TObject);
    procedure atualizacontatos;
  end;

var
  frm_cadastro: Tfrm_cadastro;
  textoID: string;
  mgrid: TStringGrid;
  mbotao: TButton;
  LookupSQLQuery: TSQLQuery;
  contrDesc, contrId: TEdit;
  linha: integer;
  CEPTmpFile: TFileName;




const
  Accents: array [0..48] of string = ('à', 'á', 'â', 'ã', 'ä', 'è', 'é',
    'ê', 'ë', 'ì', 'í', 'î', 'ï', 'ò', 'ó', 'ô', 'õ', 'ö', 'ù', 'ú', 'û', 'ü',
    'À', 'Á', 'Â', 'Ã', 'Ä', 'È', 'É', 'Ê', 'Ë', 'Ì', 'Í', 'Î', 'Ò', 'Ó', 'Ô',
    'Õ', 'Ö', 'Ù', 'Ú', 'Û', 'Ü', 'ç', 'Ç', 'ñ', 'Ñ', 'º', 'ª');
  NoAccents: array [0..48] of string = ('a', 'a', 'a', 'a', 'a', 'e', 'e',
    'e', 'e', 'i', 'i', 'i', 'i', 'o', 'o', 'o', 'o', 'o', 'u', 'u', 'u', 'u',
    'A', 'A', 'A', 'A', 'A', 'E', 'E', 'E', 'E', 'I', 'I', 'I', 'O', 'O', 'O',
    'O', 'O', 'U', 'U', 'U', 'U', 'c', 'C', 'n', 'N', ' ', ' ');




implementation

  {$R *.lfm}
uses
  mainfrm, HTTPSend,synacode;
//DisableDefaultDialogError;


procedure Tfrm_cadastro.SearchEditChange(Sender: TObject);
begin
  search;
end;

procedure Tfrm_cadastro.QueryStringGridSelection(Sender: TObject; aCol, aRow: integer);
begin
  Limpar;
  textoID := QueryStringGrid.Cells[1, aRow];
  //QueryStringGridDblClick(sender);
end;

procedure Tfrm_cadastro.QueryStringGridDblClick(Sender: TObject);
begin
  CodigoEdit.Text := textoID;
  MainForm.MainSQLTransaction.StartTransaction;
  try
    CadastroSQLQuery.SQL.Text := 'select * from cadastro where codigo = :pcodigo';
    CadastroSQLQuery.ParamByName('pcodigo').AsInteger := StrToInt(CodigoEdit.Text);
    CadastroSQLQuery.Open;
    CadastroDateEdit.Date := CadastroSQLQuery.FieldByName('data_cadast').AsDateTime;
    ;
    NomeEdit.Text := CadastroSQLQuery.FieldByName('nome').AsString;
    NFantasiaEdit.Text := CadastroSQLQuery.FieldByName('apelido').AsString;
    if CadastroSQLQuery.FieldByName('tipo_pessoa').AsString = 'J' then
      PessoaComboBox.ItemIndex := 0;
    if CadastroSQLQuery.FieldByName('tipo_pessoa').AsString = 'F' then
      PessoaComboBox.ItemIndex := 1;
    if (PessoaComboBox.Text = 'F') then
      CNPJMaskEdit.EditMask := '999\.999\.999\-99;1;_';
    if (PessoaComboBox.Text = 'J') then
      CNPJMaskEdit.EditMask := '99\.999\.999\/9999\-99;1;_';
    if CadastroSQLQuery.FieldByName('tipo_cadastro').AsString = 'CLIENTE' then
      TipoComboBox.ItemIndex := 0;
    if CadastroSQLQuery.FieldByName('tipo_cadastro').AsString = 'FORNECEDOR' then
      TipoComboBox.ItemIndex := 1;
    if CadastroSQLQuery.FieldByName('tipo_cadastro').AsString = 'AGENDA' then
      TipoComboBox.ItemIndex := 2;
    if CadastroSQLQuery.FieldByName('tipo_cadastro').AsString = 'TRANSPORTADORA' then
      TipoComboBox.ItemIndex := 3;
    if CadastroSQLQuery.FieldByName('tipo_cadastro').AsString = 'REPRESENTANTE' then
      TipoComboBox.ItemIndex := 4;
    if CadastroSQLQuery.FieldByName('tipo_cadastro').AsString = 'FABRICANTE' then
      TipoComboBox.ItemIndex := 5;
    if CadastroSQLQuery.FieldByName('tipo_cadastro').AsString = 'OUTROS' then
      TipoComboBox.ItemIndex := 6;
    CNPJMaskEdit.Text := CadastroSQLQuery.FieldByName('cnpj').AsString;
    IeEdit.Text := CadastroSQLQuery.FieldByName('inscricao_estadual').AsString;
    if CadastroSQLQuery.FieldByName('sexo').AsString = 'M' then
      SexoComboBox.ItemIndex := 0;
    if CadastroSQLQuery.FieldByName('sexo').AsString = 'F' then
      SexoComboBox.ItemIndex := 1;
    if CadastroSQLQuery.FieldByName('cli_bloqueado').AsString = 'NAO' then
      BloqueadoCheckBox.Checked := False;
    if CadastroSQLQuery.FieldByName('cli_bloqueado').AsString = 'SIM' then
      BloqueadoCheckBox.Checked := True;
    EnderecoEdit.Text := CadastroSQLQuery.FieldByName('endereco').AsString;
    NumeroEdit.Text := CadastroSQLQuery.FieldByName('numero').AsString;
    BairroEdit.Text := CadastroSQLQuery.FieldByName('bairro').AsString;
    ComplementoEdit.Text := CadastroSQLQuery.FieldByName('complemento').AsString;
    UFEdit.Text := CadastroSQLQuery.FieldByName('uf').AsString;
    CidadeEdit.Text := CadastroSQLQuery.FieldByName('cidade').AsString;
    CepMaskedit.Text := CadastroSQLQuery.FieldByName('cep').AsString;
    CaixaPostalEdit.Text := CadastroSQLQuery.FieldByName('cx_postal').AsString;
    ObservacaoMemo.Text := CadastroSQLQuery.FieldByName('observacao').AsString;
    ;
    FaxEdit.Text := CadastroSQLQuery.FieldByName('fax').AsString;
    SiteEdit.Text := CadastroSQLQuery.FieldByName('site').AsString;
    TabelaComboBox.Text := CadastroSQLQuery.FieldByName('tabela').AsString;
    ContatosStringGrid.FixedCols := 0;
    ContatosStringGrid.FixedRows := 1;
    ContatosStringGrid.ColCount := 4;
    ContatosStringGrid.RowCount := 1;
    ContatosStringGrid.ColWidths[0] := 0;
    ContatosStringGrid.ColWidths[1] := 120;
    ContatosStringGrid.ColWidths[2] := 300;
    ContatosStringGrid.ColWidths[3] := 300;
    ContatosStringGrid.Cols[0].Text := 'ID';
    ContatosStringGrid.Cols[1].Text := 'Telefone';
    ContatosStringGrid.Cols[2].Text := 'email';
    ContatosStringGrid.Cols[3].Text := 'Pessoa de Contato';
    CadastroSQLQuery.Close;
    CadastroSQLQuery.SQL.Text :=
      'select * from cadastro_contatos where tcadastroid = :ptcadastroid order by contato asc';
    CadastroSQLQuery.ParamByName('ptcadastroid').AsInteger := StrToInt(CodigoEdit.Text);
    CadastroSQLQuery.Open;
    CadastroSQLQuery.First;
    ContatosStringGrid.BeginUpdate;
    try
      ContatosStringGrid.RowCount :=
        CadastroSQLQuery.RecordCount + ContatosStringGrid.FixedRows + 2;
      while not CadastroSQLQuery.EOF do
      begin
        ContatosStringGrid.Cells[0, CadastroSQLQuery.RecNo] :=
          IntToStr(CadastroSQLQuery.FieldByName('id').AsInteger);
        ContatosStringGrid.Cells[1, CadastroSQLQuery.RecNo] :=
          CadastroSQLQuery.FieldByName('telefone').AsString;
        ContatosStringGrid.Cells[2, CadastroSQLQuery.RecNo] :=
          CadastroSQLQuery.FieldByName('email').AsString;
        ContatosStringGrid.Cells[3, CadastroSQLQuery.RecNo] :=
          CadastroSQLQuery.FieldByName('contato').AsString;
        CadastroSQLQuery.Next;
      end;
    finally
      ContatosStringGrid.EndUpdate;
    end;
    MainForm.MainSQLTransaction.Commit;
  except
    on E: Exception do
    begin
      MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;
  atualiza;
end;

procedure Tfrm_cadastro.BitBtn5Click(Sender: TObject);
begin
  limpar;
end;

procedure Tfrm_cadastro.Button1Click(Sender: TObject);
var
  F: TextFile;
begin
  AssignFile(f, ExtractFilePath(ParamStr(0)) + 'temp.txt');
  Rewrite(f); //abre o arquivo para escrita
  Writeln(f, 'Destinatario:' + NomeEdit.Text); //escreve no arquivo e desce uma linha
  Writeln(f, 'Endereço:' + EnderecoEdit.Text + ',Nº: ' + NumeroEdit.Text +
    ', Bairro : ' + BairroEdit.Text);
  Writeln(f, 'CEP:' + CepMaskedit.Text + '         ' + CidadeEdit.Text +
    ' - ' + UFEdit.Text);
  if ComplementoEdit.Text <> '' then
    Writeln(f, 'Complemento:' + ComplementoEdit.Text);
  if CaixaPostalEdit.Text <> '' then
    Writeln(f, 'Caixa Postal:' + CaixaPostalEdit.Text);
  Closefile(f); //fecha o handle de arquivo
  opendocument(ExtractFilePath(ParamStr(0)) + 'temp.txt');
  sleep(1000);
  deletefile(ExtractFilePath(ParamStr(0)) + 'temp.txt');
end;

procedure Tfrm_cadastro.Button2Click(Sender: TObject);
begin
  if (Edit1.Text = '') then
  begin
    MainForm.MainSQLTransaction.StartTransaction;
    try
      CadastroSQLQuery.SQL.Text :=
        'insert into cadastro_contatos(tcadastroid,email,telefone,contato)' +
        ' values(:ptcadastroid,:pemail,:ptelefone,:pcontato)';
      CadastroSQLQuery.ParamByName('ptcadastroid').AsInteger :=
        StrToInt(CodigoEdit.Text);
      CadastroSQLQuery.ParamByName('pemail').AsString := Email1Edit.Text;
      CadastroSQLQuery.ParamByName('ptelefone').AsString := MaskEdit1.Text;
      CadastroSQLQuery.ParamByName('pcontato').AsString := ContatoEdit1.Text;
      CadastroSQLQuery.ExecSQL;
      MainForm.MainSQLTransaction.Commit;
      MaskEdit1.Text := '';
      Email1Edit.Text := '';
      ContatoEdit1.Text := '';
      Edit1.Text := '';
      QueryStringGridDblClick(Sender);
    except
      on E: Exception do
      begin
        MainForm.MainSQLTransaction.Rollback;
        MsgError(E.ClassName, E.Message);
      end;
    end;
  end
  else
  begin
    MainForm.MainSQLTransaction.StartTransaction;
    try
      CadastroSQLQuery.SQL.Text :=
        'update cadastro_contatos set tcadastroid =:ptcadastroid,email =:pemail,telefone'
        +
        ' =:ptelefone,contato=:pcontato where id = :pid';
      CadastroSQLQuery.ParamByName('ptcadastroid').AsInteger :=
        StrToInt(CodigoEdit.Text);
      CadastroSQLQuery.ParamByName('pemail').AsString := Email1Edit.Text;
      CadastroSQLQuery.ParamByName('ptelefone').AsString := MaskEdit1.Text;
      CadastroSQLQuery.ParamByName('pcontato').AsString := ContatoEdit1.Text;
      CadastroSQLQuery.ParamByName('pid').AsInteger := StrToInt(Edit1.Text);
      CadastroSQLQuery.ExecSQL;
      MainForm.MainSQLTransaction.Commit;
      MaskEdit1.Text := '';
      Email1Edit.Text := '';
      ContatoEdit1.Text := '';
      Edit1.Text := '';
      QueryStringGridDblClick(Sender);
    except
      on E: Exception do
      begin
        MainForm.MainSQLTransaction.Rollback;
        MsgError(E.ClassName, E.Message);
      end;
    end;
  end;
  Button2.Caption := 'Inserir';
  Button3.Enabled := False;
end;

procedure Tfrm_cadastro.Button3Click(Sender: TObject);
begin
  MainForm.MainSQLTransaction.StartTransaction;
  try
    CadastroSQLQuery.SQL.Text := 'delete from cadastro_contatos where id = :pid';
    CadastroSQLQuery.ParamByName('pid').AsInteger := StrToInt(Edit1.Text);
    CadastroSQLQuery.ExecSQL;
    MainForm.MainSQLTransaction.Commit;
    Edit1.Clear;
    MaskEdit1.Text := '';
    Email1Edit.Text := '';
    ContatoEdit1.Text := '';
    QueryStringGridDblClick(Sender);
  except
    on E: Exception do
    begin
      MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;
end;

procedure Tfrm_cadastro.Button4Click(Sender: TObject);
var
  VCEPs: TStrings;
  scep: string;
  i: integer;
  arquivohtml: textfile;
  shtml, tshtml: string;
  CURL: string;
  AProcess: tprocess;
  fs: TFileStream;
begin

  openurl('https://viacep.com.br/ws/'+StringReplace(CepMaskedit.Text,'-','', [rfReplaceAll])+'/json/');
 { VCEPs := TStringList.Create;
  try
  fs := TFileStream.Create(ExtractFilePath(Application.ExeName) + '/temp/cep.html', fmCreate);



   CURL :=
      'http://www.buscacep.correios.com.br/servicos/dnec/' +
      'consultaLogradouroAction.do?CEP=%s&Metodo=listaLogradouro&' +
      'TipoConsulta=cep&StartRow=1&EndRow=10';

    CURL :=  'http://m.correios.com.br/movel/buscaCepConfirma.do' ;
   // CURL :=  'http://www.buscacep.correios.com.br/sistemas/buscacep/resultadoBuscaCepEndereco.cfm';
   // if HTTPGetText(Format(CURL, [CepMaskedit.Text]), VCEPs) then
    if HttpPostURL(CURL,EncodeURLElement('cepEntrada="29903082"&tipoCep=""&cepTemp=""&metodo="buscarCep"'),fs)then
  // if HttpPostURL(CURL,EncodeURLElement('relaxation=29903082&TipoCep=ALL&cfm=1&Metodo=listaLogradouro&TipoConsulta=relaxation&StartRow=1&EndRow=100'),fs)then

    begin
    fs.free;
    {  for i := 0 to VCEPs.Count - 1 do
        scep := scep + ansitoutf8(VCEPs.Strings[i]);

      scep := Copy(scep, pos('1 Logradouro(s) ', scep),
        (pos('Para mais inform', scep)) - (pos('1 Logradouro(s) ', scep)));
      scep := '<html>' + scep + '</html>';}
     // VCEPs.CommaText := scep;
     // VCEPs.SaveToFile(ExtractFilePath(Application.ExeName) + '/temp/cep.html');

      AProcess := TProcess.Create(nil);
      AProcess.Options := AProcess.Options + [poWaitOnExit];
      AProcess.Executable := ExtractFilePath(Application.ExeName) + 'wkhtmltopdf';
      AProcess.Parameters.Add(ExtractFilePath(Application.ExeName) + '/temp/cep.html');
      AProcess.Parameters.Add(ExtractFilePath(Application.ExeName) + '/temp/cep.pdf');
      AProcess.Execute;
      AProcess.Free;

      OpenDocument(ExtractFilePath(Application.ExeName) + '/temp/cep.pdf');

    end;
  finally
    VCEPs.Free;
    sleep(2500);
    deletefile(ExtractFilePath(Application.ExeName) + '/temp/cep.html');
    deletefile(ExtractFilePath(Application.ExeName) + '/temp/cep.pdf');
  end; }
end;

procedure Tfrm_cadastro.Button5Click(Sender: TObject);
begin
  OpenURL('http://www.ibge.gov.br/home/geociencias/areaterritorial/area.php?nome=' +
    LowerCase(CidadeEdit.Text));
end;

procedure Tfrm_cadastro.Button6Click(Sender: TObject);
var
  s, cnpj, cpf, strsintegra, ssintegra: string;
  filesintegra: TStringList;
  rcons: TMemoryStream;
  F: TextFile;
  resposta: TStringList;
  Aprocess: tprocess;
  i: integer;
  Html: string;
begin
  s := CNPJMaskEdit.Text;
  s := StringReplace(s, '.', '', [rfReplaceAll]);
  s := StringReplace(s, '/', '', [rfReplaceAll]);
  s := StringReplace(s, '-', '', [rfReplaceAll]);


  if (PessoaComboBox.Text = 'F') then
  begin
    cpf := s;
    resposta := TStringList.Create;
    if (HTTPGetText(
      'http://www.receita.fazenda.gov.br/aplicacoes/atcta/cpf/consultapublica.asp',
      resposta)) then
    begin
      for i := 0 to resposta.Count - 1 do
        Html := Html + ansitoutf8(resposta.Strings[i]);
      Html := StringReplace(Html, '/js/',
        'http://www.receita.fazenda.gov.br/js/', [rfReplaceAll]);
      Html := StringReplace(Html, 'href="/css/',
        'href="http://www.receita.fazenda.gov.br/css/', [rfReplaceAll]);
      Html := StringReplace(Html, 'href="./css/',
        'http://www.receita.fazenda.gov.br/Aplicacoes/ATCTA/cpf/css/', [rfReplaceAll]);
      Html := StringReplace(Html, 'action="ConsultaPublicaExibir.asp"',
        'action="http://www.receita.fazenda.gov.br/Aplicacoes/ATCTA/cpf/ConsultaPublicaExibir.asp"',
        [rfReplaceAll]);
      Html := StringReplace(Html, 'src="funcoes.js"',
        'src="http://www.receita.fazenda.gov.br/Aplicacoes/ATCTA/cpf/funcoes.js"',
        [rfReplaceAll]);
      Html := StringReplace(Html, '<input type="text" name="txtCPF" id="txtCPF"',
        ' <input type="text" value=' + quotedstr(cpf) + ' name="txtCPF" id="txtCPF"',
        [rfReplaceAll]);
      Html := StringReplace(Html, '<input type="text" name="txtDataNascimento" id="txtDataNascimento"',
        ' <input type="text" value=' + quotedstr(IeEdit.Text) + ' name="txtDataNascimento" id="txtDataNascimento"',
        [rfReplaceAll]);


      resposta.CommaText := StringReplace(Html, './captcha/gerarCaptcha.asp',
        'http://www.receita.fazenda.gov.br/Aplicacoes/ATCTA/cpf/captcha/gerarCaptcha.asp', [rfReplaceAll]);
      resposta.SaveToFile(ExtractFilePath(Application.ExeName) + '/temp/cpf.html');
     AProcess := TProcess.Create(nil);
   // AProcess.Options := AProcess.Options + [poWaitOnExit];
    AProcess.Executable := 'firefox';
    AProcess.Parameters.Add(ExtractFilePath(Application.ExeName) +
      '/temp/cpf.html');
    AProcess.Execute;
    AProcess.Free;
    resposta.Free;
    sleep(1500);
    deletefile(ExtractFilePath(Application.ExeName) +'/temp/cpf.html')

    end;
  end;



  if (PessoaComboBox.Text = 'J') then
  begin
    cnpj := s;
    openurl('http://www.receita.fazenda.gov.br/pessoajuridica/cnpj/cnpjreva/Cnpjreva_Solicitacao2.asp?cnpj='
      + cnpj);


    rcons := TMemoryStream.Create;


    Clipboard.AsText :=cnpj;




 if (UFEdit.Text = 'AC') then
    begin
  openurl('http://sefaznet.ac.gov.br/sefazonline/servlet/hpfsincon');
   { resposta := TStringList.Create;

         if (HTTPGetText(
      'http://sefaznet.ac.gov.br/sefazonline/servlet/hpfsincon',
      resposta)) then
    begin
      for i := 0 to resposta.Count - 1 do
        Html := Html + ansitoutf8(resposta.Strings[i]);
      Html := StringReplace(Html, '/sefazonline/',
        'http://sefaznet.ac.gov.br/sefazonline/', [rfReplaceAll]);
      Html := StringReplace(Html, 'id="vNUMDOC"',
        'id="vNUMDOC" value='+cnpj, [rfReplaceAll]);
      resposta.CommaText := StringReplace(Html, 'action="hpfsincon">',
        'action="http://sefaznet.ac.gov.br/sefazonline/servlet/hpfsincon">', [rfReplaceAll]);

      resposta.CommaText := StringReplace(Html, 'file://'+ExtractFilePath(Application.ExeName) + '/temp',
        'http://sefaznet.ac.gov.br/sefazonline', [rfReplaceAll]);



      resposta.SaveToFile(ExtractFilePath(Application.ExeName) + '/temp/sintegra.html');
      // problema ao carregar captcha

    end; }
    end;
  if (UFEdit.Text = 'AL') then
    begin
  openurl('http://sintegra.sefaz.al.gov.br/consulta_empresa_pesquisa.asp');

   { resposta := TStringList.Create;

         if (HTTPGetText(
      'http://sintegra.sefaz.al.gov.br/consulta_empresa_pesquisa.asp',
      resposta)) then
    begin
      for i := 0 to resposta.Count - 1 do
        Html := Html + ansitoutf8(resposta.Strings[i]);
      Html := StringReplace(Html, 'imagens/',
        'http://sintegra.sefaz.al.gov.br/imagens/', [rfReplaceAll]);
      Html := StringReplace(Html, 'name="txt_CNPJ"',
        'name="txt_CNPJ" value='+cnpj, [rfReplaceAll]);
      resposta.CommaText := StringReplace(Html, 'action="consulta_empresa_inscricoes.asp"',
        'action="http://sintegra.sefaz.al.gov.br/consulta_empresa_inscricoes.asp"', [rfReplaceAll]);
       resposta.SaveToFile(ExtractFilePath(Application.ExeName) + '/temp/sintegra.html');



    end; }
    end;




    if (UFEdit.Text = 'AP') then
    begin

 OpenURL('http://www.sintegra.ap.gov.br/Sintegra/');

      {  resposta := TStringList.Create;

         if (HTTPGetText(
      'http://www.sintegra.ap.gov.br/Sintegra/',
      resposta)) then
    begin
      for i := 0 to resposta.Count - 1 do
        Html := Html + ansitoutf8(resposta.Strings[i]);
      Html := StringReplace(Html, '"js/',
        '"http://www.sintegra.ap.gov.br/Sintegra/js/', [rfReplaceAll]);
      Html := StringReplace(Html, '"js/',
        '"http://www.sintegra.ap.gov.br/Sintegra/js/', [rfReplaceAll]);

      Html := StringReplace(Html, '<option value="">Selecione</option>',
        '<option value="CNPJ">CNPJ</option>', [rfReplaceAll]);
        Html := StringReplace(Html, 'id="j_id4:doc"',
        'id="j_id4:doc" value='+cnpj, [rfReplaceAll]);
        Html := StringReplace(Html, 'id="j_id4:doc"',
        'id="j_id4:doc" value='+cnpj, [rfReplaceAll]);




        Html := StringReplace(Html, '<img src="Kaptcha.jpg"',
        '<img src="http://www.sintegra.ap.gov.br/Sintegra/Kaptcha.jpg"', [rfReplaceAll]);


      resposta.CommaText := StringReplace(Html, 'action="/Sintegra/pesquisa.jsf"',
        'action="http://www.sintegra.ap.gov.br/Sintegra/pesquisa.jsf"', [rfReplaceAll]);



      resposta.SaveToFile(ExtractFilePath(Application.ExeName) + '/temp/sintegra.html');


     // erro ao carregar pagina
    end;     }
    end;

   if (UFEdit.Text = 'AM') then
    begin
 OpenURL('http://online.sefaz.am.gov.br/sintegra/index.asp');

   { resposta := TStringList.Create;

         if (HTTPGetText(
      'http://online.sefaz.am.gov.br/sintegra/index.asp',
      resposta)) then
    begin
      for i := 0 to resposta.Count - 1 do
        Html := Html + ansitoutf8(resposta.Strings[i]);
      Html := StringReplace(Html, 'action="sintegra_cnpj.asp">',
        'action="http://online.sefaz.am.gov.br/sintegra/sintegra_cnpj.asp">', [rfReplaceAll]);
      Html := StringReplace(Html, 'name="cgc"',
        'name="cgc" value='+cnpj, [rfReplaceAll]);

      Html := StringReplace(Html, '<img src="captcha.asp">',
        '<img src="http://online.sefaz.am.gov.br/sintegra/captcha.asp">', [rfReplaceAll]);

    //  Html := StringReplace(Html, 'sintegra_cnpj.asp',
   //     'http://online.sefaz.am.gov.br/sintegra/sintegra_cnpj.asp', [rfReplaceAll]);


      resposta.CommaText := HTML;
      resposta.SaveToFile(ExtractFilePath(Application.ExeName) + '/temp/sintegra.html');



    end; }
    end;

  if (UFEdit.Text = 'CE') then
    begin
 OpenURL('http://www.sefaz.ce.gov.br/content/aplicacao/internet/servicos_online/sintegra/sintegra.asp?estado=ce');

  {  resposta := TStringList.Create;

         if (HTTPGetText(
      'http://www.sefaz.ce.gov.br/content/aplicacao/internet/servicos_online/sintegra/sintegra.asp?estado=ce',
      resposta)) then
    begin
      for i := 0 to resposta.Count - 1 do
        Html := Html + ansitoutf8(resposta.Strings[i]);

      Html := StringReplace(Html, 'result.asp',
        'http://www.sefaz.ce.gov.br/content/aplicacao/internet/servicos_online/sintegra/result.asp', [rfReplaceAll]);
      Html := StringReplace(Html, 'name="CGC"',
        'name="CGC" value='+cnpj, [rfReplaceAll]);

      resposta.CommaText := HTML;

      resposta.SaveToFile(ExtractFilePath(Application.ExeName) + '/temp/sintegra.html');



    end;  }
    end;

   if (UFEdit.Text = 'DF') then
    begin
 OpenURL('http://www.fazenda.df.gov.br/area.cfm?id_area=110');

     { resposta := TStringList.Create;

         if (HTTPGetText(
      'http://www.fazenda.df.gov.br/area.cfm?id_area=110',
      resposta)) then
    begin
      for i := 0 to resposta.Count - 1 do
        Html := Html + ansitoutf8(resposta.Strings[i]);

            Html := StringReplace(Html, 'action="/aplicacoes/busca/resultado.cfm"',
        'action="http://www.fazenda.df.gov.br/aplicacoes/busca/resultado.cfm"', [rfReplaceAll]);

   //   Html := StringReplace(Html, '/aplicacoes/sintegra/sintegra_acao_cfi.cfm?id_menu=4"',
  //      'action="http://www.fazenda.df.gov.br/aplicacoes/sintegra/sintegra_acao_cfi.cfm?id_menu=4"', [rfReplaceAll]);
      Html := StringReplace(Html, 'name="CGC"',
        'name="CGC" value='+cnpj, [rfReplaceAll]);



      resposta.CommaText := HTML;



      resposta.SaveToFile(ExtractFilePath(Application.ExeName) + '/temp/sintegra.html');



     //nao funcionou a pagina

    end; }
    end;


   if (UFEdit.Text = 'ES') then
    begin
OpenURL('http://www.sintegra.es.gov.br');
   { resposta := TStringList.Create;

         if (HTTPGetText(
      'http://www.sintegra.es.gov.br/',
      resposta)) then
    begin
      for i := 0 to resposta.Count - 1 do
        Html := Html + ansitoutf8(resposta.Strings[i]);

      Html := StringReplace(Html, '/css/',
        'http://www.sintegra.es.gov.br/css/', [rfReplaceAll]);
      Html := StringReplace(Html, '/js/',
        'http://www.sintegra.es.gov.br/js/', [rfReplaceAll]);
      Html := StringReplace(Html, 'action="resultado.php">',
        'action="http://www.sintegra.es.gov.br/resultado.php">', [rfReplaceAll]);
      Html := StringReplace(Html, 'name="num_cnpj"',
        'name="num_cnpj" value='+cnpj, [rfReplaceAll]);

      resposta.CommaText := HTML;
      resposta.SaveToFile(ExtractFilePath(Application.ExeName) + '/temp/sintegra.html');



    end;}
    end;

       if (UFEdit.Text = 'GO') then
        begin
          OpenURL('http://www.sefaz.go.gov.br/ccs/default.asp');
        {resposta := TStringList.Create;

             if (HTTPGetText(
          'http://www.sefaz.go.gov.br/ccs/default.asp',
          resposta)) then
        begin
          for i := 0 to resposta.Count - 1 do
            Html := Html + ansitoutf8(resposta.Strings[i]);

          Html := StringReplace(Html, '<input name="rTipoDoc" type="radio" value="1" id="rTipoDocCCE" required="true" message="Marque um tipo de documento" onClick="fCheckDoc(1)" checked="checked">',
            '<input name="rTipoDoc" type="radio" value="1" id="rTipoDocCCE" required="true" message="Marque um tipo de documento" onClick="fCheckDoc(1)" >', [rfReplaceAll]);
          Html := StringReplace(Html, '<input name="rTipoDoc" type="radio" value="2" id="rTipoDocCNPJ" onClick="fCheckDoc(2)">',
            '<input name="rTipoDoc" type="radio" value="2" id="rTipoDocCNPJ" onClick="fCheckDoc(2)"  checked="checked">', [rfReplaceAll]);
          Html := StringReplace(Html, 'consultar.asp',
            'http://www.sefaz.go.gov.br/ccs/consultar.asp', [rfReplaceAll]);

          Html := StringReplace(Html, 'name="tCNPJ"',
            'name="tCNPJ" value='+cnpj, [rfReplaceAll]);
          Html := StringReplace(Html, '/library/zion2/zionSrc.js',
            'http://www.sefaz.go.gov.br/library/zion2/zionSrc.js', [rfReplaceAll]);
          Html := StringReplace(Html, '000JS.js',
            'http://www.sefaz.go.gov.br/ccs/000JS.js', [rfReplaceAll]);

          resposta.CommaText := HTML;
          resposta.SaveToFile(ExtractFilePath(Application.ExeName) + '/temp/sintegra.html');


         //nao funcionou

        end;}
        end;

       if (UFEdit.Text = 'MA') then
        begin
          OpenURL('http://sistemas.sefaz.ma.gov.br/sintegra/jsp/consultaSintegra/consultaSintegraFiltro.jsf');
        {resposta := TStringList.Create;

             if (HTTPGetText(
          'http://sistemas.sefaz.ma.gov.br/sintegra/jsp/consultaSintegra/consultaSintegraFiltro.jsf',
          resposta)) then
        begin
          for i := 0 to resposta.Count - 1 do
            Html := Html + ansitoutf8(resposta.Strings[i]);

          Html := StringReplace(Html, '<input name="rTipoDoc" type="radio" value="1" id="rTipoDocCCE" required="true" message="Marque um tipo de documento" onClick="fCheckDoc(1)" checked="checked">',
            '<input name="rTipoDoc" type="radio" value="1" id="rTipoDocCCE" required="true" message="Marque um tipo de documento" onClick="fCheckDoc(1)" >', [rfReplaceAll]);
          Html := StringReplace(Html, '<input name="rTipoDoc" type="radio" value="2" id="rTipoDocCNPJ" onClick="fCheckDoc(2)">',
            '<input name="rTipoDoc" type="radio" value="2" id="rTipoDocCNPJ" onClick="fCheckDoc(2)"  checked="checked">', [rfReplaceAll]);
          Html := StringReplace(Html, 'consultar.asp',
            'http://www.sefaz.go.gov.br/ccs/consultar.asp', [rfReplaceAll]);

          Html := StringReplace(Html, 'name="tCNPJ"',
            'name="tCNPJ" value='+cnpj, [rfReplaceAll]);


          resposta.CommaText := HTML;
          resposta.SaveToFile(ExtractFilePath(Application.ExeName) + '/temp/sintegra.html');


         //nao funcionou

        end;}
        end;


        if (UFEdit.Text = 'MT') then
        begin
          OpenURL('http://www.sefaz.mt.gov.br/sid/consulta/infocadastral/consultar/publica');
       { resposta := TStringList.Create;

             if (HTTPGetText(
          'http://www.sefaz.mt.gov.br/sid/consulta/infocadastral/consultar/publica',
          resposta)) then
        begin
          for i := 0 to resposta.Count - 1 do
            Html := Html + ansitoutf8(resposta.Strings[i]);

          Html := StringReplace(Html, '/javascript/',
            'http://www.sefaz.mt.gov.br/javascript/', [rfReplaceAll]);
         Html := StringReplace(Html, '/sid/consulta/geradorcaracteres',
            'http://www.sefaz.mt.gov.br/sid/consulta/geradorcaracteres', [rfReplaceAll]);

          Html := StringReplace(Html, 'name="numero"',
            'name="numero" value='+cnpj, [rfReplaceAll]);


          resposta.CommaText := HTML;
          resposta.SaveToFile(ExtractFilePath(Application.ExeName) + '/temp/sintegra.html');


         //nao funcionou

        end; }
        end;


         if (UFEdit.Text = 'MS') then
        begin
          OpenURL('http://www1.sefaz.ms.gov.br/cadastro/CadastroMsCCI.asp');
      {  resposta := TStringList.Create;

             if (HTTPGetText(
          'http://www1.sefaz.ms.gov.br/cadastro/CadastroMsCCI.asp',
          resposta)) then
        begin
          for i := 0 to resposta.Count - 1 do
            Html := Html + ansitoutf8(resposta.Strings[i]);

          Html := StringReplace(Html, 'js/Funcoes.js',
            'http://www1.sefaz.ms.gov.br/cadastro/js/Funcoes.js', [rfReplaceAll]);
          Html := StringReplace(Html, 'captcha.asp',
            'http://www1.sefaz.ms.gov.br/cadastro/captcha.asp', [rfReplaceAll]);



          Html := StringReplace(Html, 'name="CGC_CPF"',
            'name="CGC_CPF" value='+cnpj, [rfReplaceAll]);


          resposta.CommaText := HTML;
          resposta.SaveToFile(ExtractFilePath(Application.ExeName) + '/temp/sintegra.html');


         //nao funcionou

        end;  }
        end;

        if (UFEdit.Text = 'MG') then
        begin
          OpenURL('http://consultasintegra.fazenda.mg.gov.br/sintegra/');
        {resposta := TStringList.Create;

             if (HTTPGetText(
          'http://consultasintegra.fazenda.mg.gov.br/sintegra/',
          resposta)) then
        begin
          for i := 0 to resposta.Count - 1 do
            Html := Html + ansitoutf8(resposta.Strings[i]);

          Html := StringReplace(Html, '/sintegra/',
            'http://consultasintegra.fazenda.mg.gov.br/sintegra/', [rfReplaceAll]);

          Html := StringReplace(Html, ' <INPUT value="" maxlength="50"',
            ' <INPUT value="'+cnpj+'" maxlength="50"', [rfReplaceAll]);


          resposta.CommaText := HTML;
          resposta.SaveToFile(ExtractFilePath(Application.ExeName) + '/temp/sintegra.html');


         //nao funcionou

        end;}
        end;

         if (UFEdit.Text = 'PA') then
        begin
         OpenURL('https://app.sefa.pa.gov.br/Sintegra/');
       { resposta := TStringList.Create;

             if (HTTPGetText(
          '',
          resposta)) then
        begin
          for i := 0 to resposta.Count - 1 do
            Html := Html + ansitoutf8(resposta.Strings[i]);

          Html := StringReplace(Html, '<input name="rTipoDoc" type="radio" value="1" id="rTipoDocCCE" required="true" message="Marque um tipo de documento" onClick="fCheckDoc(1)" checked="checked">',
            '<input name="rTipoDoc" type="radio" value="1" id="rTipoDocCCE" required="true" message="Marque um tipo de documento" onClick="fCheckDoc(1)" >', [rfReplaceAll]);

          Html := StringReplace(Html, 'name="tCNPJ"',
            'name="tCNPJ" value='+cnpj, [rfReplaceAll]);


          resposta.CommaText := HTML;
          resposta.SaveToFile(ExtractFilePath(Application.ExeName) + '/temp/sintegra.html');


         //nao funcionou

        end; }
        end;

         if (UFEdit.Text = 'PB') then
        begin
         openurl('https://saplic.receita.pb.gov.br/sintegra/SINf_ConsultaSintegra.jsp') ;
     {   resposta := TStringList.Create;

             if (HTTPGetText(
          '',
          resposta)) then
        begin
          for i := 0 to resposta.Count - 1 do
            Html := Html + ansitoutf8(resposta.Strings[i]);

          Html := StringReplace(Html, 'SINf_ConsultaSintegra',
            'https://saplic.receita.pb.gov.br/sintegra/SINf_ConsultaSintegra', [rfReplaceAll]);

          Html := StringReplace(Html, 'name="tCNPJ"',
            'name="tCNPJ" value='+cnpj, [rfReplaceAll]);


          resposta.CommaText := HTML;
          resposta.SaveToFile(ExtractFilePath(Application.ExeName) + '/temp/sintegra.html');


         //nao funcionou

        end;   }
        end;

        if (UFEdit.Text = 'PR') then
        begin

   OpenURL('http://www.sintegra.fazenda.pr.gov.br/sintegra/');
      {  resposta := TStringList.Create;

             if (HTTPGetText(
          'http://www.sintegra.fazenda.pr.gov.br/sintegra/',
          resposta)) then
        begin
          for i := 0 to resposta.Count - 1 do
            Html := Html + ansitoutf8(resposta.Strings[i]);

          Html := StringReplace(Html, '/sintegra/captcha',
            'http://www.sintegra.fazenda.pr.gov.br/sintegra/captcha', [rfReplaceAll]);
          Html := StringReplace(Html, '/sintegra/img/sintegra/img2.jpg',
            'http://www.sintegra.fazenda.pr.gov.br/sintegra/img/sintegra/img2.jpg', [rfReplaceAll]);
          Html := StringReplace(Html, '"/sintegra/',
            '"http://www.sintegra.fazenda.pr.gov.br/sintegra/', [rfReplaceAll]);
          Html := StringReplace(Html, 'name="data[Sintegra1][Cnpj]"',
            'name="data[Sintegra1][Cnpj]" value='+cnpj, [rfReplaceAll]);


          resposta.CommaText := HTML;
          resposta.SaveToFile(ExtractFilePath(Application.ExeName) + '/temp/sintegra.html');


        end; }
        end;

         if (UFEdit.Text = 'PE') then
        begin
      openurl('http://www.sefaz.pe.gov.br/sintegra/');
      {  resposta := TStringList.Create;

             if (HTTPGetText(
          'http://www.sefaz.pe.gov.br/sintegra/',
          resposta)) then
        begin
          for i := 0 to resposta.Count - 1 do
            Html := Html + ansitoutf8(resposta.Strings[i]);

          Html := StringReplace(Html, '<input name="rTipoDoc" type="radio" value="1" id="rTipoDocCCE" required="true" message="Marque um tipo de documento" onClick="fCheckDoc(1)" checked="checked">',
            '<input name="rTipoDoc" type="radio" value="1" id="rTipoDocCCE" required="true" message="Marque um tipo de documento" onClick="fCheckDoc(1)" >', [rfReplaceAll]);

          Html := StringReplace(Html, 'name="CNPJ"',
            'name="CNPJ" value='+cnpj, [rfReplaceAll]);


          resposta.CommaText := HTML;
          resposta.SaveToFile(ExtractFilePath(Application.ExeName) + '/temp/sintegra.html');


         //nao funcionou

        end;  }
        end;

         if (UFEdit.Text = 'PI') then
        begin
         openurl('http://webas.sefaz.pi.gov.br/SintegraConsultaPublica/');
       { resposta := TStringList.Create;

             if (HTTPGetText(
          'http://webas.sefaz.pi.gov.br/SintegraConsultaPublica/',
          resposta)) then
        begin
          for i := 0 to resposta.Count - 1 do
            Html := Html + ansitoutf8(resposta.Strings[i]);

          Html := StringReplace(Html, '/SintegraConsultaPublica/',
            'http://webas.sefaz.pi.gov.br/SintegraConsultaPublica/', [rfReplaceAll]);

          Html := StringReplace(Html, 'name="maskCpfCnpj"',
            'name="maskCpfCnpj" value='+cnpj, [rfReplaceAll]);


          resposta.CommaText := HTML;
          resposta.SaveToFile(ExtractFilePath(Application.ExeName) + '/temp/sintegra.html');


         //nao funcionou

        end;  }
        end;

         if (UFEdit.Text = 'RJ') then
        begin
         openurl('http://www.fazenda.rj.gov.br/projetoCPS/consulta.jsp');
       { resposta := TStringList.Create;

             if (HTTPGetText(
          'http://www.fazenda.rj.gov.br/projetoCPS/consulta.jsp',
          resposta)) then
        begin
          for i := 0 to resposta.Count - 1 do
            Html := Html + ansitoutf8(resposta.Strings[i]);

          Html := StringReplace(Html, '/projetoCPS/',
            'http://www.fazenda.rj.gov.br/projetoCPS/', [rfReplaceAll]);
          Html := StringReplace(Html, 'cpsServlet',
            'http://www.fazenda.rj.gov.br/projetoCPS/cpsServlet', [rfReplaceAll]);

          Html := StringReplace(Html, 'name="CGC"',
            'name="CGC" value='+cnpj, [rfReplaceAll]);


          resposta.CommaText := HTML;
          resposta.SaveToFile(ExtractFilePath(Application.ExeName) + '/temp/sintegra.html');


         //nao funcionou

        end; }
        end;

         if (UFEdit.Text = 'RN') then
        begin
         openurl('http://www.set.rn.gov.br/sintegra/default.asp')
       { resposta := TStringList.Create;

             if (HTTPGetText(
          '',
          resposta)) then
        begin
          for i := 0 to resposta.Count - 1 do
            Html := Html + ansitoutf8(resposta.Strings[i]);

          Html := StringReplace(Html, '<input name="rTipoDoc" type="radio" value="1" id="rTipoDocCCE" required="true" message="Marque um tipo de documento" onClick="fCheckDoc(1)" checked="checked">',
            '<input name="rTipoDoc" type="radio" value="1" id="rTipoDocCCE" required="true" message="Marque um tipo de documento" onClick="fCheckDoc(1)" >', [rfReplaceAll]);

          Html := StringReplace(Html, 'name="tCNPJ"',
            'name="tCNPJ" value='+cnpj, [rfReplaceAll]);


          resposta.CommaText := HTML;
          resposta.SaveToFile(ExtractFilePath(Application.ExeName) + '/temp/sintegra.html');


         //nao funcionou

        end;}
        end;

         if (UFEdit.Text = 'RS') then
        begin
  openurl('http://sintegra.sefaz.rs.gov.br/sef_root/inf/Sintegra_Entrada.asp');
    {      resposta := TStringList.Create;

             if (HTTPGetText(
          'http://sintegra.sefaz.rs.gov.br/sef_root/inf/Sintegra_Entrada.asp',
          resposta)) then
        begin
          for i := 0 to resposta.Count - 1 do
            Html := Html + ansitoutf8(resposta.Strings[i]);

          Html := StringReplace(Html, 'SEF_SINTEGRA_2.asp',
            'http://sintegra.sefaz.rs.gov.br/sef_root/inf/SEF_SINTEGRA_2.asp', [rfReplaceAll]);

          Html := StringReplace(Html, 'NAME="cgcmf"',
            'NAME="cgcmf" value='+cnpj, [rfReplaceAll]);


          resposta.CommaText := HTML;
          resposta.SaveToFile(ExtractFilePath(Application.ExeName) + '/temp/sintegra.html');



        end; }
        end;

         if (UFEdit.Text = 'RO') then
        begin
  openurl('http://portal.intranet.sefin.ro.gov.br/PortalContribuinte/Publico/parametropublica.jsp');
 {       resposta := TStringList.Create;

             if (HTTPGetText(
          '',
          resposta)) then
        begin
          for i := 0 to resposta.Count - 1 do
            Html := Html + ansitoutf8(resposta.Strings[i]);

          Html := StringReplace(Html, '<input name="rTipoDoc" type="radio" value="1" id="rTipoDocCCE" required="true" message="Marque um tipo de documento" onClick="fCheckDoc(1)" checked="checked">',
            '<input name="rTipoDoc" type="radio" value="1" id="rTipoDocCCE" required="true" message="Marque um tipo de documento" onClick="fCheckDoc(1)" >', [rfReplaceAll]);

          Html := StringReplace(Html, 'name="tCNPJ"',
            'name="tCNPJ" value='+cnpj, [rfReplaceAll]);


          resposta.CommaText := HTML;
          resposta.SaveToFile(ExtractFilePath(Application.ExeName) + '/temp/sintegra.html');


         //nao funcionou

        end; }
        end;


        if (UFEdit.Text = 'RR') then
        begin
         openurl('https://www.sefaz.rr.gov.br/sintegra/servlet/hwsintco');
     {   resposta := TStringList.Create;

             if (HTTPGetText(
          '',
          resposta)) then
        begin
          for i := 0 to resposta.Count - 1 do
            Html := Html + ansitoutf8(resposta.Strings[i]);

          Html := StringReplace(Html, '<input name="rTipoDoc" type="radio" value="1" id="rTipoDocCCE" required="true" message="Marque um tipo de documento" onClick="fCheckDoc(1)" checked="checked">',
            '<input name="rTipoDoc" type="radio" value="1" id="rTipoDocCCE" required="true" message="Marque um tipo de documento" onClick="fCheckDoc(1)" >', [rfReplaceAll]);

          Html := StringReplace(Html, 'name="tCNPJ"',
            'name="tCNPJ" value='+cnpj, [rfReplaceAll]);


          resposta.CommaText := HTML;
          resposta.SaveToFile(ExtractFilePath(Application.ExeName) + '/temp/sintegra.html');
                }

         //nao funcionou

       // end;
        end;

         if (UFEdit.Text = 'SC') then
        begin
  openurl('http://sistemas3.sef.sc.gov.br/sintegra/consulta_empresa_pesquisa.aspx');

  {      resposta := TStringList.Create;

             if (HTTPGetText(
          'http://sistemas3.sef.sc.gov.br/sintegra/consulta_empresa_pesquisa.aspx',
          resposta)) then
        begin
          for i := 0 to resposta.Count - 1 do
            Html := Html + ansitoutf8(resposta.Strings[i]);

          Html := StringReplace(Html, '/sintegra/',
            'http://sistemas3.sef.sc.gov.br/sintegra/', [rfReplaceAll]);
          Html := StringReplace(Html, 'CaptchaImage.axd',
            'http://sistemas3.sef.sc.gov.br/sintegra/CaptchaImage.axd', [rfReplaceAll]);

          Html := StringReplace(Html, 'consulta_empresa_pesquisa.aspx',
            'http://sistemas3.sef.sc.gov.br/sintegra/consulta_empresa_pesquisa.aspx', [rfReplaceAll]);


          Html := StringReplace(Html, 'name="txt_CPFCNPJ"',
            'name="txt_CPFCNPJ" value='+cnpj, [rfReplaceAll]);


          resposta.CommaText := HTML;
          resposta.SaveToFile(ExtractFilePath(Application.ExeName) + '/temp/sintegra.html');


         //nao funcionou

        end; }
        end;
        if (UFEdit.Text = 'SP') then
        begin
  openurl('http://pfeserv1.fazenda.sp.gov.br/sintegrapfe/consultaSintegraServlet') ;
   {     resposta := TStringList.Create;

             if (HTTPGetText(
          'http://pfeserv1.fazenda.sp.gov.br/sintegrapfe/consultaSintegraServlet',
          resposta)) then
        begin
          for i := 0 to resposta.Count - 1 do
            Html := Html + ansitoutf8(resposta.Strings[i]);

          Html := StringReplace(Html, '/sintegrapfe/imageGenerator',
            'http://pfeserv1.fazenda.sp.gov.br/sintegrapfe/imageGenerator', [rfReplaceAll]);
          Html := StringReplace(Html, 'action="/sintegrapfe/sintegra"',
            'action="http://pfeserv1.fazenda.sp.gov.br/sintegrapfe/sintegra"', [rfReplaceAll]);

         Html := StringReplace(Html, 'href="consultaSintegraServlet',
            'href="http://pfeserv1.fazenda.sp.gov.br/sintegrapfe/consultaSintegraServlet', [rfReplaceAll]);

          Html := StringReplace(Html, 'name="cnpj"',
            'name="cnpj" value='+cnpj, [rfReplaceAll]);


          resposta.CommaText := HTML;
          resposta.SaveToFile(ExtractFilePath(Application.ExeName) + '/temp/sintegra.html');


         //nao funcionou

        end;}
        end;

         if (UFEdit.Text = 'SE') then
        begin
   openurl('https://security.sefaz.se.gov.br/SIC/sintegra/index.jsp');
   {     resposta := TStringList.Create;

             if (HTTPGetText(
          'https://security.sefaz.se.gov.br/SIC/sintegra/index.jsp',
          resposta)) then
        begin
          for i := 0 to resposta.Count - 1 do
            Html := Html + ansitoutf8(resposta.Strings[i]);

          Html := StringReplace(Html, '/iBusinessPortal/',
            'https://security.sefaz.se.gov.br/iBusinessPortal/', [rfReplaceAll]);
          Html := StringReplace(Html, '/SIC/sintegra/result.jsp',
            'https://security.sefaz.se.gov.br/SIC/sintegra/result.jsp', [rfReplaceAll]);


          Html := StringReplace(Html, 'name="cdCnpj"',
            'name="cdCnpj" value='+cnpj, [rfReplaceAll]);


          resposta.CommaText := HTML;
          resposta.SaveToFile(ExtractFilePath(Application.ExeName) + 'temp/sintegra.html');


         //nao funcionou

        end; }
        end;

         if (UFEdit.Text = 'TO') then
        begin
    openurl('http://sintegra.sefaz.to.gov.br/sintegra/ConsultaSintegra.dll?CPF=&CGC='+cnpj+
    '&B1=Consulta+por+CNPJ&IE=')




        end;




    if (UFEdit.Text = 'BA') then
    begin
     openurl('http://www.sefaz.ba.gov.br/Sintegra/sintegra.asp?estado=BA');
  {    HttpPostURL('http://www.sefaz.ba.gov.br/Sintegra/Result.asp',
        'txt_CNPJ=' + cnpj, rcons);
         rcons.SaveToFile(ExtractFilePath(Application.ExeName) + '/temp/sintegra.html');
     }
    end;

  {
    filesintegra := TStringList.Create;
    filesintegra.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '/temp/sintegra.html');
    for i := 0 to filesintegra.Count - 1 do
      ssintegra := ssintegra + ansitoutf8(filesintegra.Strings[i]);



    if (UFEdit.Text = 'BA') then
    begin
      filesintegra.CommaText :=
        StringReplace(ssintegra, '/imagens/', 'http://www.sefaz.ba.gov.br/imagens/',
        [rfReplaceAll]);
        filesintegra.SaveToFile(ExtractFilePath(Application.ExeName) +
      '/temp/sintegra.html');
    end;


    filesintegra.Free;
    AProcess := TProcess.Create(nil);
    AProcess.Options := AProcess.Options + [poWaitOnExit];
    AProcess.Executable := 'firefox';
    AProcess.Parameters.Text:=(ExtractFilePath(Application.ExeName) +
      '/temp/sintegra.html');
    AProcess.Execute;
    AProcess.Free;
    sleep(1500);
    deletefile(ExtractFilePath(Application.ExeName) + '/temp/sintegra.html');
    rcons.Free;}
  end;

end;

procedure Tfrm_cadastro.CidadeEditExit(Sender: TObject);
begin
  CidadeEdit.Text := StringsReplace(CidadeEdit.Text, Accents, NoAccents, [rfReplaceAll]);
end;

procedure Tfrm_cadastro.CidadeEditKeyPress(Sender: TObject; var Key: char);
var
  uftemp: string;
begin
  contrDesc := CidadeEdit;
  mgrid.Parent := CidadeEdit.Parent;
  mgrid.top := CidadeEdit.Top + 20;
  mgrid.Left := CidadeEdit.Left;
  MainForm.MainSQLTransaction.StartTransaction;
  try
    LookupSQLQuery.SQL.Text := 'select *  from uf where sigla like :psigla';
    LookupSQLQuery.ParamByName('psigla').AsString := UFEdit.Text;
    LookupSQLQuery.Open;
    uftemp := LookupSQLQuery.FieldByName('iduf').AsString;
    LookupSQLQuery.Close;
    LookupSQLQuery.SQL.Text :=
      'select id,iduf,UPPER(nome)as nome from municipios where UPPER(nome) like '+quotedstr('%'+ CidadeEdit.Text +'%')+' and iduf like '+quotedstr(uftemp)+' order by nome';
   // LookupSQLQuery.ParamByName('pnome').AsString := '%'  '%';
    //LookupSQLQuery.ParamByName('piduf').AsString := uftemp;
    LookupSQLQuery.Open;
 {   if LookupSQLQuery.IsEmpty then
    begin
      mgrid.RowCount := 1;
      ShowMessage('Erro ao carregar dados');
    end
    else  }
    begin
      LookupSQLQuery.First;
      mgrid.BeginUpdate;
      try
        mgrid.Clear;
        mgrid.Options := mgrid.Options + [gorowselect];
        mgrid.FixedCols := 0;
        mgrid.FixedRows := 0;
        mgrid.ColCount := 1;
        mgrid.Height := 250;
        mgrid.ColWidths[0] := 250;
        //mgrid.ColWidths[1] := 50;
        mgrid.RowCount := LookupSQLQuery.RecordCount + mgrid.FixedRows;
        while not LookupSQLQuery.EOF do
        begin
          {mgrid.Cells[1, LookupSQLQuery.RecNo - 1] :=
            LookupSQLQuery.FieldByName('id').AsString;}
          mgrid.Cells[0, LookupSQLQuery.RecNo - 1] :=
            LookupSQLQuery.FieldByName('nome').AsString;
          LookupSQLQuery.Next;
        end;
      finally
        mgrid.EndUpdate;
      end;
    end;
    MainForm.MainSQLTransaction.Commit;
    mbotao.Parent := CidadeEdit.Parent;
    mbotao.Top := mgrid.Top + mgrid.Height;
    mbotao.Left := mgrid.Left;
    mbotao.Width := mgrid.Width;
    mbotao.Caption := 'Cancelar';
    mbotao.OnClick := @bclica;
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
  cadbtnmodifica;
  if Key = #27 then
    bclica(Sender);
end;

procedure Tfrm_cadastro.CNPJMaskEditExit(Sender: TObject);
begin
  if (PessoaComboBox.Text = 'F') then
  begin
    if not vercpf(CNPJMaskEdit.Text) then
      CNPJMaskEdit.SetFocus;
  end;
  if (PessoaComboBox.Text = 'J') then
  begin
    if not VerCnpj(CNPJMaskEdit.Text) then
      CNPJMaskEdit.SetFocus;
  end;

end;

procedure Tfrm_cadastro.CodigoEditChange(Sender: TObject);
begin
 if CodigoEdit.Text='' then
 begin
 MaskEdit1.Enabled :=false ;
 Email1Edit.Enabled :=false ;
 ContatoEdit1.Enabled :=false ;
 Button2.Enabled :=false ;
 Button3.Enabled :=false ;
 end else
 begin
 MaskEdit1.Enabled :=true ;
 Email1Edit.Enabled :=true ;
 ContatoEdit1.Enabled :=true ;
 Button2.Enabled :=true ;
 Button3.Enabled :=true ;
 end;
end;

procedure Tfrm_cadastro.ContatosStringGridDblClick(Sender: TObject);
begin
  MaskEdit1.Text := ContatosStringGrid.Cells[1, linha];
  Email1Edit.Text := ContatosStringGrid.Cells[2, linha];
  ContatoEdit1.Text := ContatosStringGrid.Cells[3, linha];
  Edit1.Text := ContatosStringGrid.Cells[0, linha];
end;

procedure Tfrm_cadastro.ContatosStringGridSelectCell(Sender: TObject;
  aCol, aRow: integer; var CanSelect: boolean);
begin
  MaskEdit1.Text := '';
  Email1Edit.Text := '';
  ContatoEdit1.Text := '';
  Edit1.Text := '';
  linha := aRow;
end;

procedure Tfrm_cadastro.Edit1Change(Sender: TObject);
begin
  if (Edit1.Text <> '') then
  begin
    Button2.Caption := 'Alterar';
    Button3.Enabled := True;
  end
  else
  begin
    Button2.Caption := 'Inserir';
    Button3.Enabled := False;
  end;
end;

procedure Tfrm_cadastro.EnderecoEditExit(Sender: TObject);
begin
  EnderecoEdit.Text := StringsReplace(EnderecoEdit.Text, Accents,
    NoAccents, [rfReplaceAll]);
end;

procedure Tfrm_cadastro.NFantasiaEditExit(Sender: TObject);
begin
  NFantasiaEdit.Text := StringsReplace(NFantasiaEdit.Text, Accents,
    NoAccents, [rfReplaceAll]);
end;

procedure Tfrm_cadastro.NomeEditExit(Sender: TObject);
begin
  NomeEdit.Text := StringsReplace(NomeEdit.Text, Accents, NoAccents, [rfReplaceAll]);
end;

procedure Tfrm_cadastro.BitBtn1Click(Sender: TObject);
begin
  if (NomeEdit.Text <> '') and (NFantasiaEdit.Text <> '') then
  begin
    if (CodigoEdit.Text = '') then
    begin
      MainForm.MainSQLTransaction.StartTransaction;
      try
        CadastroSQLQuery.SQL.Text :=
          'insert into cadastro(nome,apelido,tipo_pessoa,sexo,cnpj,' +
          'inscricao_estadual,endereco,complemento,bairro,cidade,uf,cep,cx_postal,'
          +
          'cli_bloqueado,tipo_cadastro,observacao,data_cadast,numero,fax,site,tabela)' +
          ' values(:pnome,:papelido,:ptipo_pessoa,:psexo,:pcnpj,' +
          ':pinscricao_estadual,:pendereco,:pcomplemento,:pbairro,:pcidade,:puf,'
          +
          ':pcep,:pcx_postal,:pcli_bloqueado,:ptipo_cadastro,:pobservacao,' +
          ':pdata_cadast,:pnumero,:pfax,:psite,:ptabela)';
        CadastroSQLQuery.ParamByName('pnome').AsString := NomeEdit.Text;
        CadastroSQLQuery.ParamByName('papelido').AsString := NFantasiaEdit.Text;
        CadastroSQLQuery.ParamByName('ptipo_pessoa').AsString := PessoaComboBox.Text;
        CadastroSQLQuery.ParamByName('pdata_cadast').AsString := CadastroDateEdit.Text;
        CadastroSQLQuery.ParamByName('ptipo_cadastro').AsString := TipoComboBox.Text;
        CadastroSQLQuery.ParamByName('pcnpj').AsString := CNPJMaskEdit.Text;
        CadastroSQLQuery.ParamByName('psexo').AsString := SexoComboBox.Text;
        CadastroSQLQuery.ParamByName('pinscricao_estadual').AsString := IeEdit.Text;
        if BloqueadoCheckBox.Checked then
          CadastroSQLQuery.ParamByName('pcli_bloqueado').AsString := 'SIM'
        else
          CadastroSQLQuery.ParamByName('pcli_bloqueado').AsString := 'NAO';
        CadastroSQLQuery.ParamByName('pendereco').AsString := EnderecoEdit.Text;
        CadastroSQLQuery.ParamByName('pnumero').AsString := NumeroEdit.Text;
        CadastroSQLQuery.ParamByName('pbairro').AsString := BairroEdit.Text;
        CadastroSQLQuery.ParamByName('puf').AsString := UFEdit.Text;
        CadastroSQLQuery.ParamByName('pcidade').AsString := CidadeEdit.Text;
        CadastroSQLQuery.ParamByName('pcomplemento').AsString := ComplementoEdit.Text;
        CadastroSQLQuery.ParamByName('pcep').AsString := CepMaskedit.Text;
        CadastroSQLQuery.ParamByName('pcx_postal').AsString := CaixaPostalEdit.Text;
        CadastroSQLQuery.ParamByName('pobservacao').AsString := ObservacaoMemo.Text;
        CadastroSQLQuery.ParamByName('pfax').AsString := FaxEdit.Text;
        CadastroSQLQuery.ParamByName('psite').AsString := SiteEdit.Text;
        CadastroSQLQuery.ParamByName('ptabela').AsString := TabelaComboBox.Text;
        CadastroSQLQuery.ExecSQL;
        MainForm.MainSQLTransaction.Commit;
        limpar;
      except
        on E: Exception do
        begin
          MainForm.MainSQLTransaction.Rollback;
          MsgError(E.ClassName, E.Message);
        end;
      end;
    end
    else
    begin
      MainForm.MainSQLTransaction.StartTransaction;
      try
        CadastroSQLQuery.SQL.Text :=
          'update cadastro set nome =:pnome,apelido =:papelido,tipo_pessoa' +
          ' =:ptipo_pessoa,data_cadast=:pdata_cadast,tipo_cadastro=:ptipo_cadastro,' +
          'cnpj=:pcnpj,sexo=:psexo,inscricao_estadual=:pinscricao_estadual,' +
          'cli_bloqueado=:pcli_bloqueado,endereco=:pendereco,numero=:pnumero,' +
          'bairro=:pbairro,uf=:puf,cidade=:pcidade,complemento=:pcomplemento,' +
          'cep=:pcep,cx_postal=:pcx_postal,observacao=:pobservacao,fax=:pfax,' +
          'site=:psite,tabela =:ptabela where codigo = :pcodigo';
        CadastroSQLQuery.ParamByName('pnome').AsString := NomeEdit.Text;
        CadastroSQLQuery.ParamByName('papelido').AsString := NFantasiaEdit.Text;
        CadastroSQLQuery.ParamByName('ptipo_pessoa').AsString := PessoaComboBox.Text;
        CadastroSQLQuery.ParamByName('pdata_cadast').AsString := CadastroDateEdit.Text;
        CadastroSQLQuery.ParamByName('ptipo_cadastro').AsString := TipoComboBox.Text;
        CadastroSQLQuery.ParamByName('pcnpj').AsString := CNPJMaskEdit.Text;
        CadastroSQLQuery.ParamByName('psexo').AsString := SexoComboBox.Text;
        CadastroSQLQuery.ParamByName('pinscricao_estadual').AsString := IeEdit.Text;
        if BloqueadoCheckBox.Checked then
          CadastroSQLQuery.ParamByName('pcli_bloqueado').AsString := 'SIM'
        else
          CadastroSQLQuery.ParamByName('pcli_bloqueado').AsString := 'NAO';
        CadastroSQLQuery.ParamByName('pendereco').AsString := EnderecoEdit.Text;
        CadastroSQLQuery.ParamByName('pnumero').AsString := NumeroEdit.Text;
        CadastroSQLQuery.ParamByName('pbairro').AsString := BairroEdit.Text;
        CadastroSQLQuery.ParamByName('puf').AsString := UFEdit.Text;
        CadastroSQLQuery.ParamByName('pcidade').AsString := CidadeEdit.Text;
        CadastroSQLQuery.ParamByName('pcomplemento').AsString := ComplementoEdit.Text;
        CadastroSQLQuery.ParamByName('pcep').AsString := CepMaskedit.Text;
        CadastroSQLQuery.ParamByName('pcx_postal').AsString := CaixaPostalEdit.Text;
        CadastroSQLQuery.ParamByName('pobservacao').AsString := ObservacaoMemo.Text;
        CadastroSQLQuery.ParamByName('pfax').AsString := FaxEdit.Text;
        CadastroSQLQuery.ParamByName('psite').AsString := SiteEdit.Text;
        CadastroSQLQuery.ParamByName('pcodigo').AsInteger := StrToInt(CodigoEdit.Text);
        CadastroSQLQuery.ParamByName('ptabela').AsString := TabelaComboBox.Text;
        CadastroSQLQuery.ExecSQL;
        MainForm.MainSQLTransaction.Commit;
        limpar;
      except
        on E: Exception do
        begin
          MainForm.MainSQLTransaction.Rollback;
          MsgError(E.ClassName, E.Message);
        end;
      end;
    end;
    BitBtn1.Enabled := False;
    search;
  end
  else
    ShowMessage('Preencha os campos');
end;

procedure Tfrm_cadastro.BairroEditExit(Sender: TObject);
begin
  BairroEdit.Text := StringsReplace(BairroEdit.Text, Accents, NoAccents, [rfReplaceAll]);
end;

procedure Tfrm_cadastro.NomeEditKeyPress(Sender: TObject; var Key: char);
begin
  cadbtnmodifica;
end;

procedure Tfrm_cadastro.PessoaComboBoxChange(Sender: TObject);
begin
  atualiza;
end;

procedure Tfrm_cadastro.PessoaComboBoxSelect(Sender: TObject);
begin
  cadbtnmodifica;
  if (PessoaComboBox.Text = 'F') then
    CNPJMaskEdit.EditMask := '999\.999\.999\-99;1;_';
  if (PessoaComboBox.Text = 'J') then
    CNPJMaskEdit.EditMask := '99\.999\.999\/9999\-99;1;_';
end;

procedure Tfrm_cadastro.FormCreate(Sender: TObject);
begin
  CadastroSQLQuery.DataBase := MainForm.MainSQLConnector;
  CadastroSQLQuery.Transaction := MainForm.MainSQLTransaction;
  CadastroSQLQuery.PacketRecords := -1;
  CadastroDateEdit.Date := date;
  mgrid := TStringGrid.Create(frm_cadastro);
  mbotao := TButton.Create(mgrid);
  mbotao.Hide;
  mgrid.Hide;
  LookupSQLQuery := TSQLQuery.Create(frm_cadastro);
  LookupSQLQuery.DataBase := MainForm.MainSQLConnector;
  LookupSQLQuery.Transaction := MainForm.MainSQLTransaction;
  LookupSQLQuery.PacketRecords := -1;
  QueryStringGrid.ColCount := 2;
  QueryStringGrid.FixedCols := 0;
  QueryStringGrid.ColWidths[1] := 60;
  QueryStringGrid.ColWidths[0] := 300;
  QueryStringGrid.Cells[1, 0] := 'ID';
  QueryStringGrid.Cells[0, 0] := 'Nome Fantasia';
  QueryStringGrid.Options := QueryStringGrid.Options + [gorowselect];
  ContatosStringGrid.FixedCols := 0;
  ContatosStringGrid.FixedRows := 1;
  ContatosStringGrid.ColCount := 4;
  ContatosStringGrid.RowCount := 1;
  ContatosStringGrid.ColWidths[0] := 0;
  ContatosStringGrid.ColWidths[1] := 120;
  ContatosStringGrid.ColWidths[2] := 300;
  ContatosStringGrid.ColWidths[3] := 300;
  ContatosStringGrid.Cols[0].Text := 'ID';
  ContatosStringGrid.Cols[1].Text := 'Telefone';
  ContatosStringGrid.Cols[2].Text := 'email';
  ContatosStringGrid.Cols[3].Text := 'Pessoa de Contato';
  CodigoEditChange(sender);
end;

procedure Tfrm_cadastro.SpeedButton15Click(Sender: TObject);
begin
  openURL('http:' + SiteEdit.Text);
end;

procedure Tfrm_cadastro.MsgError(const AClassName, AMsg: string);
const
  CMsg = 'Error in class "%s": %s';
begin
  Application.MessageBox(PChar(Format(CMsg, [AClassName, AMsg])),
    PChar(Application.Title), MB_ICONERROR + MB_OK);
end;

procedure Tfrm_cadastro.cadbtnmodifica;
begin
  BitBtn1.Enabled := True;
  if CodigoEdit.Text = '' then
    BitBtn1.Caption := 'Inserir'
  else
    BitBtn1.Caption := 'Alterar';
end;

procedure Tfrm_cadastro.criagrid(controleDesc: TEdit; sql, campoID, campoDesc: string);
begin
  mgrid.Parent := controleDesc.Parent;
  contrDesc := controleDesc;
  mgrid.top := controleDesc.Top + 20;
  mgrid.Left := controleDesc.Left;
  MainForm.MainSQLTransaction.StartTransaction;
  try
    LookupSQLQuery.SQL.Text := sql;
    LookupSQLQuery.ParamByName('parametro').AsString := controleDesc.Text + '%';
    LookupSQLQuery.Open;
 {   if LookupSQLQuery.IsEmpty then
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
        mgrid.Height := 250;
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
    mbotao.Caption := 'Cancelar';
    mbotao.OnClick := @bclica;
    mbotao.Visible := True;
    mgrid.OnSelection := @seleciona;
    mgrid.OnClick := @click;
    mgrid.OnMouseLeave :=@bclica;
  except
    on E: Exception do
    begin
      MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;
  mgrid.Show;
end;

procedure Tfrm_cadastro.Seleciona(Sender: TObject; aCol, aRow: integer);
begin
  contrDesc.Text := mGrid.Cells[0, aRow];
  // contrId.Text := mGrid.Cells[1, aRow];
end;

procedure Tfrm_cadastro.click(Sender: TObject);
begin
  mgrid.Hide;
  mbotao.Hide;
end;

procedure Tfrm_cadastro.bclica(Sender: TObject);
begin
  mgrid.Hide;
  mbotao.Hide;
end;

procedure Tfrm_cadastro.atualizacontatos;
begin
  ContatosStringGrid.FixedCols := 0;
  ContatosStringGrid.FixedRows := 1;
  ContatosStringGrid.ColCount := 4;
  ContatosStringGrid.RowCount := 1;
  ContatosStringGrid.ColWidths[0] := 0;
  ContatosStringGrid.ColWidths[1] := 120;
  ContatosStringGrid.ColWidths[2] := 300;
  ContatosStringGrid.ColWidths[3] := 300;
  ContatosStringGrid.Cols[0].Text := 'ID';
  ContatosStringGrid.Cols[1].Text := 'Telefone';
  ContatosStringGrid.Cols[2].Text := 'email';
  ContatosStringGrid.Cols[3].Text := 'Pessoa de Contato';

end;


procedure Tfrm_cadastro.SpeedButton4Click(Sender: TObject);
var
  Mail: PChar;
begin
  if Email1Edit.Text <> '' then
  begin
    if Pos('@', Email1Edit.Text) > 0 then
    begin
      mail := PChar('mailto:' + Email1Edit.Text);
      openURL(mail);
    end
    else
      ShowMessage('E-mail inválido!');
  end
  else
    ShowMessage('Informe o e-mail do destinatário!');
end;


procedure Tfrm_cadastro.BitBtn3Click(Sender: TObject);
begin
  if MessageDlg('Alerta', 'Deseja excluir o registro atual ?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    MainForm.MainSQLTransaction.StartTransaction;
    try
      CadastroSQLQuery.SQL.Text := 'delete from cadastro_contatos where tcadastroid='+CodigoEdit.Text;
       CadastroSQLQuery.ExecSQL;

      CadastroSQLQuery.SQL.Text := 'delete from cadastro where codigo = :pcodigo';
      CadastroSQLQuery.ParamByName('pcodigo').AsInteger := StrToInt(CodigoEdit.Text);
      CadastroSQLQuery.ExecSQL;

      MainForm.MainSQLTransaction.Commit;
      Limpar;
      SearchEditChange(Sender);
    except
      on E: Exception do
      begin
        MainForm.MainSQLTransaction.Rollback;
        MsgError(E.ClassName, E.Message);
      end;
    end;
  end;
end;

procedure Tfrm_cadastro.UFEditKeyPress(Sender: TObject; var Key: char);
begin
  cadbtnmodifica;
end;

function Tfrm_cadastro.vercpf(snrcpf: string): boolean;
var
  WCPFCALC: string;
  WSOMACPF: integer;
  WSX1: shortint;
  WCPFDIGT: integer;
  digit: string;
  s: string;
begin
  s := snrcpf;
  digit := copy(snrcpf, 14, 1);
  while Pos('.', S) > 0 do
    S[Pos('.', S)] := ' ';
  while Pos('-', S) > 0 do
    S[Pos('-', S)] := ' ';
  s := TRIM(s);
  if s = '' then
  else if length(s) < 11 then
  begin
    application.messagebox('CPF Inválido !', 'Atenção!', mb_iconstop + mb_ok);
    VerCPF := False;
  end
  else
  begin
    snrCpf := Copy(snrcpf, 1, 3) + Copy(snrcpf, 5, 3) + Copy(snrcpf, 9, 3) +
      Copy(snrcpf, 13, 2);
    wcpfcalc := copy(snrCpf, 1, 9);
    wsomacpf := 0;
    for wsx1 := 1 to 9 do
      wsomacpf := wsomacpf + StrToInt(copy(wcpfcalc, wsx1, 1)) * (11 - wsx1);
    wcpfdigt := 11 - wsomacpf mod 11;
    if wcpfdigt in [10, 11] then
    begin
      wcpfcalc := wcpfcalc + '0';
    end
    else
    begin
      wcpfcalc := wcpfcalc + IntToStr(wcpfdigt);
    end;
    wsomacpf := 0;
    for wsx1 := 1 to 10 do
      wsomacpf := wsomacpf + StrToInt(copy(wcpfcalc, wsx1, 1)) * (12 - wsx1);
    wcpfdigt := 11 - wsomacpf mod 11;
    if wcpfdigt in [10, 11] then
    begin
      wcpfcalc := wcpfcalc + '0';
    end
    else
    begin
      wcpfcalc := wcpfcalc + IntToStr(wcpfdigt);
    end;
    if snrcpf <> wcpfcalc then
    begin
      application.messagebox('CPF Inválido !', 'Atenção!', mb_iconstop + mb_ok);
      VerCPF := False;
      Result := False;
    end
    else
    begin
      VerCPF := True;
      Result := True;
    end;
  end;
end;

function Tfrm_cadastro.VerCnpj(snrcnpj: string): boolean;
var
  WCNPJCALC: string;
  WSOMACNPJ: integer;
  WSX1: shortint;
  WCNPJDIGT: integer;
  s: string;
begin
  s := snrCNPJ;
  while Pos('.', S) > 0 do
    S[Pos('.', S)] := ' ';
  while Pos('/', S) > 0 do
    S[Pos('/', S)] := ' ';
  while Pos('-', S) > 0 do
    S[Pos('-', S)] := ' ';
  s := TRIM(s);
  if s = '' then
  else if length(s) < 18 then
  begin
    application.messagebox('CNPJ Inválido !', 'Atenção!', mb_iconstop + mb_ok);
    VerCNPJ := False;
  end
  else
  begin
    snrCNPJ := Copy(snrCNPJ, 1, 2) + Copy(snrCNPJ, 4, 3) +
      Copy(snrCNPJ, 8, 3) + Copy(snrCNPJ, 12, 4) + Copy(snrCNPJ, 17, 2);
    wCNPJCalc := Copy(snrCNPJ, 1, 12);
    WSOMACNPJ := 0;
    for wsx1 := 1 to 4 do
      wsomaCNPJ := wsomaCNPJ + StrToInt(copy(wCNPJcalc, wsx1, 1)) * (6 - wsx1);
    for wsx1 := 1 to 8 do
      wsomaCNPJ := wsomaCNPJ + StrToInt(copy(wCNPJcalc, wsx1 + 4, 1)) *
        (10 - wsx1);
    wCNPJdigt := 11 - wsomaCNPJ mod 11;
    if wCNPJdigt in [10, 11] then
    begin
      wCNPJcalc := wCNPJcalc + '0';
    end
    else
    begin
      wCNPJcalc := wCNPJcalc + IntToStr(wCNPJdigt);
    end;
    wsomaCNPJ := 0;
    for wsx1 := 1 to 5 do
      wsomaCNPJ := wsomaCNPJ + StrToInt(copy(wCNPJcalc, wsx1, 1)) * (7 - wsx1);
    for wsx1 := 1 to 8 do
      wsomaCNPJ := wsomaCNPJ + StrToInt(copy(wCNPJcalc, wsx1 + 5, 1)) *
        (10 - wsx1);
    wCNPJdigt := 11 - wsomaCNPJ mod 11;
    if wCNPJdigt in [10, 11] then
    begin
      wCNPJcalc := wCNPJcalc + '0';
    end
    else
    begin
      wCNPJcalc := wCNPJcalc + IntToStr(wCNPJdigt);
    end;
    if snrCNPJ <> wCNPJcalc then
    begin
      application.messagebox('CNPJ Inválido !', 'Atenção!', mb_iconstop + mb_ok);
      VerCNPJ := False;
      Result := False;
    end
    else
    begin
      VerCNPJ := True;
      Result := True;
    end;
  end;
end;

procedure Tfrm_cadastro.limpar;
begin
  BloqueadoCheckBox.Checked := False;
  CNPJMaskEdit.Clear;
  BairroEdit.Clear;
  CidadeEdit.Clear;
  ComplementoEdit.Clear;
  CaixaPostalEdit.Clear;
  CepMaskedit.Clear;
  CadastroDateEdit.Clear;
  UFEdit.Clear;
  NumeroEdit.Clear;
  EnderecoEdit.Clear;
  SexoComboBox.ItemIndex := -1;
  IeEdit.Clear;
  TipoComboBox.ItemIndex := -1;
  PessoaComboBox.ItemIndex := -1;
  CodigoEdit.Clear;
  NFantasiaEdit.Clear;
  NomeEdit.Clear;
  ObservacaoMemo.Clear;
  CadastroDateEdit.Date := date;
  BitBtn1.Enabled := False;
  BitBtn3.Enabled := False;
  FaxEdit.Clear;
  SiteEdit.Clear;
  Email1Edit.Clear;
  ContatoEdit1.Clear;
  MaskEdit1.Clear;
  TabelaComboBox.ItemIndex := -1;
  ContatosStringGrid.RowCount := 1;
end;

procedure Tfrm_cadastro.atualiza;
begin
  if PessoaComboBox.Text = 'F' then
  begin
    SexoComboBox.Show;
    Label15.Show;
    CnpjLabel.Caption := 'Cpf';
    Label7.Caption := 'Data Nascimento';
  end;
  if PessoaComboBox.Text = 'J' then
  begin
    SexoComboBox.Hide;
    Label15.Hide;
    CnpjLabel.Caption := 'Cnpj';
    Label7.Caption := 'Inscriçao Estadual';
  end;
  if CodigoEdit.Text = '' then
    BitBtn3.Enabled := False
  else
    BitBtn3.Enabled := True;
  if BloqueadoCheckBox.Checked then
  begin
    NomeEdit.Color := clred;
    NFantasiaEdit.Color := clred;
  end
  else
  begin
    NomeEdit.Color := clDefault;
    NFantasiaEdit.Color := clDefault;
  end;
end;

procedure Tfrm_cadastro.search;
begin
  MainForm.MainSQLTransaction.StartTransaction;
  QueryStringGrid.ColCount := 2;
  QueryStringGrid.FixedCols := 0;
  QueryStringGrid.ColWidths[0] := 280;
  QueryStringGrid.ColWidths[1] := 0;
  QueryStringGrid.Cells[0, 0] := 'Apelido';
  QueryStringGrid.Cells[1, 0] := 'ID';
  QueryStringGrid.Options := QueryStringGrid.Options + [gorowselect];
  try
    CadastroSQLQuery.SQL.Text :=
      'SELECT DISTINCT apelido,codigo FROM (select  apelido,nome,codigo   from cadastro c '
      + 'LEFT OUTER join cadastro_contatos e on(e.tcadastroid=c.codigo) ' +
      'where  (c.apelido like ' + quotedstr('%' + SearchEdit.Text + '%') +
      ') or ' + '(c.nome like ' + quotedstr('%' + SearchEdit.Text + '%') +
      ')or (c.cnpj like ' + quotedstr('%' + SearchEdit.Text + '%') +
      ') or ' + '(c.inscricao_estadual like ' + quotedstr('%' + SearchEdit.Text + '%') +
      ')' + 'or (c.fax like ' + quotedstr('%' + SearchEdit.Text + '%') +
      ') or (UPPER(c.site) like ' + quotedstr('%' + SearchEdit.Text + '%') +
      ') or' + ' (UPPER(e.email) like ' + quotedstr('%' + SearchEdit.Text + '%') +
      ') or' + ' (e.telefone like ' + quotedstr('%' + SearchEdit.Text + '%') +
      ') or (UPPER(e.contato) like ' + quotedstr('%' + SearchEdit.Text + '%') +
      ') ' + ' )as foo order by apelido asc';
    CadastroSQLQuery.Open;

    begin
      CadastroSQLQuery.First;
      QueryStringGrid.BeginUpdate;
      try
        QueryStringGrid.RowCount :=
          CadastroSQLQuery.RecordCount + QueryStringGrid.FixedRows;
        while not CadastroSQLQuery.EOF do
        begin
          QueryStringGrid.Cells[1, CadastroSQLQuery.RecNo] :=
            IntToStr(CadastroSQLQuery.FieldByName('codigo').AsInteger);
          QueryStringGrid.Cells[0, CadastroSQLQuery.RecNo] :=
            CadastroSQLQuery.FieldByName('apelido').AsString;
          CadastroSQLQuery.Next;
        end;
      finally
        QueryStringGrid.EndUpdate;
      end;
    end;
    MainForm.MainSQLTransaction.Commit;
  except
    on E: Exception do
    begin
      MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;
end;

//initialization
  //{$i cadastro.lrs}
  // TDisableDefaultDialogError.Register;

end.
