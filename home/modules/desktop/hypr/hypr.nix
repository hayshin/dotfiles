{ config, ... }:
{
  imports = [
    ./paper.nix
    ./idle.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = import ./settings/settings.nix { inherit config; };
  };
}
