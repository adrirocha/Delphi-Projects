unit dlgAvaliador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, gvFormBase, StdCtrls, Buttons, ExtCtrls, dmdCadCompeticao,
  DBCtrls, DB;

type
  TfrmDlgAvaliador = class(TgvFrmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    lblUsuario: TLabel;
    dblkcbbUsuario: TDBLookupComboBox;
    dbchkRealizaSorteio: TDBCheckBox;
    dbchkPossuiDesempate: TDBCheckBox;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FCadCompeticaoDM: TdmCadCompeticao;
  public
    property CadCompeticaoDM: TdmCadCompeticao read FCadCompeticaoDM write FCadCompeticaoDM;
  end;

var
  frmDlgAvaliador: TfrmDlgAvaliador;

implementation

{$R *.dfm}

procedure TfrmDlgAvaliador.btnOkClick(Sender: TObject);
begin
  if dblkcbbUsuario.Text = '' then
  begin
    Raise Exception.Create('Você tem que selecionar um usuário.');
    dblkcbbUsuario.SetFocus;
  end
  else
  begin
    FCadCompeticaoDM.validaJaExisteAvaliador(dblkcbbUsuario.KeyValue, FCadCompeticaoDM.cdsAvaliadorCODIGOCOMPETICAO.AsInteger);
    FCadCompeticaoDM.cdsAvaliadorNOME.AsString := dblkcbbUsuario.Text;
    FCadCompeticaoDM.cdsAvaliador.Post;
    ModalResult := mrOk;
  end;
  inherited;
end;

procedure TfrmDlgAvaliador.btnCancelarClick(Sender: TObject);
begin
  inherited;
  FCadCompeticaoDM.cdsAvaliador.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmDlgAvaliador.FormShow(Sender: TObject);
begin
  inherited;
  dblkcbbUsuario.Enabled := FCadCompeticaoDM.cdsAvaliador.State = dsInsert;
end;

end.
