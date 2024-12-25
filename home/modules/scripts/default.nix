{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    swaylock-effects
    (import ./lock.nix { inherit pkgs config; })
    (import ./suspend.nix { inherit pkgs; })
  ];
}
