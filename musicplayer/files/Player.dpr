program Player;

uses
  Forms,
  uPlayer in 'uPlayer.pas' {formPlayer},
  uBot in 'uBot.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TformPlayer, formPlayer);
  Application.Run;
end.
