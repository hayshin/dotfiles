{ pkgs, lib, config, ... }:
let
  cfg = config.modules.programs.shell.direnv;
in
{
  options.modules.programs.shell.direnv = {
    enable = lib.mkEnableOption "direnv and devenv";
    whitelistPrefixes = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ "${config.home.homeDirectory}/dev" ];
      description = "List of directories to whitelist for direnv";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      # silent = true;

      config = {
        global = {
          warn_timeout = "1m";
          hide_env_diff = true;
        };
        whitelist = {
          prefix = cfg.whitelistPrefixes;
        };
      };
      nix-direnv.enable = true;
    };
    home.packages = [ pkgs.devenv ];
  };
}
