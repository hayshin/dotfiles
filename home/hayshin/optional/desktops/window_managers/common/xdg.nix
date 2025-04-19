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
  };

}
