{ pkgs, inputs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
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
