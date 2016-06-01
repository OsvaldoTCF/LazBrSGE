unit xml_ent_import;

{$mode objfpc} {$H+}

interface

uses
  LCLIntf, LCLType, SysUtils, LResources, Forms, Classes, sqldb, Dialogs, MaskUtils,
  StdCtrls, Buttons, EditBtn, Grids, pcnConversao,pcnConversaoNFe, pcnNFe, pcnNFeR,pcnNFeW, Graphics,
  Controls, MaskEdit;

type

  { Txml_ent_imp }

  Txml_ent_imp = class(TForm)
    ComboBox1: TComboBox;
    DateEdit1: TDateEdit;
    combogridEdit: TEdit;
    Edit2: TEdit;
    Grid1: TStringGrid;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    NFantasiaEdit: TEdit;
    NFantasiaIDEdit: TEdit;
    OpenDialog1: TOpenDialog;
    SearchCCEdit: TEdit;
    SearchCCIDEdit: TEdit;
    SpeedButton1: TSpeedButton;
    AbrirSpeedButton: TSpeedButton;
    SQLQuery: TSQLQuery;
    procedure combogridEditClick(Sender: TObject);
    procedure combogridEditExit(Sender: TObject);
    procedure combogridEditKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure Edit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Grid1SelectCell(Sender: TObject; aCol, aRow: integer;
      var CanSelect: boolean);
    procedure NFantasiaEditClick(Sender: TObject);
    procedure NFantasiaEditKeyUp(Sender: TObject; var Key: word;
      Shift: TShiftState);
    procedure SearchCCEditClick(Sender: TObject);
    procedure SearchCCEditKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure AbrirSpeedButtonClick(Sender: TObject);
  private
    { private declarations }
  public
    procedure criagrid(controleDesc, controleId: TEdit;
      sql, campoID, campoDesc: string);
    procedure Seleciona(Sender: TObject; aCol, aRow: integer);
    procedure click(Sender: TObject);
    procedure bclica(Sender: TObject);
    procedure MsgError(const AClassName, AMsg: string);
  end;

var
  xml_ent_imp: Txml_ent_imp;
  i: integer;
  NFe: TNFe;
  NFeR: TNFeR;
  xmlfile: string;
  mgrid: TStringGrid;
  mbotao: TButton;
  LookupSQLQuery: TSQLQuery;
  contrDesc, contrId: TEdit;
  textoID, textodesc: string;

implementation

  {$R *.lfm}
uses
  mainfrm;

{ Txml_ent_imp }


procedure Txml_ent_imp.FormShow(Sender: TObject);
begin
  AbrirSpeedButtonClick(Sender);
end;

procedure Txml_ent_imp.Grid1SelectCell(Sender: TObject; aCol, aRow: integer;
  var CanSelect: boolean);
var
  R: TRect;
begin
  if ((aCol = 5) and (aRow <> 0)) then
  begin
    R := Grid1.CellRect(aCol, aRow);
    R.Left := R.Left + Grid1.Left;
    R.Right := R.Right + Grid1.Left;
    R.Top := R.Top + Grid1.Top;
    R.Bottom := R.Bottom + Grid1.Top;
    combogridEdit.Left := R.Left + 1;
    combogridEdit.Top := R.Top + 1;
    combogridEdit.Width := (R.Right + 1) - R.Left;
    combogridEdit.Height := (R.Bottom + 1) - R.Top;
    combogridEdit.Visible := True;
    combogridEdit.SetFocus;
    combogridEditClick(Sender);
  end;
  CanSelect := True;
end;

procedure Txml_ent_imp.NFantasiaEditClick(Sender: TObject);
begin
  NFantasiaEdit.Clear;
  criagrid(NFantasiaEdit, NFantasiaIDEdit,
    'select *  from cadastro where apelido like :parametro  order by apelido',
    'codigo', 'apelido');
end;

procedure Txml_ent_imp.NFantasiaEditKeyUp(Sender: TObject; var Key: word;
  Shift: TShiftState);
begin
  criagrid(NFantasiaEdit, NFantasiaIDEdit,
    'select *  from cadastro where (apelido like :parametro) or ' +
    '(nome like :parametro)or (cnpj like :parametro) or ' +
    '(inscricao_estadual like :parametro)or (tipo_cadastro like :parametro)' +
    'or (fax like :parametro) or (UPPER(site) like :parametro) ' +
    ' order by apelido asc',
    'codigo', 'apelido');
end;

procedure Txml_ent_imp.SearchCCEditClick(Sender: TObject);
begin
  criagrid(SearchCCEdit, SearchCCIDEdit,
    'select *  from centro_custo where descricao_cc like :parametro',
    'codigo_cc', 'descricao_cc');
end;

procedure Txml_ent_imp.SearchCCEditKeyUp(Sender: TObject; var Key: word;
  Shift: TShiftState);
begin
  criagrid(SearchCCEdit, SearchCCIDEdit,
    'select *  from centro_custo where descricao_cc like :parametro',
    'codigo_cc', 'descricao_cc');
end;


procedure Txml_ent_imp.FormCreate(Sender: TObject);
begin
  SQLQuery.DataBase := MainForm.MainSQLConnector;
  SQLQuery.Transaction := MainForm.MainSQLTransaction;
  SQLQuery.PacketRecords := -1;
  mgrid := TStringGrid.Create(xml_ent_imp);
  mbotao := TButton.Create(mgrid);
  mbotao.Hide;
  mgrid.Hide;
  LookupSQLQuery := TSQLQuery.Create(xml_ent_imp);
  LookupSQLQuery.DataBase := MainForm.MainSQLConnector;
  LookupSQLQuery.Transaction := MainForm.MainSQLTransaction;
  LookupSQLQuery.PacketRecords := -1;
end;

procedure Txml_ent_imp.combogridEditExit(Sender: TObject);
begin
  // Grid1.Cells[Grid1.Col,Grid1.Row] := combogridEdit.Items[ComboBox1.ItemIndex];
  combogridEdit.Visible := False;
  Grid1.SetFocus;
end;

procedure Txml_ent_imp.combogridEditKeyUp(Sender: TObject; var Key: word;
  Shift: TShiftState);
begin
  criagrid(combogridEdit, Edit2,
    'select * from produtos where (cod_prod like :parametro)or(descricao like :parametro)  order by descricao asc',
    'codigo', 'descricao');
end;

procedure Txml_ent_imp.Edit2Change(Sender: TObject);
begin
  Grid1.Cells[Grid1.Col, Grid1.Row] := Edit2.Text;
end;

