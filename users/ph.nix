{ config, pkgs, ... }:
{
  users.users.ph = {
      isNormalUser = true;
      extraGroups = [ 
        "wheel" 
        "docker"
        "adbusers"
        "mysql"
      ];
      shell = pkgs.fish;
  };
}
