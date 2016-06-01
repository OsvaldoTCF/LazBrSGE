unit Frm_SPEDFiscal;

{$IFDEF FPC}
{$mode objfpc}{$H+}
{$ENDIF}

interface

uses
{$IFNDEF FPC}
  Windows, Messages,
{$ENDIF}
  SysUtils, Variants, Classes, Graphics, Controls, Forms, ACBrEFDBlocos,
  postgres, inifiles, Dialogs, StdCtrls, ACBrSpedFiscal, ExtCtrls, ComCtrls,
  LCLType, EditBtn, ACBrUtil, dateutils, ACBrTXTClass;

type

  { TFrmSPEDFiscal }

  TFrmSPEDFiscal = class(TForm)
    btnB_0: TButton;
    btnB_1: TButton;
    btnB_K: TButton;
    btnB_C: TButton;
    btnB_D: TButton;
    btnB_E: TButton;
    btnB_H: TButton;
    btnError: TButton;
    btnTXT: TButton;
    btnB_9: TButton;
    cbConcomitante: TCheckBox;
    ComboBoxPerfil: TComboBox;
    ComboBoxVersao: TComboBox;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    edBufNotas: TEdit;
    edNotas: TEdit;
    edBufLinhas: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    memoError: TMemo;
    edtFile: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    memoTXT: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    ProgressBar1: TProgressBar;
    ACBrSPEDFiscal1: TACBrSPEDFiscal;
    btnB_G: TButton;
    btnB_Completo: TButton;
    procedure btnB_0Click(Sender: TObject);
    procedure btnB_9Click(Sender: TObject);
    procedure btnB_KClick(Sender: TObject);
    procedure btnTXTClick(Sender: TObject);
    procedure btnB_1Click(Sender: TObject);
    procedure btnB_CClick(Sender: TObject);
    procedure btnB_DClick(Sender: TObject);
    procedure btnB_EClick(Sender: TObject);
    procedure btnB_HClick(Sender: TObject);
    procedure btnErrorClick(Sender: TObject);
    procedure edtFileChange(Sender: TObject);
    procedure cbConcomitanteClick(Sender: TObject);
    procedure ACBrSPEDFiscal1Error(const MsnError: ansistring);
    procedure btnB_CompletoClick(Sender: TObject);
    procedure btnB_GClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure LoadToMemo;
    { Private declarations }
  public
    procedure MsgError(const AClassName, AMsg: string);
  end;

var
  FrmSPEDFiscal: TFrmSPEDFiscal;

implementation

uses  MainFrm;

{$IFDEF FPC}
{$R *.lfm}
{$ELSE}
{$R *.dfm}

{$ENDIF}

procedure TFrmSPEDFiscal.ACBrSPEDFiscal1Error(const MsnError: ansistring);
begin
  memoError.Lines.Add(MsnError);
end;

procedure TFrmSPEDFiscal.btnB_0Click(Sender: TObject);

const
  strUNID: array [0 .. 4] of string = ('PC', 'UN', 'LT', 'PC', 'MT');

var
  int0150: integer;
  int0175: integer;
  int0300: integer;
  int0190: integer;
  int0500: integer;
  int0600: integer;
  conn: PPGConn;
  Res: PPGResult;
  x, y: longint;
  ArquivoIni, host, port, banco, sql, scnpj, sie: string;
  ArqIni: TIniFile;

