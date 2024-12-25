{ pkgs, ... }:
{
  services.fusuma = {
    enable = true;
    extraPackages = with pkgs; [
      hyprland
      coreutils
      playerctl
    ];
    settings = {
      swipe = {
        "3" = {
          left = {
            sendkey = "LEFTCTRL+TAB"; # next tab
          };
          right = {
            sendkey = "LEFTCTRL+LEFTSHIFT+TAB"; # prev tab
          };
          up = {
            sendkey = "LEFTCTRL+LEFTSHIFT+T"; # restore tab
          };
          down = {
            sendkey = "LEFTCTRL+W"; # close tab
          };
        };
        "4" = {
          up = {
            command = "hyprctl dispatch fullscreen 1";
          };
          down = {
            command = "hyprctl dispatch fullscreen 0";
          };
          left = {
            keypress = {
              "LEFTMETA" = {
                command = "playerctl next";
              };
            };
          };
          right = {
            keypress = {
              "LEFTMETA" = {
                command = "playerctl previous";
              };
            };
          };
        };
      };
      hold = {
        "4" = {
          command = "hyprctl dispatch togglespecialworkspace magic";
          keypress = {
            "LEFTMETA" = {
              command = "playerctl play-pause";
            };
          };
        };
      };
      threshold = {
        swipe = 0.25;
        pinch = 0.4;
        hold = 0.1;
      };
      interval = {
        swipe = 0.6;
        pinch = 0.1;
      };
    };
  };
}
