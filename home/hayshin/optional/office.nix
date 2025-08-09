{ pkgs, ... }:
{
  imports = [
    ./anydesk.nix
    ./gparted.nix
    ./zoom.nix
    ./torrent.nix
    ./libreoffice.nix
    ./zathura.nix
    ./pandoc.nix
    ./anytype.nix
  ];
  home.packages = with pkgs; [
    anydesk
    anytype
    gparted
    libreoffice
    pandoc
    qbittorrent
    zathura
    zoom-us
  ];
}
