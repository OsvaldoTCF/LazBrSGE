unit produtos;

{$mode objfpc}{$H+}

interface

uses
  LCLIntf, LCLType, LResources, SysUtils, Classes, sqldb, Forms, Graphics, StdCtrls,
  Buttons, ExtCtrls, Grids, ExtDlgs, Controls;

type

  { Tcad_prod }

  Tcad_prod = class(TForm)
    Button1: TButton;
    Button2: TButton;
    CodigoProdutoEdit: TEdit;
    DescricaoEdit: TEdit;
    idcompEdit: TEdit;
    idfornEdit: TEdit;
    idprodfornEdit: TEdit;
    idcompoEdit: TEdit;
    Label18: TLabel;
    LabelT1: TLabel;
    Label20: TLabel;
    LabelT2: TLabel;
    Label22: TLabel;
    LabelT4: TLabel;
    Label24: TLabel;
    LabelT3: TLabel;
    Label26: TLabel;
    LabelT6: TLabel;
    Label28: TLabel;
    LabelT5: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    NcmEdit: TEdit;
    Label17: TLabel;
    NFantasiaIDEdit: TEdit;
    OpenPictureDialog1: TOpenPictureDialog;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    PesoEdit: TEdit;
    ScrollBox1: TScrollBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BtnDuplicar: TSpeedButton;
    SQLQuery: TSQLQuery;
    Tabela2Edit: TEdit;
    Tabela4Edit: TEdit;
    Tabela3Edit: TEdit;
    Tabela6Edit: TEdit;
    Tabela5Edit: TEdit;
    VlCustoEdit: TEdit;
    Edit6: TEdit;
    EstoqueAtualEdit: TEdit;
    IdEdit: TEdit;
    ItemIdEdit: TEdit;
    ItemEdit: TEdit;
    NFantasiaEdit: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel5: TPanel;
    QuantItemEdit: TEdit;
    BuscaEdit: TEdit;
    BuscaItemEdit: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    InserirSpeedButton: TSpeedButton;
    ExcluirSpeedButton: TSpeedButton;
    LimparSpeedButton: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    ProdutosSQLQuery: TSQLQuery;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    StringGrid4: TStringGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Tabela1Edit: TEdit;
    procedure BuscaEditChange(Sender: TObject);
    procedure BuscaItemEditChange(Sender: TObject);
    procedure CodigoProdutoEditEditingDone(Sender: TObject);
    procedure DescricaoEditEditingDone(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IdEditChange(Sender: TObject);
    procedure InserirSpeedButtonClick(Sender: TObject);
    procedure ExcluirSpeedButtonClick(Sender: TObject);
    procedure LimparSpeedButtonClick(Sender: TObject);
    procedure NcmEditEditingDone(Sender: TObject);
    procedure NFantasiaEditClick(Sender: TObject);
    procedure NFantasiaEditKeyUp(Sender: TObject; var Key: word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BtnDuplicarClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1Selection(Sender: TObject; aCol, aRow: Integer);
    procedure StringGrid2DblClick(Sender: TObject);
    procedure StringGrid2Selection(Sender: TObject; aCol, aRow: integer);
    procedure StringGrid3DblClick(Sender: TObject);
    procedure StringGrid3Selection(Sender: TObject; aCol, aRow: integer);
    procedure StringGrid4DblClick(Sender: TObject);
    procedure StringGrid4Selection(Sender: TObject; aCol, aRow: integer);
    procedure VlCustoEditEditingDone(Sender: TObject);
  private
    { Private declarations }
  public
    procedure criagrid(controleDesc, controleId: TEdit;
      sql, campoID, campoDesc: string);
    procedure Seleciona(Sender: TObject; aCol, aRow: integer);
    procedure click(Sender: TObject);
    procedure bclica(Sender: TObject);
    procedure limpar;
    procedure MsgError(const AClassName, AMsg: string);
    procedure formatar_master;
    procedure atualiza_griditem;
    procedure atualiza_gridfornecedor;
  end;

var
  cad_prod: Tcad_prod;
  mgrid: TStringGrid;
  mbotao: TButton;
  textoID, textodesc, quant_composicao, descricao_composicao, id_produto_comp: string;
  id_itemproduto_comp,vidcomp,vidprodforn,vNFantasiaID,vNFantasia,vidforn: string;
  contrDesc, contrId: TEdit;
  nfile: string;
  LookupSQLQuery: TSQLQuery;


implementation

{$R *.lfm}
uses
  mainfrm;


{ Tcad_prod }

procedure Tcad_prod.BuscaEditChange(Sender: TObject);
begin
  MainForm.MainSQLTransaction.StartTransaction;
  try
    ProdutosSQLQuery.SQL.Text :=
      'select * from produtos where (cod_prod like :parametro)or(descricao like :parametro)  order by descricao asc';
    ProdutosSQLQuery.ParamByName('parametro').AsString :=
      AnsiQuotedStr(UpperCase(buscaEdit.Text), '%');
    ProdutosSQLQuery.Open;
     StringGrid3.ColCount := 2;
        StringGrid3.ColWidths[0] := 880;
        StringGrid3.ColWidths[1] := 0;
        StringGrid3.Cells[0,0]:='                                        Descriçao';
        StringGrid3.Cells[1,0]:='id';
    begin
      ProdutosSQLQuery.First;
      StringGrid3.BeginUpdate;
      try
         StringGrid3.RowCount :=
          ProdutosSQLQuery.RecordCount + StringGrid3.FixedRows;
        while not ProdutosSQLQuery.EOF do
        begin
          StringGrid3.Cells[0, ProdutosSQLQuery.RecNo] :=
            ProdutosSQLQuery.FieldByName('descricao').AsString;
          StringGrid3.Cells[1, ProdutosSQLQuery.RecNo] :=
            IntToStr(ProdutosSQLQuery.FieldByName('codigo').AsInteger);
          ProdutosSQLQuery.Next;
        end;
      finally
        StringGrid3.EndUpdate;
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

procedure Tcad_prod.BuscaItemEditChange(Sender: TObject);
begin
  MainForm.MainSQLTransaction.StartTransaction;
  try
    ProdutosSQLQuery.SQL.Text :=
      'select * from produtos where (cod_prod like :parametro)or(descricao like :parametro)  order by codigo';
    ProdutosSQLQuery.ParamByName('parametro').AsString :=
      AnsiQuotedStr(UpperCase(BuscaItemEdit.Text), '%');
    ProdutosSQLQuery.Open;
    begin
      ProdutosSQLQuery.First;
      StringGrid4.BeginUpdate;
      try
        StringGrid4.ColWidths[0] := 580;
        StringGrid4.ColWidths[1] := 0;
        StringGrid4.RowCount :=
          ProdutosSQLQuery.RecordCount + StringGrid4.FixedRows;
        while not ProdutosSQLQuery.EOF do
        begin
          StringGrid4.Cells[0, ProdutosSQLQuery.RecNo] :=
            ProdutosSQLQuery.FieldByName('descricao').AsString;
          StringGrid4.Cells[1, ProdutosSQLQuery.RecNo] :=
            IntToStr(ProdutosSQLQuery.FieldByName('codigo').AsInteger);
          ProdutosSQLQuery.Next;
        end;
      finally
        StringGrid4.EndUpdate;
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

procedure Tcad_prod.CodigoProdutoEditEditingDone(Sender: TObject);
begin
  InserirSpeedButton.Enabled := true;
    if idedit.Text <>'' then
    BtnDuplicar.Show else BtnDuplicar.Hide;
end;

procedure Tcad_prod.DescricaoEditEditingDone(Sender: TObject);
begin
  InserirSpeedButton.Enabled := true;
end;

procedure Tcad_prod.FormCreate(Sender: TObject);
begin
  mgrid := TStringGrid.Create(cad_prod);
  mbotao := TButton.Create(mgrid);
  mbotao.Hide;
  mgrid.Hide;
  LookupSQLQuery := TSQLQuery.Create(cad_prod);
  LookupSQLQuery.DataBase := MainForm.MainSQLConnector;
  LookupSQLQuery.Transaction := MainForm.MainSQLTransaction;
  LookupSQLQuery.PacketRecords := -1;
  ProdutosSQLQuery.DataBase := MainForm.MainSQLConnector;
  ProdutosSQLQuery.Transaction := MainForm.MainSQLTransaction;
  ProdutosSQLQuery.PacketRecords := -1;
  SQLQuery.DataBase := MainForm.MainSQLConnector;
  SQLQuery.Transaction := MainForm.MainSQLTransaction;
  SQLQuery.PacketRecords := -1;
  limpar;
  //BuscaEditChange(self);
end;

procedure Tcad_prod.IdEditChange(Sender: TObject);
begin
  if IdEdit.Text = '' then
    begin
    InserirSpeedButton.Caption := 'Inserir';
    ExcluirSpeedButton.Enabled := false;
    Panel3.Enabled := false;
    BtnDuplicar.Hide;
    end
  else
  begin
    InserirSpeedButton.Caption := 'Alterar';
    ExcluirSpeedButton.Enabled := true;
    Panel3.Enabled := true;
  end;
end;

procedure Tcad_prod.InserirSpeedButtonClick(Sender: TObject);
begin
  MainForm.MainSQLTransaction.StartTransaction;
  try
    if IdEdit.Text = '' then
      ProdutosSQLQuery.SQL.Text :=
        'insert into produtos(cod_prod,descricao,' +
        'vl_custo,estoque_atual,ncm,peso,lucrotabela1,lucrotabela2,lucrotabela3,' +
        'lucrotabela4,lucrotabela5,lucrotabela6,vl_venda) values(:pcod_prod,:pdescricao,' +
        ':pvl_custo,:pestoque_atual,:pncm,:ppeso,:plucrotabela1,:plucrotabela2,' +
        ':plucrotabela3,:plucrotabela4,:plucrotabela5,:plucrotabela6,:pvl_venda)'
    else
    begin
      ProdutosSQLQuery.SQL.Text :=
        'update produtos set cod_prod = :pcod_prod, descricao = :pdescricao,vl_custo = :pvl_custo,'
        + 'estoque_atual = :pestoque_atual,ncm = :pncm,peso = :ppeso,lucrotabela1 = :plucrotabela1,'
        + 'lucrotabela2 = :plucrotabela2,lucrotabela3 = :plucrotabela3,lucrotabela4 = :'
        + 'plucrotabela4,lucrotabela5 = :plucrotabela5,lucrotabela6 = :plucrotabela6,vl_venda = :pvl_venda where codigo = :pcodigo';
      ProdutosSQLQuery.ParamByName('pcodigo').AsInteger := StrToInt(IdEdit.Text);
    end;
    ProdutosSQLQuery.ParamByName('pcod_prod').AsString := CodigoProdutoEdit.Text;
    ProdutosSQLQuery.ParamByName('pdescricao').AsString := DescricaoEdit.Text;
    ProdutosSQLQuery.ParamByName('pvl_custo').AsFloat := strtofloat(VlCustoEdit.Text);
    ProdutosSQLQuery.ParamByName('pestoque_atual').AsFloat :=
      strtofloat(EstoqueAtualEdit.Text);
    ProdutosSQLQuery.ParamByName('pncm').AsString := NcmEdit.Text;
    ProdutosSQLQuery.ParamByName('ppeso').AsFloat := strtofloat(PesoEdit.Text);
    ProdutosSQLQuery.ParamByName('plucrotabela1').AsFloat := strtofloat(Tabela1Edit.Text);
    ProdutosSQLQuery.ParamByName('plucrotabela2').AsFloat := strtofloat(Tabela2Edit.Text);
    ProdutosSQLQuery.ParamByName('plucrotabela3').AsFloat := strtofloat(Tabela3Edit.Text);
    ProdutosSQLQuery.ParamByName('plucrotabela4').AsFloat := strtofloat(Tabela4Edit.Text);
    ProdutosSQLQuery.ParamByName('plucrotabela5').AsFloat := strtofloat(Tabela5Edit.Text);
    ProdutosSQLQuery.ParamByName('plucrotabela6').AsFloat := strtofloat(Tabela6Edit.Text);
    ProdutosSQLQuery.ParamByName('pvl_venda').AsFloat := strtofloat(Edit6.Text);
    ProdutosSQLQuery.ExecSQL;
    MainForm.MainSQLTransaction.Commit;
    Limpar;
    BuscaEditChange(self);
    InserirSpeedButton.Enabled := False;
  except
    on E: Exception do
    begin
      MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;
end;

procedure Tcad_prod.ExcluirSpeedButtonClick(Sender: TObject);
begin
  MainForm.MainSQLTransaction.StartTransaction;
  try
    ProdutosSQLQuery.SQL.Text := 'delete from produtos_composicao where id_produto = :pid_produto';
    ProdutosSQLQuery.ParamByName('pid_produto').AsInteger := StrToInt(IdEdit.Text);
    ProdutosSQLQuery.ExecSQL;
    ProdutosSQLQuery.SQL.Text := 'delete  from produtos_fornecedores where id_produto = :pid_produto';
    ProdutosSQLQuery.ParamByName('pid_produto').AsInteger := StrToInt(IdEdit.Text);
    ProdutosSQLQuery.ExecSQL;
    ProdutosSQLQuery.SQL.Text := 'delete from produtos where codigo = :pcodigo';
    ProdutosSQLQuery.ParamByName('pcodigo').AsInteger := StrToInt(IdEdit.Text);
    ProdutosSQLQuery.ExecSQL;
    MainForm.MainSQLTransaction.Commit;
    limpar;
    BuscaEditChange(self);
    ExcluirSpeedButton.Enabled := False;
  except
    on E: Exception do
    begin
      MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;
end;

procedure Tcad_prod.LimparSpeedButtonClick(Sender: TObject);
begin
   limpar;
end;

procedure Tcad_prod.NcmEditEditingDone(Sender: TObject);
begin
  InserirSpeedButton.Enabled := true;
end;

procedure Tcad_prod.NFantasiaEditClick(Sender: TObject);
begin
  NFantasiaEdit.Clear;
  criagrid(NFantasiaEdit, NFantasiaIDEdit,
    'select *  from cadastro where apelido like :parametro  order by apelido',
    'codigo', 'apelido');
end;

procedure Tcad_prod.NFantasiaEditKeyUp(Sender: TObject; var Key: word;
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

procedure Tcad_prod.SpeedButton1Click(Sender: TObject);
begin
  QuantItemEdit.Text := '0';
  ItemEdit.Clear;
  ItemIdEdit.Clear;
  idcompoEdit.Clear;
end;

procedure Tcad_prod.SpeedButton2Click(Sender: TObject);
begin
  IdEdit.Clear;
  idprodfornEdit.Clear;
  NFantasiaIDEdit.Clear;
  NFantasiaEdit.Clear;
end;

procedure Tcad_prod.BtnDuplicarClick(Sender: TObject);
var
  codigo:integer;
begin
   MainForm.MainSQLTransaction.StartTransaction;
  try
    ProdutosSQLQuery.SQL.Text :=
        'insert into produtos(cod_prod,descricao,' +
        'vl_custo,estoque_atual,ncm,peso,lucrotabela1,lucrotabela2,lucrotabela3,' +
        'lucrotabela4,lucrotabela5,lucrotabela6,vl_venda) values(:pcod_prod,:pdescricao,' +
        ':pvl_custo,:pestoque_atual,:pncm,:ppeso,:plucrotabela1,:plucrotabela2,' +
        ':plucrotabela3,:plucrotabela4,:plucrotabela5,:plucrotabela6,:pvl_venda)' ;
    ProdutosSQLQuery.ParamByName('pcod_prod').AsString := CodigoProdutoEdit.Text;
    ProdutosSQLQuery.ParamByName('pdescricao').AsString := DescricaoEdit.Text;
    ProdutosSQLQuery.ParamByName('pvl_custo').AsFloat := strtofloat(VlCustoEdit.Text);
    ProdutosSQLQuery.ParamByName('pestoque_atual').AsFloat :=
      strtofloat(EstoqueAtualEdit.Text);
    ProdutosSQLQuery.ParamByName('pncm').AsString := NcmEdit.Text;
    ProdutosSQLQuery.ParamByName('ppeso').AsFloat := strtofloat(PesoEdit.Text);
    ProdutosSQLQuery.ParamByName('plucrotabela1').AsFloat := strtofloat(Tabela1Edit.Text);
    ProdutosSQLQuery.ParamByName('plucrotabela2').AsFloat := strtofloat(Tabela2Edit.Text);
    ProdutosSQLQuery.ParamByName('plucrotabela3').AsFloat := strtofloat(Tabela3Edit.Text);
    ProdutosSQLQuery.ParamByName('plucrotabela4').AsFloat := strtofloat(Tabela4Edit.Text);
    ProdutosSQLQuery.ParamByName('plucrotabela5').AsFloat := strtofloat(Tabela5Edit.Text);
    ProdutosSQLQuery.ParamByName('plucrotabela6').AsFloat := strtofloat(Tabela6Edit.Text);
    ProdutosSQLQuery.ParamByName('pvl_venda').AsFloat := strtofloat(Edit6.Text);
    ProdutosSQLQuery.ExecSQL;
    ProdutosSQLQuery.SQL.Text := 'select max(codigo) from produtos';
    ProdutosSQLQuery.Open;
    codigo :=ProdutosSQLQuery.FieldByName('max').AsInteger;
    ProdutosSQLQuery.Close;
    SQLQuery.Close;
    SQLQuery.SQL.Text :=  'select * from produtos_composicao where id_produto = :pid_produto order by id';
    SQLQuery.ParamByName('pid_produto').AsInteger := strtoint(IdEdit.Text);
    SQLQuery.Open;
    SQLQuery.First;
   while not SQLQuery.EOF do
    begin
      ProdutosSQLQuery.SQL.Text :=
      'insert into produtos_composicao(id_produto,quantidade,id_itemproduto) '+
      'values (:pid_produto,:pquantidade,:pid_itemproduto) ';
      ProdutosSQLQuery.ParamByName('pid_produto').AsInteger := codigo;
      ProdutosSQLQuery.ParamByName('pquantidade').AsInteger := SQLQuery.FieldByName('quantidade').AsInteger;
      ProdutosSQLQuery.ParamByName('pid_itemproduto').AsInteger := SQLQuery.FieldByName('id_itemproduto').AsInteger;;
      ProdutosSQLQuery.ExecSQL;
      SQLQuery.Next;
    end;
    MainForm.MainSQLTransaction.Commit;
    Limpar;
    BuscaEditChange(self);
    InserirSpeedButton.Enabled := False;
    BtnDuplicar.Hide;
  except
    on E: Exception do
    begin
      MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;
end;

procedure Tcad_prod.SpeedButton4Click(Sender: TObject);
begin
  MainForm.MainSQLTransaction.StartTransaction;
  try
    ProdutosSQLQuery.SQL.Text :=
      'insert into produtos_fornecedores(id_produto,id_cadastro)' +
      ' values(:pid_produto,:pid_cadastro)';
    ProdutosSQLQuery.ParamByName('pid_produto').AsInteger := StrToInt(IdEdit.Text);
    ProdutosSQLQuery.ParamByName('pid_cadastro').AsInteger :=
      StrToInt(NFantasiaIDEdit.Text);
    ProdutosSQLQuery.ExecSQL;
    MainForm.MainSQLTransaction.Commit;
    atualiza_gridfornecedor;
    idprodfornEdit.Clear;
    NFantasiaIDEdit.Clear;
    NFantasiaEdit.Clear;
  except
    on E: Exception do
    begin
      MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;
end;

procedure Tcad_prod.SpeedButton5Click(Sender: TObject);
begin
  MainForm.MainSQLTransaction.StartTransaction;
  try
    ProdutosSQLQuery.SQL.Text :=
      'delete from produtos_fornecedores where  id = :pid';
    ProdutosSQLQuery.ParamByName('pid').AsFloat := strtofloat(idfornEdit.Text);
    ProdutosSQLQuery.ExecSQL;
    MainForm.MainSQLTransaction.Commit;
    atualiza_gridfornecedor;
    idfornEdit.Clear;
    idprodfornEdit.Clear;
    NFantasiaIDEdit.Clear;
    NFantasiaEdit.Clear;
  except
    on E: Exception do
    begin
      MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;
end;

procedure Tcad_prod.SpeedButton6Click(Sender: TObject);
begin
  MainForm.MainSQLTransaction.StartTransaction;
  try
    ProdutosSQLQuery.SQL.Text :=
      'insert into produtos_composicao(id_produto,quantidade,id_itemproduto)' +
      ' values(:pid_produto,:pquantidade,:pid_itemproduto)';
    ProdutosSQLQuery.ParamByName('pid_produto').AsInteger := StrToInt(IdEdit.Text);
    ProdutosSQLQuery.ParamByName('pquantidade').AsFloat := strtofloat(QuantItemEdit.Text);
    ProdutosSQLQuery.ParamByName('pid_itemproduto').AsInteger :=
      StrToInt(ItemIdEdit.Text);
    ProdutosSQLQuery.ExecSQL;
    MainForm.MainSQLTransaction.Commit;
    atualiza_griditem;
    QuantItemEdit.Text := '0';
    ItemEdit.Clear;
    ItemIdEdit.Clear;
    idcompoEdit.Clear;
  except
    on E: Exception do
    begin
      MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;
end;

procedure Tcad_prod.SpeedButton7Click(Sender: TObject);
begin
  MainForm.MainSQLTransaction.StartTransaction;
  try
    ProdutosSQLQuery.SQL.Text :=
      'delete from produtos_composicao where id = :pid';
    ProdutosSQLQuery.ParamByName('pid').AsInteger := strtoint(idcompEdit.Text);
    ProdutosSQLQuery.ExecSQL;
    MainForm.MainSQLTransaction.Commit;
    atualiza_griditem;
    QuantItemEdit.Text := '0';
    ItemEdit.Clear;
    ItemIdEdit.Clear;
    idcompoEdit.Clear;
  except
    on E: Exception do
    begin
      MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;
end;

procedure Tcad_prod.StringGrid1DblClick(Sender: TObject);
begin
  idprodfornEdit.Text := vidprodforn;
  NFantasiaIDEdit.Text :=vNFantasiaID ;
  NFantasiaEdit.Text := vNFantasia;
  idfornEdit.Text:=vidforn;
end;

procedure Tcad_prod.StringGrid1Selection(Sender: TObject; aCol, aRow: Integer
  );
begin
  vNFantasia:=StringGrid1.Cells[0, aRow];
  vNFantasiaID:= StringGrid1.Cells[1, aRow];
  vidprodforn:=StringGrid1.Cells[2, aRow];
  vidforn:=StringGrid1.Cells[3, aRow];
end;

procedure Tcad_prod.StringGrid2DblClick(Sender: TObject);
begin
  QuantItemEdit.Text := quant_composicao;
  ItemEdit.Text := descricao_composicao;
  ItemIdEdit.Text := id_produto_comp;
  idcompoEdit.Text := id_itemproduto_comp;
  idcompEdit.Text:=vidcomp;
end;

procedure Tcad_prod.StringGrid2Selection(Sender: TObject; aCol, aRow: integer);
begin
  quant_composicao := StringGrid2.Cells[0, aRow];
  descricao_composicao := StringGrid2.Cells[1, aRow];
  id_produto_comp := StringGrid2.Cells[2, aRow];
  id_itemproduto_comp := StringGrid2.Cells[3, aRow];
  vidcomp:= StringGrid2.Cells[4, aRow];
end;

procedure Tcad_prod.StringGrid3DblClick(Sender: TObject);
begin
  IdEdit.Text := textoID;
  MainForm.MainSQLTransaction.StartTransaction;
  try
    ProdutosSQLQuery.SQL.Text := 'select * from produtos where codigo = :pcodigo';
    ProdutosSQLQuery.ParamByName('pcodigo').AsInteger := StrToInt(IdEdit.Text);
    ProdutosSQLQuery.Open;
    CodigoProdutoEdit.Text := ProdutosSQLQuery.FieldByName('cod_prod').AsString;
    VlCustoEdit.Text := FormatFloat('#0.00', ProdutosSQLQuery.FieldByName(
      'vl_custo').AsFloat);
    Edit6.Text := FormatFloat('#0.00', ProdutosSQLQuery.FieldByName('vl_venda').AsFloat);
    EstoqueAtualEdit.Text :=
      FormatFloat('#0.00', ProdutosSQLQuery.FieldByName('estoque_atual').AsFloat);
    PesoEdit.Text := FormatFloat('#0.00', ProdutosSQLQuery.FieldByName('peso').AsFloat);
    DescricaoEdit.Text := ProdutosSQLQuery.FieldByName('descricao').AsString;
    Tabela1Edit.Text := FormatFloat('#0.00',
      ProdutosSQLQuery.FieldByName('lucrotabela1').AsFloat);
    Tabela2Edit.Text := FormatFloat('#0.00',
      ProdutosSQLQuery.FieldByName('lucrotabela2').AsFloat);
    Tabela3Edit.Text := FormatFloat('#0.00',
      ProdutosSQLQuery.FieldByName('lucrotabela3').AsFloat);
    Tabela4Edit.Text := FormatFloat('#0.00',
      ProdutosSQLQuery.FieldByName('lucrotabela4').AsFloat);
    Tabela5Edit.Text := FormatFloat('#0.00',
      ProdutosSQLQuery.FieldByName('lucrotabela5').AsFloat);
    Tabela6Edit.Text := FormatFloat('#0.00',
      ProdutosSQLQuery.FieldByName('lucrotabela6').AsFloat);
    NcmEdit.Text := ProdutosSQLQuery.FieldByName('ncm').AsString;
    MainForm.MainSQLTransaction.Commit;
    atualiza_griditem;
    atualiza_gridfornecedor;
    formatar_master;
  except
    on E: Exception do
    begin
      MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;
end;

procedure Tcad_prod.StringGrid3Selection(Sender: TObject; aCol, aRow: integer);
begin
  limpar;
  textoID := StringGrid3.Cells[1, aRow];
//  atualiza_griditem;
 // atualiza_gridfornecedor;
end;

procedure Tcad_prod.StringGrid4DblClick(Sender: TObject);
begin
  ItemIdEdit.Text := textoID;
  MainForm.MainSQLTransaction.StartTransaction;
  try
    ProdutosSQLQuery.SQL.Text := 'select * from produtos where codigo = :pid';
    ProdutosSQLQuery.ParamByName('pid').AsInteger := StrToInt(ItemIdEdit.Text);
    ProdutosSQLQuery.Open;
    ItemEdit.Text := ProdutosSQLQuery.FieldByName('descricao').AsString;
    MainForm.MainSQLTransaction.Commit;
  except
    on E: Exception do
    begin
      MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;
end;

procedure Tcad_prod.StringGrid4Selection(Sender: TObject; aCol, aRow: integer);
begin
  QuantItemEdit.Text := '0';
  ItemEdit.Clear;
  ItemIdEdit.Clear;
  textoID := StringGrid4.Cells[1, aRow];
end;

procedure Tcad_prod.VlCustoEditEditingDone(Sender: TObject);
begin
  formatar_master;
  InserirSpeedButton.Enabled := true;
end;

procedure Tcad_prod.criagrid(controleDesc, controleId: TEdit;
  sql, campoID, campoDesc: string);
begin
  mgrid.Parent := controleDesc.Parent;
  contrId := controleId;
  contrDesc := controleDesc;
  mgrid.top := controleDesc.Top + 20;
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

procedure Tcad_prod.Seleciona(Sender: TObject; aCol, aRow: integer);
begin
  textodesc := mGrid.Cells[0, aRow];
  textoID := mGrid.Cells[1, aRow];
end;

procedure Tcad_prod.click(Sender: TObject);
begin
  mgrid.Hide;
  mbotao.Hide;
  if Assigned(contrDesc) then
    contrDesc.Text := textodesc;
  if Assigned(contrid) then
    contrid.Text := textoid;
end;

procedure Tcad_prod.bclica(Sender: TObject);
begin
  mgrid.Hide;
  mbotao.Hide;
end;

procedure Tcad_prod.limpar;
begin
  IdEdit.Clear;
  CodigoProdutoEdit.Clear;
  VlCustoEdit.Text := '0,00';
  Edit6.Text := '0,00';
  EstoqueAtualEdit.Text := '0,00';
  PesoEdit.Text := '0,00';
  DescricaoEdit.Clear;
  Tabela1Edit.Text := '0,00';
  Tabela2Edit.Text := '0,00';
  Tabela3Edit.Text := '0,00';
  Tabela4Edit.Text := '0,00';
  Tabela5Edit.Text := '0,00';
  Tabela6Edit.Text := '0,00';
  NcmEdit.Clear;
  // LSImage1.Picture.Clear;
  StringGrid1.RowCount:=1;
  StringGrid4.RowCount:=1;
  StringGrid2.RowCount:=1;
  ExcluirSpeedButton.Enabled := false;
  InserirSpeedButton.Enabled := false;
  Panel3.Enabled := false;
end;

procedure Tcad_prod.MsgError(const AClassName, AMsg: string);
const
  CMsg = 'Error in class "%s": %s';
begin
  Application.MessageBox(PChar(Format(CMsg, [AClassName, AMsg])),
    PChar(Application.Title), MB_ICONERROR + MB_OK);
end;

procedure Tcad_prod.formatar_master;
begin
  if VlCustoEdit.Text <>'' then
  VlCustoEdit.Text := FormatFloat('#0.00', strtofloat(VlCustoEdit.Text));
  if Edit6.Text <>'' then
  Edit6.Text := FormatFloat('#0.00', strtofloat(Edit6.Text));
  if EstoqueAtualEdit.Text <>'' then
  EstoqueAtualEdit.Text := FormatFloat('#0.00', strtofloat(EstoqueAtualEdit.Text));
  if PesoEdit.Text <>'' then
  PesoEdit.Text := FormatFloat('#0.000', strtofloat(PesoEdit.Text));
  if Tabela1Edit.Text <>'' then
  Tabela1Edit.Text := FormatFloat('#0.00', strtofloat(Tabela1Edit.Text));
  if Tabela2Edit.Text <>'' then
  Tabela2Edit.Text := FormatFloat('#0.00', strtofloat(Tabela2Edit.Text));
  if Tabela3Edit.Text <>'' then
  Tabela3Edit.Text := FormatFloat('#0.00', strtofloat(Tabela3Edit.Text));
  if Tabela4Edit.Text <>'' then
  Tabela4Edit.Text := FormatFloat('#0.00', strtofloat(Tabela4Edit.Text));
  if Tabela5Edit.Text <>'' then
  Tabela5Edit.Text := FormatFloat('#0.00', strtofloat(Tabela5Edit.Text));
  if Tabela6Edit.Text <>'' then
  Tabela6Edit.Text := FormatFloat('#0.00', strtofloat(Tabela6Edit.Text));
  LabelT1.Caption:='R$ '+FormatFloat('#0.00', ((strtofloat(Tabela1Edit.Text)/ 100+1 )*strtofloat(Edit6.Text)));
  LabelT2.Caption:='R$ '+FormatFloat('#0.00', ((strtofloat(Tabela2Edit.Text)/ 100+1 )*strtofloat(Edit6.Text)));
  LabelT3.Caption:='R$ '+FormatFloat('#0.00', ((strtofloat(Tabela3Edit.Text)/ 100+1 )*strtofloat(Edit6.Text)));
  LabelT4.Caption:='R$ '+FormatFloat('#0.00', ((strtofloat(Tabela4Edit.Text)/ 100+1 )*strtofloat(Edit6.Text)));
  LabelT5.Caption:='R$ '+FormatFloat('#0.00', ((strtofloat(Tabela5Edit.Text)/ 100+1 )*strtofloat(Edit6.Text)));
  LabelT6.Caption:='R$ '+FormatFloat('#0.00', ((strtofloat(Tabela6Edit.Text)/ 100+1 )*strtofloat(Edit6.Text)));

end;

procedure Tcad_prod.atualiza_griditem;
begin
  MainForm.MainSQLTransaction.StartTransaction;
  try
    ProdutosSQLQuery.SQL.Text :=
      'select * from produtos_composicao where id_produto = :pid_produto order by id asc';
    if IdEdit.Text <> '' then
      ProdutosSQLQuery.ParamByName('pid_produto').AsInteger := StrToInt(IdEdit.Text)
    else
      ProdutosSQLQuery.ParamByName('pid_produto').AsInteger := 0;
    ProdutosSQLQuery.Open;
    SQLQuery.SQL.Text := 'select * from produtos';
    SQLQuery.Open;
    StringGrid2.ColCount := 5;
    StringGrid2.ColWidths[0] := 60;
    StringGrid2.ColWidths[1] := 400;
    StringGrid2.ColWidths[2] := 0;
    StringGrid2.ColWidths[3] := 0;
    StringGrid2.ColWidths[4] := 0;
    StringGrid2.Cells[0, 0] := 'Quant';
    StringGrid2.Cells[1, 0] := 'Descricao';
    StringGrid2.Cells[2, 0] := 'id_produto';
    StringGrid2.Cells[3, 0] := 'id_itemproduto';
    StringGrid2.Cells[4, 0] := 'id';
    StringGrid2.FixedCols := 0;
    StringGrid2.FixedRows := 1;
    StringGrid2.Options := StringGrid2.Options + [gorowselect];
    ProdutosSQLQuery.First;
    StringGrid2.BeginUpdate;
    try
      StringGrid2.RowCount :=
        ProdutosSQLQuery.RecordCount + StringGrid2.FixedRows;
      while not ProdutosSQLQuery.EOF do
      begin
        StringGrid2.Cells[0, ProdutosSQLQuery.RecNo] :=
          FormatFloat('#0', strtofloat(ProdutosSQLQuery.FieldByName(
          'quantidade').AsString));
        SQLQuery.Locate('codigo', ProdutosSQLQuery.FieldByName(
          'id_itemproduto').AsInteger, []);
        StringGrid2.Cells[1, ProdutosSQLQuery.RecNo] :=
          SQLQuery.FieldByName('descricao').AsString;
        StringGrid2.Cells[2, ProdutosSQLQuery.RecNo] :=
          ProdutosSQLQuery.FieldByName('id_produto').AsString;
        StringGrid2.Cells[3, ProdutosSQLQuery.RecNo] :=
          ProdutosSQLQuery.FieldByName('id_itemproduto').AsString;
        StringGrid2.Cells[4, ProdutosSQLQuery.RecNo] :=
          ProdutosSQLQuery.FieldByName('id').AsString;
        ProdutosSQLQuery.Next;
      end;
    finally
      StringGrid2.EndUpdate;
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

procedure Tcad_prod.atualiza_gridfornecedor;
begin
  MainForm.MainSQLTransaction.StartTransaction;
  try
    ProdutosSQLQuery.SQL.Text :=
      'select * from produtos_fornecedores where id_produto = :pid_produto order by id asc';
    if IdEdit.Text <> '' then
      ProdutosSQLQuery.ParamByName('pid_produto').AsInteger := StrToInt(IdEdit.Text)
    else
      ProdutosSQLQuery.ParamByName('pid_produto').AsInteger := 0;
    ProdutosSQLQuery.Open;
    SQLQuery.SQL.Text := 'select * from cadastro';
    SQLQuery.Open;
    StringGrid1.ColCount := 4;
    StringGrid1.ColWidths[0] := 500;
    StringGrid1.ColWidths[1] := 0;
    StringGrid1.ColWidths[2] := 0;
    StringGrid1.ColWidths[3] := 0;
    StringGrid1.Cells[0, 0] := 'Fornecedor';
    StringGrid1.Cells[1, 0] := 'id_cadastro';
    StringGrid1.Cells[2, 0] := 'id_produto';
    StringGrid1.Cells[3, 0] := 'id';
    StringGrid1.FixedCols := 0;
    StringGrid1.FixedRows := 1;
    StringGrid1.Options := StringGrid1.Options + [gorowselect];
    ProdutosSQLQuery.First;
    StringGrid1.BeginUpdate;
    try
      StringGrid1.RowCount :=
        ProdutosSQLQuery.RecordCount + StringGrid1.FixedRows;
      while not ProdutosSQLQuery.EOF do
      begin
        SQLQuery.Locate('codigo', ProdutosSQLQuery.FieldByName(
          'id_cadastro').AsInteger, []);
        StringGrid1.Cells[0, ProdutosSQLQuery.RecNo] :=
          SQLQuery.FieldByName('apelido').AsString;
        StringGrid1.Cells[1, ProdutosSQLQuery.RecNo] :=
          ProdutosSQLQuery.FieldByName('id_cadastro').AsString;
        StringGrid1.Cells[2, ProdutosSQLQuery.RecNo] :=
          ProdutosSQLQuery.FieldByName('id_produto').AsString;
        StringGrid1.Cells[3, ProdutosSQLQuery.RecNo] :=
          ProdutosSQLQuery.FieldByName('id').AsString;
        ProdutosSQLQuery.Next;
      end;
    finally
      StringGrid1.EndUpdate;
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

{
Ler uma imagem em Base64:
LSImage.LoadFromBase64String(Query.FieldByName('text_or_memo_field').AsString);

Salvar uma imagem em Base64:
Query.ParamByName('text_or_memo_param').AsString := LSImage.AsBase64;
}


initialization
  {$i produtos.lrs}


end.

