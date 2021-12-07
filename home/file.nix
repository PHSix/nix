{ home, pkgs, ... }:
let
  zhwiki = (pkgs.callPackage ../packages/fcitx5/zhwiki.nix { });
in
{
  home.file = {
    # "awesome" = {
    #   source = ../dot/awesome;
    #   target = "./.config/awesome";
    # };
    # "kitty" = {
    #   source = ../dot/kitty.conf;
    #   target = "./.config/kitty/kitty.conf";
    # };
    # "tmux" = {
    #   source = ../dot/tmux.conf;
    #   target = "./.tmux.conf";
    # };
    # "fish" = {
    #   source = ../dot/fish/config.fish;
    #   target = "./.config/fish/config.fish";
    # };
    "zhwiki" = {
      source = "${zhwiki}/${zhwiki.fileName}";
      target = "./.local/share/fcitx5/pinyin/dictionaries/${zhwiki.fileName}";
    };
  };
}
