{ pkgs, rootPath, ... }:
{
  imports = [
    ./stylix.nix
    ./shell
    ./zellij
  ];

  home = {
    username = "hayshin";
    homeDirectory = "/home/hayshin";
    stateVersion = "24.05";
    enableNixpkgsReleaseCheck = false;
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
