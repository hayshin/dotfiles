{
  imports = [ ./binds ];

  general = import ./general.nix;
  decoration = import ./decoration.nix;
  animations = import ./animations.nix;
  input = import ./input.nix;
  device = import ./device.nix;

  exec-once = [
    "waybar"
    "wl-paste --type text --watch cliphist store" # Stores only text data
    "wl-paste --type image --watch cliphist store" # Stores only image data
  ];

  monitor = "eDP-1,1920x1080@60,0x0,1";

  dwindle = {
    pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the key"ection below"
    preserve_split = true; # You probably want this
  };

  misc = {
    force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
  };

  gestures = {
    workspace_swipe = true;
    workspace_swipe_fingers = 4;
  };
}
