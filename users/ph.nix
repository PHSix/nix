{ config, pkgs, ... }:

{
  users.users.ph = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      shell = pkgs.fish;
  };
}
