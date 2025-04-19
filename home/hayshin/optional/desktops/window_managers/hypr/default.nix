{ config, pkgs, ... }:
{
  imports = [
    ../common
    ../wayland
    ./idle.nix
    ./paper.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = import ./settings { inherit config; };
  };
  home.packages = [
    pkgs.hyprshot # screenshot
    pkgs.hyprpicker # color picker
  ];
}
