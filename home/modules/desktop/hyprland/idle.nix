{ config, lib, ... }:
{
  config = lib.mkIf config.modules.desktop.hyprland.enable {
    services.hypridle = {
      enable = false;
      settings = {
        general = {
          lock_cmd = "lock";
        };
        listener = [
          {
            timeout = 300;
            on-timeout = "lock";
          }
          {
            timeout = 600;
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };
  };
}
