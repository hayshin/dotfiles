{
  home = {
    username = "server";
    homeDirectory = "/home/server";
    stateVersion = "24.11";
    preferXdgDirectories = true;
    # sessionVariables = import .../variables.nix;
    # shellAliases = import ./modules/shell/shell_aliases.nix { nix_dir = "$NIX"; };
  };
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;
}