procedure Txml_ent_imp.combogridEditClick(Sender: TObject);
begin
  combogridEdit.Clear;
  criagrid(combogridEdit, Edit2,
    'select * from produtos where (cod_prod like :parametro)or(descricao like :parametro)  order by descricao asc',
    'codigo', 'descricao');
end;

procedure Txml_ent_imp.SpeedButton1Click(Sender: TObject);
var
  refprod, ref_prod: string;
  i,idnfe: integer;
begin
  if ((DateEdit1.Date = null) or (comboBox1.Text = '') or
    (NFantasiaEdit.Text = '')) then
    ShowMessage('Campos em Branco,favor verificar')
  else
  begin
    NFe := TNFe.Create;
    NFeR := TNFeR.Create(NFe);
    NFeR.Leitor.CarregarArquivo(xmlfile);
    NFeR.LerXml;
    NFe.infNFe.Versao := 3.10;
    NFe.Ide.verProc := '3.10';
    i := 0;
    MainForm.MainSQLTransaction.StartTransaction;
    try
        SQLQuery.SQL.Text :=
          'insert into lancamento_notas_fiscais(' +
          '  infnfe_id,  ide_cuf,  ide_cnf,    ide_natop,  ide_indpag, '+
  'ide_nnf,  ide_demi,  ide_dsaient,  ide_mod,  ide_serie,  ide_tpnf,' +
  'ide_cmunfg,  ide_tpemis,  ide_finnfe,  ide_procemi,  ' +
  ' emit_cnpjcpf,  emit_xnome,  emit_xfant,  emit_ie,  emit_iest,'+
  'emit_im,  emit_cnae,  enderemit_xlgr,  enderemit_nro,  enderemit_xcpl,'+
  'enderemit_xbairro,  enderemit_cmun,  enderemit_xmun,  enderemit_uf,'+
  'enderemit_cep,  enderemit_fone,  dest_cnpjcpf,  dest_xnome,  dest_ie,' +
  'enderdest_xlgr,  enderdest_nro,  enderdest_xcpl,  enderdest_xbairro,'+
  'enderdest_cmun,  enderdest_xmun,  enderdest_uf,  enderdest_cep,' +
  'enderdest_fone,  retirada_cnpj,  retirada_xlgr,  retirada_nro,' +
  'retirada_xcpl,  retirada_xbairro,  retirada_cmun,  retirada_xmun,'+
  'retirada_uf,  entrega_cnpj,  entrega_xlgr,  entrega_nro,  entrega_xcpl,'+
  'entrega_xbairro,  entrega_cmun,  entrega_xmun,  entrega_uf,  icmstot_vbc,' +
  'icmstot_vicms,  icmstot_vbcst,  icmstot_vprod,  icmstot_vpis,  icmstot_vcofins,' +
  'icmstot_vst,  icmstot_vipi, ' +
  'icmstot_vnf,  icmstot_vseg,  icmstot_voutro,  transp_modfrete,'+
  'transporta_cnpjcpf,  transporta_xnome,  transporta_ie,  transporta_xender,  transporta_xmun,'+
  'transporta_uf,  infadfisco,  infcpl_contrib,   cdv,  verproc, ' +
  ' transporta_qvol,  transporta_esp,  fat_nfat,  ' +
  'pesol,  pesob,  consumidor_final,  tipo_contribuinte,'+
  'cancelada,  icmstotal_vfrete,  nfantasiaid,ent_saida,empresa_id' +
          ') values(' +
      '  :pinfnfe_id,  :pide_cuf,  :pide_cnf,    :pide_natop,  :pide_indpag, '+
  ':pide_nnf,  :pide_demi,  :pide_dsaient,  :pide_mod,  :pide_serie,  :pide_tpnf,' +
  ':pide_cmunfg,  :pide_tpemis,  :pide_finnfe,  :pide_procemi,  ' +
  ' :pemit_cnpjcpf,  :pemit_xnome,  :pemit_xfant,  :pemit_ie,  :pemit_iest,'+
  ':pemit_im,  :pemit_cnae,  :penderemit_xlgr,  :penderemit_nro,  :penderemit_xcpl,'+
  ':penderemit_xbairro,  :penderemit_cmun,  :penderemit_xmun,  :penderemit_uf,'+
  ':penderemit_cep,  :penderemit_fone,  :pdest_cnpjcpf,  :pdest_xnome,  :pdest_ie,' +
  ':penderdest_xlgr,  :penderdest_nro,  :penderdest_xcpl,  :penderdest_xbairro,'+
  ':penderdest_cmun,  :penderdest_xmun,  :penderdest_uf,  :penderdest_cep,' +
  ':penderdest_fone,  :pretirada_cnpj,  :pretirada_xlgr,  :pretirada_nro,' +
  ':pretirada_xcpl,  :pretirada_xbairro,  :pretirada_cmun,  :pretirada_xmun,'+
  ':pretirada_uf,  :pentrega_cnpj,  :pentrega_xlgr,  :pentrega_nro,  :pentrega_xcpl,'+
  ':pentrega_xbairro,  :pentrega_cmun,  :pentrega_xmun,  :pentrega_uf,  :picmstot_vbc,' +
  ':picmstot_vicms,  :picmstot_vbcst,  :picmstot_vprod,  :picmstot_vpis,  :picmstot_vcofins,' +
  ':picmstot_vst,  :picmstot_vipi, ' +
  ':picmstot_vnf,  :picmstot_vseg,  :picmstot_voutro,  :ptransp_modfrete,'+
  ':ptransporta_cnpjcpf,  :ptransporta_xnome,  :ptransporta_ie,  :ptransporta_xender,  :ptransporta_xmun,'+
  ':ptransporta_uf,  :pinfadfisco,  :pinfcpl_contrib,   :pcdv,  :pverproc, ' +
  ' :ptransporta_qvol,  :ptransporta_esp,  :pfat_nfat,  ' +
  ':ppesol,  :ppesob,  :pconsumidor_final,  :ptipo_contribuinte,'+
  ':pcancelada,  :picmstotal_vfrete,  :pnfantasiaid,:pent_saida, 1' +
          ')';
        SQLQuery.ParamByName('pinfnfe_id').AsString := StringReplace(nfe.infNFe.ID, 'nfe', '', [rfReplaceAll, rfIgnoreCase]);
        SQLQuery.ParamByName('pide_cuf').AsString := inttostr(NFe.ide.cUF) ;

        SQLQuery.ParamByName('pide_cnf').AsString := inttostr(NFe.ide.cNF) ;
        SQLQuery.ParamByName('pide_natop').AsString :=NFe.ide.natOp  ;
        if(NFe.ide.indPag=ipVista)then
        SQLQuery.ParamByName('pide_indpag').AsString := '0' ;
        if(NFe.ide.indPag=ipPrazo)then
        SQLQuery.ParamByName('pide_indpag').AsString := '1' ;
        if(NFe.ide.indPag=ipOutras)then
        SQLQuery.ParamByName('pide_indpag').AsString := '2' ;

        SQLQuery.ParamByName('pide_nnf').AsString := inttostr(NFe.ide.nNF) ;
        SQLQuery.ParamByName('pide_demi').AsDateTime := NFe.ide.dEmi;
        SQLQuery.ParamByName('pide_dsaient').AsDateTime:= NFe.ide.dSaiEnt;
        SQLQuery.ParamByName('pide_mod').AsString := inttostr(NFe.ide.modelo);
        SQLQuery.ParamByName('pide_serie').AsString :=inttostr( NFe.ide.serie);
        if(NFe.ide.tpNF=tnEntrada) then
        SQLQuery.ParamByName('pide_tpnf').AsString :='0' ;
        if(NFe.ide.tpNF=tnSaida) then
        SQLQuery.ParamByName('pide_tpnf').AsString :='1' ;

        SQLQuery.ParamByName('pide_cmunfg').AsString := inttostr(NFe.ide.cMunFG);
        if(NFe.ide.tpEmis=teNormal)then
        SQLQuery.ParamByName('pide_tpemis').AsString := '0';
        if(NFe.ide.tpEmis=teContingencia)then
        SQLQuery.ParamByName('pide_tpemis').AsString := '1';
        if(NFe.ide.tpEmis=teSCAN)then
        SQLQuery.ParamByName('pide_tpemis').AsString := '2';
        if(NFe.ide.tpEmis=teDPEC)then
        SQLQuery.ParamByName('pide_tpemis').AsString := '3';
       if(NFe.ide.tpEmis=teFSDA)then
        SQLQuery.ParamByName('pide_tpemis').AsString := '4';
       if(NFe.ide.tpEmis=teSVCAN)then
        SQLQuery.ParamByName('pide_tpemis').AsString := '5';
       if(NFe.ide.tpEmis=teSVCRS)then
        SQLQuery.ParamByName('pide_tpemis').AsString := '6';
       if(NFe.ide.tpEmis=teSVCSP)then
        SQLQuery.ParamByName('pide_tpemis').AsString := '7';
       if(NFe.ide.tpEmis=teOffLine)then
        SQLQuery.ParamByName('pide_tpemis').AsString := '8';

        if(NFe.ide.finNFe=fnNormal)then
        SQLQuery.ParamByName('pide_finnfe').AsString := '0';
        if(NFe.ide.finNFe=fnComplementar)then
        SQLQuery.ParamByName('pide_finnfe').AsString := '1';
        if(NFe.ide.finNFe=fnAjuste)then
        SQLQuery.ParamByName('pide_finnfe').AsString := '2';
        if(NFe.ide.finNFe=fnDevolucao )then
        SQLQuery.ParamByName('pide_finnfe').AsString := '3';

        if (NFe.ide.procEmi=peAplicativoContribuinte) then
        SQLQuery.ParamByName('pide_procemi').AsString := '0';
        if (NFe.ide.procEmi=peAvulsaFisco) then
        SQLQuery.ParamByName('pide_procemi').AsString := '1';
        if (NFe.ide.procEmi=peAvulsaContribuinte) then
        SQLQuery.ParamByName('pide_procemi').AsString := '2';
        if (NFe.ide.procEmi=peContribuinteAplicativoFisco) then
        SQLQuery.ParamByName('pide_procemi').AsString := '3';

        SQLQuery.ParamByName('pemit_cnpjcpf').AsString := NFe.emit.CNPJCPF;
        SQLQuery.ParamByName('pemit_xnome').AsString := NFe.emit.xNome;
        SQLQuery.ParamByName('pemit_xfant').AsString := NFe.emit.xFant;
        SQLQuery.ParamByName('pemit_ie').AsString := NFe.emit.IE;
        SQLQuery.ParamByName('pemit_iest').AsString := NFe.emit.IEST;
        SQLQuery.ParamByName('pemit_im').AsString := NFe.emit.IM;
        SQLQuery.ParamByName('pemit_cnae').AsString := NFe.emit.CNAE;
        SQLQuery.ParamByName('penderemit_xlgr').AsString := NFe.emit.EnderEmit.xLgr;
        SQLQuery.ParamByName('penderemit_nro').AsString := NFe.emit.EnderEmit.nro;
        SQLQuery.ParamByName('penderemit_xcpl').AsString := NFe.emit.EnderEmit.xCpl;
        SQLQuery.ParamByName('penderemit_xbairro').AsString := NFe.emit.EnderEmit.xBairro;
        SQLQuery.ParamByName('penderemit_cmun').AsString := inttostr(NFe.emit.EnderEmit.cMun);
        SQLQuery.ParamByName('penderemit_xmun').AsString := NFe.emit.EnderEmit.xMun;
        SQLQuery.ParamByName('penderemit_uf').AsString := NFe.emit.EnderEmit.UF;
        SQLQuery.ParamByName('penderemit_cep').AsString := inttostr(NFe.emit.EnderEmit.CEP);
        SQLQuery.ParamByName('penderemit_fone').AsString := NFe.emit.EnderEmit.fone;
        SQLQuery.ParamByName('pdest_cnpjcpf').AsString := NFe.Dest.CNPJCPF;
        SQLQuery.ParamByName('pdest_xnome').AsString := NFe.Dest.xNome;
        SQLQuery.ParamByName('pdest_ie').AsString := NFe.Dest.IE;
        SQLQuery.ParamByName('penderdest_xlgr').AsString := NFe.Dest.EnderDest.xLgr;
        SQLQuery.ParamByName('penderdest_nro').AsString := NFe.Dest.EnderDest.nro;
        SQLQuery.ParamByName('penderdest_xcpl').AsString := NFe.Dest.EnderDest.xCpl;
        SQLQuery.ParamByName('penderdest_xbairro').AsString := NFe.Dest.EnderDest.xBairro;
        SQLQuery.ParamByName('penderdest_cmun').AsString := inttostr(NFe.Dest.EnderDest.cMun);
        SQLQuery.ParamByName('penderdest_xmun').AsString := NFe.Dest.EnderDest.xMun;
        SQLQuery.ParamByName('penderdest_uf').AsString := NFe.Dest.EnderDest.UF;
        SQLQuery.ParamByName('penderdest_cep').AsString := inttostr(NFe.Dest.EnderDest.CEP);
        SQLQuery.ParamByName('penderdest_fone').AsString := NFe.Dest.EnderDest.fone;
        SQLQuery.ParamByName('pretirada_cnpj').AsString := NFe.Retirada.CNPJCPF;
        SQLQuery.ParamByName('pretirada_xlgr').AsString := NFe.Retirada.xLgr;
        SQLQuery.ParamByName('pretirada_nro').AsString := NFe.Retirada.nro;
        SQLQuery.ParamByName('pretirada_xcpl').AsString := NFe.Retirada.xCpl;
        SQLQuery.ParamByName('pretirada_xbairro').AsString := NFe.Retirada.xBairro;
        SQLQuery.ParamByName('pretirada_cmun').AsString := inttostr(NFe.Retirada.cMun);
        SQLQuery.ParamByName('pretirada_xmun').AsString := NFe.Retirada.xmun;
        SQLQuery.ParamByName('pretirada_uf').AsString := NFe.Retirada.UF;
        SQLQuery.ParamByName('pentrega_cnpj').AsString := NFe.Entrega.CNPJCPF;
        SQLQuery.ParamByName('pentrega_xlgr').AsString := NFe.Entrega.xLgr;
        SQLQuery.ParamByName('pentrega_nro').AsString := NFe.Entrega.nro;
        SQLQuery.ParamByName('pentrega_xcpl').AsString := NFe.Entrega.xCpl;
        SQLQuery.ParamByName('pentrega_xbairro').AsString := NFe.Entrega.xBairro;
        SQLQuery.ParamByName('pentrega_cmun').AsString := inttostr(NFe.Entrega.cMun);
        SQLQuery.ParamByName('pentrega_xmun').AsString := NFe.Entrega.xMun;
        SQLQuery.ParamByName('pentrega_uf').AsString := NFe.Entrega.UF;
        SQLQuery.ParamByName('picmstot_vbc').AsFloat := NFe.Total.icmstot.vbc;
        SQLQuery.ParamByName('picmstot_vicms').AsFloat := NFe.Total.ICMSTot.vICMS;
        SQLQuery.ParamByName('picmstot_vbcst').AsFloat := NFe.Total.ICMSTot.vBCST;
        SQLQuery.ParamByName('picmstot_vprod').AsFloat := NFe.Total.ICMSTot.vProd;
        SQLQuery.ParamByName('picmstot_vpis').AsFloat := NFe.Total.ICMSTot.vPIS;
        SQLQuery.ParamByName('picmstot_vcofins').AsFloat := NFe.Total.ICMSTot.vCOFINS;
        SQLQuery.ParamByName('picmstot_vst').AsFloat := NFe.Total.ICMSTot.vST;
        SQLQuery.ParamByName('picmstot_vipi').AsFloat := NFe.Total.ICMSTot.vIPI;
        SQLQuery.ParamByName('picmstot_vnf').AsFloat := NFe.Total.ICMSTot.vnf;
        SQLQuery.ParamByName('picmstot_vseg').AsFloat := NFe.Total.ICMSTot.vseg;
        SQLQuery.ParamByName('picmstot_voutro').AsFloat := NFe.Total.ICMSTot.vOutro;

        case NFe.Transp.modFrete of
         mfContaEmitente:SQLQuery.ParamByName('ptransp_modfrete').AsString  := '0';
         mfContaDestinatario:SQLQuery.ParamByName('ptransp_modfrete').AsString  := '1';
         mfContaTerceiros:SQLQuery.ParamByName('ptransp_modfrete').AsString  := '2';
         mfSemFrete:SQLQuery.ParamByName('ptransp_modfrete').AsString:= '3';
        end;
        SQLQuery.ParamByName('ptransporta_cnpjcpf').AsString := NFe.Transp.Transporta.CNPJCPF;
        SQLQuery.ParamByName('ptransporta_xnome').AsString := NFe.Transp.Transporta.xnome;
        SQLQuery.ParamByName('ptransporta_ie').AsString := NFe.Transp.Transporta.ie;
        SQLQuery.ParamByName('ptransporta_xender').AsString := NFe.Transp.Transporta.xender;
        SQLQuery.ParamByName('ptransporta_xmun').AsString := NFe.Transp.Transporta.xmun;
        SQLQuery.ParamByName('ptransporta_uf').AsString := NFe.Transp.Transporta.uf;
        SQLQuery.ParamByName('ptransporta_qvol').AsString := inttostr(NFe.Transp.Vol.Items[0].qVol);
        SQLQuery.ParamByName('ptransporta_esp').AsString := NFe.Transp.Vol.Items[0].esp;
        SQLQuery.ParamByName('pinfadfisco').AsString := NFe.InfAdic.infAdFisco;
        SQLQuery.ParamByName('pinfcpl_contrib').AsString := NFe.InfAdic.infCpl;
        SQLQuery.ParamByName('pcdv').AsString := inttostr(NFe.Ide.cDv);
        SQLQuery.ParamByName('pverproc').AsString := NFe.Ide.verProc;
        SQLQuery.ParamByName('pfat_nfat').AsString := NFe.Cobr.Fat.nFat;
        SQLQuery.ParamByName('ppesol').AsFloat := NFe.Transp.Vol[0].pesoL;
        SQLQuery.ParamByName('ppesob').AsFloat := NFe.Transp.Vol[0].pesoB;

         case NFe.Ide.indFinal of
         cfNao:SQLQuery.ParamByName('pconsumidor_final').AsString := '0';
         cfConsumidorFinal:SQLQuery.ParamByName('pconsumidor_final').AsString  := '1';
        end;
         case NFe.Dest.indIEDest of
         inContribuinte:SQLQuery.ParamByName('ptipo_contribuinte').AsString :='0';
         inIsento:SQLQuery.ParamByName('ptipo_contribuinte').AsString :='1';
         inNaoContribuinte:SQLQuery.ParamByName('ptipo_contribuinte').AsString :='2';
         end;
         SQLQuery.ParamByName('pcancelada').AsString := 'NAO';
        SQLQuery.ParamByName('picmstotal_vfrete').AsFloat := NFe.Total.ICMSTot.vFrete;
        SQLQuery.ParamByName('pnfantasiaid').AsInteger := strtoint(NFantasiaIDEdit.Text);
        SQLQuery.ParamByName('pent_saida').AsString := ComboBox1.Text;
        SQLQuery.ExecSQL;
        SQLQuery.SQL.Text := 'select max(id) as maximo from lancamento_notas_fiscais';
        SQLQuery.Open;
        idnfe := SQLQuery.FieldByName('maximo').AsInteger;;
        SQLQuery.Close;


        for i := 0 to nfe.Det.Count - 1 do
        begin

        if Grid1.Cells[5, i + 1] = '' then
        begin
          refprod := '';
          ref_prod := '';
        end
        else
        begin
          refprod := ',produto_id';
          ref_prod := ',:pproduto_id';
        end;




        SQLQuery.SQL.Text :=
          'insert into lancamento_notas_fiscais_itens '+
          '(num_nfe, infadprod,  prod_nitem,  prod_cprod,  prod_xprod,  prod_ncm,'+
  'prod_extipi, prod_cfop,  prod_ucom,  prod_qcom,  prod_vuncom,'+
  'prod_vprod,  prod_utrib,  prod_qtrib,  prod_vuntrib,  ean,  utrib,'+
  'qtrib,  vuntrib, orig,  csosn,  pcredsn,  vcredicmssn,  picms,'+
  'icmsbc,  pis_cst,  pis_vbc,  ppis,  vpis,   pconfins,  vconfins,'+
  ' pedido_compra,  item_pedido_compra,'+
  'frete,vipi, estoque_atual,'+
  'lancamento_notas_fiscais_id'+refprod+')'+
          'values'+
          '(:pnum_nfe, :pinfadprod,  :pprod_nitem,  :pprod_cprod,  :pprod_xprod,  :pprod_ncm,'+
  ':pprod_extipi, :pprod_cfop,  :pprod_ucom,  :pprod_qcom,  :pprod_vuncom,'+
  ':pprod_vprod,  :pprod_utrib,  :pprod_qtrib,  :pprod_vuntrib,  :pean,  :putrib, '+
  ':pqtrib,  :pvuntrib, :porig,  :pcsosn,  :ppcredsn,  :pvcredicmssn,  :ppicms,'+
  ':picmsbc,  :ppis_cst,  :ppis_vbc,  :pppis,  :pvpis,   :ppconfins,  :pvconfins, '+
  ':ppedido_compra,  :pitem_pedido_compra, '+
  ':pfrete,:pvipi,:pestoque_atual, '+
  ':plancamento_notas_fiscais_id'+ref_prod+' )' ;

