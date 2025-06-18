# direnv and devenv
{ pkgs, ... }:
{
  programs.direnv = {
    enable = true;
    # enableNushellIntegration = true;
    # enableZshIntegration = true;
    # silent = true;

    config = {
      global = {
        warn_timeout = "1m";
        hide_env_diff = true;
      };
      whitelist = {
        prefix = [ "/home/hayshin/dev" ];
      };
    };
    nix-direnv.enable = true;
  };
  home.packages = [ pkgs.devenv ];
}
