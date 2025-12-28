{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # anydesk
    # anytype
    gparted
    libreoffice
    pandoc
    speedtest-cli
    openfortivpn
    # ayugram-desktop
    # openfortivpn-webview
    # openfortivpn-webview-qt
    # qbittorrent
    # zathura
    # open-webui
  ];
}
