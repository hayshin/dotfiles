# touchpad gestures, works on hyprland 2025.03
{ pkgs, config, ... }:
{
  home = {
    packages = with pkgs; [
      libinput-gestures
      wmctrl
      ydotool
    ];

    file = {
      "${config.xdg.configHome}/libinput-gestures.conf" = {
        text = ''
          gesture swipe down 3 ydotool key 29:1 17:1 17:0 29:0
          gesture swipe left 3 ydotool key 29:1 15:1 15:0 29:0
          gesture swipe right 3 ydotool key 29:1 42:1 15:1 15:0 42:0 29:0
          gesture swipe up 3 ydotool key 29:1 42:1 20:1 20:0 42:0 29:0


          gesture swipe left 4 hyprctl dispatch workspace +1
          gesture swipe right 4 hyprctl dispatch workspace -1

          gesture hold on 4 hyprctl dispatch togglespecialworkspace magic
        '';
      };
    };
  };
}
