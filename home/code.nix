{ pkgs, programs, ... }:
let
  volar = {
    name = "vscode-volar";
    publisher = "johnsoncodehk";
    sha256 = "";
    version = "0.29.8";

  };
  extensions = (with pkgs.vscode-extensions; [
    vscodevim.vim
    svelte.svelte-vscode
    golang.go
    matklad.rust-analyzer
    mskelton.one-dark-theme
    ms-python.vscode-pylance
    formulahendry.auto-rename-tag
    formulahendry.auto-close-tag
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