SQLQuery.ParamByName('pnum_nfe').AsInteger := NFe.ide.nNF;
SQLQuery.ParamByName('pinfadprod').AsString := NFe.Det[i].infAdProd;
SQLQuery.ParamByName('pprod_nitem').AsInteger := NFe.Det[i].Prod.nItem ;
SQLQuery.ParamByName('pprod_cprod').AsString := NFe.Det[i].Prod.cProd;
SQLQuery.ParamByName('pprod_xprod').AsString := NFe.Det[i].Prod.xProd;
SQLQuery.ParamByName('pprod_ncm').AsString := NFe.Det[i].Prod.NCM;
SQLQuery.ParamByName('pprod_extipi').AsString := NFe.Det[i].Prod.EXTIPI;
SQLQuery.ParamByName('pprod_cfop').AsString := NFe.Det[i].Prod.CFOP ;
SQLQuery.ParamByName('pprod_ucom').AsString := NFe.Det[i].Prod.uCom;
SQLQuery.ParamByName('pprod_qcom').AsFloat := NFe.Det[i].Prod.qCom;
SQLQuery.ParamByName('pprod_vuncom').AsFloat := NFe.Det[i].Prod.vUnCom;
SQLQuery.ParamByName('pprod_vprod').AsFloat := NFe.Det[i].Prod.vProd;
SQLQuery.ParamByName('pprod_utrib').AsString := NFe.Det[i].Prod.uTrib;
SQLQuery.ParamByName('pprod_qtrib').AsFloat := NFe.Det[i].Prod.qTrib;
SQLQuery.ParamByName('pprod_vuntrib').AsFloat := NFe.Det[i].Prod.vUnTrib;
SQLQuery.ParamByName('pean').AsString := NFe.Det[i].Prod.cEAN;
SQLQuery.ParamByName('putrib').AsString := NFe.Det[i].Prod.uTrib;
SQLQuery.ParamByName('pqtrib').AsFloat := NFe.Det[i].Prod.qTrib;
SQLQuery.ParamByName('pvuntrib').AsFloat := NFe.Det[i].Prod.vUnTrib;
case  NFe.Det[i].Imposto.ICMS.orig of
oeNacional:SQLQuery.ParamByName('porig').AsString := '0';
oeEstrangeiraImportacaoDireta:SQLQuery.ParamByName('porig').AsString := '1';
oeEstrangeiraAdquiridaBrasil:SQLQuery.ParamByName('porig').AsString := '2';
oeNacionalConteudoImportacaoSuperior40:SQLQuery.ParamByName('porig').AsString := '3';
oeNacionalProcessosBasicos:SQLQuery.ParamByName('porig').AsString := '4';
oeNacionalConteudoImportacaoInferiorIgual40:SQLQuery.ParamByName('porig').AsString := '5';
oeEstrangeiraImportacaoDiretaSemSimilar:SQLQuery.ParamByName('porig').AsString := '6';
oeEstrangeiraAdquiridaBrasilSemSimilar:SQLQuery.ParamByName('porig').AsString := '7';
oeNacionalConteudoImportacaoSuperior70:SQLQuery.ParamByName('porig').AsString := '8';
end;
case  nfe.Det[i].Imposto.ICMS.CSOSN of
csosnVazio:SQLQuery.ParamByName('pcsosn').AsString := '';
csosn101:SQLQuery.ParamByName('pcsosn').AsString := '101';
csosn102:SQLQuery.ParamByName('pcsosn').AsString := '102';
csosn103:SQLQuery.ParamByName('pcsosn').AsString := '103';
csosn201:SQLQuery.ParamByName('pcsosn').AsString := '201';
csosn202:SQLQuery.ParamByName('pcsosn').AsString := '202';
csosn203:SQLQuery.ParamByName('pcsosn').AsString := '203';
csosn300:SQLQuery.ParamByName('pcsosn').AsString := '300';
csosn400:SQLQuery.ParamByName('pcsosn').AsString := '400';
csosn500:SQLQuery.ParamByName('pcsosn').AsString := '500';
csosn900:SQLQuery.ParamByName('pcsosn').AsString := '900';
end;

