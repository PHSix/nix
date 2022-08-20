{ config, pkgs, nur, ... }:

{
  environment.systemPackages = (with pkgs; [
    # dependences
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
    vim
    neovim
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
    lf

    # system
    pcmanfm

    # theme
    lxappearance
    arc-theme
    dracula-theme
    numix-gtk-theme
    papirus-icon-theme
    flat-remix-gnome

    # app
    google-chrome
    kitty
    wezterm
    flameshot
    tdesktop
    emacs
    obs-studio

    # window manager
    rofi
    feh
    picom
  ]) ++ (with nur; [
    # proxy tool
    repos.linyinfeng.clash-for-windows
  ]);
}
