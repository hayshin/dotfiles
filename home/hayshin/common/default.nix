{ pkgs, rootPath, ... }:
{
  imports = [
    ./stylix.nix
    # ./caelestia.nix
    ./shell
    ./yazi
    ./helix
    ./zellij
  ];

  home = {
    username = "hayshin";
    homeDirectory = "/home/hayshin";
    stateVersion = "24.05";
    preferXdgDirectories = true;
    sessionVariables = import (rootPath + /shared/variables.nix);
    # shellAliases = import ./shell/shell_aliases.nix { nix_dir = "$NIX"; };
    packages = with pkgs; [
      btop
    ];
  };
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}