SQLQuery.ParamByName('ppcredsn').AsFloat := nfe.Det[i].Imposto.ICMS.pCredSN;
SQLQuery.ParamByName('pvcredicmssn').AsFloat := nfe.Det[i].Imposto.ICMS.vCredICMSSN;
SQLQuery.ParamByName('ppicms').AsFloat := NFe.Det[i].Imposto.ICMS.pICMS;
SQLQuery.ParamByName('picmsbc').AsFloat := NFe.Det[i].Imposto.ICMS.vBC;
case  NFe.Det[i].Imposto.PIS.CST of
pis01:SQLQuery.ParamByName('ppis_cst').AsString := '01';
pis02:SQLQuery.ParamByName('ppis_cst').AsString := '02';
pis03:SQLQuery.ParamByName('ppis_cst').AsString := '03';
pis04:SQLQuery.ParamByName('ppis_cst').AsString := '04';
pis05:SQLQuery.ParamByName('ppis_cst').AsString := '05';
pis06:SQLQuery.ParamByName('ppis_cst').AsString := '06';
pis07:SQLQuery.ParamByName('ppis_cst').AsString := '07';
pis08:SQLQuery.ParamByName('ppis_cst').AsString := '08';
pis09:SQLQuery.ParamByName('ppis_cst').AsString := '09';
pis49:SQLQuery.ParamByName('ppis_cst').AsString := '49';
pis50:SQLQuery.ParamByName('ppis_cst').AsString := '50';
pis51:SQLQuery.ParamByName('ppis_cst').AsString := '51';
pis52:SQLQuery.ParamByName('ppis_cst').AsString := '52';
pis53:SQLQuery.ParamByName('ppis_cst').AsString := '53';
pis54:SQLQuery.ParamByName('ppis_cst').AsString := '54';
pis55:SQLQuery.ParamByName('ppis_cst').AsString := '55';
pis56:SQLQuery.ParamByName('ppis_cst').AsString := '56';
pis60:SQLQuery.ParamByName('ppis_cst').AsString := '60';
pis61:SQLQuery.ParamByName('ppis_cst').AsString := '61';
pis62:SQLQuery.ParamByName('ppis_cst').AsString := '62';
pis63:SQLQuery.ParamByName('ppis_cst').AsString := '63';
pis64:SQLQuery.ParamByName('ppis_cst').AsString := '64';
pis65:SQLQuery.ParamByName('ppis_cst').AsString := '65';
pis66:SQLQuery.ParamByName('ppis_cst').AsString := '66';
pis67:SQLQuery.ParamByName('ppis_cst').AsString := '67';
pis70:SQLQuery.ParamByName('ppis_cst').AsString := '70';
pis71:SQLQuery.ParamByName('ppis_cst').AsString := '71';
pis72:SQLQuery.ParamByName('ppis_cst').AsString := '72';
pis73:SQLQuery.ParamByName('ppis_cst').AsString := '73';
pis74:SQLQuery.ParamByName('ppis_cst').AsString := '74';
pis75:SQLQuery.ParamByName('ppis_cst').AsString := '75';
pis98:SQLQuery.ParamByName('ppis_cst').AsString := '98';
pis99:SQLQuery.ParamByName('ppis_cst').AsString := '99';
end;

