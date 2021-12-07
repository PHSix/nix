# copy from https://hub.fastgit.org/bobby285271/nixos-config/blob/master/system/default.nix
{ pkgs, lib, ... }:

let
  folder = ./.;
  toImport = name: value: folder + ("/" + name);
  filterConfig = key: value: value == "regular" && lib.hasSuffix ".nix" key && key != "default.nix";
  imports = lib.mapAttrsToList toImport (lib.filterAttrs filterConfig (builtins.readDir folder));
in
{
  inherit imports;
}
