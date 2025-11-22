# touchpad gestures, doesn't works currently on hyprland 2025.03
{ pkgs, lib, ... }:
{
  services.fusuma = {
    enable = true;
    extraPackages = with pkgs; [
      hyprland
      coreutils
      playerctl
      ydotool
    ];

    # settings = {
    #   swipe = {
    #     "3" = {
    #       left = {
    #         # sendkey = "LEFTCTRL+TAB"; # next tab
    #         command = "hyprctl dispatch fullscreen 1";
    #       };
    #       right = {
    #         # sendkey = "LEFTCTRL+LEFTSHIFT+TAB"; # prev tab
    #         command = "hyprctl dispatch fullscreen 1";
    #       };
    #       up = {
    #         # sendkey = "LEFTCTRL+LEFTSHIFT+T"; # restore tab
    #         command = "hyprctl dispatch fullscreen 1";
    #       };
    #       down = {
    #         # sendkey = "LEFTCTRL+W"; # close tab
    #         command = "ydotool key 29:1 17:1 17:0 29:0";
    #       };
    #     };
    #     "4" = {
    #       up = {
    #         command = "hyprctl dispatch fullscreen 1";
    #       };
    #       down = {
    #         command = "hyprctl dispatch fullscreen 0";
    #       };
    #       left = {
    #         keypress = {
    #           "LEFTMETA" = {
    #             command = "playerctl next";
    #           };
    #         };
    #       };
    #       right = {
    #         keypress = {
    #           "LEFTMETA" = {
    #             command = "playerctl previous";
    #           };
    #         };
    #       };
    #     };
    #   };
    #   hold = {
    #     "4" = {
    #       command = "hyprctl dispatch togglespecialworkspace magic";
    #       keypress = {
    #         "LEFTMETA" = {
    #           command = "playerctl play-pause";
    #         };
    #       };
    #     };
    #   };
    #   threshold = {
    #     swipe = 0.25;
    #     pinch = 0.4;
    #     hold = 0.1;
    #   };
    #   interval = {
    #     swipe = 0.6;
    #     pinch = 0.1;
    #   };
    # };
  };
  home.file = {
    "/home/hayshin/.config/fusuma/config.yml" = lib.mkForce {
      text = ''
        swipe:
          3:
            down:
              command: 'ydotool key 29:1 17:1 17:0 29:0'
            left:
              command: 'hyprctl dispatch fullscreen 1'
            right:
              command: 'hyprctl dispatch fullscreen 1'
            up:
              command: 'hyprctl dispatch fullscreen 1'
          4:
            down:
              command: 'hyprctl dispatch fullscreen 0'
            left:
              keypress:
                LEFTMETA:
                  command: 'playerctl next'
            right:
              keypress:
                LEFTMETA:
                  command: 'playerctl previous'
            up:
              command: 'hyprctl dispatch fullscreen 1'

        hold:
          4:
            command: 'hyprctl dispatch togglespecialworkspace magic'
            keypress:
              LEFTMETA:
                command: 'playerctl play-pause'

        interval:
          pinch: 0.1
          swipe: 0.6
        threshold:
          hold: 0.1
          pinch: 0.4
          swipe: 0.25

      '';
    };
  };
}
