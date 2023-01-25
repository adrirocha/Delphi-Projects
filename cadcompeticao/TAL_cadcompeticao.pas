library TAL_CadCompeticao;

uses
  ShareMem,
  SysUtils,
  Classes,
  Forms,
  Windows,
  Controls,
  gvAPS,
  gvSQLConnection,
  SQLExpr,
  gvTypes in '..\..\..\..\gvLib\gvTypes.pas',
  gvStrUtils in '..\..\..\..\gvLib\gvStrUtils.pas',
  gvUtils in '..\..\..\..\gvLib\gvUtils.pas',
  gvDBUtils in '..\..\..\..\gvLib\gvDBUtils.pas',
  gvFrameStorage in '..\..\..\..\gvLib\gvFrameStorage.pas',
  gvDigVer in '..\..\..\..\gvLib\gvDigVer.pas',
  gvDBImageUtils in '..\..\..\..\gvLib\gvDBImageUtils.pas',
  DmdDatabase in '..\..\..\Padrao\DmdDatabase.pas' {dmDatabase: TDataModule},
  gvFormBase in '..\..\..\Repos\gvFormBase.pas' {gvFrmBase},
  CadBase in '..\..\..\Repos\CadBase.pas' {frmCadBase},
  ManBase in '..\..\..\Repos\ManBase.pas' {frmManBase},
  Pesquisa in '..\..\..\repos\Pesquisa.pas' {frPesquisa: TFrame},
  gvDllProc in '..\..\..\Repos\gvDllProc.pas',
  CadBaseDllProc in '..\..\..\Repos\CadBaseDllProc.pas',
  DlgBase in '..\..\..\REPOS\DLGBASE.pas' {frmDlgBase},
  CadCompeticao in 'CadCompeticao.pas' {frmCadCompeticao},
  dmdCadCompeticao in 'dmdCadCompeticao.pas' {dmCadCompeticao: TDataModule},
  dlgCompeticao in 'C:\ProjetosGit\gvcollege_oficial\code\desktop\delphi6\gestao\Tal\cadCompeticao\dlgCompeticao.pas' {frmDlgCompeticao},
  dlgAvaliador in 'C:\ProjetosGit\gvcollege_oficial\code\desktop\delphi6\gestao\Tal\cadCompeticao\dlgAvaliador.pas' {frmDlgAvaliador};

{$R *.RES}

procedure DllExecProc(ADllControl: TgvDllControl);
begin
  with TCadBaseDllProc.Create(ADllControl) do
  begin
    DataModuleBase := TdmCadCompeticao.Create(Application);
    FormBase := TfrmCadCompeticao.Create(Application, TdmCadCompeticao (DataModuleBase));
    ShowModal := False;
  end;
end;

procedure FillSubProgramsList(ALst: TStrings);
begin
  TfrmCadCompeticao.FillSubProgramsList(ALst);
end;

exports
  DllExecProc, FillSubProgramsList;

begin
end.
