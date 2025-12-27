{
  imports = [
    ./common
    ../modules
    ./optional/development/frontend.nix
  ];

  modules.programs.editors.helix.enable = true;
}
