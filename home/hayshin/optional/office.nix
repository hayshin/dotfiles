{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # anydesk
    anytype
    gparted
    libreoffice
    pandoc
    speedtest-cli
    openfortivpn
    # openfortivpn-webview
    openfortivpn-webview-qt
    # qbittorrent
    # zathura
    zoom-us
    # open-webui
  ];
}