begin
  // Alimenta o componente com informações para gerar todos os registros do
  // Bloco 0.
  try
    ArquivoIni := ExtractFilePath(ParamStr(0)) + 'config.ini';
    ArqIni := TIniFile.Create(ArquivoIni);
    host := PChar(ArqIni.ReadString('DataBase', 'servidor', ''));
    port := '5432';
    banco := PChar(ArqIni.ReadString('DataBase', 'base', ''));


    ArqIni.Free;
    sql :=
      'select razao_social,nome_fantasia_1,cnpj,ie,cep,endereco,numero,bairro,fone,email,uf,codigo from empresa where codigo =1'
    ;
    //PQsetdbLogin(pghost:Pchar; pgport:Pchar; pgoptions:Pchar; pgtty:Pchar; dbName:Pchar;login:Pchar; pwd:Pchar)
    conn := PQsetdbLogin(PChar(host), PChar(port),
      nil, nil, PChar(banco), PChar(mainform.Usuario), PChar(mainform.Senha));
    Res := PQExec(conn, PChar(sql));
    if (PQresultStatus(res) = PGRES_FATAL_ERROR) then
    begin
      raise Exception.Create(PQerrorMessage(conn));
      PQfinish(conn);
    end;
    cbConcomitante.Enabled := False;
    btnB_0.Enabled := False;
    btnB_C.Enabled := True;

    //Definindo
    with ACBrSPEDFiscal1 do
    begin
      DT_INI := DateEdit1.Date;
      DT_FIN := DateEdit2.Date;
    end;

    if cbConcomitante.Checked then
    begin
      //with ACBrSPEDFiscal1. do
     // begin
        //      DT_INI := StrToDate('01/11/2011');
        //      DT_FIN := StrToDate('30/11/2011');
        ACBrSPEDFiscal1.LinhasBuffer := StrToIntDef(edBufLinhas.Text, 0);

        ACBrSPEDFiscal1.IniciaGeracao;
      //end;

     // LoadToMemo;
    end;

    //with ACBrSPEDFiscal1.Bloco_0. do
    //begin
      // Dados da Empresa
      //with Registro0000New. do
      //begin
        if (ComboBoxVersao.ItemIndex=0) then
        ACBrSPEDFiscal1.Bloco_0.Registro0000New.COD_VER := vlVersao100;
        if (ComboBoxVersao.ItemIndex=1) then
        ACBrSPEDFiscal1.Bloco_0.Registro0000New.COD_VER := vlVersao101;
        if (ComboBoxVersao.ItemIndex=2) then
        ACBrSPEDFiscal1.Bloco_0.Registro0000New.COD_VER := vlVersao102;
        if (ComboBoxVersao.ItemIndex=3) then
        ACBrSPEDFiscal1.Bloco_0.Registro0000New.COD_VER := vlVersao103;
        if (ComboBoxVersao.ItemIndex=4) then
        ACBrSPEDFiscal1.Bloco_0.Registro0000New.COD_VER := vlVersao104;
        if (ComboBoxVersao.ItemIndex=5) then
        ACBrSPEDFiscal1.Bloco_0.Registro0000New.COD_VER := vlVersao105;
        if (ComboBoxVersao.ItemIndex=6) then
        ACBrSPEDFiscal1.Bloco_0.Registro0000New.COD_VER := vlVersao106;
        if (ComboBoxVersao.ItemIndex=7) then
        ACBrSPEDFiscal1.Bloco_0.Registro0000New.COD_VER := vlVersao107;
        if (ComboBoxVersao.ItemIndex=8) then
        ACBrSPEDFiscal1.Bloco_0.Registro0000New.COD_VER := vlVersao108;
        if (ComboBoxVersao.ItemIndex=9) then
        ACBrSPEDFiscal1.Bloco_0.Registro0000New.COD_VER := vlVersao109;

        ACBrSPEDFiscal1.Bloco_0.Registro0000New.COD_FIN := raOriginal;
        ACBrSPEDFiscal1.Bloco_0.Registro0000New.NOME := PQgetvalue(res, 0, 0);
        scnpj := PQgetvalue(res, 0, 2);
        scnpj := StringReplace(scnpj, '.', '', [rfReplaceAll]);
        scnpj := StringReplace(scnpj, '/', '', [rfReplaceAll]);
        scnpj := StringReplace(scnpj, '-', '', [rfReplaceAll]);
        ACBrSPEDFiscal1.Bloco_0.Registro0000New.CNPJ := scnpj;
        ACBrSPEDFiscal1.Bloco_0.Registro0000New.CPF := '';
        ACBrSPEDFiscal1.Bloco_0.Registro0000New.UF := PQgetvalue(res, 0, 10);
        sie := PQgetvalue(res, 0, 3);
        sie := StringReplace(sie, '.', '', [rfReplaceAll]);
        ACBrSPEDFiscal1.Bloco_0.Registro0000New.IE := sie;
        ACBrSPEDFiscal1.Bloco_0.Registro0000New.COD_MUN := 3203;
        ACBrSPEDFiscal1.Bloco_0.Registro0000New.IM := '168';
        ACBrSPEDFiscal1.Bloco_0.Registro0000New.SUFRAMA := '';
        // simples nao preenche C170, C370, e C470
        // todos campos icms=0   e nao preencher bloco G
        if(ComboBoxPerfil.ItemIndex=0)then
        ACBrSPEDFiscal1.Bloco_0.Registro0000New.IND_PERFIL := pfPerfilA;
        if(ComboBoxPerfil.ItemIndex=1)then
        ACBrSPEDFiscal1.Bloco_0.Registro0000New.IND_PERFIL := pfPerfilB;
        if(ComboBoxPerfil.ItemIndex=2)then
        ACBrSPEDFiscal1.Bloco_0.Registro0000New.IND_PERFIL := pfPerfilC;

        ACBrSPEDFiscal1.Bloco_0.Registro0000New.IND_ATIV := atIndustrial;
      //end;

      //with Registro0001New. do
      //begin
        ACBrSPEDFiscal1.Bloco_0.Registro0001New.IND_MOV := imComDados;

        // FILHO - Dados complementares da Empresa
       // with Registro0005New. do
       // begin
          ACBrSPEDFiscal1.Bloco_0.Registro0005New.FANTASIA := PQgetvalue(res, 0, 1);
          ACBrSPEDFiscal1.Bloco_0.Registro0005New.CEP := StringReplace(PQgetvalue(res, 0, 4), '-', '', [rfReplaceAll]);

          ACBrSPEDFiscal1.Bloco_0.Registro0005New.ENDERECO := PQgetvalue(res, 0, 5);
          ACBrSPEDFiscal1.Bloco_0.Registro0005New.NUM := PQgetvalue(res, 0, 6);
          ACBrSPEDFiscal1.Bloco_0.Registro0005New.COMPL := '';
          ACBrSPEDFiscal1.Bloco_0.Registro0005New.BAIRRO := PQgetvalue(res, 0, 7);
          ACBrSPEDFiscal1.Bloco_0.Registro0005New.FONE := PQgetvalue(res, 0, 8);
          ACBrSPEDFiscal1.Bloco_0.Registro0005New.FAX := '';
          ACBrSPEDFiscal1.Bloco_0.Registro0005New.EMAIL := PQgetvalue(res, 0, 9);
       // end;

        //      with Registro0015New do
        //      begin
        //        UF_ST := 'SC';
        //        IE_ST := '254504230';
        //      end;

        // FILHO - Dados do contador.
        //with Registro0100New. do
        //begin
          ACBrSPEDFiscal1.Bloco_0.Registro0100New.NOME := 'CONTADORES LTDA';
          // CPF := '12345678909'; // Deve ser uma informação valida
          ACBrSPEDFiscal1.Bloco_0.Registro0100New.CRC := '65';
          ACBrSPEDFiscal1.Bloco_0.Registro0100New.CNPJ := '077';
          ACBrSPEDFiscal1.Bloco_0.Registro0100New.CEP := '2990';
          ACBrSPEDFiscal1.Bloco_0.Registro0100New.ENDERECO := 'RUA ';
          ACBrSPEDFiscal1.Bloco_0.Registro0100New.NUM := '10';
          ACBrSPEDFiscal1.Bloco_0.Registro0100New.COMPL := '';
          ACBrSPEDFiscal1.Bloco_0.Registro0100New.BAIRRO := 'CENTRO';
          ACBrSPEDFiscal1.Bloco_0.Registro0100New.FONE := '(2)34';
          ACBrSPEDFiscal1.Bloco_0.Registro0100New.FAX := '';
          ACBrSPEDFiscal1.Bloco_0.Registro0100New.EMAIL := 'nfe@.cnt.br';
          ACBrSPEDFiscal1.Bloco_0.Registro0100New.COD_MUN := 32;
        //end;
        // Check(Reg0001.Registro0190.LocalizaRegistro(UNID), '(0-0190) UNIDADE MEDIDA: A unidade de medida "%s" foi duplicada na lista de registros 0190!', [UNID]);

        PQclear(res);
        sql := 'select *  from lancamento_notas_fiscais_itens '+
        'INNER JOIN '+
        'lancamento_notas_fiscais ON lancamento_notas_fiscais_itens.lancamento_notas_fiscais_id = lancamento_notas_fiscais.id '+
        'where ide_demi between '+FormatDateTime('YYYY-MM-DD',DateEdit1.Date)+
        ' and '+FormatDateTime('YYYY-MM-DD',DateEdit2.Date)+ ' order by ide_demi asc';
        res := PQExec(conn, PChar(sql));

     for x := 0 to PQntuples(Res) - 1 do   // linhas
    begin
      for y := 0 to PQnfields(Res) - 1 do // colunas (campos)
      begin
        // FILHO
       // for int0150 := 1 to 10 do
     //   begin
          // 10 Clientes
          //with Registro0150New. do
          //begin
            ACBrSPEDFiscal1.Bloco_0.Registro0150New.COD_PART := PQgetvalue(res, x, PQfnumber(res,'nfantasiaid'));  // id cadastro
            ACBrSPEDFiscal1.Bloco_0.Registro0150New.NOME := PQgetvalue(res, x, PQfnumber(res,'')); //razao social /nome
            {if int0150 = 9 then //um exemplo de cliente no exterior.
            begin
              ACBrSPEDFiscal1.Bloco_0.Registro0150New.COD_PAIS := '3131'; //GUAM
              ACBrSPEDFiscal1.Bloco_0.Registro0150New.CNPJ := '';
              ACBrSPEDFiscal1.Bloco_0.Registro0150New.CPF := '';
              //            COD_MUN := 43140070 + int0150; //O código do município é deixado de fora propositalmente. O componente vai fazê-lo ficar vazio
            end }
            scnpj := PQgetvalue(res, x, PQfnumber(res,''));
            scnpj := StringReplace(scnpj, '.', '', [rfReplaceAll]);
            scnpj := StringReplace(scnpj, '/', '', [rfReplaceAll]);
            scnpj := StringReplace(scnpj, '-', '', [rfReplaceAll]);
            sie := PQgetvalue(res, x, PQfnumber(res,''));
            sie := StringReplace(sie, '.', '', [rfReplaceAll]);
            sie := StringReplace(sie, '-', '', [rfReplaceAll]);


            if Length(scnpj)=11 then // se cpf
            begin
            ACBrSPEDFiscal1.Bloco_0.Registro0150New.CNPJ := '';
            ACBrSPEDFiscal1.Bloco_0.Registro0150New.CPF := scnpj;
            end else
            begin   //cnpj
            ACBrSPEDFiscal1.Bloco_0.Registro0150New.CNPJ := scnpj;
            ACBrSPEDFiscal1.Bloco_0.Registro0150New.CPF := '';
            ACBrSPEDFiscal1.Bloco_0.Registro0150New.IE := sie;
            end;

             ACBrSPEDFiscal1.Bloco_0.Registro0150New.COD_PAIS := PQgetvalue(res, x, PQfnumber(res,'')); //1058';
             ACBrSPEDFiscal1.Bloco_0.Registro0150New.COD_MUN := strtoint(PQgetvalue(res, x, PQfnumber(res,'')));
             ACBrSPEDFiscal1.Bloco_0.Registro0150New.SUFRAMA := PQgetvalue(res, x, PQfnumber(res,''));
             ACBrSPEDFiscal1.Bloco_0.Registro0150New.ENDERECO := PQgetvalue(res, x, PQfnumber(res,''));
             ACBrSPEDFiscal1.Bloco_0.Registro0150New.NUM := PQgetvalue(res, x, PQfnumber(res,''));
             ACBrSPEDFiscal1.Bloco_0.Registro0150New.COMPL := PQgetvalue(res, x, PQfnumber(res,''));
             ACBrSPEDFiscal1.Bloco_0.Registro0150New.BAIRRO := PQgetvalue(res, x, PQfnumber(res,''));

            // FILHO - 1 Alteração para cada cliente de 2 a 3
           {if (int0150 = 2) or (int0150 = 3) then
            begin
              //with Registro0175New. do
              //begin
                ACBrSPEDFiscal1.Bloco_0.Registro0175New.DT_ALT := ACBrSPEDFiscal1.Bloco_0.DT_INI + 1;
                ACBrSPEDFiscal1.Bloco_0.Registro0175New.NR_CAMPO := '1';
                ACBrSPEDFiscal1.Bloco_0.Registro0175New.CONT_ANT := 'CAMPO ANTERIOR ' + '1';
             // end;
            end;      }
          end;
        end;

        // FILHO
        // 4 Unidades de medida
        // Const strUNID, esta declarada no inicio deste evento.
        for int0190 := Low(strUNID) to High(strUNID) do
        begin
          if not ACBrSPEDFiscal1.Bloco_0.Registro0001New.Registro0190.LocalizaRegistro(strUNID[int0190]) then
          begin
           // with Registro0190New. do
            //begin
              ACBrSPEDFiscal1.Bloco_0.Registro0190New.UNID := strUNID[int0190];
              ACBrSPEDFiscal1.Bloco_0.Registro0190New.DESCR := 'Descricao ' + strUNID[int0190];
            //end;
          end;
        end;

        //with Registro0200New. do
        //begin
          ACBrSPEDFiscal1.Bloco_0.Registro0200New.COD_ITEM := '000001';
          ACBrSPEDFiscal1.Bloco_0.Registro0200New.DESCR_ITEM := 'PRODUTO 1';
          ACBrSPEDFiscal1.Bloco_0.Registro0200New.COD_BARRA := '';
          ACBrSPEDFiscal1.Bloco_0.Registro0200New.UNID_INV := 'UN';
          ACBrSPEDFiscal1.Bloco_0.Registro0200New.TIPO_ITEM := tiMercadoriaRevenda;
          ACBrSPEDFiscal1.Bloco_0.Registro0200New.COD_NCM := '30049026';
          ACBrSPEDFiscal1.Bloco_0.Registro0200New.COD_GEN := '30';
          ACBrSPEDFiscal1.Bloco_0.Registro0200New.ALIQ_ICMS := 2.42;

          //REGISTRO 0206: CÓDIGO DE PRODUTO CONFORME TABELA PUBLICADA PELA ANP (COMBUSTÍVEIS)
          //        With Registro0206New do
          //        begin
          //          COD_COMB := '910101001';
          //        end;
        //end;

        // FILHO
        for int0300 := 1 to 10 do
        begin
          // 10 Bens Imobilizados
          //with Registro0300New. do
          //begin
            ACBrSPEDFiscal1.Bloco_0.Registro0300New.COD_IND_BEM := FormatFloat('000000', int0300);
            ACBrSPEDFiscal1.Bloco_0.Registro0300New.IDENT_MERC := 1;
            ACBrSPEDFiscal1.Bloco_0.Registro0300New.DESCR_ITEM := 'DESCRIÇÃO DO ITEM';
            ACBrSPEDFiscal1.Bloco_0.Registro0300New.COD_PRNC := '';
            ACBrSPEDFiscal1.Bloco_0.Registro0300New.COD_CTA := '';
            ACBrSPEDFiscal1.Bloco_0.Registro0300New.NR_PARC := 10;
            // FILHO
            //with Registro0305New. do
            //begin
              ACBrSPEDFiscal1.Bloco_0.Registro0305New.COD_CCUS := '1';
              //            FUNC := 'BREVE DESCRIÇÃO DA FUNÇÃO DO IMOBILIZADO ' +FormatFloat('000000', int0300);;
              ACBrSPEDFiscal1.Bloco_0.Registro0305New.VIDA_UTIL := 60;
            //end;
         // end;
        end;

       // with Registro0400New. do
        //begin
          ACBrSPEDFiscal1.Bloco_0.Registro0400New.COD_NAT := '12020';
          ACBrSPEDFiscal1.Bloco_0.Registro0400New.DESCR_NAT := 'DESCRIÇÃO DA NATUREZA DE OPERAÇÃO 12020';
        //end;

       // with Registro0450New. do
        //begin
          ACBrSPEDFiscal1.Bloco_0.Registro0450New.COD_INF := '000001';
          ACBrSPEDFiscal1.Bloco_0.Registro0450New.TXT := 'INFORMAÇÃO COMPLEMENTAR DO DOCUMENTO FISCAL';
        //end;

       // with Registro0460New. do
       // begin
          ACBrSPEDFiscal1.Bloco_0.Registro0460New.COD_OBS := '000001';
          ACBrSPEDFiscal1.Bloco_0.Registro0460New.TXT := 'TEXTO DE OBSERVAÇÃO DO DOCUMENTO FISCAL ';
        //end;

        for int0500 := 1 to 10 do
        begin
         // with Registro0500New. do
          //begin
            ACBrSPEDFiscal1.Bloco_0.Registro0500New.DT_ALT := StrToDate('30/11/2011');
            ACBrSPEDFiscal1.Bloco_0.Registro0500New.COD_NAT_CC := '01';
            ACBrSPEDFiscal1.Bloco_0.Registro0500New.IND_CTA := 'A';
            ACBrSPEDFiscal1.Bloco_0.Registro0500New.NIVEL := '1';
            ACBrSPEDFiscal1.Bloco_0.Registro0500New.COD_CTA := IntToStr(int0500);
            ACBrSPEDFiscal1.Bloco_0.Registro0500New.NOME_CTA := 'CONTA CONTÁBIL ' + IntToStr(int0500);
          //end;
        end;

        for int0600 := 1 to 10 do
        begin
          //with Registro0600New. do
         // begin
            ACBrSPEDFiscal1.Bloco_0.Registro0600New.DT_ALT := StrToDate('30/11/2011');
            ACBrSPEDFiscal1.Bloco_0.Registro0600New.COD_CCUS := IntToStr(int0600);
            ACBrSPEDFiscal1.Bloco_0.Registro0600New.CCUS := 'CENTRO DE CUSTOS ' + IntToStr(int0600);
         // end;
        end;
     // end;
      //end;
    //end;
    //end;
    //end;

    if cbConcomitante.Checked then
    begin
      ACBrSPEDFiscal1.WriteBloco_0;
      LoadToMemo;
    end;



  except
    on E: Exception do
    begin
      // MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;
  PQfinish(conn);
