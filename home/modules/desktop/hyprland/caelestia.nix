{ inputs, caelestia-shell, ... }:
{

  imports = [
    caelestia-shell.homeManagerModules.default
  ];
  programs.caelestia = {
    enable = true;
    systemd = {
      enable = true; # if you prefer starting from your compositor
      target = "graphical-session.target";
      environment = [ ];
    };
    settings = {
      appearance = {
        font.size.scale = 1;
        padding.scale = 1;
        rounding.scale = 1;
        scaling.scale = 1;
      };
      general = {
        idle = {
          timeouts = [
            {
              timeout = 300;
              idleAction = "lock";
            }
            {
              timeout = 600;
              idleAction = "systemctl suspend";
            }
          ];
        };
      };
      bar.status = {
        showBattery = true;
      };
      notifs = {
        defaultExpireTimeout = 2000;
      };
      border = {
        rounding = 25;
        thickness = 10;
      };
      paths.wallpaperDir = "~/images/wallpapers";
      utilities = {
        toasts = {
          kbLayoutChanged = false;
        };
      };
    };
    cli = {
      enable = true; # Also add caelestia-cli to path
      settings = {
        theme.enableGtk = false;
      };
    };
  };
}
