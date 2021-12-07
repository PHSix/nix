{ config, pkgs, ... }:

{
  networking = {
    hostName = "nixos"; # Define your hostname.
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    useDHCP = false;
    interfaces = {
      enp8s0.useDHCP = true;
      wlp9s0.useDHCP = true;
    };
    # proxy = {
    #   httpProxy = "http://127.0.0.1:8889";
    #   httpsProxy = "http://127.0.0.1:8889";
    # };
  };
}


