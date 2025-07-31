{ config, ... }:
let
  binds = import ./binds.nix { inherit config; };
in
{

  "$mod" = "SUPER";
  "$float_terminal" =
    "[float;pin;move onscreen cursor 50% 60%;opacity 0.8 override 0.5 override;rounding 0] $TERMINAL";

  general = import ./general.nix { inherit config; };
  decoration = import ./decoration.nix;
  animations = import ./animations.nix;
  input = import ./input.nix;
  device = import ./device.nix;
  inherit binds;
  windowrule = [
    "float, title:^(Picture in picture)$"
    "pin, title:^(Picture in picture)$"
    "float, title:^(Picture-in-Picture)$"
    "pin, title:^(Picture-in-Picture)$"
  ];

  exec-once = [
    "libinput-gestures"
    "wl-paste --type text --watch cliphist store" # Stores only text data
    "wl-paste --type image --watch cliphist store" # Stores only image data
  ];

  monitor = [
    "eDP-1,preferred,0x0,1"
    ",preferred,auto,1,mirror,eDP-1"
  ];

  dwindle = {
    pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the key"ection below"
    preserve_split = true; # You probably want this
  };

  misc = {
    force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
  };

  # gestures = {
  #   workspace_swipe = true;
  #   workspace_swipe_fingers = 4;
  # };
}
