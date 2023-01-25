unit CadCompeticao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBase, dxExEdtr, GvBuilder, Menus, gvDBFormStorage, gvAPS,
  ImgList, ActnList, ComCtrls, ExtCtrls, ToolWin, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, Buttons, gvAssistent, Pesquisa, dmdCadCompeticao,
  dxDBTLCl, dxGrClms, StdCtrls, gvGroupBox, gvDBCheckGroupBox, DBCtrls,
  Mask, gvTypes, DmdDatabase, gvSearchFieldManager, DB, gvFormUtils, DBClient,
  RxDBComb, gvDBComboBox, ToolEdit, RXDBCtrl, dxEditor, dxEdLib, dxDBELib, dlgCompeticao, dlgAvaliador,
  Spin;

const
  SUB_PROG_CADAVALIADOR = 'Cadastro de avaliadores';

type
  TfrmCadCompeticao = class(TfrmCadBase)
    frPesquisa: TfrPesquisa;
    sfmConsulta: TgvSearchFieldManager;
    pnlCadCompeticao: TPanel;
    lblUnidade: TLabel;
    lblEmpresa: TLabel;
    lblDescricao: TLabel;
    dbedtDescricaoCompeticao: TDBEdit;
    lblNumeroGanhadores: TLabel;
    dblkcbbEmpresa: TDBLookupComboBox;
    lblSituacaoCompeticao: TLabel;
    lblTipoCompeticao: TLabel;
    lblDataSorteio: TLabel;
    lblDataVotacao: TLabel;
    dbedtDataSorteio: TDBDateEdit;
    dbedtDataVotacao: TDBDateEdit;
    cbbTipoCompeticao: TComboBox;
    aclCad: TActionList;
    edtSituacao: TEdit;
    dbedtSituacao: TDBEdit;
    dblkcbbUnidade: TDBLookupComboBox;
    tlbParticipante: TToolBar;
    btnInserirParticipante: TToolButton;
    dgPesquisaEmpresa: TdxDBGridColumn;
    dgPesquisaUnidade: TdxDBGridColumn;
    dgPesquisaDescricao: TdxDBGridColumn;
    dgPesquisaNumeroGanhadores: TdxDBGridColumn;
    dgPesquisaTipo: TdxDBGridColumn;
    dgPesquisaDataSorteio: TdxDBGridColumn;
    dgPesquisaDataVotacao: TdxDBGridColumn;
    dgPesquisaSituacao: TdxDBGridColumn;
    pgcCadastros: TPageControl;
    tsParticipante: TTabSheet;
    tsAvaliador: TTabSheet;
    dxdbgrdParticipante: TdxDBGrid;
    dxdbgrdAvaliador: TdxDBGrid;
    dxdbgrdParticipanteNome: TdxDBGridColumn;
    dxdbgrdParticipanteContato: TdxDBGridColumn;
    dxdbgrdParticipanteEntrega: TdxDBGridColumn;
    dxdbgrdParticipanteDataEntrega: TdxDBGridColumn;
    btnExcluirParticipante: TToolButton;
    dxdbspndtNumeroGanhadores: TdxDBSpinEdit;
    tlbAvaliador: TToolBar;
    btnInserirAvaliador: TToolButton;
    btnExcluirAvaliador: TToolButton;
    dxdbgrdParticipanteGanhador: TdxDBGridCheckColumn;
    pnlRegistros: TPanel;
    dxdbgrdAvaliadorPossuidesempate: TdxDBGridCheckColumn;
    dxdbgrdAvaliadorRealizasorteio: TdxDBGridCheckColumn;
    btnEditarParticipante: TToolButton;
    btnVisualizarParticipante: TToolButton;
    btnEditarAvaliador: TToolButton;
    btnVisualizarAvaliador: TToolButton;
    imlAtivosPequeno: TImageList;
    imlInativosPequeno: TImageList;
    sfmDescricao: TgvStringSearchField;
    sfmNumeroGanhadores: TgvNumberSearchField;
    sfmDataSorteio: TgvDateTimeSearchField;
    sfmDataVotacao: TgvDateTimeSearchField;
    dxdbgrdAvaliadorNome: TdxDBGridColumn;
    actInserirParticipante: TAction;
    actEditarParticipante: TAction;
    actExcluirParticipante: TAction;
    actVisualizarParticipante: TAction;
    actInserirAvaliador: TAction;
    actEditarAvaliador: TAction;
    actExcluirAvaliador: TAction;
    actVisualizarAvaliador: TAction;
    sfmSituacao: TgvPickListSearchField;
    sfmTipoCompeticao: TgvPickListSearchField;
    sfmEmpresa: TgvPickListSearchField;
    procedure frPesquisabtnPesquisarClick(Sender: TObject);
    procedure frPesquisabtnLimparClick(Sender: TObject);
    procedure cbbTipoCompeticaoChange(Sender: TObject);
    procedure dbedtDataSorteioChange(Sender: TObject);
    procedure dbedtDataVotacaoChange(Sender: TObject);
    procedure edtSituacaoChange(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actConfirmarExecute(Sender: TObject);
    procedure actPesquisarExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure btnExcluirAvaliadorClick(Sender: TObject);
    procedure frPesquisacbCampoChange(Sender: TObject);
    procedure dblkcbbEmpresaExit(Sender: TObject);
    procedure frPesquisacbCondicaoChange(Sender: TObject);
    procedure actVisualizarExecute(Sender: TObject);
    procedure dgPesquisaTipoGetText(Sender: TObject;
      ANode: TdxTreeListNode; var AText: String);
    procedure dgPesquisaSituacaoGetText(Sender: TObject;
      ANode: TdxTreeListNode; var AText: String);
    procedure acoAPSApplyPermissions(Sender: TgvAPSConnection;
      const CanInsert, CanEdit, CanDelete: Boolean);
    procedure acoAPSApplySubPermissions(Sender: TgvAPSConnection;
      const SubProg: String; const CanExecute, CanInsert, CanEdit,
      CanDelete: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInserirParticipanteExecute(Sender: TObject);
    procedure actVisualizarParticipanteExecute(Sender: TObject);
    procedure actExcluirParticipanteExecute(Sender: TObject);
    procedure actEditarParticipanteExecute(Sender: TObject);
    procedure actInserirParticipanteUpdate(Sender: TObject);
    procedure actEditarParticipanteUpdate(Sender: TObject);
    procedure actExcluirParticipanteUpdate(Sender: TObject);
    procedure actVisualizarParticipanteUpdate(Sender: TObject);
    procedure actInserirAvaliadorExecute(Sender: TObject);
    procedure actEditarAvaliadorExecute(Sender: TObject);
    procedure actExcluirAvaliadorExecute(Sender: TObject);
    procedure actVisualizarAvaliadorExecute(Sender: TObject);
    procedure actInserirAvaliadorUpdate(Sender: TObject);
    procedure actEditarAvaliadorUpdate(Sender: TObject);
    procedure actExcluirAvaliadorUpdate(Sender: TObject);
    procedure actVisualizarAvaliadorUpdate(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
  private
    { Private declarations }
    FCadCompeticaoDM: TdmCadCompeticao;
    FPodeIncluir, FPodeEditar, FPodeExcluir, FExecutaIncluir : Boolean;
  public
    { Public declarations }
    class procedure FillSubProgramsList(ALst: TStrings); override;
    procedure Incluir; override;
    procedure Editar; override;
    procedure Excluir; override;
    procedure Gravar; override;
    procedure Cancelar; override;
    function Transferir: Variant; override;
    function Localizar(KeyValue: Variant): Boolean; override;
    constructor Create(AOwner: TComponent; DataModule: TdmCadCompeticao ); reintroduce;
    procedure SetState(NewState: TgvCadState); override;
  end;

var
  frmCadCompeticao: TfrmCadCompeticao;
  codigousuario: Integer;
implementation

{$R *.dfm}

{ TfrmCadCompeticao }

procedure TfrmCadCompeticao.Cancelar;
begin
  inherited;
  FCadCompeticaoDM.CancelarRegistro;
end;

constructor TfrmCadCompeticao.Create(AOwner: TComponent;
  DataModule: TdmCadCompeticao );
begin
  inherited Create(AOwner);
  FCadCompeticaoDM := DataModule;
  FCadCompeticaoDM.AcoAPS := acoAPS;
  acoAPS.GetDllProc.SetDataSourceProperties(Self);
  dgPesquisa.DataSource := FCadCompeticaoDM.dsCompeticao;
  sfmConsulta.OriginalCommandText := FCadCompeticaoDM.OriginalCommandText;
  //
  edtSituacao.Text := EmptyStr;
  codigousuario := 3;
  //
  FCadCompeticaoDM.cdsCompeticao.Close;
  FCadCompeticaoDM.cdsEmpresaLK.Close;
  FCadcompeticaodm.cdsUsuarioAvaliador.Close;
  //
  FCadCompeticaoDM.cdsEmpresaLK.Open;
  FCadcompeticaodm.cdsUsuarioAvaliador.Open;
  //
  if FCadCompeticaoDM.cdsCompeticao.State in ([dsbrowse, dsinsert]) then
  begin
    dbedtDescricaoCompeticao.text := '';
  end;
end;

procedure TfrmCadCompeticao.Editar;
begin
  inherited;
  FCadCompeticaoDM.EditarRegistro;
end;

procedure TfrmCadCompeticao.Excluir;
begin
  inherited;
  FCadCompeticaoDM.ExcluirRegistro;
end;

procedure TfrmCadCompeticao.Gravar;
begin
  FCadCompeticaoDM.ValidarCadastro;
  inherited;
  FCadCompeticaoDM.GravarRegistro;
end;

procedure TfrmCadCompeticao.Incluir;
begin
  inherited;
  FCadCompeticaoDM.IncluirRegistro;
end;

function TfrmCadCompeticao.Localizar(
  KeyValue: Variant): Boolean;
begin
  Result := FCadCompeticaoDM.LocalizarRegistro(True, KeyValue);
end;

procedure TfrmCadCompeticao.SetState(NewState: TgvCadState);
begin
  inherited;
  FCadCompeticaoDM.Estado := Estado;
  if Estado = csView then
    dblkcbbEmpresaExit(nil);
end;

function TfrmCadCompeticao.Transferir: Variant;
begin
  Result := FCadCompeticaoDM.CodigoID;
end;

procedure TfrmCadCompeticao.frPesquisabtnPesquisarClick(
  Sender: TObject);
begin
  inherited;
  frPesquisa.btnPesquisarClick(Sender);
  FCadCompeticaoDM.ExecutarConsulta(frPesquisa.CommandText);
  Atualizar;
end;

procedure TfrmCadCompeticao.frPesquisabtnLimparClick(
  Sender: TObject);
begin
  inherited;
  frPesquisa.btnLimparClick(Sender);
  FCadCompeticaoDM.FecharConsulta;
  Atualizar;
end;

procedure TfrmCadCompeticao.cbbTipoCompeticaoChange(Sender: TObject);
begin
  inherited;
  if cbbTipoCompeticao.text = 'Sorteio' then
  begin
    dbedtDataSorteio.ReadOnly := False;
    dbedtDataVotacao.ReadOnly := True;
    dbedtDataVotacao.Color := clBtnFace;
    dbedtDataSorteio.Color := clWindow;
    dbedtDataVotacao.Clear;
    FCadCompeticaoDM.cdsCompeticaoTIPOCOMPETICAO.AsInteger := 1;
  end
  else if cbbTipoCompeticao.Text = 'Votacao' then
  begin
    dbedtDataSorteio.ReadOnly := True;
    dbedtDataVotacao.ReadOnly := False;  
    dbedtDataVotacao.Color := clWindow;
    dbedtDataSorteio.Color := clBtnFace;
    dbedtDataSorteio.Clear;
    FCadCompeticaoDM.cdsCompeticaoTIPOCOMPETICAO.AsInteger := 2;
  end;

end;

procedure TfrmCadCompeticao.dbedtDataSorteioChange(Sender: TObject);
var
  dataatual: TDateTime;
begin
  inherited;
  dataatual := Now;
  if (dbedtDataSorteio.Date) > dataatual then
  begin
    edtSituacao.Text := 'Em andamento';
  end
  else if (dbedtDataSorteio.Date) <= dataatual then
  begin
    edtSituacao.Text := 'Em andamento';
  end;
end;

procedure TfrmCadCompeticao.dbedtDataVotacaoChange(Sender: TObject);
var
  dataatual: TDateTime;
begin
  inherited;
  dataatual := Now;
  if (dbedtDataVotacao.Date) > dataatual then
  begin
    edtSituacao.Text := 'Em andamento';
  end
  else if (dbedtDataVotacao.Date) <= dataatual then
  begin
    edtSituacao.Text := 'Em andamento';
  end;
end;

procedure TfrmCadCompeticao.edtSituacaoChange(Sender: TObject);
begin
  inherited;
  if edtSituacao.Text = 'Em andamento' then
  begin
    dbedtSituacao.Text := '1';
  end
  else if edtSituacao.Text = 'Encerrada' then
  begin
    dbedtSituacao.Text := '2';
  end;
end;


procedure TfrmCadCompeticao.actIncluirExecute(Sender: TObject);
begin
  inherited;
  dblkcbbEmpresa.Enabled := True;
  dblkcbbUnidade.Enabled := True;
  dbedtDescricaoCompeticao.Enabled := True;
  cbbTipoCompeticao.Enabled := True;
  dxdbspndtNumeroGanhadores.Enabled := True;
  edtSituacao.Enabled := True;
  dbedtDataSorteio.Enabled := True;
  dbedtDataVotacao.Enabled := True;
  //
  edtSituacao.Text := EmptyStr;
  cbbTipoCompeticao.Text := EmptyStr;
  edtSituacao.Text := 'Em andamento';
  cbbTipoCompeticao.Text := 'Sorteio';
  FCadCompeticaoDM.cdsCompeticaoTIPOCOMPETICAO.AsInteger := 1;
  //
  //
  //
  dbedtDataSorteio.ReadOnly := False;
end;

procedure TfrmCadCompeticao.actConfirmarExecute(Sender: TObject);
var
  contPossuiDesempate, contRealizaSorteio: integer;
  oBook: TBookmark;
begin
  if dxdbspndtNumeroGanhadores.IntValue <= 0 then
  begin
    raise Exception.Create('Você não pode cadastrar uma competicao sem ganhadores');
  end;
  if FCadCompeticaoDM.cdsParticipante.RecordCount = 0 then
  begin
    raise Exception.Create('Você não pode cadastrar uma competicao sem participantes.');
  end;
  if FCadCompeticaoDM.cdsAvaliador.RecordCount = 0 then
  begin
    raise Exception.Create('Você não pode cadastrar uma competicao sem avaliadores.');
  end;
  contPossuiDesempate := 0;
  contRealizaSorteio := 0;
  FCadCompeticaoDM.cdsAvaliador.DisableControls;
  try
    oBook := FCadCompeticaoDM.cdsAvaliador.GetBookmark;
    FCadCompeticaoDM.cdsAvaliador.First;
    while not FCadCompeticaoDM.cdsAvaliador.Eof do
    begin
      if FCadCompeticaoDM.cdsAvaliadorPOSSUIDESEMPATE.asboolean then
      begin
        contPossuiDesempate := contPossuiDesempate + 1;
      end;
      if FCadCompeticaoDM.cdsAvaliadorREALIZASORTEIO.AsBoolean then
      begin
        contRealizaSorteio := contRealizaSorteio + 1;
      end;
      if contPossuiDesempate > 1 then
      begin
        Raise Exception.Create('Você não pode cadastrar mais de um avaliador com a permissão de desempate.');
      end;
      FCadCompeticaoDM.cdsAvaliador.Next;
      end;
  finally
    FCadCompeticaoDM.cdsAvaliador.GotoBookmark(obook);
    FCadCompeticaoDM.cdsAvaliador.FreeBookmark(obook);
    FCadCompeticaoDM.cdsAvaliador.enablecontrols;
  end;
  if FCadCompeticaoDM.cdsCompeticaoTIPOCOMPETICAO.AsInteger = 1 then  //Sorteio
      begin
        if contRealizaSorteio < 1 then
        begin
          Raise Exception.Create('Você tem que ter no mínimo um avaliador com a permissão de realizar sorteio numa competicao deste tipo');
        end;
        if contPossuiDesempate >= 1 then
        begin
          raise Exception.Create('Você não pode cadastrar um avaliador com essa permissão nesse tipo de competição.');
        end;
      end;
  if FCadCompeticaoDM.cdsCompeticaoTIPOCOMPETICAO.AsInteger = 2 then  // Votacao
  begin
    if contPossuiDesempate <> 1 then
    begin
      Raise Exception.Create('Você tem que ter um avaliador com a permissão de desempate neste tipo de competição.');
    end;
    if contRealizaSorteio >= 1 then
    begin
      raise Exception.Create('Você não pode ter um avaliador com essa permissão nesse tipo de competição.');
    end;
  end;

  inherited;

 // edtSituacao.Text := EmptyStr;
  //cbbTipoCompeticao.Text := EmptyStr;
end;

procedure TfrmCadCompeticao.actPesquisarExecute(Sender: TObject);
begin
  inherited;
  FCadCompeticaoDM.cdsCompeticao.Close;
  FCadCompeticaoDM.cdsCompeticao.Open;
end;




procedure TfrmCadCompeticao.actEditarExecute(Sender: TObject);
begin
  if FCadCompeticaoDM.cdsCompeticaoSITUACAO.AsInteger = 2 then
  begin
    raise exception.Create('Você não pode editar uma competicao que está encerrada.');
  end;
  if FCadCompeticaoDM.cdsCompeticaoTIPOCOMPETICAO.AsInteger = 1 then
  begin
    cbbTipoCompeticao.Text := 'Sorteio';
  end;
  if FCadCompeticaoDM.cdsCompeticaoTIPOCOMPETICAO.AsInteger = 2 then
  begin
    cbbTipoCompeticao.Text := 'Votacao';
  end;
  if dbedtSituacao.Text = '1' then
  begin
    edtSituacao.Text := 'Em andamento';
  end;
  if dbedtSituacao.Text = '2' then
  begin
    edtSituacao.Text := 'Encerrada';
  end;
  dblkcbbEmpresa.Enabled := True;
  dblkcbbUnidade.Enabled := True;
  dbedtDescricaoCompeticao.Enabled := True;
  cbbTipoCompeticao.Enabled := True;
  dxdbspndtNumeroGanhadores.Enabled := True;
  edtSituacao.Enabled := True;
  dbedtDataSorteio.Enabled := True;
  dbedtDataVotacao.Enabled := True;
  inherited;
end;

procedure TfrmCadCompeticao.btnExcluirAvaliadorClick(Sender: TObject);
begin
  inherited;
  {if not FPodeExcluir then
  begin   
    Application.MessageBox('Usuário não possui permissão de excluir um avaliador.', 'Atenção', MB_OK);   
    Exit; 
  end;  }
  FCadCompeticaoDM.cdsAvaliador.Delete;

end;

procedure TfrmCadCompeticao.frPesquisacbCampoChange(Sender: TObject);
begin
  inherited;
  frPesquisa.cbCampoChange(Sender);
end;

procedure TfrmCadCompeticao.dblkcbbEmpresaExit(Sender: TObject);
begin
  inherited;
  if dblkcbbEmpresa.keyValue > 0 then
  begin
    FCadCompeticaoDM.cdsUnidade.Close;
    FCadCompeticaoDM.sdsUnidade.ParamByName('CODIGOEMPRESA').AsInteger := dblkcbbEmpresa.KeyValue;
    FCadCompeticaoDM.cdsUnidade.Open;
  end;
end;

procedure TfrmCadCompeticao.frPesquisacbCondicaoChange(Sender: TObject);
begin
  inherited;
  frPesquisa.cbCondicaoChange(Sender);
end;

procedure TfrmCadCompeticao.actVisualizarExecute(Sender: TObject);
begin
  inherited;

  if FCadCompeticaoDM.cdsCompeticaoTIPOCOMPETICAO.AsInteger = 1 then
  begin
    cbbTipoCompeticao.Text := 'Sorteio';
  end;
  if FCadCompeticaoDM.cdsCompeticaoTIPOCOMPETICAO.AsInteger = 2 then
  begin
    cbbTipoCompeticao.Text := 'Votacao';
  end;
  if dbedtSituacao.Text = '1' then
  begin
    edtSituacao.Text := 'Em andamento';
  end;
  if dbedtSituacao.Text = '2' then
  begin
    edtSituacao.Text := 'Encerrada';
  end;
  dblkcbbEmpresa.Enabled := False;
  dblkcbbUnidade.Enabled := False;
  dbedtDescricaoCompeticao.Enabled := False;
  cbbTipoCompeticao.Enabled := False;
  dxdbspndtNumeroGanhadores.Enabled := False;
  edtSituacao.Enabled := False;
  dbedtDataSorteio.Enabled := False;
  dbedtDataVotacao.Enabled := False;
  //
end;



procedure TfrmCadCompeticao.dgPesquisaTipoGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
  inherited;
  if AText = '1' then
  begin
    AText := 'Sorteio';
  end
  else if  AText = '2' then
  begin
    AText := 'Votacao';
  end;

end;

procedure TfrmCadCompeticao.dgPesquisaSituacaoGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
  inherited;
  if AText = '1' then
  begin
    AText := 'Em andamento';
  end
  else if AText = '2' then
  begin
    AText := 'Encerrada';
  end;
end;

class procedure TfrmCadCompeticao.FillSubProgramsList(ALst: TStrings);
begin
  inherited;
  ALst.Add(SUB_PROG_CADAVALIADOR);
end;

procedure TfrmCadCompeticao.acoAPSApplyPermissions(
  Sender: TgvAPSConnection; const CanInsert, CanEdit, CanDelete: Boolean);
begin
  inherited;
  FPodeIncluir := CanInsert;
  FPodeEditar := CanEdit;
  FPodeExcluir := CanDelete;
end;

procedure TfrmCadCompeticao.acoAPSApplySubPermissions(
  Sender: TgvAPSConnection; const SubProg: String; const CanExecute,
  CanInsert, CanEdit, CanDelete: Boolean);
begin
  inherited;
  if CompareText(SubProg, Sub_PROG_CADAVALIADOR) = 0 then
  begin
    FExecutaIncluir := CanExecute;
  end;
end;

procedure TfrmCadCompeticao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Assigned(acoAPS.Server) then
    PostMessage(acoAPS.OwnerFormHandle, APS_CLOSEPROG, HANDLE, 0);
end;

procedure TfrmCadCompeticao.actInserirParticipanteExecute(Sender: TObject);
var
  dlgCompeticao: TfrmDlgCompeticao;
begin
  inherited;
  FCadCompeticaoDM.cdsParticipante.Insert;
  FCadCompeticaoDM.cdsParticipanteGANHADOR.AsBoolean := False;
  try
    dlgCompeticao := TfrmDlgCompeticao.Create(self);
    dlgcompeticao.CadCompeticaoDM := FCadCompeticaoDM;
    dlgCompeticao.dbchkGanhador.ReadOnly := True;
    dlgCompeticao.ShowModal;
  finally
    FreeAndNil(dlgCompeticao);
  end;
end;

procedure TfrmCadCompeticao.actVisualizarParticipanteExecute(
  Sender: TObject);
var
  dlgCompeticao: TfrmDlgCompeticao;
begin
  inherited;
  try
    dlgCompeticao := TfrmDlgCompeticao.Create(self);
    dlgcompeticao.CadCompeticaoDM := FCadCompeticaoDM;
    dlgCompeticao.dbedtNomeEquipePessoa.ReadOnly := True;
    dlgCompeticao.dbedtContatoParticipante.ReadOnly := True;
    dlgCompeticao.dbedtDataEntrega.ReadOnly := True;
    dlgCompeticao.dbchkGanhador.ReadOnly := True;
    dlgCompeticao.dbmmoEntrega.ReadOnly := True;
    dlgCompeticao.btnOk.Visible := False;
    dlgCompeticao.btnCancelar.Caption := 'Fechar';
    dlgCompeticao.ShowModal;
  finally
    FreeAndNil(dlgCompeticao);
  end;
end;

procedure TfrmCadCompeticao.actExcluirParticipanteExecute(Sender: TObject);
begin
  inherited;
  FCadCompeticaoDM.cdsParticipante.Delete;
end;

procedure TfrmCadCompeticao.actEditarParticipanteExecute(Sender: TObject);
var
  dlgCompeticao: TfrmDlgCompeticao;
begin
  inherited;
  FCadCompeticaoDM.cdsParticipante.Edit;
  try
    dlgCompeticao := TfrmDlgCompeticao.Create(self);
    dlgcompeticao.CadCompeticaoDM := FCadCompeticaoDM;
    dlgCompeticao.dbchkGanhador.ReadOnly := True;
    dlgCompeticao.ShowModal;
  finally
    FreeAndNil(dlgCompeticao);
  end;
end;

procedure TfrmCadCompeticao.actInserirParticipanteUpdate(Sender: TObject);
begin
  inherited;
  actInserirParticipante.Enabled := FCadCompeticaoDM.cdsCompeticao.State in [dsEdit, dsInsert];
end;

procedure TfrmCadCompeticao.actEditarParticipanteUpdate(Sender: TObject);
begin
  inherited;
  actEditarParticipante.Enabled := (FCadCompeticaoDM.cdsCompeticao.State in [dsEdit, dsInsert]) and (dxdbgrdParticipante.DataSource.DataSet.RecordCount > 0);
end;

procedure TfrmCadCompeticao.actExcluirParticipanteUpdate(Sender: TObject);
begin
  inherited;
  actExcluirParticipante.Enabled := (FCadCompeticaoDM.cdsCompeticao.State in [dsEdit, dsInsert]) and (dxdbgrdParticipante.DataSource.DataSet.RecordCount > 0);
end;

procedure TfrmCadCompeticao.actVisualizarParticipanteUpdate(
  Sender: TObject);
begin
  inherited;
  actVisualizarParticipante.Enabled := dxdbgrdParticipante.DataSource.DataSet.RecordCount > 0;
end;

procedure TfrmCadCompeticao.actInserirAvaliadorExecute(Sender: TObject);
var
  dlgAvaliador: TfrmDlgAvaliador;
begin
  inherited;
  if not FExecutaIncluir then
  begin
    Application.MessageBox('Usuário não possui permissão de incluir novo avaliador.', 'Atenção', MB_OK);
    Exit;
  end;
  FCadCompeticaoDM.cloneDataSetAvaliadores := TClientDataSet.Create(nil);
  FCadCompeticaoDM.cloneDataSetAvaliadores.Data := FCadCompeticaoDM.cdsAvaliador.Data;
  FCadCompeticaoDM.cdsAvaliador.Insert;
  FCadCompeticaoDM.cdsAvaliadorCODIGOPESSOA.AsInteger := FCadCompeticaoDM.cdsUsuarioAvaliadorCODIGOUSUARIO.AsInteger;
  FCadCompeticaoDM.cdsAvaliadorREALIZASORTEIO.AsBoolean := False;
  FCadCompeticaoDM.cdsAvaliadorPOSSUIDESEMPATE.AsBoolean := False;
  try
    dlgAvaliador := TfrmDlgAvaliador.Create(self);
    dlgAvaliador.CadCompeticaoDM := FCadCompeticaoDM;
    dlgAvaliador.ShowModal;
  finally
    FreeAndNil(dlgAvaliador);
    FCadCompeticaoDM.cloneDataSetAvaliadores.Free;
  end;
end;

procedure TfrmCadCompeticao.actEditarAvaliadorExecute(Sender: TObject);
var
  dlgAvaliador: TfrmDlgAvaliador;
begin
  inherited;
  if not FExecutaIncluir then
  begin
    Application.MessageBox('Usuário não possui permissão de editar um avaliador.', 'Atenção', MB_OK);
    Exit;
  end;
  FCadCompeticaoDM.cdsAvaliador.Edit;
  try
    dlgAvaliador := TfrmDlgAvaliador.Create(self);
    dlgAvaliador.CadCompeticaoDM := FCadCompeticaoDM;
    dlgAvaliador.ShowModal;
  finally
    FreeAndNil(dlgAvaliador);
  end;
end;

procedure TfrmCadCompeticao.actExcluirAvaliadorExecute(Sender: TObject);
begin
  inherited;
  if not FExecutaIncluir then
  begin
    Application.MessageBox('Usuário não possui permissão de excluir um avaliador.', 'Atenção', MB_OK);
    Exit;
  end;
  FCadCompeticaoDM.cdsAvaliador.Delete;
end;

procedure TfrmCadCompeticao.actVisualizarAvaliadorExecute(Sender: TObject);
var
  dlgAvaliador: TfrmDlgAvaliador;
begin
  inherited;
  try
    dlgAvaliador := TfrmDlgAvaliador.Create(self);
    dlgAvaliador.CadCompeticaoDM := FCadCompeticaoDM;
    dlgAvaliador.dblkcbbUsuario.ReadOnly := True;
    dlgAvaliador.dbchkRealizaSorteio.ReadOnly := True;
    dlgAvaliador.dbchkPossuiDesempate.ReadOnly := True;
    dlgAvaliador.btnOk.Visible := False;
    dlgAvaliador.btnCancelar.Caption := 'Fechar';
    dlgAvaliador.ShowModal;
  finally
    FreeAndNil(dlgAvaliador);
  end;
end;

procedure TfrmCadCompeticao.actInserirAvaliadorUpdate(Sender: TObject);
begin
  inherited;
  actInserirAvaliador.Enabled := FCadCompeticaoDM.cdsCompeticao.State in [dsEdit, dsInsert];
end;

procedure TfrmCadCompeticao.actEditarAvaliadorUpdate(Sender: TObject);
begin
  inherited;
  actEditarAvaliador.Enabled := (FCadCompeticaoDM.cdsCompeticao.State in [dsEdit, dsInsert]) and (dxdbgrdAvaliador.DataSource.DataSet.RecordCount > 0);
end;

procedure TfrmCadCompeticao.actExcluirAvaliadorUpdate(Sender: TObject);
begin
  inherited;
   actExcluirAvaliador.Enabled := (FCadCompeticaoDM.cdsCompeticao.State in [dsEdit, dsInsert]) and (dxdbgrdAvaliador.DataSource.DataSet.RecordCount > 0);
end;

procedure TfrmCadCompeticao.actVisualizarAvaliadorUpdate(Sender: TObject);
begin
  inherited;
  actVisualizarAvaliador.Enabled := dxdbgrdAvaliador.DataSource.DataSet.RecordCount > 0;
end;

procedure TfrmCadCompeticao.actExcluirExecute(Sender: TObject);
begin
  if FCadCompeticaoDM.cdsCompeticaoSITUACAO.AsInteger = 2 then
  begin
    raise exception.Create('Você não pode excluir uma competicao que está encerrada.');
  end;
  inherited;

end;

end.
