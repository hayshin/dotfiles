{ config, pkgs, ... }:
{
  imports = [
    ../common
    ../wayland
    ../optional
    ./idle.nix
    ./paper.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = import ./settings { inherit config; };
  };
  stylix.targets.hyprland.enable = false;
  home.packages = [
    pkgs.hyprshot # screenshot
    pkgs.hyprpicker # color picker
  ];
}
