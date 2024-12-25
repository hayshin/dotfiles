{
  imports = [
    ../stylix.nix
    ./modules
  ];

  home = {
    username = "hayshin";
    homeDirectory = "/home/hayshin";
    stateVersion = "24.05";
    preferXdgDirectories = true;
    sessionVariables = import ../variables.nix;
    shellAliases = import ./modules/shell/shell_aliases.nix{nix_dir = "$NIX";};
    # activation.restartHyprpaper = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    #   if systemctl --user is-active --quiet hyprpaper.service; then
    #     systemctl --user restart hyprpaper.service
    #   else
    #     systemctl --user start hyprpaper.service
    #   fi
    # '';
  };
    nixpkgs.config.allowUnfree = true;
}
