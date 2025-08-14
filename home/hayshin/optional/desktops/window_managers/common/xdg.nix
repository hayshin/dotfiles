{ pkgs, config, ... }:
let
  home = config.home.homeDirectory;
in
{
  xdg = {
    enable = true;
    desktopEntries = {
      browser = {
        name = "browser";
        genericName = "Browser selector";
        exec = "vivaldi";
        type = "Application";
        terminal = false;
        categories = [
          "Application"
          "Network"
          "WebBrowser"
        ];
        mimeType = [
          "text/html"
          "text/xml"
          "application/pdf"
        ];
      };
      # Telegram Desktop not opens helix editor because it terminal
      editor = {
        name = "editor";
        genericName = "Editor selector";
        exec = "zeditor";
        type = "Application";
        terminal = false;
      };
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
        "text/plain" = "editor.desktop";
        "text/markdown" = "editor.desktop";

        "text/html" = "browser.desktop";
        "x-scheme-handler/http" = "browser.desktop";
        "x-scheme-handler/https" = "browser.desktop";
        "x-scheme-handler/about" = "browser.desktop";
        "x-scheme-handler/unknown" = "browser.desktop";

        "x-scheme-handler/tg" = [ "org.telegram.desktop.desktop " ];

        "application/pdf" = "browser.desktop";
        "application/octet-stream" = "browser.desktop";

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
