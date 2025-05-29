{ config, ... }:
let
  home = config.home.homeDirectory;
in
{
  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      # associations.added = {
      #   "application/pdf" = "zen-browser.desktop";
      # };
      defaultApplications = {
        "application/pdf" = "zen.desktop";
        "x-scheme-handler/http" = "zen.desktop";
        "x-scheme-handler/https" = "zen.desktop";
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
    desktopEntries = {
      zen = {
        name = "Zen Browser";
        genericName = "Web Browser";
        exec = "zen";
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
    };
  };

}
