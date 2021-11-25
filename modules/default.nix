# 摘取自 https://github.com/bobby285271/nixos-config/blob/master/system/default.nix
# 功能：加载当前目录下的所有配置文件
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