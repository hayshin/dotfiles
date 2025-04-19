# direnv and devenv
{ pkgs, ... }:
{
  programs.direnv = {
    enable = true;
    enableNushellIntegration = true;
    # silent = true;

    # nix-direnv.enable = true;
    config = {
      global = {
        warn_timeout = "1m";
        hide_env_diff = true;
      };
      whitelist = {
        prefix = [ "/home/hayshin/dev" ];
      };
    };
  };
  home.packages = [ pkgs.devenv ];
}
