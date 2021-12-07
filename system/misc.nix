{ config, pkgs, ... }:

{
  services = {
    # power-profiles-daemon.enable = true;
    # tlp.enable = true;
    openssh.enable = true;
    /* gnome-keyring = true; */
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      displayManager.gdm.wayland = false;
      desktopManager.gnome.enable = true;
      windowManager = {
        i3 = {
          enable = true;
          extraPackages = with pkgs; [
            i3status
            i3lock
            i3blocks
          ];
        };
        awesome = {
          enable = true;
        };
      };
      layout = "us";
      xkbOptions = "caps:escape";
    };
  };
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  system = {
    autoUpgrade.enable = true;
    stateVersion = "21.05";
  };
  environment.systemPackages = (with pkgs.gnomeExtensions; [
    cpufreq
    netspeed
    blur-me
    proxy-switcher
    coverflow-alt-tab
    removable-drive-menu
    hide-top-bar
    appindicator
  ]) ++ (with pkgs.gnome; [
    gnome-tweaks
    gnome-boxes
    gnome-screenshot
    gnome-shell-extensions
  ]);
}
