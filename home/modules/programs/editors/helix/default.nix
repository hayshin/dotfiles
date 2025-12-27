{ pkgs, lib, config, inputs, ... }:
let
  cfg = config.modules.programs.editors.helix;
  helix = inputs.helix;
in
{
  options.modules.programs.editors.helix = {
    enable = lib.mkEnableOption "Helix";
  };

  config = lib.mkIf cfg.enable {
    programs.helix = {
      enable = true;
      defaultEditor = false; # Handled by modules.programs.editors
      package = helix.packages.${pkgs.system}.default;
      extraPackages = import ./packages.nix { pkgs = pkgs; };
      languages = import ./languages.nix;

      settings = {
        theme = "gruvbox-material";
        editor = import ./editor.nix;
        keys = import ./keys;
      };
    };
    stylix.targets.helix.enable = false;
  };
}
