unit unitPedidosItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin;

type
  TPedidoItem = record
    CodigoProduto: Integer;
    DescricaoProduto: string;
    Quantidade: Extended;
    ValorUnitario: Extended;
    ValorTotal: Extended;
  end;

  TformItems = class(TForm)
    pnlOpcoes: TPanel;
    btnGravar: TButton;
    btnCancelar: TButton;
    lblCodProduto: TLabel;
    edtCodProduto: TEdit;
    lbDescProduto: TLabel;
    edtDescProduto: TEdit;
    lblQtdProduto: TLabel;
    lblValorProduto: TLabel;
    edtValorProduto: TEdit;
    seQtdProduto: TSpinEdit;
    procedure btnGravarClick(Sender: TObject);
    procedure limpaitem();
  private
    { Private declarations }
  public

  end;

var
  item : TPedidoItem;
  formItems: TformItems;

implementation

{$R *.dfm}

procedure TformItems.btnGravarClick(Sender: TObject);
var
  i: Integer;
begin
  with item do                  //Atribuição das propriedades dos itens do pedido
    item.Codigoproduto := strtoint(edtCodProduto.Text);
    item.descricaoproduto := edtDescProduto.text;
    item.quantidade := seqtdproduto.Value;
    item.ValorUnitario := strtofloat(edtValorProduto.Text);
    item.Valortotal := item.valorunitario*item.Quantidade;
    limpaitem();
end;

procedure TformItems.limpaitem;   // Limpar campos de texto do item
begin
  edtCodProduto.Clear;
  edtDescProduto.clear;
  seqtdproduto.value := 1;
  edtValorProduto.clear;
end;



end.
