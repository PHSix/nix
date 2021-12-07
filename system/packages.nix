{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ntfs3g
    p7zip

    # terminal
    alacritty


    # proxy
    qv2ray
    # broswer
    firefox

    # cli tools
    fzf
    neovim
    vim
    wget
    xsel
    tree
    screenfetch
    unrar
    unzip
    git
    duf
    fd
    tmux
    ripgrep
    hyperfine
    pcmanfm
    lxappearance


    # theme
    arc-theme
    dracula-theme
    numix-gtk-theme
    papirus-icon-theme
    flat-remix-gnome
  ];
}
