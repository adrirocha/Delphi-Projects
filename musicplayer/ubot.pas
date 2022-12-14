unit uBot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  Player = class
  public
    state: Boolean;   // Tentativa de observer com o estado sendo notificado se a música está tocando ou não
    playlist: array of string;
    procedure addTrack(faixa: string);
    function play(): Boolean;
    function pause(): Boolean;
    procedure limparLista();
  private
   constructor create;
  end;

implementation

{ Player }

constructor Player.create; // State começa como false porque o som não está tocando
begin
  state := false;
end;

procedure Player.addTrack(faixa: string); // Adicionar música a lista(playlist)
begin
  SetLength(playlist, Length(playlist)+1);
    playlist[High(playlist)] := faixa;
end;

function Player.play(): Boolean;  // O som está tocando então consequentemente o state retorna true
begin
  state:= true;
  result:= state;
end;

function Player.pause():boolean; // O som está pausado então o state está false, pois o som não está tocando
begin
  state:= False;
  result := state;
end;

procedure Player.limparLista;
begin
  SetLength(playlist, 0);
end;

end.