SQLQuery.ParamByName('ppis_vbc').AsFloat := NFe.Det[i].Imposto.PIS.vBC;
SQLQuery.ParamByName('pppis').AsFloat := NFe.Det[i].Imposto.PIS.pPIS;
SQLQuery.ParamByName('pvpis').AsFloat := NFe.Det[i].Imposto.PIS.vPIS;
SQLQuery.ParamByName('ppconfins').AsFloat := NFe.Det[i].Imposto.COFINS.pCOFINS;
SQLQuery.ParamByName('pvconfins').AsFloat := NFe.Det[i].Imposto.COFINS.vCOFINS;
SQLQuery.ParamByName('ppedido_compra').AsString := NFe.Det[i].Prod.xPed;
SQLQuery.ParamByName('pitem_pedido_compra').AsString := NFe.Det[i].Prod.nItemPed;
SQLQuery.ParamByName('pfrete').AsFloat := NFe.Det[i].Prod.vFrete;
SQLQuery.ParamByName('pvipi').AsFloat := NFe.Det[i].Imposto.IPI.vIPI;
SQLQuery.ParamByName('pestoque_atual').AsFloat := NFe.Det[i].Prod.qCom;
SQLQuery.ParamByName('plancamento_notas_fiscais_id').AsInteger := idnfe;
if Grid1.Cells[5, i + 1] <> '' then
SQLQuery.ParamByName('pproduto_id').AsInteger := strtoint(Grid1.Cells[5, i + 1]);

