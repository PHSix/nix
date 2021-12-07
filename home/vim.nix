{ programs,pkgs, ... }:
{
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
    ];
    settings = { ignorecase = true; };
    extraConfig = ''
      set mouse=a
      set tabstop=2
      set shiftwidth=2
      set softtabstop=2
      syntax on
    '';
  };
}
