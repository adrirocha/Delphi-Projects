unit dmdCadCompeticao;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, gvSQLDataSet, DmdDatabase,
  Provider, DBClient, gvTypes, Variants, gvUtils, gvDBUtils, gvDualList,
  gvDBDualList, gvAPS, Dialogs;

type
  TdmCadCompeticao = class(TDataModule)
    sdsCompeticao: TgvSQLDataSet;
    dspCompeticao: TDataSetProvider;
    cdsCompeticao: TClientDataSet;
    dsCompeticao: TDataSource;
    sdsEmpresaLK: TgvSQLDataSet;
    dspEmpresaLK: TDataSetProvider;
    cdsEmpresaLK: TClientDataSet;
    dsEmpresaLK: TDataSource;
    sdsEmpresaLKNOME: TStringField;
    sdsEmpresaLKCODIGOEMPRESA: TIntegerField;
    cdsEmpresaLKNOME: TStringField;
    cdsEmpresaLKCODIGOEMPRESA: TIntegerField;
    sdsUnidade: TgvSQLDataSet;
    dspUnidade: TDataSetProvider;
    cdsUnidade: TClientDataSet;
    dsUnidade: TDataSource;
    sdsParticipante: TgvSQLDataSet;
    cdsParticipante: TClientDataSet;
    dsParticipante: TDataSource;
    sdsAvaliador: TgvSQLDataSet;
    cdsAvaliador: TClientDataSet;
    dsAvaliador: TDataSource;
    sdsUsuarioAvaliador: TgvSQLDataSet;
    dspUsuarioAvaliador: TDataSetProvider;
    cdsUsuarioAvaliador: TClientDataSet;
    dsUsuarioAvaliador: TDataSource;
    sdsParticipanteCODIGOPARTICIPANTE: TIntegerField;
    sdsParticipanteCODIGOCOMPETICAO: TIntegerField;
    sdsParticipanteCONTATO: TStringField;
    sdsParticipanteNOME: TStringField;
    sdsParticipanteENTREGA: TStringField;
    sdsParticipanteGANHADOR: TBooleanField;
    sdsParticipanteDATAENTREGA: TSQLTimeStampField;
    sdsParticipanteDATAATUALIZACAO: TSQLTimeStampField;
    sdsParticipanteCODIGOUSUARIO: TIntegerField;
    cdsParticipanteCODIGOPARTICIPANTE: TIntegerField;
    cdsParticipanteCODIGOCOMPETICAO: TIntegerField;
    cdsParticipanteCONTATO: TStringField;
    cdsParticipanteNOME: TStringField;
    cdsParticipanteENTREGA: TStringField;
    cdsParticipanteGANHADOR: TBooleanField;
    cdsParticipanteDATAENTREGA: TSQLTimeStampField;
    cdsParticipanteDATAATUALIZACAO: TSQLTimeStampField;
    cdsParticipanteCODIGOUSUARIO: TIntegerField;
    sdsUnidadeNOME: TStringField;
    sdsUnidadeCODIGOUNIDADE: TIntegerField;
    cdsUnidadeNOME: TStringField;
    cdsUnidadeCODIGOUNIDADE: TIntegerField;
    sdsUsuarioAvaliadorNOME: TStringField;
    sdsUsuarioAvaliadorCODIGOUSUARIO: TIntegerField;
    cdsUsuarioAvaliadorNOME: TStringField;
    cdsUsuarioAvaliadorCODIGOUSUARIO: TIntegerField;
    dsCompeticaoMestre: TDataSource;
    cdsCompeticaosdsParticipante: TDataSetField;
    cdsCompeticaosdsAvaliador: TDataSetField;
    sdsAvaliadorCODIGOAVALIADOR: TIntegerField;
    sdsAvaliadorDATAATUALIZACAO: TSQLTimeStampField;
    sdsAvaliadorREALIZASORTEIO: TBooleanField;
    sdsAvaliadorPOSSUIDESEMPATE: TBooleanField;
    sdsAvaliadorCODIGOUSUARIO: TIntegerField;
    sdsAvaliadorCODIGOPESSOA: TIntegerField;
    sdsAvaliadorCODIGOCOMPETICAO: TIntegerField;
    sdsAvaliadorNOME: TStringField;
    cdsAvaliadorCODIGOAVALIADOR: TIntegerField;
    cdsAvaliadorDATAATUALIZACAO: TSQLTimeStampField;
    cdsAvaliadorREALIZASORTEIO: TBooleanField;
    cdsAvaliadorPOSSUIDESEMPATE: TBooleanField;
    cdsAvaliadorCODIGOUSUARIO: TIntegerField;
    cdsAvaliadorCODIGOPESSOA: TIntegerField;
    cdsAvaliadorCODIGOCOMPETICAO: TIntegerField;
    cdsAvaliadorNOME: TStringField;
    sdsCompeticaoNOMEEMPRESA: TStringField;
    sdsCompeticaoNOMEUNIDADE: TStringField;
    sdsCompeticaoCODIGOCOMPETICAO: TIntegerField;
    sdsCompeticaoDATAATUALIZACAO: TSQLTimeStampField;
    sdsCompeticaoCODIGOUSUARIO: TIntegerField;
    sdsCompeticaoUNIDADE: TIntegerField;
    sdsCompeticaoEMPRESA: TIntegerField;
    sdsCompeticaoDESCRICAOCOMPETICAO: TStringField;
    sdsCompeticaoTIPOCOMPETICAO: TIntegerField;
    sdsCompeticaoDATASORTEIO: TSQLTimeStampField;
    sdsCompeticaoDATAVOTACAO: TSQLTimeStampField;
    sdsCompeticaoSITUACAO: TIntegerField;
    sdsCompeticaoNUMEROGANHADORES: TIntegerField;
    cdsCompeticaoNOMEEMPRESA: TStringField;
    cdsCompeticaoNOMEUNIDADE: TStringField;
    cdsCompeticaoCODIGOCOMPETICAO: TIntegerField;
    cdsCompeticaoDATAATUALIZACAO: TSQLTimeStampField;
    cdsCompeticaoCODIGOUSUARIO: TIntegerField;
    cdsCompeticaoUNIDADE: TIntegerField;
    cdsCompeticaoEMPRESA: TIntegerField;
    cdsCompeticaoDESCRICAOCOMPETICAO: TStringField;
    cdsCompeticaoTIPOCOMPETICAO: TIntegerField;
    cdsCompeticaoDATASORTEIO: TSQLTimeStampField;
    cdsCompeticaoDATAVOTACAO: TSQLTimeStampField;
    cdsCompeticaoSITUACAO: TIntegerField;
    cdsCompeticaoNUMEROGANHADORES: TIntegerField;
    procedure cdsCompeticaoPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure dspCompeticaoUpdateError(Sender: TObject; DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsCompeticaoAfterInsert(DataSet: TDataSet);
    procedure cdsCompeticaoBeforePost(DataSet: TDataSet);
    procedure cdsParticipanteAfterInsert(DataSet: TDataSet);
    procedure cdsAvaliadorAfterInsert(DataSet: TDataSet);
    procedure cdsAvaliadorBeforePost(DataSet: TDataSet);
    procedure cdsParticipanteBeforePost(DataSet: TDataSet);
    procedure cdsCompeticaoBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    FOriginalCommandText: string;
    FAcoAPS: TgvAPSConnection;     
    FEstado: TgvCadState;
    FcloneDatasetAvaliadores: TClientDataSet;
  public
    { Public declarations }
    property cloneDataSetAvaliadores: TClientDataSet read FcloneDatasetAvaliadores write FcloneDatasetAvaliadores;
    property AcoAPS: TgvAPSConnection read FacoAPS write FacoAPS;
    property OriginalCommandText: string read FOriginalCommandText write FOriginalCommandText;
    property Estado: TgvCadState read FEstado write FEstado;
    procedure AutoEditar(AAutoEdit: Boolean);
    procedure ExecutarConsulta(SQL:string);
    procedure FecharConsulta;
    procedure IncluirRegistro;
    procedure EditarRegistro;
    procedure CancelarRegistro;
    procedure GravarRegistro;
    procedure ExcluirRegistro;
    function LocalizarRegistro(ALocalizar: Boolean; ACodigoID: Integer = 0): Boolean;
    function CodigoID: Variant;
    procedure ValidarCadastro;
    procedure validaJaExisteAvaliador(codigopessoa, codigocompeticao: Integer);
  end;

var
  dmCadCompeticao: TdmCadCompeticao;

implementation

{$R *.dfm}

{ TdmCadCompeticao }

procedure TdmCadCompeticao.AutoEditar(AAutoEdit: Boolean);
begin
  dsCompeticao.AutoEdit := AAutoEdit;
end;

procedure TdmCadCompeticao.CancelarRegistro;
var
  iPKey: Integer;
begin
  iPKey := 0;
  if Estado = csEdit then
    iPKey := cdsCompeticaoCODIGOCOMPETICAO.AsInteger;

  if cdsCompeticao.Active then
  begin
    cdsCompeticao.Cancel;
    cdsCompeticao.CancelUpdates;
  end;
  AutoEditar(False);

  if (Estado = csEdit) and
    (cdsCompeticaoCODIGOCOMPETICAO.AsInteger <> iPKey) then
    cdsCompeticao.Locate('CODIGOCOMPETICAO', iPKey, []);
end;

function TdmCadCompeticao.CodigoID: Variant;
begin
  if cdsCompeticao.IsEmpty then
    Result := Null
  else
    Result := cdsCompeticaoCODIGOCOMPETICAO.AsInteger;
end;

procedure TdmCadCompeticao.EditarRegistro;
begin
  cdsCompeticao.Edit;
  AutoEditar(True);
end;

procedure TdmCadCompeticao.ExcluirRegistro;
begin
  cdsCompeticao.Delete;
  if (cdsCompeticao.ChangeCount > 0) and
    (cdsCompeticao.ApplyUpdates(0) > 0) then
    Abort;
end;

procedure TdmCadCompeticao.ExecutarConsulta(SQL: string);
begin
  cdsCompeticao.Close;
  sdsCompeticao.CommandText := SQL;
  cdsCompeticao.Open;
end;

procedure TdmCadCompeticao.FecharConsulta;
begin
  cdsCompeticao.Close;
end;

procedure TdmCadCompeticao.GravarRegistro;
begin
  AutoEditar(False);

  if cdsCompeticao.State in [dsEdit, dsInsert] then
    cdsCompeticao.Post;

  if (cdsCompeticao.ChangeCount > 0) and
    (cdsCompeticao.ApplyUpdates(0) > 0) then
    Abort;
end;

procedure TdmCadCompeticao.IncluirRegistro;
begin
  AutoEditar(True);
  LocalizarRegistro(False);
  cdsCompeticao.Insert;
end;

function TdmCadCompeticao.LocalizarRegistro(
  ALocalizar: Boolean; ACodigoID: Integer): Boolean;
begin
  if ALocalizar = False then
    ACodigoID := 0;

  if not cdsCompeticao.Active then
    ExecutarConsulta(
      OriginalCommandText + IIf(Pos('WHERE', OriginalCommandText) = 0,' WHERE ', ' AND ') + ' CODIGOCOMPETICAO = ' + IntToStr(ACodigoID));

  Result := not cdsCompeticao.IsEmpty;
end;

procedure TdmCadCompeticao.cdsCompeticaoPostError(
  DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  VerificaErroDB(E);
  Action := daAbort;
end;

procedure TdmCadCompeticao.dspCompeticaoUpdateError(
  Sender: TObject; DataSet: TCustomClientDataSet; E: EUpdateError;
  UpdateKind: TUpdateKind; var Response: TResolverResponse);
begin
  VerificaErroDB(UpdateKind, E, ['']);
end;

procedure TdmCadCompeticao.DataModuleCreate(
  Sender: TObject);
begin
  OriginalCommandText := sdsCompeticao.CommandText;
  AutoEditar(False);
end;

procedure TdmCadCompeticao.cdsCompeticaoAfterInsert(
  DataSet: TDataSet);
begin
  cdsCompeticaoCODIGOCOMPETICAO.AsInteger := dmDatabase.ProximoRegistroTabela('TAL_COMPETICAO');
end;

procedure TdmCadCompeticao.ValidarCadastro;
var
  sMensagem: String;
  bErro: Boolean;

  procedure RegistraErro(AMensagem: String);
  begin
    sMensagem := sMensagem + #13 + '  - ' + AMensagem;
    bErro := True;
  end;
begin
  bErro := False;
  sMensagem := 'Os seguintes campos são de preenchimento obrigatório:'  + #13;

  {Exemplo:
    if cdsPrincipalDescricao.AsString = EmptyStr then
      RegistraErro('Descrição');
  }

  if bErro then
    raise Exception.Create(sMensagem);
end;

procedure TdmCadCompeticao.cdsCompeticaoBeforePost(
  DataSet: TDataSet);
begin
  cdsCompeticaoCODIGOUSUARIO.AsInteger := dmDatabase.CodigoUsuario;
  cdsCompeticaoDATAATUALIZACAO.AsDateTime := dmDatabase.ServerDateTime;
end;

procedure TdmCadCompeticao.cdsParticipanteAfterInsert(DataSet: TDataSet);
begin
   cdsParticipanteCODIGOPARTICIPANTE.AsInteger := dmDatabase.ProximoRegistroTabela('TAL_COMPETICAOPARTICIPANTE');
end;

procedure TdmCadCompeticao.cdsAvaliadorAfterInsert(DataSet: TDataSet);
begin
  cdsAvaliadorCODIGOAVALIADOR.AsInteger := dmDatabase.ProximoRegistroTabela('TAL_COMPETICAOAVALIADOR');
end;

procedure TdmCadCompeticao.cdsAvaliadorBeforePost(DataSet: TDataSet);
begin

  cdsAvaliadorCODIGOUSUARIO.AsInteger := dmDatabase.CodigoUsuario;
  cdsAvaliadorDATAATUALIZACAO.AsDateTime := dmDatabase.ServerDateTime;
end;

procedure TdmCadCompeticao.cdsParticipanteBeforePost(DataSet: TDataSet);
begin
  cdsParticipanteCODIGOUSUARIO.AsInteger := dmDatabase.CodigoUsuario;
  cdsParticipanteDATAATUALIZACAO.AsDateTime := dmDatabase.ServerDateTime;
end;

procedure TdmCadCompeticao.cdsCompeticaoBeforeDelete(DataSet: TDataSet);
begin
  cdsParticipante.First;
  while not cdsParticipante.Eof do
  begin
    cdsParticipante.Delete;
  end;
  cdsAvaliador.First;
  while not cdsAvaliador.Eof do
  begin
    cdsAvaliador.Delete;
  end;
end;



procedure TdmCadCompeticao.validaJaExisteAvaliador(codigopessoa, codigocompeticao: Integer);
begin
  {if cloneDataSetAvaliadores.RecordCount = 0 then
  begin
    Exit;
  end;  }
  if cloneDataSetAvaliadores.Locate('CODIGOPESSOA;CODIGOCOMPETICAO', VarArrayof([codigopessoa, codigocompeticao]), []) then
  begin
    raise Exception.Create('Avaliador já cadastrado.');
  end;
end;

end.