SQLQuery.ExecSQL;
        end;



 // item SQLQuery.ParamByName('prefnfe').AsString := NFe.ide.NFref.Items[1].refNFe;
   {
   SQLQuery.ParamByName('prefnf_cuf').AsString := NFe.ide.;
        SQLQuery.ParamByName('prefnf_aamm').AsString := NFe.ide.;
        SQLQuery.ParamByName('prefnf_cnpj').AsString := NFe.ide.;
        SQLQuery.ParamByName('prefnf_modelo').AsString := NFe.ide.;
        SQLQuery.ParamByName('prefnf_serie').AsString := NFe.ide.;
        SQLQuery.ParamByName('prefnf_nnf').AsString := NFe.ide.;



   }

    {     case NFe.Transp.modFrete of
         mfContaEmitente:SQLQuery.ParamByName('pmod_frete').AsInteger  := 0;
         mfContaDestinatario:SQLQuery.ParamByName('pmod_frete').AsInteger  := 1;
         mfContaTerceiros:SQLQuery.ParamByName('pmod_frete').AsInteger  := 2;
         mfSemFrete:SQLQuery.ParamByName('pmod_frete').AsInteger  := 3;
        end;

        SQLQuery.ParamByName('pvfrete').AsFloat :=NFe.Total.ICMSTot.vFrete ;
        SQLQuery.ParamByName('pvseg').AsFloat:=NFe.Total.ICMSTot.vSeg ;

        if combobox1.ItemIndex = 0 then // entrada
        begin
          SQLQuery.ParamByName('pestoque_atual').AsFloat := (NFe.Det[i].Prod.qCom);
          SQLQuery.ParamByName('pvl_tot_estoque').AsFloat :=(
            NFe.Det[i].Prod.vUnCom * ((NFe.Det[i].Imposto.IPI.pIPI/100) + 1) *
            NFe.Det[i].Prod.qCom);
          lookupSQLQuery.Close;
          lookupSQLQuery.SQL.Text :=
            'select * from cfop where descricao like :pdescricao';
          lookupSQLQuery.ParamByName('pdescricao').AsString :=
            AnsiQuotedStr(UpperCase(NFe.Det[i].Prod.CFOP), '%');
          lookupSQLQuery.Open;
          SQLQuery.ParamByName('pcfop').AsString :=
            lookupSQLQuery.FieldByName('descricao').AsString;
          lookupSQLQuery.Close;
        end
        else           // saida
        begin
          lookupSQLQuery.SQL.Text :=
            'select * from cfop where descricao like :pdescricao';
          lookupSQLQuery.ParamByName('pdescricao').AsString :=
            AnsiQuotedStr(UpperCase(NFe.Det[i].Prod.CFOP), '%');
          lookupSQLQuery.Open;
          SQLQuery.ParamByName('pestoque_atual').AsFloat := 0;
          SQLQuery.ParamByName('pcfop').AsString :=
            lookupSQLQuery.FieldByName('descricao').AsString;
          SQLQuery.ParamByName('pvl_tot_estoque').AsFloat := 0;
          lookupSQLQuery.Close;
        end;
        if Grid1.Cells[5, i + 1] <> '' then
          SQLQuery.ParamByName('pproduto_id').AsInteger := StrToInt(Grid1.Cells[5, i+1]);
        SQLQuery.ParamByName('pquant').AsFloat := NFe.Det[i].Prod.qCom;
        SQLQuery.ParamByName('pdescricao').AsString :=
          AnsiUpperCase(NFe.Det[i].Prod.xProd + '    (codigo: ' +
          NFe.Det[i].Prod.cProd + ')');
        SQLQuery.ParamByName('pvalor_unit').AsFloat := (NFe.Det[i].Prod.vUnCom);
        SQLQuery.ParamByName('pipi').AsFloat := (NFe.Det[i].Imposto.IPI.pIPI);
        SQLQuery.ParamByName('pvalor_unit_inc_ipi').AsFloat :=
          NFe.Det[i].Prod.vUnCom * ((NFe.Det[i].Imposto.IPI.pIPI/100) + 1);
        SQLQuery.ParamByName('pvl_total_item').AsFloat :=
          NFe.Det[i].Prod.vUnCom * ((NFe.Det[i].Imposto.IPI.pIPI/100) + 1) *
          NFe.Det[i].Prod.qCom;
        SQLQuery.ParamByName('pempresa_id').AsInteger := StrToInt(EmpresaIDEdit.Text);
        if NFe.Det[i].Imposto.ICMS.orig = oeNacional then
          SQLQuery.ParamByName('porigem_prod').AsString := '0';
        if NFe.Det[i].Imposto.ICMS.orig = oeEstrangeiraImportacaoDireta then
          SQLQuery.ParamByName('porigem_prod').AsString := '1';
        if NFe.Det[i].Imposto.ICMS.orig = oeEstrangeiraAdquiridaBrasil then
          SQLQuery.ParamByName('porigem_prod').AsString := '2';
        if NFe.Det[i].Imposto.ICMS.orig = oeNacionalConteudoImportacaoSuperior40 then
          SQLQuery.ParamByName('porigem_prod').AsString := '3';
        if NFe.Det[i].Imposto.ICMS.orig = oeNacionalProcessosBasicos then
          SQLQuery.ParamByName('porigem_prod').AsString := '4';
        if NFe.Det[i].Imposto.ICMS.orig = oeNacionalConteudoImportacaoInferiorIgual40 then
          SQLQuery.ParamByName('porigem_prod').AsString := '5';
        if NFe.Det[i].Imposto.ICMS.orig = oeEstrangeiraImportacaoDiretaSemSimilar then
          SQLQuery.ParamByName('porigem_prod').AsString := '6';
        if NFe.Det[i].Imposto.ICMS.orig = oeEstrangeiraAdquiridaBrasilSemSimilar then
          SQLQuery.ParamByName('porigem_prod').AsString := '7';
        SQLQuery.ExecSQL;
        Inc(i);
      end;         }
      //end;

      // cadastramento em contas a pag_rec
      SQLQuery.SQL.Text :=
        'insert into contas_pag_receb(valor,centrocusto_id,tipo,' +
        'descricao,deb_cred,data,vl_cust_merc,vl_cust_terc, ' +
        'lucro,status,observacao,codigo_cadastro,empresa)' +
        ' values(:pvalor,:pcentrocusto_id,:ptipo,:pdescricao,:pdeb_cred,:pdata,'
        + ':pvl_cust_merc,:pvl_cust_terc,:plucro,:pstatus,:pobservacao,:pcodigo_cadastro,1)';
      SQLQuery.ParamByName('pdata').AsDateTime := DateEdit1.Date;
      SQLQuery.ParamByName('pvl_cust_merc').AsFloat := 0;
      SQLQuery.ParamByName('pvl_cust_terc').AsFloat := 0;
      SQLQuery.ParamByName('plucro').AsFloat := 0;
      SQLQuery.ParamByName('pstatus').AsString := '1';
    // SQLQuery.ParamByName('pdata_pagamento').AsDate := null;
      SQLQuery.ParamByName('pobservacao').AsString := '';
      SQLQuery.ParamByName('pcentrocusto_id').AsString := SearchCCIDEdit.Text;
      SQLQuery.ParamByName('pcodigo_cadastro').AsInteger := strtoint(NFantasiaIDEdit.Text);



      if combobox1.ItemIndex = 0 then //Entrada
      begin
        SQLQuery.ParamByName('ptipo').AsString := 'A PAGAR';
        SQLQuery.ParamByName('pdeb_cred').AsString := 'D';
        SQLQuery.ParamByName('pdescricao').AsString :=
          'NFe ' + IntToStr(NFe.Ide.nNF) +' '+ NFe.Emit.xNome;
        SQLQuery.ParamByName('pvalor').AsFloat := (NFe.Total.ICMSTot.vNF) * -1;
      end;
      if combobox1.ItemIndex = 1 then  // saida
      begin
        SQLQuery.ParamByName('ptipo').AsString := 'A RECEBER';
        SQLQuery.ParamByName('pdeb_cred').AsString := 'C';
        SQLQuery.ParamByName('pdescricao').AsString :=
          'NFe ' + IntToStr(NFe.Ide.nNF) + NFe.dest.xNome;
        SQLQuery.ParamByName('pvalor').AsFloat := NFe.Total.ICMSTot.vNF;
      end;
      SQLQuery.ExecSQL;
      MainForm.MainSQLTransaction.Commit;
      NFantasiaEdit.Clear;
      NFantasiaIDEdit.Clear;
      DateEdit1.Date := now;
      ComboBox1.ItemIndex := -1;
      SearchCCIDEdit.Clear;
      SearchCCEdit.Clear;
      Label3.Caption := '';
      Grid1.RowCount := 1;
    except
      on E: Exception do
      begin
        MainForm.MainSQLTransaction.Rollback;
        MsgError(E.ClassName, E.Message);
      end;
    end;
  end;
  NFeR.Free;
  NFe.Free;
  //xml_ent_imp.Close;

