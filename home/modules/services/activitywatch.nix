{ pkgs, ... }:
{
  services.activitywatch = {
    enable = true;
    package = pkgs.aw-server-rust;
    watchers = {
      # aw-watcher-afk = {
      #   package = pkgs.aw-watcher-window-wayland;
      #   settings = {
      #     timeout = 300;
      #     poll_time = 60;
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
