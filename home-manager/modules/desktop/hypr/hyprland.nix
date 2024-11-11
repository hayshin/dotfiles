{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      exec-once = [
        "waybar"
        "wl-paste --type text --watch cliphist store" # Stores only text data
        "wl-paste --type image --watch cliphist store" # Stores only image data
      ];
      monitor = "eDP-1,1920x1080@144,0x0,1";
      general = import ./general.nix;
      decoration = import ./decoration.nix;
      animations = import ./animations.nix;
      input = import ./input.nix;

      dwindle = {
        pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the key"ection below"
        preserve_split = true; # You probably want this
      };

      misc = {
        force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
      };

      device = [
        {
          name = "elan1203:00-04f3:307a-touchpad";
          sensitivity = 0.1;
        }
        {
          name = "elan1203:00-04f3:307a-mouse";
          sensitivity = 0.25;
        }
      ];

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 4;
      };

      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$file_manager" = "yazi";
      "$menu" = "fuzzel";
      "$editor" = "hx";
      "$notes" = "hx";
      "$music" = "";
      "$float_terminal" = "[float;pin;move onscreen cursor 50% 60%;opacity 0.8 override 0.5 override;rounding 0] $terminal";
      "$lock" = "wlogout -b 4 -T 300 -B 300 -p layer-shell";
      "$browser" = "firefox";

      bindr = "SUPER,Super_L, exec, pkill -SIGUSR1 waybar";
      # bindrt = "$mod,Super_L, exec, pkill -SIGUSR1 waybar";

      bind = import ./binds.nix;
    };
  };
}