end;

procedure TFrmSPEDFiscal.btnB_9Click(Sender: TObject);
begin
  btnB_9.Enabled := False;
  ACBrSPEDFiscal1.WriteBloco_9;
  LoadToMemo;

  // Habilita os botões
  btnB_0.Enabled := True;
  btnB_1.Enabled := True;
  btnB_C.Enabled := True;
  btnB_D.Enabled := True;
  btnB_E.Enabled := True;
  btnB_G.Enabled := True;
  btnB_H.Enabled := True;
  btnB_K.Enabled := True;

  cbConcomitante.Enabled := True;
end;

procedure TFrmSPEDFiscal.btnB_KClick(Sender: TObject);
var
  conn: PPGConn;
  Res: PPGResult;
  x, y: longint;
  ArquivoIni, host, port, banco, sql, scnpj, sie: string;
  ArqIni: TIniFile;
begin
  btnB_k.Enabled := False;
  btnB_9.Enabled := cbConcomitante.Checked;

   try
    ArquivoIni := ExtractFilePath(ParamStr(0)) + 'config.ini';
    ArqIni := TIniFile.Create(ArquivoIni);
    host := PChar(ArqIni.ReadString('DataBase', 'servidor', ''));
    port := '5432';
    banco := PChar(ArqIni.ReadString('DataBase', 'base', ''));


    ArqIni.Free;
  //  sql:='sselect * from lancamento_notas_fiscais where dt_emis between '+FormatDateTime('YYYY/MM/DD',DateEdit1.Date)+' and '+FormatDateTime('YYYY/MM/DD',DateEdit2.Date)+' order by ide_demi asc' ;
    //PQsetdbLogin(pghost:Pchar; pgport:Pchar; pgoptions:Pchar; pgtty:Pchar; dbName:Pchar;login:Pchar; pwd:Pchar)
    conn := PQsetdbLogin(PChar(host), PChar(port),
      nil, nil, PChar(banco), PChar(mainform.Usuario), PChar(mainform.Senha));
    Res := PQExec(conn, PChar(sql));
    if (PQresultStatus(res) = PGRES_FATAL_ERROR) then
    begin
      raise Exception.Create(PQerrorMessage(conn));
      PQfinish(conn);
    end;



  // Alimenta o componente com informações para gerar todos os registros do Bloco 1.
  //with ACBrSPEDFiscal1.Bloco_K. do
  // begin
  // with ACBrSPEDFiscal1.Bloco_K.RegistroK001New. do
  //begin
  ACBrSPEDFiscal1.Bloco_K.RegistroK001New.IND_MOV := imComDados;


     for x := 0 to PQntuples(Res) - 1 do   // linhas
    begin
      for y := 0 to PQnfields(Res) - 1 do // colunas (campos)
      begin


  //with ACBrSPEDFiscal1.Bloco_K.RegistroK100New. do
  //begin
  //DT_INI:= strtodate('01/01/2014');
  //DT_FIN:= StrToDate('31/01/2014');
  ACBrSPEDFiscal1.Bloco_K.RegistroK100New.DT_INI := DateEdit1.Date;
  ACBrSPEDFiscal1.Bloco_K.RegistroK100New.DT_FIN := DateEdit2.Date;
  //with ACBrSPEDFiscal1.Bloco_K.RegistroK200New. do
  // begin
  // DT_EST := StrToDate('01/01/2014');
  ACBrSPEDFiscal1.Bloco_K.RegistroK200New.DT_EST := DateEdit1.Date;
  ACBrSPEDFiscal1.Bloco_K.RegistroK200New.COD_ITEM := '0001';
  ACBrSPEDFiscal1.Bloco_K.RegistroK200New.QTD := 1;
  ACBrSPEDFiscal1.Bloco_K.RegistroK200New.IND_EST := estPropInformantePoder;
  ACBrSPEDFiscal1.Bloco_K.RegistroK200New.COD_PART := '0001';
  // end;
  //end;
 end;
  end;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDFiscal1.WriteBloco_K;
    LoadToMemo;
  end;



 except
   on E: Exception do
   begin
     // MainForm.MainSQLTransaction.Rollback;
     MsgError(E.ClassName, E.Message);
   end;
 end;
 PQfinish(conn);

end;

procedure TFrmSPEDFiscal.btnTXTClick(Sender: TObject);
begin
  btnTXT.Enabled := False;

  ACBrSPEDFiscal1.LinhasBuffer := StrToIntDef(edBufLinhas.Text, 0);

  with ACBrSPEDFiscal1 do
  begin
    // DT_INI := StrToDate('01/11/2011');
    // DT_FIN := StrToDate('30/11/2011');
    DT_INI := DateEdit1.Date;
    DT_FIN := DateEdit2.Date;
  end;

  // Limpa a lista de erros.
  memoError.Lines.Clear;
  // Informa o pata onde será salvo o arquivo TXT.
  ACBrSpedFiscal1.Path := ExtractFilePath(Application.ExeName) + '/temp';

  // Método que gera o arquivo TXT.
  ACBrSPEDFiscal1.SaveFileTXT;

  // Carrega o arquivo TXT no memo.
  LoadToMemo();
  // memoTXT.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+'temp/' + ACBrSPEDFiscal1.Arquivo);

  // Habilita os botões
  btnB_0.Enabled := True;
  btnTXT.Enabled := True;
  cbConcomitante.Enabled := True;
  ShowMessage('Arquivo gerado com sucesso');
end;

procedure TFrmSPEDFiscal.btnErrorClick(Sender: TObject);
begin
  with ACBrSPEDFiscal1 do
  begin
    //DT_INI := StrToDate('01/07/2011');
    // DT_FIN := StrToDate('01/07/2011');
    DT_INI := DateEdit1.Date;
    DT_FIN := DateEdit2.Date;
  end;

  // Limpa a lista de erros.
  memoError.Lines.Clear;

  // Método que gera o arquivo TXT.
  ACBrSPEDFiscal1.SaveFileTXT;

  // Habilita os botões
  btnB_0.Enabled := True;
  btnB_1.Enabled := True;
  btnB_C.Enabled := True;
  btnB_D.Enabled := True;
  btnB_E.Enabled := True;
  btnB_H.Enabled := True;
  btnB_K.Enabled := True;
end;

procedure TFrmSPEDFiscal.btnB_1Click(Sender: TObject);
begin
  btnB_1.Enabled := False;
  btnB_9.Enabled := cbConcomitante.Checked;

  // Alimenta o componente com informações para gerar todos os registros do Bloco 1.
  //with ACBrSPEDFiscal1.Bloco_1. do
  // begin
  //with ACBrSPEDFiscal1.Bloco_1.Registro1001New. do
  //begin
  ACBrSPEDFiscal1.Bloco_1.Registro1001New.IND_MOV := imComDados;

  // with ACBrSPEDFiscal1.Bloco_1.Registro1010New. do
  // begin
  ACBrSPEDFiscal1.Bloco_1.Registro1010New.IND_EXP := 'N';
  // Reg. 1100 - Ocorreu averbação (conclusão) de exportação no período:
  ACBrSPEDFiscal1.Bloco_1.Registro1010New.IND_CCRF := 'N';
  // Reg. 1200 – Existem informações acerca de créditos de ICMS a serem controlados, definidos pela Sefaz:
  ACBrSPEDFiscal1.Bloco_1.Registro1010New.IND_COMB := 'N';
  // Reg. 1300 – É comercio varejista de combustíveis:
  ACBrSPEDFiscal1.Bloco_1.Registro1010New.IND_USINA := 'N';
  // Reg. 1390 – Usinas de açúcar e/álcool – O estabelecimento é produtor de açúcar e/ou álcool carburante:
  ACBrSPEDFiscal1.Bloco_1.Registro1010New.IND_VA := 'N';
  // Reg. 1400 – Existem informações a serem prestadas neste registro e o registro é obrigatório em sua Unidade da Federação:
  ACBrSPEDFiscal1.Bloco_1.Registro1010New.IND_EE := 'N';
  // Reg. 1500 - A empresa é distribuidora de energia e ocorreu fornecimento de energia elétrica para consumidores de outra UF:
  ACBrSPEDFiscal1.Bloco_1.Registro1010New.IND_CART := 'N';
  // Reg. 1600 - Realizou vendas com Cartão de Crédito ou de débito:
  ACBrSPEDFiscal1.Bloco_1.Registro1010New.IND_FORM := 'N';
  // Reg. 1700 - É obrigatório em sua unidade da federação o controle de utilização de documentos  fiscais em papel:
  ACBrSPEDFiscal1.Bloco_1.Registro1010New.IND_AER := 'N';
  // Reg. 1800 – A empresa prestou serviços de transporte aéreo de cargas e de passageiros:
  // end;
  // end;
  // end;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDFiscal1.WriteBloco_1;
    LoadToMemo;
  end;
end;

procedure TFrmSPEDFiscal.btnB_CClick(Sender: TObject);
var
  INotas: integer;
  IItens: integer;
  NNotas: integer;
  BNotas: integer;
  conn: PPGConn;
  Res: PPGResult;
  x, y: longint;
  ArquivoIni, host, port, banco, sql, scnpj, sie: string;
  ArqIni: TIniFile;

