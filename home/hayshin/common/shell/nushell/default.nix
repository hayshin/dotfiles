{ rootPath, ... }:
{
  programs.nushell = {
    enable = true;
    shellAliases = import (rootPath + /shared/aliases.nix) { nix_dir = "$env.NIX"; };
    configFile.source = ./config.nu;
  };
  home.shell.enableNushellIntegration = true;
}
