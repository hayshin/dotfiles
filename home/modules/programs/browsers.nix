{ pkgs, lib, config, ... }:
let
  cfg = config.modules.programs.browsers;
in
{
  options.modules.programs.browsers = {
    enable = lib.mkEnableOption "browsers";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      google-chrome
      firefox-devedition
      vivaldi
    ];

    programs.firefox = {
      enable = true;
    };
  };
}

