# 定义了ssh的相关信息
{config, pkgs, ...}:

{
  # 开启ssh
  services = {
    openssh = {
      enable = true;
      permitRootLogin = "yes";
    };
  };
}