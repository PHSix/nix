{
  pkgs, config, ...
}:
{
  programs.java = {
    enable = true;
    package = pkgs.jdk11;
  };
}
