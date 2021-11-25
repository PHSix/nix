{config, pkgs, ...}:
{
  system = {
    stateVersion = "21.05";
  };
  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
      auto-optimise-store = true
      flake-registry = https://cdn.jsdelivr.net/gh/NixOS/flake-registry/flake-registry.json
    '';
    binaryCaches = [
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://mirrors.ustc.edu.cn/nix-channels/store"
    ];
  };
  nixpkgs.config = {
    allowUnfree = true;
    allowAliases = false;
  };
}