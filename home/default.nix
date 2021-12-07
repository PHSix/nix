{ pkgs, lib, home-manager, ... }:

let
  folder = ./.;
  toImport = name: value: folder + ("/" + name);
  filterConfig = key: value: value == "regular" && lib.hasSuffix ".nix" key && key != "default.nix";
  imports = lib.mapAttrsToList toImport (lib.filterAttrs filterConfig (builtins.readDir folder));
in
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.ph = { pkgs, ... }: {
    inherit imports;
  };
}
