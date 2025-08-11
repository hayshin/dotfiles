{
  programs.nushell = {
    enable = true;
    # shellAliases = import ./shell_aliases.nix {};
    shellAliases = import ../aliases.nix { nix_dir = "$env.NIX"; };
    configFile.source = ./config.nu;
  };
}
