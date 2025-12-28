{ pkgs, lib, config, ... }:
let
  cfg = config.modules.programs.development.dprint;
in
{
  options.modules.programs.development.dprint = {
    enable = lib.mkEnableOption "dprint";
  };

  config = lib.mkIf cfg.enable {
    home.file.".dprint.jsonc".text = builtins.toJSON (import ./config.nix { inherit pkgs; });

    home.packages = with pkgs; [
      dprint
    ];
  };
}