begin
  // Alimenta o componente com informações para gerar todos os registros do
  // Bloco C.
  btnB_C.Enabled := False;
  btnB_D.Enabled := True;


  try
    ArquivoIni := ExtractFilePath(ParamStr(0)) + 'config.ini';
    ArqIni := TIniFile.Create(ArquivoIni);
    host := PChar(ArqIni.ReadString('DataBase', 'servidor', ''));
    port := '5432';
    banco := PChar(ArqIni.ReadString('DataBase', 'base', ''));


    ArqIni.Free;
    sql:='sselect * from lancamento_notas_fiscais where dt_emis between '+FormatDateTime('YYYY/MM/DD',DateEdit1.Date)+' and '+FormatDateTime('YYYY/MM/DD',DateEdit2.Date)+' order by ide_demi asc' ;
    //PQsetdbLogin(pghost:Pchar; pgport:Pchar; pgoptions:Pchar; pgtty:Pchar; dbName:Pchar;login:Pchar; pwd:Pchar)
    conn := PQsetdbLogin(PChar(host), PChar(port),
      nil, nil, PChar(banco), PChar(mainform.Usuario), PChar(mainform.Senha));
    Res := PQExec(conn, PChar(sql));
    if (PQresultStatus(res) = PGRES_FATAL_ERROR) then
    begin
      raise Exception.Create(PQerrorMessage(conn));
      PQfinish(conn);
    end;



    //  NNotas := StrToInt64Def(edNotas.Text, 1);
    //  BNotas := StrToInt64Def(edBufNotas.Text, 1);
    for x := 0 to PQntuples(Res) - 1 do   // linhas
    begin
      for y := 0 to PQnfields(Res) - 1 do // colunas (campos)
      begin

        ProgressBar1.Visible := cbConcomitante.Checked;
        ProgressBar1.Max := PQntuples(Res);
        ProgressBar1.Position := x;

        // with ACBrSPEDFiscal1.Bloco_C. do
        //begin
        //with RegistroC001New do
        //begin
        ACBrSPEDFiscal1.Bloco_C.RegistroC001New.IND_MOV := imComDados;

        //for INotas := 1 to PQntuples(Res) do
       // begin
          // with RegistroC100New do
          // begin
           if (PQgetvalue(res, x, PQfnumber(res,'ide_tpnf'))='0'    ) then
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.IND_OPER := tpEntradaAquisicao;
          if (PQgetvalue(res, x, PQfnumber(res,'ide_tpnf'))='1'    ) then
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.IND_OPER := tpSaidaPrestacao;

           //propria é do estabelecimento
          // terceiros é de fornecedores e outros
          //Só pra variar a emissão entre própria e de terceiros
          //if Odd(INotas) then IND_EMIT := edEmissaoPropria
          //else IND_EMIT := edTerceiros;

          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.COD_PART := '001';
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.COD_MOD := PQgetvalue(res, x, PQfnumber(res,'ide_mod'));
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.COD_SIT := sdRegular;
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.SER := PQgetvalue(res, x, PQfnumber(res,'ide_serie'));
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.NUM_DOC := PQgetvalue(res, x, PQfnumber(res,'ide_nnf'));
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.CHV_NFE := PQgetvalue(res, x, PQfnumber(res,'chave_acesso'));
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.DT_DOC := strtodate(FormatDateTime('DDMMYYYY',StrToDate(PQgetvalue(res, x, PQfnumber(res,'ide_demi')))));
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.DT_E_S :=strtodate(FormatDateTime('DDMMYYYY',StrToDate(PQgetvalue(res, x, PQfnumber(res,'ide_dsaient')))));
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.VL_DOC := strtocurr(PQgetvalue(res, x, PQfnumber(res,'vnf')));
          if (PQgetvalue(res, x, PQfnumber(res,'ide_indpag'))='0') then
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.IND_PGTO := tpVista;
          if (PQgetvalue(res, x, PQfnumber(res,'ide_indpag'))='1') then
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.IND_PGTO := tpPrazo;
          if (PQgetvalue(res, x, PQfnumber(res,'ide_indpag'))='2') then
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.IND_PGTO := tpOutros;
          if (PQgetvalue(res, x, PQfnumber(res,'ide_indpag'))='') then
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.IND_PGTO := tpNenhum;
          if (PQgetvalue(res, x, PQfnumber(res,'ide_indpag'))='9') then
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.IND_PGTO := tpSemPagamento;

          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.VL_DESC := 0;
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.VL_ABAT_NT := 0;
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.VL_MERC := strtocurr(PQgetvalue(res, x, PQfnumber(res,'icmstot_vprod')));

          if (PQgetvalue(res, x, PQfnumber(res,'transp_modfrete'))='0') then
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.IND_FRT := tfPorContaEmitente;
          if (PQgetvalue(res, x, PQfnumber(res,'transp_modfrete'))='1') then
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.IND_FRT := tfPorContaDestinatario;
          if (PQgetvalue(res, x, PQfnumber(res,'transp_modfrete'))='2') then
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.IND_FRT := tfPorContaTerceiros;
          if (PQgetvalue(res, x, PQfnumber(res,'transp_modfrete'))='9') then
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.IND_FRT := tfSemCobrancaFrete;
          if (PQgetvalue(res, x, PQfnumber(res,'transp_modfrete'))='') then
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.IND_FRT := tfNenhum;

          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.VL_SEG := strtocurr(PQgetvalue(res, x, PQfnumber(res,'icmstot_vSeg')));
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.VL_OUT_DA := strtocurr(PQgetvalue(res, x, PQfnumber(res,'icmstot_vOutroda')));
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.VL_BC_ICMS := strtocurr(PQgetvalue(res, x, PQfnumber(res,'icmstot_vbc')));
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.VL_ICMS := strtocurr(PQgetvalue(res, x, PQfnumber(res,'icmstot_vicms')));
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.VL_BC_ICMS_ST := strtocurr(PQgetvalue(res, x, PQfnumber(res,'icmstot_vbcst')));
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.VL_ICMS_ST := strtocurr(PQgetvalue(res, x, PQfnumber(res,'icmstot_vst')));
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.VL_IPI := strtocurr(PQgetvalue(res, x, PQfnumber(res,'icmstot_vipi')));
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.VL_PIS := strtocurr(PQgetvalue(res, x, PQfnumber(res,'icmstot_vpis')));
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.VL_COFINS := strtocurr(PQgetvalue(res, x, PQfnumber(res,'icmstot_vcofins')));
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.VL_PIS_ST := strtocurr(PQgetvalue(res, x, PQfnumber(res,'icmstot_vpisst')));
          ACBrSPEDFiscal1.Bloco_C.RegistroC100New.VL_COFINS_ST := strtocurr(PQgetvalue(res, x, PQfnumber(res,'icmstot_vcofinsst')));


          { Gera registros específicos para notas emitidas por terceiros }
        {  if ACBrSPEDFiscal1.Bloco_C.RegistroC100New.IND_EMIT = edTerceiros then
          begin
            //   With RegistroC110New do
            // begin
            ACBrSPEDFiscal1.Bloco_C.RegistroC110New.COD_INF := '000001';
            ACBrSPEDFiscal1.Bloco_C.RegistroC110New.TXT_COMPL := '';

            // with RegistroC113New do
            //begin
            ACBrSPEDFiscal1.Bloco_C.RegistroC113New.IND_OPER := tpEntradaAquisicao;
            ACBrSPEDFiscal1.Bloco_C.RegistroC113New.IND_EMIT := edEmissaoPropria;
            ACBrSPEDFiscal1.Bloco_C.RegistroC113New.COD_PART := '001';
            ACBrSPEDFiscal1.Bloco_C.RegistroC113New.COD_MOD := '1';
            ACBrSPEDFiscal1.Bloco_C.RegistroC113New.SER := '1';
            ACBrSPEDFiscal1.Bloco_C.RegistroC113New.SUB := '1';
            ACBrSPEDFiscal1.Bloco_C.RegistroC113New.NUM_DOC := '333';
            ACBrSPEDFiscal1.Bloco_C.RegistroC113New.DT_DOC :=
              StrToDate('02/11/2011');
            //end;
            // end;
          end;    }

          { Gera o registro de importação apenas para notas de entrada }
        {  if IND_OPER = tpEntradaAquisicao then
          begin
            with RegistroC120New do
            begin
              COD_DOC_IMP := diSimplificadaImport;
              NUM_DOC__IMP := '1024879531';
              PIS_IMP := 0.00;
              COFINS_IMP := 0.00;
              NUM_ACDRAW := '';
            end;
          end;  }

          { Gera registros específicos para notas emitidas por terceiros e de prestação }
       {   if (ACBrSPEDFiscal1.Bloco_C.RegistroC100New.IND_EMIT = edTerceiros) and
            (ACBrSPEDFiscal1.Bloco_C.RegistroC100New.IND_OPER =
            tpSaidaPrestacao) then
          begin
            //with RegistroC130New do
            // begin
            ACBrSPEDFiscal1.Bloco_C.RegistroC130New.VL_SERV_NT := 10.12;
            ACBrSPEDFiscal1.Bloco_C.RegistroC130New.VL_BC_ISSQN := 10.12;
            ACBrSPEDFiscal1.Bloco_C.RegistroC130New.VL_ISSQN := 10.12;
            ACBrSPEDFiscal1.Bloco_C.RegistroC130New.VL_BC_IRRF := 10.12;
            ACBrSPEDFiscal1.Bloco_C.RegistroC130New.VL_IRRF := 10.12;
            ACBrSPEDFiscal1.Bloco_C.RegistroC130New.VL_BC_PREV := 10.12;
            ACBrSPEDFiscal1.Bloco_C.RegistroC130New.VL_PREV := 10.12;
            //end;
          end;      }
        end;
      end;
      PQclear(res); // limpa a pesquisa atual

    sql:='sselect * from lancamento_notas_fiscais where dt_emis between '+FormatDateTime('YYYY/MM/DD',DateEdit1.Date)+' and '+FormatDateTime('YYYY/MM/DD',DateEdit2.Date)+' order by ide_demi asc' ;

    res := PQExec(conn, PChar(sql));

    for x := 0 to PQntuples(Res) - 1 do   // linhas
    begin
      for y := 0 to PQnfields(Res) - 1 do // colunas (campos)
      begin
          // REGISTRO C170: ITENS DO DOCUMENTO (CÓDIGO 01, 1B, 04 e 55).
          //for IItens := 1 to 10 do
          //begin
            //   with RegistroC170New do // Inicio Adicionar os Itens:
            //   begin
          {  ACBrSPEDFiscal1.Bloco_C.RegistroC170New.NUM_ITEM :=  FormatFloat('000', PQgetvalue(res, x, PQfnumber(res,'prod_nitem'));
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.COD_ITEM :=  PQgetvalue(res, x, PQfnumber(res,'prod_cprod');//FormatFloat('000000', StrToInt( ACBrSPEDFiscal1.Bloco_C.RegistroC170New.NUM_ITEM));
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.DESCR_COMPL :=  PQgetvalue(res, x, PQfnumber(res,'infadprod'); //FormatFloat('11000000', INotas) + ' -> ITEM ' + ACBrSPEDFiscal1.Bloco_C.RegistroC170New.COD_ITEM;
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.QTD := PQgetvalue(res, x, PQfnumber(res,'infadprod');
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.UNID := 'UN';
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.VL_ITEM := 0;
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.VL_DESC := 0;
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.IND_MOV := mfNao;
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.CST_ICMS := '001';
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.CFOP := '1252';
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.COD_NAT := '64';
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.VL_BC_ICMS := 0;
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.ALIQ_ICMS := 0;
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.VL_ICMS := 0;
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.VL_BC_ICMS_ST := 0;
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.ALIQ_ST := 0;
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.VL_ICMS_ST := 0;
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.IND_APUR := iaMensal;
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.CST_IPI := ipiEntradaIsenta;
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.COD_ENQ := '';
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.VL_BC_IPI := 0;
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.ALIQ_IPI := 0;
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.VL_IPI := 0;
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.CST_PIS := pisOutrasOperacoes;
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.VL_BC_PIS := 0;
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.ALIQ_PIS_PERC := 0;
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.QUANT_BC_PIS := 0;
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.ALIQ_PIS_R := 0;
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.VL_PIS := 0;
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.CST_COFINS :=
              cofinsOutrasOperacoes;
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.VL_BC_COFINS := 0;
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.ALIQ_COFINS_PERC := 0;
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.QUANT_BC_COFINS := 0;
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.ALIQ_COFINS_R := 0;
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.VL_COFINS := 0;
            ACBrSPEDFiscal1.Bloco_C.RegistroC170New.COD_CTA := '000';
             }
            //REGISTRO C171: ARMAZENAMENTO DE COMBUSTIVEIS (código 01, 55)
            { Só gera para operações de aquisição }
            //              if IND_OPER = tpEntradaAquisicao then
            //              begin
            //                with RegistroC171New do
            //                begin
            //                  NUM_TANQUE := '115';
            //                  QTDE := 1.00;
            //                end;
            //              end;

            //REGISTRO C176: RESSARCIMENTO DE ICMS EM OPERAÇÕES COM
            //SUBSTITUIÇÃO TRIBUTÁRIA (CÓDIGO 01, 55).
            //              with RegistroC176New do
            //              begin
            //                COD_MOD_ULT_E := '55';
            //                NUM_DOC_ULT_E := '124567';
            //                SER_ULT_E := '1';
            //                DT_ULT_E := Now;
            //                COD_PART_ULT_E := '000001';
            //                QUANT_ULT_E := 10.00;
            //                VL_UNIT_ULT_E := 1.00;
            //                VL_UNIT_BC_ST := 5.00;
            //              end;
          end; // Fim dos Itens;
          //   end;

          // REGISTRO C190: REGISTRO ANALÍTICO DO DOCUMENTO (CÓDIGO 01, 1B, 04 E 55).
          for IItens := 1 to 10 do
          begin
            // with RegistroC190New do
            // begin
            ACBrSPEDFiscal1.Bloco_C.RegistroC190New.CST_ICMS := PQgetvalue(res, x, PQfnumber(res,'icmscst'));
            ACBrSPEDFiscal1.Bloco_C.RegistroC190New.CFOP := PQgetvalue(res, x, PQfnumber(res,'prod_cfop'));
            ACBrSPEDFiscal1.Bloco_C.RegistroC190New.ALIQ_ICMS := strtocurr(PQgetvalue(res, x, PQfnumber(res,'picms')));
            ACBrSPEDFiscal1.Bloco_C.RegistroC190New.VL_OPR := 0;
            ACBrSPEDFiscal1.Bloco_C.RegistroC190New.VL_BC_ICMS := strtocurr(PQgetvalue(res, x, PQfnumber(res,'icmsbc')));
            ACBrSPEDFiscal1.Bloco_C.RegistroC190New.VL_ICMS := 0;
            ACBrSPEDFiscal1.Bloco_C.RegistroC190New.VL_BC_ICMS_ST := 0;
            ACBrSPEDFiscal1.Bloco_C.RegistroC190New.VL_ICMS_ST := strtocurr(PQgetvalue(res, x, PQfnumber(res,'icmsst')));
            ACBrSPEDFiscal1.Bloco_C.RegistroC190New.VL_RED_BC := 0;
            ACBrSPEDFiscal1.Bloco_C.RegistroC190New.VL_IPI :=  strtocurr(PQgetvalue(res, x, PQfnumber(res,'vipi')));
            ACBrSPEDFiscal1.Bloco_C.RegistroC190New.COD_OBS := '000';
          end; // Fim dos Itens;
          //end;
        end;

        if cbConcomitante.Checked then
        begin
          if (INotas mod BNotas) = 0 then // Gravar a cada N notas
          begin
            // Grava registros na memoria para o TXT, e limpa memoria
            ACBrSPEDFiscal1.WriteBloco_C(False); // False, NAO fecha o Bloco
            ProgressBar1.Position := INotas;
            Application.ProcessMessages;
          end;
        end;
      //end;

      //REGISTRO C400 - EQUIPAMENTO ECF (CÓDIGO 02 e 2D).
      //   With RegistroC400New do
      //  begin
  {    ACBrSPEDFiscal1.Bloco_C.RegistroC400New.COD_MOD := '2D';
      ACBrSPEDFiscal1.Bloco_C.RegistroC400New.ECF_MOD := 'DARUMA FS600';
      ACBrSPEDFiscal1.Bloco_C.RegistroC400New.ECF_FAB := '21098765432123456789';
      ACBrSPEDFiscal1.Bloco_C.RegistroC400New.ECF_CX := '001';

      //  With RegistroC405New do
      // begin
      ACBrSPEDFiscal1.Bloco_C.RegistroC405New.DT_DOC :=
        ACBrSPEDFiscal1.Bloco_C.DT_FIN; //StrToDate('30/11/2011');
      ACBrSPEDFiscal1.Bloco_C.RegistroC405New.CRO := 1;
      ACBrSPEDFiscal1.Bloco_C.RegistroC405New.CRZ := 1;
      ACBrSPEDFiscal1.Bloco_C.RegistroC405New.NUM_COO_FIN := 1;
      ACBrSPEDFiscal1.Bloco_C.RegistroC405New.GT_FIN := 100.00;
      ACBrSPEDFiscal1.Bloco_C.RegistroC405New.VL_BRT := 100.00;

      // With RegistroC410New do
      // begin
      ACBrSPEDFiscal1.Bloco_C.RegistroC410New.VL_PIS := 0.00;
      ACBrSPEDFiscal1.Bloco_C.RegistroC410New.VL_COFINS := 0.00;
      //end;

      //With RegistroC420New do
      // begin
      ACBrSPEDFiscal1.Bloco_C.RegistroC420New.COD_TOT_PAR := 'T1700';
      ACBrSPEDFiscal1.Bloco_C.RegistroC420New.VLR_ACUM_TOT := 100.00;
      ACBrSPEDFiscal1.Bloco_C.RegistroC420New.NR_TOT := 1;
      ACBrSPEDFiscal1.Bloco_C.RegistroC420New.DESCR_NR_TOT := 'TOTALIZADOR T1700';

      { Gera este registro somente para empresas do pergil B de apresentação }
      if ACBrSPEDFiscal1.Bloco_C.Bloco_0.Registro0000.IND_PERFIL = pfPerfilB then
      begin
        // With RegistroC425New do
        // begin
        ACBrSPEDFiscal1.Bloco_C.RegistroC425New.COD_ITEM := '000001';
        ACBrSPEDFiscal1.Bloco_C.RegistroC425New.QTD := 1;
        ACBrSPEDFiscal1.Bloco_C.RegistroC425New.UNID := 'PC';
        ACBrSPEDFiscal1.Bloco_C.RegistroC425New.VL_ITEM := 100.00;
        ACBrSPEDFiscal1.Bloco_C.RegistroC425New.VL_PIS := 0.00;
        ACBrSPEDFiscal1.Bloco_C.RegistroC425New.VL_COFINS := 0.00;
        // end;
      end;
      // end;
       }
      {if ACBrSPEDFiscal1.Bloco_C.Bloco_0.Registro0000.IND_PERFIL <> pfPerfilB then
      begin
        //  with REgistroC460New do
        // begin
        ACBrSPEDFiscal1.Bloco_C.REgistroC460New.COD_MOD := '2D';
        ACBrSPEDFiscal1.Bloco_C.REgistroC460New.COD_SIT := sdRegular;
        ACBrSPEDFiscal1.Bloco_C.REgistroC460New.NUM_DOC := '000001';
        ACBrSPEDFiscal1.Bloco_C.REgistroC460New.DT_DOC := StrToDate('30/11/2011');
        ACBrSPEDFiscal1.Bloco_C.REgistroC460New.VL_DOC := 100.00;
        ACBrSPEDFiscal1.Bloco_C.REgistroC460New.VL_PIS := 0.00;
        ACBrSPEDFiscal1.Bloco_C.REgistroC460New.VL_COFINS := 0.00;
        ACBrSPEDFiscal1.Bloco_C.REgistroC460New.CPF_CNPJ := '33333333333';
        ACBrSPEDFiscal1.Bloco_C.REgistroC460New.NOM_ADQ := 'TESTE';

        // with RegistroC470New do
        // begin
        ACBrSPEDFiscal1.Bloco_C.RegistroC470New.COD_ITEM := '000001';
        ACBrSPEDFiscal1.Bloco_C.RegistroC470New.QTD := 1;
        ACBrSPEDFiscal1.Bloco_C.RegistroC470New.QTD_CANC := 0;
        ACBrSPEDFiscal1.Bloco_C.RegistroC470New.UNID := 'UN';
        ACBrSPEDFiscal1.Bloco_C.RegistroC470New.VL_ITEM := 100.00;
        ACBrSPEDFiscal1.Bloco_C.RegistroC470New.CST_ICMS := '000';
        ACBrSPEDFiscal1.Bloco_C.RegistroC470New.CFOP := '5102';
        ACBrSPEDFiscal1.Bloco_C.RegistroC470New.ALIQ_ICMS := 17.00;
        ACBrSPEDFiscal1.Bloco_C.RegistroC470New.VL_PIS := 0.00;
        ACBrSPEDFiscal1.Bloco_C.RegistroC470New.VL_COFINS := 0.00;
        // end;
        // end;
      end;
         }
      // with RegistroC490New do
      //begin
   {   ACBrSPEDFiscal1.Bloco_C.RegistroC490New.CST_ICMS := '000';
      ACBrSPEDFiscal1.Bloco_C.RegistroC490New.CFOP := '5102';
      ACBrSPEDFiscal1.Bloco_C.RegistroC490New.ALIQ_ICMS := 17.00;
      ACBrSPEDFiscal1.Bloco_C.RegistroC490New.VL_OPR := 100.00;
      ACBrSPEDFiscal1.Bloco_C.RegistroC490New.VL_BC_ICMS := 100.00;
      ACBrSPEDFiscal1.Bloco_C.RegistroC490New.VL_ICMS := 17.00;
      ACBrSPEDFiscal1.Bloco_C.RegistroC490New.COD_OBS := '000001';
      // end;
         }
      { Só envia este registro se o contribuinte for da BA }
   {   if ACBrSPEDFiscal1.Bloco_C.Bloco_0.Registro0000.UF = 'BA' then
      begin
        // with RegistroC495New do
        //begin
        ACBrSPEDFiscal1.Bloco_C.RegistroC495New.ALIQ_ICMS := 17.00;
        ACBrSPEDFiscal1.Bloco_C.RegistroC495New.COD_ITEM := '000001';
        ACBrSPEDFiscal1.Bloco_C.RegistroC495New.QTD := 1.00;
        ACBrSPEDFiscal1.Bloco_C.RegistroC495New.QTD_CANC := 0.00;
        ACBrSPEDFiscal1.Bloco_C.RegistroC495New.UNID := 'UN';
        ACBrSPEDFiscal1.Bloco_C.RegistroC495New.VL_ITEM := 100.00;
        ACBrSPEDFiscal1.Bloco_C.RegistroC495New.VL_DESC := 0.00;
        ACBrSPEDFiscal1.Bloco_C.RegistroC495New.VL_CANC := 0.00;
        ACBrSPEDFiscal1.Bloco_C.RegistroC495New.VL_ACMO := 0.00;
        ACBrSPEDFiscal1.Bloco_C.RegistroC495New.VL_BC_ICMS := 100.00;
        ACBrSPEDFiscal1.Bloco_C.RegistroC495New.VL_ICMS := 17.00;
        ACBrSPEDFiscal1.Bloco_C.RegistroC495New.VL_ISEN := 0.00;
        ACBrSPEDFiscal1.Bloco_C.RegistroC495New.VL_ICMS_ST := 0.00;
        end;  }
        // end;
        //end;
        //end;
        // end;
        //  end;

        // end;
    //  end;
    //end;

    if cbConcomitante.Checked then
    begin
      ACBrSPEDFiscal1.WriteBloco_C(True); // True, fecha o Bloco
      LoadToMemo;
    end;

    ProgressBar1.Visible := False;
    //end;
    //  end;




  except
    on E: Exception do
    begin
      // MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;
  PQfinish(conn);
end;

procedure TFrmSPEDFiscal.btnB_CompletoClick(Sender: TObject);
begin
  btnB_0Click(Self);
  btnB_CClick(Self);
  btnB_DClick(Self);
  btnB_EClick(Self);
  btnB_GClick(Self);
  btnB_HClick(Self);
  btnB_KClick(Self);
  btnB_1Click(Self);

end;

procedure TFrmSPEDFiscal.btnB_DClick(Sender: TObject);
var
  conn: PPGConn;
  Res: PPGResult;
  x, y: longint;
  ArquivoIni, host, port, banco, sql, scnpj, sie: string;
  ArqIni: TIniFile;

begin
  btnB_D.Enabled := False;
  btnB_E.Enabled := True;


  try
    ArquivoIni := ExtractFilePath(ParamStr(0)) + 'config.ini';
    ArqIni := TIniFile.Create(ArquivoIni);
    host := PChar(ArqIni.ReadString('DataBase', 'servidor', ''));
    port := '5432';
    banco := PChar(ArqIni.ReadString('DataBase', 'base', ''));


    ArqIni.Free;
   // sql:='sselect * from lancamento_notas_fiscais where dt_emis between '+FormatDateTime('YYYY/MM/DD',DateEdit1.Date)+' and '+FormatDateTime('YYYY/MM/DD',DateEdit2.Date)+' order by ide_demi asc' ;
    //PQsetdbLogin(pghost:Pchar; pgport:Pchar; pgoptions:Pchar; pgtty:Pchar; dbName:Pchar;login:Pchar; pwd:Pchar)
    conn := PQsetdbLogin(PChar(host), PChar(port),
      nil, nil, PChar(banco), PChar(mainform.Usuario), PChar(mainform.Senha));
    Res := PQExec(conn, PChar(sql));
    if (PQresultStatus(res) = PGRES_FATAL_ERROR) then
    begin
      raise Exception.Create(PQerrorMessage(conn));
      PQfinish(conn);
    end;



  // Alimenta o componente com informações para gerar todos os registros do Bloco D.
  //with ACBrSPEDFiscal1.Bloco_D. do
  //begin
  // with RegistroD001New do
  // begin
  ACBrSPEDFiscal1.Bloco_D.RegistroD001New.IND_MOV := imComDados;

     for x := 0 to PQntuples(Res) - 1 do   // linhas
    begin
      for y := 0 to PQnfields(Res) - 1 do // colunas (campos)
      begin


  //with RegistroD100New do
  //begin
  ACBrSPEDFiscal1.Bloco_D.RegistroD100New.IND_OPER := tpEntradaAquisicao;
  ACBrSPEDFiscal1.Bloco_D.RegistroD100New.IND_EMIT := edTerceiros;
  ACBrSPEDFiscal1.Bloco_D.RegistroD100New.COD_PART := ''; //
  ACBrSPEDFiscal1.Bloco_D.RegistroD100New.COD_MOD := '57';
  ACBrSPEDFiscal1.Bloco_D.RegistroD100New.COD_SIT := sdRegular;
  ACBrSPEDFiscal1.Bloco_D.RegistroD100New.SER := PQgetvalue(res, x, PQfnumber(res,'ide_serie'));
  ACBrSPEDFiscal1.Bloco_D.RegistroD100New.NUM_DOC :=PQgetvalue(res, x, PQfnumber(res,'ndoc'));   //Campo Número, da tela de lançamento de NFs.
  ACBrSPEDFiscal1.Bloco_D.RegistroD100New.CHV_CTE := PQgetvalue(res, x, PQfnumber(res,'chCTe'));
  ACBrSPEDFiscal1.Bloco_D.RegistroD100New.DT_DOC := strtodate(PQgetvalue(res, x, PQfnumber(res,'ide_dhEmi')));
  ACBrSPEDFiscal1.Bloco_D.RegistroD100New.DT_A_P := strtodate(PQgetvalue(res, x, PQfnumber(res,'')));
  ACBrSPEDFiscal1.Bloco_D.RegistroD100New.TP_CT_e := PQgetvalue(res, x, PQfnumber(res,'ide_tpCTe'));
  ACBrSPEDFiscal1.Bloco_D.RegistroD100New.VL_DOC :=  strtocurr(PQgetvalue(res, x, PQfnumber(res,'')));
  ACBrSPEDFiscal1.Bloco_D.RegistroD100New.VL_DESC :=  strtocurr(PQgetvalue(res, x, PQfnumber(res,'')));
  ACBrSPEDFiscal1.Bloco_D.RegistroD100New.IND_FRT := tfPorContaEmitente;
  ACBrSPEDFiscal1.Bloco_D.RegistroD100New.VL_SERV :=  strtocurr(PQgetvalue(res, x, PQfnumber(res,'')));
  ACBrSPEDFiscal1.Bloco_D.RegistroD100New.VL_BC_ICMS :=  strtocurr(PQgetvalue(res, x, PQfnumber(res,'')));
  ACBrSPEDFiscal1.Bloco_D.RegistroD100New.VL_ICMS :=  strtocurr(PQgetvalue(res, x, PQfnumber(res,'')));
  ACBrSPEDFiscal1.Bloco_D.RegistroD100New.VL_NT :=  strtocurr(PQgetvalue(res, x, PQfnumber(res,'')));
  ACBrSPEDFiscal1.Bloco_D.RegistroD100New.COD_INF :=  PQgetvalue(res, x, PQfnumber(res,''));
  ACBrSPEDFiscal1.Bloco_D.RegistroD100New.COD_CTA :=  ''; //sempre em branco
  // end;

  // with RegistroD190New do
  // begin
  ACBrSPEDFiscal1.Bloco_D.RegistroD190New.CST_ICMS := '000';
  ACBrSPEDFiscal1.Bloco_D.RegistroD190New.CFOP := '1252';
  ACBrSPEDFiscal1.Bloco_D.RegistroD190New.ALIQ_ICMS := 17.00;
  ACBrSPEDFiscal1.Bloco_D.RegistroD190New.VL_OPR := 100.00;
  ACBrSPEDFiscal1.Bloco_D.RegistroD190New.VL_BC_ICMS := 100.00;
  ACBrSPEDFiscal1.Bloco_D.RegistroD190New.VL_ICMS := 17.00;
  ACBrSPEDFiscal1.Bloco_D.RegistroD190New.VL_RED_BC := 0.00;
  ACBrSPEDFiscal1.Bloco_D.RegistroD190New.COD_OBS := '000001';
  // end;
    //end;
   end;
  end;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDFiscal1.WriteBloco_D;
    LoadToMemo;
  end;
    except
    on E: Exception do
    begin
      // MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;
  PQfinish(conn);
end;

procedure TFrmSPEDFiscal.btnB_EClick(Sender: TObject);
const
  ESTADOS: array [0 .. 1] of string = ('RS', 'SC');
var
  I: integer;
  conn: PPGConn;
  Res: PPGResult;
  x, y: longint;
  ArquivoIni, host, port, banco, sql, scnpj, sie: string;
  ArqIni: TIniFile;
begin
  // Alimenta o componente com informações para gerar todos os registros do Bloco E.
  btnB_E.Enabled := False;
  btnB_G.Enabled := True;

  // emissao normal todos campos icms = 0
  // devolução para entrada com credito devolver igual


  try
    ArquivoIni := ExtractFilePath(ParamStr(0)) + 'config.ini';
    ArqIni := TIniFile.Create(ArquivoIni);
    host := PChar(ArqIni.ReadString('DataBase', 'servidor', ''));
    port := '5432';
    banco := PChar(ArqIni.ReadString('DataBase', 'base', ''));


    ArqIni.Free;
  //  sql:='sselect * from lancamento_notas_fiscais where dt_emis between '+FormatDateTime('YYYY/MM/DD',DateEdit1.Date)+' and '+FormatDateTime('YYYY/MM/DD',DateEdit2.Date)+' order by ide_demi asc' ;
    //PQsetdbLogin(pghost:Pchar; pgport:Pchar; pgoptions:Pchar; pgtty:Pchar; dbName:Pchar;login:Pchar; pwd:Pchar)
    conn := PQsetdbLogin(PChar(host), PChar(port),
      nil, nil, PChar(banco), PChar(mainform.Usuario), PChar(mainform.Senha));
    Res := PQExec(conn, PChar(sql));
    if (PQresultStatus(res) = PGRES_FATAL_ERROR) then
    begin
      raise Exception.Create(PQerrorMessage(conn));
      PQfinish(conn);
    end;



    //  NNotas := StrToInt64Def(edNotas.Text, 1);
    //  BNotas := StrToInt64Def(edBufNotas.Text, 1);
    for x := 0 to PQntuples(Res) - 1 do   // linhas
    begin
      for y := 0 to PQnfields(Res) - 1 do // colunas (campos)
      begin


  // with ACBrSPEDFiscal1.Bloco_E do
  // begin
  // with RegistroE001New do
  // begin
  ACBrSPEDFiscal1.Bloco_E.RegistroE001New.IND_MOV := imComDados;

  //with RegistroE100New do
  //begin
  // DT_INI := StrToDate('01/11/2011');
  //DT_FIN := StrToDate('30/11/2011');
  ACBrSPEDFiscal1.Bloco_E.RegistroE100New.DT_INI := DateEdit1.Date;
  ACBrSPEDFiscal1.Bloco_E.RegistroE100New.DT_FIN := DateEdit2.Date;
  // with RegistroE110New do
  // begin
  ACBrSPEDFiscal1.Bloco_E.RegistroE110New.VL_TOT_DEBITOS := 17.00;
  ACBrSPEDFiscal1.Bloco_E.RegistroE110New.VL_AJ_DEBITOS := 0.00;
  ACBrSPEDFiscal1.Bloco_E.RegistroE110New.VL_TOT_AJ_DEBITOS := 0.00;
  ACBrSPEDFiscal1.Bloco_E.RegistroE110New.VL_ESTORNOS_CRED := 0;
  ACBrSPEDFiscal1.Bloco_E.RegistroE110New.VL_TOT_CREDITOS := 17.00;
  ACBrSPEDFiscal1.Bloco_E.RegistroE110New.VL_AJ_CREDITOS := 0;
  ACBrSPEDFiscal1.Bloco_E.RegistroE110New.VL_TOT_AJ_CREDITOS := 0;
  ACBrSPEDFiscal1.Bloco_E.RegistroE110New.VL_ESTORNOS_DEB := 0;
  ACBrSPEDFiscal1.Bloco_E.RegistroE110New.VL_SLD_CREDOR_ANT := 0;
  ACBrSPEDFiscal1.Bloco_E.RegistroE110New.VL_SLD_APURADO := 0.00;
  ACBrSPEDFiscal1.Bloco_E.RegistroE110New.VL_TOT_DED := 0.00;
  ACBrSPEDFiscal1.Bloco_E.RegistroE110New.VL_ICMS_RECOLHER := 0.00;
  ACBrSPEDFiscal1.Bloco_E.RegistroE110New.VL_SLD_CREDOR_TRANSPORTAR := 0;
  ACBrSPEDFiscal1.Bloco_E.RegistroE110New.DEB_ESP := 0;

  // with RegistroE111New do begin
  // COD_AJ_APUR    := 'RS009999';
  // DESCR_COMPL_AJ := '';
  // VL_AJ_APUR     := 1.00;

  // with RegistroE112New do begin
  // NUM_DA    := '123';
  // NUM_PROC  := '123';
  // IND_PROC  := opOutros;
  // PROC      := 'DESCRIÇÃO RESUMIDA';
  // TXT_COMPL := 'COMPLEMENTO';
  // end;

  // with RegistroE113New do begin
  // COD_PART := '000001';
  // COD_MOD  := '01';
  // SER      := 'SERI';
  // SUB      := '';
  // NUM_DOC  := '123456789';
  // DT_DOC   := Now;
  // COD_ITEM := '000001';
  // VL_AJ_ITEM := 0;
  // end;
  // end;

  { Rio Grande do Sul não possui as tabelas do registro E115, então este não precisa ser gerado }
  // with RegistroE115New do begin
  // COD_INF_ADIC   := 'RS000001';
  // VL_INF_ADIC    := 0;
  // DESCR_COMPL_AJ := '';
  // end;

  //with RegistroE116New do
  //begin
  ACBrSPEDFiscal1.Bloco_E.RegistroE116New.COD_OR := '000';
  ACBrSPEDFiscal1.Bloco_E.RegistroE116New.VL_OR := 0;
  ACBrSPEDFiscal1.Bloco_E.RegistroE116New.DT_VCTO := Now;
  ACBrSPEDFiscal1.Bloco_E.RegistroE116New.COD_REC := '123';
  ACBrSPEDFiscal1.Bloco_E.RegistroE116New.NUM_PROC := '10';
  ACBrSPEDFiscal1.Bloco_E.RegistroE116New.IND_PROC := opSefaz;
  ACBrSPEDFiscal1.Bloco_E.RegistroE116New.PROC := 'DESCRIÇÃO DO PROCESSO';
  ACBrSPEDFiscal1.Bloco_E.RegistroE116New.TXT_COMPL := '';
  ACBrSPEDFiscal1.Bloco_E.RegistroE116New.MES_REF := '112011';
  // end;
  // end;
  // end;
  //  end;

  { Gera um registro E200 e filhos para cada estado onde o contribuinte possui inscrição estadual }
  for I := Low(ESTADOS) to High(ESTADOS) do
  begin
    // with RegistroE200New do
    // begin
    // DT_INI := StrToDate('01/11/2011');
    //  DT_FIN := StrToDate('30/11/2011');
    ACBrSPEDFiscal1.Bloco_E.RegistroE200New.DT_INI := DateEdit1.Date;
    ACBrSPEDFiscal1.Bloco_E.RegistroE200New.DT_FIN := DateEdit2.Date;
    ACBrSPEDFiscal1.Bloco_E.RegistroE200New.UF := ESTADOS[I];

    //  with RegistroE210New do
    //begin
    ACBrSPEDFiscal1.Bloco_E.RegistroE210New.IND_MOV_ST := mstSemOperacaoST;
    ACBrSPEDFiscal1.Bloco_E.RegistroE210New.VL_SLD_CRED_ANT_ST := 0;
    ACBrSPEDFiscal1.Bloco_E.RegistroE210New.VL_DEVOL_ST := 0;
    ACBrSPEDFiscal1.Bloco_E.RegistroE210New.VL_RESSARC_ST := 0;
    ACBrSPEDFiscal1.Bloco_E.RegistroE210New.VL_OUT_CRED_ST := 0;
    ACBrSPEDFiscal1.Bloco_E.RegistroE210New.VL_AJ_CREDITOS_ST := 0;
    ACBrSPEDFiscal1.Bloco_E.RegistroE210New.VL_SLD_DEV_ANT_ST := 0.00;
    ACBrSPEDFiscal1.Bloco_E.RegistroE210New.VL_DEDUCOES_ST := 0;
    ACBrSPEDFiscal1.Bloco_E.RegistroE210New.VL_ICMS_RECOL_ST := 0.00;
    ACBrSPEDFiscal1.Bloco_E.RegistroE210New.VL_SLD_CRED_ST_TRANSPORTAR := 0;
    ACBrSPEDFiscal1.Bloco_E.RegistroE210New.VL_OUT_DEB_ST := 0.00;
    ACBrSPEDFiscal1.Bloco_E.RegistroE210New.DEB_ESP_ST := 0;

    // with RegistroE220New do begin
    // COD_AJ_APUR    := 'RS109999';
    // DESCR_COMPL_AJ := '';
    // VL_AJ_APUR     := 0.00;

    // with RegistroE230New do begin
    // NUM_DA    := '123';
    // NUM_PROC  := '123';
    // IND_PROC  := opOutros;
    // PROC      := 'DESCRIÇÃO RESUMIDA';
    // TXT_COMPL := 'COMPLEMENTO';
    // end;

    // with RegistroE240New do begin
    // COD_PART   := '000001';
    // COD_MOD    := '01';
    // SER        := 'SERI';
    // SUB        := '';
    // NUM_DOC    := '123456789';
    // DT_DOC     := Now;
    // COD_ITEM   := '000001';
    // VL_AJ_ITEM := 0;
    // end;
    // end;

    // with RegistroE250New do
    // begin
    ACBrSPEDFiscal1.Bloco_E.RegistroE250New.COD_OR := '000';
    ACBrSPEDFiscal1.Bloco_E.RegistroE250New.VL_OR := 0;
    ACBrSPEDFiscal1.Bloco_E.RegistroE250New.DT_VCTO := Now;
    ACBrSPEDFiscal1.Bloco_E.RegistroE250New.COD_REC := '123';
    ACBrSPEDFiscal1.Bloco_E.RegistroE250New.NUM_PROC := '1020304050';
    ACBrSPEDFiscal1.Bloco_E.RegistroE250New.IND_PROC := opOutros;
    ACBrSPEDFiscal1.Bloco_E.RegistroE250New.PROC := 'DESCRIÇÃO RESUMIDA';
    ACBrSPEDFiscal1.Bloco_E.RegistroE250New.TXT_COMPL := '';
    ACBrSPEDFiscal1.Bloco_E.RegistroE250New.MES_REF := '112011';
    // end;
    // end;
    //end;
    //end;
  end;

  //  with RegistroE500New do
  //  begin
  ACBrSPEDFiscal1.Bloco_E.RegistroE500New.IND_APUR := iaMensal;
  // DT_INI := StrToDate('01/11/2011');
  // DT_FIN := StrToDate('30/11/2011');
  ACBrSPEDFiscal1.Bloco_E.RegistroE500New.DT_INI := DateEdit1.Date;
  ACBrSPEDFiscal1.Bloco_E.RegistroE500New.DT_FIN := DateEdit2.Date;
  //with RegistroE510New do
  // begin
  ACBrSPEDFiscal1.Bloco_E.RegistroE510New.CFOP := '5120';
  ACBrSPEDFiscal1.Bloco_E.RegistroE510New.CST_IPI := '50';
  ACBrSPEDFiscal1.Bloco_E.RegistroE510New.VL_CONT_IPI := 0;
  ACBrSPEDFiscal1.Bloco_E.RegistroE510New.VL_BC_IPI := 0;
  ACBrSPEDFiscal1.Bloco_E.RegistroE510New.VL_IPI := 0;
  // end;

  // with RegistroE520New do
  // begin
  ACBrSPEDFiscal1.Bloco_E.RegistroE520New.VL_SD_ANT_IPI := 0;
  ACBrSPEDFiscal1.Bloco_E.RegistroE520New.VL_DEB_IPI := 0;
  ACBrSPEDFiscal1.Bloco_E.RegistroE520New.VL_CRED_IPI := 0;
  ACBrSPEDFiscal1.Bloco_E.RegistroE520New.VL_OD_IPI := 10.00;
  ACBrSPEDFiscal1.Bloco_E.RegistroE520New.VL_OC_IPI := 0;
  ACBrSPEDFiscal1.Bloco_E.RegistroE520New.VL_SC_IPI := 0;
  ACBrSPEDFiscal1.Bloco_E.RegistroE520New.VL_SD_IPI := 10.00;

  //with RegistroE530New do
  //begin
  ACBrSPEDFiscal1.Bloco_E.RegistroE530New.IND_AJ := ajDebito;
  ACBrSPEDFiscal1.Bloco_E.RegistroE530New.VL_AJ := 10;
  ACBrSPEDFiscal1.Bloco_E.RegistroE530New.COD_AJ := '001';
  ACBrSPEDFiscal1.Bloco_E.RegistroE530New.IND_DOC := odOutros;
  ACBrSPEDFiscal1.Bloco_E.RegistroE530New.NUM_DOC := '123';
  ACBrSPEDFiscal1.Bloco_E.RegistroE530New.DESCR_AJ := 'DESCRIÇÃO DETALHADA';
  // end;
  //end;
  // end;
  { fim registro E500 }
  //end;
  end;
   end;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDFiscal1.WriteBloco_E;
    LoadToMemo;
  end;

   except
    on E: Exception do
    begin
      // MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;
  PQfinish(conn);
end;

procedure TFrmSPEDFiscal.btnB_GClick(Sender: TObject);
begin
  btnB_G.Enabled := False;
  btnB_H.Enabled := True;

  // Alimenta o componente com informações para gerar todos os registros do Bloco G.
  //with ACBrSPEDFiscal1.Bloco_G. do
  //begin
  //with RegistroG001New. do
  //begin
  ACBrSPEDFiscal1.Bloco_G.RegistroG001New.IND_MOV := imComDados;

  //with ACBrSPEDFiscal1.Bloco_G.RegistroG110New. do
  //begin
  ACBrSPEDFiscal1.Bloco_G.DT_INI := Now;
  ACBrSPEDFiscal1.Bloco_G.DT_FIN := Now;
  ACBrSPEDFiscal1.Bloco_G.RegistroG110New.SALDO_IN_ICMS := 44.00;
  ACBrSPEDFiscal1.Bloco_G.RegistroG110New.SOM_PARC := 4.40;
  ACBrSPEDFiscal1.Bloco_G.RegistroG110New.VL_TRIB_EXP := 10.999;
  ACBrSPEDFiscal1.Bloco_G.RegistroG110New.VL_TOTAL := 10.999;
  ACBrSPEDFiscal1.Bloco_G.RegistroG110New.IND_PER_SAI := 1.00;
  ACBrSPEDFiscal1.Bloco_G.RegistroG110New.ICMS_APROP := 4.40;
  ACBrSPEDFiscal1.Bloco_G.RegistroG110New.SOM_ICMS_OC := 10.999;

  //with ACBrSPEDFiscal1.Bloco_G.RegistroG125New. do
  //begin
  ACBrSPEDFiscal1.Bloco_G.RegistroG125New.COD_IND_BEM := '000001';
  ACBrSPEDFiscal1.Bloco_G.RegistroG125New.DT_MOV := StrToDate('01/11/2011');
  ACBrSPEDFiscal1.Bloco_G.RegistroG125New.TIPO_MOV := mbcSI;
  ACBrSPEDFiscal1.Bloco_G.RegistroG125New.VL_IMOB_ICMS_OP := 10.999;
  ACBrSPEDFiscal1.Bloco_G.RegistroG125New.VL_IMOB_ICMS_ST := 10.999;
  ACBrSPEDFiscal1.Bloco_G.RegistroG125New.VL_IMOB_ICMS_FRT := 10.999;
  ACBrSPEDFiscal1.Bloco_G.RegistroG125New.VL_IMOB_ICMS_DIF := 10.999;
  ACBrSPEDFiscal1.Bloco_G.RegistroG125New.NUM_PARC := 10;
  ACBrSPEDFiscal1.Bloco_G.RegistroG125New.VL_PARC_PASS := 4.40;

  //with ACBrSPEDFiscal1.Bloco_G.RegistroG126New. do
  //begin
  ACBrSPEDFiscal1.Bloco_G.RegistroG126New.DT_INI := StrToDate('01/10/2011');
  // ;
  ACBrSPEDFiscal1.Bloco_G.RegistroG126New.DT_FIN := StrToDate('30/10/2011');
  // ;
  ACBrSPEDFiscal1.Bloco_G.RegistroG126New.NUM_PARC := 1234;
  ACBrSPEDFiscal1.Bloco_G.RegistroG126New.VL_PARC_PASS := 10.999;
  ACBrSPEDFiscal1.Bloco_G.RegistroG126New.VL_TRIB_OC := 10.999;
  ACBrSPEDFiscal1.Bloco_G.RegistroG126New.VL_TOTAL := 10.999;
  ACBrSPEDFiscal1.Bloco_G.RegistroG126New.IND_PER_SAI := 1.00;
  ACBrSPEDFiscal1.Bloco_G.RegistroG126New.VL_PARC_APROP := 10.999;
  //end;

  //with ACBrSPEDFiscal1.Bloco_G.RegistroG130New. do
  //begin
  ACBrSPEDFiscal1.Bloco_G.RegistroG130New.IND_EMIT := edEmissaoPropria;
  ACBrSPEDFiscal1.Bloco_G.RegistroG130New.COD_PART := '000001';
  ACBrSPEDFiscal1.Bloco_G.RegistroG130New.COD_MOD := '55';
  ACBrSPEDFiscal1.Bloco_G.RegistroG130New.SERIE := '1';
  ACBrSPEDFiscal1.Bloco_G.RegistroG130New.NUM_DOC := '000068849';
  ACBrSPEDFiscal1.Bloco_G.RegistroG130New.CHV_NFE_CTE :=
    '3510026031879700010055001000068849088277';
  ACBrSPEDFiscal1.Bloco_G.RegistroG130New.DT_DOC := Now;

  // with ACBrSPEDFiscal1.Bloco_G.RegistroG140New. do
  // begin
  ACBrSPEDFiscal1.Bloco_G.RegistroG140New.NUM_ITEM := '9999';
  ACBrSPEDFiscal1.Bloco_G.RegistroG140New.COD_ITEM := '000001';
  //end;
  // end;
  // end;
  // end;
  // end;
  //end;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDFiscal1.WriteBloco_G;
    LoadToMemo;
  end;

end;

procedure TFrmSPEDFiscal.FormCreate(Sender: TObject);
begin
  DateEdit1.Date := StartOfTheMonth(now);
  DateEdit2.Date := EndOfTheMonth(now);
end;

procedure TFrmSPEDFiscal.btnB_HClick(Sender: TObject);
var
  IInvent: integer;
    conn: PPGConn;
  Res: PPGResult;
  x, y: longint;
  ArquivoIni, host, port, banco, sql, scnpj, sie: string;
  ArqIni: TIniFile;
begin
  btnB_H.Enabled := False;
  btnB_1.Enabled := True;


  try
    ArquivoIni := ExtractFilePath(ParamStr(0)) + 'config.ini';
    ArqIni := TIniFile.Create(ArquivoIni);
    host := PChar(ArqIni.ReadString('DataBase', 'servidor', ''));
    port := '5432';
    banco := PChar(ArqIni.ReadString('DataBase', 'base', ''));


    ArqIni.Free;
    sql:='sselect * from lancamento_notas_fiscais where dt_emis between '+FormatDateTime('YYYY/MM/DD',DateEdit1.Date)+' and '+FormatDateTime('YYYY/MM/DD',DateEdit2.Date)+' order by ide_demi asc' ;
    //PQsetdbLogin(pghost:Pchar; pgport:Pchar; pgoptions:Pchar; pgtty:Pchar; dbName:Pchar;login:Pchar; pwd:Pchar)
    conn := PQsetdbLogin(PChar(host), PChar(port),
      nil, nil, PChar(banco), PChar(mainform.Usuario), PChar(mainform.Senha));
    Res := PQExec(conn, PChar(sql));
    if (PQresultStatus(res) = PGRES_FATAL_ERROR) then
    begin
      raise Exception.Create(PQerrorMessage(conn));
      PQfinish(conn);
    end;


  // Alimenta o componente com informações para gerar todos os registros do
  // Bloco H.
  //with ACBrSPEDFiscal1.Bloco_H. do
  // begin
  //with ACBrSPEDFiscal1.Bloco_H.RegistroH001New. do
  // begin
  ACBrSPEDFiscal1.Bloco_H.RegistroH001New.IND_MOV := imComDados;
  for x := 0 to PQntuples(Res) - 1 do   // linhas
    begin
      for y := 0 to PQnfields(Res) - 1 do // colunas (campos)
      begin
  // with ACBrSPEDFiscal1.Bloco_H.RegistroH005New. do
  // begin
  ACBrSPEDFiscal1.Bloco_H.RegistroH005New.DT_INV := ACBrSPEDFiscal1.Bloco_H.DT_FIN;
  //o valor informado no campo deve ser menor ou igual ao valor no campo DT_FIN do registro 0000
  ACBrSPEDFiscal1.Bloco_H.RegistroH005New.VL_INV := 1000;
  // FILHO
  for IInvent := 1 to 10 do
  begin
    //with ACBrSPEDFiscal1.Bloco_H.RegistroH010New. do
    //begin
    ACBrSPEDFiscal1.Bloco_H.RegistroH010New.COD_ITEM :=
      FormatFloat('00000000000000', IInvent);
    ACBrSPEDFiscal1.Bloco_H.RegistroH010New.UNID := 'UN';
    ACBrSPEDFiscal1.Bloco_H.RegistroH010New.QTD := 1;
    ACBrSPEDFiscal1.Bloco_H.RegistroH010New.VL_UNIT := 100;
    ACBrSPEDFiscal1.Bloco_H.RegistroH010New.VL_ITEM := 100;
    ACBrSPEDFiscal1.Bloco_H.RegistroH010New.IND_PROP := piInformante;
    ACBrSPEDFiscal1.Bloco_H.RegistroH010New.COD_PART := '';
    ACBrSPEDFiscal1.Bloco_H.RegistroH010New.TXT_COMPL := '';
    ACBrSPEDFiscal1.Bloco_H.RegistroH010New.COD_CTA := '';

    // with ACBrSPEDFiscal1.Bloco_H.RegistroH020New. do
    //begin
    ACBrSPEDFiscal1.Bloco_H.RegistroH020New.CST_ICMS := '00';
    ACBrSPEDFiscal1.Bloco_H.RegistroH020New.BC_ICMS := 1;
    ACBrSPEDFiscal1.Bloco_H.RegistroH020New.VL_ICMS := 2;
    //end;

  end;
 end;
  end;
  // end;
  // end;

  if cbConcomitante.Checked then
  begin
    ACBrSPEDFiscal1.WriteBloco_H;
    LoadToMemo;
  end;
  except
    on E: Exception do
    begin
      // MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;
  PQfinish(conn);

end;

procedure TFrmSPEDFiscal.edtFileChange(Sender: TObject);
begin
  ACBrSPEDFiscal1.Arquivo := edtFile.Text;
end;

procedure TFrmSPEDFiscal.LoadToMemo;
begin
  memoTXT.Lines.Clear;
  if FileExists(ExtractFilePath(Application.ExeName) + 'temp/' +
    ACBrSPEDFiscal1.Arquivo) then
    memoTXT.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) +
      'temp/' + ACBrSPEDFiscal1.Arquivo);
end;

procedure TFrmSPEDFiscal.MsgError(const AClassName, AMsg: string);
const
  CMsg = 'Error in class "%s": %s';
begin
  Application.MessageBox(PChar(Format(CMsg, [AClassName, AMsg])),
    PChar(Application.Title), MB_ICONERROR + MB_OK);
end;

procedure TFrmSPEDFiscal.cbConcomitanteClick(Sender: TObject);
begin
  btnTXT.Enabled := not cbConcomitante.Checked;
  btnError.Enabled := btnTXT.Enabled;

  edBufNotas.Enabled := cbConcomitante.Checked;

  if not cbConcomitante.Checked then
  begin
    btnB_0.Enabled := True;
    btnB_C.Enabled := False;
    btnB_D.Enabled := False;
    btnB_E.Enabled := False;
    btnB_H.Enabled := False;
    btnB_K.Enabled := False;
    btnB_1.Enabled := False;
    btnB_9.Enabled := False;
  end;
end;

end.
