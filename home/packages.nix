{ home, config, pkgs, ... }:
{
  home.packages = (with pkgs; [
    # development environment
    python3Full
    nodejs
    go
    gcc
    gdb
    rustc
    cargo
    gopls
    cmake
    # llvmPackages_13.clang
    clang-tools
    # language server
    sqls
    gopls
    rnix-lsp
    rust-analyzer
    sumneko-lua-language-server

    # cli
    rsync
    netease-music-tui
    starship
    ranger
    fish
    zsh
    lazygit
    nushell
    exa
    bat
    procs
    dust
    tokei
    yarn
    gofumpt

    # app
    google-chrome
    kitty
    wezterm
    flameshot
    tdesktop
    # xfce.xfce4-clipman-plugin

    # window manager
    # rofi
    # feh
    # picom
  ]) ++ (with pkgs.nodePackages; [
    typescript
    pyright
    bash-language-server
    typescript-language-server
    vscode-css-languageserver-bin
    vscode-json-languageserver
    lua-fmt
    prettier
  ]);
}
