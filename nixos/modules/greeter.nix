{ pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      terminal = {
        vt = 1;
      };
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --remember-session";
        user = "greeter";
      };
      # initial_session = {
      #   command = "Hyprland";
      #   user = "hayshin";
      # };
    };
  };
}
