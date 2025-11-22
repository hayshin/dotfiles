{ config, lib, ... }:
{
  config = lib.mkIf config.modules.desktop.hyprland.enable {
    programs.hyprlock = {
      enable = true;
    };
  };
}
