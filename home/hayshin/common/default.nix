{ pkgs, inputs, ... }:
let
  system = "x86_64-linux";
in
{
  imports = [
    ./stylix.nix
    ./shell
    ./yazi
    ./helix
    ./fastfetch.nix
    ./btop.nix
    ./fzf.nix
    ./helix
  ];

  home = {
    username = "hayshin";
    homeDirectory = "/home/hayshin";
    stateVersion = "24.05";
    preferXdgDirectories = true;
    sessionVariables = import ./variables.nix;
    shellAliases = import ./shell/shell_aliases.nix { nix_dir = "$NIX"; };
    # activation.restartHyprpaper = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    #   if systemctl --user is-active --quiet hyprpaper.service; then
    #     systemctl --user restart hyprpaper.service
    #   else
    #     systemctl --user start hyprpaper.service
    #   fi
    # '';
    packages = [
      pkgs.siyuan
    ];
  };
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}
