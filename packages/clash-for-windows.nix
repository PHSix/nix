let
  version = "0.18.10";
  sha256 = "21ee2280e068d138087f075ed0d86170bbd8122484388f3f5551e7a86ee2e963";
in
with (import <nixpkgs> {});
derivation {
  name = "Clash-For-Windows";
  builder = "${bash}/bin/bash";
  args = [ ./clash.sh ];
  buildInputs = [gnutar gzip];
  src = fetchurl {
    url = "https://github.com/Fndroid/clash_for_windows_pkg/releases/download/${version}/Clash.for.Windows-0.18.10-x64-linux.tar.gz";
    inherit sha256;
  };
  system = builtins.currentSystem;
}

