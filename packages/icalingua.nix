{ pkgs ? import <nixpkgs> { } }:
pkgs.appimageTools.wrapType2 {
  name = "Icalingua";
  src = pkgs.fetchurl {
    url = "https://github.91chi.fun//https://github.com//Icalingua/Icalingua/releases/download/v2.4.5/Icalingua-2.4.5.AppImage";
    sha256 = "0ac6e4d7a1106bb814e42bde64421b97119778804b8de92bccaf90409414ec40";
  };
}
