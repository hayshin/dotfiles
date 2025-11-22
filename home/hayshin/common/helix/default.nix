{ pkgs, inputs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = false; # Handled by modules.programs.editors
    package = inputs.helix.packages.${pkgs.system}.default;
    extraPackages = import ./packages.nix { pkgs = pkgs; };
    languages = import ./languages.nix;

    settings = {
      theme = "gruvbox-material";
      editor = import ./editor.nix;
      keys = import ./keys;
    };
  };
  stylix.targets.helix.enable = false;
}
