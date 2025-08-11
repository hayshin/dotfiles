{ pkgs, ... }:
{
  services.greetd = {
    enable = true;
    vt = 1;
    settings = {
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
  environment.systemPackages = [ pkgs.greetd.tuigreet ];
}
