
unit es_nf;

{$mode objfpc}{$H+}

interface

uses
  LCLIntf, LCLType, LResources, SysUtils, Classes, sqldb, Forms, Dialogs, Grids,
  StdCtrls, ComCtrls, Buttons, Graphics, EditBtn, Controls, ExtCtrls,dateutils;

type

  { TTF_ES_NF }

  TTF_ES_NF = class(TForm)
    CfopEdit1: TEdit;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Edit1: TEdit;
    idnfeEdit3: TEdit;
    Label19: TLabel;
    Label26: TLabel;
    Label32: TLabel;
    NFantasiaIDEdit: TEdit;
    Label10: TLabel;
    Label15: TLabel;
    RazaoSocialEdit: TEdit;
    EstoquePesquisaEdit: TEdit;
    Edit2: TEdit;
    DescricaoPesquisaEdit: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    idnfcompEdit: TEdit;
    idcompEdit: TEdit;
    EmpresaIDEdit1: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label14: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    Label6: TLabel;
    NFantasiaEdit1: TEdit;
    NFantasiaIDEdit1: TEdit;
    OrigemProdidEdit: TEdit;
    Label17: TLabel;
    OrigemProdEdit: TEdit;
    ReferenciaProdutoIDEdit: TEdit;
    EnfSQLQuery: TSQLQuery;
    Label16: TLabel;
    ReferenciaProdutoEdit: TEdit;
    LimparPesqBtn: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    SQLQuery: TSQLQuery;
    SQLQuery1: TSQLQuery;
    StatusBar1: TStatusBar;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    xmlBitBtn: TBitBtn;
    btnExcluir: TButton;
    btnInserir: TButton;
    BtnLimpar: TButton;
    ComboBox1: TComboBox;
    NumNfEdit: TEdit;
    VrUnitCIpiEdit: TEdit;
    IpiEdit: TEdit;
    idEdit: TEdit;
    CfopEdit: TEdit;
    NcmEdit: TEdit;
    EanEdit: TEdit;
    EstoqueAtualEdit: TEdit;
    QuantEdit: TEdit;
    DescricaoEdit: TEdit;
    VrUnitEdit: TEdit;
    EmissaoDateEdit: TDateEdit;
    Label1: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DataLabel14: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    NFantasiaEdit: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure btnExcluirClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure CfopEdit1Click(Sender: TObject);
    procedure CfopEdit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure CfopEditClick(Sender: TObject);
    procedure CfopEditKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox2EditingDone(Sender: TObject);
    procedure DescricaoEditKeyUp(Sender: TObject; var Key: word;
      Shift: TShiftState);
    procedure Edit1EditingDone(Sender: TObject);
    procedure Edit2EditingDone(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure EmpresaIDEdit1Change(Sender: TObject);
    procedure EstoqueAtualEditEditingDone(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure idcompEditChange(Sender: TObject);
    procedure idEditChange(Sender: TObject);
    procedure idnfcompEditChange(Sender: TObject);
    procedure LimparPesqBtnClick(Sender: TObject);
    procedure NFantasiaEdit1Click(Sender: TObject);
    procedure NFantasiaEdit1KeyUp(Sender: TObject; var Key: word;
      Shift: TShiftState);
    procedure NFantasiaEditClick(Sender: TObject);
    procedure NFantasiaEditKeyUp(Sender: TObject; var Key: word;
      Shift: TShiftState);
    procedure OrigemProdEditClick(Sender: TObject);
    procedure OrigemProdEditKeyUp(Sender: TObject; var Key: word;
      Shift: TShiftState);
    procedure ReferenciaProdutoEditClick(Sender: TObject);
    procedure ReferenciaProdutoEditKeyUp(Sender: TObject; var Key: word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1PrepareCanvas(Sender: TObject; aCol, aRow: integer;
      aState: TGridDrawState);
    procedure StringGrid1Selection(Sender: TObject; aCol, aRow: integer);
    procedure StringGrid2DblClick(Sender: TObject);
    procedure StringGrid2Selection(Sender: TObject; aCol, aRow: integer);
    procedure StringGrid3DblClick(Sender: TObject);
    procedure StringGrid3Selection(Sender: TObject; aCol, aRow: integer);
    procedure xmlBitBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure criagrid(controleDesc, controleId: TEdit;
      sql, campoID, campoDesc: string);
    procedure Seleciona(Sender: TObject; aCol, aRow: integer);
    procedure click(Sender: TObject);
    procedure bclica(Sender: TObject);
    procedure MsgError(const AClassName, AMsg: string);
    procedure formatar;
    procedure atualiza_pesquisa;
    procedure atualiza_composicao;
    procedure atualiza_griditem;
  end;

var
  TF_ES_NF: TTF_ES_NF;
  textoID, textodesc, vidnf, vidnfitem, vidnfitemdesc, vcodid: string;
  mgrid: TStringGrid;
  mbotao: TButton;
  LookupSQLQuery: TSQLQuery;
  contrDesc, contrId: TEdit;
  vidcomp, vidnfcomp, vquantcomp: string;
  linhapesquisa: integer;


implementation

{$R *.lfm}
uses
  mainfrm, xml_ent_import,Frm_SPEDFiscal;

{ TTF_ES_NF }

procedure TTF_ES_NF.BtnLimparClick(Sender: TObject);
begin
  ReferenciaProdutoEdit.Clear;
  ReferenciaProdutoIDEdit.Clear;
  OrigemProdEdit.Clear;
  OrigemProdidEdit.Clear;
  btnExcluir.Enabled := False;
  btnInserir.Enabled := False;
  //CheckBox1.Checked := False;
  ComboBox1.ItemIndex := -1;
  NumNfEdit.Clear;
  VrUnitCIpiEdit.Text := '0,00';
  IpiEdit.Text := '0,00';
  idEdit.Clear;
  CfopEdit.Clear;
  NcmEdit.Clear;
  EanEdit.Clear;
  EstoqueAtualEdit.Text := '0';
  QuantEdit.Text := '0,0';
  DescricaoEdit.Clear;
  VrUnitEdit.Text := '0,00';
  EmissaoDateEdit.Date := now;
  NFantasiaEdit.Clear;
  NFantasiaIDEdit.Clear;
 // atualiza_composicao;
  StringGrid3.RowCount := 1;
  //SpeedButton3Click(Sender);

end;

procedure TTF_ES_NF.CfopEdit1Click(Sender: TObject);
begin
  CfopEdit1.Clear;
  criagrid(CfopEdit1, nil,
    'select *  from cfop where descricao like :parametro order by codigo asc',
    'codigo', 'descricao');
end;

procedure TTF_ES_NF.CfopEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   criagrid(CfopEdit1, nil,
    'select *  from cfop where descricao like :parametro order by codigo asc',
    'codigo', 'descricao');
end;

procedure TTF_ES_NF.CfopEditClick(Sender: TObject);
begin
  CfopEdit.Clear;
  criagrid(CfopEdit, nil,
    'select *  from cfop where descricao like :parametro order by codigo asc',
    'codigo', 'descricao');
end;

procedure TTF_ES_NF.CfopEditKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  criagrid(CfopEdit, nil,
    'select *  from cfop where descricao like :parametro order by codigo asc',
    'codigo', 'descricao');
end;

procedure TTF_ES_NF.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.Text = 'SAIDA' then
    GroupBox1.Enabled := True
  else
  begin
    GroupBox1.Enabled := False;
    StatusBar1.Panels[0].Text := '';
  end;
end;

procedure TTF_ES_NF.ComboBox1Select(Sender: TObject);
begin
  btninserir.Enabled := True;
end;

procedure TTF_ES_NF.ComboBox2Change(Sender: TObject);
begin
  atualiza_pesquisa;
end;

procedure TTF_ES_NF.ComboBox2EditingDone(Sender: TObject);
begin
  atualiza_pesquisa;
end;

procedure TTF_ES_NF.DescricaoEditKeyUp(Sender: TObject; var Key: word;
  Shift: TShiftState);
begin
  btnInserir.Enabled := True;
end;

procedure TTF_ES_NF.Edit1EditingDone(Sender: TObject);
begin
  atualiza_pesquisa;
end;

procedure TTF_ES_NF.Edit2EditingDone(Sender: TObject);
begin
  atualiza_pesquisa;
end;

procedure TTF_ES_NF.Edit3Change(Sender: TObject);
begin
  atualiza_pesquisa();
end;

procedure TTF_ES_NF.Edit4Change(Sender: TObject);
begin
  atualiza_griditem;
end;

procedure TTF_ES_NF.EmpresaIDEdit1Change(Sender: TObject);
begin
  atualiza_pesquisa;
end;

procedure TTF_ES_NF.EstoqueAtualEditEditingDone(Sender: TObject);
begin
  formatar;
end;

procedure TTF_ES_NF.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Excluir o Registro e Sub-registros ?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    MainForm.MainSQLTransaction.StartTransaction;
    try
      EnfSQLQuery.SQL.Text := 'delete  from lancamento_notas_fiscais_itens_baixa where id_item = '+IdEdit.Text;
 //     EnfSQLQuery.ParamByName('pnum_nf').AsInteger := StrToInt(IdEdit.Text);
      EnfSQLQuery.ExecSQL;
      EnfSQLQuery.SQL.Text := 'delete from lancamento_notas_fiscais_itens where id = '+IdEdit.Text;
    //  EnfSQLQuery.ParamByName('pid').AsInteger := StrToInt(IdEdit.Text);
      EnfSQLQuery.ExecSQL;
      MainForm.MainSQLTransaction.Commit;
      BtnLimparClick(Sender);
      btnExcluir.Enabled := False;
    //  atualiza_composicao;
    except
      on E: Exception do
      begin
        MainForm.MainSQLTransaction.Rollback;
        MsgError(E.ClassName, E.Message);
      end;
    end;
  end;
end;

procedure TTF_ES_NF.btnInserirClick(Sender: TObject);
var
  ref_prod, reff_prod, refprod: string;
begin
  MainForm.MainSQLTransaction.StartTransaction;
  try
   EnfSQLQuery.SQL.Text := 'update lancamento_notas_fiscais_itens set produto_id='+
   ReferenciaProdutoIDEdit.Text +' where id = '+ idEdit.Text ;
   EnfSQLQuery.ExecSQL;
   MainForm.MainSQLTransaction.Commit;
   BtnLimparClick(Sender);

      btnInserir.Enabled := False;
  except
    on E: Exception do
    begin
      MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end
 { MainForm.MainSQLTransaction.StartTransaction;
  try
    if ReferenciaProdutoIDEdit.Text <> '' then
    begin
      ref_prod := ',produto_id';
      reff_prod := ',:pproduto_id';
      refprod := ',produto_id = :pproduto_id';
    end
    else
    begin
      ref_prod := '';
      reff_prod := '';
      refprod := '';
    end;

    if IdEdit.Text = '' then
      EnfSQLQuery.SQL.Text := 'insert into lancamento_notas_fiscais_itens(quant, valor_unit,' +
        'estoque_atual,num_nf_forn,ipi,valor_unit_inc_ipi,descricao,ent_saida,' +
        'cfop,vl_total_item,vl_tot_estoque,empresa_id, dt_emis, ncm,' +
        'origem_prod,nfantasiaid,ean' + ref_prod +
        ') values(:pquant,:pvalor_unit,:pestoque_atual,:pnum_nf_forn,:pipi,' +
        ':pvalor_unit_inc_ipi,:pdescricao,:pent_saida,:pcfop,:pvl_total_item,:pvl_tot_estoque,'
        + ':pempresa_id ,:pdt_emis ,:pncm ,:porigem_prod,:pnfantasiaid,:pean' +
        reff_prod + ')'
    else
    begin
      EnfSQLQuery.SQL.Text :=
        'update lancamento_notas_fiscais_itens set quant = :pquant, valor_unit = :pvalor_unit,' +
        'estoque_atual = :pestoque_atual,num_nf_forn = :pnum_nf_forn,ipi = :pipi,' +
        'valor_unit_inc_ipi = :pvalor_unit_inc_ipi,descricao = :pdescricao,ent_saida = :'
        +
        'pent_saida,cfop = :pcfop,vl_total_item = :pvl_total_item,vl_tot_estoque = :pvl_tot_estoque,'
        + 'empresa_id = :pempresa_id , dt_emis = :pdt_emis , ncm = :pncm ,' +
        'origem_prod= :porigem_prod,nfantasiaid = :pnfantasiaid,ean = :pean' +
        refprod + '   where id = :pid';
      EnfSQLQuery.ParamByName('pid').AsInteger := StrToInt(IdEdit.Text);
    end;
    EnfSQLQuery.ParamByName('pdt_emis').AsDateTime := EmissaoDateEdit.Date;
    EnfSQLQuery.ParamByName('pent_saida').AsString := ComboBox1.Text;
    EnfSQLQuery.ParamByName('pnum_nf_forn').AsInteger := StrToInt(NumNfEdit.Text);
    EnfSQLQuery.ParamByName('pnfantasiaid').AsInteger := StrToInt(NFantasiaIDEdit.Text);
    //  EnfSQLQuery.ParamByName('praz_soc').AsString :='';
    EnfSQLQuery.ParamByName('pcfop').AsString := CfopEdit.Text;
    EnfSQLQuery.ParamByName('pncm').AsString := NcmEdit.Text;
    EnfSQLQuery.ParamByName('pean').AsString := EanEdit.Text;
    EnfSQLQuery.ParamByName('pestoque_atual').AsFloat :=
      strtofloat(EstoqueAtualEdit.Text);
    EnfSQLQuery.ParamByName('pvl_tot_estoque').AsFloat :=
      strtofloat(ValorEstoqueEdit.Text);
    if ReferenciaProdutoIDEdit.Text <> '' then
      EnfSQLQuery.ParamByName('pproduto_id').AsInteger :=
        StrToInt(ReferenciaProdutoIDEdit.Text);
    EnfSQLQuery.ParamByName('pquant').AsFloat := strtofloat(QuantEdit.Text);
    EnfSQLQuery.ParamByName('pdescricao').AsString := DescricaoEdit.Text;
    EnfSQLQuery.ParamByName('pvalor_unit').AsFloat := strtofloat(VrUnitEdit.Text);
    EnfSQLQuery.ParamByName('pipi').AsFloat := strtofloat(IpiEdit.Text);
    EnfSQLQuery.ParamByName('pvalor_unit_inc_ipi').AsFloat :=
      strtofloat(VrUnitCIpiEdit.Text);
    EnfSQLQuery.ParamByName('pvl_total_item').AsFloat := strtofloat(VrtotalEdit.Text);
    EnfSQLQuery.ParamByName('pempresa_id').AsInteger := StrToInt(EmpresaIDEdit.Text);
    EnfSQLQuery.ParamByName('porigem_prod').AsInteger := StrToInt(OrigemProdidEdit.Text);
    EnfSQLQuery.ExecSQL;
    MainForm.MainSQLTransaction.Commit;
    atualiza_pesquisa;
    if ((CheckBox1.Checked) and (IdEdit.Text = '')) then
    begin
      ReferenciaProdutoEdit.Clear;
      ReferenciaProdutoIDEdit.Clear;
      OrigemProdEdit.Clear;
      OrigemProdidEdit.Clear;
      VrtotalEdit.Text := '0,00';
      VrUnitCIpiEdit.Text := '0,00';
      IpiEdit.Text := '0,00';
      idEdit.Clear;
      CfopEdit.Clear;
      NcmEdit.Clear;
      EanEdit.Clear;
      EstoqueAtualEdit.Text := '0';
      ValorEstoqueEdit.Text := '0,00';
      QuantEdit.Text := '0,0';
      DescricaoEdit.Clear;
      VrUnitEdit.Text := '0,00';
    end
    else
      BtnLimparClick(Sender);

    //  BuscaEditChange(self);
    btnInserir.Enabled := False;
  except
    on E: Exception do
    begin
      MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end; }
end;

procedure TTF_ES_NF.FormCreate(Sender: TObject);
begin
  mgrid := TStringGrid.Create(TF_ES_NF);
  mbotao := TButton.Create(mgrid);
  mbotao.Hide;
  mgrid.Hide;
  LookupSQLQuery := TSQLQuery.Create(TF_ES_NF);
  LookupSQLQuery.DataBase := MainForm.MainSQLConnector;
  LookupSQLQuery.Transaction := MainForm.MainSQLTransaction;
  LookupSQLQuery.PacketRecords := -1;
  EnfSQLQuery.DataBase := MainForm.MainSQLConnector;
  EnfSQLQuery.Transaction := MainForm.MainSQLTransaction;
  SQLQuery1.PacketRecords := -1;
  SQLQuery1.DataBase := MainForm.MainSQLConnector;
  SQLQuery1.Transaction := MainForm.MainSQLTransaction;
  EnfSQLQuery.PacketRecords := -1;
  SQLQuery.DataBase := MainForm.MainSQLConnector;
  SQLQuery.Transaction := MainForm.MainSQLTransaction;
  SQLQuery.PacketRecords := -1;
  BtnLimparClick(Sender);
  DateEdit1.Date := StartOfTheYear(now);
  DateEdit2.Date := strtodate('01/01/2099');
  EmpresaIDEdit1.Text := '1';
  PageControl1.ActivePage := TabSheet2;
  StringGrid1.Options := StringGrid1.Options + [goColSizing];
  StringGrid1.ColCount := 10;
  StringGrid1.FixedCols := 0;
  StringGrid1.ColWidths[0] := 100;
  StringGrid1.ColWidths[5] := 450;
  StringGrid1.ColWidths[6] := 350;
  StringGrid1.ColWidths[7] := 100;
  StringGrid1.ColWidths[8] := 0;
  StringGrid1.ColWidths[8] := 100;
  StringGrid1.Cells[0, 0] := 'Data';
  StringGrid1.Cells[1, 0] := 'Quant';
  StringGrid1.Cells[2, 0] := 'Vr Unit';
  StringGrid1.Cells[3, 0] := 'Estoque';
  StringGrid1.Cells[4, 0] := 'Num. NF';
  StringGrid1.Cells[5, 0] := 'Descricao';
  StringGrid1.Cells[6, 0] := 'Nome';
  StringGrid1.Cells[7, 0] := 'Entr/Sai';
  StringGrid1.Cells[8, 0] := 'id';
  StringGrid1.Cells[9, 0] := 'Vr Un c ipi';
  StringGrid2.ColCount :=9;
  StringGrid2.FixedCols := 0;
  StringGrid2.ColWidths[0] := 480;
  StringGrid2.ColWidths[2] := 100;
  StringGrid2.ColWidths[3] := 100;
  StringGrid2.ColWidths[6] := 0;
  StringGrid2.Cells[0, 0] := 'descricao';
  StringGrid2.Cells[1, 0] := 'Estoque';
  StringGrid2.Cells[2, 0] := 'Fornecedor';
  StringGrid2.Cells[3, 0] := 'Data';
  StringGrid2.Cells[4, 0] := 'Num. NF';
  StringGrid2.Cells[5, 0] := 'Valor';
  StringGrid2.Cells[6, 0] := 'id';
end;

procedure TTF_ES_NF.idcompEditChange(Sender: TObject);
begin
  if idcompEdit.Text <> '' then
    SpeedButton2.Enabled := True
  else
    SpeedButton2.Enabled := False;
end;

procedure TTF_ES_NF.idEditChange(Sender: TObject);
begin
  if IdEdit.Text = '' then
  begin
    btnInserir.Caption := 'Inserir';
    btnExcluir.Enabled := False;
  end
  else
  begin
    btnInserir.Caption := 'Alterar';
    btnExcluir.Enabled := True;
  end;
  if ComboBox1.Text = 'SAIDA' then
    GroupBox1.Enabled := True
  else
  begin
    GroupBox1.Enabled := False;
    StatusBar1.Panels[0].Text := '';
  end;

end;

procedure TTF_ES_NF.idnfcompEditChange(Sender: TObject);
begin
  if idnfcompEdit.Text = '' then
    SpeedButton1.Enabled := False
  else
    SpeedButton1.Enabled := True;
end;

procedure TTF_ES_NF.LimparPesqBtnClick(Sender: TObject);
begin
  NFantasiaEdit1.Clear;
  NFantasiaIDEdit1.Clear;
  Edit2.Clear;
  EstoquePesquisaEdit.Text := '-1';
  DescricaoPesquisaEdit.Clear;
  DateEdit1.Date :=StartOfTheYear(now);
  DateEdit2.Date := strtodate('01/01/2099');
  ComboBox2.ItemIndex := 0;
  CfopEdit.Clear;
  //EmpresaEdit1.Clear;
  //EmpresaIDEdit1.Text := '1';
  StringGrid1.RowCount := 1;
  Label32.Caption := '';




{  MainForm.MainSQLTransaction.StartTransaction;
  try
    EnfSQLQuery.SQL.Text := 'select * from empresa where codigo = :pcodigo';
    EnfSQLQuery.ParamByName('pcodigo').AsInteger := 1;
    EnfSQLQuery.Open;
    EmpresaEdit1.Text := EnfSQLQuery.FieldByName('razao_social').AsString;
    MainForm.MainSQLTransaction.Commit;
  except
    on E: Exception do
    begin
      MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;}
 // atualiza_pesquisa;
end;

procedure TTF_ES_NF.NFantasiaEdit1Click(Sender: TObject);
begin
  NFantasiaEdit1.Clear;
  criagrid(NFantasiaEdit1, NFantasiaIDEdit1,
    'select *  from cadastro where apelido like :parametro  order by apelido',
    'codigo', 'apelido');
end;

procedure TTF_ES_NF.NFantasiaEdit1KeyUp(Sender: TObject; var Key: word;
  Shift: TShiftState);
begin
  criagrid(NFantasiaEdit1, NFantasiaIDEdit1,
    'select *  from cadastro where (apelido like :parametro) or ' +
    '(nome like :parametro)or (cnpj like :parametro) or ' +
    '(inscricao_estadual like :parametro)or (tipo_cadastro like :parametro)' +
    'or (fax like :parametro) or (UPPER(site) like :parametro)' +
    ' order by apelido asc',
    'codigo', 'apelido');
end;

procedure TTF_ES_NF.NFantasiaEditClick(Sender: TObject);
begin
  NFantasiaEdit.Clear;
  criagrid(NFantasiaEdit, NFantasiaIDEdit,
    'select *  from cadastro where apelido like :parametro  order by apelido',
    'codigo', 'apelido');
end;

procedure TTF_ES_NF.NFantasiaEditKeyUp(Sender: TObject; var Key: word;
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

procedure TTF_ES_NF.OrigemProdEditClick(Sender: TObject);
begin
  OrigemProdEdit.Clear;
  criagrid(OrigemProdEdit, OrigemProdidEdit,
    'select * from origem_prod where descricao like :parametro',
    'codigo', 'descricao');
end;

procedure TTF_ES_NF.OrigemProdEditKeyUp(Sender: TObject; var Key: word;
  Shift: TShiftState);
begin
  criagrid(OrigemProdEdit, OrigemProdidEdit,
    'select *  from origem_prod where descricao like :parametro',
    'codigo', 'descricao');
end;

procedure TTF_ES_NF.ReferenciaProdutoEditClick(Sender: TObject);
begin
  // ReferenciaProdutoEdit.Clear;
  criagrid(ReferenciaProdutoEdit, ReferenciaProdutoIDEdit,
    'select * from produtos where (cod_prod like :parametro)or(descricao like :parametro)   order by descricao asc',
    'codigo', 'descricao');
end;

procedure TTF_ES_NF.ReferenciaProdutoEditKeyUp(Sender: TObject;
  var Key: word; Shift: TShiftState);
begin
  criagrid(ReferenciaProdutoEdit, ReferenciaProdutoIDEdit,
    'select *  from produtos where (cod_prod like :parametro)or(descricao like :parametro)   order by descricao asc',
    'codigo', 'descricao');
end;

procedure TTF_ES_NF.SpeedButton1Click(Sender: TObject);
var
  estoqueOld, estoqueAtual, quant, quant2, quant3: double;
  valorunitcomipi:double;
  descOld: string;
  baixar, baixar2: boolean;
begin
  if ((Edit5.Text = '') or (idnfcompEdit.Text = '') or (StrToInt(Edit5.Text) <= 0)) then
  begin
    ShowMessage('Corrija os campos');
    exit;
  end;

  if ComboBox3.ItemIndex = 0 then
  begin
    MainForm.MainSQLTransaction.StartTransaction;
    try
      EnfSQLQuery.SQL.Text :=
        'insert into lancamento_notas_fiscais_itens_baixa'+
        '(quantidade,id_item,id_item_baixado) '+
        'values(:pquantidade,:pid_item,:pid_item_baixado)';
      EnfSQLQuery.ParamByName('pquantidade').AsFloat := strtofloat(Edit5.Text);
      //EnfSQLQuery.ParamByName('pnum_nf').AsInteger :=   StrToInt(idnfeEdit3.Text );
      EnfSQLQuery.ParamByName('pid_item').AsInteger := StrToInt(idEdit.Text );
    //  EnfSQLQuery.ParamByName('pid_lanc_nf').AsInteger :=StrToInt(idnfeEdit3.Text);
      EnfSQLQuery.ParamByName('pid_item_baixado').AsInteger :=  StrToInt(idnfcompEdit.Text);
      EnfSQLQuery.ExecSQL;

      enfSQLQuery.SQL.Text := 'select * from lancamento_notas_fiscais_itens where id = '+idnfcompEdit.Text;
     // enfSQLQuery.ParamByName('pid').AsInteger := StrToInt(idnfcompEdit.Text);
      enfSQLQuery.Open;
      estoqueOld := EnfSQLQuery.FieldByName('estoque_atual').AsFloat;
      descOld := EnfSQLQuery.FieldByName('prod_xprod').AsString;
      valorunitcomipi:= EnfSQLQuery.FieldByName('prod_vuncom').AsFloat;

      estoqueAtual := estoqueOld - strtofloat(Edit5.Text);
      if estoqueAtual < 0 then
        raise Exception.Create('Quantidade insuficiente no estoque: ' + descOld);

      EnfSQLQuery.Close;
      EnfSQLQuery.SQL.Text :=
        'update lancamento_notas_fiscais_itens set estoque_atual = :pestoque_atual where id = '+idnfcompEdit.Text;
      EnfSQLQuery.ParamByName('pestoque_atual').AsFloat := estoqueAtual;
    //  EnfSQLQuery.ParamByName('pid').AsInteger := StrToInt(idnfcompEdit.Text);
     // EnfSQLQuery.ParamByName('pvl_tot_estoque').AsFloat := estoqueAtual * valorunitcomipi;

      EnfSQLQuery.ExecSQL;
      MainForm.MainSQLTransaction.Commit;
      SpeedButton3Click(self);
      atualiza_griditem;
    except
      on E: Exception do
      begin
        MainForm.MainSQLTransaction.Rollback;
        MsgError(E.ClassName, E.Message);
      end;
    end;
  end;
  if ComboBox3.ItemIndex = 1 then
  begin
    MainForm.MainSQLTransaction.StartTransaction;
    try
      SQLQuery.Close;
      SQLQuery.SQL.Text :=
        'select * from produtos_composicao where id_produto = '+idnfcompEdit.Text+' order by id asc';
     // SQLQuery.ParamByName('pid_produto').AsInteger := StrToInt(idnfcompEdit.Text);
      SQLQuery.Open;
      if SQLQuery.IsEmpty then
        raise Exception.Create('Nao ha itens cadastrados no produto escolhido');
      SQLQuery.First;
      while not SQLQuery.EOF do
      begin
        EnfSQLQuery.Close;
        EnfSQLQuery.SQL.Text :=
          'select lancamento_notas_fiscais_itens.*,lancamento_notas_fiscais.ent_saida from lancamento_notas_fiscais_itens '+
          'INNER JOIN lancamento_notas_fiscais '+
          'ON lancamento_notas_fiscais_itens.lancamento_notas_fiscais_id = lancamento_notas_fiscais.id '+


          ' where produto_id = :pproduto_id' +
        //  ' and empresa_id = 1
          ' and ent_saida like' +quotedstr('ENTRADA') +
          ' and estoque_atual >0 and ide_demi <= :pide_demi order by ide_demi asc';
        EnfSQLQuery.ParamByName('pide_demi').AsDateTime := EmissaoDateEdit.Date;
        EnfSQLQuery.ParamByName('pproduto_id').AsInteger :=
          SQLQuery.FieldByName('id_itemproduto').AsInteger;
        EnfSQLQuery.Open;
        EnfSQLQuery.First;
        if EnfSQLQuery.IsEmpty then
          raise Exception.Create('Nao e possivel baixar estoque no item: ' +
            Edit6.Text + ',Possivel Falta de 1 dos itens');
        quant := strtofloat(edit5.Text) * SQLQuery.FieldByName('quantidade').AsFloat;
        while quant <> 0 do
        begin
          if quant > EnfSQLQuery.FieldByName('estoque_atual').AsFloat then
          begin
            SQLQuery1.Close;
            SQLQuery1.SQL.Text :=
           //   'insert into lancamento_notas_fiscais_itens_baixa(quantidade,num_nf,id_lanc_nf) values(:pquantidade,:pnum_nf,:pid_lanc_nf)';
           'insert into lancamento_notas_fiscais_itens_baixa'+
        '(quantidade,id_item,id_item_baixado) '+
        'values(:pquantidade,:pid_item,:pid_item_baixado)';


            SQLQuery1.ParamByName('pquantidade').AsFloat := EnfSQLQuery.FieldByName('estoque_atual').AsFloat;
            //strtofloat(Edit5.Text)*  SQLQuery.FieldByName('quantidade').AsFloat;
            SQLQuery1.ParamByName('pid_item').AsInteger := StrToInt(idEdit.Text );
            SQLQuery1.ParamByName('pid_item_baixado').AsInteger :=
              EnfSQLQuery.FieldByName('id').AsInteger;
            SQLQuery1.ExecSQL;
            quant := quant - EnfSQLQuery.FieldByName('estoque_atual').AsFloat;
            SQLQuery1.Close;
            SQLQuery1.SQL.Text :=
              'update lancamento_notas_fiscais_itens set estoque_atual = :pestoque_atual where id = :pid';
            SQLQuery1.ParamByName('pid').AsInteger :=
              EnfSQLQuery.FieldByName('id').AsInteger;
            SQLQuery1.ParamByName('pestoque_atual').AsFloat := 0;
            SQLQuery1.ExecSQL;
            EnfSQLQuery.Next;
            if ((EnfSQLQuery.EOF) and (quant > 0)) then
              raise Exception.Create('Estoque insuficiente : ' +
                EnfSQLQuery.FieldByName('descricao').AsString +
                ', NF : ' + EnfSQLQuery.FieldByName('num_nf').AsString);
          end;

          if quant <= EnfSQLQuery.FieldByName('estoque_atual').AsFloat then
          begin
            SQLQuery1.Close;
            SQLQuery1.SQL.Text :=
            //  'insert into lancamento_notas_fiscais_itens_baixa(quantidade,num_nf,id_lanc_nf) values(:pquantidade,:pnum_nf,:pid_lanc_nf)';
        'insert into lancamento_notas_fiscais_itens_baixa'+
        '(quantidade,id_item,id_item_baixado) '+
        'values(:pquantidade,:pid_item,:pid_item_baixado)';


            SQLQuery1.ParamByName('pquantidade').AsFloat := quant;
            SQLQuery1.ParamByName('pid_item').AsInteger := StrToInt(idEdit.Text );
            SQLQuery1.ParamByName('pid_item_baixado').AsInteger :=
              EnfSQLQuery.FieldByName('id').AsInteger;
            SQLQuery1.ExecSQL;
            SQLQuery1.Close;
            SQLQuery1.SQL.Text :=
              'update lancamento_notas_fiscais_itens set estoque_atual = :pestoque_atual where id = :pid';
            SQLQuery1.ParamByName('pid').AsInteger :=
              EnfSQLQuery.FieldByName('id').AsInteger;
            SQLQuery1.ParamByName('pestoque_atual').AsFloat :=
              EnfSQLQuery.FieldByName('estoque_atual').AsFloat - quant;
            // raise Exception.Create('Estoque ='+floattostr(EnfSQLQuery.FieldByName('estoque_atual').AsFloat - quant));
            SQLQuery1.ExecSQL;
            quant := 0;
          end;
        end;
        SQLQuery.Next;
      end;
      if (quant > 0) then
        raise Exception.Create('Estoque insuficiente : ' +
          EnfSQLQuery.FieldByName('descricao').AsString +
          ', NF : ' + EnfSQLQuery.FieldByName('num_nf').AsString);
      MainForm.MainSQLTransaction.Commit;
      SpeedButton3Click(self);
      atualiza_griditem;
    except
      on E: Exception do
      begin
        MainForm.MainSQLTransaction.Rollback;
        MsgError(E.ClassName, E.Message);
      end;
    end;
  end;
end;

procedure TTF_ES_NF.SpeedButton2Click(Sender: TObject);
var
  estoque_antigo: integer;
begin
  if MessageDlg('Excluir o item da Nota fiscal?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    MainForm.MainSQLTransaction.StartTransaction;
    try
      EnfSQLQuery.SQL.Text := 'delete from lancamento_notas_fiscais_itens_baixa where id = '+idcompEdit.Text;
     // EnfSQLQuery.ParamByName('pid').AsInteger := StrToInt(idcompEdit.Text);
      EnfSQLQuery.ExecSQL;
      EnfSQLQuery.SQL.Text := 'select * from lancamento_notas_fiscais_itens where id = '+idnfcompEdit.Text;
     // EnfSQLQuery.ParamByName('pid').AsInteger := StrToInt(idnfcompEdit.Text);
      EnfSQLQuery.Open;
      estoque_antigo := EnfSQLQuery.FieldByName('estoque_atual').AsInteger;
      EnfSQLQuery.Close;
      EnfSQLQuery.SQL.Text :=
        'update lancamento_notas_fiscais_itens set estoque_atual =:pestoque_atual where id = '+idnfcompEdit.Text;
     // EnfSQLQuery.ParamByName('pid').AsInteger := StrToInt(idnfcompEdit.Text);
      EnfSQLQuery.ParamByName('pestoque_atual').AsInteger :=
        estoque_antigo + StrToInt(Edit5.Text);
      EnfSQLQuery.ExecSQL;
      MainForm.MainSQLTransaction.Commit;
      SpeedButton3Click(self);
      Edit4Change(Sender);
    except
      on E: Exception do
      begin
        MainForm.MainSQLTransaction.Rollback;
        MsgError(E.ClassName, E.Message);
      end;
    end;
  end;
end;

procedure TTF_ES_NF.SpeedButton3Click(Sender: TObject);
begin
  Edit5.Clear;
  Edit6.Clear;
  idcompEdit.Clear;
  idnfcompEdit.Clear;
  atualiza_composicao;
end;

procedure TTF_ES_NF.SpeedButton6Click(Sender: TObject);
begin
  application.CreateForm(TFrmSPEDFiscal, FrmSPEDFiscal);
  FrmSPEDFiscal.Show;
  //  StringGrid1.SaveToCSVFile('teste.xls');
end;

procedure TTF_ES_NF.StringGrid1DblClick(Sender: TObject);
begin
  MainForm.MainSQLTransaction.StartTransaction;
  try
    IdEdit.Text := vcodid;


   if(StringGrid1.Cells[7, linhapesquisa]='ENTRADA')then  //entrada
   begin
   GroupBox1.Visible := false;
   end else
   begin
   GroupBox1.Visible := true;
   end;


    EnfSQLQuery.SQL.Text :=
    'SELECT lancamento_notas_fiscais.ide_demi,lancamento_notas_fiscais.dest_xnome,'+
          'lancamento_notas_fiscais_itens.prod_qcom,lancamento_notas_fiscais_itens.prod_vuncom,' +
          'lancamento_notas_fiscais_itens.estoque_atual,lancamento_notas_fiscais_itens.id,'+
          'lancamento_notas_fiscais_itens.prod_xprod,lancamento_notas_fiscais.ide_nnf,lancamento_notas_fiscais_itens.prod_cfop ,'+
          'lancamento_notas_fiscais_itens.prod_ncm,lancamento_notas_fiscais_itens.ean,lancamento_notas_fiscais_itens.orig, '+
          'lancamento_notas_fiscais.emit_xnome,lancamento_notas_fiscais.ent_saida,lancamento_notas_fiscais.cancelada,'+
          'lancamento_notas_fiscais_itens.lancamento_notas_fiscais_id,'+
          'lancamento_notas_fiscais_itens.produto_id ,lancamento_notas_fiscais_itens.vipi, ' +
          'lancamento_notas_fiscais.nfantasiaid FROM lancamento_notas_fiscais_itens '+
          'INNER JOIN lancamento_notas_fiscais '+
          'ON lancamento_notas_fiscais_itens.lancamento_notas_fiscais_id = lancamento_notas_fiscais.id  '+
          ' where lancamento_notas_fiscais_itens.id='+IdEdit.Text;



  //  'select * from lancamento_notas_fiscais_itens where id = '+IdEdit.Text;







    EnfSQLQuery.Open;
    EmissaoDateEdit.Date := EnfSQLQuery.FieldByName('ide_demi').AsDateTime;
    ComboBox1.Text := EnfSQLQuery.FieldByName('ent_saida').AsString;
    NumNfEdit.Text := EnfSQLQuery.FieldByName('ide_nnf').AsString;
    NFantasiaIDEdit.Text := EnfSQLQuery.FieldByName('nfantasiaid').AsString;
    CfopEdit.Text := EnfSQLQuery.FieldByName('prod_cfop').AsString;
    NcmEdit.Text := EnfSQLQuery.FieldByName('prod_ncm').AsString;
    EanEdit.Text := EnfSQLQuery.FieldByName('ean').AsString;
    Edit1.Text := EnfSQLQuery.FieldByName('lancamento_notas_fiscais_id').AsString; ;
    RazaoSocialEdit.Text := EnfSQLQuery.FieldByName('dest_xnome').AsString;
    if(EnfSQLQuery.FieldByName('cancelada').AsString='SIM')then
    ComboBox4.ItemIndex := 0  else ComboBox4.ItemIndex := 1;

    EstoqueAtualEdit.Text := FormatFloat('#0.00',
      EnfSQLQuery.FieldByName('estoque_atual').AsFloat);
    ReferenciaProdutoIDEdit.Text := EnfSQLQuery.FieldByName('produto_id').AsString;
    QuantEdit.Text := FormatFloat('#0.0', EnfSQLQuery.FieldByName('prod_qcom').AsFloat);
    DescricaoEdit.Text := EnfSQLQuery.FieldByName('prod_xprod').AsString;
    VrUnitEdit.Text := FormatFloat('#0.0000', EnfSQLQuery.FieldByName(
      'prod_vuncom').AsFloat);
    IpiEdit.Text := FormatFloat('#0.00', EnfSQLQuery.FieldByName('vipi').AsFloat);
    VrUnitCIpiEdit.Text := FormatFloat('#0.0000',EnfSQLQuery.FieldByName(
      'prod_vuncom').AsFloat * EnfSQLQuery.FieldByName('vipi').AsFloat);
    OrigemProdidEdit.Text := EnfSQLQuery.FieldByName('orig').AsString;
    EnfSQLQuery.Close;
    EnfSQLQuery.SQL.Text := 'select * from cadastro where codigo = '+NFantasiaIDEdit.Text;
    EnfSQLQuery.Open;
    NFantasiaEdit.Text := EnfSQLQuery.FieldByName('apelido').AsString;
   { EnfSQLQuery.Close;
    EnfSQLQuery.SQL.Text := 'select * from empresa where codigo =:pid';
    EnfSQLQuery.ParamByName('pid').AsInteger := StrToInt(EmpresaIDEdit.Text);
    EnfSQLQuery.Open;
    EmpresaEdit.Text := EnfSQLQuery.FieldByName('razao_social').AsString; }
    if OrigemProdidEdit.Text <> '' then
    begin
      EnfSQLQuery.Close;
      EnfSQLQuery.SQL.Text := 'select * from origem_prod where codigo = '+OrigemProdidEdit.Text;
      EnfSQLQuery.Open;
      OrigemProdEdit.Text := EnfSQLQuery.FieldByName('descricao').AsString;
    end
    else
      OrigemProdEdit.Text := '';
    if ReferenciaProdutoIDEdit.Text <> '' then
    begin
      EnfSQLQuery.Close;
      EnfSQLQuery.SQL.Text := 'select * from produtos where codigo = '+ReferenciaProdutoIDEdit.Text;
      EnfSQLQuery.Open;
      ReferenciaProdutoEdit.Text := EnfSQLQuery.FieldByName('descricao').AsString;
    end
    else
      ReferenciaProdutoEdit.Text := '';
    MainForm.MainSQLTransaction.Commit;
    PageControl1.ActivePage := TabSheet1;
    btnInserir.Enabled := False;
    atualiza_composicao;
  except
    on E: Exception do
    begin
      MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;
  ComboBox1Change(Sender);
end;

procedure TTF_ES_NF.StringGrid1PrepareCanvas(Sender: TObject;
  aCol, aRow: integer; aState: TGridDrawState);
begin
  if ((StringGrid1.Cells[3, Arow] <> 'Estoque') and (StringGrid1.Cells[3, Arow] <> '')) then
  begin
    if (strtofloat(StringGrid1.Cells[3, Arow]) > 0) then
      StringGrid1.Canvas.Brush.Color := $33CCFF;
    if (strtofloat(StringGrid1.Cells[3, Arow]) = 0) then
      StringGrid1.Canvas.Brush.Color := $FFA0A0;
    if (strtofloat(StringGrid1.Cells[3, Arow]) < 0) then
      StringGrid1.Canvas.Brush.Color := clred;
  end;
end;

procedure TTF_ES_NF.StringGrid1Selection(Sender: TObject; aCol, aRow: integer);
begin
  vcodid := StringGrid1.Cells[8, aRow];
  linhapesquisa:= aRow;
end;

procedure TTF_ES_NF.StringGrid2DblClick(Sender: TObject);
begin
  Edit6.Text := vidnfitemdesc;
  idnfcompEdit.Text := vidnfitem;
end;

procedure TTF_ES_NF.StringGrid2Selection(Sender: TObject; aCol, aRow: integer);
begin
  Edit5.Clear;
  Edit6.Clear;
  idcompEdit.Clear;
  idnfcompEdit.Clear;
  idnfeEdit3.Clear;
  if combobox3.ItemIndex = 0 then
  begin
    vidnfitem := StringGrid2.Cells[6, arow];
    vidnfitemdesc := StringGrid2.Cells[0, arow];
    idnfeEdit3.Text := StringGrid2.Cells[7, arow];
  end;
  if combobox3.ItemIndex = 1 then
  begin
    vidnfitem := StringGrid2.Cells[2, arow];
    vidnfitemdesc := StringGrid2.Cells[0, arow];
  end;
end;

procedure TTF_ES_NF.StringGrid3DblClick(Sender: TObject);
begin
  idcompEdit.Text := vidcomp;
  Edit6.Text := vidnfitemdesc;
  Edit5.Text := vquantcomp;
  idnfcompEdit.Text := vidnfitem;
end;

procedure TTF_ES_NF.StringGrid3Selection(Sender: TObject; aCol, aRow: integer);
begin
  Edit5.Clear;
  Edit6.Clear;
  idcompEdit.Clear;
  idnfcompEdit.Clear;
  vidcomp := StringGrid3.Cells[5, aRow];
  vidnfitemdesc := StringGrid3.Cells[1, aRow];
  vidnfitem := StringGrid3.Cells[4, aRow];
  vquantcomp := StringGrid3.Cells[0, aRow];
end;

procedure TTF_ES_NF.xmlBitBtnClick(Sender: TObject);
begin
  application.CreateForm(Txml_ent_imp, xml_ent_imp);
  xml_ent_imp.ShowModal;
end;

procedure TTF_ES_NF.criagrid(controleDesc, controleId: TEdit;
  sql, campoID, campoDesc: string);
begin
  mgrid.Parent := controleDesc.Parent;
  contrId := controleId;
  contrDesc := controleDesc;
  mgrid.top := controleDesc.Top + 20;
  mgrid.Color := clCream;
  mgrid.Left := controleDesc.Left;
  mgrid.Width := controleDesc.Width;
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
        mgrid.ColWidths[0] := 550;
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
    mgrid.OnMouseLeave := @bclica;
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

procedure TTF_ES_NF.Seleciona(Sender: TObject; aCol, aRow: integer);
begin
  textodesc := mGrid.Cells[0, aRow];
  textoID := mGrid.Cells[1, aRow];
end;

procedure TTF_ES_NF.click(Sender: TObject);
begin
  mgrid.Hide;
  mbotao.Hide;
  btnInserir.Enabled := True;
  if Assigned(contrDesc) then
    contrDesc.Text := textodesc;
  if Assigned(contrid) then
    contrid.Text := textoid;

{  if NFantasiaIDEdit.Text <> '' then
  begin
    MainForm.MainSQLTransaction.StartTransaction;
    try
      EnfSQLQuery.SQL.Text := 'select * from cadastro where codigo = :pcodigo';
      EnfSQLQuery.ParamByName('pcodigo').AsInteger := StrToInt(NFantasiaIDEdit.Text);
      EnfSQLQuery.Open;
      RazaoSocialEdit.Text := EnfSQLQuery.FieldByName('nome').AsString;
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

procedure TTF_ES_NF.bclica(Sender: TObject);
begin
  mgrid.Hide;
  mbotao.Hide;
end;

procedure TTF_ES_NF.MsgError(const AClassName, AMsg: string);
const
  CMsg = 'Error in class "%s": %s';
begin
  Application.MessageBox(PChar(Format(CMsg, [AClassName, AMsg])),
    PChar(Application.Title), MB_ICONERROR + MB_OK);
end;

procedure TTF_ES_NF.formatar;
begin
  if ((VrUnitCIpiEdit.Text <> '')and
    (EstoqueAtualEdit.Text <> '')) then
   // ValorEstoqueEdit.Text := floattostr(strtofloat(EstoqueAtualEdit.Text) *
    //  strtofloat(VrUnitCIpiEdit.Text));
  if ((QuantEdit.Text <> '') and (VrUnitEdit.Text <> '') and
    (IpiEdit.Text <> '') and (VrUnitCIpiEdit.Text <> '')) then
  begin
    VrUnitCIpiEdit.Text := floattostr((strtofloat(IpiEdit.Text) / 100 + 1) *
      strtofloat(VrUnitEdit.Text));
    //VrtotalEdit.Text := floattostr(strtofloat(VrUnitCIpiEdit.Text) *
   //   strtofloat(QuantEdit.Text));
  end;
  EstoqueAtualEdit.Text := FormatFloat('#0.00', strtofloat(EstoqueAtualEdit.Text));
  //ValorEstoqueEdit.Text := FormatFloat('#0.00', strtofloat(ValorEstoqueEdit.Text));
  QuantEdit.Text := FormatFloat('#0.0', strtofloat(QuantEdit.Text));
  VrUnitEdit.Text := FormatFloat('#0.0000', strtofloat(VrUnitEdit.Text));
  IpiEdit.Text := FormatFloat('#0.00', strtofloat(IpiEdit.Text));
  VrUnitCIpiEdit.Text := FormatFloat('#0.0000', strtofloat(VrUnitCIpiEdit.Text));
  //VrtotalEdit.Text := FormatFloat('#0.0000', strtofloat(VrtotalEdit.Text));
  btninserir.Enabled := True;
end;

procedure TTF_ES_NF.atualiza_pesquisa;
var
  vnfantasia, vnumNF, vestoque, vdescricao, ventsai,vcfop: string;
  ipi:double;
begin
  MainForm.MainSQLTransaction.StartTransaction;
  try
    if NFantasiaIDEdit1.Text <> '' then
      vnfantasia := ' and nfantasiaid = '+NFantasiaIDEdit1.Text
    else
      vnfantasia := '';
   if CfopEdit1.Text<>'' then
   vcfop := ' and prod_cfop like '+quotedstr(CfopEdit1.Text)
    else
      vcfop := '';
    if Edit2.Text <> '' then
      vnumNF := ' and num_nfe = '+Edit2.Text
    else
      vnumNF := '';
    if EstoquePesquisaEdit.Text <> '' then
      vestoque := ' and estoque_atual > '+EstoquePesquisaEdit.Text
    else
      vestoque := '';
    if DescricaoPesquisaEdit.Text <> '' then
      vdescricao := ' and prod_xprod like '+quotedstr('%'+DescricaoPesquisaEdit.Text+'%')
    else
      vdescricao := '';
   // if ComboBox2.ItemIndex <> -1 then
      ventsai := ' ent_saida like '+quotedstr(ComboBox2.Text) ;
   // else
     // ventsai := '';
    enfSQLQuery.SQL.Text :=
      'SELECT lancamento_notas_fiscais.ide_demi,lancamento_notas_fiscais.dest_xnome,'+
      'lancamento_notas_fiscais_itens.prod_qcom,lancamento_notas_fiscais_itens.prod_vuncom,' +
      'lancamento_notas_fiscais_itens.estoque_atual,lancamento_notas_fiscais_itens.id,'+
      'lancamento_notas_fiscais_itens.prod_xprod,lancamento_notas_fiscais.ide_nnf,lancamento_notas_fiscais_itens.vipi, '+
      'lancamento_notas_fiscais.emit_xnome,lancamento_notas_fiscais.ent_saida,lancamento_notas_fiscais.nfantasiaid FROM lancamento_notas_fiscais_itens '+
      'INNER JOIN lancamento_notas_fiscais '+
      'ON lancamento_notas_fiscais_itens.lancamento_notas_fiscais_id = lancamento_notas_fiscais.id  '+
      ' where '+ventsai + vdescricao +vcfop+ vnfantasia + vnumNF + vestoque +
      ' and lancamento_notas_fiscais.ide_demi between :pdataini and :pdatafinal '+
      'order by lancamento_notas_fiscais.ide_demi asc';

   {
   SELECT lancamento_notas_fiscais.ide_demi,lancamento_notas_fiscais_itens.prod_qcom,lancamento_notas_fiscais_itens.prod_vuncom,
lancamento_notas_fiscais_itens.estoque_atual,lancamento_notas_fiscais.ide_nnf,lancamento_notas_fiscais.dest_xnome,
lancamento_notas_fiscais.emit_xnome,lancamento_notas_fiscais.ent_saida FROM lancamento_notas_fiscais
INNER JOIN
lancamento_notas_fiscais_itens
ON lancamento_notas_fiscais_itens.lancamento_notas_fiscais_id = lancamento_notas_fiscais_itens.id

}



    enfSQLQuery.ParamByName('pdataini').AsDateTime := DateEdit1.Date;
    enfSQLQuery.ParamByName('pdatafinal').AsDateTime := DateEdit2.Date;
    enfSQLQuery.Open;
    SQLQuery.SQL.Text := 'select * from cadastro';
    SQLQuery.Open;

    {if enfSQLQuery.IsEmpty then
    begin
      ClearGrid(StringGrid3);
      ShowMessage('Could not find records for this query.');
    end
    else   }
    begin
      enfSQLQuery.First;
      StringGrid1.BeginUpdate;
      try
        StringGrid1.Options := StringGrid1.Options + [gorowselect];
        StringGrid1.ColCount := 10;
        StringGrid1.FixedCols := 0;
        StringGrid1.ColWidths[0] := 100;
        StringGrid1.ColWidths[5] := 450;
        StringGrid1.ColWidths[6] := 350;
        StringGrid1.ColWidths[7] := 100;
        StringGrid1.ColWidths[8] := 0;
        StringGrid1.ColWidths[9] := 100;
        StringGrid1.Cells[0, 0] := 'Data';
        StringGrid1.Cells[1, 0] := 'Quant';
        StringGrid1.Cells[2, 0] := 'Vr Unit';
        StringGrid1.Cells[3, 0] := 'Estoque';
        StringGrid1.Cells[4, 0] := 'Num. NF';
        StringGrid1.Cells[5, 0] := 'Descricao';
        StringGrid1.Cells[6, 0] := 'Nome';
        StringGrid1.Cells[7, 0] := 'Entr/Sai';
        StringGrid1.Cells[8, 0] := 'id';
        StringGrid1.Cells[9, 0] := 'Vr Un c ipi';


        StringGrid1.RowCount :=
          enfSQLQuery.RecordCount + StringGrid1.FixedRows;
        Label32.Caption := inttostr(enfSQLQuery.RecordCount) + ' Registros';
        while not enfSQLQuery.EOF do
        begin
          StringGrid1.Cells[0, enfSQLQuery.RecNo] :=
            enfSQLQuery.FieldByName('ide_demi').AsString;
          StringGrid1.Cells[1, enfSQLQuery.RecNo] :=
            FormatFloat('#0', enfSQLQuery.FieldByName('prod_qcom').AsFloat);
          StringGrid1.Cells[2, enfSQLQuery.RecNo] :=
            FormatFloat('#0.00000', enfSQLQuery.FieldByName('prod_vuncom').AsFloat);
          StringGrid1.Cells[3, enfSQLQuery.RecNo] :=
            { FormatFloat('#0',} enfSQLQuery.FieldByName('estoque_atual').AsString;
          StringGrid1.Cells[4, enfSQLQuery.RecNo] :=
            enfSQLQuery.FieldByName('ide_nnf').AsString;
          StringGrid1.Cells[5, enfSQLQuery.RecNo] :=
            enfSQLQuery.FieldByName('prod_xprod').AsString;



          StringGrid1.Cells[7, enfSQLQuery.RecNo] :=
            enfSQLQuery.FieldByName('ent_saida').AsString;
          StringGrid1.Cells[8, enfSQLQuery.RecNo] :=
            enfSQLQuery.FieldByName('id').AsString;
          ipi:=enfSQLQuery.FieldByName('vipi').AsFloat/enfSQLQuery.FieldByName('prod_qcom').AsFloat;

          StringGrid1.Cells[9, enfSQLQuery.RecNo] :=
            FormatFloat('#0.00000', enfSQLQuery.FieldByName('prod_vuncom').AsFloat + ipi);
         SQLQuery.Locate('codigo', enfSQLQuery.FieldByName(
            'nfantasiaid').AsInteger, []);
          StringGrid1.Cells[6, enfSQLQuery.RecNo] :=
            SQLQuery.FieldByName('nome').AsString;


          enfSQLQuery.Next;
        end;
      finally
        StringGrid1.EndUpdate;
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

procedure TTF_ES_NF.atualiza_composicao;
var
  soma,valor,ipi: double;
begin
  MainForm.MainSQLTransaction.StartTransaction;
  try
    enfSQLQuery.SQL.Text :=
      'select  lancamento_notas_fiscais_itens_baixa.quantidade, '+
      'lancamento_notas_fiscais_itens.prod_xprod as descricao, '+
      'lancamento_notas_fiscais_itens.num_nfe, '+
      'lancamento_notas_fiscais.emit_xnome, '+
      'lancamento_notas_fiscais_itens_baixa.id_item_baixado,'+
      'lancamento_notas_fiscais_itens_baixa.id_item,'+
      'lancamento_notas_fiscais_itens_baixa.id ' +
      'from lancamento_notas_fiscais_itens_baixa '+
      'INNER JOIN lancamento_notas_fiscais_itens  '+
      'ON lancamento_notas_fiscais_itens.id=lancamento_notas_fiscais_itens_baixa.id_item_baixado '+
      'INNER JOIN lancamento_notas_fiscais '+
      'ON  lancamento_notas_fiscais.id=lancamento_notas_fiscais_itens.lancamento_notas_fiscais_id  '+
      'where lancamento_notas_fiscais_itens_baixa.id_item  = '+IdEdit.Text;

    // if IdEdit.Text <> '' then
  //    enfSQLQuery.ParamByName('pnum_nf').AsInteger := StrToInt(IdEdit.Text)
   // else
    //  enfSQLQuery.ParamByName('pnum_nf').AsInteger := 0;
   enfSQLQuery.Open;
   // SQLQuery.SQL.Text := 'select * from lancamento_notas_fiscais_itens';
   // SQLQuery.Open;
    StringGrid3.ColCount := 7;
    StringGrid3.ColWidths[0] := 60;
    StringGrid3.ColWidths[1] := 400;
    StringGrid3.ColWidths[2] := 80;
    StringGrid3.ColWidths[3] := 120;
    StringGrid3.ColWidths[4] := 0;
    StringGrid3.ColWidths[5] := 0;
    StringGrid3.ColWidths[6] := 0;
    StringGrid3.Cells[0, 0] := 'Quant';
    StringGrid3.Cells[1, 0] := 'Descricao';
    StringGrid3.Cells[2, 0] := 'NF Fornecedor';
    StringGrid3.Cells[3, 0] := 'Fornecedor';
    StringGrid3.Cells[4, 0] := 'id_item_baixado';
    StringGrid3.Cells[5, 0] := 'id_item';
    StringGrid3.Cells[6, 0] := 'nf_item';
    StringGrid3.FixedCols := 0;
    StringGrid3.FixedRows := 1;
    StringGrid3.Options := StringGrid3.Options + [gorowselect];
    enfSQLQuery.First;
    StringGrid3.BeginUpdate;
    try
      //StatusBar1.Caption := StatusBar1.Caption+'   Contagem:'+inttostr(enfSQLQuery.RecordCount)+' Linhas';

      StringGrid3.RowCount :=
        enfSQLQuery.RecordCount + StringGrid3.FixedRows;
      while not enfSQLQuery.EOF do
      begin
        StringGrid3.Cells[0, enfSQLQuery.RecNo] :=
          FormatFloat('#0', strtofloat(enfSQLQuery.FieldByName(
          'quantidade').AsString));
        StringGrid3.Cells[1, enfSQLQuery.RecNo] :=
          enfSQLQuery.FieldByName('descricao').AsString;
        StringGrid3.Cells[2, enfSQLQuery.RecNo] :=
          enfSQLQuery.FieldByName('num_nfe').AsString;
       StringGrid3.Cells[3, enfSQLQuery.RecNo] :=
       enfSQLQuery.FieldByName('emit_xnome').AsString;
        StringGrid3.Cells[4, enfSQLQuery.RecNo] :=
          enfSQLQuery.FieldByName('id_item_baixado').AsString;
        StringGrid3.Cells[5, enfSQLQuery.RecNo] :=
          enfSQLQuery.FieldByName('id').AsString;
        StringGrid3.Cells[6, enfSQLQuery.RecNo] :=
          enfSQLQuery.FieldByName('id_item').AsString;
        enfSQLQuery.Next;
      end;
    finally
      StringGrid3.EndUpdate;
    end;
      soma := 0;
      enfSQLQuery.Close;
      enfSQLQuery.SQL.Text := 'select *,(select prod_vuncom from '+
      'lancamento_notas_fiscais_itens where id = lancamento_notas_fiscais_itens_baixa.id_item_baixado)'+
      ',(select vipi from '+
      'lancamento_notas_fiscais_itens where id = lancamento_notas_fiscais_itens_baixa.id_item_baixado)'+
      ',(select prod_qcom from '+
      'lancamento_notas_fiscais_itens where id = lancamento_notas_fiscais_itens_baixa.id_item_baixado)'+
      ' from lancamento_notas_fiscais_itens_baixa where id_item =:pid_item';
      enfSQLQuery.ParamByName('pid_item').AsInteger := StrToInt(idEdit.Text);
      enfSQLQuery.Open;
      enfSQLQuery.First;
      soma := 0;
      while not enfSQLQuery.EOF do
      begin
       // enfSQLQuery.FieldByName('prod_qcom').AsFloat;
       // SQLQuery.Close;
       // SQLQuery.SQL.Text := 'select * from lancamento_notas_fiscais_itens where id = :pid';
       // SQLQuery.ParamByName('pid').AsInteger :=
        //  enfSQLQuery.FieldByName('nf_id').AsInteger;
       // SQLQuery.Open;
        valor :=enfSQLQuery.FieldByName('quantidade').AsFloat *
         (enfSQLQuery.FieldByName('prod_vuncom').AsFloat);
        ipi :=enfSQLQuery.FieldByName('vipi').AsFloat / enfSQLQuery.FieldByName('prod_qcom').AsFloat;
        ipi:= ipi * enfSQLQuery.FieldByName('quantidade').AsFloat ;
        soma := soma + valor+ipi  ;
        enfSQLQuery.Next;
        StatusBar1.Panels[0].Text :=inttostr(enfSQLQuery.RecordCount)+' registros    , '+ 'Soma dos itens : R$' + FormatFloat('#0.00', soma);
      end;
    //end;
    MainForm.MainSQLTransaction.Commit;
  except
    on E: Exception do
    begin
      MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;
end;

procedure TTF_ES_NF.atualiza_griditem;
var
  soma: double;
begin
  {  if Length(Edit4.Text) < 3 then
  begin
    ShowMessage('Please, enter at least three characters to search.');
    Exit;
  end;}
  if ComboBox3.ItemIndex = 0 then
  begin
    MainForm.MainSQLTransaction.StartTransaction;
    try
      enfSQLQuery.SQL.Text :=
        'select prod_xprod,estoque_atual,lancamento_notas_fiscais.emit_xnome,'+
        'lancamento_notas_fiscais.ide_demi,lancamento_notas_fiscais.ide_nnf,'+
        'prod_vuncom,lancamento_notas_fiscais.id as id_nfe,'+
        'lancamento_notas_fiscais_itens.id  from lancamento_notas_fiscais_itens  ' +
        'INNER JOIN lancamento_notas_fiscais ' +
        'ON lancamento_notas_fiscais.id = lancamento_notas_fiscais_itens.lancamento_notas_fiscais_id ' +
        'where ent_saida like'+
        quotedstr('ENTRADA') + ' and prod_xprod like :pprod_xprod and estoque_atual >0 ' +
        ' and ide_demi <= :pide_demi order by prod_xprod asc';


      enfSQLQuery.ParamByName('pide_demi').AsDateTime := EmissaoDateEdit.Date;
      enfSQLQuery.ParamByName('pprod_xprod').AsString := '%' + Edit4.Text + '%';
      enfSQLQuery.Open;
     // SQLQuery.SQL.Text := 'select * from cadastro';
     // SQLQuery.Open;
    {if enfSQLQuery.IsEmpty then
    begin
      ClearGrid(StringGrid3);
      ShowMessage('Could not find records for this query.');
    end
    else   }
      begin
        enfSQLQuery.First;
        StringGrid2.BeginUpdate;
        try
          StringGrid2.ColCount := 8;
          StringGrid2.FixedCols := 0;
          StringGrid2.ColWidths[0] := 480;
          StringGrid2.ColWidths[2] := 100;
          StringGrid2.ColWidths[3] := 100;
          StringGrid2.ColWidths[6] := 80;
          StringGrid2.ColWidths[7] := 80;
          StringGrid2.Cells[0, 0] := 'descricao';
          StringGrid2.Cells[1, 0] := 'Estoque';
          StringGrid2.Cells[2, 0] := 'Fornecedor';
          StringGrid2.Cells[3, 0] := 'Data';
          StringGrid2.Cells[4, 0] := 'Num. NF';
          StringGrid2.Cells[5, 0] := 'Valor';
          StringGrid2.Cells[6, 0] := 'idLNF_Item';
          StringGrid2.Cells[7, 0] := 'idLNF';
          StringGrid2.RowCount :=
            enfSQLQuery.RecordCount + StringGrid2.FixedRows;
          while not enfSQLQuery.EOF do
          begin
            StringGrid2.Cells[0, enfSQLQuery.RecNo] :=
              enfSQLQuery.FieldByName('prod_xprod').AsString;
            StringGrid2.Cells[1, enfSQLQuery.RecNo] :=
              enfSQLQuery.FieldByName('estoque_atual').AsString;
            StringGrid2.Cells[2, enfSQLQuery.RecNo] :=
              enfSQLQuery.FieldByName('emit_xnome').AsString;
            StringGrid2.Cells[3, enfSQLQuery.RecNo] :=
              enfSQLQuery.FieldByName('ide_demi').AsString;
            StringGrid2.Cells[4, enfSQLQuery.RecNo] :=
              enfSQLQuery.FieldByName('ide_nnf').AsString;
            StringGrid2.Cells[5, enfSQLQuery.RecNo] :=
              FormatFloat('#0.00', enfSQLQuery.FieldByName(
              'prod_vuncom').AsFloat);
            StringGrid2.Cells[6, enfSQLQuery.RecNo] :=
              enfSQLQuery.FieldByName('id').AsString;
            StringGrid2.Cells[7, enfSQLQuery.RecNo] :=
              enfSQLQuery.FieldByName('id_nfe').AsString;

            enfSQLQuery.Next;
          end;
        finally
          StringGrid2.EndUpdate;
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
  if ComboBox3.ItemIndex = 1 then
  begin
    MainForm.MainSQLTransaction.StartTransaction;
    try
      enfSQLQuery.SQL.Text :=
        'select * from produtos where (cod_prod like :parametro)or(descricao like :parametro)  order by codigo asc';
      enfSQLQuery.ParamByName('parametro').AsString :=
        AnsiQuotedStr(UpperCase(Edit4.Text), '%');
      enfSQLQuery.Open;
    {if enfSQLQuery.IsEmpty then
    begin
      ClearGrid(StringGrid3);
      ShowMessage('Could not find records for this query.');
    end
    else   }
      begin
        enfSQLQuery.First;
        StringGrid2.BeginUpdate;
        try
          StringGrid2.ColWidths[0] := 580;
          StringGrid2.ColWidths[1] := 100;
          StringGrid2.ColWidths[2] := 0;
          StringGrid2.Cells[0, 0] := 'descricao';
          StringGrid2.Cells[1, 0] := 'cod_prod';
          StringGrid2.Cells[2, 0] := 'id';
          StringGrid2.ColCount := 3;
          StringGrid2.FixedCols := 0;
          StringGrid2.RowCount :=
            enfSQLQuery.RecordCount + StringGrid2.FixedRows;
          while not enfSQLQuery.EOF do
          begin
            StringGrid2.Cells[0, enfSQLQuery.RecNo] :=
              enfSQLQuery.FieldByName('descricao').AsString;
            StringGrid2.Cells[1, enfSQLQuery.RecNo] :=
              enfSQLQuery.FieldByName('cod_prod').AsString;
            StringGrid2.Cells[2, enfSQLQuery.RecNo] :=
              IntToStr(enfSQLQuery.FieldByName('codigo').AsInteger);
            enfSQLQuery.Next;
          end;
        finally
          StringGrid2.EndUpdate;
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
end;

initialization
  {$i es_nf.lrs}

end.
