unit unitPedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unitPedidosItem, StdCtrls, ExtCtrls, Mask, Masks, MaskUtils;

type
  TPedido = record
    Codigo: Integer;
    DataEmissao: TDateTime;
    NomeCliente: string;
    TelefoneCliente: string;
    ValorTotal: Extended;
    Situacao: string;
    Observacoes: string;
    Pago: Boolean;
    Itens: array of TPedidoItem;
  end;

  TformPedidos = class(TForm)
    pnlOpcoes: TPanel;
    btnGravar: TButton;
    btnCancelar: TButton;
    lstPedidos: TListBox;
    grpDataEmissao: TGroupBox;
    lblDia: TLabel;
    edtDia: TEdit;
    lblMes: TLabel;
    edtMes: TEdit;
    lblAno: TLabel;
    edtAno: TEdit;
    lblNomeCliente: TLabel;
    edtNomeCliente: TEdit;
    lblTelefoneCliente: TLabel;
    edtTelefoneCliente: TEdit;
    lblObservacoes: TLabel;
    edtObservacoes: TEdit;
    pnlOpcoesItens: TPanel;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    rgSituacao: TRadioGroup;
    lblItens: TLabel;
    grpStatusPagamento: TGroupBox;
    chkSim: TCheckBox;
    chkNao: TCheckBox;
    procedure btnGravarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure rgSituacaoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    function mudarItem() : string;
    procedure limpaPedido();
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  formPedidos: TformPedidos;
  escolha: string;
  pedido : TPedido;
  cont: real;

implementation

{$R *.dfm}

procedure TformPedidos.btnGravarClick(Sender: TObject);
var
  telefone: string;
  itens: TPedidoItem;
  status: Boolean;
begin
  if lstpedidos.items.count = 0 then
  begin
    raise Exception.create('N�o � possivel cadastrar pedidos sem item');
  end;
  with pedido do             // Atribui��o das propriedades do pedido e valida��o de todas propriedades do pedido
  begin
  try
    if (edtNomeCliente.Text = EmptyStr) or (edtTelefoneCliente.Text = EmptyStr) then
    begin
      raise Exception.Create('Insira o nome e o telefone do cliente.');
    end;
    pedido.Codigo := pedido.Codigo + 1;      // Incremento do c�digo que � gerado automaticamente pelo sistema diferentemente do c�digo do item
    pedido.DataEmissao:= StrToDateTime(edtDia.text + '/' + edtMes.Text + '/' + edtAno.Text);
    pedido.NomeCliente:= edtNomeCliente.Text;
    telefone := edtTelefoneCliente.text;
    pedido.TelefoneCliente:= FormatMaskText('\(99\)9999\-9999;0;', telefone);
    if Length(pedido.TelefoneCliente) <> 14 then
    begin
      raise Exception.Create('Insira um n�mero de telefone v�lido.');
    end;
    pedido.Situacao := escolha;
    if pedido.situacao = emptystr then
    begin
      raise Exception.Create('Selecione a situa��o do pedido.');
    end;
    if chkNao.Checked and chkSim.Checked then  // Setando Checkbox da propriedade do status do pagamento
    begin
      raise Exception.Create('Selecione apenas um status de pagamento.');  // Tratamento de erro
    end
    else if chkSim.Checked and not chknao.Checked then
    begin
      status := True;
    end
    else if not chkSim.Checked and chkNao.checked then
    begin
      status := False ;
    end
    else if not chksim.checked and not chknao.checked then
    begin
      raise Exception.Create('Selecione a op��o do status do pagamento.');
    end;
    pedido.Pago := status;
    pedido.Observacoes := edtObservacoes.text;
    pedido.ValorTotal := cont;
    pedido.Observacoes := edtObservacoes.text;
    limpaPedido();


  except
    raise Exception.Create('Erro ao cadastrar pedido.');    // Tratando erro no pedido
    end;

    end;
end;







procedure TformPedidos.btnIncluirClick(Sender: TObject);  // Incluir item que foi gravado por �ltimo na unit PedidosItem
var
  vtformatado: string;
begin
  with pedido do
  begin
    vtformatado :=  FormatFloat(',0.00', item.ValorTotal);
    lstPedidos.Items.Add('C�digo: '+inttostr(item.codigoproduto) + ' Descri��o: '+item.DescricaoProduto
    + ' Valor unit�rio: '+floattostr(item.ValorUnitario)+ ' Quantidade: '+floattostr(item.Quantidade) + ' Valor total: R$'+vtformatado);
  end;
  cont:= cont + item.valortotal;
end;

procedure TformPedidos.rgSituacaoClick(Sender: TObject); // Setando radiobuttons da propriedade Situa��o do pedido
begin
  case rgSituacao.ItemIndex of
    0: escolha:= 'Em aberto';
    1: escolha:= 'Entregue';
    2: escolha:= 'Cancelado';
  end;

end;

procedure TformPedidos.btnAlterarClick(Sender: TObject);  // Altera��o de um item selecionado do pedido usando uma fun��o
var
  selecionado: string;
begin
  selecionado := mudarItem();
  lstPedidos.Items.add(selecionado);
  lstpedidos.DeleteSelected;
end;

procedure TformPedidos.btnExcluirClick(Sender: TObject);  //Procedimento para excluir O Item selecionado do pedido retirando o valor total do mesmo
var
  valorTotalExcluido: real;

begin
  valortotalexcluido := strtofloat(InputBox('Valor total','Digite o valor total do item que voc� est� excluindo:',''));
  lstpedidos.DeleteSelected;
  cont:= cont - valortotalexcluido;
end;

function TformPedidos.mudarItem: string;    // Fun��o para alterar item garantindo que o valor total mude corretamente
var
  cod, qtd, i: integer;
  descricao: string;
  valoruni, valorfinal: real;
  antigototal: real;
  vtformatado: string;
begin
  try
    antigototal := StrToFloat(InputBox('Valor total','Digite o valor total do item que voc� est� alterando:',''));
    descricao := InputBox('Alterar descri��o','Digite a nova descri��o:','');
    valoruni := StrToFloat(InputBox('Alterar valor unit�rio','Digite o novo valor unit�rio:',''));
    qtd := StrToInt(InputBox('Alterar quantidade','Digite a nova quantidade do produto:',''));
    valorfinal := valoruni*qtd;
    cont := cont + valorfinal;
    cont := cont - antigototal;
    vtformatado :=  FormatFloat(',0.00', valorfinal);
    Result:='C�digo: '+ IntToStr(cod) + ' Descri��o: '+ descricao + ' Valor unit�rio: '
    + floattostr(valoruni) + ' Quantidade: ' +inttostr(qtd) + ' Valor total: R$' +vtformatado;
  except
    raise Exception.Create('Erro ao alterar o item selecionado.');
  end;

end;

procedure TformPedidos.limpaPedido;   // Limpar campos de texto do pedido
begin
  edtDia.Clear;
  edtMes.Clear;
  edtAno.Clear;
  edtTelefoneCliente.Clear;
  edtNomeCliente.Clear;
  edtObservacoes.Clear;
  chkSim.Checked := false;
  chkNao.checked := false;
  lstpedidos.Items.Clear;
  rgSituacao.ItemIndex := -1;
  cont := 0;

end;

procedure TformPedidos.btnCancelarClick(Sender: TObject);
begin
  limpaPedido();
end;

end.
