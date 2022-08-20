{ pkgs, programs, ... }:
let
  volar = {
    name = "vscode-volar";
    publisher = "johnsoncodehk";
    sha256 = "";
    version = "0.29.8";

  };
  extensions = (with pkgs.vscode-extensions; [
    # fontend
    dbaeumer.vscode-eslint
    esbenp.prettier-vscode

    # editor motion
    vscodevim.vim
    formulahendry.auto-rename-tag

    # language
    golang.go
    matklad.rust-analyzer
    ms-python.vscode-pylance
    ms-vscode.cpptools
    jnoortheen.nix-ide

    # theme
    mskelton.one-dark-theme
    zhuangtongfa.material-theme
    pkief.material-icon-theme
  ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    # volar
  ];
in
{
  programs.vscode = {
    enable = true;
    inherit extensions;
  };
}
