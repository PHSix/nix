{ home, config, pkgs, nur, ... }:
{
  home.packages = (with pkgs; [
    # development environment
    dart
    flutter
    gnumake
    python3Full
    nodejs
    go
    gcc
    gdb
    # rustc
    # cargo
    rustup
    gopls
    cmake
    # tomcat9
    # llvmPackages_13.clang
    clang-tools
    # language server
    sqls
    gopls
    rnix-lsp
    rust-analyzer
    sumneko-lua-language-server

    # sql
    sqlite
    mycli

    # editor, ide, etc...
    android-studio
    dbeaver
    postman

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
    python39Packages.pip
    netease-music-tui

    # app
    google-chrome
    kitty
    wezterm
    flameshot
    tdesktop
    emacs
    obs-studio
    
    # embedded development
    openocd
    

    # xfce.xfce4-clipman-plugin

    # window manager
    # rofi
    # feh
    # picom
  ]) ++ (with pkgs.nodePackages; [
    # typescript
    # pyright
    # bash-language-server
    # typescript-language-server
    # vscode-css-languageserver-bin
    # vscode-json-languageserver
    # lua-fmt
    # prettier
  ]) ++ (with pkgs.jetbrains; [
    goland
    webstorm
    pycharm-professional
    idea-ultimate
  ]) ++ (with pkgs.nur; [
    repos.linyinfeng.trojan
    repos.linyinfeng.icalingua
  ]);
}
