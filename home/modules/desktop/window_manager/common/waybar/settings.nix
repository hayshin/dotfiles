{
  mainBar = {
    layer = "top";
    position = "bottom";
    start_hidden = true;
    exclusive = false;
    spacing = 0;
    reload_style_on_change = false;

    modules-left = [
      "custom/power"
      "hyprland/workspaces"
      "tray"
    ];
    modules-right = [
      # "mpris"
      "network"
      "pulseaudio"
      # "bluetooth"
      # "backlight"
      "battery"
      "clock"
    ];

    "custom/power" = import ./modules/power.nix;
    tray = import ./modules/tray.nix;

    # mpris = import ./modules/mpris.nix;
    network = import ./modules/network.nix;
    pulseaudio = import ./modules/audio.nix;
    # bluetooth = import ./modules/bluetooth.nix;
    # backlight = import ./modules/backlight.nix;
    battery = import ./modules/battery.nix;
    clock = import ./modules/clock.nix;
  };
}
