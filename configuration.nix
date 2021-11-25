{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;



}