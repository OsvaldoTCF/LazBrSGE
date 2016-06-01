unit pag_rec;

{$mode objfpc}{$H+}

interface

uses
  LCLIntf, SysUtils, Classes, Controls, Forms, Dialogs, sqldb, ComCtrls,
  StdCtrls, DBCtrls, ExtCtrls, Buttons, inifiles, LResources, LCLType, Grids,
  Menus, EditBtn,libjpfpdf,dateutils, Graphics;

type

  { TContasPagRecForm }

  TContasPagRecForm = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    ObservacaoMemo: TMemo;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    StatusButton: TButton;
    StatusDelButton: TButton;
    CCDeleteButton: TButton;
    CCInserirButton: TButton;
    CadIndexCCEdit: TEdit;
    CadVencDateEdit: TDateEdit;
    CadDescEdit: TEdit;
    CadValorEdit: TEdit;
    cadCodEdit: TEdit;
    CadDebCredEdit: TEdit;
    CadCustoMercEdit: TEdit;
    CadCustoTercEdit: TEdit;
    CadLucroEdit: TEdit;
    CadDtPagDateEdit: TDateEdit;
    CadStatusEdit: TEdit;
    CadStatusIdEdit: TEdit;
    CadEmpresaEdit: TEdit;
    CadEmpresaIDEdit: TEdit;
    CCEdit: TEdit;
    CCIDEdit: TEdit;
    StatusIDEdit: TEdit;
    StatusEdit: TEdit;
    Label10: TLabel;
    Label16: TLabel;
    pesq_dtfin: TDateEdit;
    pesq_dtin: TDateEdit;
    SearchEmpEdit: TEdit;
    SearchStatusIDEdit: TEdit;
    SearchStatusEdit: TEdit;
    SearchCCIDEdit: TEdit;
    SearchCCEdit: TEdit;
    CadTipoCombobox: TComboBox;
    CadDescCCEdit: TEdit;
    ListBox1: TListBox;
    PageControl_contas: TPageControl;
    lancamentos: TTabSheet;
    Pesquisa: TTabSheet;
    Label8: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label30: TLabel;
    pesq_desc: TEdit;
    Label15: TLabel;
    SearchLimpaSpeedButton: TSpeedButton;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    searchTipoCombobox: TComboBox;
    Label7: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    SpeedButton3: TSpeedButton;
    Label13: TLabel;
    btnInserir: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    ContasSQLQuery: TSQLQuery;
    StatusBar1: TStatusBar;
    SearchResultStringGrid: TStringGrid;
    CCStringGrid: TStringGrid;
    CentroCustoTS: TTabSheet;
    Label12: TLabel;
    SearchEmpIDEdit: TEdit;
    Label14: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    StatusTs: TTabSheet;
    StatusStringGrid: TStringGrid;
    StringGrid_cc: TStringGrid;
    procedure btnInserirClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cadCodEditChange(Sender: TObject);
    procedure CadCustoMercEditEditingDone(Sender: TObject);
    procedure CadCustoTercEditEditingDone(Sender: TObject);
    procedure CadDescCCEditClick(Sender: TObject);
    procedure CadDescEditKeyPress(Sender: TObject; var Key: char);
    procedure CadEmpresaEditClick(Sender: TObject);
    procedure CadLucroEditEditingDone(Sender: TObject);
    procedure CadStatusEditClick(Sender: TObject);
    procedure CadStatusIdEditChange(Sender: TObject);
    procedure CadTipoComboboxSelect(Sender: TObject);
    procedure CadValorEditEditingDone(Sender: TObject);
    procedure CadVencDateEditChange(Sender: TObject);
    procedure CCDeleteButtonClick(Sender: TObject);
    procedure CCEditChange(Sender: TObject);
    procedure CCEditKeyPress(Sender: TObject; var Key: char);
    procedure CCIDEditChange(Sender: TObject);
    procedure CCInserirButtonClick(Sender: TObject);
    procedure CCStringGridDblClick(Sender: TObject);
    procedure CCStringGridSelection(Sender: TObject; aCol, aRow: integer);
    procedure CentroCustoTSShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit3Click(Sender: TObject);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure frUserDataset1CheckEOF(Sender: TObject; var EOF: boolean);
    procedure frUserDataset1First(Sender: TObject);
    procedure frUserDataset1Next(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure PesquisaResize(Sender: TObject);
    procedure SearchCCEditClick(Sender: TObject);
    procedure SearchCCEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SearchEmpEditClick(Sender: TObject);
    procedure SearchResultStringGridDblClick(Sender: TObject);
    procedure SearchResultStringGridPrepareCanvas(Sender: TObject;
      aCol, aRow: integer; aState: TGridDrawState);
    procedure SearchResultStringGridSelection(Sender: TObject; aCol, aRow: integer);
    procedure SearchStatusEditClick(Sender: TObject);
    procedure SearchLimpaSpeedButtonClick(Sender: TObject);
    procedure pesq_descChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure StatusButtonClick(Sender: TObject);
    procedure StatusDelButtonClick(Sender: TObject);
    procedure StatusEditKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure StatusEditKeyPress(Sender: TObject; var Key: char);
    procedure StatusIDEditChange(Sender: TObject);
    procedure StatusStringGridDblClick(Sender: TObject);
    procedure StatusStringGridSelection(Sender: TObject; aCol, aRow: integer);
    procedure StatusTsShow(Sender: TObject);
    procedure StringGrid_ccCheckboxToggled(sender: TObject; aCol,
      aRow: Integer; aState: TCheckboxState);
    procedure StringGrid_ccKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid_ccMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    somaant: double;
    procedure criagrid(controleDesc, controleId: TEdit;
      sql, campoID, campoDesc: string);
    procedure Seleciona(Sender: TObject; aCol, aRow: integer);
    procedure click(Sender: TObject);
    procedure bclica(Sender: TObject);
    procedure ClearCad;
    procedure CadInserir;
    procedure CadEditar;
    procedure FormatarCampos;
    procedure CadCamposModificados;
    procedure MsgError(const AClassName, AMsg: string);
  end;

var
  ContasPagRecForm: TContasPagRecForm;
  arquivo_r: string;
  mgrid: TStringGrid;
  mbotao: TButton;
  LookupSQLQuery: TSQLQuery;
  contrDesc, contrId: TEdit;
  textoDesc, textoID: string;

implementation

  {$R *.lfm}
uses
  mainfrm;

procedure TContasPagRecForm.FormCreate(Sender: TObject);
begin
  PageControl_contas.TabIndex := 0;
  mgrid := TStringGrid.Create(ContasPagRecForm);
  mbotao := TButton.Create(mgrid);
  mbotao.Hide;
  mgrid.Hide;
  LookupSQLQuery := TSQLQuery.Create(ContasPagRecForm);
  LookupSQLQuery.DataBase := MainForm.MainSQLConnector;
  LookupSQLQuery.Transaction := MainForm.MainSQLTransaction;
  ContasSQLQuery.PacketRecords := -1;
  SearchResultStringGrid.ColCount := 10;
  SearchResultStringGrid.Options := SearchResultStringGrid.Options + [gorowselect,goColSizing];
  SearchResultStringGrid.Cells[0, 0] := 'Vencimento';
  SearchResultStringGrid.Cells[1, 0] := 'Descricao';
  SearchResultStringGrid.Cells[2, 0] := 'Valor';
  SearchResultStringGrid.Cells[3, 0] := 'Data Pagam.';
  SearchResultStringGrid.Cells[4, 0] := 'deb_cred';
  SearchResultStringGrid.Cells[5, 0] := 'Custo Produtos';
  SearchResultStringGrid.Cells[6, 0] := 'Custo Terceiros';
  SearchResultStringGrid.Cells[7, 0] := 'Lucro';
  SearchResultStringGrid.Cells[8, 0] := 'ID';
  SearchResultStringGrid.Cells[9, 0] := 'Status_conta';
  SearchResultStringGrid.ColWidths[0] := 100;
  SearchResultStringGrid.ColWidths[1] := 650;
  SearchResultStringGrid.ColWidths[2] := 100;
  SearchResultStringGrid.ColWidths[3] := 120;
  SearchResultStringGrid.ColWidths[4] := 80;
  SearchResultStringGrid.ColWidths[5] := 120;
  SearchResultStringGrid.ColWidths[6] := 120;
  SearchResultStringGrid.ColWidths[7] := 120;
  SearchResultStringGrid.ColWidths[8] := 0;
  SearchResultStringGrid.ColWidths[9] := 0;
  pesq_dtin.Date := StartOfTheMonth(now-20);
  pesq_dtfin.Date := EndOfTheMonth(now+60);
  SearchEmpIDEdit.Text := '1';
   MainForm.MainSQLTransaction.StartTransaction;
  try
    ContasSQLQuery.SQL.Text := 'select * from empresa where codigo = :pcodigo';
    ContasSQLQuery.ParamByName('pcodigo').AsInteger := 1;
    ContasSQLQuery.Open;
    SearchEmpEdit.Text := ContasSQLQuery.FieldByName('razao_social').AsString;
     MainForm.MainSQLTransaction.Commit;
  except
    on E: Exception do
    begin
      MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;
  panel1.Width := 0;
  panel1.Height := 0;
  ClearCad;

end;

procedure TContasPagRecForm.CadDescCCEditClick(Sender: TObject);
begin
  criagrid(CadDescCCEdit, CadIndexCCEdit, 'select * from centro_custo',
    'codigo_cc', 'descricao_cc');
end;

procedure TContasPagRecForm.CadDescEditKeyPress(Sender: TObject; var Key: char);
begin
  CadCamposModificados;
end;

procedure TContasPagRecForm.cadCodEditChange(Sender: TObject);
begin
  if cadCodEdit.Text <> '' then
    btnInserir.Caption := 'Alterar'
  else
  begin
    btnInserir.Caption := 'Inserir';
    // btnAlterar.Enabled := False;
    btnExcluir.Enabled := False;
  end;
end;

procedure TContasPagRecForm.CadCustoMercEditEditingDone(Sender: TObject);
begin
  FormatarCampos;
end;

procedure TContasPagRecForm.CadCustoTercEditEditingDone(Sender: TObject);
begin
  FormatarCampos;
end;

procedure TContasPagRecForm.btnInserirClick(Sender: TObject);
begin
  if cadCodEdit.Text = '' then
    CadInserir
  else
    CadEditar;
end;

procedure TContasPagRecForm.Button1Click(Sender: TObject);
var
  Soma: currency;
  custo_merc: currency;
  cust_terc: currency;
  lucro: currency;
  cc,dt:string;
  n:integer;
  cliente,tipo_nota,sql:string;

begin
 { SELECT codigo_cadastro,SUM(lucro) FROM contas_pag_receb WHERE lucro>0 GROUP BY codigo_cadastro



 SELECT cad.nome,SUM(lucro) FROM contas_pag_receb inner join cadastro cad on codigo_cadastro
= cad.codigo GROUP BY cad.nome

               }

mgrid.Hide;
MainForm.MainSQLTransaction.StartTransaction;
try
  //soma no final do periodo
  ContasSQLQuery.Close;
  cc:='';
  for n:=0 to StringGrid_cc.RowCount-1 do
  begin
    if ((StringGrid_cc.Cells[0,n]='1' )and (cc<>'')) then
    cc+=' or centrocusto_id like '+ quotedstr(StringGrid_cc.Cells[2,n]);
    if ((StringGrid_cc.Cells[0,n]='1')and (cc='')) then
    cc:=' and (centrocusto_id like ' + quotedstr(StringGrid_cc.Cells[2,n]);
  end;
  if (cc<>'') then
  cc+=' ) ';

  if (SearchStatusIDEdit.Text = '2')then  // paga
  dt:= ' data_pagamento '  else  dt:= 'data' ;


  if(combobox2.ItemIndex>-1)then
  tipo_nota:=  ' and tipo_nota = '+inttostr(combobox2.ItemIndex) else  tipo_nota:='';

  if(edit4.Text<>'')then
   cliente:= ' and codigo_cadastro = ' + edit4.Text else cliente:='';





  //----------  da a pesquisa no stringgrid


   if (searchTipoCombobox.Text='A PAGAR') then
    begin
    sql:= 'SELECT cad.nome,SUM(valor)as vr FROM contas_pag_receb '+
    'inner join cadastro cad on codigo_cadastro = cad.codigo WHERE EMPRESA like :pempresa ' +
    cc+' '+tipo_nota+cliente+' and tipo like :ptipo and ' +
    'status like :pstatus and  '+dt+'   between :pdataini and :pdatafin  GROUP BY cad.nome order by vr asc';
    end;

  if (searchTipoCombobox.Text='A RECEBER') then
    begin
    sql:= 'SELECT cad.nome,SUM(lucro)as vr FROM contas_pag_receb '+
    'inner join cadastro cad on codigo_cadastro = cad.codigo WHERE EMPRESA like :pempresa ' +
    cc+' '+tipo_nota+cliente+' and tipo like :ptipo and ' +
    'status like :pstatus and  '+dt+'   between :pdataini and :pdatafin  GROUP BY cad.nome order by vr desc';
    end;



  ContasSQLQuery.Close;
  ContasSQLQuery.SQL.Text := sql;



  if searchTipoCombobox.Text <> '' then
    ContasSQLQuery.ParamByName('ptipo').AsString := searchTipoCombobox.Text
  else
    ContasSQLQuery.ParamByName('ptipo').AsString := '%';
  if SearchEmpIDEdit.Text <> '' then
    ContasSQLQuery.ParamByName('pempresa').AsString := SearchEmpIDEdit.Text
  else
    ContasSQLQuery.ParamByName('pempresa').AsString := '%';
  if SearchStatusEdit.Text <> '' then
    ContasSQLQuery.ParamByName('pstatus').AsString := SearchStatusIDEdit.Text
  else
    ContasSQLQuery.ParamByName('pstatus').AsString := '%';
  ContasSQLQuery.ParamByName('pdataini').AsDateTime := pesq_dtin.Date;
  ContasSQLQuery.ParamByName('pdatafin').AsDateTime := pesq_dtfin.Date;

  ContasSQLQuery.Open;
{if ContasSQLQuery.IsEmpty then
begin
SearchResultStringGrid.RowCount := 1;
ShowMessage('Erro ao carregar dados');
end
else  }
  begin
    ContasSQLQuery.First;
    SearchResultStringGrid.BeginUpdate;
    try
      SearchResultStringGrid.RowCount := 1;
      SearchResultStringGrid.RowCount :=
        ContasSQLQuery.RecordCount + SearchResultStringGrid.FixedRows;
      while not ContasSQLQuery.EOF do
      begin
        SearchResultStringGrid.Cells[1, ContasSQLQuery.RecNo] :=
          ContasSQLQuery.FieldByName('nome').AsString;
        SearchResultStringGrid.Cells[2, ContasSQLQuery.RecNo] :=
          FormatFloat('#0.00', ContasSQLQuery.FieldByName('vr').AsFloat);

        ContasSQLQuery.Next;
      end;
    finally
      SearchResultStringGrid.EndUpdate;
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

procedure TContasPagRecForm.CadEmpresaEditClick(Sender: TObject);
begin
  criagrid(CadEmpresaEdit, CadEmpresaIDEdit, 'select * from empresa',
    'codigo', 'razao_social');
end;

procedure TContasPagRecForm.CadLucroEditEditingDone(Sender: TObject);
begin
  FormatarCampos;
end;

procedure TContasPagRecForm.CadStatusEditClick(Sender: TObject);
begin
  criagrid(CadStatusEdit, CadStatusIdEdit, 'select * from status_contas_pag_rec',
    'codigo', 'descricao');
end;

procedure TContasPagRecForm.CadStatusIdEditChange(Sender: TObject);
begin
  CadCamposModificados;
end;

procedure TContasPagRecForm.CadTipoComboboxSelect(Sender: TObject);
begin
  FormatarCampos;
end;

procedure TContasPagRecForm.CadValorEditEditingDone(Sender: TObject);
begin
  FormatarCampos;
end;

procedure TContasPagRecForm.CadVencDateEditChange(Sender: TObject);
begin
  CadCamposModificados;
end;

procedure TContasPagRecForm.CCDeleteButtonClick(Sender: TObject);
begin
  if MessageDlg('Você deseja excluir o registro atual ?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    MainForm.MainSQLTransaction.StartTransaction;
    try
      ContasSQLQuery.SQL.Text :=
        'delete from centro_custo where codigo_cc = :pcodigo_cc';
      ContasSQLQuery.ParamByName('pcodigo_cc').AsInteger := StrToInt(CCIDEdit.Text);
      ContasSQLQuery.ExecSQL;
      MainForm.MainSQLTransaction.Commit;
      CCIDEdit.Clear;
      CCEdit.Clear;
    except
      on E: Exception do
      begin
        MainForm.MainSQLTransaction.Rollback;
        MsgError(E.ClassName, E.Message);
      end;
    end;
  end;
  CentroCustoTSShow(Sender);
end;

procedure TContasPagRecForm.CCEditChange(Sender: TObject);
begin
  if CCEdit.Text = '' then
    CCInserirButton.Enabled := False;
  if CCIDEdit.Text <> '' then
  begin
    CCInserirButton.Caption := 'Alterar';
    CCDeleteButton.Enabled := True;
  end
  else
  begin
    CCInserirButton.Caption := 'Inserir';
    CCDeleteButton.Enabled := False;
  end;
end;

procedure TContasPagRecForm.CCEditKeyPress(Sender: TObject; var Key: char);
begin
  if CCEdit.Text <> '' then
    CCInserirButton.Enabled := True;
end;

procedure TContasPagRecForm.CCIDEditChange(Sender: TObject);
begin
  if CCIDEdit.Text <> '' then
    CCDeleteButton.Enabled := True;
end;

procedure TContasPagRecForm.CCInserirButtonClick(Sender: TObject);
begin
  if CCInserirButton.Caption = 'Inserir' then
  begin
    MainForm.MainSQLTransaction.StartTransaction;
    try
      ContasSQLQuery.SQL.Text :=
        'insert into centro_custo(descricao_cc) values(:pdescricao_cc)';
      ContasSQLQuery.ParamByName('pdescricao_cc').AsString := CCEdit.Text;
      ContasSQLQuery.ExecSQL;
      MainForm.MainSQLTransaction.Commit;
      CCIDEdit.Clear;
      CCEdit.Clear;
    except
      on E: Exception do
      begin
        MainForm.MainSQLTransaction.Rollback;
        MsgError(E.ClassName, E.Message);
      end;
    end;
  end;
  if CCInserirButton.Caption = 'Alterar' then
  begin
    MainForm.MainSQLTransaction.StartTransaction;
    try
      ContasSQLQuery.SQL.Text :=
        'update centro_custo set descricao_cc = :pdescricao_cc' +
        ' where codigo_cc = :pcodigo_cc';
      ContasSQLQuery.ParamByName('pdescricao_cc').AsString := CCEdit.Text;
      ContasSQLQuery.ParamByName('pcodigo_cc').AsInteger := StrToInt(CCIDEdit.Text);
      ContasSQLQuery.ExecSQL;
      MainForm.MainSQLTransaction.Commit;
      CCIDEdit.Clear;
      CCEdit.Clear;
    except
      on E: Exception do
      begin
        MainForm.MainSQLTransaction.Rollback;
        MsgError(E.ClassName, E.Message);
      end;
    end;
  end;
  CentroCustoTSShow(Sender);
end;

procedure TContasPagRecForm.CCStringGridDblClick(Sender: TObject);
begin
  CCEdit.Text := textoDesc;
  CCIDEdit.Text := textoID;
end;

procedure TContasPagRecForm.CCStringGridSelection(Sender: TObject; aCol, aRow: integer);
begin
  CCEdit.Clear;
  CCIDEdit.Clear;
  CCDeleteButton.Enabled := False;
  textoDesc := CCStringGrid.Cells[1, aRow];
  textoID := CCStringGrid.Cells[0, aRow];
end;

procedure TContasPagRecForm.CentroCustoTSShow(Sender: TObject);
begin
  MainForm.MainSQLTransaction.StartTransaction;
  CCStringGrid.ColCount := 2;
  CCStringGrid.FixedCols := 0;
  CCStringGrid.ColWidths[0] := 60;
  CCStringGrid.ColWidths[1] := 250;
  CCStringGrid.Cells[0, 0] := 'ID';
  CCStringGrid.Cells[1, 0] := 'Descricao';
  CCStringGrid.Options := CCStringGrid.Options + [gorowselect];
  try
    ContasSQLQuery.SQL.Text := 'select *  from centro_custo';
    ContasSQLQuery.Open;
    begin
      ContasSQLQuery.First;
      CCStringGrid.BeginUpdate;
      try
        CCStringGrid.RowCount :=
          ContasSQLQuery.RecordCount + CCStringGrid.FixedRows;
        while not ContasSQLQuery.EOF do
        begin
          CCStringGrid.Cells[0, ContasSQLQuery.RecNo] :=
            IntToStr(ContasSQLQuery.FieldByName('codigo_cc').AsInteger);
          CCStringGrid.Cells[1, ContasSQLQuery.RecNo] :=
            ContasSQLQuery.FieldByName('descricao_cc').AsString;
          ContasSQLQuery.Next;
        end;
      finally
        CCStringGrid.EndUpdate;
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

procedure TContasPagRecForm.ComboBox1Change(Sender: TObject);
begin
CadCamposModificados();
end;

procedure TContasPagRecForm.Edit1Click(Sender: TObject);
begin
Edit1.Clear;
Edit2.Clear;

criagrid(Edit1, Edit2,
'select *  from cadastro where (apelido like '+quotedstr('%'+Edit1.Text+'%')+') or ' +
'(nome like '+quotedstr('%'+Edit1.Text+'%')+')or (cnpj like '+quotedstr('%'+Edit1.Text+'%')+') or ' +
'(inscricao_estadual like '+quotedstr('%'+Edit1.Text+'%')+')or (tipo_cadastro like '+quotedstr('%'+Edit1.Text+'%')+')' +
'or (fax like '+quotedstr('%'+Edit1.Text+'%')+') or (UPPER(site) like '+quotedstr('%'+Edit1.Text+'%')+') ' +
' order by apelido asc',
'codigo', 'apelido');
end;

procedure TContasPagRecForm.Edit1KeyPress(Sender: TObject; var Key: char);
begin
 CadCamposModificados();
end;

procedure TContasPagRecForm.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
criagrid(Edit1, Edit2,
'select *  from cadastro where (apelido like '+quotedstr('%'+Edit1.Text+'%')+') or ' +
'(nome like '+quotedstr('%'+Edit1.Text+'%')+')or (cnpj like '+quotedstr('%'+Edit1.Text+'%')+') or ' +
'(inscricao_estadual like '+quotedstr('%'+Edit1.Text+'%')+')or (tipo_cadastro like '+quotedstr('%'+Edit1.Text+'%')+')' +
'or (fax like '+quotedstr('%'+Edit1.Text+'%')+') or (UPPER(site) like '+quotedstr('%'+Edit1.Text+'%')+')' +
' order by apelido asc',
'codigo', 'apelido');
end;

procedure TContasPagRecForm.Edit3Click(Sender: TObject);
begin
     criagrid(Edit3, Edit4,
'select *  from cadastro where (apelido like '+quotedstr('%'+Edit3.Text+'%')+') or ' +
'(nome like '+quotedstr('%'+Edit3.Text+'%')+')or (cnpj like '+quotedstr('%'+Edit3.Text+'%')+') or ' +
'(inscricao_estadual like '+quotedstr('%'+Edit3.Text+'%')+')or (tipo_cadastro like '+quotedstr('%'+Edit3.Text+'%')+')' +
'or (fax like '+quotedstr('%'+Edit3.Text+'%')+') or (UPPER(site) like '+quotedstr('%'+Edit3.Text+'%')+')' +
' order by apelido asc',
'codigo', 'apelido');
end;

procedure TContasPagRecForm.Edit3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
criagrid(Edit3, Edit4,
'select *  from cadastro where (apelido like '+quotedstr('%'+Edit3.Text+'%')+') or ' +
'(nome like '+quotedstr('%'+Edit3.Text+'%')+')or (cnpj like '+quotedstr('%'+Edit3.Text+'%')+') or ' +
'(inscricao_estadual like '+quotedstr('%'+Edit3.Text+'%')+')or (tipo_cadastro like '+quotedstr('%'+Edit3.Text+'%')+')' +
'or (fax like '+quotedstr('%'+Edit3.Text+'%')+') or (UPPER(site) like '+quotedstr('%'+Edit3.Text+'%')+') ' +
' order by apelido asc',
'codigo', 'apelido');
end;

procedure TContasPagRecForm.FormDestroy(Sender: TObject);
begin
  DeleteFile(arquivo_r);
end;

procedure TContasPagRecForm.frUserDataset1CheckEOF(Sender: TObject; var EOF: boolean);
begin
  EOF := ContasSQLQuery.EOF;
end;

procedure TContasPagRecForm.frUserDataset1First(Sender: TObject);
begin
  ContasSQLQuery.First;
end;

procedure TContasPagRecForm.frUserDataset1Next(Sender: TObject);
begin
  ContasSQLQuery.Next;
end;

procedure TContasPagRecForm.ListBox1DblClick(Sender: TObject);
begin
  CadDescEdit.Text := ListBox1.Items.ValueFromIndex[ListBox1.ItemIndex] +' '+
    CadDescEdit.Text;
end;

procedure TContasPagRecForm.PesquisaResize(Sender: TObject);
begin
  SearchResultStringGrid.Height := Pesquisa.Height - SearchStatusEdit.Top - 60;
end;

procedure TContasPagRecForm.SearchCCEditClick(Sender: TObject);
begin
  SearchCCEdit.Clear;
  criagrid(SearchCCEdit, SearchCCIDEdit, 'select *  from centro_custo',
    'codigo_cc', 'descricao_cc');
end;

procedure TContasPagRecForm.SearchCCEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 criagrid(SearchCCEdit, SearchCCIDEdit, 'select *  from centro_custo',
    'codigo_cc', 'descricao_cc');
end;

procedure TContasPagRecForm.SearchEmpEditClick(Sender: TObject);
begin
  criagrid(SearchEmpEdit, SearchEmpIDEdit, 'select *  from empresa',
    'codigo', 'razao_social');
end;

procedure TContasPagRecForm.SearchResultStringGridDblClick(Sender: TObject);
begin
  cadCodEdit.Text := textoID;
  MainForm.MainSQLTransaction.StartTransaction;
  try
    ContasSQLQuery.SQL.Text := 'select * from contas_pag_receb where codigo = :pcodigo';
    ContasSQLQuery.ParamByName('pcodigo').AsInteger := StrToInt(cadCodEdit.Text);
    ContasSQLQuery.Open;
    CadVencDateEdit.Date := ContasSQLQuery.FieldByName('data').AsDateTime;
    CadLucroEdit.Text := FormatFloat('#0.00', ContasSQLQuery.FieldByName(
      'lucro').AsFloat);
    CadValorEdit.Text := FormatFloat('#0.00', ContasSQLQuery.FieldByName(
      'valor').AsFloat);
    CadDebCredEdit.Text := ContasSQLQuery.FieldByName('deb_cred').AsString;
    CadCustoMercEdit.Text := FormatFloat('#0.00', ContasSQLQuery.FieldByName(
      'vl_cust_merc').AsFloat);
    CadCustoTercEdit.Text := FormatFloat('#0.00', ContasSQLQuery.FieldByName(
      'vl_cust_terc').AsFloat);
    if(ContasSQLQuery.FieldByName('tipo_nota').AsString<>'')then
    combobox1.ItemIndex := ContasSQLQuery.FieldByName('tipo_nota').AsInteger;

     if(ContasSQLQuery.FieldByName('codigo_cadastro').AsString<>'')then
    Edit2.Text := ContasSQLQuery.FieldByName('codigo_cadastro').AsString;

    CadDtPagDateEdit.Date := ContasSQLQuery.FieldByName('data_pagamento').AsDateTime;
    CadEmpresaIDEdit.Text := ContasSQLQuery.FieldByName('empresa').AsString;
    CadStatusIdEdit.Text := ContasSQLQuery.FieldByName('status').AsString;
    CadDescEdit.Text := ContasSQLQuery.FieldByName('descricao').AsString;
    if ContasSQLQuery.FieldByName('tipo').AsString = 'A RECEBER' then
      CadTipoCombobox.ItemIndex := 1;
    if ContasSQLQuery.FieldByName('tipo').AsString = 'A PAGAR' then
      CadTipoCombobox.ItemIndex := 0;
    CadIndexCCEdit.Text := ContasSQLQuery.FieldByName('centrocusto_id').AsString;
    ObservacaoMemo.Text := ContasSQLQuery.FieldByName('observacao').AsString;
   if(edit2.Text<>'') then
   begin
   ContasSQLQuery.Close;
   ContasSQLQuery.SQL.Text := 'select * from cadastro where codigo = '+edit2.Text;
   ContasSQLQuery.Open;
   edit1.Text :=  ContasSQLQuery.FieldByName('nome').AsString; ;
   end;

    ContasSQLQuery.Close;
    ContasSQLQuery.SQL.Text := 'select * from centro_custo where codigo_cc = :pcodigo';
    ContasSQLQuery.ParamByName('pcodigo').AsInteger := StrToInt(CadIndexCCEdit.Text);
    ContasSQLQuery.Open;
    CadDescCCEdit.Text := ContasSQLQuery.FieldByName('descricao_cc').AsString;
    ContasSQLQuery.Close;
    ContasSQLQuery.SQL.Text := 'select * from empresa where codigo = :pcodigo';
    ContasSQLQuery.ParamByName('pcodigo').AsInteger := StrToInt(CadEmpresaIDEdit.Text);
    ContasSQLQuery.Open;
    CadEmpresaEdit.Text := ContasSQLQuery.FieldByName('razao_social').AsString;
    ContasSQLQuery.Close;
    ContasSQLQuery.SQL.Text :=
      'select * from status_contas_pag_rec where codigo = :pcodigo';
    ContasSQLQuery.ParamByName('pcodigo').AsInteger := StrToInt(CadStatusIdEdit.Text);
    ContasSQLQuery.Open;
    CadStatusEdit.Text := ContasSQLQuery.FieldByName('descricao').AsString;
    MainForm.MainSQLTransaction.Commit;
  except
    on E: Exception do
    begin
      MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;
  // btnAlterar.Enabled := True;
  btnExcluir.Enabled := True;
  PageControl_contas.ActivePage := lancamentos;
end;

procedure TContasPagRecForm.SearchResultStringGridPrepareCanvas(Sender: TObject;
  aCol, aRow: integer; aState: TGridDrawState);
var
  MyTextStyle: TTextStyle;
begin
 MyTextStyle := SearchResultStringGrid.Canvas.TextStyle;
    if aCol = 0 then
      MyTextStyle.Alignment := taCenter;
    if aCol = 2 then
      MyTextStyle.Alignment := taRightJustify;
    if aCol = 3 then
      MyTextStyle.Alignment := taCenter;
    if aCol = 4 then
      MyTextStyle.Alignment := taCenter;
    if aCol = 5 then
      MyTextStyle.Alignment := taRightJustify;
    if aCol = 6 then
      MyTextStyle.Alignment := taRightJustify;
    if aCol = 7 then
      MyTextStyle.Alignment := taRightJustify;
    SearchResultStringGrid.Canvas.TextStyle := MyTextStyle;

 if ((SearchResultStringGrid.Cells[0,ARow]<>'')and
  (SearchResultStringGrid.Cells[4,ARow]='C') and
  (SearchResultStringGrid.Cells[9,ARow]<>'2')) then
 begin
 if (strtodate(SearchResultStringGrid.Cells[0,ARow]) <= now-2)  then
   SearchResultStringGrid.Canvas.Brush.Color:= $CC33CC;
  end;

  if ((SearchResultStringGrid.Cells[0,ARow]<>'')and
  (SearchResultStringGrid.Cells[4,ARow]='D') and
  (SearchResultStringGrid.Cells[9,ARow]<>'2')) then
 begin
 if (strtodate(SearchResultStringGrid.Cells[0,ARow]) <= now+3)  then
   SearchResultStringGrid.Canvas.Brush.Color:= clRed;
  end;


  {if SearchResultStringGrid.Cells[5,ARow] = 'ENCERRADO'
    then SearchResultStringGrid.Canvas.Brush.Color :=$CC33CC ;
  if SearchResultStringGrid.Cells[5,ARow] = 'AGUARDANDO PAGAMENTO'
    then SearchResultStringGrid.Canvas.Brush.Color := $00CCCC;
  if SearchResultStringGrid.Cells[5,ARow] = 'PAG. CONFIRMADO E AGUARD. ENVIO'
    then SearchResultStringGrid.Canvas.Brush.Color := $8282E7;
    if SearchResultStringGrid.Cells[5,ARow] = 'ENVIADO'
    then SearchResultStringGrid.Canvas.Brush.Color := $FFA0A0;}
  {
  outras cores

$FFFBF0
$C0C0C0
$
FFFC8C
  }


end;

procedure TContasPagRecForm.SearchResultStringGridSelection(Sender: TObject;
  aCol, aRow: integer);
begin
  ClearCad;
  textoID := SearchResultStringGrid.Cells[8, aRow];
end;

procedure TContasPagRecForm.SearchStatusEditClick(Sender: TObject);
begin
  criagrid(SearchStatusEdit, SearchStatusIDEdit,
    'select *  from status_contas_pag_rec',
    'codigo', 'descricao');
end;

procedure TContasPagRecForm.criagrid(controleDesc, controleId: TEdit;
  sql, campoID, campoDesc: string);
begin
  mgrid.Parent := controleDesc.Parent;
  contrId := controleId;
  contrDesc := controleDesc;
  mgrid.top := controleDesc.Top + 20;
  mgrid.Left := controleDesc.Left;
  MainForm.MainSQLTransaction.StartTransaction;
  try
    LookupSQLQuery.SQL.Text := sql;
    LookupSQLQuery.Open;
{    if LookupSQLQuery.IsEmpty then
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
        mgrid.ColWidths[1] := 0;
        mgrid.RowCount := LookupSQLQuery.RecordCount + mgrid.FixedRows+9999;
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

procedure TContasPagRecForm.Seleciona(Sender: TObject; aCol, aRow: integer);
begin
  contrDesc.Text := mGrid.Cells[0, aRow];
  contrId.Text := mGrid.Cells[1, aRow];
end;

procedure TContasPagRecForm.click(Sender: TObject);
begin
  mgrid.Hide;
  mbotao.Hide;
  if PageControl_contas.ActivePage = Pesquisa then
    pesq_descChange(Sender);
end;

procedure TContasPagRecForm.bclica(Sender: TObject);
begin
  mgrid.Hide;
  mbotao.Hide;
end;

procedure TContasPagRecForm.ClearCad;
begin
  cadCodEdit.Clear;
  CadVencDateEdit.Clear;
  CadTipoCombobox.ItemIndex := -1;
  CadDescCCEdit.Clear;
  CadIndexCCEdit.Clear;
  CadDescEdit.Clear;
  CadValorEdit.Clear;
  CadDtPagDateEdit.Clear;
  CadDebCredEdit.Clear;
  CadCustoMercEdit.Clear;
  CadCustoTercEdit.Clear;
  CadLucroEdit.Clear;
  Edit1.Clear;
  Edit2.Clear;
  combobox1.ItemIndex := -1;
  CadEmpresaIDEdit.Text := '1';
   MainForm.MainSQLTransaction.StartTransaction;
  try
    ContasSQLQuery.SQL.Text := 'select * from empresa where codigo = :pcodigo';
    ContasSQLQuery.ParamByName('pcodigo').AsInteger := 1;
    ContasSQLQuery.Open;
    CadEmpresaEdit.Text := ContasSQLQuery.FieldByName('razao_social').AsString;
     MainForm.MainSQLTransaction.Commit;
  except
    on E: Exception do
    begin
      MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;
  CadStatusIdEdit.Clear;
  CadStatusEdit.Clear;
  CadDtPagDateEdit.Clear;
  ObservacaoMemo.Clear;
  CadCustoMercEdit.Enabled := True;
  CadCustoTercEdit.Enabled := True;
  CadLucroEdit.Enabled := True;
  btnInserir.Enabled := False;
end;

procedure TContasPagRecForm.CadInserir;
var
  dtpag,dtpag1:string;
begin
  if ((CadVencDateEdit.Text = '') or (CadTipoCombobox.Text = '') or
    (CadDescEdit.Text = '') or (CadIndexCCEdit.Text = '') or
    (CadValorEdit.Text = '') or (CadEmpresaIDEdit.Text = '') or
    (CadStatusIdEdit.Text = '')) then
    ShowMessage('Prencha os campos')
  else
  begin
    MainForm.MainSQLTransaction.StartTransaction;
    try
      if (CadDtPagDateEdit.Text='  /  /    ') then
      begin
      dtpag:='';
      dtpag1:='';
      end else
      Begin
        dtpag:='data_pagamento,';
        dtpag1:=':pdata_pagamento,';
      end;


      ContasSQLQuery.SQL.Text :=
        'insert into contas_pag_receb(tipo_nota,codigo_cadastro,valor,centrocusto_id,tipo,' +
        dtpag+'descricao,deb_cred,data,empresa,vl_cust_merc,vl_cust_terc, ' +
        'lucro,status,observacao)' +
        ' values('+inttostr(combobox1.ItemIndex)+','+edit2.Text+',:pvalor,:pcentrocusto_id,:ptipo,'+dtpag1+':pdescricao,:pdeb_cred,:pdata,' +
        ':pempresa,:pvl_cust_merc,:pvl_cust_terc,:plucro,:pstatus,:pobservacao)';
      ContasSQLQuery.ParamByName('pdata').AsDateTime := CadVencDateEdit.Date;
      ContasSQLQuery.ParamByName('ptipo').AsString := CadTipoCombobox.Text;
      ContasSQLQuery.ParamByName('pdescricao').AsString := CadDescEdit.Text;
      ContasSQLQuery.ParamByName('pcentrocusto_id').AsString := CadIndexCCEdit.Text;
      ContasSQLQuery.ParamByName('pvalor').AsFloat := strtofloat(CadValorEdit.Text);
      ContasSQLQuery.ParamByName('pdeb_cred').AsString := CadDebCredEdit.Text;
      ContasSQLQuery.ParamByName('pvl_cust_merc').AsFloat :=
        strtofloat(CadCustoMercEdit.Text);
      ContasSQLQuery.ParamByName('pvl_cust_terc').AsFloat :=
        strtofloat(CadCustoTercEdit.Text);
      ContasSQLQuery.ParamByName('plucro').AsFloat := strtofloat(CadLucroEdit.Text);
      ContasSQLQuery.ParamByName('pempresa').AsString := CadEmpresaIDEdit.Text;
      ContasSQLQuery.ParamByName('pstatus').AsString := CadStatusIdEdit.Text;
      if (CadDtPagDateEdit.Text<>'  /  /    ') then
      ContasSQLQuery.ParamByName('pdata_pagamento').AsDate := strtodate(CadDtPagDateEdit.Text);
      ContasSQLQuery.ParamByName('pobservacao').AsString := ObservacaoMemo.Text;
      ContasSQLQuery.ExecSQL;
      MainForm.MainSQLTransaction.Commit;
      ClearCad;
      pesq_descChange(self);
    except
      on E: Exception do
      begin
        MainForm.MainSQLTransaction.Rollback;
        MsgError(E.ClassName, E.Message);
      end;
    end;
  end;
end;

procedure TContasPagRecForm.CadEditar;
var
  dtpag,dtpag1:string;
begin
  MainForm.MainSQLTransaction.StartTransaction;
  try
     if (CadDtPagDateEdit.Text='  /  /    ') then
      begin
      dtpag:='';
      dtpag1:='';
      end else
      Begin
        dtpag:='data_pagamento =:pdata_pagamento,';
        dtpag1:=':pdata_pagamento,';
      end;
    ContasSQLQuery.SQL.Text :=
      'update contas_pag_receb set codigo_cadastro='+edit2.Text+',tipo_nota='+inttostr(combobox1.ItemIndex)+',valor=:pvalor,centrocusto_id =:pcentrocusto_id,tipo =:ptipo, ' +
      dtpag+' descricao=:pdescricao, ' +
      'deb_cred =:pdeb_cred,data =:pdata,empresa=:pempresa,vl_cust_merc=:pvl_cust_merc, '
      + 'vl_cust_terc =:pvl_cust_terc,lucro=:plucro,status=:pstatus,observacao=:pobservacao  where codigo = :pcodigo';
    ContasSQLQuery.ParamByName('pcodigo').AsInteger := StrToInt(cadCodEdit.Text);
    ContasSQLQuery.ParamByName('pdata').AsDateTime := CadVencDateEdit.Date;
    ContasSQLQuery.ParamByName('ptipo').AsString := CadTipoCombobox.Text;
    ContasSQLQuery.ParamByName('pdescricao').AsString := CadDescEdit.Text;
    ContasSQLQuery.ParamByName('pcentrocusto_id').AsString := CadIndexCCEdit.Text;
    ContasSQLQuery.ParamByName('pvalor').AsFloat := strtofloat(CadValorEdit.Text);
    ContasSQLQuery.ParamByName('pdeb_cred').AsString := CadDebCredEdit.Text;
    ContasSQLQuery.ParamByName('pvl_cust_merc').AsFloat :=
      strtofloat(CadCustoMercEdit.Text);
    ContasSQLQuery.ParamByName('pvl_cust_terc').AsFloat :=
      strtofloat(CadCustoTercEdit.Text);
    ContasSQLQuery.ParamByName('plucro').AsFloat := strtofloat(CadLucroEdit.Text);
    ContasSQLQuery.ParamByName('pempresa').AsString := CadEmpresaIDEdit.Text;
    ContasSQLQuery.ParamByName('pstatus').AsString := CadStatusIdEdit.Text;
    if (CadDtPagDateEdit.Text<>'  /  /    ') then
    ContasSQLQuery.ParamByName('pdata_pagamento').AsDate := strtodate(CadDtPagDateEdit.Text);
    ContasSQLQuery.ParamByName('pobservacao').AsString := ObservacaoMemo.Text;
    ContasSQLQuery.ExecSQL;
    MainForm.MainSQLTransaction.Commit;
    ClearCad;
    pesq_descChange(self);
  except
    on E: Exception do
    begin
      MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;
end;

procedure TContasPagRecForm.FormatarCampos;
begin
  if CadValorEdit.Text = '' then
    CadValorEdit.Text := '0';
  if CadCustoMercEdit.Text = '' then
    CadCustoMercEdit.Text := '0';
  if CadCustoTercEdit.Text = '' then
    CadCustoTercEdit.Text := '0';
  if CadLucroEdit.Text = '' then
    CadLucroEdit.Text := '0';
  if CadTipoCombobox.Text = 'A PAGAR' then
  begin
    CadDebCredEdit.Text := 'D';
    CadLucroEdit.Text := '0';
    CadCustoMercEdit.Enabled := False;
    CadCustoTercEdit.Enabled := False;
    CadLucroEdit.Enabled := False;
    if strtofloat(CadValorEdit.Text) > 0 then
      CadValorEdit.Text := FormatFloat('#0.00', (strtofloat(CadValorEdit.Text) * -1));
  end;
  if CadTipoCombobox.Text = 'A RECEBER' then
  begin
    CadDebCredEdit.Text := 'C';
    CadCustoMercEdit.Enabled := True;
    CadCustoTercEdit.Enabled := True;
    CadLucroEdit.Enabled := True;
    CadLucroEdit.Text := floattostr((strtofloat(CadValorEdit.Text)) -
      (strtofloat(CadCustoMercEdit.Text)) - (strtofloat(CadCustoTercEdit.Text)));
    if strtofloat(CadValorEdit.Text) < 0 then
      CadValorEdit.Text := FormatFloat('#0.00', (strtofloat(CadValorEdit.Text) * -1));
  end;
  CadValorEdit.Text := FormatFloat('#0.00', strtofloat(CadValorEdit.Text));
  CadCustoMercEdit.Text := FormatFloat('#0.00', strtofloat(CadCustoMercEdit.Text));
  CadCustoTercEdit.Text := FormatFloat('#0.00', strtofloat(CadCustoTercEdit.Text));
  CadLucroEdit.Text := FormatFloat('#0.00', strtofloat(CadLucroEdit.Text));
end;

procedure TContasPagRecForm.CadCamposModificados;
begin
  if PageControl_contas.ActivePage = lancamentos then
  begin
    if (CadDescEdit.Text = '') then
      btnInserir.Enabled := False
    else
      btnInserir.Enabled := True;
  end;
  if CadStatusIdEdit.Text = '2' then
    CadDtPagDateEdit.Enabled := True
  else
    CadDtPagDateEdit.Enabled := False;
end;

procedure TContasPagRecForm.MsgError(const AClassName, AMsg: string);
const
  CMsg = 'Error in class "%s": %s';
begin
  Application.MessageBox(PChar(Format(CMsg, [AClassName, AMsg])),
    PChar(Application.Title), MB_ICONERROR + MB_OK);
end;

procedure TContasPagRecForm.SearchLimpaSpeedButtonClick(Sender: TObject);
begin
  SearchCCEdit.Clear;
  SearchCCIDEdit.Clear;
  SearchEmpEdit.Clear;
  SearchStatusEdit.Clear;
  SearchStatusIDEdit.Clear;
  SearchEmpIDEdit.Clear;
  Edit3.Clear;
  Edit4.Clear;
  searchTipoCombobox.ItemIndex := -1;
  Combobox2.ItemIndex := -1;
  SearchStatusEdit.Clear;
  SearchStatusIDEdit.Clear;
  pesq_desc.Clear;
  pesq_dtin.Date := strtodate('01/01/2005');
  pesq_dtfin.Date := strtodate('01/12/2099');
  SearchResultStringGrid.RowCount := 1;
  SearchEmpEdit.Text:='';
  SearchEmpIDEdit.Text := '1';
  StatusBar1.Panels[0].Text := '';
  StatusBar1.Panels[1].Text := '';
  StatusBar1.Panels[2].Text := '';
  StatusBar1.Panels[3].Text := '';
  StatusBar1.Panels[4].Text := '';
  StatusBar1.Panels[5].Text := '';


end;

procedure TContasPagRecForm.pesq_descChange(Sender: TObject);
var
  Soma: currency;
  custo_merc: currency;
  cust_terc: currency;
  lucro: currency;
  cc,dt:string;
  n:integer;
  cliente,tipo_nota:string;

begin
  mgrid.Hide;
  MainForm.MainSQLTransaction.StartTransaction;
  try
    //soma no final do periodo
    ContasSQLQuery.Close;
    cc:='';
    for n:=0 to StringGrid_cc.RowCount-1 do
    begin
      if ((StringGrid_cc.Cells[0,n]='1' )and (cc<>'')) then
      cc+=' or centrocusto_id like '+ quotedstr(StringGrid_cc.Cells[2,n]);
      if ((StringGrid_cc.Cells[0,n]='1')and (cc='')) then
      cc:=' and (centrocusto_id like ' + quotedstr(StringGrid_cc.Cells[2,n]);
    end;
    if (cc<>'') then
    cc+=' ) ';

    if (SearchStatusIDEdit.Text = '2')then  // paga
    dt:= ' data_pagamento '  else  dt:= 'data' ;


    if(combobox2.ItemIndex>-1)then
    tipo_nota:=  ' and tipo_nota = '+inttostr(combobox2.ItemIndex) else  tipo_nota:='';

    if(edit4.Text<>'')then
     cliente:= ' and codigo_cadastro = ' + edit4.Text else cliente:='';



    ContasSQLQuery.SQL.Text :=
      'SELECT sum(valor)as soma from CONTAS_PAG_RECEB where EMPRESA like :pempresa ' +
      cc+
      ' and descricao like :pdescricao '+tipo_nota+cliente+' and tipo like :ptipo and ' +
      'status like :pstatus and  '+dt+'  <= :pdata ';
    if pesq_desc.Text <> '' then
      ContasSQLQuery.ParamByName('pdescricao').AsString := '%' + pesq_desc.Text + '%'
    else
      ContasSQLQuery.ParamByName('pdescricao').AsString := '%';
  //  if SearchCCIDEdit.Text <> '' then
  //    ContasSQLQuery.ParamByName('pcentrocusto_id').AsString := SearchCCIDEdit.Text
   // else
  //    ContasSQLQuery.ParamByName('pcentrocusto_id').AsString := '%';
    if searchTipoCombobox.Text <> '' then
      ContasSQLQuery.ParamByName('ptipo').AsString := searchTipoCombobox.Text
    else
      ContasSQLQuery.ParamByName('ptipo').AsString := '%';
    if SearchEmpIDEdit.Text <> '' then
      ContasSQLQuery.ParamByName('pempresa').AsString := SearchEmpIDEdit.Text
    else
      ContasSQLQuery.ParamByName('pempresa').AsString := '%';
    if SearchStatusEdit.Text <> '' then
      ContasSQLQuery.ParamByName('pstatus').AsString := SearchStatusIDEdit.Text
    else
      ContasSQLQuery.ParamByName('pstatus').AsString := '%';
    ContasSQLQuery.ParamByName('pdata').AsDateTime := pesq_dtfin.Date;
    ContasSQLQuery.Open;
    StatusBar1.Panels[5].Text :=
      'Saldo Final: ' + 'R$ ' + FormatFloat('#0.00',
      ContasSQLQuery.FieldByName('soma').AsFloat);
    //----------
    ContasSQLQuery.Close;
    ContasSQLQuery.SQL.Text :=
      'SELECT sum(valor)as soma from CONTAS_PAG_RECEB where EMPRESA like :pempresa ' +
      cc+' and descricao like :pdescricao '+tipo_nota+cliente+' and tipo like :ptipo and ' +
      'status like :pstatus and  '+dt+'  < :pdata ';
    if pesq_desc.Text <> '' then
      ContasSQLQuery.ParamByName('pdescricao').AsString := '%' + pesq_desc.Text + '%'
    else
      ContasSQLQuery.ParamByName('pdescricao').AsString := '%';
   // if SearchCCIDEdit.Text <> '' then
   //   ContasSQLQuery.ParamByName('pcentrocusto_id').AsString := SearchCCIDEdit.Text
   // else
     // ContasSQLQuery.ParamByName('pcentrocusto_id').AsString := '%';
    if searchTipoCombobox.Text <> '' then
      ContasSQLQuery.ParamByName('ptipo').AsString := searchTipoCombobox.Text
    else
      ContasSQLQuery.ParamByName('ptipo').AsString := '%';
    if SearchEmpIDEdit.Text <> '' then
      ContasSQLQuery.ParamByName('pempresa').AsString := SearchEmpIDEdit.Text
    else
      ContasSQLQuery.ParamByName('pempresa').AsString := '%';
    if SearchStatusEdit.Text <> '' then
      ContasSQLQuery.ParamByName('pstatus').AsString := SearchStatusIDEdit.Text
    else
      ContasSQLQuery.ParamByName('pstatus').AsString := '%';
    ContasSQLQuery.ParamByName('pdata').AsDateTime := pesq_dtin.Date;
    ContasSQLQuery.Open;
    somaant := ContasSQLQuery.FieldByName('soma').AsCurrency;
    StatusBar1.Panels[4].Text :=
      'Saldo Anterior: ' + 'R$ ' + FormatFloat('#0.00',
      ContasSQLQuery.FieldByName('soma').AsFloat);

    //----------
    ContasSQLQuery.Close;


    ContasSQLQuery.SQL.Text :=
      'SELECT sum(valor)as soma from CONTAS_PAG_RECEB where EMPRESA like :pempresa ' +
      cc+' and descricao like :pdescricao '+tipo_nota+cliente+' and tipo like :ptipo and ' +
      'status like :pstatus and  '+dt+'   between :pdataini and :pdatafin ';
    if pesq_desc.Text <> '' then
      ContasSQLQuery.ParamByName('pdescricao').AsString := '%' + pesq_desc.Text + '%'
    else
      ContasSQLQuery.ParamByName('pdescricao').AsString := '%';
  //  if SearchCCIDEdit.Text <> '' then
  //    ContasSQLQuery.ParamByName('pcentrocusto_id').AsString := SearchCCIDEdit.Text
   // else
    //  ContasSQLQuery.ParamByName('pcentrocusto_id').AsString := '%';
    if searchTipoCombobox.Text <> '' then
      ContasSQLQuery.ParamByName('ptipo').AsString := searchTipoCombobox.Text
    else
      ContasSQLQuery.ParamByName('ptipo').AsString := '%';
    if SearchEmpIDEdit.Text <> '' then
      ContasSQLQuery.ParamByName('pempresa').AsString := SearchEmpIDEdit.Text
    else
      ContasSQLQuery.ParamByName('pempresa').AsString := '%';
    if SearchStatusEdit.Text <> '' then
      ContasSQLQuery.ParamByName('pstatus').AsString := SearchStatusIDEdit.Text
    else
      ContasSQLQuery.ParamByName('pstatus').AsString := '%';
    ContasSQLQuery.ParamByName('pdataini').AsDateTime := pesq_dtin.Date;
    ContasSQLQuery.ParamByName('pdatafin').AsDateTime := pesq_dtfin.Date;
    ContasSQLQuery.Open;
    StatusBar1.Panels[0].Text :=
      'Saldo Periodo : ' + 'R$ ' + FormatFloat('#0.00',
      ContasSQLQuery.FieldByName('soma').AsFloat);

    //----------
    ContasSQLQuery.Close;
    ContasSQLQuery.SQL.Text :=
      'SELECT sum(VL_CUST_MERC)as soma from CONTAS_PAG_RECEB where EMPRESA like :pempresa '
      +cc+ ' and descricao like :pdescricao '+tipo_nota+cliente+' and tipo like :ptipo and ' +
      'status like :pstatus and  '+dt+'  between :pdataini and :pdatafin ';
    if pesq_desc.Text <> '' then
      ContasSQLQuery.ParamByName('pdescricao').AsString := '%' + pesq_desc.Text + '%'
    else
      ContasSQLQuery.ParamByName('pdescricao').AsString := '%';
  //  if SearchCCIDEdit.Text <> '' then
   //   ContasSQLQuery.ParamByName('pcentrocusto_id').AsString := SearchCCIDEdit.Text
   // else
   //   ContasSQLQuery.ParamByName('pcentrocusto_id').AsString := '%';
    if searchTipoCombobox.Text <> '' then
      ContasSQLQuery.ParamByName('ptipo').AsString := searchTipoCombobox.Text
    else
      ContasSQLQuery.ParamByName('ptipo').AsString := '%';
    if SearchEmpIDEdit.Text <> '' then
      ContasSQLQuery.ParamByName('pempresa').AsString := SearchEmpIDEdit.Text
    else
      ContasSQLQuery.ParamByName('pempresa').AsString := '%';
    if SearchStatusEdit.Text <> '' then
      ContasSQLQuery.ParamByName('pstatus').AsString := SearchStatusIDEdit.Text
    else
      ContasSQLQuery.ParamByName('pstatus').AsString := '%';
    ContasSQLQuery.ParamByName('pdataini').AsDateTime := pesq_dtin.Date;
    ContasSQLQuery.ParamByName('pdatafin').AsDateTime := pesq_dtfin.Date;
    ContasSQLQuery.Open;
    StatusBar1.Panels[1].Text :=
      'Custo Merc. : ' + 'R$ ' + FormatFloat('#0.00',
      ContasSQLQuery.FieldByName('soma').AsFloat);

    //----------
    ContasSQLQuery.Close;
    ContasSQLQuery.SQL.Text :=
      'SELECT sum(VL_CUST_TERC)as soma from CONTAS_PAG_RECEB where EMPRESA like :pempresa '
      +cc+ ' and descricao like :pdescricao '+tipo_nota+cliente+' and tipo like :ptipo and ' +
      'status like :pstatus and  '+dt+'  between :pdataini and :pdatafin ';
    if pesq_desc.Text <> '' then
      ContasSQLQuery.ParamByName('pdescricao').AsString := '%' + pesq_desc.Text + '%'
    else
      ContasSQLQuery.ParamByName('pdescricao').AsString := '%';
 //   if SearchCCIDEdit.Text <> '' then
   //   ContasSQLQuery.ParamByName('pcentrocusto_id').AsString := SearchCCIDEdit.Text
  //  else
   //   ContasSQLQuery.ParamByName('pcentrocusto_id').AsString := '%';
    if searchTipoCombobox.Text <> '' then
      ContasSQLQuery.ParamByName('ptipo').AsString := searchTipoCombobox.Text
    else
      ContasSQLQuery.ParamByName('ptipo').AsString := '%';
    if SearchEmpIDEdit.Text <> '' then
      ContasSQLQuery.ParamByName('pempresa').AsString := SearchEmpIDEdit.Text
    else
      ContasSQLQuery.ParamByName('pempresa').AsString := '%';
    if SearchStatusEdit.Text <> '' then
      ContasSQLQuery.ParamByName('pstatus').AsString := SearchStatusIDEdit.Text
    else
      ContasSQLQuery.ParamByName('pstatus').AsString := '%';
    ContasSQLQuery.ParamByName('pdataini').AsDateTime := pesq_dtin.Date;
    ContasSQLQuery.ParamByName('pdatafin').AsDateTime := pesq_dtfin.Date;
    ContasSQLQuery.Open;
    StatusBar1.Panels[2].Text :=
      'Custo Terceiros : ' + 'R$ ' + FormatFloat('#0.00',
      ContasSQLQuery.FieldByName('soma').AsFloat);

    //----------
    ContasSQLQuery.Close;
    ContasSQLQuery.SQL.Text :=
      'SELECT sum(LUCRO)as soma from CONTAS_PAG_RECEB where EMPRESA like :pempresa ' +
      cc+' and descricao like :pdescricao '+tipo_nota+cliente+' and tipo like :ptipo and ' +
      'status like :pstatus and  '+dt+'   between :pdataini and :pdatafin ';
    if pesq_desc.Text <> '' then
      ContasSQLQuery.ParamByName('pdescricao').AsString := '%' + pesq_desc.Text + '%'
    else
      ContasSQLQuery.ParamByName('pdescricao').AsString := '%';
    //if SearchCCIDEdit.Text <> '' then
    //  ContasSQLQuery.ParamByName('pcentrocusto_id').AsString := SearchCCIDEdit.Text
    //else
   //   ContasSQLQuery.ParamByName('pcentrocusto_id').AsString := '%';
    if searchTipoCombobox.Text <> '' then
      ContasSQLQuery.ParamByName('ptipo').AsString := searchTipoCombobox.Text
    else
      ContasSQLQuery.ParamByName('ptipo').AsString := '%';
    if SearchEmpIDEdit.Text <> '' then
      ContasSQLQuery.ParamByName('pempresa').AsString := SearchEmpIDEdit.Text
    else
      ContasSQLQuery.ParamByName('pempresa').AsString := '%';
    if SearchStatusEdit.Text <> '' then
      ContasSQLQuery.ParamByName('pstatus').AsString := SearchStatusIDEdit.Text
    else
      ContasSQLQuery.ParamByName('pstatus').AsString := '%';
    ContasSQLQuery.ParamByName('pdataini').AsDateTime := pesq_dtin.Date;
    ContasSQLQuery.ParamByName('pdatafin').AsDateTime := pesq_dtfin.Date;
    ContasSQLQuery.Open;
    StatusBar1.Panels[3].Text :=
      'Lucro : ' + 'R$ ' + FormatFloat('#0.00', ContasSQLQuery.FieldByName(
      'soma').AsFloat);

    //----------  da a pesquisa no stringgrid


    ContasSQLQuery.Close;
    ContasSQLQuery.SQL.Text :=
      'SELECT * from CONTAS_PAG_RECEB where EMPRESA like :pempresa ' +
      cc+' and descricao like :pdescricao '+tipo_nota+cliente+' and tipo like :ptipo and ' +
      'status like :pstatus and '+dt+' between :pdataini and :pdatafin order by '+dt +' desc';
    if pesq_desc.Text <> '' then
      ContasSQLQuery.ParamByName('pdescricao').AsString := '%' + pesq_desc.Text + '%'
    else
      ContasSQLQuery.ParamByName('pdescricao').AsString := '%';
  //  if SearchCCIDEdit.Text <> '' then
   //   ContasSQLQuery.ParamByName('pcentrocusto_id').AsString := SearchCCIDEdit.Text
 //   else
  //    ContasSQLQuery.ParamByName('pcentrocusto_id').AsString := '%';
    if searchTipoCombobox.Text <> '' then
      ContasSQLQuery.ParamByName('ptipo').AsString := searchTipoCombobox.Text
    else
      ContasSQLQuery.ParamByName('ptipo').AsString := '%';
    if SearchEmpIDEdit.Text <> '' then
      ContasSQLQuery.ParamByName('pempresa').AsString := SearchEmpIDEdit.Text
    else
      ContasSQLQuery.ParamByName('pempresa').AsString := '%';
    if SearchStatusEdit.Text <> '' then
      ContasSQLQuery.ParamByName('pstatus').AsString := SearchStatusIDEdit.Text
    else
      ContasSQLQuery.ParamByName('pstatus').AsString := '%';
    ContasSQLQuery.ParamByName('pdataini').AsDateTime := pesq_dtin.Date;
    ContasSQLQuery.ParamByName('pdatafin').AsDateTime := pesq_dtfin.Date;

    ContasSQLQuery.Open;
{if ContasSQLQuery.IsEmpty then
begin
  SearchResultStringGrid.RowCount := 1;
  ShowMessage('Erro ao carregar dados');
end
else  }
    begin
      ContasSQLQuery.First;
      SearchResultStringGrid.BeginUpdate;
      try
        SearchResultStringGrid.RowCount := 1;
        SearchResultStringGrid.RowCount :=
          ContasSQLQuery.RecordCount + SearchResultStringGrid.FixedRows;
        while not ContasSQLQuery.EOF do
        begin
          SearchResultStringGrid.Cells[0, ContasSQLQuery.RecNo] :=
            ContasSQLQuery.FieldByName('data').AsString;
          SearchResultStringGrid.Cells[1, ContasSQLQuery.RecNo] :=
            ContasSQLQuery.FieldByName('descricao').AsString;
          SearchResultStringGrid.Cells[2, ContasSQLQuery.RecNo] :=
            FormatFloat('#0.00', ContasSQLQuery.FieldByName('valor').AsFloat);
          SearchResultStringGrid.Cells[3, ContasSQLQuery.RecNo] :=
            ContasSQLQuery.FieldByName('data_pagamento').AsString;
          SearchResultStringGrid.Cells[4, ContasSQLQuery.RecNo] :=
            ContasSQLQuery.FieldByName('deb_cred').AsString;
          SearchResultStringGrid.Cells[5, ContasSQLQuery.RecNo] :=
            FormatFloat('#0.00', ContasSQLQuery.FieldByName('vl_cust_merc').AsFloat);
          SearchResultStringGrid.Cells[6, ContasSQLQuery.RecNo] :=
            FormatFloat('#0.00', ContasSQLQuery.FieldByName('vl_cust_terc').AsFloat);
          SearchResultStringGrid.Cells[7, ContasSQLQuery.RecNo] :=
            FormatFloat('#0.00', ContasSQLQuery.FieldByName('lucro').AsFloat);
          SearchResultStringGrid.Cells[8, ContasSQLQuery.RecNo] :=
            ContasSQLQuery.FieldByName('codigo').AsString;
           SearchResultStringGrid.Cells[9, ContasSQLQuery.RecNo] :=
            ContasSQLQuery.FieldByName('status').AsString;
          ContasSQLQuery.Next;
        end;
      finally
        SearchResultStringGrid.EndUpdate;
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

procedure TContasPagRecForm.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Você deseja excluir o registro atual ?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    MainForm.MainSQLTransaction.StartTransaction;
    try
      ContasSQLQuery.SQL.Text := 'delete from contas_pag_receb where codigo = :pcodigo';
      ContasSQLQuery.ParamByName('pcodigo').AsInteger := StrToInt(cadCodEdit.Text);
      ContasSQLQuery.ExecSQL;
      MainForm.MainSQLTransaction.Commit;
      ClearCad;
    except
      on E: Exception do
      begin
        MainForm.MainSQLTransaction.Rollback;
        MsgError(E.ClassName, E.Message);
      end;
    end;
  end;
end;

procedure TContasPagRecForm.btnCancelarClick(Sender: TObject);
begin
  ClearCad;
end;

procedure TContasPagRecForm.SpeedButton1Click(Sender: TObject);
begin

 //   StringGrid_cc.Parent := SearchCCEdit.Parent;
  contrId := SearchCCIDEdit;
  contrDesc := SearchCCEdit;
  StringGrid_cc.top := SearchCCEdit.Top + 20;
  StringGrid_cc.Left := SearchCCEdit.Left;
  MainForm.MainSQLTransaction.StartTransaction;
  try
    LookupSQLQuery.SQL.Text :='select *  from centro_custo order by codigo_cc';
    LookupSQLQuery.Open;
{    if LookupSQLQuery.IsEmpty then
    begin
      StringGrid_cc.RowCount := 1;
      ShowMessage('Erro ao carregar dados');
    end
    else }
    begin
      LookupSQLQuery.First;
      StringGrid_cc.BeginUpdate;
      try
        StringGrid_cc.Clear;
        StringGrid_cc.Options := StringGrid_cc.Options + [gorowselect];
        StringGrid_cc.FixedCols := 0;
        StringGrid_cc.FixedRows := 0;
      //  StringGrid_cc.ColCount := 2;
       // StringGrid_cc.Height := 250;
      //  StringGrid_cc.ColWidths[0] := 250;
       // StringGrid_cc.ColWidths[1] := 0;
        StringGrid_cc.RowCount := LookupSQLQuery.RecordCount ;
        while not LookupSQLQuery.EOF do
        begin
          StringGrid_cc.Cells[0, LookupSQLQuery.RecNo - 1] := '0';
          StringGrid_cc.Cells[2, LookupSQLQuery.RecNo - 1] :=
            LookupSQLQuery.FieldByName('codigo_cc').AsString;
          StringGrid_cc.Cells[1, LookupSQLQuery.RecNo - 1] :=
            LookupSQLQuery.FieldByName('descricao_cc').AsString;
          LookupSQLQuery.Next;
        end;
      finally
        StringGrid_cc.EndUpdate;
      end;
    end;
    MainForm.MainSQLTransaction.Commit;
  //  mbotao.Parent := SearchCCEdit.Parent;
  //  mbotao.Top := StringGrid_cc.Top + StringGrid_cc.Height;
  //  mbotao.Left := StringGrid_cc.Left;
   // mbotao.Width := StringGrid_cc.Width;
  //  mbotao.Caption := 'Cancelar';
  //  mbotao.OnClick := @bclica;
  //  mbotao.Visible := True;
  //  StringGrid_cc.OnSelection := @seleciona;
 //   StringGrid_cc.OnClick := @click;
  except
    on E: Exception do
    begin
      MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;
  Panel1.Show;
  panel1.Width := 187;
  panel1.Height := 162;
  StringGrid_cc.SetFocus;
end;

procedure TContasPagRecForm.SpeedButton3Click(Sender: TObject);
var
  cc,dt :string;
  n,i:integer;
  vx,vy,vy2: double;
  JPFpdf1: TJPFpdf;

begin
  MainForm.MainSQLTransaction.StartTransaction;
  try
     cc:='';
    for n:=0 to StringGrid_cc.RowCount-1 do
    begin
      if ((StringGrid_cc.Cells[0,n]='1' )and (cc<>'')) then
      cc+=' or centrocusto_id like '+ quotedstr(StringGrid_cc.Cells[2,n]);
      if ((StringGrid_cc.Cells[0,n]='1')and (cc='')) then
      cc:=' and (centrocusto_id like ' + quotedstr(StringGrid_cc.Cells[2,n]);
    end;
    if (cc<>'') then
    cc+=' ) ';

    if (SearchStatusIDEdit.Text = '2')then  // paga
    dt:= ' data_pagamento '  else  dt:= 'data' ;

    ContasSQLQuery.SQL.Text :=
      'SELECT * from CONTAS_PAG_RECEB where EMPRESA like :pempresa ' +
      cc+' and descricao like :pdescricao and tipo like :ptipo and ' +
      'status like :pstatus and '+dt+' between :pdataini and :pdatafin order by '+dt;
    if pesq_desc.Text <> '' then
      ContasSQLQuery.ParamByName('pdescricao').AsString := '%' + pesq_desc.Text + '%'
    else
      ContasSQLQuery.ParamByName('pdescricao').AsString := '%';
  //  if SearchCCIDEdit.Text <> '' then
   //   ContasSQLQuery.ParamByName('pcentrocusto_id').AsString := SearchCCIDEdit.Text
 //   else
  //    ContasSQLQuery.ParamByName('pcentrocusto_id').AsString := '%';
    if searchTipoCombobox.Text <> '' then
      ContasSQLQuery.ParamByName('ptipo').AsString := searchTipoCombobox.Text
    else
      ContasSQLQuery.ParamByName('ptipo').AsString := '%';
    if SearchEmpIDEdit.Text <> '' then
      ContasSQLQuery.ParamByName('pempresa').AsString := SearchEmpIDEdit.Text
    else
      ContasSQLQuery.ParamByName('pempresa').AsString := '%';
    if SearchStatusEdit.Text <> '' then
      ContasSQLQuery.ParamByName('pstatus').AsString := SearchStatusIDEdit.Text
    else
      ContasSQLQuery.ParamByName('pstatus').AsString := '%';
    ContasSQLQuery.ParamByName('pdataini').AsDateTime := pesq_dtin.Date;
    ContasSQLQuery.ParamByName('pdatafin').AsDateTime := pesq_dtfin.Date;

    ContasSQLQuery.Open;
    {frReport1.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Rel_contas.lrf');
    frReport1.FindObject('Memo5').Memo.text := StatusBar1.Panels[5].Text;//saldo final
    frReport1.FindObject('Memo1').Memo.text := 'Relatório Fechamento de Caixa';
    frReport1.FindObject('Memo6').Memo.Text:= StatusBar1.Panels[4].Text ; //saldo anterior
    if (SearchStatusIDEdit.Text = '2') then
    frReport1.FindObject('Memo13').Memo.text := '[ContasSQLQuery."DATA_PAGAMENTO"]'
    else
    frReport1.FindObject('Memo13').Memo.text := '[ContasSQLQuery."DATA"]';
    frReport1.PrepareReport;
    frReport1.ShowReport;  }

  JPFpdf1 := TJPFpdf.Create;
  JPFpdf1.SetAutoPageBreak(true,9.5);
  JPFpdf1.SetUTF8(True);
  JPFpdf1.AddPage;
  JPFpdf1.SetFont(ffTimes,19,false);
  JPFpdf1.Cell(190,10,'Relatório Fechamento de Caixa','TBLR','C',0);
  JPFpdf1.Ln();
  JPFpdf1.SetFont(ffTimes,12,false);
  JPFpdf1.Cell(190,7,StatusBar1.Panels[4].Text,'TBLR','0',0);
  JPFpdf1.Ln();
  if (SearchStatusIDEdit.Text = '2') then
  JPFpdf1.Cell(25,7,'DATA PAG','TBLR','C',0) else
  JPFpdf1.Cell(25,7,'DATA','TBLR','C',0);
  JPFpdf1.Cell(140,7,'DESCRIÇAO','TBLR','C',0);
  JPFpdf1.Cell(25,7,'VALOR','TBLR','C',0);
  JPFpdf1.Ln();
  JPFpdf1.SetFont(ffHelvetica,fsNormal,9);
    contasSQLQuery.first;
    i:=0;
     while not contasSQLQuery.EOF do
     begin
       if (odd(i))then
       begin

       if (SearchStatusIDEdit.Text = '2') then
       JPFpdf1.Cell(25,5,contasSQLQuery.FieldByName('data_pagamento').AsString,'LR','C',0)  else
       JPFpdf1.Cell(25,5,contasSQLQuery.FieldByName('data').AsString,'LR','C',0);
       vy:=JPFpdf1.GetY;
       JPFpdf1.MultiCell(140,5,contasSQLQuery.FieldByName('descricao').AsString,'LR','0',0);
       vy2:=JPFpdf1.GetY;
       JPFpdf1.SetY(vy);
       JPFpdf1.SetX(175);
       JPFpdf1.Cell(25,5,FormatFloat('#0.00',contasSQLQuery.FieldByName('valor').AsFloat),'LR','C',0);
       JPFpdf1.SetY(vy2);
      // JPFpdf1.Ln();
       end;
       if not(odd(i))then
       begin
       JPFpdf1.SetFillColor(cSilver);

       if (SearchStatusIDEdit.Text = '2') then
       JPFpdf1.Cell(25,5,contasSQLQuery.FieldByName('data_pagamento').AsString,'LR','C',1)  else
       JPFpdf1.Cell(25,5,contasSQLQuery.FieldByName('data').AsString,'LR','C',1);
       vy:=JPFpdf1.GetY;
       JPFpdf1.MultiCell(140,5,contasSQLQuery.FieldByName('descricao').AsString,'LR','0',1);
       vy2:=JPFpdf1.GetY;
       JPFpdf1.SetY(vy);
       JPFpdf1.SetX(175);
       JPFpdf1.Cell(25,5,FormatFloat('#0.00',contasSQLQuery.FieldByName('valor').AsFloat),'LR','C',1);
       JPFpdf1.SetY(vy2);
       //JPFpdf1.Ln();
       end;

       contasSQLQuery.Next;
       i:=i+1;
     end;

 JPFpdf1.Ln(4);
 JPFpdf1.Cell(190,7,StatusBar1.Panels[5].Text,'TBLR','0',0);
 JPFpdf1.Ln(20);


 JPFpdf1.SaveToFile(ExtractFilePath(ParamStr(0)) +'temp/relatorio_contas'+'.pdf');
 JPFpdf1.Free;

{ FOutFile := TFileStream.Create(ExtractFileDir(Application.ExeName) +'/temp/relatorio_contas.pdf', fmCreate);
  FDoc := TPdfDoc.Create;
  FDoc.NewDoc;
  FDoc.Info.Author := '';
  FDoc.Info.CreationDate := now;
  FDoc.Info.ModDate := now;
  FDoc.Info.Subject := 'relatorio_contas';
  FDoc.Info.Title := 'relatorio contas ';
  FDoc.Info.Creator := '';
  FDoc.AddPage;
  FDoc.Canvas.SetFont('Times-BOLD', 18);
  cell(10,10,190,10,'Relatório Fechamento de Caixa','TBLR','',true,clsilver);





  FDoc.SaveToStream(FOutFile);
  FDoc.Free;
  FOutFile.Free ;     }

 OpenDocument(ExtractFilePath(ParamStr(0)) +'temp/relatorio_contas'+'.pdf') ;

    MainForm.MainSQLTransaction.Commit;
    StatusIDEdit.Clear;
    StatusEdit.Clear;
  except
    on E: Exception do
    begin
      MainForm.MainSQLTransaction.Rollback;
      MsgError(E.ClassName, E.Message);
    end;
  end;
end;

procedure TContasPagRecForm.StatusButtonClick(Sender: TObject);
begin
  if StatusIDEdit.Text = '' then
  begin
    MainForm.MainSQLTransaction.StartTransaction;
    try
      ContasSQLQuery.SQL.Text :=
        'insert into status_contas_pag_rec(descricao) values(:pdescricao)';
      ContasSQLQuery.ParamByName('pdescricao').AsString := StatusEdit.Text;
      ContasSQLQuery.ExecSQL;
      MainForm.MainSQLTransaction.Commit;
      StatusIDEdit.Clear;
      StatusEdit.Clear;
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
      ContasSQLQuery.SQL.Text :=
        'update status_contas_pag_rec set descricao = :pdescricao' +
        ' where codigo = :pcodigo';
      ContasSQLQuery.ParamByName('pdescricao').AsString := StatusEdit.Text;
      ContasSQLQuery.ParamByName('pcodigo').AsInteger := StrToInt(StatusIDEdit.Text);
      ContasSQLQuery.ExecSQL;
      MainForm.MainSQLTransaction.Commit;
      StatusIDEdit.Clear;
      StatusEdit.Clear;
    except
      on E: Exception do
      begin
        MainForm.MainSQLTransaction.Rollback;
        MsgError(E.ClassName, E.Message);
      end;
    end;
  end;
  StatusButton.Enabled := False;
  StatusTsShow(Sender);
end;

procedure TContasPagRecForm.StatusDelButtonClick(Sender: TObject);
begin
  if MessageDlg('Você deseja excluir o registro atual ?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    MainForm.MainSQLTransaction.StartTransaction;
    try
      ContasSQLQuery.SQL.Text :=
        'delete from status_contas_pag_rec where codigo = :pcodigo';
      ContasSQLQuery.ParamByName('pcodigo').AsInteger := StrToInt(StatusIDEdit.Text);
      ContasSQLQuery.ExecSQL;
      MainForm.MainSQLTransaction.Commit;
      StatusIDEdit.Clear;
      StatusEdit.Clear;
    except
      on E: Exception do
      begin
        MainForm.MainSQLTransaction.Rollback;
        MsgError(E.ClassName, E.Message);
      end;
    end;
  end;
  StatusTsShow(Sender);
end;

procedure TContasPagRecForm.StatusEditKeyDown(Sender: TObject;
  var Key: word; Shift: TShiftState);
begin
  if ((ssCtrl in Shift) and (Key = Ord('V'))) then
    StatusButton.Enabled := True;
end;

procedure TContasPagRecForm.StatusEditKeyPress(Sender: TObject; var Key: char);
begin
  if StatusEdit.Text <> '' then
    StatusButton.Enabled := True;
end;

procedure TContasPagRecForm.StatusIDEditChange(Sender: TObject);
begin
  if StatusIDEdit.Text = '' then
  begin
    StatusButton.Caption := 'Inserir';
    StatusDelButton.Enabled := False;
    StatusButton.Enabled := False;
  end
  else
  begin
    StatusButton.Caption := 'Alterar';
    StatusDelButton.Enabled := True;
  end;
end;

procedure TContasPagRecForm.StatusStringGridDblClick(Sender: TObject);
begin
  StatusIDEdit.Text := textoID;
  StatusEdit.Text := textoDesc;
end;

procedure TContasPagRecForm.StatusStringGridSelection(Sender: TObject;
  aCol, aRow: integer);
begin
  StatusIDEdit.Clear;
  StatusEdit.Clear;
  StatusButton.Enabled := False;
  textoDesc := StatusStringGrid.Cells[1, aRow];
  textoID := StatusStringGrid.Cells[0, aRow];
end;

procedure TContasPagRecForm.StatusTsShow(Sender: TObject);
begin
  MainForm.MainSQLTransaction.StartTransaction;
  StatusStringGrid.ColCount := 2;
  StatusStringGrid.FixedCols := 0;
  StatusStringGrid.ColWidths[0] := 60;
  StatusStringGrid.ColWidths[1] := 250;
  StatusStringGrid.Cells[0, 0] := 'ID';
  StatusStringGrid.Cells[1, 0] := 'Descricao';
  StatusStringGrid.Options := StatusStringGrid.Options + [gorowselect];
  try
    ContasSQLQuery.SQL.Text := 'select *  from status_contas_pag_rec';
    ContasSQLQuery.Open;
    begin
      ContasSQLQuery.First;
      StatusStringGrid.BeginUpdate;
      try
        StatusStringGrid.RowCount :=
          ContasSQLQuery.RecordCount + StatusStringGrid.FixedRows;
        while not ContasSQLQuery.EOF do
        begin
          StatusStringGrid.Cells[0, ContasSQLQuery.RecNo] :=
            IntToStr(ContasSQLQuery.FieldByName('codigo').AsInteger);
          StatusStringGrid.Cells[1, ContasSQLQuery.RecNo] :=
            ContasSQLQuery.FieldByName('descricao').AsString;
          ContasSQLQuery.Next;
        end;
      finally
        StatusStringGrid.EndUpdate;
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

procedure TContasPagRecForm.StringGrid_ccCheckboxToggled(sender: TObject; aCol,
  aRow: Integer; aState: TCheckboxState);
begin
  pesq_descChange(sender);
end;

procedure TContasPagRecForm.StringGrid_ccKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_ESCAPE then
  begin
  Panel1.Hide;
  panel1.Width := 0;
  panel1.Height := 0;
  end;
end;

procedure TContasPagRecForm.StringGrid_ccMouseLeave(Sender: TObject);
begin
Panel1.Hide;
panel1.Width := 0;
panel1.Height := 0;
end;

//initialization
  //{$i pag_rec.lrs}

end.

