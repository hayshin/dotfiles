# activity watcher aka digital wellbeing, doesn't works correctly on wayland/hyprland 2025.03
{ pkgs, ... }:
{
  services.activitywatch = {
    enable = true;
    # package = pkgs.aw-server-rust;
    watchers = {
      # aw-watcher-windows = {
      #   package = pkgs.awatcher;
      #   settings = {
      #     poll_time = 1;
      #   };
      # };
      # aw-watcher-afk = {
      #   package = pkgs.awatcher;
      #   settings = {
      #     timeout = 180;
      #     poll_time = 10;
      #   };
      # };
      awatcher = {
        package = pkgs.awatcher;
        settings = {
          idle-timeout-seconds = 180;
          poll-time-idle-seconds = 5;
          poll-time-window-seconds = 1;
        };
      };
    };
  };
}
