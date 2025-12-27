{
  imports = [
    ./common
    ../modules
    ./optional/development/frontend.nix
  ];

  modules.programs.editors.helix.enable = true;
  modules.programs.yazi.enable = true;
  modules.programs.zellij.enable = true;
}
