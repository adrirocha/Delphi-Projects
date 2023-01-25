unit dlgCompeticao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, gvFormBase, StdCtrls, Buttons, ExtCtrls, dmdCadCompeticao,
  dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, dxCntner, Mask, DBCtrls, ToolEdit,
  RXDBCtrl;

type
  TfrmDlgCompeticao = class(TgvFrmBase)
    Panel1: TPanel;
    Panel2: TPanel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    lblNomeParticipante: TLabel;
    dbedtNomeEquipePessoa: TDBEdit;
    lblContato: TLabel;
    dbedtContatoParticipante: TDBEdit;
    dbedtDataEntrega: TDBDateEdit;
    lblDataEntrega: TLabel;
    dbmmoEntrega: TDBMemo;
    lblEntrega: TLabel;
    dbchkGanhador: TDBCheckBox;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FCadCompeticaoDM: TdmCadCompeticao;
    { Private declarations }

  public
    property CadCompeticaoDM: TdmCadCompeticao read FCadCompeticaoDM write FCadCompeticaoDM;
  end;

var
  frmDlgCompeticao: TfrmDlgCompeticao;

implementation

{$R *.dfm}


procedure TfrmDlgCompeticao.btnOkClick(Sender: TObject);
begin
    
    if dbedtNomeEquipePessoa.Text = '' then
    begin
      Raise Exception.Create('Você não pode deixar o nome da equipe/pessoa em branco.');
      dbedtNomeEquipePessoa.SetFocus;
    end
    else if dbedtDataEntrega.Date = 0 then
    begin
      Raise Exception.Create('Você tem que preencher a data de entrega.');
      dbedtDataEntrega.SetFocus;
    end
    else if dbmmoEntrega.Text = '' then
    begin
      Raise Exception.Create('Você tem que preencher o campo de entrega.');
      dbmmoentrega.SetFocus;
    end
    else if dbedtContatoParticipante.Text = '' then
    begin
      Raise Exception.Create('Você tem que preencher o contato do participante.');
      dbedtContatoParticipante.SetFocus;
    end
    else if dbedtDataEntrega.Date > Now then
    begin
      Raise Exception.Create('Preencha uma data inferior a data de hoje.');
      dbedtDataEntrega.Setfocus;
    end
    else
    begin
      FCadCompeticaoDM.cdsParticipante.Post;
      ModalResult := mrOk;
    end;
    inherited;
end;

procedure TfrmDlgCompeticao.btnCancelarClick(Sender: TObject);
begin
  inherited;
  FCadCompeticaoDM.cdsParticipante.Cancel;
  ModalResult := mrCancel;
end;

end.
