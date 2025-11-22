{ config, lib, pkgs, ... }:
let
  cfg = config.modules.programs.steam;
in
{
  options.modules.programs.steam = {
    enable = lib.mkEnableOption "Steam and Wine";
  };

  config = lib.mkIf cfg.enable {
    programs.steam = {
      enable = true;
    };
    environment.systemPackages = with pkgs; [
      wineWowPackages.full
      steam-run
      winetricks
    ];
  };
}
