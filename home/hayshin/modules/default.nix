{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    swaylock-effects
    (import ./swaylock.nix { inherit pkgs config; })
    (import ./fortivpn.nix { inherit pkgs; })
  ];
}
