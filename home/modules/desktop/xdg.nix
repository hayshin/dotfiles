{ config, ... }:
{
  options.xdg = {
    enable = true;
    userDirs =
      let
        home = config.home.homeDirectory;
      in
      {
        enable = true;
        desktop = "${home}/desktop";
        documents = "${home}/documents";
        download = "${home}/download";
        music = "${home}/music";
        pictures = "${home}/pictures";
        videos = "${home}/videos";
        templates = "${home}/templates";
        publicShare = "${home}/public";
      };
  };
}