end;

procedure Txml_ent_imp.AbrirSpeedButtonClick(Sender: TObject);
var
  cnpjemit, cnpjdest: string;
begin
  if OpenDialog1.Execute then
  begin
    xmlfile := OpenDialog1.FileName;
    ComboBox1.ItemIndex := -1;
    NFe := TNFe.Create;
    // Criar o objeto que recebera dos dados da leitura

    (* Leitura *)
    NFeR := TNFeR.Create(NFe);
    NFeR.Leitor.CarregarArquivo(xmlfile);
    NFeR.LerXml;
    Label3.Caption := 'Nota Fiscal Numero: ' + IntToStr(NFe.Ide.nNF);
   // if(NFe.Emit.CNPJCPF='0')then
   //// ComboBox1.ItemIndex := 1 else
    ComboBox1.ItemIndex := 0 ;


    MainForm.MainSQLTransaction.StartTransaction;
    try

      cnpjemit := NFe.Emit.CNPJCPF;
      Insert('.', cnpjemit, 3);
      Insert('.', cnpjemit, 7);
      Insert('/', cnpjemit, 11);
      Insert('-', cnpjemit, 16);
      if (Length(NFe.dest.CNPJCPF) = 14) then
      begin
        cnpjdest := NFe.dest.CNPJCPF;
        Insert('.', cnpjdest, 3);
        Insert('.', cnpjdest, 7);
        Insert('/', cnpjdest, 11);
        Insert('-', cnpjdest, 16);
      end
      else
      begin
        cnpjdest := NFe.dest.CNPJCPF;
        Insert('.', cnpjdest, 4);
        Insert('.', cnpjdest, 8);
        Insert('-', cnpjdest, 12);
      end;

    {  SQLQuery.SQL.Text :=
        'select * from empresa where cnpj like :pcnpj';
      SQLQuery.ParamByName('pcnpj').AsString := cnpjemit;
      SQLQuery.Open;
      if SQLQuery.FieldByName('codigo').IsNull then
        ComboBox1.ItemIndex := 0
      else
        ComboBox1.ItemIndex := 1;
                            }
      if ComboBox1.ItemIndex = 0 then   //entrada
      begin
       // SQLQuery.Close;
        SQLQuery.SQL.Text := 'select * from cadastro where cnpj like :pcnpj';
        SQLQuery.ParamByName('pcnpj').AsString := cnpjemit;
        SQLQuery.Open;
        if SQLQuery.IsEmpty then
          ShowMessage('Verifique se(' + NFe.Emit.xNome +
            ')foi cadastrado corretamente.');
        NFantasiaEdit.Text := SQLQuery.FieldByName('nome').AsString;
        NFantasiaIDEdit.Text := SQLQuery.FieldByName('codigo').AsString;
      end;

      if ComboBox1.ItemIndex = 1 then  //saida
      begin
        SQLQuery.SQL.Text :=
          'select * from cadastro where cnpj like :pcnpj';
        SQLQuery.ParamByName('pcnpj').AsString := cnpjdest;
        SQLQuery.Open;
        if SQLQuery.FieldByName('codigo').IsNull then
          ShowMessage('Verifique se(' + NFe.dest.xNome +
            ')foi cadastrado corretamente.');
        NFantasiaEdit.Text := SQLQuery.FieldByName('nome').AsString;
        NFantasiaIDEdit.Text := SQLQuery.FieldByName('codigo').AsString;
      end;
      MainForm.MainSQLTransaction.Commit;
    except
      on E: Exception do
      begin
        MainForm.MainSQLTransaction.Rollback;
        MsgError(E.ClassName, E.Message);
      end;
    end;

    Grid1.ColCount := 6;
    Grid1.ColWidths[1] := 400;
    //define a largura da coluna
    Grid1.ColWidths[3] := 45;
    Grid1.Cells[0, 0] := 'QUANT';
    //define O TITULO
    Grid1.Cells[1, 0] := '.                                 DESCRIÇÃO';
    Grid1.Cells[2, 0] := 'VR.UNIT.';
    Grid1.Cells[3, 0] := 'IPI %';
    Grid1.Cells[4, 0] := 'VR.TOT.';
    Grid1.Cells[5, 0] := 'Ref.Produto';
    Grid1.RowCount := nfe.Det.Count + 1;
    //define O numero de linhas
    for i := 0 to nfe.Det.Count - 1 do
    begin
      Grid1.Cells[0, i + 1] := currtostr(NFe.Det[i].Prod.qCom);
      Grid1.Cells[1, i + 1] :=
        AnsiUpperCase(NFe.Det[i].Prod.xProd + '    (codigo: ' +
        NFe.Det[i].Prod.cProd + ')');
      Grid1.Cells[2, i + 1] := FormatFloat('#0.0000', NFe.Det[i].Prod.vUnCom);
      Grid1.Cells[3, i + 1] := FormatFloat('#0.00', NFe.Det[i].Imposto.IPI.pIPI);
      Grid1.Cells[4, i + 1] := FormatFloat('#0.0000', NFe.Det[i].Prod.vProd);
    end;

    DateEdit1.Date := NFe.Ide.dEmi;
    NFeR.Free;
    NFe.Free;
  end;
