unit unitConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unitPedidos, unitPedidosItem, StdCtrls, ExtCtrls,Mask, Masks, MaskUtils;

type
  TformConsulta = class(TForm)
    lstPedidos: TListBox;
    pnlOpcoes: TPanel;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    function validaStatus(status: Boolean): string;
    procedure btnAlterarClick(Sender: TObject);
    function mudarPedido(): string;
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formConsulta: TformConsulta;
  formPedidos: TformPedidos;
  formItens: TformItems;

implementation

{$R *.dfm}

procedure TformConsulta.FormCreate(Sender: TObject);  // Criação dos forms das units do programa
begin
  formPedidos :=  TformPedidos.create(self);
  formItens := TformItems.Create(self);
  formPedidos.Show;
  formitens.Show;
end;

procedure TformConsulta.btnIncluirClick(Sender: TObject); // Incluir pedido na listbox
var
  status: String;
  vtformatado: string;
begin
  vtformatado :=  FormatFloat(',0.00', pedido.ValorTotal);
  status := validaStatus(pedido.Pago);
  lstPedidos.Items.Add('Código: '+inttostr(pedido.Codigo)+' Data de emissão: ' +DateToStr(pedido.DataEmissao)+' Nome do cliente: '+ pedido.NomeCliente+ ' Telefone: '+pedido.TelefoneCliente + ' Valor total: R$'+vtformatado+ ' Situação: '+ pedido.Situacao + ' Status do pagamento: '+status+ ' Observações: '+pedido.observacoes);
end;

function TformConsulta.validaStatus(status: Boolean): string;  // Tratamento da atribuição do status
var
  resultado: string;
begin
  if status = True then
  begin
    resultado:= 'Pago';
  end
  else if status = False then
  begin
    resultado:= 'Não pago';
  end;
  result := resultado;

end;

procedure TformConsulta.btnAlterarClick(Sender: TObject);   // Alterar o pedido selecionado
var
  selecionado: string;
begin
  selecionado := mudarPedido();
  lstPedidos.Items.add(selecionado);
  lstpedidos.DeleteSelected;

end;

function tformconsulta.mudarPedido: string; // Função idêntica a que é usada na unitPedidos para alterar pedidos
var                                         // Tratando o código do pedido para não haver erro
  cod: Integer;
  d, m, a: string;
  data: TDateTime;
  nome: string;
  x, telefone: string;
  situacao: string;
  pago: string;
  observacoes: string;
  valortotal: Real;
  vtformatado: string;


begin
  valortotal := StrToFloat(InputBox('Valor total','Digite o valor total do produto que quer alterar: ',''));
  vtformatado :=  FormatFloat(',0.00', ValorTotal);
  cod := StrToInt(InputBox('Código','Digite o código do pedido: ',''));
  d := InputBox('Alterar dia','Digite o dia da emissão do pedido: ','');
  m := InputBox('Alterar mês','Digite o mês da emissão do pedido: ','');
  a := InputBox('Alterar ano','Digite o ano da emissão do pedido: ','');
  data:= strToDateTime(d + '/' + m + '/' + a);
  nome :=  InputBox('Alterar nome','Digite o nome do cliente: ','');
  x := InputBox('Alterar telefone','Digite o telefone do cliente:','');
  telefone:= FormatMaskText('\(99\)9999\-9999;0;', x);
  if Length(Telefone) <> 14 then
    begin
      raise Exception.Create('Insira um número de telefone válido.');
    end;
  situacao := InputBox('Alterar situação','Digite a situação do pedido:','Em aberto, Entregue ou Cancelado');
  pago := InputBox('Alterar status do pagamento','O pedido foi pago?','Sim ou não');
  observacoes := inputbox('Alterar observações','Digite as observações','');
  Result := 'Código: '+inttostr(cod)+' Data de emissão: ' +DateToStr(data)+' Nome do cliente: '+ nome+ ' Telefone: '+telefone  +' Valor total: R$'+vtformatado+ ' Situação: '+ situacao + ' Status do pagamento: '+pago+ ' Observações: '+observacoes;

end;

procedure TformConsulta.btnExcluirClick(Sender: TObject); // Excluir o pedido selecionado
begin
  lstpedidos.DeleteSelected;
  pedido.Codigo := pedido.Codigo -1;
end;

end.
