{ pkgs, lib, config, rootPath, ... }:
let
  cfg = config.modules.programs.shell.nushell;
in
{
  options.modules.programs.shell.nushell = {
    enable = lib.mkEnableOption "Nushell";
  };

  config = lib.mkIf cfg.enable {
    programs.nushell = {
      enable = true;
      shellAliases = import (rootPath + /shared/aliases.nix) { nix_dir = "$env.NIX"; };
      configFile.source = ./config.nu;
    };
    home.shell.enableNushellIntegration = true;
  };
}