end;

procedure Txml_ent_imp.criagrid(controleDesc, controleId: TEdit;
  sql, campoID, campoDesc: string);
begin
  mgrid.Parent := controleDesc.Parent;
  contrId := controleId;
  contrDesc := controleDesc;
  mgrid.top := controleDesc.Top + 20;
  mgrid.Color := clCream;
  mgrid.Left := controleDesc.Left;
  mgrid.AnchorSideTop.Control := controleDesc;
  mgrid.AnchorSideTop.Side := asrRight;
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
        mgrid.Height := 100;
        mgrid.ColWidths[0] := 250;
        mgrid.ColWidths[1] := 0;
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
    mbotao.AnchorSideTop.Control := mgrid;
    mbotao.AnchorSideTop.Side := asrRight;
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
end;

procedure Txml_ent_imp.Seleciona(Sender: TObject; aCol, aRow: integer);
begin
  textodesc := mGrid.Cells[0, aRow];
  textoID := mGrid.Cells[1, aRow];
end;

procedure Txml_ent_imp.click(Sender: TObject);
begin
  mgrid.Hide;
  mbotao.Hide;
  if Assigned(contrDesc) then
    contrDesc.Text := textodesc;
  if Assigned(contrid) then
    contrid.Text := textoid;
end;

procedure Txml_ent_imp.bclica(Sender: TObject);
begin
  mgrid.Hide;
  mbotao.Hide;
end;

procedure Txml_ent_imp.MsgError(const AClassName, AMsg: string);
const
  CMsg = 'Error in class "%s": %s';
begin
  Application.MessageBox(PChar(Format(CMsg, [AClassName, AMsg])),
    PChar(Application.Title), MB_ICONERROR + MB_OK);
end;


initialization
  {$I xml_ent_import.lrs}

end.

