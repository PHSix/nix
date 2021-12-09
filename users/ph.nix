{ config, pkgs, ... }:
{
  users.users.ph = {
      isNormalUser = true;
      extraGroups = [ 
        "wheel" 
        "docker"
        "adbusers"
      ];
      shell = pkgs.fish;
  };
}
