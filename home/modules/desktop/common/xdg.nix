{ pkgs, config, ... }:
let
  home = config.home.homeDirectory;
in
{
  xdg = {
    enable = true;
    configFile."mimeapps.list".force = true;
    desktopEntries = {
      # Telegram Desktop not opens helix editor because it terminal
      image = {
        name = "image";
        genericName = "Image selector";
        exec = "imv";
        type = "Application";
        terminal = false;
      };
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "x-scheme-handler/tg" = "org.telegram.desktop.desktop";

        "image/jpeg" = "image.desktop";
        "image/jpg" = "image.desktop";
        "image/svg" = "image.desktop";
        "image/png" = "image.desktop";
      };
    };
    userDirs = {
      enable = true;
      desktop = "${home}/desktop";
      documents = "${home}/documents";
      download = "${home}/downloads";
      music = "${home}/music";
      pictures = "${home}/images";
      videos = "${home}/videos";
      templates = "${home}/templates";
      publicShare = "${home}/public";
    };
    portal = {
      extraPortals = with pkgs; [
        xdg-desktop-portal-termfilechooser
        xdg-desktop-portal-hyprland
        xdg-desktop-portal
        xdg-desktop-portal-wlr
      ];
      config = {
        common."org.freedesktop.impl.portal.FileChooser" = [ "termfilechooser" ];
      };
    };
  };

}
