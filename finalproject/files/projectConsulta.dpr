program projectConsulta;

uses
  Forms,
  unitConsulta in 'unitConsulta.pas' {formConsulta},
  unitPedidosItem in 'unitPedidosItem.pas' {formItems},
  unitPedidos in 'unitPedidos.pas' {formPedidos};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TformConsulta, formConsulta);
  Application.Run;
end.
