{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    # nixpkgs.url = "git+https://hub.fastgit.org/nixos/nixpkgs?ref=nixos-unstable";
    # git+https://github.com/NixOS/patchelf?ref=master:
    # nixpkgs-master.url = "github:nixos/nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";

    nixos-cn = {
      url = "github:nixos-cn/flakes";
      # 强制 nixos-cn 和该 flake 使用相同版本的 nixpkgs
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { home-manager, nixpkgs, nixos-cn, nur, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          { nixpkgs.overlays = [ nur.overlay ]; }
          ./hardware-configuration.nix
          ./users/ph.nix
          ./system
          ./home
          home-manager.nixosModules.home-manager
        ];
      };
    };
  };
}

