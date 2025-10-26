{ pkgs, ... }:
{
  home.file.".dprint.jsonc".text = builtins.toJSON (import ./config.nix { inherit pkgs; });

  home.packages = with pkgs; [
    dprint
  ];
}
