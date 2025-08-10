{ pkgs, ... }:
{
  home.packages = with pkgs; [
    anydesk
    anytype
    gparted
    libreoffice
    pandoc
    qbittorrent
    zathura
    zoom-us
    open-webui
  ];
}
