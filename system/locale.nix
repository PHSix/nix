{ config, pkgs, ... }:
let
  nerdfonts = (pkgs.callPackage ../packages/nerdfonts { });
in
{
  i18n = {
    defaultLocale = "zh_CN.UTF-8";
    supportedLocales = [ "zh_CN.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
    inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [ fcitx5-chinese-addons fcitx5-configtool ];
    };

  };
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  time.timeZone = "Asia/Shanghai";

  location = {
    latitude = 23.0;
    longitude = 113.0;
  };

  fonts = {
    enableDefaultFonts = true;
    fontconfig = {
      enable = true;
      hinting = {
        enable = true;
        autohint = false;
        # hintstyle = "hintslight(10px,12px)";
      };
      defaultFonts.emoji = [ "Noto Color Emoji" ];
      defaultFonts.monospace = [ "Hack" "Sarasa Mono SC" ];
      defaultFonts.sansSerif = [ "DejaVu Sans" ];
      defaultFonts.serif = [ "DejaVu Serif" "Source Han Serif SC" ];
    };

    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fonts = (with pkgs; [
      sarasa-gothic
      noto-fonts
      noto-fonts-cjk
      wqy_microhei
      wqy_zenhei
      fira
      fira-code
      # nerdfonts # 图标字体
      symbola # 特殊字符
      jetbrains-mono
      noto-fonts-emoji
      rofi-emoji
      twitter-color-emoji
      unicode-emoji
    ]) ++ [
      nerdfonts
    ];
  };
}
