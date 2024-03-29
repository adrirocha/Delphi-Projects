unit uPlayer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uBot, ExtCtrls;

type
  TformPlayer = class(TForm)
    grpOpcoes: TGroupBox;
    btnPlay: TButton;
    btnPause: TButton;
    btnNext: TButton;
    btnPrev: TButton;
    lbMusica: TLabel;
    lblTitulo: TLabel;
    lbContador: TLabel;
    lbPlaylist: TListBox;
    btnMostrarLista: TButton;
    btnAdicionarFaixa: TButton;
    btnExit: TButton;
    tmrContador: TTimer;
    btnClear: TButton;
    btnCriarInstancia: TButton;
    procedure btnMostrarListaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionarFaixaClick(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure tmrContadorTimer(Sender: TObject);
    procedure btnPauseClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPrevClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnCriarInstanciaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPlayer: TformPlayer;
  Singleton: Player;
  cont: Integer;
  musica : string;
  status: Boolean;


implementation

{$R *.dfm}

procedure TformPlayer.FormCreate(Sender: TObject);
begin
  status:= False;
  cont:= 0;
  tmrContador.Enabled := false;
end;

procedure TformPlayer.btnMostrarListaClick(Sender: TObject);
var
  i: Integer;
begin
  lbPlaylist.Clear;
  for i:= low(Singleton.playlist) to high(singleton.playlist) do
    lbPlaylist.Items.Add(Singleton.playlist[i]); 
end;


procedure TformPlayer.btnAdicionarFaixaClick(Sender: TObject);
var
  faixa: string;
begin
  faixa := InputBox('Adicionar m�sica','Digite o nome da faixa:','');
  if faixa = EmptyStr then
  begin
    raise Exception.Create('Voc� n�o pode adicionar uma faixa sem nome');
  end
  else
    singleton.addTrack(faixa);
  end;


procedure TformPlayer.btnPlayClick(Sender: TObject);
begin
  if lbPlaylist.Count = 0 then
  begin
    raise Exception.Create('A playlist est� vazia.');
  end
  else
  begin
  singleton.play();
  musica := lbplaylist.items[(lbplaylist.itemindex)];
  lbmusica.Caption:= musica;
  tmrContador.Enabled := true;
  end;
end;




procedure TformPlayer.tmrContadorTimer(Sender: TObject); //O Timer pode ser considerado talvez um observer, pois ele tem mudan�as de estado expl�citas no c�digo: True e false
begin
  cont := cont + 1;
  lbcontador.caption := inttostr(cont);

  if cont = 10 then
  begin
    tmrcontador.enabled := false;
    cont := 0;
  end;

end;

procedure TformPlayer.btnPauseClick(Sender: TObject);
begin
  tmrContador.Enabled := False;
end;

procedure TformPlayer.btnNextClick(Sender: TObject);
begin
  cont := 0;
  musica := lbplaylist.items[(lbplaylist.itemindex)+ 1];
  tmrcontador.Enabled := True;
  lbplaylist.itemindex := lbplaylist.itemindex+1;
  lbMusica.caption := musica;

end;


procedure TformPlayer.btnPrevClick(Sender: TObject);
begin
  cont := 0;
  musica := lbplaylist.items[(lbplaylist.itemindex) -1];
  tmrcontador.Enabled := True;
  lbplaylist.itemindex := lbplaylist.itemindex-1;
  lbMusica.caption := musica;
end;

procedure TformPlayer.btnClearClick(Sender: TObject);
begin
  singleton.limparLista();
  lbPlaylist.Items.Clear;
  lbMusica.caption := EmptyStr;
  cont := 0;
  tmrContador.enabled := False;
end;

procedure TformPlayer.btnExitClick(Sender: TObject);
begin
  formPlayer.Close;

end;

procedure TformPlayer.btnCriarInstanciaClick(Sender: TObject);  // Implementa��o do singleton
begin
  if status = False then
  begin
    singleton:= player.create;
    status := true;
  end
  else if status = True then
  begin
    raise Exception.Create('Voc� j� gerou uma inst�ncia.');
  end;
end;

end.
