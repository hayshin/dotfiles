# works through stylix
{ config, lib, ... }:
{
  config = lib.mkIf config.modules.desktop.hyprland.enable {
    services.hyprpaper = {
      enable = true;
    };
  };
}
