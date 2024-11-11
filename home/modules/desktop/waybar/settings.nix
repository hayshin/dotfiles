{
  mainBar = {
    layer = "top";
    position = "top";
    start_hidden = true;
    exclusive = true;
    spacing = 0;
    reload_style_on_change = false;

    modules-left = [
      "custom/power"
      "hyprland/workspaces"
      "tray"
    ];
    modules-right = [
      # "mpris"
      "pulseaudio"
      "bluetooth"
      "network"
      "backlight"
      "battery"
      "clock"
    ];

    "custom/power" = import ./modules/power.nix;
    tray = import ./modules/tray.nix;

    mpris = import ./modules/mpris.nix;
    pulseaudio = import ./modules/audio.nix;
    bluetooth = import ./modules/bluetooth.nix;
    network = import ./modules/network.nix;
    backlight = import ./modules/backlight.nix;
    battery = import ./modules/battery.nix;
    clock = import ./modules/clock.nix;
  };
}
